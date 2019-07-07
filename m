Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9D0617A1
	for <lists+linux-media@lfdr.de>; Sun,  7 Jul 2019 23:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfGGVQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jul 2019 17:16:06 -0400
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.230]:17327 "EHLO
        cdptpa-cmomta02.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727636AbfGGVQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Jul 2019 17:16:06 -0400
Received: from [192.168.2.97] ([72.182.16.184])
        by cmsmtp with ESMTP
        id kEVshGg0P3JQGkEVvh6H5s; Sun, 07 Jul 2019 21:16:03 +0000
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Keith Pyle <kpyle@austin.rr.com>
Subject: [PATCH 2/2]: media: hdpvr: Add optional restart, with optional delay,
 after restarting streaming
Message-ID: <cdb26c96-39b6-47fc-5eca-0dc4dea4ead2@austin.rr.com>
Date:   Sun, 7 Jul 2019 16:16:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfCxkdka6JNkU3XGXbBZmmszJuiYH+IHvRJiajkIl7kWkmO0ihi6FY9/vq8F5zLuiGsNw4wl0tNNGFXWQIxMWa0HYTvNkYVdRHxx7SCyD7dGeojmTfxp/
 HQ0piK+25WLM6Ikf8HTJe/VR3QegIagS9+xwCJtj/PRXWdwOFSLM4dQ3iBqetU2lPgzOA5RQOiBSzfrYfDpTGTMFHckrAg/AyNo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

`hdpvr_read` attempts to restart streaming if the device is read while
it is both not ready and not disconnected.  However, the device is often
still not ready immediately after the call to `hdpvr_start_streaming`
returns, causing the condition `if (buf->status != BUFSTAT_READY)` to
exit the loop without reading any further data.  By itself, this would
merely cause a short read, which should be easily recoverable.  However,
if no data has been read so far, this causes `hdpvr_read` to return 0,
which results in an end-of-file for the user application.

Compensate for this by adding the ability to delay after the call to
`hdpvr_start_streaming`, then `continue;` back to the top, so that
`hdpvr_read` can call `wait_event_interruptible_timeout` again to wait
for the device to become ready.  This delay complements the prior patch.
The prior patch delays before issuing the start-streaming command, to
give the firmware time to stabilize before receiving the command.  This
delay is after the start-streaming command, to give the firmware time to
bring the device to a ready state.  This delay is configurable through a
new module parameter, `hdpvr_restart_streaming_ms_delay`, which defaults
to a 100 millisecond delay.

To avoid an infinite loop in `hdpvr_read`, add a limit to how many times
`hdpvr_read` can restart the device before returning.  This limit is
configurable through a new module parameter,
`hdpvr_restart_streaming_max_tries`, and defaults to one restart.
Administrators may set the limit to 0 to request that `hdpvr_read` never
attempt to restart streaming.  Previously, there was no way for
administrators to opt out of an attempted restart.

Signed-off-by: Keith Pyle <kpyle@austin.rr.com>
Tested-by: Keith Pyle <kpyle@austin.rr.com>
---
Changes since v1:
- Rewrapped output at 80 columns, per request from Hans.  Literal strings
still exceed 80 columns where necessary to keep an entire string together,
since this makes it easier for grep to find the file and line that
generates a given message.
---
 drivers/media/usb/hdpvr/hdpvr-core.c  |  8 ++++++
 drivers/media/usb/hdpvr/hdpvr-video.c | 40 +++++++++++++++++++++++++++
 drivers/media/usb/hdpvr/hdpvr.h       |  2 ++
 3 files changed, 50 insertions(+)

diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c b/drivers/media/usb/hdpvr/hdpvr-core.c
index fd7608e7e94c..b7ac63113ac0 100644
--- a/drivers/media/usb/hdpvr/hdpvr-core.c
+++ b/drivers/media/usb/hdpvr/hdpvr-core.c
@@ -43,6 +43,14 @@ uint hdpvr_close_to_open_ms_delay = 4000;
 module_param(hdpvr_close_to_open_ms_delay, uint, S_IRUGO|S_IWUSR);
 MODULE_PARM_DESC(hdpvr_close_to_open_ms_delay, "delay restarting streaming by the specified number of milliseconds");
 
+uint hdpvr_restart_streaming_max_tries = 1;
+module_param(hdpvr_restart_streaming_max_tries, uint, S_IRUGO|S_IWUSR);
+MODULE_PARM_DESC(hdpvr_restart_streaming_max_tries, "restart streaming at most this many times within one read");
+
+uint hdpvr_restart_streaming_ms_delay = 100;
+module_param(hdpvr_restart_streaming_ms_delay, uint, S_IRUGO|S_IWUSR);
+MODULE_PARM_DESC(hdpvr_restart_streaming_ms_delay, "delay continue by the specified number of milliseconds after restarting streaming");
+
 static uint default_video_input = HDPVR_VIDEO_INPUTS;
 module_param(default_video_input, uint, S_IRUGO|S_IWUSR);
 MODULE_PARM_DESC(default_video_input, "default video input: 0=Component / 1=S-Video / 2=Composite");
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 8a2b883d372e..e2ca5d955f4a 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -441,6 +441,8 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 	struct hdpvr_buffer *buf = NULL;
 	struct urb *urb;
 	unsigned int ret = 0;
+	unsigned int restarts_remaining = hdpvr_restart_streaming_max_tries;
+	unsigned int delay;
 	int rem, cnt;
 
 	if (*pos)
@@ -491,6 +493,20 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 				goto err;
 			}
 			if (!err) {
+				if (restarts_remaining == 0) {
+					v4l2_dbg(MSG_BUFFER, hdpvr_debug,
+						 &dev->v4l2_dev,
+						 "timeout: no further restarts allowed by hdpvr_restart_streaming_max_tries; returning to caller with ret=%u",
+						 ret);
+					/* This break will return the
+					 * count of bytes copied so far,
+					 * which may be 0.  In that
+					 * situation, the user
+					 * application will get an EOF.
+					 */
+					break;
+				}
+				--restarts_remaining;
 				v4l2_info(&dev->v4l2_dev,
 					  "timeout: restart streaming\n");
 				mutex_lock(&dev->io_mutex);
@@ -501,6 +517,30 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 					ret = err;
 					goto err;
 				}
+				/* hdpvr_start_streaming instructs the
+				 * device to stream, but the device is
+				 * usually not ready by the time
+				 * hdpvr_start_streaming returns.
+				 *
+				 * Without this continue, the loop would
+				 * terminate.  If no data had been
+				 * copied by a prior iteration of the
+				 * loop, then hdpvr_read would return 0,
+				 * closing the file descriptor
+				 * prematurely.  Continue back to the
+				 * top of the loop to avoid that.
+				 *
+				 * The device may not be ready within 1
+				 * second, so the
+				 * wait_event_interruptible_timeout
+				 * would then restart streaming a second
+				 * time.  Delay here to give the device
+				 * time to stabilize first.
+				 */
+				delay = hdpvr_restart_streaming_ms_delay;
+				if (delay)
+					msleep(delay);
+				continue;
 			}
 		}
 
diff --git a/drivers/media/usb/hdpvr/hdpvr.h b/drivers/media/usb/hdpvr/hdpvr.h
index 9e5f88146827..b1568adca7f0 100644
--- a/drivers/media/usb/hdpvr/hdpvr.h
+++ b/drivers/media/usb/hdpvr/hdpvr.h
@@ -44,6 +44,8 @@
 
 extern int hdpvr_debug;
 extern uint hdpvr_close_to_open_ms_delay;
+extern uint hdpvr_restart_streaming_max_tries;
+extern uint hdpvr_restart_streaming_ms_delay;
 
 #define MSG_INFO	1
 #define MSG_BUFFER	2
-- 
2.22.0



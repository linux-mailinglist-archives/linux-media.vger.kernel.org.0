Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1847958FF3
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 03:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbfF1BwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 21:52:10 -0400
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.226]:53208 "EHLO
        cdptpa-cmomta02.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725770AbfF1BwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 21:52:10 -0400
Received: from [192.168.2.97] ([72.182.16.184])
        by cmsmtp with ESMTP
        id gg3ZhhLfYPyVHgg3chsScX; Fri, 28 Jun 2019 01:52:08 +0000
Subject: Re: hdpvr mutex deadlock on kernel 5.1.x
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <14d31c83-f48f-319d-6b3a-0753ea9d2c02@austin.rr.com>
 <8e18508d-7c36-ead7-4c92-7335813895d0@xs4all.nl>
 <1aa17133-342a-45e3-453d-896a1062ea21@austin.rr.com>
 <857b40ad-d474-5a4c-e65b-99035fa1a50b@xs4all.nl>
 <15f3c149-4597-2f45-06af-a668db4c694b@austin.rr.com>
 <1c20ac29-d1d7-42b5-ad44-ae505be3ea3b@xs4all.nl>
From:   Keith Pyle <kpyle@austin.rr.com>
Message-ID: <7f83b4c9-ea22-8034-ff46-8647be09ad3a@austin.rr.com>
Date:   Thu, 27 Jun 2019 20:52:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <1c20ac29-d1d7-42b5-ad44-ae505be3ea3b@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfH7JejTNU/fgSBwifBl/f/67EJO6GedFKMnho4mkO/mdZEWc91hkD/vO2ntj3fE+gNC8EAJxxKJK4+HSicc8jTgTsSYD4LK1OWzVn887V7TS4QRwxSzP
 L1fa9h4EEB0kycQ7wpE1VnbzXyJKQUDP2sbMq0YHPIL7cTtBPzGJaCltBYPeMklivqQWLJC/+qIcr0S3rVgwgz9JsAZdDKVh5xY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/20/19 06:33, Hans Verkuil wrote:
> On 6/19/19 4:29 AM, Keith Pyle wrote:
>> On 06/18/19 02:16, Hans Verkuil wrote:
>>> Hi Keith,
>>>
>>> On 6/18/19 6:17 AM, Keith Pyle wrote:
>>>> We made the suggested change, compiled, installed, and rebooted. There was some progress - test 2 (turning the HD-PVR off) no longer produces a splat.  Test 1 (start capture) and test 3 (run capture
>>>> and trigger HD-PVR to stop streaming) both still produce a traceback (see below).  Test 3 also still results in the unkillable process.
>>> Try the following patch. Test 2 was caused by locking when it shouldn't, test 3 was caused by not
>>> locking when it should :-) and I think test 1 was caused by locking when it is not allowed.
>>>
>>> Let me know if this works!
>>>
>>> Regards,
>>>
>>>      Hans
>> Good news!  With these patches, lockdep does not report any of the prior problems and the capture process does not deadlock for my test3.
>>
>> There is one item I noted: hdpvr_read has the line
>>
>> msec_to_jiffies(4000);
> Oops!
>
>> that doesn't really do anything.  This should be a 4 second sleep, based on our discussion back in 2014 (https://www.mail-archive.com/linux-media@vger.kernel.org/msg75163.html), since the restart will
>> certainly fail unless the HD-PVR is given at least 3 seconds to reset after the stop.
> I think a msleep(4000) at that point is solving only one use-case. I assume
> the same problem will occur if you read() from the video device, then close()
> it, re-open it and read() again, all within 4 seconds.
>
> The real fix would be to store a timestamp (jiffies) when you stop streaming,
> and in start_streaming check if there are less than 4 seconds between the last
> stop and new start, and then sleep until 4 seconds have passed.
>
> Is this something you can work on and provide a patch?
>
> For now I'll post a patch fixing the deadlocks etc. so you can develop your
> patch for this on top.
>
> Regards,
>
> 	Hans
>
I've included below a proposed two-part patch for media/usb/hdpvr to be 
added on top of your commit 0fda628d1a97aec51e2120115f1a2adb7c56be5e. 
The proposed patch includes:

- Add the following module parameters:

   - hdpvr_close_to_open_ms_delay: specifies the amount of time that 
must elapse, in milliseconds,
     between stopping streaming and starting streaming since the HD-PVR 
generally takes >3 seconds
     to become ready for reads; defaults to 4000 ms.

   - hdpvr_restart_streaming_max_tries: prevents the driver from getting 
into an out of control
     restart loop; can be set to 0 to emulate the old driver behavior of 
no auto restarts; defaults to 1

   - hdpvr_restart_streaming_ms_delay: after a streaming restart, the 
HD-PVR will not properly
     respond for a brief time; this sets the delay applied after a 
restart; defaults to 100 milliseconds

- hdpvr_stop_streaming saves the stop time (in jiffies).

- hdpvr_start_streaming will sleep as needed to ensure that 
hdpvr_close_to_open_ms_delay has elapsed
   since the last stop streaming.

- Remove the fixed sleep between the hdpvr_stop_streaming and 
hdpvr_start_streaming calls in hdpvr_read
   since hdpvr_start_streaming now includes the necessary sleep for all 
starts.

- Fix bug where restarting streaming could incorrectly cause hdpvr_read 
to return 0 (EOF).

 From 38f265a0563a6aac16aea29f57d96fd2650d93e8 Mon Sep 17 00:00:00 2001
Date: Mon, 24 Jun 2019 22:04:48 -0500
Subject: [PATCH 1/2] Add adaptive sleeping in hdpvr_start_streaming

---
  drivers/media/usb/hdpvr/hdpvr-core.c  |  4 ++++
  drivers/media/usb/hdpvr/hdpvr-video.c | 18 ++++++++++++++++++
  drivers/media/usb/hdpvr/hdpvr.h       |  5 +++++
  3 files changed, 27 insertions(+)

diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c 
b/drivers/media/usb/hdpvr/hdpvr-core.c
index 29ac7fc5b039..5f28174d409c 100644
--- a/drivers/media/usb/hdpvr/hdpvr-core.c
+++ b/drivers/media/usb/hdpvr/hdpvr-core.c
@@ -39,6 +39,10 @@ int hdpvr_debug;
  module_param(hdpvr_debug, int, S_IRUGO|S_IWUSR);
  MODULE_PARM_DESC(hdpvr_debug, "enable debugging output");

+uint hdpvr_close_to_open_ms_delay = 4000;
+module_param(hdpvr_close_to_open_ms_delay, uint, S_IRUGO|S_IWUSR);
+MODULE_PARM_DESC(hdpvr_close_to_open_ms_delay, "delay restarting 
streaming by the specified number of milliseconds");
+
  static uint default_video_input = HDPVR_VIDEO_INPUTS;
  module_param(default_video_input, uint, S_IRUGO|S_IWUSR);
  MODULE_PARM_DESC(default_video_input, "default video input: 
0=Component / 1=S-Video / 2=Composite");
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c 
b/drivers/media/usb/hdpvr/hdpvr-video.c
index 693c6169fc01..d114eff06469 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -276,6 +276,8 @@ static int hdpvr_start_streaming(struct hdpvr_device 
*dev)
  {
      int ret;
      struct hdpvr_video_info vidinf;
+    u64 now_jiffies, delta_jiffies;
+    unsigned msec_to_sleep;

      if (dev->status == STATUS_STREAMING)
          return 0;
@@ -296,6 +298,19 @@ static int hdpvr_start_streaming(struct 
hdpvr_device *dev)
      v4l2_dbg(MSG_BUFFER, hdpvr_debug, &dev->v4l2_dev,
              "video signal: %dx%d@%dhz\n", vidinf.width,
              vidinf.height, vidinf.fps);
+    now_jiffies = get_jiffies_64();
+    /* inline time_after64 since the result of the subtraction is needed
+     * for the sleep
+     */
+    delta_jiffies = dev->jiffies_next_start_streaming - now_jiffies;
+    if ((__s64)delta_jiffies > 0) {
+        /* device firmware may not be ready yet */
+        msec_to_sleep = jiffies_to_msecs(delta_jiffies);
+        v4l2_dbg(MSG_INFO, hdpvr_debug, &dev->v4l2_dev, "device 
firmware may not be ready yet, sleeping for %u milliseconds\n", 
msec_to_sleep);
+        msleep(msec_to_sleep);
+    }
+    else
+        v4l2_dbg(MSG_INFO, hdpvr_debug, &dev->v4l2_dev, "device 
firmware assumed to be already stable, not sleeping\n");

      /* start streaming 2 request */
      ret = usb_control_msg(dev->udev,
@@ -328,6 +343,7 @@ static int hdpvr_stop_streaming(struct hdpvr_device 
*dev)
      int actual_length;
      uint c = 0;
      u8 *buf;
+    u64 now_jiffies;

      if (dev->status == STATUS_IDLE)
          return 0;
@@ -364,6 +380,8 @@ static int hdpvr_stop_streaming(struct hdpvr_device 
*dev)
      kfree(buf);
      v4l2_dbg(MSG_BUFFER, hdpvr_debug, &dev->v4l2_dev,
           "used %d urbs to empty device buffers\n", c-1);
+    now_jiffies = get_jiffies_64();
+    dev->jiffies_next_start_streaming = now_jiffies + 
msecs_to_jiffies(hdpvr_close_to_open_ms_delay);
      msleep(10);

      dev->status = STATUS_IDLE;
diff --git a/drivers/media/usb/hdpvr/hdpvr.h 
b/drivers/media/usb/hdpvr/hdpvr.h
index fa43e1d45ea9..a9d46fbeef9a 100644
--- a/drivers/media/usb/hdpvr/hdpvr.h
+++ b/drivers/media/usb/hdpvr/hdpvr.h
@@ -43,6 +43,7 @@
  /* #define HDPVR_DEBUG */

  extern int hdpvr_debug;
+extern uint hdpvr_close_to_open_ms_delay;

  #define MSG_INFO    1
  #define MSG_BUFFER    2
@@ -95,6 +96,10 @@ struct hdpvr_device {
      struct v4l2_dv_timings    cur_dv_timings;

      uint            flags;
+    /* earliest jiffies at which the device firmware will be ready to
+     * start streaming
+     */
+    u64             jiffies_next_start_streaming;

      /* synchronize I/O */
      struct mutex        io_mutex;
-- 
2.21.0

 From 83be5b523422fd39222368f977ab0c7981421aec Mon Sep 17 00:00:00 2001
Date: Thu, 27 Jun 2019 20:02:52 -0500
Subject: [PATCH 2/2] Add optional restart, with optional delay, after
  restarting streaming

---
  drivers/media/usb/hdpvr/hdpvr-core.c  |  8 ++++++++
  drivers/media/usb/hdpvr/hdpvr-video.c | 28 +++++++++++++++++++++++++++
  drivers/media/usb/hdpvr/hdpvr.h       |  2 ++
  3 files changed, 38 insertions(+)

diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c 
b/drivers/media/usb/hdpvr/hdpvr-core.c
index 5f28174d409c..7cfd9ca6440b 100644
--- a/drivers/media/usb/hdpvr/hdpvr-core.c
+++ b/drivers/media/usb/hdpvr/hdpvr-core.c
@@ -43,6 +43,14 @@ uint hdpvr_close_to_open_ms_delay = 4000;
  module_param(hdpvr_close_to_open_ms_delay, uint, S_IRUGO|S_IWUSR);
  MODULE_PARM_DESC(hdpvr_close_to_open_ms_delay, "delay restarting 
streaming by the specified number of milliseconds");

+uint hdpvr_restart_streaming_max_tries = 1;
+module_param(hdpvr_restart_streaming_max_tries, uint, S_IRUGO|S_IWUSR);
+MODULE_PARM_DESC(hdpvr_restart_streaming_max_tries, "restart streaming 
at most this many times within one read");
+
+uint hdpvr_restart_streaming_ms_delay = 100;
+module_param(hdpvr_restart_streaming_ms_delay, uint, S_IRUGO|S_IWUSR);
+MODULE_PARM_DESC(hdpvr_restart_streaming_ms_delay, "delay continue by 
the specified number of milliseconds after restarting streaming");
+
  static uint default_video_input = HDPVR_VIDEO_INPUTS;
  module_param(default_video_input, uint, S_IRUGO|S_IWUSR);
  MODULE_PARM_DESC(default_video_input, "default video input: 
0=Component / 1=S-Video / 2=Composite");
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c 
b/drivers/media/usb/hdpvr/hdpvr-video.c
index d114eff06469..4feac0777a6c 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -433,6 +433,7 @@ static ssize_t hdpvr_read(struct file *file, char 
__user *buffer, size_t count,
      struct hdpvr_buffer *buf = NULL;
      struct urb *urb;
      unsigned int ret = 0;
+    unsigned int restarts_remaining = hdpvr_restart_streaming_max_tries;
      int rem, cnt;

      if (*pos)
@@ -483,6 +484,15 @@ static ssize_t hdpvr_read(struct file *file, char 
__user *buffer, size_t count,
                  goto err;
              }
              if (!err) {
+                if (restarts_remaining == 0) {
+                    v4l2_dbg(MSG_BUFFER, hdpvr_debug, &dev->v4l2_dev, 
"timeout: no further restarts allowed by 
hdpvr_restart_streaming_max_tries; returning to caller with ret=%u", ret);
+                    /* This break will return the count of bytes copied
+                     * so far, which may be 0.  In that situation, the
+                     * user application will get an EOF.
+                     */
+                    break;
+                }
+                -- restarts_remaining;
                  v4l2_info(&dev->v4l2_dev,
                        "timeout: restart streaming\n");
                  mutex_lock(&dev->io_mutex);
@@ -493,6 +503,24 @@ static ssize_t hdpvr_read(struct file *file, char 
__user *buffer, size_t count,
                      ret = err;
                      goto err;
                  }
+                /* hdpvr_start_streaming instructs the device to stream,
+                 * but the device is usually not ready by the time
+                 * hdpvr_start_streaming returns.
+                 *
+                 * Without this continue, the loop would terminate.  If
+                 * no data had been copied by a prior iteration of the
+                 * loop, then hdpvr_read would return 0, closing the
+                 * file descriptor prematurely.  Continue back to the
+                 * top of the loop to avoid that.
+                 *
+                 * The device may not be ready within 1 second, so the
+                 * wait_event_interruptible_timeout would then restart
+                 * streaming a second time.  Delay here to give the
+                 * device time to stabilize first.
+                 */
+                if (hdpvr_restart_streaming_ms_delay)
+                    msleep(hdpvr_restart_streaming_ms_delay);
+                continue;
              }
          }

diff --git a/drivers/media/usb/hdpvr/hdpvr.h 
b/drivers/media/usb/hdpvr/hdpvr.h
index a9d46fbeef9a..2b3d92b2b639 100644
--- a/drivers/media/usb/hdpvr/hdpvr.h
+++ b/drivers/media/usb/hdpvr/hdpvr.h
@@ -44,6 +44,8 @@

  extern int hdpvr_debug;
  extern uint hdpvr_close_to_open_ms_delay;
+extern uint hdpvr_restart_streaming_max_tries;
+extern uint hdpvr_restart_streaming_ms_delay;

  #define MSG_INFO    1
  #define MSG_BUFFER    2
-- 
2.21.0



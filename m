Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBDB747F8
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 09:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387756AbfGYHSC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 03:18:02 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38191 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387562AbfGYHSC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 03:18:02 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qY0hhBtNKLqASqY0lhRuyL; Thu, 25 Jul 2019 09:17:59 +0200
Subject: Re: [PATCH 2/2]: media: hdpvr: Add optional restart, with optional
 delay, after restarting streaming
To:     Keith Pyle <kpyle@austin.rr.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <cdb26c96-39b6-47fc-5eca-0dc4dea4ead2@austin.rr.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b22c1694-f73b-f8d5-6068-12b721c5fa26@xs4all.nl>
Date:   Thu, 25 Jul 2019 09:17:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cdb26c96-39b6-47fc-5eca-0dc4dea4ead2@austin.rr.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGRnL3f/AmnEd3WUfMaQE0Svw0t60JqW/O3G0KAEy/J1fUvSWvN50HQBnGStLbK3VwjeOklm0+VtrWlDLfz7YmhR5l0HPge6grsBaL6qTdTEWb/Q7A8V
 LKPiVCd49fEYGCWbNIOHbBaumFu2Mtfty3pK+uSfXobFE4DHkxXWx5Kw5RobNu2TWib0GwpgR0Mqt0noPYWdFIw4DmbFEIx4qYk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/7/19 11:16 PM, Keith Pyle wrote:
> `hdpvr_read` attempts to restart streaming if the device is read while
> it is both not ready and not disconnected.  However, the device is often
> still not ready immediately after the call to `hdpvr_start_streaming`
> returns, causing the condition `if (buf->status != BUFSTAT_READY)` to
> exit the loop without reading any further data.  By itself, this would
> merely cause a short read, which should be easily recoverable.  However,
> if no data has been read so far, this causes `hdpvr_read` to return 0,
> which results in an end-of-file for the user application.
> 
> Compensate for this by adding the ability to delay after the call to
> `hdpvr_start_streaming`, then `continue;` back to the top, so that
> `hdpvr_read` can call `wait_event_interruptible_timeout` again to wait
> for the device to become ready.  This delay complements the prior patch.
> The prior patch delays before issuing the start-streaming command, to
> give the firmware time to stabilize before receiving the command.  This
> delay is after the start-streaming command, to give the firmware time to
> bring the device to a ready state.  This delay is configurable through a
> new module parameter, `hdpvr_restart_streaming_ms_delay`, which defaults
> to a 100 millisecond delay.
> 
> To avoid an infinite loop in `hdpvr_read`, add a limit to how many times
> `hdpvr_read` can restart the device before returning.  This limit is
> configurable through a new module parameter,
> `hdpvr_restart_streaming_max_tries`, and defaults to one restart.
> Administrators may set the limit to 0 to request that `hdpvr_read` never
> attempt to restart streaming.  Previously, there was no way for
> administrators to opt out of an attempted restart.
> 
> Signed-off-by: Keith Pyle <kpyle@austin.rr.com>
> Tested-by: Keith Pyle <kpyle@austin.rr.com>
> ---
> Changes since v1:
> - Rewrapped output at 80 columns, per request from Hans.  Literal strings
> still exceed 80 columns where necessary to keep an entire string together,
> since this makes it easier for grep to find the file and line that
> generates a given message.
> ---
>  drivers/media/usb/hdpvr/hdpvr-core.c  |  8 ++++++
>  drivers/media/usb/hdpvr/hdpvr-video.c | 40 +++++++++++++++++++++++++++
>  drivers/media/usb/hdpvr/hdpvr.h       |  2 ++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c b/drivers/media/usb/hdpvr/hdpvr-core.c
> index fd7608e7e94c..b7ac63113ac0 100644
> --- a/drivers/media/usb/hdpvr/hdpvr-core.c
> +++ b/drivers/media/usb/hdpvr/hdpvr-core.c
> @@ -43,6 +43,14 @@ uint hdpvr_close_to_open_ms_delay = 4000;
>  module_param(hdpvr_close_to_open_ms_delay, uint, S_IRUGO|S_IWUSR);
>  MODULE_PARM_DESC(hdpvr_close_to_open_ms_delay, "delay restarting streaming by the specified number of milliseconds");
>  
> +uint hdpvr_restart_streaming_max_tries = 1;
> +module_param(hdpvr_restart_streaming_max_tries, uint, S_IRUGO|S_IWUSR);
> +MODULE_PARM_DESC(hdpvr_restart_streaming_max_tries, "restart streaming at most this many times within one read");
> +
> +uint hdpvr_restart_streaming_ms_delay = 100;
> +module_param(hdpvr_restart_streaming_ms_delay, uint, S_IRUGO|S_IWUSR);
> +MODULE_PARM_DESC(hdpvr_restart_streaming_ms_delay, "delay continue by the specified number of milliseconds after restarting streaming");
> +
>  static uint default_video_input = HDPVR_VIDEO_INPUTS;
>  module_param(default_video_input, uint, S_IRUGO|S_IWUSR);
>  MODULE_PARM_DESC(default_video_input, "default video input: 0=Component / 1=S-Video / 2=Composite");
> diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
> index 8a2b883d372e..e2ca5d955f4a 100644
> --- a/drivers/media/usb/hdpvr/hdpvr-video.c
> +++ b/drivers/media/usb/hdpvr/hdpvr-video.c
> @@ -441,6 +441,8 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
>  	struct hdpvr_buffer *buf = NULL;
>  	struct urb *urb;
>  	unsigned int ret = 0;
> +	unsigned int restarts_remaining = hdpvr_restart_streaming_max_tries;
> +	unsigned int delay;
>  	int rem, cnt;
>  
>  	if (*pos)
> @@ -491,6 +493,20 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
>  				goto err;
>  			}
>  			if (!err) {
> +				if (restarts_remaining == 0) {
> +					v4l2_dbg(MSG_BUFFER, hdpvr_debug,
> +						 &dev->v4l2_dev,
> +						 "timeout: no further restarts allowed by hdpvr_restart_streaming_max_tries; returning to caller with ret=%u",
> +						 ret);
> +					/* This break will return the
> +					 * count of bytes copied so far,
> +					 * which may be 0.  In that
> +					 * situation, the user
> +					 * application will get an EOF.

The comment blocks in this patch are ugly. There is more room to the right, so
fill each line until column 80. So in this example:

                                        /*
                                         * This break will return the count of
                                         * bytes copied so far, which may be 0.
                                         * In that situation, the user
                                         * application will get an EOF.
                                         */

> +					 */
> +					break;
> +				}
> +				--restarts_remaining;

This isn't wrong, but the kernel style is: restarts_remaining--;

>  				v4l2_info(&dev->v4l2_dev,
>  					  "timeout: restart streaming\n");
>  				mutex_lock(&dev->io_mutex);
> @@ -501,6 +517,30 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
>  					ret = err;
>  					goto err;
>  				}
> +				/* hdpvr_start_streaming instructs the
> +				 * device to stream, but the device is
> +				 * usually not ready by the time
> +				 * hdpvr_start_streaming returns.
> +				 *
> +				 * Without this continue, the loop would
> +				 * terminate.  If no data had been
> +				 * copied by a prior iteration of the
> +				 * loop, then hdpvr_read would return 0,
> +				 * closing the file descriptor
> +				 * prematurely.  Continue back to the
> +				 * top of the loop to avoid that.
> +				 *
> +				 * The device may not be ready within 1
> +				 * second, so the
> +				 * wait_event_interruptible_timeout
> +				 * would then restart streaming a second
> +				 * time.  Delay here to give the device
> +				 * time to stabilize first.
> +				 */
> +				delay = hdpvr_restart_streaming_ms_delay;
> +				if (delay)
> +					msleep(delay);
> +				continue;
>  			}

I wonder if it wouldn't be better to move the code inside the 'if (!err) {' to
a separate function. It's getting hard to read.

Regards,

	Hans

>  		}
>  
> diff --git a/drivers/media/usb/hdpvr/hdpvr.h b/drivers/media/usb/hdpvr/hdpvr.h
> index 9e5f88146827..b1568adca7f0 100644
> --- a/drivers/media/usb/hdpvr/hdpvr.h
> +++ b/drivers/media/usb/hdpvr/hdpvr.h
> @@ -44,6 +44,8 @@
>  
>  extern int hdpvr_debug;
>  extern uint hdpvr_close_to_open_ms_delay;
> +extern uint hdpvr_restart_streaming_max_tries;
> +extern uint hdpvr_restart_streaming_ms_delay;
>  
>  #define MSG_INFO	1
>  #define MSG_BUFFER	2
> 


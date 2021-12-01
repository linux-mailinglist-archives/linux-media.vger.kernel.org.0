Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC48A4652F1
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 17:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243492AbhLAQne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 11:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238010AbhLAQnd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 11:43:33 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67136C061574
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 08:40:12 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id sSeLmBJhoDFsksSePmGOUK; Wed, 01 Dec 2021 17:40:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638376809; bh=/ebQOxJKJk7OTbwu37QXYmdrZrh2WFJZrSULxz9Ydhw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dkCL2ufrAE4+cfKPf+wrqIl12ee9qAgWTADMRExaGDPHrpYrdbpY5ejrWpbe9vVau
         rqrOb+dd9sXuQXInyHTrZgOyY4lv7iCFfDhiAEZ6NzxcC3op/KMV3Mjm/jLykhHkwK
         UmtSm5Zkpch3ejZI8TvVhz2d94dOTA1trozV36EjFhCTZWgKeKUUiqV3rhHlqrqDMV
         NGSvxJBOPkGr1PVkm0VBBgzsAaMS2hleNkCEcsLx5mco2JHYuOsXdzetiuhy2Ui4Qo
         cKNhH3VJ8sPLcMdE6IBQVPgOJx4nekL1KTn4AAgY4lEUccMMaJgerZGSKKOF24sHeJ
         TcumBlJOnyAtQ==
Subject: Re: [PATCH] media: vivid: fix timestamp and sequence wrapping
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
References: <20211122043355.61573-1-deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4eed6f22-0a9e-ad88-dc55-64019a0a0552@xs4all.nl>
Date:   Wed, 1 Dec 2021 17:40:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122043355.61573-1-deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMyQmBUA1MVVfVkg5G5RJNYebdYR3X8ZL0Ok8ErH4F9rMNK93IvllcWd1K40FgJgWmLtMFgnnAsyHrXgjfC4rMRcxYpoa9fH9hCuvJ0mZkrcqz70MDXI
 FR8/8eJ1Gr+tpFKCmCUIOKlKBNRhcAbGn2PjcFAVvCELv3AUNpfo8NchpZsQSmK6ZkWgjy7b8ikjmqgkcwy2gWVAC1UWSiPJU4k+JQGAaxAHDe048p01bOqZ
 DXr5QnlLpAZJEEQYBpfVqQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

Sorry for the delay, I needed to find some time for testing this
since I suspected that this code didn't quite do what I was looking for.

See my comments below...

On 22/11/2021 05:33, Deborah Brouwer wrote:
> The error injection controls that test wrap-around sequence and
> timestamp counters were partially broken. Add a menu option to wrap
> the timestamp at either 64 or 32 bits because previously it was not
> wrapping for 64 bits. Get the current time when streaming starts
> instead of when the control is set because otherwise the time may
> wrap around before the device can be tested.  Remove the sequence
> count from the timestamp calculation so that sequence wrapping does
> not interfere with the timestamp.  Add consistent time and sequence
> wrapping to sdr and touch devices.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
> How I set the controls:
> v4l2-ctl -d <dev> -c wrap_sequence_number=1
> v4l2-ctl -d <dev> -c wrap_timestamp=1
> v4l2-ctl -d <dev> -c wrap_timestamp=2
> 
> How I tested:
> v4l2-ctl -d <dev> --stream-mmap --verbose 
> v4l2-ctl -d <dev> --stream-out-mmap --verbose 
> v4l2-ctl-32 -d <dev> --stream-mmap --verbose
> v4l2-ctl-32 -d <dev> --stream-out-mmap --verbose
> 
> Devices I tested:
> vivid-000-vid-cap, inputs: webcam, TV, S-Video, HDMI
> vivid-000-vid-out, outputs: S-Video, HDMI
> vivid-000-touch-cap
> vivid-000-sdr-cap
> vivid-000-vbi-out
> vivid-000-meta-cap
> vivid-000-meta-out
> 
>  drivers/media/test-drivers/vivid/vivid-core.h |  5 ++-
>  .../media/test-drivers/vivid/vivid-ctrls.c    | 32 ++++++++-----------
>  .../test-drivers/vivid/vivid-kthread-cap.c    |  9 ++++--
>  .../test-drivers/vivid/vivid-kthread-out.c    | 11 ++++---
>  .../test-drivers/vivid/vivid-kthread-touch.c  | 10 ++++++
>  .../media/test-drivers/vivid/vivid-sdr-cap.c  | 16 +++++++---
>  .../test-drivers/vivid/vivid-touch-cap.c      |  2 +-
>  7 files changed, 55 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
> index 45f96706edde..176b72cb143b 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.h
> +++ b/drivers/media/test-drivers/vivid/vivid-core.h
> @@ -307,7 +307,7 @@ struct vivid_dev {
>  	bool				dqbuf_error;
>  	bool				req_validate_error;
>  	bool				seq_wrap;
> -	bool				time_wrap;
> +	u64				time_wrap;
>  	u64				time_wrap_offset;
>  	unsigned			perc_dropped_buffers;
>  	enum vivid_signal_mode		std_signal_mode[MAX_INPUTS];
> @@ -437,6 +437,7 @@ struct vivid_dev {
>  	bool				touch_cap_seq_resync;
>  	u32				touch_cap_seq_start;
>  	u32				touch_cap_seq_count;
> +	u32				touch_cap_with_seq_wrap_count;
>  	bool				touch_cap_streaming;
>  	struct v4l2_fract		timeperframe_tch_cap;
>  	struct v4l2_pix_format		tch_format;
> @@ -524,7 +525,9 @@ struct vivid_dev {
>  	struct task_struct		*kthread_sdr_cap;
>  	unsigned long			jiffies_sdr_cap;
>  	u32				sdr_cap_seq_offset;
> +	u32				sdr_cap_seq_start;
>  	u32				sdr_cap_seq_count;
> +	u32				sdr_cap_with_seq_wrap_count;
>  	bool				sdr_cap_seq_resync;
>  
>  	/* RDS generator */
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index 8dc50fe22972..ef2899b7df4e 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -1084,7 +1084,6 @@ static const struct v4l2_ctrl_config vivid_ctrl_display_present = {
>  static int vivid_streaming_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_streaming);
> -	u64 rem;
>  
>  	switch (ctrl->id) {
>  	case VIVID_CID_DQBUF_ERROR:
> @@ -1122,20 +1121,10 @@ static int vivid_streaming_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case VIVID_CID_TIME_WRAP:
>  		dev->time_wrap = ctrl->val;
> -		if (ctrl->val == 0) {
> -			dev->time_wrap_offset = 0;
> -			break;
> -		}
> -		/*
> -		 * We want to set the time 16 seconds before the 32 bit tv_sec
> -		 * value of struct timeval would wrap around. So first we
> -		 * calculate ktime_get_ns() % ((1 << 32) * NSEC_PER_SEC), and
> -		 * then we set the offset to ((1 << 32) - 16) * NSEC_PER_SEC).
> -		 */
> -		div64_u64_rem(ktime_get_ns(),
> -			0x100000000ULL * NSEC_PER_SEC, &rem);
> -		dev->time_wrap_offset =
> -			(0x100000000ULL - 16) * NSEC_PER_SEC - rem;
> +		if (dev->time_wrap == 1)
> +			dev->time_wrap = 0xFFFFFFFFFFFFFFF0ULL * NSEC_PER_SEC;
> +		if (dev->time_wrap == 2)
> +			dev->time_wrap = 0xFFFFFFF0ULL * NSEC_PER_SEC;

These are strange values. This is really what you want:

                if (dev->time_wrap == 1)
                        dev->time_wrap = (1ULL << 63) - NSEC_PER_SEC * 16;
                else if (dev->time_wrap == 2)
                        dev->time_wrap = ((1ULL << 31) - 16) * NSEC_PER_SEC;

So for 64 bit wrap around you want the time to begin 16 seconds before
you wrap from a positive to a negative 64 bit value. For 32 bit wrap around
you want to begin 16 seconds before the seconds field would wrap around
on a 32 bit system.

>  		break;
>  	}
>  	return 0;
> @@ -1208,13 +1197,20 @@ static const struct v4l2_ctrl_config vivid_ctrl_seq_wrap = {
>  	.step = 1,
>  };
>  
> +static const char * const vivid_ctrl_time_wrap_strings[] = {
> +	"None",
> +	"64 Bit",
> +	"32 Bit",
> +	NULL,
> +};
> +
>  static const struct v4l2_ctrl_config vivid_ctrl_time_wrap = {
>  	.ops = &vivid_streaming_ctrl_ops,
>  	.id = VIVID_CID_TIME_WRAP,
>  	.name = "Wrap Timestamp",
> -	.type = V4L2_CTRL_TYPE_BOOLEAN,
> -	.max = 1,
> -	.step = 1,
> +	.type = V4L2_CTRL_TYPE_MENU,
> +	.max = ARRAY_SIZE(vivid_ctrl_time_wrap_strings) - 2,
> +	.qmenu = vivid_ctrl_time_wrap_strings,
>  };
>  
>  
> diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
> index 9da730ccfa94..78e2ae8f1bb7 100644
> --- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
> @@ -719,8 +719,7 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
>  	if (!vid_cap_buf && !vbi_cap_buf && !meta_cap_buf)
>  		goto update_mv;
>  
> -	f_time = dev->cap_frame_period * dev->vid_cap_seq_count +
> -		 dev->cap_stream_start + dev->time_wrap_offset;
> +	f_time = ktime_get_ns() + dev->time_wrap_offset;
>  
>  	if (vid_cap_buf) {
>  		v4l2_ctrl_request_setup(vid_cap_buf->vb.vb2_buf.req_obj.req,
> @@ -802,6 +801,7 @@ static int vivid_thread_vid_cap(void *data)
>  	unsigned numerator;
>  	unsigned denominator;
>  	int dropped_bufs;
> +	u64 rem;
>  
>  	dprintk(dev, 1, "Video Capture Thread Start\n");
>  
> @@ -812,6 +812,10 @@ static int vivid_thread_vid_cap(void *data)
>  	dev->cap_seq_count = 0;
>  	dev->cap_seq_resync = false;
>  	dev->jiffies_vid_cap = jiffies;
> +	if (dev->time_wrap) {
> +		div64_u64_rem(ktime_get_ns(), dev->time_wrap, &rem);
> +		dev->time_wrap_offset = dev->time_wrap - rem;
> +	}

And here you do something like this:

        dev->cap_stream_start = ktime_get_ns();
        if (dev->time_wrap)
                dev->time_wrap_offset = dev->time_wrap - dev->cap_stream_start;
        else
                dev->time_wrap_offset = 0;

>  	dev->cap_stream_start = ktime_get_ns();
>  	vivid_cap_update_frame_period(dev);
>  
> @@ -928,6 +932,7 @@ int vivid_start_generating_vid_cap(struct vivid_dev *dev, bool *pstreaming)
>  	dev->vid_cap_seq_start = dev->seq_wrap * 128;
>  	dev->vbi_cap_seq_start = dev->seq_wrap * 128;
>  	dev->meta_cap_seq_start = dev->seq_wrap * 128;
> +	dev->time_wrap_offset = 0;

I think this is not needed since it is set when the kthread starts.

Ditto for video output and sdr.

I tested this for video capture, and it works OK.

Regards,

	Hans

>  
>  	dev->kthread_vid_cap = kthread_run(vivid_thread_vid_cap, dev,
>  			"%s-vid-cap", dev->v4l2_dev.name);
> diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-out.c b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
> index 79c57d14ac4e..8a4164a45316 100644
> --- a/drivers/media/test-drivers/vivid/vivid-kthread-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
> @@ -147,6 +147,7 @@ static int vivid_thread_vid_out(void *data)
>  	unsigned wait_jiffies;
>  	unsigned numerator;
>  	unsigned denominator;
> +	u64 rem;
>  
>  	dprintk(dev, 1, "Video Output Thread Start\n");
>  
> @@ -154,12 +155,13 @@ static int vivid_thread_vid_out(void *data)
>  
>  	/* Resets frame counters */
>  	dev->out_seq_offset = 0;
> -	if (dev->seq_wrap)
> -		dev->out_seq_count = 0xffffff80U;
> +	dev->out_seq_count = 0;
>  	dev->jiffies_vid_out = jiffies;
> -	dev->vid_out_seq_start = dev->vbi_out_seq_start = 0;
> -	dev->meta_out_seq_start = 0;
>  	dev->out_seq_resync = false;
> +	if (dev->time_wrap) {
> +		div64_u64_rem(ktime_get_ns(), dev->time_wrap, &rem);
> +		dev->time_wrap_offset = dev->time_wrap - rem;
> +	}
>  
>  	for (;;) {
>  		try_to_freeze();
> @@ -272,6 +274,7 @@ int vivid_start_generating_vid_out(struct vivid_dev *dev, bool *pstreaming)
>  	dev->vid_out_seq_start = dev->seq_wrap * 128;
>  	dev->vbi_out_seq_start = dev->seq_wrap * 128;
>  	dev->meta_out_seq_start = dev->seq_wrap * 128;
> +	dev->time_wrap_offset = 0;
>  
>  	dev->kthread_vid_out = kthread_run(vivid_thread_vid_out, dev,
>  			"%s-vid-out", dev->v4l2_dev.name);
> diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
> index 38fdfee79498..cb4e5c5a4c2a 100644
> --- a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
> +++ b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
> @@ -52,6 +52,7 @@ static int vivid_thread_touch_cap(void *data)
>  	unsigned int numerator;
>  	unsigned int denominator;
>  	int dropped_bufs;
> +	u64 rem;
>  
>  	dprintk(dev, 1, "Touch Capture Thread Start\n");
>  
> @@ -62,6 +63,10 @@ static int vivid_thread_touch_cap(void *data)
>  	dev->touch_cap_seq_count = 0;
>  	dev->touch_cap_seq_resync = false;
>  	dev->jiffies_touch_cap = jiffies;
> +	if (dev->time_wrap) {
> +		div64_u64_rem(ktime_get_ns(), dev->time_wrap, &rem);
> +		dev->time_wrap_offset = dev->time_wrap - rem;
> +	}
>  
>  	for (;;) {
>  		try_to_freeze();
> @@ -102,6 +107,8 @@ static int vivid_thread_touch_cap(void *data)
>  		}
>  		dropped_bufs = buffers_since_start + dev->touch_cap_seq_offset - dev->touch_cap_seq_count;
>  		dev->touch_cap_seq_count = buffers_since_start + dev->touch_cap_seq_offset;
> +		dev->touch_cap_with_seq_wrap_count =
> +			dev->touch_cap_seq_count - dev->touch_cap_seq_start;
>  
>  		vivid_thread_tch_cap_tick(dev, dropped_bufs);
>  
> @@ -143,6 +150,9 @@ int vivid_start_generating_touch_cap(struct vivid_dev *dev)
>  		return 0;
>  	}
>  
> +	dev->touch_cap_seq_start = dev->seq_wrap * 128;
> +	dev->time_wrap_offset = 0;
> +
>  	dev->kthread_touch_cap = kthread_run(vivid_thread_touch_cap, dev,
>  					     "%s-tch-cap", dev->v4l2_dev.name);
>  
> diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
> index 265db2114671..42e045329a76 100644
> --- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
> @@ -101,7 +101,7 @@ static void vivid_thread_sdr_cap_tick(struct vivid_dev *dev)
>  	spin_unlock(&dev->slock);
>  
>  	if (sdr_cap_buf) {
> -		sdr_cap_buf->vb.sequence = dev->sdr_cap_seq_count;
> +		sdr_cap_buf->vb.sequence = dev->sdr_cap_with_seq_wrap_count;
>  		v4l2_ctrl_request_setup(sdr_cap_buf->vb.vb2_buf.req_obj.req,
>  					&dev->ctrl_hdl_sdr_cap);
>  		v4l2_ctrl_request_complete(sdr_cap_buf->vb.vb2_buf.req_obj.req,
> @@ -124,6 +124,7 @@ static int vivid_thread_sdr_cap(void *data)
>  	unsigned long jiffies_since_start;
>  	unsigned long cur_jiffies;
>  	unsigned wait_jiffies;
> +	u64 rem;
>  
>  	dprintk(dev, 1, "SDR Capture Thread Start\n");
>  
> @@ -131,10 +132,13 @@ static int vivid_thread_sdr_cap(void *data)
>  
>  	/* Resets frame counters */
>  	dev->sdr_cap_seq_offset = 0;
> -	if (dev->seq_wrap)
> -		dev->sdr_cap_seq_offset = 0xffffff80U;
> +	dev->sdr_cap_seq_count = 0;
>  	dev->jiffies_sdr_cap = jiffies;
>  	dev->sdr_cap_seq_resync = false;
> +	if (dev->time_wrap) {
> +		div64_u64_rem(ktime_get_ns(), dev->time_wrap, &rem);
> +		dev->time_wrap_offset = dev->time_wrap - rem;
> +	}
>  
>  	for (;;) {
>  		try_to_freeze();
> @@ -174,6 +178,7 @@ static int vivid_thread_sdr_cap(void *data)
>  		}
>  		dev->sdr_cap_seq_count =
>  			buffers_since_start + dev->sdr_cap_seq_offset;
> +		dev->sdr_cap_with_seq_wrap_count = dev->sdr_cap_seq_count - dev->sdr_cap_seq_start;
>  
>  		vivid_thread_sdr_cap_tick(dev);
>  		mutex_unlock(&dev->mutex);
> @@ -263,7 +268,10 @@ static int sdr_cap_start_streaming(struct vb2_queue *vq, unsigned count)
>  	int err = 0;
>  
>  	dprintk(dev, 1, "%s\n", __func__);
> -	dev->sdr_cap_seq_count = 0;
> +
> +	dev->sdr_cap_seq_start = dev->seq_wrap * 128;
> +	dev->time_wrap_offset = 0;
> +
>  	if (dev->start_streaming_error) {
>  		dev->start_streaming_error = false;
>  		err = -EINVAL;
> diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
> index ebb00b128030..64e3e4cb30c2 100644
> --- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
> @@ -262,7 +262,7 @@ void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf)
>  
>  	__s16 *tch_buf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
>  
> -	buf->vb.sequence = dev->touch_cap_seq_count;
> +	buf->vb.sequence = dev->touch_cap_with_seq_wrap_count;
>  	test_pattern = (buf->vb.sequence / TCH_SEQ_COUNT) % TEST_CASE_MAX;
>  	test_pat_idx = buf->vb.sequence % TCH_SEQ_COUNT;
>  
> 


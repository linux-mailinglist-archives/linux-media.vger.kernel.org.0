Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD0A15EB61
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 18:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405138AbgBNRUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 12:20:18 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8605 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390987AbgBNRUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 12:20:17 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e46d6b20000>; Fri, 14 Feb 2020 09:19:46 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 14 Feb 2020 09:20:16 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 14 Feb 2020 09:20:16 -0800
Received: from [10.2.163.245] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 17:20:15 +0000
Subject: Re: Re: [RFC PATCH v2 4/6] media: tegra: Add Tegra210 Video input
 driver
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580937806-17376-1-git-send-email-skomatineni@nvidia.com>
 <1580937806-17376-5-git-send-email-skomatineni@nvidia.com>
 <20200214164642.GA1310813@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ccb32c83-2cd8-fb26-658c-6bc11f460336@nvidia.com>
Date:   Fri, 14 Feb 2020 09:20:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200214164642.GA1310813@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581700786; bh=0TgSKDENwvoW0ZWqchiqORNoTXWv77shXNuxZ0wmLyk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=a2KZ6TqzvYmI5spWyZVsGHn4FV3GYIlZzpNIYztBWq1kqasdrzeh5VcTXb6OtladD
         1wIJ7m0ifFFiehE0r7TIm+vXXFnSgwo7L7gdILyhSIdFDPPe/dwQsiZt6TL9US8qzn
         Izt/M7UQqoMSSPMDVzhCLWnpnkPwSh32BbyHe9tTQcYRNSHKpgkkTjD3IsQJ4zeU8d
         1rY2FERgcFl/7UupdHzh07GEaXUH8Y8nlfUF643cpoEvmgg4wOBksyjSVnSgOSCfvN
         mezLsmbs9FtXYD5Yl09pSbVMmVYNlO2x8V5Q2b77ynGOcHrqCP3POz+Jdr1J3q/Gg9
         97ImdADcsFUJg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/14/20 8:46 AM, Thierry Reding wrote:
> On Wed, Feb 05, 2020 at 01:23:24PM -0800, Sowjanya Komatineni wrote:
> [...]
>> +static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
>> +				       struct tegra_channel_buffer *buf)
>> +{
>> +	int err = 0;
>> +	u32 thresh, value, frame_start;
>> +	int bytes_per_line = chan->format.bytesperline;
>> +
>> +	/* program buffer address by using surface 0 */
>> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB, 0x0);
>> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
>> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
>> +
>> +	/* increase syncpoint max */
>> +	thresh = host1x_syncpt_incr_max(chan->sp, 1);
>> +
>> +	/* program syncpoint */
>> +	frame_start = VI_CSI_PP_FRAME_START(chan->portno);
>> +	value = VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
>> +		host1x_syncpt_id(chan->sp);
>> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
> Okay, so this programs the VI to increment the given syncpoint upon
> frame start? What is that VI_CSI_PP_FRAME_START(chan->portno) exactly?
This programs thresh for FS event. VI_CSI_PP_FRAME_START is frame start 
condition for corresponding port PPA that we program in INVR_SYNCPT to 
raise event for this condition.
>
>> +
>> +	vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);
> And now we start capturing in single-shot mode.
We set thres to have it raise event when it sees FS and we issue single 
shot which initiates capture with FS first and at end of frame capture 
we should see MW_ACK which confirms frame buffer memory write done.
>
>> +
>> +	/* move buffer to capture done queue */
>> +	spin_lock(&chan->done_lock);
>> +	list_add_tail(&buf->queue, &chan->done);
>> +	spin_unlock(&chan->done_lock);
>> +
>> +	/* wait up kthread for capture done */
>> +	wake_up_interruptible(&chan->done_wait);
> But this I don't understand. You wake up the kthread...

On issuing single start this wakes up other thread which checks for MW_ACK.

So one thread checks for FS and other checks for MW_ACK.

I do see race condition with this, so I had change in v3 where same 
capture thread sets both FS COND SYncpoint and also MW_aCK and once it 
see FS syncpt then only it wakes up other thread for MW_ACK otherwise it 
just returns buffer with error state.


>
>> +
>> +	/* use syncpoint to wake up */
>> +	err = host1x_syncpt_wait(chan->sp, thresh,
>> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
> ... and then wait for the syncpoint to reach the given threshold? Isn't
> that the wrong way around? Don't we need to wait for the syncpoint
> increment *before* we wake up the kthread that will return the buffer
> to userspace?
V3 has change to check for MW_ACK only on successful FS. Will send out 
v3 soon.
>> +	if (err) {
>> +		dev_err(&chan->video.dev,
>> +			"frame start syncpt timeout: %d\n", err);
>> +		tegra_channel_capture_error_status(chan);
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +static int tegra_channel_capture_done(struct tegra_vi_channel *chan,
>> +				      struct tegra_channel_buffer *buf)
>> +{
>> +	struct vb2_v4l2_buffer *vb = &buf->buf;
>> +	u32 thresh, value, mw_ack_done;
>> +	int ret = 0;
>> +
>> +	/* increase syncpoint max */
>> +	thresh = host1x_syncpt_incr_max(chan->sp, 1);
>> +
>> +	/* program syncpoint */
>> +	mw_ack_done = VI_CSI_MW_ACK_DONE(chan->portno);
>> +	value = VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
>> +		host1x_syncpt_id(chan->sp);
>> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
>> +
>> +	if (!vi_csi_read(chan, TEGRA_VI_CSI_SINGLE_SHOT))
>> +		vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT,
>> +			     SINGLE_SHOT_CAPTURE);
>> +
>> +	/* use syncpoint to wake up */
>> +	ret = host1x_syncpt_wait(chan->sp, thresh,
>> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>> +	if (ret)
>> +		dev_err(&chan->video.dev,
>> +			"MW_ACK_DONE syncpoint timeout: %d\n", ret);
> Actually... there's another syncpoint wait here, so I guess this will
> stall until VI has actually completed writing the captured frame to
> memory.

Yes with v2 it will wait till it sees MW_ACK before returning buffer.

But as mentioned above, to avoid possible race condition moved 
programming both threshold for same frame in capture thread and only on 
receiving FS it wakes other thread to wait for MW_ACK and return buffer.


>> +
>> +	/* captured one frame */
>> +	vb->sequence = chan->sequence++;
>> +	vb->field = V4L2_FIELD_NONE;
>> +	vb->vb2_buf.timestamp = ktime_get_ns();
>> +	vb2_buffer_done(&vb->vb2_buf,
>> +			ret < 0 ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> So it's really only at this point that we return the buffer to
> userspace, which should be after the hardware is done writing to the
> buffer, so this should be fine.
>
> That said, I'm wondering if host1x_syncpt_wait() is a good interface
> for this use-case. We don't really have anything else right now, but
> I think we may be able to add something to have a function called in
> case the syncpoint reaches a threshold. Having to spawn two separate
> threads with wait queues seems a bit overkill for this.
>
> It's fine to leave this as it is for now, but maybe something to
> consider as improvement in the future.
>
>> +	return ret;
>> +}
>> +
>> +static int chan_capture_kthread_start(void *data)
>> +{
>> +	struct tegra_vi_channel *chan = data;
>> +	struct tegra_channel_buffer *buf;
>> +	int err = 0;
>> +
>> +	set_freezable();
>> +
>> +	while (1) {
>> +		try_to_freeze();
>> +
>> +		wait_event_interruptible(chan->start_wait,
>> +					 !list_empty(&chan->capture) ||
>> +					 kthread_should_stop());
>> +		if (kthread_should_stop())
>> +			break;
>> +
>> +		if (err)
>> +			continue;
>> +
>> +		spin_lock(&chan->start_lock);
>> +		if (list_empty(&chan->capture)) {
>> +			spin_unlock(&chan->start_lock);
>> +			continue;
>> +		}
>> +
>> +		buf = list_entry(chan->capture.next,
>> +				 struct tegra_channel_buffer, queue);
>> +		list_del_init(&buf->queue);
>> +		spin_unlock(&chan->start_lock);
>> +		err = tegra_channel_capture_frame(chan, buf);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int chan_capture_kthread_done(void *data)
>> +{
>> +	struct tegra_vi_channel *chan = data;
>> +	struct tegra_channel_buffer *buf;
>> +	int err = 0;
>> +
>> +	set_freezable();
>> +
>> +	while (1) {
>> +		try_to_freeze();
>> +
>> +		wait_event_interruptible(chan->done_wait,
>> +					 !list_empty(&chan->done) ||
>> +					 kthread_should_stop());
>> +
>> +		if (kthread_should_stop())
>> +			break;
>> +
>> +		spin_lock(&chan->done_lock);
>> +		if (list_empty(&chan->done)) {
>> +			spin_unlock(&chan->done_lock);
>> +			continue;
>> +		}
>> +
>> +		buf = list_entry(chan->done.next, struct tegra_channel_buffer,
>> +				 queue);
>> +		if (!buf)
>> +			continue;
>> +
>> +		list_del_init(&buf->queue);
>> +		spin_unlock(&chan->done_lock);
>> +		err = tegra_channel_capture_done(chan, buf);
> What's with the error here? I think we should either handle it in some
> way, or just avoid even returning an error if we're not going to deal
> with it anyway.
>
> Thierry


v3 has proper implementation where on no frame start which happens when 
source is not streaming, we keep thread in wait till kthread stops and 
we dont dequeue buffers.

Once we see kthread stop then we return all buffers.


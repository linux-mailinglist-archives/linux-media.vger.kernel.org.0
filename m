Return-Path: <linux-media+bounces-26426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC39A3D1B2
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 08:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F15A1898939
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 07:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4DF1E47D9;
	Thu, 20 Feb 2025 07:04:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A52A442C;
	Thu, 20 Feb 2025 07:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740035044; cv=none; b=SS7kn2oxh3VFHC69rpczjJBNQE7EuKqNNEETK/s0qC/4K/nbISmMyOP1YOJ1TpyC0ezKsURUuGCUdnUg+9pFu38pYRt26PRk/8ObpLKeM9hTIKxAkQMEwjyvSpqgjEu0VEooKjomVCkkMQvMoJZ8qDhf3PRfPTFXFwS+HKj1w0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740035044; c=relaxed/simple;
	bh=LOXR1dQimFYAdifZKByrUphuyfouU89hn63KL/R7M0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9fnIpbpaNqAOv1rpJY6hOPsOUAzgiVyntVEM/DlnCjsc57qFRzWHXRTFhLLa4I954zZQkQLUBgfJofmxAsoEV8CilUkGafbbsshJYaCZgSdlCrA7XeenvSSfey6QIhLQ6dVGpkfffJcFYK51ZmcIO4PYc54x6FqWd4xIMb2oDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F2FC4CED1;
	Thu, 20 Feb 2025 07:03:59 +0000 (UTC)
Message-ID: <f188dd6f-c98e-4a70-a1f0-3d205b924b78@xs4all.nl>
Date: Thu, 20 Feb 2025 08:03:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>
References: <20250218184439.28648-1-dmitry.osipenko@collabora.com>
 <20250218184439.28648-5-dmitry.osipenko@collabora.com>
 <f32a0011-1653-48dd-9061-047f9009310b@xs4all.nl>
 <3fcdbd35-9ff2-4159-8076-98eefd6ed8c7@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <3fcdbd35-9ff2-4159-8076-98eefd6ed8c7@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 19/02/2025 19:35, Dmitry Osipenko wrote:
> Hi Hans,
> 
> Thank you very much for the review!
> 
> On 2/19/25 12:11, Hans Verkuil wrote:
>> Hi Dmitry,
>>
>> More review comments. Some are trivial, but the real problem is that the 5V/HPD
>> handling is really confusing and, from what I can tell, incorrect in places.
>>
>> I suspect that there are some misunderstandings on how this is supposed to
>> work. I've tried to explain it in my comments, but feel free to contact me if
>> anything is still unclear.
>>
> ...
>>> +#define EDID_NUM_BLOCKS_MAX				2
>>
>> Is this indeed the maximum number of supported EDID blocks?
>> These days 4 EDID blocks is typically the maximum. If the hardware
>> supports it, then I recommend implementing support for 4 EDID blocks.
>>
>> If it really only supports 2 blocks, then add a comment stating that
>> this is a HW limitation.
> 
> Good catch. Hardware supports 4 EDID blocks, will change in v8.

Ah, good. Make sure you test this, both writing 4 blocks to it and read it
from a transmitter. With v4l2-ctl --set-edid type=displayport-with-cta861
sets 3 blocks, and type=hdmi-4k-600mhz-with-displayid sets 4 blocks. So test
with both variants.

> 
> ...
>>> +static int hdmirx_subscribe_event(struct v4l2_fh *fh,
>>> +				  const struct v4l2_event_subscription *sub)
>>> +{
>>> +	switch (sub->type) {
>>> +	case V4L2_EVENT_SOURCE_CHANGE:
>>> +		if (fh->vdev->vfl_dir == VFL_DIR_RX)
>>
>> This is weird, the direction is always RX, so can't you just drop this test?
> 
> Suppose this code was copied from another driver, will drop.
> 
> ...
>>> +static int hdmirx_set_edid(struct file *file, void *fh, struct v4l2_edid *edid)
>>> +{
>>> +	struct hdmirx_stream *stream = video_drvdata(file);
>>> +	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
>>> +	u16 phys_addr;
>>> +	int ret = 0;
>>> +
>>> +	if (edid->pad)
>>> +		return -EINVAL;
>>> +
>>> +	if (edid->start_block)
>>> +		return -EINVAL;
>>> +
>>> +	if (edid->blocks > EDID_NUM_BLOCKS_MAX) {
>>> +		edid->blocks = EDID_NUM_BLOCKS_MAX;
>>> +		return -E2BIG;
>>> +	}
>>> +
>>> +	hdmirx_disable_irq(hdmirx_dev->dev);
>>> +
>>> +	if (!edid->blocks) {
>>> +		cec_phys_addr_invalidate(hdmirx_dev->cec->adap);
>>> +		hdmirx_dev->edid_blocks_written = 0;
>>> +
>>> +		hdmirx_dev->hpd_pull_low = true;
>>> +
>>> +		if (tx_5v_power_present(hdmirx_dev))
>>> +			hdmirx_plugout(hdmirx_dev);
>>> +		else
>>> +			hdmirx_hpd_ctrl(hdmirx_dev, false);
>>> +	} else {
>>> +		phys_addr = cec_get_edid_phys_addr(edid->edid,
>>> +						   edid->blocks * 128, NULL);
>>> +		ret = v4l2_phys_addr_validate(phys_addr, &phys_addr, NULL);
>>> +		if (ret)
>>> +			goto out;
>>> +
>>> +		if (tx_5v_power_present(hdmirx_dev))
>>> +			hdmirx_plugout(hdmirx_dev);
>>> +
>>> +		hdmirx_dev->hpd_pull_low = false;
>>> +		hdmirx_hpd_ctrl(hdmirx_dev, false);
>>> +		hdmirx_write_edid(hdmirx_dev, edid);
>>> +	}
>>> +out:
>>> +	hdmirx_enable_irq(hdmirx_dev->dev);
>>
>> The way the HPD is handled is really confusing in the code. I had to dig through
>> the driver code to discover that the HPD is enabled via hdmirx_enable_irq(). But
>> normally interrupts have nothing to do with the HPD.
>>
>> The HPD is really only controlled by whether there is an EDID or not, and optionally
>> whether 5V is high or not. The only reason for pulling the HPD low if 5V is low is
>> to save a bit of power: if nothing is connected, then there is no need to pull the HPD
>> high, after all, nobody is listening to it.
>>
>> But this is typically entirely separate from interrupts.
>>
>> The 5V decides whether there is a video source or not, so if it goes low, then you
>> stop streaming. The HPD tells the video source if there is an EDID or not. But that
>> is independent of video streaming. Updating the EDID while the source is sending
>> video shouldn't interrupt video capture. Most likely the source will detect an EDID
>> change, parse the new EDID and then it might decide to stop streaming and reconfigure,
>> or just continue streaming.
>>
>> The code feels like you are trying to be smart, when it is really just a fairly
>> dumb mechanism.
>>
>> I think this should be rewritten, unless there are some odd hardware constraints.
>> In which case that should be documented.
> 
> Thanks a lot for the clarification! The HPD logic was borrowed from the downstream driver, will try to change it for v8. I'm not aware about hardware constraints and TRM suggests that driving HPD seprately from 5v should work fine, will see how it will work in practice.
> 
> ...
>>> +static int hdmirx_g_parm(struct file *file, void *priv,
>>> +			 struct v4l2_streamparm *parm)
>>> +{
>>> +	struct hdmirx_stream *stream = video_drvdata(file);
>>> +	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
>>> +	struct v4l2_fract fps;
>>> +
>>> +	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>>> +		return -EINVAL;
>>> +
>>> +	fps = v4l2_calc_timeperframe(&hdmirx_dev->timings);
>>> +	parm->parm.capture.timeperframe.numerator = fps.numerator;
>>> +	parm->parm.capture.timeperframe.denominator = fps.denominator;
>>
>> You can just write:
>>
>> 	parm->parm.capture.timeperframe = v4l2_calc_timeperframe(&hdmirx_dev->timings);
> 
> Ack
> 
> ...
>>> +static void hdmirx_plugin(struct snps_hdmirx_dev *hdmirx_dev)
>>> +{
>>> +	hdmirx_submodule_init(hdmirx_dev);
>>> +	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED,
>>> +			   POWERPROVIDED);
>>> +	hdmirx_hpd_ctrl(hdmirx_dev, true);
>>
>> Just because the 5V appeared, it doesn't mean that the HPD should
>> go high. That depends on whether there is an EDID or not.
>>
>> As I said above, the whole 5V/HPD handling seems confused in this driver.
> 
> In v6 I added 'hpd_pull_low' variable that force-disables HPD if there is no EDID. Hence, this hdmirx_hpd_ctrl() call doesn't enable HPD without EDID. I'll remove this call in v8 if driving HPD independently from 5v status will work fine.
> 
> static void hdmirx_hpd_ctrl(struct snps_hdmirx_dev *hdmirx_dev, bool en)
> {
> ...
> 	if (hdmirx_dev->hpd_pull_low && en)
> 		return;
>         ^^^^
> 
> ...
>>> +static void hdmirx_delayed_work_res_change(struct work_struct *work)
>>> +{
>>> +	struct snps_hdmirx_dev *hdmirx_dev;
>>> +	bool plugin;
>>> +
>>> +	hdmirx_dev = container_of(work, struct snps_hdmirx_dev,
>>> +				  delayed_work_res_change.work);
>>> +
>>> +	mutex_lock(&hdmirx_dev->work_lock);
>>> +	plugin = tx_5v_power_present(hdmirx_dev);
>>> +	v4l2_dbg(1, debug, &hdmirx_dev->v4l2_dev, "%s: plugin:%d\n",
>>> +		 __func__, plugin);
>>> +	if (plugin) {
>>> +		hdmirx_interrupts_setup(hdmirx_dev, false);
>>> +		hdmirx_submodule_init(hdmirx_dev);
>>> +		hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED,
>>> +				   POWERPROVIDED);
>>> +		hdmirx_hpd_ctrl(hdmirx_dev, true);
>>> +		hdmirx_phy_config(hdmirx_dev);
>>> +
>>> +		if (hdmirx_wait_signal_lock(hdmirx_dev)) {
>>> +			hdmirx_plugout(hdmirx_dev);
>>
>> plugout() pulls the HPD low, but why? That has nothing to do with the signal lock.
>>
>> You need to take a good look at the 5V/HPD handling, this isn't right.
>>
>> Feel free to ask questions if you are not clear on how it should behave.
> 
> Again thanks a lot for the review, very appreciate! Will contact you if will become necessary.
> 

Regards,

	Hans


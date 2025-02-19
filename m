Return-Path: <linux-media+bounces-26405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25214A3C7C4
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 19:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7253ADBF1
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 18:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FA721481B;
	Wed, 19 Feb 2025 18:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="KOunV8es"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7914D286284;
	Wed, 19 Feb 2025 18:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739990202; cv=pass; b=FsauBOoVHX0kb73kQ5B2a2lfBoXjelHSk+qxHiuMg2NkRRXb5Xkg7creyjXuH/Wt8d2hOZwvDXDeh+keyeFNvhIi2OQ3/TXrE/GeoqetP/Io55gn+4Mc90nq96tRYGyEZd/KmZ5zI0zHSF/s5j1ORE7+IlnDfmKWHha0HP2hfCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739990202; c=relaxed/simple;
	bh=TsUixF9mIv/35vEeja6Bk/sYddab6SYJhgJi5S2YhrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sd/AsQUb0hucGewHjBjqx66erZfyGdDXGQNWH7zjzcYyUMzGrGEQlIqijwRtu4hnCPW4JObVLwFyGZ9xpoFg1v3wNuuvY/x6Nz0ZAvPFWfNXBgz4Bb2SZwYcvVNgihh9tyJjUC8U1mooR3sX2JoRmP71YjXvXJfVqS+dpG6Nti8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=KOunV8es; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739990144; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gYnkSY7/jVSezHnWDffS2tNP3fqZwhApKxOUK0q6i6dOUFv72iitGi1VcQLsiEjlPwv4dcJJiXf6UNyjLA7PXXIyAnsA2jJeyAbBoCMzrupFutLd7IWeE5iJVBmMXnd6q8CWtUha8EgN6EJl6fkPX1TIZZnppjp6DhLc8hw5Ols=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739990144; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tIsfIrSG8Z3x+sFuGOSs6OyFacOIgUXadmEso+KA17k=; 
	b=XgC2wxMT1phAWHbJ30TF4r2eoSbncZRC2RE8KS/xwZXFpbfmb7jN1kfk5EMECDmjXQbaq9LBvgkiEYV8hF8CIidoz+a8qSI6p9juN3HaXUsdFHUOc9yFJwYsCp2MjirCTghH2cn7wsrplGS23LEAS61alKEHFyJEerDwkQn+7x0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739990144;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tIsfIrSG8Z3x+sFuGOSs6OyFacOIgUXadmEso+KA17k=;
	b=KOunV8esVfnnMFXE3vjufoybEmlveiO6sMy+CNBOSH2/IYxmExzPNKNUYjx2Rt92
	C8snIxuIISrZZCgFE5O800gUgQxwHQNz2sfwz/PBaHaOwstqaHTTPAJPIdyybgEht36
	Bv1Sn1LqB7v+teUCxMWrY7xOpXf1v2ehaFKravvo=
Received: by mx.zohomail.com with SMTPS id 1739990142683136.66201924766733;
	Wed, 19 Feb 2025 10:35:42 -0800 (PST)
Message-ID: <3fcdbd35-9ff2-4159-8076-98eefd6ed8c7@collabora.com>
Date: Wed, 19 Feb 2025 21:35:36 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Hans Verkuil <hverkuil@xs4all.nl>,
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <f32a0011-1653-48dd-9061-047f9009310b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Hans,

Thank you very much for the review!

On 2/19/25 12:11, Hans Verkuil wrote:
> Hi Dmitry,
> 
> More review comments. Some are trivial, but the real problem is that the 5V/HPD
> handling is really confusing and, from what I can tell, incorrect in places.
> 
> I suspect that there are some misunderstandings on how this is supposed to
> work. I've tried to explain it in my comments, but feel free to contact me if
> anything is still unclear.
> 
...
>> +#define EDID_NUM_BLOCKS_MAX				2
> 
> Is this indeed the maximum number of supported EDID blocks?
> These days 4 EDID blocks is typically the maximum. If the hardware
> supports it, then I recommend implementing support for 4 EDID blocks.
> 
> If it really only supports 2 blocks, then add a comment stating that
> this is a HW limitation.

Good catch. Hardware supports 4 EDID blocks, will change in v8.

...
>> +static int hdmirx_subscribe_event(struct v4l2_fh *fh,
>> +				  const struct v4l2_event_subscription *sub)
>> +{
>> +	switch (sub->type) {
>> +	case V4L2_EVENT_SOURCE_CHANGE:
>> +		if (fh->vdev->vfl_dir == VFL_DIR_RX)
> 
> This is weird, the direction is always RX, so can't you just drop this test?

Suppose this code was copied from another driver, will drop.

...
>> +static int hdmirx_set_edid(struct file *file, void *fh, struct v4l2_edid *edid)
>> +{
>> +	struct hdmirx_stream *stream = video_drvdata(file);
>> +	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
>> +	u16 phys_addr;
>> +	int ret = 0;
>> +
>> +	if (edid->pad)
>> +		return -EINVAL;
>> +
>> +	if (edid->start_block)
>> +		return -EINVAL;
>> +
>> +	if (edid->blocks > EDID_NUM_BLOCKS_MAX) {
>> +		edid->blocks = EDID_NUM_BLOCKS_MAX;
>> +		return -E2BIG;
>> +	}
>> +
>> +	hdmirx_disable_irq(hdmirx_dev->dev);
>> +
>> +	if (!edid->blocks) {
>> +		cec_phys_addr_invalidate(hdmirx_dev->cec->adap);
>> +		hdmirx_dev->edid_blocks_written = 0;
>> +
>> +		hdmirx_dev->hpd_pull_low = true;
>> +
>> +		if (tx_5v_power_present(hdmirx_dev))
>> +			hdmirx_plugout(hdmirx_dev);
>> +		else
>> +			hdmirx_hpd_ctrl(hdmirx_dev, false);
>> +	} else {
>> +		phys_addr = cec_get_edid_phys_addr(edid->edid,
>> +						   edid->blocks * 128, NULL);
>> +		ret = v4l2_phys_addr_validate(phys_addr, &phys_addr, NULL);
>> +		if (ret)
>> +			goto out;
>> +
>> +		if (tx_5v_power_present(hdmirx_dev))
>> +			hdmirx_plugout(hdmirx_dev);
>> +
>> +		hdmirx_dev->hpd_pull_low = false;
>> +		hdmirx_hpd_ctrl(hdmirx_dev, false);
>> +		hdmirx_write_edid(hdmirx_dev, edid);
>> +	}
>> +out:
>> +	hdmirx_enable_irq(hdmirx_dev->dev);
> 
> The way the HPD is handled is really confusing in the code. I had to dig through
> the driver code to discover that the HPD is enabled via hdmirx_enable_irq(). But
> normally interrupts have nothing to do with the HPD.
> 
> The HPD is really only controlled by whether there is an EDID or not, and optionally
> whether 5V is high or not. The only reason for pulling the HPD low if 5V is low is
> to save a bit of power: if nothing is connected, then there is no need to pull the HPD
> high, after all, nobody is listening to it.
> 
> But this is typically entirely separate from interrupts.
> 
> The 5V decides whether there is a video source or not, so if it goes low, then you
> stop streaming. The HPD tells the video source if there is an EDID or not. But that
> is independent of video streaming. Updating the EDID while the source is sending
> video shouldn't interrupt video capture. Most likely the source will detect an EDID
> change, parse the new EDID and then it might decide to stop streaming and reconfigure,
> or just continue streaming.
> 
> The code feels like you are trying to be smart, when it is really just a fairly
> dumb mechanism.
> 
> I think this should be rewritten, unless there are some odd hardware constraints.
> In which case that should be documented.

Thanks a lot for the clarification! The HPD logic was borrowed from the downstream driver, will try to change it for v8. I'm not aware about hardware constraints and TRM suggests that driving HPD seprately from 5v should work fine, will see how it will work in practice.

...
>> +static int hdmirx_g_parm(struct file *file, void *priv,
>> +			 struct v4l2_streamparm *parm)
>> +{
>> +	struct hdmirx_stream *stream = video_drvdata(file);
>> +	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
>> +	struct v4l2_fract fps;
>> +
>> +	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>> +		return -EINVAL;
>> +
>> +	fps = v4l2_calc_timeperframe(&hdmirx_dev->timings);
>> +	parm->parm.capture.timeperframe.numerator = fps.numerator;
>> +	parm->parm.capture.timeperframe.denominator = fps.denominator;
> 
> You can just write:
> 
> 	parm->parm.capture.timeperframe = v4l2_calc_timeperframe(&hdmirx_dev->timings);

Ack

...
>> +static void hdmirx_plugin(struct snps_hdmirx_dev *hdmirx_dev)
>> +{
>> +	hdmirx_submodule_init(hdmirx_dev);
>> +	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED,
>> +			   POWERPROVIDED);
>> +	hdmirx_hpd_ctrl(hdmirx_dev, true);
> 
> Just because the 5V appeared, it doesn't mean that the HPD should
> go high. That depends on whether there is an EDID or not.
> 
> As I said above, the whole 5V/HPD handling seems confused in this driver.

In v6 I added 'hpd_pull_low' variable that force-disables HPD if there is no EDID. Hence, this hdmirx_hpd_ctrl() call doesn't enable HPD without EDID. I'll remove this call in v8 if driving HPD independently from 5v status will work fine.

static void hdmirx_hpd_ctrl(struct snps_hdmirx_dev *hdmirx_dev, bool en)
{
...
	if (hdmirx_dev->hpd_pull_low && en)
		return;
        ^^^^

...
>> +static void hdmirx_delayed_work_res_change(struct work_struct *work)
>> +{
>> +	struct snps_hdmirx_dev *hdmirx_dev;
>> +	bool plugin;
>> +
>> +	hdmirx_dev = container_of(work, struct snps_hdmirx_dev,
>> +				  delayed_work_res_change.work);
>> +
>> +	mutex_lock(&hdmirx_dev->work_lock);
>> +	plugin = tx_5v_power_present(hdmirx_dev);
>> +	v4l2_dbg(1, debug, &hdmirx_dev->v4l2_dev, "%s: plugin:%d\n",
>> +		 __func__, plugin);
>> +	if (plugin) {
>> +		hdmirx_interrupts_setup(hdmirx_dev, false);
>> +		hdmirx_submodule_init(hdmirx_dev);
>> +		hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED,
>> +				   POWERPROVIDED);
>> +		hdmirx_hpd_ctrl(hdmirx_dev, true);
>> +		hdmirx_phy_config(hdmirx_dev);
>> +
>> +		if (hdmirx_wait_signal_lock(hdmirx_dev)) {
>> +			hdmirx_plugout(hdmirx_dev);
> 
> plugout() pulls the HPD low, but why? That has nothing to do with the signal lock.
> 
> You need to take a good look at the 5V/HPD handling, this isn't right.
> 
> Feel free to ask questions if you are not clear on how it should behave.

Again thanks a lot for the review, very appreciate! Will contact you if will become necessary.

-- 
Best regards,
Dmitry


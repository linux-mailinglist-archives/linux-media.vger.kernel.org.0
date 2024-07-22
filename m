Return-Path: <linux-media+bounces-15235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 211EA938BA7
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 10:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6690280D81
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 08:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BA4169AC5;
	Mon, 22 Jul 2024 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tgCzFzSZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924F5182BD;
	Mon, 22 Jul 2024 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721638678; cv=none; b=SKNMaDgi+8T6iu6Sa2+3sdksJxWZfpL4Gupt4U26AuuNPbhGzxniRy+G/r3HZL2B9DXFvkrvT/WIbcY5n4g12MdT2CDUtWNKNDdtoMHlZRW+Zj3EnKAZh/qOUgKLwSanQ/9rZ+A7c473B/w5T1n3ACHOlIs9XTlA+DU6kUeSkoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721638678; c=relaxed/simple;
	bh=6ngb144Y3HqtnibA0+DkzecN3nyfkEIsKVefuUcYsK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqCBISUMbQ+mkIx36X9khENV3ixdioOpEgcusK5eblNKpBzseBc2Gkpq+/y5eXqUjIyQPz6lj23B63LmX2gR8cYY/kfLoavpyrbRlnlSY1zGgPktauGymMLGmqu+Z+R9x6S9Fl7f3g1t/MWtLvx0vVLGpkh81YqALn31ePzWw2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tgCzFzSZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-43-135.net.vodafone.it [5.90.43.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD9AB3E;
	Mon, 22 Jul 2024 10:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721638633;
	bh=6ngb144Y3HqtnibA0+DkzecN3nyfkEIsKVefuUcYsK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgCzFzSZFYqn+cUf6+sL+vtk0q2mv2GiCGVm4eB5JVd6Dzcsw1JK+Fmc+ZHKchgJT
	 gfsjQ3k7zjyaEGZm4YVPWcfOPjmiD5aSDf/yGz+CM0HZj/mu9Jtxx6hZpBae6otG3/
	 6qyMdwaYKrV7mALqBXGS0zRkZWGUg5/G6vBm1LJ4=
Date: Mon, 22 Jul 2024 10:57:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>, 
	Jayshri Pawar <jpawar@cadence.com>, Jai Luthra <j-luthra@ti.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v2 5/5] staging:
 media: starfive: Add system PM support
Message-ID: <zmuytuvsjpe4rx7oak762onncax7ko5ljfzber3dsirrpbpvne@lr7t2ultlsdk>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
 <20240718032834.53876-6-changhuang.liang@starfivetech.com>
 <ecqbazcjtzat7yxwh7uuerjrrh3umpwutiwha2zo5njmwnj25g@ocpntbuecb3z>
 <ZQ0PR01MB13020F080F8D1B024D211971F2AD2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB13020F080F8D1B024D211971F2AD2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>

Hi Changhuang

On Fri, Jul 19, 2024 at 02:08:20AM GMT, Changhuang Liang wrote:
> Hi Jacopo,
>
> Thanks for your comments.
>
> >
> > Hi Changhuang
> >
> > On Wed, Jul 17, 2024 at 08:28:34PM GMT, Changhuang Liang wrote:
> > > This patch implements system suspend and system resume operation for
> > > StarFive Camera Subsystem. It supports hibernation during streaming
> > > and restarts streaming at system resume time.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  .../staging/media/starfive/camss/stf-camss.c  | 49
> > > +++++++++++++++++++
> > >  1 file changed, 49 insertions(+)
> > >
> > > diff --git a/drivers/staging/media/starfive/camss/stf-camss.c
> > > b/drivers/staging/media/starfive/camss/stf-camss.c
> > > index fecd3e67c7a1..8dcd35aef69d 100644
> > > --- a/drivers/staging/media/starfive/camss/stf-camss.c
> > > +++ b/drivers/staging/media/starfive/camss/stf-camss.c
> > > @@ -416,10 +416,59 @@ static int __maybe_unused
> > stfcamss_runtime_resume(struct device *dev)
> > >  	return 0;
> > >  }
> > >
> > > +static int __maybe_unused stfcamss_suspend(struct device *dev) {
> > > +	struct stfcamss *stfcamss = dev_get_drvdata(dev);
> > > +	struct stfcamss_video *video;
> >
> > Can be declared inside the for loop
> >
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < STF_CAPTURE_NUM; ++i) {
> >
> > Likewise, if you like it, you can
> >
> >         for (unsigned int i...
> >
> > > +		video = &stfcamss->captures[i].video;
> > > +		if (video->vb2_q.streaming) {
> > > +			video->ops->stop_streaming(video);
> > > +			video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
> > > +		}
> > > +	}
> > > +
> > > +	return pm_runtime_force_suspend(dev); }
> > > +
> > > +static int __maybe_unused stfcamss_resume(struct device *dev) {
> > > +	struct stfcamss *stfcamss = dev_get_drvdata(dev);
> > > +	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
> > > +	struct v4l2_subdev_state *sd_state;
> > > +	struct stfcamss_video *video;
> > > +	unsigned int i;
> >
> > same here
> >
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_force_resume(dev);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to resume\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	sd_state = v4l2_subdev_lock_and_get_active_state(&isp_dev->subdev);
> > > +
> > > +	if (isp_dev->streaming)
> > > +		stf_isp_stream_on(isp_dev, sd_state);
> >
> > I was wondering if you shouldn't propagate start_streaming along the whole
> > pipline, but I presume the connected subdevs have to handle resuming
> > streaming after a system resume themselves ?
> >
>
> Currently our Camera subsystem contains ISP subdev , capture_raw video device, and capture_yuv
> video device. So you can see only one system PM hook can be used by them.
>

Sorry, maybe I was not clear (and I was probably confused as well).

You are right this is the main entry point for system sleep PM hooks

> >
> > > +
> > > +	v4l2_subdev_unlock_state(sd_state);
> > > +
> > > +	for (i = 0; i < STF_CAPTURE_NUM; ++i) {
> > > +		video = &stfcamss->captures[i].video;
> > > +		if (video->vb2_q.streaming)
> > > +			video->ops->start_streaming(video);

And here you propagate the start_streaming (and stop_streaming on
suspend) call to all your video devices.

I see your video devices propagating the s_stream call to their
'source_subdev'. And your ISP subdev doing the same in
'isp_set_stream()'.

According to the media graph in
Documentation/admin-guide/media/starfive_camss_graph.dot

your 'capture_yuv' video device is connected to your ISP, and your
'capture_raw' video device is connected to your 'CSI-RX' subdev.

If my understanding is correct, your CSI-RX subdev will receive 2
calls to s_stream() (one from the ISP subdev and one from the
'capture_raw' video device). Am I mistaken maybe ?

Also, if the CSI-RX subdev is already part of a capture pipeline, as
Tomi pointed out in his review of patch [2/5] it doesn't need to
implement handlers for system suspend/resume.


> >
> > You can use vb2_is_streaming() maybe.

I was suggesting to use vb2_is_streaming() instead of openly code

		if (video->vb2_q.streaming)

> > If the queue is streaming, do you need to keep a 'streaming' flag for the isp ?
> > Probably yes, as the ISP subdev is used by several video nodes ?
> >
>
> I set the "streaming" flag in PATCH 4, so it does not affect that even if several video
> nodes use it.

Yeah I was wondering if you could have saved manually tracking the
streaming state in the isp (re-reading the patches, where do you
actually use the 'streaming' flag in the ISP subdev ?) by tracking the
vb2_queue state.

>
> Regards,
> Changhuang


Return-Path: <linux-media+bounces-15240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D2938E06
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 13:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F2711C2126E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 11:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEDE16CD1B;
	Mon, 22 Jul 2024 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XvuyBPhI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CB116C69D;
	Mon, 22 Jul 2024 11:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721647562; cv=none; b=n6GIQ0hZPVUwNKT9lluxeTb3X6PhMuLJ2eDWysCsow4Ns3enbUq8eO2fyRcwF1GEGcXRpXVvIuqSmRUbUFzLQ+UZdj+P0lBPZa2PBjnEMClxSVlwEVFETLDC8EdrBIvhqAyDyvwr+LyjAi+9LJ2HdQG+upO6Sm7RXf1wLWTx7jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721647562; c=relaxed/simple;
	bh=MB26KXWxNanSmGZFVaZDqQIkIwxfNASL/DNTvnlXroQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueCJGvde/AnT3vIKFypW1ZEpWPcRfXSvZB82ERnYCub3h6rRQlMTjkd/I/hGDoXbyaHmkcyct8YbWcZjZb7PyCP5KzlrX4OgWokzocukOfq8FfWtty33lGm/xEA7dhA36O7Kr1Disln4hz37JbEjMNm+3432/YmVqF92ErdEsbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XvuyBPhI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2A222B3;
	Mon, 22 Jul 2024 13:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721647517;
	bh=MB26KXWxNanSmGZFVaZDqQIkIwxfNASL/DNTvnlXroQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XvuyBPhIKcyQxth9P4xpMJ5UryjqhxRE1uinLDv8IY+Fv78xXlfgB6kyQTCqJm9vn
	 +j4/7YHC4Vvz7grrITzOj58nAzykfg8IqlgxoN0RxnTw7B4YFZ6inKPODGO2LZzF8k
	 FEUjE0naCO3qjE9QSKlrtXs7d7bs/6E+pAzSsLmw=
Date: Mon, 22 Jul 2024 14:25:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Jayshri Pawar <jpawar@cadence.com>, Jai Luthra <j-luthra@ti.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v2 2/5] media:
 cadence: csi2rx: Add system PM support
Message-ID: <20240722112541.GD13497@pendragon.ideasonboard.com>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
 <20240718032834.53876-3-changhuang.liang@starfivetech.com>
 <26af0977-8e38-47d0-a521-c5b1e505d564@ideasonboard.com>
 <ZQ0PR01MB13024828274542F14E89AD58F2A82@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <416ec496-a224-47d0-b092-6976aa039318@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <416ec496-a224-47d0-b092-6976aa039318@ideasonboard.com>

On Mon, Jul 22, 2024 at 11:53:02AM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 22/07/2024 05:17, Changhuang Liang wrote:
> > Hi, Tomi
> > 
> >> Hi,
> >>
> >> On 18/07/2024 06:28, Changhuang Liang wrote:
> >>> Add system PM support make it stopping streaming at system suspend
> >>> time, and restarting streaming at system resume time.
> >>>
> >>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> >>> ---
> >>>    drivers/media/platform/cadence/cdns-csi2rx.c | 32
> >> ++++++++++++++++++++
> >>>    1 file changed, 32 insertions(+)
> >>>
> >>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c
> >>> b/drivers/media/platform/cadence/cdns-csi2rx.c
> >>> index 981819adbb3a..81e90b31e9f8 100644
> >>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> >>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> >>> @@ -776,8 +776,40 @@ static int csi2rx_runtime_resume(struct device
> >> *dev)
> >>>    	return ret;
> >>>    }
> >>>
> >>> +static int __maybe_unused csi2rx_suspend(struct device *dev) {
> >>> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> >>> +
> >>> +	mutex_lock(&csi2rx->lock);
> >>> +	if (csi2rx->count)
> >>> +		csi2rx_stop(csi2rx);
> >>> +	mutex_unlock(&csi2rx->lock);
> >>> +
> >>> +	pm_runtime_force_suspend(dev);
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +static int __maybe_unused csi2rx_resume(struct device *dev) {
> >>> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> >>> +	int ret;
> >>> +
> >>> +	ret = pm_runtime_force_resume(dev);
> >>> +	if (ret < 0)
> >>> +		return ret;
> >>> +
> >>> +	mutex_lock(&csi2rx->lock);
> >>> +	if (csi2rx->count)
> >>> +		csi2rx_start(csi2rx);
> >>> +	mutex_unlock(&csi2rx->lock);
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>>    static const struct dev_pm_ops csi2rx_pm_ops = {
> >>>    	SET_RUNTIME_PM_OPS(csi2rx_runtime_suspend,
> >> csi2rx_runtime_resume,
> >>> NULL)
> >>> +	SET_SYSTEM_SLEEP_PM_OPS(csi2rx_suspend, csi2rx_resume)
> >>>    };
> >>>
> >>>    static const struct of_device_id csi2rx_of_table[] = {
> >>
> >> If I'm not mistaken, this is a subdev driver, and is somewhere in the middle of
> >> the pipeline. Afaiu, only the driver that handles the v4l2 video devices should
> >> have system suspend hooks. The job of that driver is then to disable or enable
> >> the pipeline using v4l2 functions, and for the rest of the pipeline system
> >> suspend looks just like a normal pipeline disable.
> >>
> > 
> > I see that the imx219 has a commit:
> > 
> > commit b8074db07429b845b805416d261b502f814a80fe
> > Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Date:   Thu Sep 14 21:16:49 2023 +0300
> > 
> >      media: i2c: imx219: Drop system suspend and resume handlers
> > 
> >      Stopping streaming on a camera pipeline at system suspend time, and
> >      restarting it at system resume time, requires coordinated action between
> >      the bridge driver and the camera sensor driver. This is handled by the
> >      bridge driver calling the sensor's .s_stream() handler at system suspend
> >      and resume time. There is thus no need for the sensor to independently
> >      implement system sleep PM operations. Drop them.
> > 
> >      The streaming field of the driver's private structure is now unused,
> >      drop it as well.
> > 
> >      Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >      Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >      Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >      Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > 
> > Implement the system PM of sensor using bridge. This csi2rx is also a bridge.
> > So I add system PM in this driver.
> 
> It is not a bridge in the sense that the commit message means. The 
> system suspend should be handled in the last (or first, depending on 
> which way you think about it) driver in the pipeline, the one that 
> handles the VIDIOC_STREAMON.

That's right. Suspending/resuming a running camera pipeline is a complex
operation that requires careful sequencing. For instance, if you resume
a MIPI CSI-2 camera sensor before the CSI-2 receiver, it will switch its
clock and data lanes to HS mode before the CSI-2 receiver is ready to
synchronize.

These sequencing requirements are already handled at VIDIOC_STREAMON and
VIDIOC_STREAMOFF time. That's why we leverage that code for the
suspend/resume implementation, the "main" driver that handles the video
nodes and implements stream start/stop has to stop the pipeline at
suspend time and restart it at resume time. Drivers for components along
the pipeline will then see their .s_stream() operation being called, as
done when starting/stopping the pipeline normally. They don't have to
implement anything specific related to pipeline stop/start in their
system suspend/resume handlers.

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-15940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3563A94ACC2
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 17:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4517BB2B387
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 15:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3943784A31;
	Wed,  7 Aug 2024 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UES/YOVf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0C079949;
	Wed,  7 Aug 2024 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723044056; cv=none; b=CqrSOkjdn01nhCcnUG2Y1gA5MAFeVN9Wk/JCedFevtBYJS1SxbkmXRdkkrQlEjwvCSMTPVOvBLdyUl7XkfYps2Gqgn3uxBMIeIELGHFQCzUUpWx+/SBKj/NtGj48OZaWHAwp/PcbdQvqnNax940J/WmgRgnTSI7T2vN1jS/Zk04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723044056; c=relaxed/simple;
	bh=W21qXUGI24TuhC78WlGUMYCFeu9yFRSWaPh4zZaK2As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpSW5Z8+BJoAFz7CnZFHbu2rOQf1BMDBjkvlolVh8l0Fy9VUmkniPjVLr36LkbHbA2bsBfWkKVNfW7IP4LXSwoDJw4jxacoSQ22KKZvKmutuL35Y9EERWXPAMVVj+t9HouhdOiSc7vlbvNYxxSluMLFouRRV4sm5B/+7F6dZb9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UES/YOVf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBC2A6AF;
	Wed,  7 Aug 2024 17:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723044000;
	bh=W21qXUGI24TuhC78WlGUMYCFeu9yFRSWaPh4zZaK2As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UES/YOVf7zcHAEx57eOgp1Ve1BbRtTr4TjOaf1PVu1DuCtTYvubMsNJIZBTFHWl2i
	 j5966Oo0bzHtKtl4XzwxfUAS2npUt5blSgTBO7TKrTNIKycsTj2Mq44AV+eiuti1V+
	 x+Id6hwIXXi1KQXZSezjkv21PmZpv+rLW+K/4m9k=
Date: Wed, 7 Aug 2024 18:20:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Message-ID: <20240807152027.GC18695@pendragon.ideasonboard.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
 <6a7467cde347600015078fe7aa25c4b46c45e96d.camel@mediatek.com>
 <20240731082958.GM8146@pendragon.ideasonboard.com>
 <289ea20cb549f8fd76343776bf2a0871a33d4068.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <289ea20cb549f8fd76343776bf2a0871a33d4068.camel@mediatek.com>

Hi CK,

On Wed, Aug 07, 2024 at 01:31:57AM +0000, CK Hu (胡俊光) wrote:
> On Wed, 2024-07-31 at 11:29 +0300, Laurent Pinchart wrote:
> > On Wed, Jul 31, 2024 at 02:59:51AM +0000, CK Hu (胡俊光) wrote:
> > > On Mon, 2024-07-29 at 16:48 +0200, Julien Stephan wrote:
> > > >  From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > >
> > > > This driver provides a path to bypass the SoC ISP so that image data
> > > > coming from the SENINF can go directly into memory without any image
> > > > processing. This allows the use of an external ISP.
> > > >
> > > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > > [Paul Elder fix irq locking]
> > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > ---
> > >
> > > [snip]
> > >
> > > > +
> > > > +static void mtk_cam_cmos_vf_enable(struct mtk_cam_dev *cam_dev,
> > > > +   bool enable, bool pak_en)
> > > > +{
> > > > +struct device *dev = cam_dev->dev;
> > > > +
> > > > +if (pm_runtime_get_sync(dev) < 0) {
> > > > +dev_err(dev, "failed to get pm_runtime\n");
> > > > +goto out;
> > > > +}
> > > > +
> > > > +if (enable)
> > > > +cam_dev->hw_functions->mtk_cam_cmos_vf_hw_enable(cam_dev);
> > >
> > > Directly call mtk_camsv30_cmos_vf_hw_enable().
> >
> > The goal, when this was developed, was to support multiple generations
> > of hardware with a single driver. I think it's a worthwhile goal, but at
> > the same time, I'm not sure that will ever happen as I'm not aware of
> > plans to upstream Genio 350 and 500 support (which is a bad sad, as it's
> > more or less working out-of-tree). I'm thus fine either way, and if we
> > think the most likely outcome is that this driver will only support
> > Genio 300, I'm fine dropping the abstraction layer.
> 
> I know this goal.
> For the mtk_camsv_30_setup(), in new SoC, if only one line in this function is different,
> should we duplicate the whole function and modify only one line?
> I think we don't know what would happen in future,
> so we should not design for something which we have no any information.

For future platforms, I fully agree with you. For Genio 350 and 500 we
have already identified some common elements. However, as there's no
point to upstream those at the moment, and as we can't review an
abstraction layer properly if support for only a single platform is
available, I'm fine dropping the abstraction.

> > > > +else
> > > > +cam_dev->hw_functions->mtk_cam_cmos_vf_hw_disable(cam_dev);
> > >
> > > Directly call mtk_camsv30_cmos_vf_hw_disable().
> > >
> > > > +
> > > > +out:
> > > > +pm_runtime_put_autosuspend(dev);
> > > > +}
> > > > +

-- 
Regards,

Laurent Pinchart


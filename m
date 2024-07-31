Return-Path: <linux-media+bounces-15622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C894292E
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 10:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4179F1C21A32
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 08:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854A11B7F4;
	Wed, 31 Jul 2024 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cRDIygWW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C211A8BEB;
	Wed, 31 Jul 2024 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722414623; cv=none; b=PIGA8wUOJHrLNoYuAaLA53Ba0fx9Hos+SXjOoqUL5HcPhiTcpy/Ps0O3d3bH4ObY9tqUlpzbx1UHl4S1zt8TQUeHPsHYvAPM79RE/RLxMdA9cPN2I/kCAUksz5ioCghsKvIArG1IxhoslMAgyMZPwmf/1C8fJ2QOBP5nBWzsf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722414623; c=relaxed/simple;
	bh=pjw/UlZpX9tFuIUC4j7+LvlinTu1b35XlaxhKH1fHqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvkp9zfkub5ba7e1NsSGPuos7Fz8gs/ftLXxURPzA8/xDxvtZmDZay4LKvEwX3SH3KxYzYqWi4Jszxwk1S5Dr6WJnANnEvZ68z2MST92SWqbF9rAiDXkV08hVD3HJg4cYROfj5Bnw7L8dEDEjPcT+bB7p8G/yR8qobqYAEpd7p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cRDIygWW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61D527E4;
	Wed, 31 Jul 2024 10:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722414571;
	bh=pjw/UlZpX9tFuIUC4j7+LvlinTu1b35XlaxhKH1fHqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRDIygWWqC6vaEQRZBb28o6at6wEtrrWEUJ4QwiDEn7WmDD+3T4tZGivw207OGM39
	 0HJAABhxW8BfhBQ4r+WGCwI96gUYTL6SgnAEyljLrjNPw1s+pQxMEaG0D9JKvYvPc/
	 TzHaCvbqEYDICyL1i4392/aZtvtO3BKnPcKa7iK4=
Date: Wed, 31 Jul 2024 11:29:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Message-ID: <20240731082958.GM8146@pendragon.ideasonboard.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
 <6a7467cde347600015078fe7aa25c4b46c45e96d.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a7467cde347600015078fe7aa25c4b46c45e96d.camel@mediatek.com>

Hi CK,

On Wed, Jul 31, 2024 at 02:59:51AM +0000, CK Hu (胡俊光) wrote:
> On Mon, 2024-07-29 at 16:48 +0200, Julien Stephan wrote:
> >  From: Phi-bang Nguyen <pnguyen@baylibre.com>
> >
> > This driver provides a path to bypass the SoC ISP so that image data
> > coming from the SENINF can go directly into memory without any image
> > processing. This allows the use of an external ISP.
> >
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > [Paul Elder fix irq locking]
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> 
> [snip]
> 
> > +
> > +static void mtk_cam_cmos_vf_enable(struct mtk_cam_dev *cam_dev,
> > +   bool enable, bool pak_en)
> > +{
> > +struct device *dev = cam_dev->dev;
> > +
> > +if (pm_runtime_get_sync(dev) < 0) {
> > +dev_err(dev, "failed to get pm_runtime\n");
> > +goto out;
> > +}
> > +
> > +if (enable)
> > +cam_dev->hw_functions->mtk_cam_cmos_vf_hw_enable(cam_dev);
> 
> Directly call mtk_camsv30_cmos_vf_hw_enable().

The goal, when this was developed, was to support multiple generations
of hardware with a single driver. I think it's a worthwhile goal, but at
the same time, I'm not sure that will ever happen as I'm not aware of
plans to upstream Genio 350 and 500 support (which is a bad sad, as it's
more or less working out-of-tree). I'm thus fine either way, and if we
think the most likely outcome is that this driver will only support
Genio 300, I'm fine dropping the abstraction layer.

> > +else
> > +cam_dev->hw_functions->mtk_cam_cmos_vf_hw_disable(cam_dev);
> 
> Directly call mtk_camsv30_cmos_vf_hw_disable().
> 
> > +
> > +out:
> > +pm_runtime_put_autosuspend(dev);
> > +}
> > +

-- 
Regards,

Laurent Pinchart


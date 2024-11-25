Return-Path: <linux-media+bounces-21955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EFC9D82FA
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BA25B261A7
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA28192B99;
	Mon, 25 Nov 2024 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ViisyC8Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5262119258E;
	Mon, 25 Nov 2024 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732527607; cv=none; b=ZGScIc/mvd+o6Ihq2tSczUHO8Kks9JlcKR2nU0jlW3ZOEA+pSWMtOsYYiGBJlJvjZ81ogT48tBPnLD1RdMcPkAeRzdE15b7QsrtjdVu1oJ8vsUAmf1gZZs1QbCAIp4lSp7Pw5Cw8N9ZBn0oGEIXl+fro1M+Q0giuBXJadES+yGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732527607; c=relaxed/simple;
	bh=fjvHCtsrcUmA++YpYkQVAoscDYRnPiL5YwSB8toYJko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8sfqdSf9QzWkCZbOxq/MDxzg1QfZ/Xnu54/B47xTaIIaBTZqoCpRoF2YJ7lvTgCWBb6t8/WjYux09dFSqwCcvealxgxMBRJs41xhyR2Z+Fy026SmKCixS6ZWYRIupQ82JLAPgmroznHkGplYel2zaXzgdfYvxR20KXLaPyeQmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ViisyC8Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63C924AD;
	Mon, 25 Nov 2024 10:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732527581;
	bh=fjvHCtsrcUmA++YpYkQVAoscDYRnPiL5YwSB8toYJko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ViisyC8QDyeKlOdGMoyCDkkUz9lS2mUe7RDbQolPD0vVgAwat79kxKWiZ0y+sV7yY
	 a8Cxznb39RqLQ7SllZskTPC3A3U3DbaDDeRwJTzfr6t+Vnlh+Oqch9RH39Y+X51wiu
	 zNFm6iD3tPTyMW8JbNn0OrO5dLB33347M0i0Y1no=
Date: Mon, 25 Nov 2024 11:39:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	Julien Stephan <jstephan@baylibre.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Message-ID: <20241125093953.GM19381@pendragon.ideasonboard.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <a9aa69dc8d025f0b133f33de6428ffec5a881a2a.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9aa69dc8d025f0b133f33de6428ffec5a881a2a.camel@mediatek.com>

On Mon, Nov 25, 2024 at 06:59:59AM +0000, CK Hu (胡俊光) wrote:
> Hi, Julien:
> 
> On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> >
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
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
> > +static const struct mtk_cam_conf camsv30_conf = {
> > +       .tg_sen_mode = 0x00010002U, /* TIME_STP_EN = 1. DBL_DATA_BUS = 1 */
> > +       .module_en = 0x40000001U, /* enable double buffer and TG */
> > +       .imgo_con = 0x80000080U, /* DMA FIFO depth and burst */
> > +       .imgo_con2 = 0x00020002U, /* DMA priority */
> 
> Now support only one SoC, so it's not necessary make these SoC variable.
> They could be constant symbol now.

This I would keep as a mtk_cam_conf structure instance, as I think it
makes it clear what we consider to be model-specific without hindering
readability. I don't have a very strong opinion though.

> > +};
> > +

-- 
Regards,

Laurent Pinchart


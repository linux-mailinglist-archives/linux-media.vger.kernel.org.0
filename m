Return-Path: <linux-media+bounces-21963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B639D8345
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6ACF1619B5
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C928192589;
	Mon, 25 Nov 2024 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cC2d+P8e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF87418755C;
	Mon, 25 Nov 2024 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732530184; cv=none; b=agR6UlZoM1a3xnPXU5jBK5MXkHzmctyE5ZnG+V3sgQLuhGDziuyOBl9a24Z9p8eq7FI2IkBzWCYNX28eq1/O7AShUwsE8H1cuz42pDpOhXr40ei7v6sRwzHZT1z79IdB0F09kLjDYirXRU/uFsAinF8FXFtM+H7BckSMnTgZA6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732530184; c=relaxed/simple;
	bh=vEktPLBDDcD6K+Ywf5tGYAWq1SEiHS7jR7yItctdw1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbR5qBBWwkrFeEXoOh7AfovYS1p66riDkVCViYUChhuTbmtwpOWGhK/ECP5zlgyd2plBZx82KbxYMekbGoog2eHzSwMs5bCHltXJl3hLv72fMv/WSY8ArjRQrJWxf5iNlYfBwzx1lClxQRgZPLuqAVkPeY1WGk2NVWU1yDb+g3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cC2d+P8e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F03B86B5;
	Mon, 25 Nov 2024 11:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732530159;
	bh=vEktPLBDDcD6K+Ywf5tGYAWq1SEiHS7jR7yItctdw1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cC2d+P8eBtYJZnAFLVQwSXuk8HKXOpxgMwPY3VYIEmgd0pcostPigM1+qqL0vGtSa
	 KNo4PJzzSIzAaHge+E16wTllKnKDapBMN1EneVGXxdNsoStd9TdJ2eFk+0zoSCFRZr
	 wFMwWgFkKmZk8BTGHVEbLVgwjsAIIoWnoY+ia/3o=
Date: Mon, 25 Nov 2024 12:22:50 +0200
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
	Julien Stephan <jstephan@baylibre.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Message-ID: <20241125102250.GO19381@pendragon.ideasonboard.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <a9aa69dc8d025f0b133f33de6428ffec5a881a2a.camel@mediatek.com>
 <20241125093953.GM19381@pendragon.ideasonboard.com>
 <25f70693c81eb86c832378fee89792f6754b7ca0.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25f70693c81eb86c832378fee89792f6754b7ca0.camel@mediatek.com>

On Mon, Nov 25, 2024 at 09:56:54AM +0000, CK Hu (胡俊光) wrote:
> On Mon, 2024-11-25 at 11:39 +0200, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 06:59:59AM +0000, CK Hu (胡俊光) wrote:
> > > On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > > >
> > > > From: Phi-bang Nguyen <pnguyen@baylibre.com>
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
> > > > +static const struct mtk_cam_conf camsv30_conf = {
> > > > +       .tg_sen_mode = 0x00010002U, /* TIME_STP_EN = 1. DBL_DATA_BUS = 1 */
> > > > +       .module_en = 0x40000001U, /* enable double buffer and TG */
> > > > +       .imgo_con = 0x80000080U, /* DMA FIFO depth and burst */
> > > > +       .imgo_con2 = 0x00020002U, /* DMA priority */
> > >
> > > Now support only one SoC, so it's not necessary make these SoC variable.
> > > They could be constant symbol now.
> >
> > This I would keep as a mtk_cam_conf structure instance, as I think it
> > makes it clear what we consider to be model-specific without hindering
> > readability. I don't have a very strong opinion though.
> 
> If this is a configuration table, I would like it to be
> 
> {
> .time_stp_en = true;
> .dbl_data_bus = 1;
> .double_buffer_en = true;
> .tg = 0x4;
> ...
> }

I like that too, it's more readable than raw register values.

> If next SoC has only one parameter is different, we duplicate all
> other parameter?

That's what we usually do when the amount of parameters is not too
large. When it becomes larger, we sometimes split the configuration data
in multiple chunks. For instance,

static const char * const family_a_clks[] = {
	"core",
	"io",
};

static sont char * const family_b_clks[] = {
	"main",
	"ram",
	"bus",
};

static const foo_dev_info soc_1_info = {
	.has_time_machine = false,
	.clks = family_a_clks,
	.num_clks = ARRAY_SIZE(family_a_clks),
};

static const foo_dev_info soc_2_info = {
	.has_time_machine = false,
	.clks = family_b_clks,
	.num_clks = ARRAY_SIZE(family_b_clks),
};

static const foo_dev_info soc_3_info = {
	.has_time_machine = true,
	.clks = family_b_clks,
	.num_clks = ARRAY_SIZE(family_b_clks),
};

There's no clear rule, it's on a case-by-case basis.

> > > > +};
> > > > +

-- 
Regards,

Laurent Pinchart


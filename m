Return-Path: <linux-media+bounces-22068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C72829D9380
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 09:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53D06B25C7C
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 08:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD57D1B4122;
	Tue, 26 Nov 2024 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BCiDhwyd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA5619340F;
	Tue, 26 Nov 2024 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732610629; cv=none; b=jm3m56HXH+nLkwSVZusdo8caZokrzY+63zY55FNQS0R2FYjE0oqTc/BSBFg094l/xgjK3ZalSP1dg0iymi3GojRiIHW98R2nnTHANtTcexZEYvl9y/j9SxjdXM0q9qffhopCOlDQOGYO0bezcH8/kfezLNxtFZ/DGl0hGOf4BeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732610629; c=relaxed/simple;
	bh=HuVyRClXhaSM8ZVR7Ab7Zv4aE1vJq8Al5X5SpC1lklE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNHE78gQ4Jx0Frfvs4bxCh36IeMEoqLVkkmOZVK1FEem+WW6+VcT9vQ0rJlCSUqxkB1/0QaO2CpNTOXKALFtys6omwxq6YTivzS2gkS5dEtbNRA4MNuzo+Rr8FTd7k1QCzNdObWHviPaKOFBrws3I1IwFODbOd0/WJ3woNRdaYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BCiDhwyd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D3C46BE;
	Tue, 26 Nov 2024 09:43:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732610603;
	bh=HuVyRClXhaSM8ZVR7Ab7Zv4aE1vJq8Al5X5SpC1lklE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BCiDhwyd7bsawseyl+EETONYSAC2fM3pjjuVWJLYNtZCHfXtpItr347dxf5EVG4rE
	 c0R32mk/65WqbkxhWjivJ9bI4oC1xYIOz4cm2IWlstsn7v+XUtkmqHMEfoKpALBLJU
	 ub61xODGZOIdPauVVzMqh4mHH458PjpRW/UlBycU=
Date: Tue, 26 Nov 2024 10:43:36 +0200
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
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Message-ID: <20241126084336.GC19381@pendragon.ideasonboard.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <0e14e1d92be90c838ab097268a3674b38d48e51a.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e14e1d92be90c838ab097268a3674b38d48e51a.camel@mediatek.com>

On Tue, Nov 26, 2024 at 02:07:35AM +0000, CK Hu (胡俊光) wrote:
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
> > +static const u32 mtk_cam_mbus_formats[] = {
> > +       MEDIA_BUS_FMT_SBGGR8_1X8,
> > +       MEDIA_BUS_FMT_SGBRG8_1X8,
> > +       MEDIA_BUS_FMT_SGRBG8_1X8,
> > +       MEDIA_BUS_FMT_SRGGB8_1X8,
> > +       MEDIA_BUS_FMT_SBGGR10_1X10,
> > +       MEDIA_BUS_FMT_SGBRG10_1X10,
> > +       MEDIA_BUS_FMT_SGRBG10_1X10,
> > +       MEDIA_BUS_FMT_SRGGB10_1X10,
> > +       MEDIA_BUS_FMT_SBGGR12_1X12,
> > +       MEDIA_BUS_FMT_SGBRG12_1X12,
> > +       MEDIA_BUS_FMT_SGRBG12_1X12,
> > +       MEDIA_BUS_FMT_SRGGB12_1X12,
> > +       MEDIA_BUS_FMT_UYVY8_1X16,
> > +       MEDIA_BUS_FMT_VYUY8_1X16,
> > +       MEDIA_BUS_FMT_YUYV8_1X16,
> > +       MEDIA_BUS_FMT_YVYU8_1X16,
> > +};
> > +
> 
> Format in mtk_cam_mbus_formats[] is more than mtk_cam_format_info[].
> I would like these two to be consistent.
> Reduce mtk_cam_mbus_formats[] or enlarge mtk_cam_format_info[].
> Once these two are consistent, they could be merged into one array.

And the array could then be extended with fields to replace the
fmt_to_sparams() function.

> > +static const struct mtk_cam_format_info mtk_cam_format_info[] = {
> > +       {
> > +               .fourcc = V4L2_PIX_FMT_SBGGR8,
> > +               .code = MEDIA_BUS_FMT_SBGGR8_1X8,
> > +               .bpp = 8,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_SGBRG8,
> > +               .code = MEDIA_BUS_FMT_SGBRG8_1X8,
> > +               .bpp = 8,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_SGRBG8,
> > +               .code = MEDIA_BUS_FMT_SGRBG8_1X8,
> > +               .bpp = 8,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_SRGGB8,
> > +               .code = MEDIA_BUS_FMT_SRGGB8_1X8,
> > +               .bpp = 8,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_YUYV,
> > +               .code = MEDIA_BUS_FMT_YUYV8_1X16,
> > +               .bpp = 16,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_YVYU,
> > +               .code = MEDIA_BUS_FMT_YVYU8_1X16,
> > +               .bpp = 16,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_UYVY,
> > +               .code = MEDIA_BUS_FMT_UYVY8_1X16,
> > +               .bpp = 16,
> > +       }, {
> > +               .fourcc = V4L2_PIX_FMT_VYUY,
> > +               .code = MEDIA_BUS_FMT_VYUY8_1X16,
> > +               .bpp = 16,
> > +       },
> > +};
> > +

-- 
Regards,

Laurent Pinchart


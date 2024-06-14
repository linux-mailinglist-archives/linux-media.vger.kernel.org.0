Return-Path: <linux-media+bounces-13272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CAC908DB3
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 16:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B04FC288C52
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 14:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4B8182A0;
	Fri, 14 Jun 2024 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JX0T1pnH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E317BB6;
	Fri, 14 Jun 2024 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718376193; cv=none; b=kyYmCMWYbGofiNZBo1srCBOmjVVANAJttp1OwHtAPx0bqQJG8tkFi0M9glx24MLqifLEmR3I09V/OfDIor275ua7wz6em75XqRIjmgk/VunegrBoietKM1/62Obw2Jr1j9xeBixj53dT1H0uEAXTYWAdKB+x8kM58gHYyGPVieI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718376193; c=relaxed/simple;
	bh=2Mm4o+0/5Q+FxRwCZ5j72NsmFJaPx4lp4liZ9IiL+B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HP0p8EQnWrabq+HPCJFOTF6BLIlr5w8xZdvSvsHUFDdtlcR9blA98Rf9I/L0C3Gvz9Qcmex+dKQFoP4dtU+1vohOLEpbxBM528AZg2THA1uZ9R9533h6ZeBTsK2fl7QtJSRhvc87i85Xs+I2LJAfg8q1qIEUh765qKakBfJgglA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JX0T1pnH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 577FF2E0;
	Fri, 14 Jun 2024 16:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718376174;
	bh=2Mm4o+0/5Q+FxRwCZ5j72NsmFJaPx4lp4liZ9IiL+B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JX0T1pnHQTq1dT3dHjsdQJWX9axFEh0RCtT/qRXDMIK0zdDry4iAYraihPEa31OA4
	 jCEEHsL4kg5r97DlJx2XokbFqZFjelM1lsINw1FIAVHkPDp4uCOUSyJ+DWgFNsd0Xq
	 0q+oPotxXSCbUSmLfOmdYJopWwIl1/px6WH4DdUU=
Date: Fri, 14 Jun 2024 17:42:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Message-ID: <20240614144248.GA20136@pendragon.ideasonboard.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-4-jstephan@baylibre.com>
 <3c2bee40-3792-409c-b42f-f8b013ff641c@collabora.com>
 <CAEHHSvaT_U+HNzWQUoK9EuqGuqEd11+Lu0CLz_rL7uQf0Q5isw@mail.gmail.com>
 <53838e76-bfa4-41f5-a015-a37472e98991@collabora.com>
 <CAEHHSvaRqZM9c8oD05WKkhOHdjKLBkR6tXp2Q1b8OMiDxDsDhQ@mail.gmail.com>
 <20240614123345.GN6019@pendragon.ideasonboard.com>
 <CAEHHSvaWO7m=n5_f0BM7gwuDMfh_GMX=x3DknG28PnmtZbrGQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvaWO7m=n5_f0BM7gwuDMfh_GMX=x3DknG28PnmtZbrGQw@mail.gmail.com>

Hi Julien,

On Fri, Jun 14, 2024 at 04:14:52PM +0200, Julien Stephan wrote:
> Le ven. 14 juin 2024 à 14:34, Laurent Pinchart a écrit :
> > On Fri, Jun 14, 2024 at 12:38:15PM +0200, Julien Stephan wrote:
> > > Le mer. 12 juin 2024 à 10:06, AngeloGioacchino Del Regno a écrit :
> > > >
> > > > Il 10/06/24 16:39, Julien Stephan ha scritto:
> > > [...]
> > > > >>
> > > > >>> +     writel(0x10001, input->base + SENINF_TG1_SEN_CK);
> > > > >>
> > > > >> Unroll this one... this is the TG1 sensor clock divider.
> > > > >>
> > > > >> CLKFL GENMASK(5, 0)
> > > > >> CLKRS GENMASK(13, 8)
> > > > >> CLKCNT GENMASK(21,16)
> > > > >>
> > > > >> Like this, I don't get what you're trying to set, because you're using a fixed
> > > > >> sensor clock rate, meaning that only a handful of camera sensors will be usable.
> > > > >>
> > > > >> Is this 8Mhz? 16? 24? what? :-)
> > > > >>
> > > > >> Two hints:
> > > > >>    - sensor_clk = clk_get_rate(isp_clk) / (tg1_sen_ck_clkcnt + 1);
> > > > >>    - int mtk_seninf_set_sensor_clk(u8 rate_mhz);
> > > > >>
> > > > >> Please :-)
> > > > >
> > > > > Hi Angelo,
> > > > >
> > > > > I think I get your point about not hardcoding the sensor rate, but I
> > > > > am not sure how to use
> > > > > a mtk_seninf_set_sensor_clk(u8 rate_mhz); function.
> > > > >
> > > > > Where would it be called? How is it exposed to the user?
> > > > >
> > > >
> > > > As for where: setup, streaming start, resolution change (which may be covered
> > > > by streaming start anyway, as a change should be calling stop->start anyway).
> > > >
> > > > And for the how is it exposed to the user - well, depends what you mean for user,
> > > > but it's all standard V4L2 API :-)
> > > >
> > > > Last but not least, I can give you another hint....
> > > >
> > > > struct media_entity *entity = (something_here);
> > > > struct media_pad *mpad;
> > > > struct v4l2_subdev *cam_subdev;
> > > > struct v4l2_ctrl *ctl;
> > > > s64 link_frequency, pixel_clock;
> > > >
> > > > if (entity->pads[0].flags & MEDIA_PAD_FL_SINK)
> > > >     return -E_NOT_A_CAMERA_SENSOR_WE_IGNORE_THIS_ONE;
> > > >
> > > > pad = media_pad_remote_pad_first(&entity->pads[0]);
> > > > if (!pad)
> > > >    return -ENOENT;
> > > >
> > > > if (!is_media_entity_v4l2_subdev(pad->entity))
> > > >    return -ENOENT;
> > > >
> > > > if (pad->entity->function != MEDIA_ENT_F_CAM_SENSOR)
> > > >    return -ENOENT;
> > > >
> > >
> > > Hi Angelo,
> > >
> > > Thank you for the detailed explanation :)
> > > However, I can't make it work because in my case, seninf is connected
> > > to an external ISP
> > > so pad->entity->function == MEDIA_ENT_F_PROC_VIDEO_ISP.
> > >
> > > How can I get the pad corresponding to the sensor?
> >
> > You don't have to. You can drop that check, and get the link frequency
> > of the source subdev with v4l2_get_link_freq(), whatever it is.
> >
> > > > cam_subdev = media_entity_to_v4l2_subdev(pad->entity);
> > > > ctl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
> > >
> > > Is this mandatory to implement V4L2_CID_PIXEL_RATE ?
> > > Should I return an error if not found?
> >
> > Does SENINF need to know both the pixel rate and link frequency ?
> > V4L2_CID_PIXEL_RATE is very ill-defined, at the moment it only makes
> > sense as a value relative to the sensor pixel array, and doesn't really
> > apply further down in the pipeline. What information do you need to
> > program the SENINF ?
> 
> Hi Laurent,
> 
> I need to know the clock divider for the sensor

Could you provide some details on how the SENINF uses that divisor ?
What does it control, and what are the constraints ?

> > > > /* multiplier is usually bits per pixel, divider is usually num of lanes */
> > > > link_frequency = v4l2_get_link_freq(cam_subdev->ctrl_handler, multiplier, divider);
> > > > pixel_clock = v4l2_ctrl_g_ctrl_int64(ctl);
> > >
> > > How to know the sensor clock given link_frequency and pixel_clock?
> > > Can you point me to drivers doing something similar?
> > >
> > > >
> > > > ....now you know what the sensor wants, set the seninf sensor clock accordingly.
> > > >
> > > > Cheers
> > > > Angelo
> > > >
> > > [...]

-- 
Regards,

Laurent Pinchart


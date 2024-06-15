Return-Path: <linux-media+bounces-13289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0A790951A
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 02:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F8F2B21A51
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 00:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453324400;
	Sat, 15 Jun 2024 00:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tpwoYvSa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A3839B;
	Sat, 15 Jun 2024 00:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718412452; cv=none; b=VKR7t+/EmSYOFdk5uRk25Hfp/oPe6OHIHpM6dQ99EYdkuiOb+JblZbvqdxz4gKUMrP8ctBJQKXuFUqEj+DBIVJsQZmhryKMgFZ9bf0PpCIDySED2c/68/qcDoVW4zN21hdu3Um5CKmfamjxTL3MXSHDBXNOFX0tk/tqvIxtHHz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718412452; c=relaxed/simple;
	bh=l2WovBwHTqQxC4PpmcBxNtwWoVXaTmRA9KrR94DqflM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOjY8JhTsURicS4vuG6DuV0dliERMw5xx8EEP8kS/bTBPcLe9RzfmM/E7KFcZsPE4CBKh8AZrJtmYEgNCb/d1nEPmupUJN+7CoVy3rDZ7d932jz42Lk2d0wnMRjT243coaMu4nbruidikMx3qcnSIXK73fGxGtVgtR1M511qGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tpwoYvSa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D94EB2E3;
	Sat, 15 Jun 2024 02:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718412431;
	bh=l2WovBwHTqQxC4PpmcBxNtwWoVXaTmRA9KrR94DqflM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpwoYvSaNG5y7cfKPtXOeK9c/WqWgJi3L8tX9ggrvnFGBO3K6eosuYM6S28IenDax
	 ykIE86g/okNXN8/GY7mLQ7DyxukkqBLpnwEjkPMpgrqk+dU50DxnO8oXxx+XFl55xe
	 2PjY/0RWUGvD0kMIJoqCmRAzLH72YH0kCjoIG2DY=
Date: Sat, 15 Jun 2024 03:47:05 +0300
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
Message-ID: <20240615004705.GI9171@pendragon.ideasonboard.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-4-jstephan@baylibre.com>
 <3c2bee40-3792-409c-b42f-f8b013ff641c@collabora.com>
 <CAEHHSvaT_U+HNzWQUoK9EuqGuqEd11+Lu0CLz_rL7uQf0Q5isw@mail.gmail.com>
 <53838e76-bfa4-41f5-a015-a37472e98991@collabora.com>
 <CAEHHSvaRqZM9c8oD05WKkhOHdjKLBkR6tXp2Q1b8OMiDxDsDhQ@mail.gmail.com>
 <20240614123345.GN6019@pendragon.ideasonboard.com>
 <CAEHHSvaWO7m=n5_f0BM7gwuDMfh_GMX=x3DknG28PnmtZbrGQw@mail.gmail.com>
 <20240614144248.GA20136@pendragon.ideasonboard.com>
 <CAEHHSvZPATFV=w451KaaT+e__EK9u3Vc5ORPRQ-Gfa4rJ_o8hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvZPATFV=w451KaaT+e__EK9u3Vc5ORPRQ-Gfa4rJ_o8hA@mail.gmail.com>

On Fri, Jun 14, 2024 at 04:54:47PM +0200, Julien Stephan wrote:
> Le ven. 14 juin 2024 à 16:43, Laurent Pinchart a écrit :
> > On Fri, Jun 14, 2024 at 04:14:52PM +0200, Julien Stephan wrote:
> > > Le ven. 14 juin 2024 à 14:34, Laurent Pinchart a écrit :
> > > > On Fri, Jun 14, 2024 at 12:38:15PM +0200, Julien Stephan wrote:
> > > > > Le mer. 12 juin 2024 à 10:06, AngeloGioacchino Del Regno a écrit :
> > > > > >
> > > > > > Il 10/06/24 16:39, Julien Stephan ha scritto:
> > > > > [...]
> > > > > > >>
> > > > > > >>> +     writel(0x10001, input->base + SENINF_TG1_SEN_CK);
> > > > > > >>
> > > > > > >> Unroll this one... this is the TG1 sensor clock divider.
> > > > > > >>
> > > > > > >> CLKFL GENMASK(5, 0)
> > > > > > >> CLKRS GENMASK(13, 8)
> > > > > > >> CLKCNT GENMASK(21,16)
> > > > > > >>
> > > > > > >> Like this, I don't get what you're trying to set, because you're using a fixed
> > > > > > >> sensor clock rate, meaning that only a handful of camera sensors will be usable.
> > > > > > >>
> > > > > > >> Is this 8Mhz? 16? 24? what? :-)
> > > > > > >>
> > > > > > >> Two hints:
> > > > > > >>    - sensor_clk = clk_get_rate(isp_clk) / (tg1_sen_ck_clkcnt + 1);
> > > > > > >>    - int mtk_seninf_set_sensor_clk(u8 rate_mhz);
> > > > > > >>
> > > > > > >> Please :-)
> > > > > > >
> > > > > > > Hi Angelo,
> > > > > > >
> > > > > > > I think I get your point about not hardcoding the sensor rate, but I
> > > > > > > am not sure how to use
> > > > > > > a mtk_seninf_set_sensor_clk(u8 rate_mhz); function.
> > > > > > >
> > > > > > > Where would it be called? How is it exposed to the user?
> > > > > > >
> > > > > >
> > > > > > As for where: setup, streaming start, resolution change (which may be covered
> > > > > > by streaming start anyway, as a change should be calling stop->start anyway).
> > > > > >
> > > > > > And for the how is it exposed to the user - well, depends what you mean for user,
> > > > > > but it's all standard V4L2 API :-)
> > > > > >
> > > > > > Last but not least, I can give you another hint....
> > > > > >
> > > > > > struct media_entity *entity = (something_here);
> > > > > > struct media_pad *mpad;
> > > > > > struct v4l2_subdev *cam_subdev;
> > > > > > struct v4l2_ctrl *ctl;
> > > > > > s64 link_frequency, pixel_clock;
> > > > > >
> > > > > > if (entity->pads[0].flags & MEDIA_PAD_FL_SINK)
> > > > > >     return -E_NOT_A_CAMERA_SENSOR_WE_IGNORE_THIS_ONE;
> > > > > >
> > > > > > pad = media_pad_remote_pad_first(&entity->pads[0]);
> > > > > > if (!pad)
> > > > > >    return -ENOENT;
> > > > > >
> > > > > > if (!is_media_entity_v4l2_subdev(pad->entity))
> > > > > >    return -ENOENT;
> > > > > >
> > > > > > if (pad->entity->function != MEDIA_ENT_F_CAM_SENSOR)
> > > > > >    return -ENOENT;
> > > > > >
> > > > >
> > > > > Hi Angelo,
> > > > >
> > > > > Thank you for the detailed explanation :)
> > > > > However, I can't make it work because in my case, seninf is connected
> > > > > to an external ISP
> > > > > so pad->entity->function == MEDIA_ENT_F_PROC_VIDEO_ISP.
> > > > >
> > > > > How can I get the pad corresponding to the sensor?
> > > >
> > > > You don't have to. You can drop that check, and get the link frequency
> > > > of the source subdev with v4l2_get_link_freq(), whatever it is.
> > > >
> > > > > > cam_subdev = media_entity_to_v4l2_subdev(pad->entity);
> > > > > > ctl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
> > > > >
> > > > > Is this mandatory to implement V4L2_CID_PIXEL_RATE ?
> > > > > Should I return an error if not found?
> > > >
> > > > Does SENINF need to know both the pixel rate and link frequency ?
> > > > V4L2_CID_PIXEL_RATE is very ill-defined, at the moment it only makes
> > > > sense as a value relative to the sensor pixel array, and doesn't really
> > > > apply further down in the pipeline. What information do you need to
> > > > program the SENINF ?
> > >
> > > Hi Laurent,
> > >
> > > I need to know the clock divider for the sensor
> >
> > Could you provide some details on how the SENINF uses that divisor ?
> > What does it control, and what are the constraints ?
> 
> According to the datasheet,  SENINF_TG1_SEN_CK[21:16] :CLKCNT : Sensor
> master clock will be ISP_clock/(CLKCNT+1) where CLKCNT >= 1

I'll need more information. My guess so far is that there's a FIFO
somewhere in the SENINF, with the pixel bus clocked by the CSI-2 clock
before the FIFO, and by the "Sensor master clock" after the FIFO. Is
that right ? If so, the simplest approach would be to use the link
frequency to compute the pixel clock before the FIFO, and make sure that
the sensor master clock will be larger than or equal to that.

A better approach from a power consumption point of view would be to
consider horizontal blanking. The FIFO can fill faster than it gets
emptied during the active portion of the line and then drain during
blanking. This allows for a slower clock on the output side. You will
need to pick an output clock frequency that

- on average is larger than the number of active pixels per line divided
  by the line duration ; and

- ensures the FIFO never overflows during the active portion of the line,
  for cases where the line length is larger than the FIFO size.

> > > > > > /* multiplier is usually bits per pixel, divider is usually num of lanes */
> > > > > > link_frequency = v4l2_get_link_freq(cam_subdev->ctrl_handler, multiplier, divider);
> > > > > > pixel_clock = v4l2_ctrl_g_ctrl_int64(ctl);
> > > > >
> > > > > How to know the sensor clock given link_frequency and pixel_clock?
> > > > > Can you point me to drivers doing something similar?
> > > > >
> > > > > >
> > > > > > ....now you know what the sensor wants, set the seninf sensor clock accordingly.
> > > > > >
> > > > > > Cheers
> > > > > > Angelo
> > > > > >
> > > > > [...]

-- 
Regards,

Laurent Pinchart


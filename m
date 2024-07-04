Return-Path: <linux-media+bounces-14642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A1927759
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 15:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E454281DC4
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 13:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA071AED44;
	Thu,  4 Jul 2024 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Uhwsozec"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C88028373
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100520; cv=none; b=W73i19K5mQ3X8fvzkIvM46g/M14MIX52afZQBqG/G3ayfq5208tJUYkfX2GfXFcczljBnKPG1IUxW89jPIt7Le/kl7A6PSWnImj8FRcAqTWeRLsM76zH+qWiP+wST+2+gqtiMt4+GdvVzntHvfVhKDFhni/xKM4a+Wv8Y1ALIh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100520; c=relaxed/simple;
	bh=ZurutrlF5DSOS29VhgpoQ512JwNEuhthUV5Dn8eNNzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFvg5xkAPmYmsCvwzo+ozzzEp4PS4gStoxoW69MDOPND0dQcXmqmP/cdBCKkp7DACpYCFAzwotm9MJa+0k1XxvyoD6+DTXteus0nGqT3hhb5utUBqViYgaFd8HAw151sYmkPjXYZ6iZfEEmu6Ez323PQatfzqcvXE459VMNZ05Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Uhwsozec; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-650469f59d7so6044667b3.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2024 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720100517; x=1720705317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqZuuHffUIBiAfDiTFS5HFgQJZKEzHNjVKNJ49rRTBQ=;
        b=UhwsozecxMkYBXQ4KtoQF9cOwJ0TkNvKECjCciMvP+QoSvF9dIuQJFZ0MEwKESR10e
         ewCQg08wr137F0QIj9Q0+fXUmg4XMXqkggiMpXT2bdlbO257iL2lLwGgCNpX1Pn9J3f3
         kC7uEN6TWLTritaM7t7KiNmMwPku6JkKLpTJIYvBvYbMEkYQOcwRcna9nef9xBff+gKu
         Ad8dnThGTUo3GkSXiECkQYcXC6FkGwhvh76+fBJeyJuuWkMs8ihQFqARVSkXwdTxBETG
         VyLRyKMcRGf6uSbZrPpVCEmc5U42wabTlF5mlWyqIunePLtl7aRz+FziEQjHVwD6I6Ot
         M9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720100517; x=1720705317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqZuuHffUIBiAfDiTFS5HFgQJZKEzHNjVKNJ49rRTBQ=;
        b=PF6498BmNph9fg7bM942Bf3aaKQ/tx88HEzu9PTW1brIVEJdhht9F21tp6yfX5UGX/
         ITPB+cO7hrDGXGODfySmzbkVgg8roG8N+HhudNc2/C1OAhkQT/NsuHXhipfHvxO11UHk
         BjKMGRAcZVT0Y42VKjA0++l4RoqyP0XZMPezUOmL+XtE7qxM5NJpZNNxL6Dyhu/yl/KO
         94QYKIqmfe6RJi2L7eIJ/PbqCar8SC9gP11oyNWE1kbMkhkJ2Eg3AFR0Q5NoFlg3GYyX
         VbppEzWRA07e8qwEmHCY37kkvh8A75r3Ad80OUzYBlIafkm6GrlRrdR99GfzdtScFW4X
         IBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2bmli4Z2Daqo/mrmo5cpudzai1zoYfNm70FPgVC6c+gOZ1mLIhXMFinDzpaLpmFBT936Ve8IDzexiZMyWch/lJmSj5Ot2LEQtdnI=
X-Gm-Message-State: AOJu0YzvNxp4dnQpCs4s++ZXCfZh51MkkSRFaszeKLa0xw0vTpoiuyAO
	0v0e8lYXLbF6++uEROWFQ7L3s/g1QqWED2O/2VvCBm8IdtuuUWAQoULEN+Zq+HM/McbokLpqkDs
	5b1Io0DicTKiYexClVtcYuwD9JdH/Wdses8B16w==
X-Google-Smtp-Source: AGHT+IHEKBkMrwGk47g3+CpUgb4d7hqbP14eAiw/Im3iHfhAjIi1ra45CRslQTJFnzek/489H7UK13rqOIN82fDaWek=
X-Received: by 2002:a0d:d0c2:0:b0:64b:3f2c:c73f with SMTP id
 00721157ae682-652d853062fmr15759017b3.45.1720100517327; Thu, 04 Jul 2024
 06:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-4-jstephan@baylibre.com> <3c2bee40-3792-409c-b42f-f8b013ff641c@collabora.com>
 <CAEHHSvaT_U+HNzWQUoK9EuqGuqEd11+Lu0CLz_rL7uQf0Q5isw@mail.gmail.com>
 <53838e76-bfa4-41f5-a015-a37472e98991@collabora.com> <CAEHHSvaRqZM9c8oD05WKkhOHdjKLBkR6tXp2Q1b8OMiDxDsDhQ@mail.gmail.com>
 <20240614123345.GN6019@pendragon.ideasonboard.com> <CAEHHSvaWO7m=n5_f0BM7gwuDMfh_GMX=x3DknG28PnmtZbrGQw@mail.gmail.com>
 <20240614144248.GA20136@pendragon.ideasonboard.com> <CAEHHSvZPATFV=w451KaaT+e__EK9u3Vc5ORPRQ-Gfa4rJ_o8hA@mail.gmail.com>
 <20240615004705.GI9171@pendragon.ideasonboard.com>
In-Reply-To: <20240615004705.GI9171@pendragon.ideasonboard.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 4 Jul 2024 15:41:45 +0200
Message-ID: <CAEHHSvb2Ceu8nxs1W6Xi3F6uHQhe9B=CLRZiYQEGnHdajMqGSw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>, 
	Florian Sylvestre <fsylvestre@baylibre.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 15 juin 2024 =C3=A0 02:47, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> a =C3=A9crit :
>
> On Fri, Jun 14, 2024 at 04:54:47PM +0200, Julien Stephan wrote:
> > Le ven. 14 juin 2024 =C3=A0 16:43, Laurent Pinchart a =C3=A9crit :
> > > On Fri, Jun 14, 2024 at 04:14:52PM +0200, Julien Stephan wrote:
> > > > Le ven. 14 juin 2024 =C3=A0 14:34, Laurent Pinchart a =C3=A9crit :
> > > > > On Fri, Jun 14, 2024 at 12:38:15PM +0200, Julien Stephan wrote:
> > > > > > Le mer. 12 juin 2024 =C3=A0 10:06, AngeloGioacchino Del Regno a=
 =C3=A9crit :
> > > > > > >
> > > > > > > Il 10/06/24 16:39, Julien Stephan ha scritto:
> > > > > > [...]
> > > > > > > >>
> > > > > > > >>> +     writel(0x10001, input->base + SENINF_TG1_SEN_CK);
> > > > > > > >>
> > > > > > > >> Unroll this one... this is the TG1 sensor clock divider.
> > > > > > > >>
> > > > > > > >> CLKFL GENMASK(5, 0)
> > > > > > > >> CLKRS GENMASK(13, 8)
> > > > > > > >> CLKCNT GENMASK(21,16)
> > > > > > > >>
> > > > > > > >> Like this, I don't get what you're trying to set, because =
you're using a fixed
> > > > > > > >> sensor clock rate, meaning that only a handful of camera s=
ensors will be usable.
> > > > > > > >>
> > > > > > > >> Is this 8Mhz? 16? 24? what? :-)
> > > > > > > >>
> > > > > > > >> Two hints:
> > > > > > > >>    - sensor_clk =3D clk_get_rate(isp_clk) / (tg1_sen_ck_cl=
kcnt + 1);
> > > > > > > >>    - int mtk_seninf_set_sensor_clk(u8 rate_mhz);
> > > > > > > >>
> > > > > > > >> Please :-)
> > > > > > > >
> > > > > > > > Hi Angelo,
> > > > > > > >
> > > > > > > > I think I get your point about not hardcoding the sensor ra=
te, but I
> > > > > > > > am not sure how to use
> > > > > > > > a mtk_seninf_set_sensor_clk(u8 rate_mhz); function.
> > > > > > > >
> > > > > > > > Where would it be called? How is it exposed to the user?
> > > > > > > >
> > > > > > >
> > > > > > > As for where: setup, streaming start, resolution change (whic=
h may be covered
> > > > > > > by streaming start anyway, as a change should be calling stop=
->start anyway).
> > > > > > >
> > > > > > > And for the how is it exposed to the user - well, depends wha=
t you mean for user,
> > > > > > > but it's all standard V4L2 API :-)
> > > > > > >
> > > > > > > Last but not least, I can give you another hint....
> > > > > > >
> > > > > > > struct media_entity *entity =3D (something_here);
> > > > > > > struct media_pad *mpad;
> > > > > > > struct v4l2_subdev *cam_subdev;
> > > > > > > struct v4l2_ctrl *ctl;
> > > > > > > s64 link_frequency, pixel_clock;
> > > > > > >
> > > > > > > if (entity->pads[0].flags & MEDIA_PAD_FL_SINK)
> > > > > > >     return -E_NOT_A_CAMERA_SENSOR_WE_IGNORE_THIS_ONE;
> > > > > > >
> > > > > > > pad =3D media_pad_remote_pad_first(&entity->pads[0]);
> > > > > > > if (!pad)
> > > > > > >    return -ENOENT;
> > > > > > >
> > > > > > > if (!is_media_entity_v4l2_subdev(pad->entity))
> > > > > > >    return -ENOENT;
> > > > > > >
> > > > > > > if (pad->entity->function !=3D MEDIA_ENT_F_CAM_SENSOR)
> > > > > > >    return -ENOENT;
> > > > > > >
> > > > > >
> > > > > > Hi Angelo,
> > > > > >
> > > > > > Thank you for the detailed explanation :)
> > > > > > However, I can't make it work because in my case, seninf is con=
nected
> > > > > > to an external ISP
> > > > > > so pad->entity->function =3D=3D MEDIA_ENT_F_PROC_VIDEO_ISP.
> > > > > >
> > > > > > How can I get the pad corresponding to the sensor?
> > > > >
> > > > > You don't have to. You can drop that check, and get the link freq=
uency
> > > > > of the source subdev with v4l2_get_link_freq(), whatever it is.
> > > > >
> > > > > > > cam_subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> > > > > > > ctl =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_R=
ATE);
> > > > > >
> > > > > > Is this mandatory to implement V4L2_CID_PIXEL_RATE ?
> > > > > > Should I return an error if not found?
> > > > >
> > > > > Does SENINF need to know both the pixel rate and link frequency ?
> > > > > V4L2_CID_PIXEL_RATE is very ill-defined, at the moment it only ma=
kes
> > > > > sense as a value relative to the sensor pixel array, and doesn't =
really
> > > > > apply further down in the pipeline. What information do you need =
to
> > > > > program the SENINF ?
> > > >
> > > > Hi Laurent,
> > > >
> > > > I need to know the clock divider for the sensor
> > >
> > > Could you provide some details on how the SENINF uses that divisor ?
> > > What does it control, and what are the constraints ?
> >
> > According to the datasheet,  SENINF_TG1_SEN_CK[21:16] :CLKCNT : Sensor
> > master clock will be ISP_clock/(CLKCNT+1) where CLKCNT >=3D 1
>
> I'll need more information. My guess so far is that there's a FIFO
> somewhere in the SENINF, with the pixel bus clocked by the CSI-2 clock
> before the FIFO, and by the "Sensor master clock" after the FIFO. Is
> that right ? If so, the simplest approach would be to use the link
> frequency to compute the pixel clock before the FIFO, and make sure that
> the sensor master clock will be larger than or equal to that.
>
> A better approach from a power consumption point of view would be to
> consider horizontal blanking. The FIFO can fill faster than it gets
> emptied during the active portion of the line and then drain during
> blanking. This allows for a slower clock on the output side. You will
> need to pick an output clock frequency that
>
> - on average is larger than the number of active pixels per line divided
>   by the line duration ; and
>
> - ensures the FIFO never overflows during the active portion of the line,
>   for cases where the line length is larger than the FIFO size.
>

Hi Laurent and Angelo,

Thank you for your help on this. I just sent a v5 with such a
function. But it seems like changing
this register has no effect. I asked some feedback from mediatek's app
engineer but they are OoO
until 16/7. I am waiting for them.

Cheers
Julien
> > > > > > > /* multiplier is usually bits per pixel, divider is usually n=
um of lanes */
> > > > > > > link_frequency =3D v4l2_get_link_freq(cam_subdev->ctrl_handle=
r, multiplier, divider);
> > > > > > > pixel_clock =3D v4l2_ctrl_g_ctrl_int64(ctl);
> > > > > >
> > > > > > How to know the sensor clock given link_frequency and pixel_clo=
ck?
> > > > > > Can you point me to drivers doing something similar?
> > > > > >
> > > > > > >
> > > > > > > ....now you know what the sensor wants, set the seninf sensor=
 clock accordingly.
> > > > > > >
> > > > > > > Cheers
> > > > > > > Angelo
> > > > > > >
> > > > > > [...]
>
> --
> Regards,
>
> Laurent Pinchart


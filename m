Return-Path: <linux-media+bounces-14471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A67C91E0B6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 15:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DABD7282761
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 13:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F2C15E5D1;
	Mon,  1 Jul 2024 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aZ1nWRED"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F2246525
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 13:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719840535; cv=none; b=LTPdpd9UYCA39+OrAYjlMecpMek7/l+ydo9UwaKZr492pa9OJFef6F8k+OUH/kAJnLYaz7/SZktxIzvho/qk+CZO6rXGGlU0rSy66MIrkYG6MBaW+yUU7OOuUjsDBY9+dPqxwrzUTP8/vJ4p28iFeSLgADY8o3ORWBf3wRlHkoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719840535; c=relaxed/simple;
	bh=5oeMeuRcavtI1KzSv2GD5xv+hf15URcfcXkKgG4jgnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaPzfaNmcAXUXAA2xWAal4So7Drtuug+QEvqr3osQgd0QhaCpH945cw7WcpF42dbehk2tzyJ2nuLOANJEu7WUTBgcoifLhp9qPE8KvPvdNHltREoCAk23un/Dr0R7R607fJcBPYOQxnQW/NZQrnOqNiS7i6c9C+F+F4YjPjOhiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=aZ1nWRED; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-585e774fd3dso384269a12.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2024 06:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1719840531; x=1720445331; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pguT1tXp3pcalm8i+hcCre4PQslCdNRcHLB+V7NPSFg=;
        b=aZ1nWREDm83aKAMIJW85fLF0OxTHWP0mwy1mGW5HfraWrvaRPi2Ps/vM6/QxwyGgfQ
         AZ3Hg/lUB4l/GdCg3dxWVViEWdxd1cWH4FUnC8UMkoUf92KNfoIvn4x4vCgpN10lGme6
         Bircj30MbbINTE/X5vXwyEG99Kjl9mkEwk7ezPV2XGsuzy4Pw1Sh7xxZQ4cAVMd56FZ6
         6jX1p3usWjkCDgK38Ml8EysjMcWkNSuQHd4iu0Cri3bjXtyAF0G6F8OoaytjM3AhEn4w
         9OUI0Q9YM/+42DMMPqhSwo0+YkBv0pE/GyPRnLXChugWkP3ua05fOPe/Y/IEpvQ8BGVU
         a7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719840531; x=1720445331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pguT1tXp3pcalm8i+hcCre4PQslCdNRcHLB+V7NPSFg=;
        b=fQa6VNTUMHDVK5HUScozbn94+a4EZwytFx81v5Hb9tmCJVaT5C+HiUN8tybENkKmke
         0K4veEap3Ry+ngwBLOJuDXzGYOtX0e3lbxUMEI/7yflYyujtCnuG7aHxflMdl0zHy+Uf
         4c40XwLBTDIQrgCBhwlIzf8v5KPMSdtmsVP7WNt2GXjlJduEbpOXbD/PP7uHqoSo2ndk
         Mw9DZDvLcTtKT1LGSRx4eGVoYygGQQDiBaCFen+tYRXd7INIVDCVsbiMNnbJA5xkykOH
         mRwnEI5NffS949eCf2zFoZsMXwY/7YnVU/LT+3cK8WTbeXtPTPR6Nm92XRio6TGS7PJm
         MFzA==
X-Gm-Message-State: AOJu0YxXZRQ9MOV5/JhqCfZYJDqsJSCIEhBCk9/z+CwTqt0Gr+r2ovs8
	SPqX82BeS18x9bajK1kayOYiBwx7S9h0M4XaG7tDApxTKy/t3wF2JFq1FZRs0eb9fPR6ngeW8oA
	Bt76oZV8AvpRLfvbhKPT6ER08WbU++q1ZHadO+g==
X-Google-Smtp-Source: AGHT+IEKu6liQ8YpAnfCKVhg9jdC08RqGrYoc48r+rD+y1EWszuRZLvz/4+vNaE1H+gyaYRu7/ZYjPyQSuPWejDnMHs=
X-Received: by 2002:a05:6402:4402:b0:586:a93:2c0d with SMTP id
 4fb4d7f45d1cf-5879f1c24f8mr4029205a12.18.1719840531221; Mon, 01 Jul 2024
 06:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628132948.871568-1-jacopo.mondi@ideasonboard.com> <20240628132948.871568-5-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240628132948.871568-5-jacopo.mondi@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Mon, 1 Jul 2024 14:28:14 +0100
Message-ID: <CAEmqJPpSO3+e==dfk5DJMznetS1bEf9tJ1u9EOwRbgqwcoL5dg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] media: uapi: pisp_be_config: Re-sort pisp_be_tiles_config
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@iki.fi>, David Plowman <david.plowman@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

Thank you for this fix.

On Fri, 28 Jun 2024 at 14:30, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> The order of the members of pisp_be_tiles_config is relevant
> as the driver logic assumes 'config' to be at offset 0.
>
> Re-sort the member to match the driver's expectations.
>
> Fixes: c6c49bac8770 ("media: uapi: Add Raspberry Pi PiSP Back End uAPI")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Acked-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  include/uapi/linux/media/raspberrypi/pisp_be_config.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> index 27d0cc417d6b..f8650ca92bf8 100644
> --- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> @@ -919,9 +919,9 @@ struct pisp_tile {
>   * @config:    PiSP Back End configuration
>   */
>  struct pisp_be_tiles_config {
> +       struct pisp_be_config config;
>         struct pisp_tile tiles[PISP_BACK_END_NUM_TILES];
>         __u32 num_tiles;
> -       struct pisp_be_config config;
>  } __attribute__((packed));
>
>  #endif /* _UAPI_PISP_BE_CONFIG_H_ */
> --
> 2.45.2
>


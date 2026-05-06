Return-Path: <linux-media+bounces-60632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMmGDNxS+2n+ZQMAu9opvQ
	(envelope-from <linux-media+bounces-60632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:40:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 917CC4DC633
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24FD03094795
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA13480DF9;
	Wed,  6 May 2026 14:34:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A16480DCA
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078070; cv=none; b=c1PSjorWRPQsRGDuEvteCi977ahCoZZOK/vE8oA5XmvsOfkrocmb6z8ivQRNmVko7dXtujlYsOETlJUrjgd5zXuPbUWpMAkfrgihvC2uu14ewgJK43pU6FDapGPfliD7mC8ZXxXvGm+D/vS6AMqnlVHmTbHHcoC/Ki5jmM3LdvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078070; c=relaxed/simple;
	bh=YJHhuXmcmAbbsrOx/1EkRrG2CsYJcpBD2mAbpq2+4uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OumEkHMYsmUtUaUpkQofNvxU/bIFuNvtzjc4qPSsjgzJmFgjnTElUu5ePio/9RZWc4V/Tf045F5WJlVIb+RrEaW5xHRhMFkEGJA0ygwlzbAmEeTWP8KyLn3Rdx/Vh557UqyxnnfTLDDIkYmiQM5e/cySdrlffswOE7wpjaouy4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a887ebb416so988162e87.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 07:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078067; x=1778682867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGwBD/Xye3jm815Ej5TC/rh/kNzvD/6gf/0ous2Pk1s=;
        b=CegOZA3tQYOn3AyYIzeVbV5FVAccTZGB3WA9MV7yr9k5ltDuix5rLhulgSl/L2ISxZ
         BOGGvHZumkDVvjUs68n4aBabqYNehgNb2/3/yVIhuNPgRjtQibJssFmglJnIXGwcQ1Or
         jCpXB1zoMxm+Ye9K73FbHy9iSxGJBpmFIYsWsUNDy03N5flZDuKzuCu8dTH7LYpX9VUu
         pnvlcnMPrgsNGtMUpb0DCOdQZj+OwQK+CV2ztBiErNjFJp5HZUSMk7AFLAss7RIlLBi3
         /mu38V1N9TpIGQfC+H+7HLqqhJihoRnJ6jrBFr0WYPmmrnTF0PyullSpSfTzBAiXm7AV
         YjOg==
X-Forwarded-Encrypted: i=1; AFNElJ/HpN9umTyF3Fq5+TODLTGlmKdRrmi+bk6dL7INM8GsybpAvKhglMZy2xfdqM3IAsX1FuNd3cOhH9MR+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6cWAV1YkZl0M5pHX2JoE0Krpuk9TNW2hy7o8kj7yFfgq/FxJB
	Hb78I+sKvC9mWUUpccKgCVCjcesz1iWw7wCwJdVDXCMV5Bw9vdXUieEWsFKubpuAkvQ=
X-Gm-Gg: AeBDiesV9IU6G4b1WI6Y0Zrmr/BlSXU++dR4VeSl29WP5JtMSMZ7Y4a17WefbZ585Cj
	owSORMKJ41U9tpcj3iGgJAO4V3eO+Dt8MqMRMM9NU9WDpv+t53ztKUxZNaBt2WBPqigEhxbGEEJ
	X9SUEwdKSZQfENyetnkCfWFlT/JDArmFcwf+aAJ4v4UM0Iiqcf0H5wDDVvPaXCFCWq8I/zoghhK
	p8AYLR8pNbajQeXXCgxHNEo299cZff/Q6QAmIq9RyOYaY/iBaVnRuJOoxdZDHdx65wmygbn7p8g
	TAaDzxyHvdR4IraVQWvzfWpkq67iqAjhmS4sd6WeiRJrO2mGpbjhzjFtQ4LW0Ntru6kBtAKRhHl
	Z7al+amtzw8OlTUxVtS+YEYi1oecKGX508R4pvZ9lmwiuMbxpQ9MQeUM0xhDzbeFSaqILPFP8Cd
	juEiZx0l+glreHQxi+O4ILCkbnhtrGa97X+AS5mMbuxJkVkjpiCqcm5VDTmY67EPePYFJhwYURD
	u0=
X-Received: by 2002:a05:6512:131e:b0:5a8:6cfc:8379 with SMTP id 2adb3069b0e04-5a887cebdeamr1452667e87.39.1778078066535;
        Wed, 06 May 2026 07:34:26 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361300b58sm50978861fa.20.2026.05.06.07.34.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:34:26 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso61257861fa.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 07:34:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8sOrKsbTTfOto0H447x0EVRwoM+YY5Vz+ZBbSVFaUoo8dOHnTIuzt3EVNB34Zv28r3Wf7ofXFVwA+bAg==@vger.kernel.org
X-Received: by 2002:a05:6402:1f46:b0:67d:1e9b:990d with SMTP id
 4fb4d7f45d1cf-67d642bc4b7mr1875234a12.16.1778077594610; Wed, 06 May 2026
 07:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com> <20260413160331.2611829-10-antoine.bouyer@nxp.com>
In-Reply-To: <20260413160331.2611829-10-antoine.bouyer@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 16:26:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
X-Gm-Features: AVHnY4Jz5uRp9a-KMKa4ktgjK5kRGGM5ufVLGN1Ppw7eSDSfOOOzlRIBWUnB9YY
Message-ID: <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] media: platform: Add NXP Neoisp Image Signal Processor
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, daniel.baluta@nxp.com, 
	peng.fan@nxp.com, frank.li@nxp.com, jacopo.mondi@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, michael.riesch@collabora.com, 
	anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	ai.luthra@ideasonboard.com, paul.elder@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 917CC4DC633
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-60632-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email,linux-m68k.org:email]

Hi Antoine,

On Mon, 13 Apr 2026 at 18:10, Antoine Bouyer <antoine.bouyer@nxp.com> wrote:
> First NXP neoisp driver version with the following contents:
>
> This driver was initially inspired from raspberrypi pisp_be driver. It
> reuses same approach for ISP job scheduling.
>
> The Neoisp driver supports:
> * 8, 10, 12, 14 and 16-bits RAW Bayer images input.
> * Monochrome sensors input.
> * RGB/YUV, IR and Greyscale output formats.
>
> The neoisp features are:
> * Provides single context to limit amount of v4l2 devices.
> * Supports M2M operations.
> * Support SDR and HDR modes.
> * Supports generic v4l2-isp framework for extensible Parameters and
> Statistics buffers.
> * Provides a `core_media_register` API to register neoisp's media entities
> into another media graph.
> * A module parameter to run in standalone mode with its own media device.
>
> Co-developed-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> Signed-off-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_NXP_NEOISP
> +       tristate "NXP NEOISP v4l2 hardware driver"
> +       depends on VIDEO_DEV

depends on ARCH_MXC || COMPILE_TEST

> +       select MEDIA_CONTROLLER
> +       select VIDEOBUF2_DMA_CONTIG
> +       select V4L2_ISP
> +       help
> +         Enable this to support the NXP NEO Image Signal Processing (ISP)
> +         module present in various NXP SoCs. This module offers multiple
> +         functions for processing RAW images and generating RGB or YUV images.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called neoisp.


> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_MASK GENMASK(23, 16)
> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_SET(x) (((x) & GENMASK(7, 0)) << 16)
> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_GET(x) (((x) >> 16) &  GENMASK(7, 0))

What about just:

    #define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2 GENMASK(23, 16)

and using the helpers from include/linux/bitfield.h in the driver code?

    FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, val)
    FIELD_GET(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, reg)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


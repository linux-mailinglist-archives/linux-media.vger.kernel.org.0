Return-Path: <linux-media+bounces-54617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D7wHelhqWli6gAAu9opvQ
	(envelope-from <linux-media+bounces-54617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:58:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D9921030A
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9115730417F8
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 10:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A0A384237;
	Thu,  5 Mar 2026 10:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lQYXMk6F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051753793A7
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708257; cv=pass; b=JtBQUxlH5FnQ3QDK2nO43wyLQTKZ9Wp6YKM+ti+YtHRsr61H7fy95Cl5X2ztA4oPYqA3aQT4AJbY7+wpXa2Sk8CZaiZ0hzS2dAZvPYV7Yl6VJ5DaTZqaPiYlxTLIYTZEdIpERFf5DfItZcDlg56jTBPuO6V0DsfIuV7h5YcSbbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708257; c=relaxed/simple;
	bh=5NXcuMrdK5wM2mQ1EKoT6J/EAsI3ltAISmIsycckYMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGSh4nss7TY81hgcGRt7vNq3fQ1h00jsTMnCLDLbi/RBEQsbs5LTF5p9EpzgXa0wIygF0fMCZRW6lardF9HCvAQFyLL0idtc1xywJPh5FJPvvuY2MtEqmCaQd63Xl24tGqN1gDlJr5u5zASjVCXy36xBGIUBcgam7kTghE9CP/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=lQYXMk6F; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79868eae536so80811907b3.0
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 02:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772708253; cv=none;
        d=google.com; s=arc-20240605;
        b=FmWDnA48yJzUHFBwbOCYlS7f9CzhJga7ztzKIieryqjbv+24i+sBs+pZOT/IEP2oxn
         ALl2cLmeqY02WT6ZQc6UcOS4hV3PCS3YCSi5bhB5df5t/fwguO2J11/FptpNNgVO0TMD
         xPwjCbymNEFprEGCbacRwMk8M8DENJrl2b5mUseR3ixUH4wP1ss5FxRnOmRcHGPh2SXQ
         ObYkWWkEPhdzAw5rqYi3cy35xAMKCcRzIIxHhWVhGvW5SiJtHli3ohvoTQh0VODfv+wP
         QuydMEYSRgOFklD+z9Js0PHhavvrsbSQUT9iKh0AKpeXKeRwCeH9ECvyP4VEpdFx8R1u
         PeOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gI4oF/Ot82XkhwAIoJUhEkj9M8G1wyTnqEcsV5296fM=;
        fh=WA44DM140hu7M0kluDHzTtFtmgSG6ogu/CjdUp6bgxo=;
        b=KosKvNb3zz2T7WY+0AeOxo3ps65fE1yb+xWcJ+RAQqtA6Bhi2Ol9IIzcvQnlPHcXCI
         aR2BqMeUlylbh5Yf+TXaA/E9QANMPVr2AENkKMKVMqs3O4AvQcLo2ud0Zc4RC9aYkTi+
         QFBoT1bhkk0nxTGmam8d+TK9ZwzJilOt5ZTLeR2fi7cIUJjv9M29b29yOPi2tMPxvyov
         545OJrb/XejIraifjGOhm4Vsbc9my52yQAkdREoP715U2yasoXsDwy2vCbcKJZud/CvX
         OeI6P7zuIBfUSo9b53yjkwTpO/vkpl34MKtv1s6L03EVWMmTfkCAZry+wNdTLr6p4h5l
         Rjaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772708253; x=1773313053; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gI4oF/Ot82XkhwAIoJUhEkj9M8G1wyTnqEcsV5296fM=;
        b=lQYXMk6FL9ch5MpYVg0h4+BwaJLJnIYDOHf89/kzeEw5Lj732/FTA07IgoPVfW0B8j
         OKZ2BrY4ovVzA5YDslcP1BV1n+I2gKTMmh2NB+E157mby3xL8mueD/nPvNneX7iis9p/
         PrNl/lbAdz8jgV+TUdOgMrlbgYuY5mV9g8dcwthIhPkxAj7k3NO+KpusWxE6OqKVPXbY
         Vokmchv+ygPeyl8uM6YUaunX3GlG4QcmHVtsFo5ivN0ywKNzc0LR1bfxEAMFKJkux98Y
         22QPKfBfOXVXMSEDyr1U1Cc11bYL7lsfTypjJUOgtMeko5puPpPD53kixjCttOI8VAQP
         fY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708253; x=1773313053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI4oF/Ot82XkhwAIoJUhEkj9M8G1wyTnqEcsV5296fM=;
        b=ucVIGjjWU94P/cpiniiXTBi3sZa/zsokSJpBVegO7dNbIHsgM9zptQwkxoAElya6VW
         vIX/8uzqvABRHpxx/KR0PcQRAZtgSsAe/8hh2TISZBnPXxJdjw1e/aoC6g+fR5tJWYwy
         UVlh261TdFyMG9H2wp8LFKyugAqNoKt8+rhbWW2l0b6qS/bg0wHrusW/vrt28yuebIy/
         oc5o+KK0OCV46kaAfsk0eCMeSYowoGY3kYk7pSiu5LIC1rcGdKi64Eh3ay0I+LFjxf2m
         lMRGLkBHUa13575nsclHAeqom7NBOFpF6VdHPBjaD80GxFTdL80dxGnB34abCA/mhplJ
         q0wg==
X-Forwarded-Encrypted: i=1; AJvYcCUlXPfCCn36XqU61DCmT3l3ZWuyxeUrdbpHTnU5Fgv0twvvXUjyTzQREz+Mq5TnBIR8WIUoOCQbTyHDzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKOLjbRNbGkAPdHlnTuIgz2AdT4uERVuyLt18i5zLkg/I6M4HI
	95oFDGC11ribE7W50usMtr0GH1fhUOeyMaUUqogsEVetWusma7769lqu7l4xd/RzbiF3VC8BvFN
	ugXaU7wJlV8atVQcNCp1aqP0JnCceglMQuY7rYOOdAg==
X-Gm-Gg: ATEYQzxSo4Dwh269Tmo6uTbpeukgvZ/kr0BdLDEKrn9YtvqtHemHYR3JqHMtSE59iVU
	TlsIoeJ8Ze1kYtBxsmjHfTxtXAJCFmYJOam1H3ljxGdXTmLH23IR3/zLCC63ucpGF9BafSxe1j/
	pO5th0AxZh6Z52UC6tNyFx/HCXB3en4d39WXLAxBBbPanYvabknzTCsGtgWAxyT2bAfM5ifxXyj
	/Bd3JseiKlEWFOx7mWPdwX6gN+PumyVJ8KRa/rjst6h7Ng+0+XIkGBLjj7U0FAeQgRJXSRGjwXv
	048cmqCaFwG2PDAyOi0K8MErKQTsCWdROT6OJsM=
X-Received: by 2002:a05:690c:6607:b0:794:bb73:8a21 with SMTP id
 00721157ae682-798c6cb3098mr42448607b3.44.1772708252810; Thu, 05 Mar 2026
 02:57:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305043350.2151936-1-xiaolei.wang@windriver.com> <20260305043350.2151936-2-xiaolei.wang@windriver.com>
In-Reply-To: <20260305043350.2151936-2-xiaolei.wang@windriver.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 5 Mar 2026 10:57:16 +0000
X-Gm-Features: AaiRm50s8aqMgdxnZ4vc9-66riQZ-F_mg7CbBWCZYGP1f6BEpCwQBN-lucXyzYQ
Message-ID: <CAPY8ntA+bgJKKU_MXLFR3StzwU_UMHdA84zr8v5DZfLX1p4E4Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: i2c: ov9282: Convert to CCI register access helpers
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org, 
	johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl, 
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 70D9921030A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54617-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,windriver.com:email,raspberrypi.com:dkim,raspberrypi.com:email,siliconsignals.io:email]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 at 04:35, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>
> Use the new common CCI register access helpers to replace the private
> register access helpers in the ov9282 driver. This simplifies the driver
> by reducing the amount of code.
>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>

Thanks for the update

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/ov9282.c | 561 +++++++++++++------------------------
>  2 files changed, 198 insertions(+), 364 deletions(-)
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5eb1e0e0a87a..3027e71fd8fb 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -690,6 +690,7 @@ config VIDEO_OV8865
>  config VIDEO_OV9282
>         tristate "OmniVision OV9282 sensor support"
>         depends on OF_GPIO
> +       select V4L2_CCI_I2C
>         help
>           This is a Video4Linux2 sensor driver for the OmniVision
>           OV9282 camera sensor.
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index ded9b2044ff8..56f854a4d04f 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -12,38 +12,40 @@
>  #include <linux/math.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>
> +#include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>
>  /* Streaming Mode */
> -#define OV9282_REG_MODE_SELECT 0x0100
> +#define OV9282_REG_MODE_SELECT CCI_REG8(0x0100)
>  #define OV9282_MODE_STANDBY    0x00
>  #define OV9282_MODE_STREAMING  0x01
>
> -#define OV9282_REG_PLL_CTRL_0D 0x030d
> +#define OV9282_REG_PLL_CTRL_0D CCI_REG8(0x030d)
>  #define OV9282_PLL_CTRL_0D_RAW8                0x60
>  #define OV9282_PLL_CTRL_0D_RAW10       0x50
>
> -#define OV9282_REG_TIMING_HTS  0x380c
> +#define OV9282_REG_TIMING_HTS  CCI_REG16(0x380c)
>  #define OV9282_TIMING_HTS_MAX  0x7fff
>
>  /* Lines per frame */
> -#define OV9282_REG_LPFR                0x380e
> +#define OV9282_REG_LPFR                CCI_REG16(0x380e)
>
>  /* Chip ID */
> -#define OV9282_REG_ID          0x300a
> +#define OV9282_REG_ID          CCI_REG16(0x300a)
>  #define OV9282_ID              0x9281
>
>  /* Output enable registers */
> -#define OV9282_REG_OUTPUT_ENABLE4      0x3004
> +#define OV9282_REG_OUTPUT_ENABLE4      CCI_REG8(0x3004)
>  #define OV9282_OUTPUT_ENABLE4_GPIO2    BIT(1)
>  #define OV9282_OUTPUT_ENABLE4_D9       BIT(0)
>
> -#define OV9282_REG_OUTPUT_ENABLE5      0x3005
> +#define OV9282_REG_OUTPUT_ENABLE5      CCI_REG8(0x3005)
>  #define OV9282_OUTPUT_ENABLE5_D8       BIT(7)
>  #define OV9282_OUTPUT_ENABLE5_D7       BIT(6)
>  #define OV9282_OUTPUT_ENABLE5_D6       BIT(5)
> @@ -53,7 +55,7 @@
>  #define OV9282_OUTPUT_ENABLE5_D2       BIT(1)
>  #define OV9282_OUTPUT_ENABLE5_D1       BIT(0)
>
> -#define OV9282_REG_OUTPUT_ENABLE6      0x3006
> +#define OV9282_REG_OUTPUT_ENABLE6      CCI_REG8(0x3006)
>  #define OV9282_OUTPUT_ENABLE6_D0       BIT(7)
>  #define OV9282_OUTPUT_ENABLE6_PCLK     BIT(6)
>  #define OV9282_OUTPUT_ENABLE6_HREF     BIT(5)
> @@ -62,14 +64,14 @@
>  #define OV9282_OUTPUT_ENABLE6_VSYNC    BIT(1)
>
>  /* Exposure control */
> -#define OV9282_REG_EXPOSURE    0x3500
> +#define OV9282_REG_EXPOSURE    CCI_REG24(0x3500)
>  #define OV9282_EXPOSURE_MIN    1
>  #define OV9282_EXPOSURE_OFFSET 25
>  #define OV9282_EXPOSURE_STEP   1
>  #define OV9282_EXPOSURE_DEFAULT        0x0282
>
>  /* AEC/AGC manual */
> -#define OV9282_REG_AEC_MANUAL          0x3503
> +#define OV9282_REG_AEC_MANUAL          CCI_REG8(0x3503)
>  #define OV9282_DIGFRAC_GAIN_DELAY      BIT(6)
>  #define OV9282_GAIN_CHANGE_DELAY       BIT(5)
>  #define OV9282_GAIN_DELAY              BIT(4)
> @@ -78,28 +80,28 @@
>  #define OV9282_AEC_MANUAL_DEFAULT      0x00
>
>  /* Analog gain control */
> -#define OV9282_REG_AGAIN       0x3509
> +#define OV9282_REG_AGAIN       CCI_REG8(0x3509)
>  #define OV9282_AGAIN_MIN       0x10
>  #define OV9282_AGAIN_MAX       0xff
>  #define OV9282_AGAIN_STEP      1
>  #define OV9282_AGAIN_DEFAULT   0x10
>
>  /* Group hold register */
> -#define OV9282_REG_HOLD                0x3308
> +#define OV9282_REG_HOLD                CCI_REG8(0x3308)
>
> -#define OV9282_REG_ANA_CORE_2  0x3662
> +#define OV9282_REG_ANA_CORE_2  CCI_REG8(0x3662)
>  #define OV9282_ANA_CORE2_RAW8  0x07
>  #define OV9282_ANA_CORE2_RAW10 0x05
>
> -#define OV9282_REG_TIMING_FORMAT_1     0x3820
> -#define OV9282_REG_TIMING_FORMAT_2     0x3821
> +#define OV9282_REG_TIMING_FORMAT_1     CCI_REG8(0x3820)
> +#define OV9282_REG_TIMING_FORMAT_2     CCI_REG8(0x3821)
>  #define OV9282_FLIP_BIT                        BIT(2)
>
> -#define OV9282_REG_MIPI_CTRL00 0x4800
> +#define OV9282_REG_MIPI_CTRL00 CCI_REG8(0x4800)
>  #define OV9282_GATED_CLOCK     BIT(5)
>
>  /* Flash/Strobe control registers */
> -#define OV9282_REG_STROBE_FRAME_SPAN           0x3925
> +#define OV9282_REG_STROBE_FRAME_SPAN           CCI_REG32(0x3925)
>  #define OV9282_STROBE_FRAME_SPAN_DEFAULT       0x0000001a
>
>  /* Input clock rate */
> @@ -139,16 +141,6 @@ static const char * const ov9282_supply_names[] = {
>
>  #define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
>
> -/**
> - * struct ov9282_reg - ov9282 sensor register
> - * @address: Register address
> - * @val: Register value
> - */
> -struct ov9282_reg {
> -       u16 address;
> -       u8 val;
> -};
> -
>  /**
>   * struct ov9282_reg_list - ov9282 sensor register list
>   * @num_of_regs: Number of registers in the list
> @@ -156,7 +148,7 @@ struct ov9282_reg {
>   */
>  struct ov9282_reg_list {
>         u32 num_of_regs;
> -       const struct ov9282_reg *regs;
> +       const struct cci_reg_sequence *regs;
>  };
>
>  /**
> @@ -188,6 +180,7 @@ struct ov9282_mode {
>   * struct ov9282 - ov9282 sensor device structure
>   * @dev: Pointer to generic device
>   * @sd: V4L2 sub-device
> + * @regmap: Regmap for sensor register access
>   * @pad: Media pad. Only one pad supported
>   * @reset_gpio: Sensor reset gpio
>   * @inclk: Sensor input clock
> @@ -209,6 +202,7 @@ struct ov9282_mode {
>  struct ov9282 {
>         struct device *dev;
>         struct v4l2_subdev sd;
> +       struct regmap *regmap;
>         struct media_pad pad;
>         struct gpio_desc *reset_gpio;
>         struct clk *inclk;
> @@ -241,73 +235,68 @@ static const s64 link_freq[] = {
>   * register arrays as some settings are written as part of ov9282_power_on,
>   * and the reset will clear them.
>   */
> -static const struct ov9282_reg common_regs[] = {
> -       {0x0302, 0x32},
> -       {0x030e, 0x02},
> -       {0x3001, 0x00},
> +static const struct cci_reg_sequence common_regs[] = {
> +       {CCI_REG8(0x0302), 0x32},
> +       {CCI_REG8(0x030e), 0x02},
> +       {CCI_REG8(0x3001), 0x00},
>         {OV9282_REG_OUTPUT_ENABLE4, 0x00},
>         {OV9282_REG_OUTPUT_ENABLE5, 0x00},
>         {OV9282_REG_OUTPUT_ENABLE6, OV9282_OUTPUT_ENABLE6_ILPWM},
> -       {0x3011, 0x0a},
> -       {0x3013, 0x18},
> -       {0x301c, 0xf0},
> -       {0x3022, 0x01},
> -       {0x3030, 0x10},
> -       {0x3039, 0x32},
> -       {0x303a, 0x00},
> +       {CCI_REG8(0x3011), 0x0a},
> +       {CCI_REG8(0x3013), 0x18},
> +       {CCI_REG8(0x301c), 0xf0},
> +       {CCI_REG8(0x3022), 0x01},
> +       {CCI_REG8(0x3030), 0x10},
> +       {CCI_REG8(0x3039), 0x32},
> +       {CCI_REG8(0x303a), 0x00},
>         {OV9282_REG_AEC_MANUAL, OV9282_GAIN_PREC16_EN},
> -       {0x3505, 0x8c},
> -       {0x3507, 0x03},
> -       {0x3508, 0x00},
> -       {0x3610, 0x80},
> -       {0x3611, 0xa0},
> -       {0x3620, 0x6e},
> -       {0x3632, 0x56},
> -       {0x3633, 0x78},
> -       {0x3666, 0x00},
> -       {0x366f, 0x5a},
> -       {0x3680, 0x84},
> -       {0x3712, 0x80},
> -       {0x372d, 0x22},
> -       {0x3731, 0x80},
> -       {0x3732, 0x30},
> -       {0x377d, 0x22},
> -       {0x3788, 0x02},
> -       {0x3789, 0xa4},
> -       {0x378a, 0x00},
> -       {0x378b, 0x4a},
> -       {0x3799, 0x20},
> -       {0x3881, 0x42},
> -       {0x38a8, 0x02},
> -       {0x38a9, 0x80},
> -       {0x38b1, 0x00},
> -       {0x38c4, 0x00},
> -       {0x38c5, 0xc0},
> -       {0x38c6, 0x04},
> -       {0x38c7, 0x80},
> -       {0x3920, 0xff},
> -       {0x4010, 0x40},
> -       {0x4043, 0x40},
> -       {0x4307, 0x30},
> -       {0x4317, 0x00},
> -       {0x4501, 0x00},
> -       {0x450a, 0x08},
> -       {0x4601, 0x04},
> -       {0x470f, 0x00},
> -       {0x4f07, 0x00},
> -       {0x5000, 0x9f},
> -       {0x5001, 0x00},
> -       {0x5e00, 0x00},
> -       {0x5d00, 0x07},
> -       {0x5d01, 0x00},
> -       {0x0101, 0x01},
> -       {0x1000, 0x03},
> -       {0x5a08, 0x84},
> -};
> -
> -static struct ov9282_reg_list common_regs_list = {
> -       .num_of_regs = ARRAY_SIZE(common_regs),
> -       .regs = common_regs,
> +       {CCI_REG8(0x3505), 0x8c},
> +       {CCI_REG8(0x3507), 0x03},
> +       {CCI_REG8(0x3508), 0x00},
> +       {CCI_REG8(0x3610), 0x80},
> +       {CCI_REG8(0x3611), 0xa0},
> +       {CCI_REG8(0x3620), 0x6e},
> +       {CCI_REG8(0x3632), 0x56},
> +       {CCI_REG8(0x3633), 0x78},
> +       {CCI_REG8(0x3666), 0x00},
> +       {CCI_REG8(0x366f), 0x5a},
> +       {CCI_REG8(0x3680), 0x84},
> +       {CCI_REG8(0x3712), 0x80},
> +       {CCI_REG8(0x372d), 0x22},
> +       {CCI_REG8(0x3731), 0x80},
> +       {CCI_REG8(0x3732), 0x30},
> +       {CCI_REG8(0x377d), 0x22},
> +       {CCI_REG8(0x3788), 0x02},
> +       {CCI_REG8(0x3789), 0xa4},
> +       {CCI_REG8(0x378a), 0x00},
> +       {CCI_REG8(0x378b), 0x4a},
> +       {CCI_REG8(0x3799), 0x20},
> +       {CCI_REG8(0x3881), 0x42},
> +       {CCI_REG8(0x38a8), 0x02},
> +       {CCI_REG8(0x38a9), 0x80},
> +       {CCI_REG8(0x38b1), 0x00},
> +       {CCI_REG8(0x38c4), 0x00},
> +       {CCI_REG8(0x38c5), 0xc0},
> +       {CCI_REG8(0x38c6), 0x04},
> +       {CCI_REG8(0x38c7), 0x80},
> +       {CCI_REG8(0x3920), 0xff},
> +       {CCI_REG8(0x4010), 0x40},
> +       {CCI_REG8(0x4043), 0x40},
> +       {CCI_REG8(0x4307), 0x30},
> +       {CCI_REG8(0x4317), 0x00},
> +       {CCI_REG8(0x4501), 0x00},
> +       {CCI_REG8(0x450a), 0x08},
> +       {CCI_REG8(0x4601), 0x04},
> +       {CCI_REG8(0x470f), 0x00},
> +       {CCI_REG8(0x4f07), 0x00},
> +       {CCI_REG8(0x5000), 0x9f},
> +       {CCI_REG8(0x5001), 0x00},
> +       {CCI_REG8(0x5e00), 0x00},
> +       {CCI_REG8(0x5d00), 0x07},
> +       {CCI_REG8(0x5d01), 0x00},
> +       {CCI_REG8(0x0101), 0x01},
> +       {CCI_REG8(0x1000), 0x03},
> +       {CCI_REG8(0x5a08), 0x84},
>  };
>
>  #define MODE_1280_800          0
> @@ -317,96 +306,96 @@ static struct ov9282_reg_list common_regs_list = {
>  #define DEFAULT_MODE           MODE_1280_720
>
>  /* Sensor mode registers */
> -static const struct ov9282_reg mode_1280x800_regs[] = {
> -       {0x3778, 0x00},
> -       {0x3800, 0x00},
> -       {0x3801, 0x00},
> -       {0x3802, 0x00},
> -       {0x3803, 0x00},
> -       {0x3804, 0x05},
> -       {0x3805, 0x0f},
> -       {0x3806, 0x03},
> -       {0x3807, 0x2f},
> -       {0x3808, 0x05},
> -       {0x3809, 0x00},
> -       {0x380a, 0x03},
> -       {0x380b, 0x20},
> -       {0x3810, 0x00},
> -       {0x3811, 0x08},
> -       {0x3812, 0x00},
> -       {0x3813, 0x08},
> -       {0x3814, 0x11},
> -       {0x3815, 0x11},
> +static const struct cci_reg_sequence mode_1280x800_regs[] = {
> +       {CCI_REG8(0x3778), 0x00},
> +       {CCI_REG8(0x3800), 0x00},
> +       {CCI_REG8(0x3801), 0x00},
> +       {CCI_REG8(0x3802), 0x00},
> +       {CCI_REG8(0x3803), 0x00},
> +       {CCI_REG8(0x3804), 0x05},
> +       {CCI_REG8(0x3805), 0x0f},
> +       {CCI_REG8(0x3806), 0x03},
> +       {CCI_REG8(0x3807), 0x2f},
> +       {CCI_REG8(0x3808), 0x05},
> +       {CCI_REG8(0x3809), 0x00},
> +       {CCI_REG8(0x380a), 0x03},
> +       {CCI_REG8(0x380b), 0x20},
> +       {CCI_REG8(0x3810), 0x00},
> +       {CCI_REG8(0x3811), 0x08},
> +       {CCI_REG8(0x3812), 0x00},
> +       {CCI_REG8(0x3813), 0x08},
> +       {CCI_REG8(0x3814), 0x11},
> +       {CCI_REG8(0x3815), 0x11},
>         {OV9282_REG_TIMING_FORMAT_1, 0x40},
>         {OV9282_REG_TIMING_FORMAT_2, 0x00},
> -       {0x4003, 0x40},
> -       {0x4008, 0x04},
> -       {0x4009, 0x0b},
> -       {0x400c, 0x00},
> -       {0x400d, 0x07},
> -       {0x4507, 0x00},
> -       {0x4509, 0x00},
> +       {CCI_REG8(0x4003), 0x40},
> +       {CCI_REG8(0x4008), 0x04},
> +       {CCI_REG8(0x4009), 0x0b},
> +       {CCI_REG8(0x400c), 0x00},
> +       {CCI_REG8(0x400d), 0x07},
> +       {CCI_REG8(0x4507), 0x00},
> +       {CCI_REG8(0x4509), 0x00},
>  };
>
> -static const struct ov9282_reg mode_1280x720_regs[] = {
> -       {0x3778, 0x00},
> -       {0x3800, 0x00},
> -       {0x3801, 0x00},
> -       {0x3802, 0x00},
> -       {0x3803, 0x00},
> -       {0x3804, 0x05},
> -       {0x3805, 0x0f},
> -       {0x3806, 0x02},
> -       {0x3807, 0xdf},
> -       {0x3808, 0x05},
> -       {0x3809, 0x00},
> -       {0x380a, 0x02},
> -       {0x380b, 0xd0},
> -       {0x3810, 0x00},
> -       {0x3811, 0x08},
> -       {0x3812, 0x00},
> -       {0x3813, 0x08},
> -       {0x3814, 0x11},
> -       {0x3815, 0x11},
> +static const struct cci_reg_sequence mode_1280x720_regs[] = {
> +       {CCI_REG8(0x3778), 0x00},
> +       {CCI_REG8(0x3800), 0x00},
> +       {CCI_REG8(0x3801), 0x00},
> +       {CCI_REG8(0x3802), 0x00},
> +       {CCI_REG8(0x3803), 0x00},
> +       {CCI_REG8(0x3804), 0x05},
> +       {CCI_REG8(0x3805), 0x0f},
> +       {CCI_REG8(0x3806), 0x02},
> +       {CCI_REG8(0x3807), 0xdf},
> +       {CCI_REG8(0x3808), 0x05},
> +       {CCI_REG8(0x3809), 0x00},
> +       {CCI_REG8(0x380a), 0x02},
> +       {CCI_REG8(0x380b), 0xd0},
> +       {CCI_REG8(0x3810), 0x00},
> +       {CCI_REG8(0x3811), 0x08},
> +       {CCI_REG8(0x3812), 0x00},
> +       {CCI_REG8(0x3813), 0x08},
> +       {CCI_REG8(0x3814), 0x11},
> +       {CCI_REG8(0x3815), 0x11},
>         {OV9282_REG_TIMING_FORMAT_1, 0x3c},
>         {OV9282_REG_TIMING_FORMAT_2, 0x84},
> -       {0x4003, 0x40},
> -       {0x4008, 0x02},
> -       {0x4009, 0x05},
> -       {0x400c, 0x00},
> -       {0x400d, 0x03},
> -       {0x4507, 0x00},
> -       {0x4509, 0x80},
> +       {CCI_REG8(0x4003), 0x40},
> +       {CCI_REG8(0x4008), 0x02},
> +       {CCI_REG8(0x4009), 0x05},
> +       {CCI_REG8(0x400c), 0x00},
> +       {CCI_REG8(0x400d), 0x03},
> +       {CCI_REG8(0x4507), 0x00},
> +       {CCI_REG8(0x4509), 0x80},
>  };
>
> -static const struct ov9282_reg mode_640x400_regs[] = {
> -       {0x3778, 0x10},
> -       {0x3800, 0x00},
> -       {0x3801, 0x00},
> -       {0x3802, 0x00},
> -       {0x3803, 0x00},
> -       {0x3804, 0x05},
> -       {0x3805, 0x0f},
> -       {0x3806, 0x03},
> -       {0x3807, 0x2f},
> -       {0x3808, 0x02},
> -       {0x3809, 0x80},
> -       {0x380a, 0x01},
> -       {0x380b, 0x90},
> -       {0x3810, 0x00},
> -       {0x3811, 0x04},
> -       {0x3812, 0x00},
> -       {0x3813, 0x04},
> -       {0x3814, 0x31},
> -       {0x3815, 0x22},
> +static const struct cci_reg_sequence mode_640x400_regs[] = {
> +       {CCI_REG8(0x3778), 0x10},
> +       {CCI_REG8(0x3800), 0x00},
> +       {CCI_REG8(0x3801), 0x00},
> +       {CCI_REG8(0x3802), 0x00},
> +       {CCI_REG8(0x3803), 0x00},
> +       {CCI_REG8(0x3804), 0x05},
> +       {CCI_REG8(0x3805), 0x0f},
> +       {CCI_REG8(0x3806), 0x03},
> +       {CCI_REG8(0x3807), 0x2f},
> +       {CCI_REG8(0x3808), 0x02},
> +       {CCI_REG8(0x3809), 0x80},
> +       {CCI_REG8(0x380a), 0x01},
> +       {CCI_REG8(0x380b), 0x90},
> +       {CCI_REG8(0x3810), 0x00},
> +       {CCI_REG8(0x3811), 0x04},
> +       {CCI_REG8(0x3812), 0x00},
> +       {CCI_REG8(0x3813), 0x04},
> +       {CCI_REG8(0x3814), 0x31},
> +       {CCI_REG8(0x3815), 0x22},
>         {OV9282_REG_TIMING_FORMAT_1, 0x60},
>         {OV9282_REG_TIMING_FORMAT_2, 0x01},
> -       {0x4008, 0x02},
> -       {0x4009, 0x05},
> -       {0x400c, 0x00},
> -       {0x400d, 0x03},
> -       {0x4507, 0x03},
> -       {0x4509, 0x80},
> +       {CCI_REG8(0x4008), 0x02},
> +       {CCI_REG8(0x4009), 0x05},
> +       {CCI_REG8(0x400c), 0x00},
> +       {CCI_REG8(0x400d), 0x03},
> +       {CCI_REG8(0x4507), 0x03},
> +       {CCI_REG8(0x4509), 0x80},
>  };
>
>  /* Supported sensor mode configurations */
> @@ -485,97 +474,6 @@ static inline struct ov9282 *to_ov9282(struct v4l2_subdev *subdev)
>         return container_of(subdev, struct ov9282, sd);
>  }
>
> -/**
> - * ov9282_read_reg() - Read registers.
> - * @ov9282: pointer to ov9282 device
> - * @reg: register address
> - * @len: length of bytes to read. Max supported bytes is 4
> - * @val: pointer to register value to be filled.
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
> -static int ov9282_read_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 *val)
> -{
> -       struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
> -       struct i2c_msg msgs[2] = {0};
> -       u8 addr_buf[2] = {0};
> -       u8 data_buf[4] = {0};
> -       int ret;
> -
> -       if (WARN_ON(len > 4))
> -               return -EINVAL;
> -
> -       put_unaligned_be16(reg, addr_buf);
> -
> -       /* Write register address */
> -       msgs[0].addr = client->addr;
> -       msgs[0].flags = 0;
> -       msgs[0].len = ARRAY_SIZE(addr_buf);
> -       msgs[0].buf = addr_buf;
> -
> -       /* Read data from register */
> -       msgs[1].addr = client->addr;
> -       msgs[1].flags = I2C_M_RD;
> -       msgs[1].len = len;
> -       msgs[1].buf = &data_buf[4 - len];
> -
> -       ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> -       if (ret != ARRAY_SIZE(msgs))
> -               return -EIO;
> -
> -       *val = get_unaligned_be32(data_buf);
> -
> -       return 0;
> -}
> -
> -/**
> - * ov9282_write_reg() - Write register
> - * @ov9282: pointer to ov9282 device
> - * @reg: register address
> - * @len: length of bytes. Max supported bytes is 4
> - * @val: register value
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
> -static int ov9282_write_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 val)
> -{
> -       struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
> -       u8 buf[6] = {0};
> -
> -       if (WARN_ON(len > 4))
> -               return -EINVAL;
> -
> -       put_unaligned_be16(reg, buf);
> -       put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> -       if (i2c_master_send(client, buf, len + 2) != len + 2)
> -               return -EIO;
> -
> -       return 0;
> -}
> -
> -/**
> - * ov9282_write_regs() - Write a list of registers
> - * @ov9282: pointer to ov9282 device
> - * @regs: list of registers to be written
> - * @len: length of registers array
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
> -static int ov9282_write_regs(struct ov9282 *ov9282,
> -                            const struct ov9282_reg *regs, u32 len)
> -{
> -       unsigned int i;
> -       int ret;
> -
> -       for (i = 0; i < len; i++) {
> -               ret = ov9282_write_reg(ov9282, regs[i].address, 1, regs[i].val);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> -}
> -
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming mode
>   * @ov9282: pointer to ov9282 device
> @@ -639,15 +537,15 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>         dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
>                 exposure, exposure_us, gain);
>
> -       ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
> +       ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
>         if (ret)
>                 return ret;
>
> -       ret = ov9282_write_reg(ov9282, OV9282_REG_EXPOSURE, 3, exposure << 4);
> +       ret = cci_write(ov9282->regmap, OV9282_REG_EXPOSURE, exposure << 4, NULL);
>         if (ret)
>                 goto error_release_group_hold;
>
> -       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
> +       ret = cci_write(ov9282->regmap, OV9282_REG_AGAIN, gain, NULL);
>         if (ret)
>                 goto error_release_group_hold;
>
> @@ -656,60 +554,9 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>                                        OV9282_STROBE_FRAME_SPAN_DEFAULT);
>
>  error_release_group_hold:
> -       ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
> -
> -       return ret;
> -}
> -
> -static int ov9282_set_ctrl_hflip(struct ov9282 *ov9282, int value)
> -{
> -       u32 current_val;
> -       int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
> -                                 &current_val);
> -       if (ret)
> -               return ret;
> +       int ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
>
> -       if (value)
> -               current_val |= OV9282_FLIP_BIT;
> -       else
> -               current_val &= ~OV9282_FLIP_BIT;
> -
> -       return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
> -                               current_val);
> -}
> -
> -static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
> -{
> -       u32 current_val;
> -       int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
> -                                 &current_val);
> -       if (ret)
> -               return ret;
> -
> -       if (value)
> -               current_val |= OV9282_FLIP_BIT;
> -       else
> -               current_val &= ~OV9282_FLIP_BIT;
> -
> -       return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
> -                               current_val);
> -}
> -
> -static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
> -{
> -       u32 current_val;
> -       int ret;
> -
> -       ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, &current_val);
> -       if (ret)
> -               return ret;
> -
> -       if (enable)
> -               current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
> -       else
> -               current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
> -
> -       return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
> +       return ret ? ret : ret_hold;
>  }
>
>  static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
> @@ -740,30 +587,6 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
>         return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
>  }
>
> -static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> -{
> -       u32 val = ov9282_us_to_flash_duration(ov9282, value);
> -       int ret;
> -
> -       ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
> -                              (val >> 24) & 0xff);
> -       if (ret)
> -               return ret;
> -
> -       ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 1, 1,
> -                              (val >> 16) & 0xff);
> -       if (ret)
> -               return ret;
> -
> -       ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 2, 1,
> -                              (val >> 8) & 0xff);
> -       if (ret)
> -               return ret;
> -
> -       return ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 3, 1,
> -                               val & 0xff);
> -}
> -
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -818,23 +641,27 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_VBLANK:
>                 lpfr = ov9282->vblank + ov9282->cur_mode->height;
> -               ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
> +               ret = cci_write(ov9282->regmap, OV9282_REG_LPFR, lpfr, NULL);
>                 break;
>         case V4L2_CID_HFLIP:
> -               ret = ov9282_set_ctrl_hflip(ov9282, ctrl->val);
> +               ret = cci_update_bits(ov9282->regmap, OV9282_REG_TIMING_FORMAT_2,
> +                                     OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
>                 break;
>         case V4L2_CID_VFLIP:
> -               ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
> +               ret = cci_update_bits(ov9282->regmap, OV9282_REG_TIMING_FORMAT_1,
> +                                     OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
>                 break;
>         case V4L2_CID_HBLANK:
> -               ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
> -                                      (ctrl->val + ov9282->cur_mode->width) >> 1);
> +               ret = cci_write(ov9282->regmap, OV9282_REG_TIMING_HTS,
> +                               (ctrl->val + ov9282->cur_mode->width) >> 1, NULL);
>                 break;
>         case V4L2_CID_FLASH_STROBE_OE:
> -               ret = ov9282_set_ctrl_flash_strobe_oe(ov9282, ctrl->val);
> +               ret = cci_update_bits(ov9282->regmap, OV9282_REG_OUTPUT_ENABLE6,
> +                                     OV9282_OUTPUT_ENABLE6_STROBE,
> +                                     ctrl->val ? OV9282_OUTPUT_ENABLE6_STROBE : 0, NULL);
>                 break;
>         case V4L2_CID_FLASH_DURATION:
> -               ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
> +               ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
>                 break;
>         default:
>                 dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> @@ -1114,7 +941,7 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
>   */
>  static int ov9282_start_streaming(struct ov9282 *ov9282)
>  {
> -       const struct ov9282_reg bitdepth_regs[2][2] = {
> +       const struct cci_reg_sequence bitdepth_regs[2][2] = {
>                 {
>                         {OV9282_REG_PLL_CTRL_0D, OV9282_PLL_CTRL_0D_RAW10},
>                         {OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW10},
> @@ -1128,15 +955,16 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>         int ret;
>
>         /* Write common registers */
> -       ret = ov9282_write_regs(ov9282, common_regs_list.regs,
> -                               common_regs_list.num_of_regs);
> +       ret = cci_multi_reg_write(ov9282->regmap, common_regs,
> +                                 ARRAY_SIZE(common_regs), NULL);
>         if (ret) {
>                 dev_err(ov9282->dev, "fail to write common registers");
>                 return ret;
>         }
>
>         bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
> -       ret = ov9282_write_regs(ov9282, bitdepth_regs[bitdepth_index], 2);
> +       ret = cci_multi_reg_write(ov9282->regmap,
> +                                 bitdepth_regs[bitdepth_index], 2, NULL);
>         if (ret) {
>                 dev_err(ov9282->dev, "fail to write bitdepth regs");
>                 return ret;
> @@ -1144,7 +972,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>
>         /* Write sensor mode registers */
>         reg_list = &ov9282->cur_mode->reg_list;
> -       ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
> +       ret = cci_multi_reg_write(ov9282->regmap, reg_list->regs,
> +                                 reg_list->num_of_regs, NULL);
>         if (ret) {
>                 dev_err(ov9282->dev, "fail to write initial registers");
>                 return ret;
> @@ -1158,8 +987,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>         }
>
>         /* Start streaming */
> -       ret = ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
> -                              1, OV9282_MODE_STREAMING);
> +       ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
> +                       OV9282_MODE_STREAMING, NULL);
>         if (ret) {
>                 dev_err(ov9282->dev, "fail to start streaming");
>                 return ret;
> @@ -1176,8 +1005,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>   */
>  static int ov9282_stop_streaming(struct ov9282 *ov9282)
>  {
> -       return ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
> -                               1, OV9282_MODE_STANDBY);
> +       return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
> +                        OV9282_MODE_STANDBY, NULL);
>  }
>
>  /**
> @@ -1228,14 +1057,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>  static int ov9282_detect(struct ov9282 *ov9282)
>  {
>         int ret;
> -       u32 val;
> +       u64 val;
>
> -       ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
> +       ret = cci_read(ov9282->regmap, OV9282_REG_ID, &val, NULL);
>         if (ret)
>                 return ret;
>
>         if (val != OV9282_ID) {
> -               dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
> +               dev_err(ov9282->dev, "chip id mismatch: %x!=%llx",
>                         OV9282_ID, val);
>                 return -ENXIO;
>         }
> @@ -1397,9 +1226,8 @@ static int ov9282_power_on(struct device *dev)
>
>         usleep_range(400, 600);
>
> -       ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
> -                              ov9282->noncontinuous_clock ?
> -                                       OV9282_GATED_CLOCK : 0);
> +       ret = cci_write(ov9282->regmap, OV9282_REG_MIPI_CTRL00,
> +                       ov9282->noncontinuous_clock ? OV9282_GATED_CLOCK : 0, NULL);
>         if (ret) {
>                 dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
>                 goto error_clk;
> @@ -1576,6 +1404,11 @@ static int ov9282_probe(struct i2c_client *client)
>                 return ret;
>         }
>
> +       ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(ov9282->regmap))
> +               return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
> +                                    "Failed to init CCI\n");
> +
>         mutex_init(&ov9282->mutex);
>
>         ret = ov9282_power_on(ov9282->dev);
> --
> 2.43.0
>


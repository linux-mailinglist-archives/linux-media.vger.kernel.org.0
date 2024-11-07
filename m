Return-Path: <linux-media+bounces-21054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF1D9C05DE
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 13:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29CB9B21E0E
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 12:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD69220EA26;
	Thu,  7 Nov 2024 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MJASZmwv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900421DFDB8
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982736; cv=none; b=eaIXvVRoSdjMdc9maXlbkU727vTeOMD4FIORBEkEL7t71HYFahhky7IFvO3AJUOvsJCEaylSb1r7m76j065C3+JjYC70Ekw0KuyeLkYNxuaf2AKyV8ZM1iCvIbn2mZzU5NFUUAu9ZWlSzKmrSBaHdoDxJx/dTbF9qTcOfC7Xtbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982736; c=relaxed/simple;
	bh=PkvGaCZSQRLg0FLoOnIAYIDTFw0XOPOcGbX491R08xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GU6wl3TJp4LIRO9eO4jG0ERcIj1AtKFq7iTMmmWamTBej0lOu3qszP0NomwbuzGYnV4tDtirTJOuIRZ0uPduJ68Ri2gRvJ2xM+H6+Wrr3r5R5M+nst2HADIj9kL+E04sNmVVuEMAanczo8UurKgRmVsmUC/ZfbQqyTtXvLYvSO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MJASZmwv; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea11b32ab4so6789387b3.0
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 04:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1730982733; x=1731587533; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SZJs0BEufjRRU2dgBlzMzSGXmB6/6JZ8aVJNkIRykgU=;
        b=MJASZmwv/CIllH4nToNVSItR6ku5UWecmVDUwsVEK+pvYIhFH9BC/m8d/ygMUrBZqM
         e3mkX1hYKWirEE182cp7Amx1ti0M8LD7tapCzCWNmWKt/Z1ywPyXP/KBw8b/OJTFcqvZ
         mgp/5hpfYeoQSqeUbiSjAiNrWYei5daQm7VX5ukZhYAspJqZ8dWi4EqlhstQPE1Reo1K
         C1S+lGGipHJRty/p01OwquhYLXSrHXihX9I6io8a64MinwP9NuB8vbKdAvVaWZkEWFoZ
         31BitT4sxk2CnvxR78m3UwujFpYijh/QbWTGUuSt6oUE6we3mPrk0Nrqdtt9uuFWPca1
         9Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982733; x=1731587533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZJs0BEufjRRU2dgBlzMzSGXmB6/6JZ8aVJNkIRykgU=;
        b=FVqPKmrgmnhZB0kzKKdhg8CfTWGAXjjTrxbIsfaKOHlTjR3klNpj3pWCLSYe5fraHP
         +UfjmMq1alsweWl5TM89xGNuaaZkDNMlCJ09abzuvZAh6On6QObrjFi/mmXLcPKlG+NT
         0j0PbmlVjP2WdjWngFoCE0DHIE8VWp75Cq3azAwyYn7ShNMGuK/UPPNCtEP96KZzwJ7M
         QEm0zi7NXEOgxNvdICrkSm9AH7Sw2aWTYm8uOblpcMJkjf5mKb1VTNGZr9CxH1UtPLZ4
         R6mbaWfpJNJNqfnpq7enhw937ba8h+355aVprmTpZPhxZhnclQ0tRI5ms2c9njklGc48
         D72A==
X-Forwarded-Encrypted: i=1; AJvYcCVB/AhxxsGInPzlxNbfn0RXaDy1oBDxBVrEOVa659RphEQDWfvT3l/CNWKtqkXt7DzGvGoH+i9ihN2OCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL5RJtr/Na1tjAfMujzOnmUe2zjK6wAqOazFlDM80JTx8Lqi+u
	vbGxrQkc1lNOFVMZXgXtoNWtZlWeY5SwmI9PLF9Wrcfp+iYs7aV3lE+Dti1XZoaYTuX/LqfkgcG
	rm62NXybi35bNOLa4jLCeqy95RL1Z4pOOUaRBew==
X-Google-Smtp-Source: AGHT+IFdOmi1bILKvTjFAc/OH3/D1DSa2tkMZ20qQAXzphEdgcK/JgvRnBJ7bTE7y1ISPIgvtpgvzWvLIqfUU6cIs7o=
X-Received: by 2002:a05:690c:c94:b0:6ea:6644:ddf8 with SMTP id
 00721157ae682-6eacbbf2042mr27714757b3.0.1730982733521; Thu, 07 Nov 2024
 04:32:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com> <20241029-imx219_fixes-v1-1-b45dc3658b4e@ideasonboard.com>
In-Reply-To: <20241029-imx219_fixes-v1-1-b45dc3658b4e@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 7 Nov 2024 12:31:57 +0000
Message-ID: <CAPY8ntBK6r-_mbbt+QG+rVV4oN9bAt+YJ7jr-77vTrECAbQ32g@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: imx219: Correct the minimum vblanking value
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Plowman <david.plowman@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Oct 2024 at 08:58, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> From: David Plowman <david.plowman@raspberrypi.com>
>
> The datasheet for this sensor documents the minimum vblanking as being
> 32 lines. It does fix some problems with occasional black lines at the
> bottom of images (tested on Raspberry Pi).
>
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e78a80b2bb2e455c857390b188c128b28c224778..f98aad74fe584a18e2fe7126f92bf294762a54e3 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -74,7 +74,7 @@
>  #define IMX219_REG_VTS                 CCI_REG16(0x0160)
>  #define IMX219_VTS_MAX                 0xffff
>
> -#define IMX219_VBLANK_MIN              4
> +#define IMX219_VBLANK_MIN              32
>
>  /* HBLANK control - read only */
>  #define IMX219_PPL_DEFAULT             3448
>
> --
> 2.47.0
>


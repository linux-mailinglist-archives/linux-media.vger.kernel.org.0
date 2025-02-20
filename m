Return-Path: <linux-media+bounces-26507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F00A3E143
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF169861F13
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3D7212B01;
	Thu, 20 Feb 2025 16:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZeJoGCmi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65F7204840
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069773; cv=none; b=RgKxbEGp/f9BY6S/0o08vR4+OqMhZDY1/v/2JeZeCUBu4BoiGiOmq28eu3cv1/48+fqOH1L7yRO4ODNXdng+8PVts52zyfXbOVCWKjAtq8nx/yC0lkdr4UK9fhZmN9VRBaCcoANUw20+50eVA2L8btI5X2BZFyLgY9t5MJRUc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069773; c=relaxed/simple;
	bh=iHAP1ym04ciyXYXsL6+cShuwn/OnOyhMCf6b9UKoD9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRNEhxoouz2RbIFCo/8YQsPu7u9OtXNoDKsTQCgd4VRLmRm88YXiJxsZ0ThjOhUjnKUfdOl+gnnP+++FN6t2cQeVbGJoKnvCA/5L41/XzwK3Jhstqah96UgtjVC1JjlbnUx0Kc79UuXq8cw5/75iPwoPVwpJsP4J9PyH9W8qMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ZeJoGCmi; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f679788fd1so8227867b3.2
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 08:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740069771; x=1740674571; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zn2BpS7MQmtroOwibVSkOLV+vUdoUAolAZtY2D0Y9Lg=;
        b=ZeJoGCmiBUtmk4iYnElPlV4tco8B6RMafUrxzWaDzDNBv511yMqLJUyAp1wt2NsuFU
         9Wn+FYYe2cnHeGWoCQANFgZdX+igiKZ8luBFHZ8FQOcHToQbeozP6kIiMwtjlGPzkvUe
         4ntu4usloG09CdKHp5ghhxlAs5aQinihPF356X1z1MgJYlXJl+By0tGVnN5Z5DpSa0f7
         W469hqvaFXvBdQO/yLv2BGNiF06xyxCEYb9T50+hH1Ju8+lv4efLZeIVxPt2mJ7dqQWx
         UNKQHt/ijDk+hl9//69gJK7QJatWgia/CwNJKkAzLZHUHYUOamHC3RmKFo8f3DTyjvOZ
         4PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740069771; x=1740674571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zn2BpS7MQmtroOwibVSkOLV+vUdoUAolAZtY2D0Y9Lg=;
        b=Yth3rCmEsglTpVnNcRTN0jf5NomPqaGcEPtHkuS18KIltN+cn8596gXbxukj8KF6c2
         kmrXrJHNjAYvYb6jCdoBod0E5fZqd9RTDNGKerxni0jHebX9Ea6D5Z/re8eK4BDBhWcK
         wBHxgszpmnoiGHPp2XWlufyW2XGO2TvUi9KF/rlwa4C5wh8LT0uRGQJ38f+bglLHpOpO
         x/dCgxJqifW4SHvjRDUbdy8eE5Kc77oRxY63M+Ux5lgIQXex3ByDrFZpZg2q/J/W2MLI
         plZo6R/3rK5sfMxc4DcLiKX2QdcxzoqmXMOJi2OQ+C7A1CPqpLfKx+GbCqqFNuoGF8nl
         RrsA==
X-Gm-Message-State: AOJu0YzSy7j1NlZvQmopRf0FCHNcZ0prxsBFCpmJ+t1Jpu6vVyiGmUyc
	beLQ1BpiXGFXLEwIl2g48PTIuGzMMeUTZ1eHqnRqKrPmHi5tIpia35xfXoy5b1eACN0MY/JkVz+
	Aocz2xehuVxH8fo8If9wkoM9HHaHRtmiedXPam5M4waXYgM3l
X-Gm-Gg: ASbGncvM9OmUJ1Ir30WRFn7q2+CKXceDlbfKMpK6g41z69pf+ulmkEr4fmErJiLqFsX
	3Y/rQIa0evoedHPuqHMIb0ZT99QeCSck8N0ZhoMawOUc0H0iyW4onxAzQ6MvryxuJ85ncVJ3ON8
	URRh3l32j8K9DJXbBs18AbKHzNtZaX
X-Google-Smtp-Source: AGHT+IFvPoD/ihWv53Ks7nhLKsgFRUE2Vbi8hoA9uajK2q4JQpFtTeTXrw2qcXWuJinvyPE7l47skwfyRv1zW837CcE=
X-Received: by 2002:a05:690c:a85:b0:6fb:a92b:856b with SMTP id
 00721157ae682-6fbbb656670mr26670347b3.21.1740069770781; Thu, 20 Feb 2025
 08:42:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219094637.607615-1-eagle.alexander923@gmail.com> <20250219094637.607615-2-eagle.alexander923@gmail.com>
In-Reply-To: <20250219094637.607615-2-eagle.alexander923@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 20 Feb 2025 16:42:34 +0000
X-Gm-Features: AWEUYZlCXgMlurtGbIbgW0i7S6Vz-SIDo8m3Lr2eXCBPPbv8Phz1d6ot-SfG8Pc
Message-ID: <CAPY8ntC4MbKBb6j9Xj4+=U1G3bOAZuxS9kMdHtTBWwX3AOHuuw@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: i2c: imx415: Add missing ADBIT1 register for
 setup output format
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexander

On Wed, 19 Feb 2025 at 09:57, Alexander Shiyan
<eagle.alexander923@gmail.com> wrote:
>
> The imx415 sensor has one more register for setting the output
> format (10/12 bit), which is currently not in the driver.

The datasheet states it is the "internal A/D conversion bits" setting,
not output format.
Output format is set via MDBIT (reg 0x3032).

The sensor may well happily truncate 12bit A/D readout to RAW10
output, or left shift 10bit A/D values to RAW12 output.

I'll defer to Wolfvision on this one as I would expect them as the
original authors to have been given a register list by Sony for the
readout modes that they were interested in. Sony may therefore have
recommended this apparent mismatch in A/D depth vs output format.

  Dave

> The patch adds it.
>
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/i2c/imx415.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 16a52900c61c..c5beba4da18b 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -77,6 +77,7 @@
>  #define IMX415_INCKSEL5                  CCI_REG8(0x311e)
>  #define IMX415_DIG_CLP_MODE      CCI_REG8(0x32c8)
>  #define IMX415_WRJ_OPEN                  CCI_REG8(0x3390)
> +#define IMX415_ADBIT1            CCI_REG8(0x3701)
>  #define IMX415_SENSOR_INFO       CCI_REG16_LE(0x3f12)
>  #define IMX415_SENSOR_INFO_MASK          0xfff
>  #define IMX415_CHIP_ID           0x514
> @@ -581,6 +582,7 @@ static const struct cci_reg_sequence imx415_init_table[] = {
>         { IMX415_REVERSE, 0x00 },
>         /* use RAW 10-bit mode */
>         { IMX415_ADBIT, 0x00 },
> +       { IMX415_ADBIT1, 0x00 },
>         { IMX415_MDBIT, 0x00 },
>         /* output VSYNC on XVS and low on XHS */
>         { IMX415_OUTSEL, 0x22 },
> --
> 2.39.1
>
>


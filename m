Return-Path: <linux-media+bounces-44136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B559BCAC2F
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 22:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CB4A23534CD
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 20:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32C0265298;
	Thu,  9 Oct 2025 20:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CEgg8MOR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6529B2641C3
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 20:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760040683; cv=none; b=bgdeaoPkpW5JM7TYZXzKyUUxD7/IKqLukrQ+41IowXbBFUYIMqW/gVUfCnhG/c3zo0/3+2gRjDxXzsm5Bu3jyoLx0FP1E8NVRsw5egeuRxOMr0oPohMwIjp/lxxCze8qLWY6ImEn+wDGzxzrMWMmgGVNyuZfPAVj0BWrGF1arrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760040683; c=relaxed/simple;
	bh=GH/isMXZuyY6n7CPnG1haS9m5ZS6KNNrdO16o7tR+Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmQ8/AV07JNDPAA5hVa4nLa/Wq81PT+E7dcf2Bfhn8dgfDs/Dp/GAr1M0AM6TLVPHN8HqHTry7EqafLXFZx3uyP5RCzHdfrvpRpFb5l0eXGZ6/LM69mqKrU1SdrdPAg/iHFPHOxxkzUWN5J0Qb5Z2NwRbIwOWZJ01D4/Ptfp2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CEgg8MOR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso1271350f8f.0
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 13:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760040680; x=1760645480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0bxSC9qVdAO+PHu6prllXc1vwxGvmh0YPQ8osQBxSA=;
        b=CEgg8MORPxtBHBJgfMMPwJj5XYaeA53FuO8l3JSVqJYfYtQCDTdAo67Px9GPCmOwzF
         EAyAD34u2CA3ZPwIrh2ohClDQOWR9SMfKGK/72ZcOH5A46fVeXb3PqCzAmeEDHAhg6Ys
         iKmaxtIQAirkEmQtHoEEarFvoGBaJDE6XwAo9ZnU3f1iDuiFXF2F2D//7x/BsizZWE7a
         WhBZB6aH+HfjcgKwUw4f0DNTSgc6i9z5ijsRUyzA+9/DzgOIhtdmsgqkaWHWRn6HI062
         YlyiK5ZrG9MKduy//tau/CTEclMBo5PxhoI+WmABjxl5EdOX9RHuLlil2I+frZMMaRdn
         67XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760040680; x=1760645480;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0bxSC9qVdAO+PHu6prllXc1vwxGvmh0YPQ8osQBxSA=;
        b=VV2XXkWWexTLhEmIvIDdCOEIOxNzCx2U9sIbmu1jp0zSOsLHKAUEHd0TrzJ+2WaW8h
         pKnhvzCW94bo78aX0X4CGDWbif+3/UBxaFMPeIRM2nEzJcr5k07levFJWiNTS256GU9z
         zshYNMaMgfvb7MBjFOBYF9+ys0HRNsNntMYDTYeEzLV8+FBATSPHKA0AYRtguh765LdS
         TqkUDw4uwQjwrEt28vfp51yPErcFRZYmJlCjya6HQhw5x7gC+Cn1/EXOXESH0TEKbScR
         2Kq19Olzh7Kz0zAkRnp1H1SDzr/4mdLZovjQSjdYkMbciVgawYancQU7quXB3YkmFu9m
         z60Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZYm2jaZ1HjXwy/hX93fY1T7vcvJ/CqMqmUsnqSKmiuW2Zo2PJnOWeBXIPqUVTuNnIU5Kp3qgXV8+dfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg165j3gcJccqa5+CdRYUfwCwwfmwqv549jc6cTxSZiS3gyUoN
	OEGRLQGy/fkd8WqmeUfUYaWSKQhOobll0i7GN44ZRbvRRSkHQ3cqffXOAsAnWzE2XwY=
X-Gm-Gg: ASbGncuHBez69NNIQm6yTeEyfL6XerMaiu8k1/w+hz748dbdv8b4M++NsW8sKd2BWqx
	JI1UmtWojRueDPMfgxqH4X5PY6R495oDTgiau7VD6serJhjE02zoecV1jz7k8smNSIjWPjODMdl
	+BfvsP5xaWuAeQ05aQaxigtoL8S+dXN0fKAHoUIAV2lY/IQB+qKkLkriNuHBHiHxHZm9NbWttpH
	fTc4oP0SDGHw2KuVOuuP1P8XVZBSMnTJ+aTF7q6qwKtxxDthrKgnShRhluVtzwXZRQ/SJQHG3ah
	aLHh0/k33NerFvKPKXYIeoM80thifBISPqPCqyGsrolDpCO70tWXIq/vaeiH600xc7Hfs93wGNe
	5FoxxI1LjRhJcyR5Yt/Qr3Ih2xFwog9jKvMPkTKvhqslcpTaZcHy3MYoFwA==
X-Google-Smtp-Source: AGHT+IFuLsi4wmsunBeslCI8cKWeFy4ZUEWU/gsK5+phruyOaGgG2/phEeGUm4ke9yIArdmP/BdHLA==
X-Received: by 2002:a5d:5f96:0:b0:3ec:42f9:952b with SMTP id ffacd0b85a97d-42666a9e191mr6428067f8f.4.1760040679687;
        Thu, 09 Oct 2025 13:11:19 -0700 (PDT)
Received: from [192.168.0.36] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf70fsm563238f8f.27.2025.10.09.13.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 13:11:19 -0700 (PDT)
Message-ID: <7b861236-8317-4435-8582-bd97f545e322@linaro.org>
Date: Thu, 9 Oct 2025 23:11:17 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] media: microchip-isc: Color correction and
 histogram stats
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: Chas Williams <3chas3@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Hans Verkuil <hverkuil@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bala,

On 10/9/25 18:52, Balamanikandan Gunasundar wrote:
> Hi,
> 
> This patch series has a set of enhancements to the Microchip Image Sensor
> Controller driver. The objective is to expand its image processing
> capabilities and to improve the colors.
> 
> This series also introduces a new stats driver that exposes the histogram
> data to userspace via v4l2 controls. This allows applications such as
> libcamera to access real time image statistics for advanced image
> processing like automatic exposure, white balance adjustments etc.
> 
> Balakrishnan Sambath (11):
>   media: microchip-isc: Enable GDC and CBC module flags for RGB formats
>   media: microchip-isc: Improve histogram calculation with outlier
>     rejection
>   media: microchip-isc: Use channel averages for Grey World AWB
>   media: microchip-isc: Add range based black level correction
>   media: platform: microchip: Extend gamma table and control range
>   media: platform: microchip: Add new histogram submodule
>   media: microchip-isc: Register and unregister statistics device
>   media: microchip-isc: Always enable histogram for all RAW formats
>   media: microchip-isc: fix histogram state initialization order
>   media: microchip-isc: decouple histogram cycling from AWB mode
>   media: microchip-isc: enable userspace histogram statistics export
> 
> Balamanikandan Gunasundar (7):
>   media: platform: microchip: set maximum resolution for sam9x7
>   media: platform: microchip: Include DPC modules flags in pipeline
>   media: microchip-isc: expose hue and saturation as v4l2 controls
>   media: microchip-isc: Rename CBC to CBHS
>   media: microchip-isc: Store histogram data of all channels
>   media: videodev2.h, v4l2-ioctl: Add microchip statistics format
>   media: microchip-isc: expose color correction registers as v4l2
>     controls
> 
>  drivers/media/platform/microchip/Kconfig      |   2 +
>  drivers/media/platform/microchip/Makefile     |   2 +-
>  .../platform/microchip/microchip-isc-base.c   | 373 ++++++++++--
>  .../platform/microchip/microchip-isc-regs.h   |   3 +
>  .../platform/microchip/microchip-isc-stats.c  | 549 ++++++++++++++++++
>  .../media/platform/microchip/microchip-isc.h  |  44 +-
>  .../microchip/microchip-sama5d2-isc.c         |   2 +-
>  .../microchip/microchip-sama7g5-isc.c         |  73 ++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/linux/atmel-isc-media.h               |  13 +
>  include/uapi/linux/videodev2.h                |   3 +
>  11 files changed, 1001 insertions(+), 64 deletions(-)
>  create mode 100644 drivers/media/platform/microchip/microchip-isc-stats.c
> 

This looks interesting.
I would like to see the compliance tool output for more platforms
(sama7g5, sama5d2, and the new sam9x7), also the media-ctl -p , to see
the topology with your new driver.

Thanks,
Eugen


Return-Path: <linux-media+bounces-12781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C311901404
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 01:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB848281AAE
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 23:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B249433C0;
	Sat,  8 Jun 2024 23:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxcWSL9b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414461C2A8;
	Sat,  8 Jun 2024 23:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717890777; cv=none; b=jeF0y/EKbG6FWAhtu07MLjdQEvyMUi4pj8KN7v2xaIALSaD0RuK3K0BI0ldM0+rI3z6WFHeLVevkGpg1Hvu1Mne6BwAECpXex28Zs9NJmcz95bJinkdxdf95168UGuYgJ3r4+oxGQtJ/YMvmWa88Wbo/viOzg/8XJbvPgFcdmvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717890777; c=relaxed/simple;
	bh=ErxOsjKMtTmP/x3fFoENFlt4Bq6AFdvGmZJE07FNYDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDCZ3XKbsl7aMFMYpRmJ95eMrsrCczsoMQ34Gx5+uhLz/gquy4sBGrDPXFPO+0wbAwWHrYLnuSQzJHPIOhi83VSO/lDIGWARzjOqEPAwZhjyWsceNpz/knMEoXMhcSLd3IBlFo41sf2i2//WIGn+aXICFJx+CBDIIY+jxpHthrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxcWSL9b; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f70509b811so1223895ad.1;
        Sat, 08 Jun 2024 16:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717890775; x=1718495575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4BawGddy099suoSVAo/enjQcEjBMWzi9BmGLP0915s=;
        b=fxcWSL9boZ3aYU67m6m+5VzcWRPk9sN4Rq2zF0yOcXgfuisC991jPXygRRDotuFf6p
         DRrLZom7yExamnWZcfV+5kkhmryRTDk8aBxcXv/gHV7C4blcIdeMazZ57xmkkypJfY2b
         BtkRY1RshA2Tz9cdWKcMNqFas0QFBtwF7tO90KjGkic/WhY2jTuLcSpSMCVGi9OkS+UW
         Z/JlCMSGmg912M6FUV4c2+QGRsF57McCfokXpcVkzpOM7NDaOFj5LgrKLifO/aBtotAu
         +QeHDJP5IH0YdhbKfn/6aqPESaI9Qc4dZW9kH9RObBwAEMzzqWEKulB9Jcn4uWEyhidI
         /53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717890775; x=1718495575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4BawGddy099suoSVAo/enjQcEjBMWzi9BmGLP0915s=;
        b=d2ta0ex0UPUKFAJPPK1D9ADpVF7OodqDZwNTwlab4+s5YlLXPHxpQtjRO0ptMJS5zv
         yZsZ0imhLyqRRod3fofPsHrBn02HW+f3oriF/1h0BqtYSEttXMVhBLPp6ZTQMPuScwWO
         9PI/xgWrh27hPid8TDIcH/MnCuW3GcZpdGHwgrxp8QD0ke1fQB3fkGG89SRrVPf6c3yW
         kGRXTE0k0bY4vhWyGsRMXdgpBDT70XZyJSn0HbGKDjuWodb+Lm4qO5G39Dc7mP3NhE9o
         5xQIHMqW7I8jwniI4Hnp6Ego2Pimv7uFwXWnees5ovcT9Lgv95fol+t8vbAbeLW+gkv0
         igeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUfAbGrsFMSwNskpwS8SDovdLT29FjMYYzxo1l8VPp/orA9rCnZkFTWvxkj1uIJab1bCER6/XL3JIzjqHcO6KR2E9Wt47rGN//Cwyd
X-Gm-Message-State: AOJu0Yycp09XjDSmq2osw8X29tpbjAy9NsmuCxcI06f7hnG8KLz4wKBc
	+NH4hgIfLeM0Hsyc4QR+bQUZL0433H+lLm6CqsSKlkdXITLSCQBZ
X-Google-Smtp-Source: AGHT+IEvVP1BdMGcJUKsfnt5xqsalFj7s6gS9ecgWh120vtHspbwyazdPyZM283xo2tKpBVW4gYeuA==
X-Received: by 2002:a17:902:db10:b0:1f4:b7ff:ac4a with SMTP id d9443c01a7336-1f6d02f55d9mr66607875ad.37.1717890775428;
        Sat, 08 Jun 2024 16:52:55 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6ea2d17c5sm26730365ad.46.2024.06.08.16.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jun 2024 16:52:55 -0700 (PDT)
Message-ID: <bcdce8da-a0de-4138-a821-9ee2a3183e24@gmail.com>
Date: Sun, 9 Jun 2024 08:52:52 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l: Fix missing tabular column hint for Y14P
 format
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Akira Yokosawa <akiyks@gmail.com>
References: <20240608-jmh-correct-mkdocs-luma-v1-1-7e114a2c4bdf@yoseli.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20240608-jmh-correct-mkdocs-luma-v1-1-7e114a2c4bdf@yoseli.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 08 Jun 2024 18:41:27 +0200, Jean-Michel Hautbois wrote:
> The original commit added two columns in the flat-table of Luma-Only
> Image Formats, without updating hints to latex: above it.  This results
> in wrong column count in the output of Sphinx's latex builder.
> 
> Fix it.
> 
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Link: https://lore.kernel.org/linux-media/bdbc27ba-5098-49fb-aabf-753c81361cc7@gmail.com/
> Fixes: adb1d4655e53 (media: v4l: Add V4L2-PIX-FMT-Y14P format)
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index b3c5779521d8..2e7d0d3151a1 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -21,9 +21,9 @@ are often referred to as greyscale formats.
>  
>  .. raw:: latex
>  
> -    \scriptsize
> +    \tiny
>  
> -.. tabularcolumns:: |p{3.6cm}|p{3.0cm}|p{1.3cm}|p{2.6cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|
> +.. tabularcolumns:: |p{3.6cm}|p{2.4cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|

With the \tiny font, widths of columns 1 and 2 can be reduced.

Either way, this fixes the build error of pdfdocs.  So,

Reviewed-and-tested-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

>  
>  .. flat-table:: Luma-Only Image Formats
>      :header-rows: 1
> 
> ---
> base-commit: dc772f8237f9b0c9ea3f34d0dc4a57d1f6a5070d
> change-id: 20240608-jmh-correct-mkdocs-luma-79d348ded7aa
> 
> Best regards,



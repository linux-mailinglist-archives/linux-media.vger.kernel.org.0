Return-Path: <linux-media+bounces-35248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4107FAE019A
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 11:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE359171693
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8912E263C8F;
	Thu, 19 Jun 2025 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVN8fddP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D65522B588;
	Thu, 19 Jun 2025 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750324797; cv=none; b=o0f5Mbi4LnDbxi3HUVp8weKHsGKSOuXlFou6aM4BpzHhOTv5oRooTUWT1K1mWEdRtugfwsCyhkZRIMoGSDe3p81SLBQ9dG/4viWqd9vnZPFP85bppbvHUfDo4tM1Y1V1l/ZuXkyPBZ+qRcasdc7yyhnZ33GJzbm0NpvnaSn/N2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750324797; c=relaxed/simple;
	bh=wUOEYdhZ29SHwGl/xTkaVOq2FWv4Ct0fQwiuoKhEtis=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=BvO4ZXZMPbmfvR3b/GMs+QGWkA71p8CCvynP9ceWuAKjDltNwmwjr59/5DtCIMAgixhCWkK2BXlsfobSqot9ns6iJC/NZXsTs6F+J8w0ZHwCYh7frkJ1vGut+vPd26J1qDOJi4CT1Lfi1UczhlmrFlgLRjoTWhmB6T/hbLpCpwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVN8fddP; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2fb9eb54d6so107612a12.0;
        Thu, 19 Jun 2025 02:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750324795; x=1750929595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:from:reply-to:content-language
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/4YlE3HAl9brMdxqBP04WkjP+nK0l6GdDNJGUg3hDA=;
        b=RVN8fddPxQ2MhYZ3Mrj6zdMN7Fv6vgUpCuyMVKXa5MJNVwyn29n8TBxAUqjmRHjoUb
         b+JCvLCW7DoqrsG5TjmJ68fekhb7CFvgfVQnZikJPkvhzj5J3xLYePF3NVStPNYG5lx3
         FOlTikhoN6dKAc92iTz7w2Asg1eyANgmFvJ1sT+/Q6kDdu1J5NdK9PqG+EcVvo19jbFe
         vW/YVSGZO3zvDYQ9a+Wf4oaQIJwURUJDHSShru04xeUW1vu2EFS72P7nCmzPCWmGyaCW
         ZURALd1ZVSBGR63jadxW3U4PaAo9SgjgsoN7muNohszeaaB1tWTJ/a8K3Jj5CSHW/Zd8
         l+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750324795; x=1750929595;
        h=content-transfer-encoding:cc:subject:from:reply-to:content-language
         :to:user-agent:mime-version:date:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/4YlE3HAl9brMdxqBP04WkjP+nK0l6GdDNJGUg3hDA=;
        b=tjcE3Wl6UiI110QUsQb8Nrs7JQ4bTtqKIIbTCXcWKvgMxJSsL0nxu8/JWlisdOJpiM
         vEzVVOc/2CgC1UaDDrZPDwMJOOmLLTvW6IcG2R45hH4F4XEyuQAXVFUGtoAz3IbMAN0s
         mmYeGtXi334jQxy+RIu0ODCk5UCS0TQvftMRLCFsYnQJy0HHqJI4NlVq8hGjcqoN0lKU
         5JuhyflgWhcN9053kgImH1TDHj0Cuha1e5eCY2BmJYrFjqE/bpoC1zRZvSeC01eCQ4tn
         vI/GqhybYBZnJncaF+9jy7pn3ezfqqlPBWsH2VOSUAPNrXKKIO19zUHTDeTybK7Q4BLT
         9Pzg==
X-Forwarded-Encrypted: i=1; AJvYcCUuZGvLT7yoVjW718r8XveJYIdBNV3bIgyMLXYtrf89kNTHKR3vv1LvtOh9a8llNxmrqaQG143R74sxqG0=@vger.kernel.org, AJvYcCWBbLkQqiKnh8p7tTew3Vc2dY+Wn8kXym7PnrVrxVHBsFxQoyqO1vuU1gm4lYv+ReWfuK4OL9ZYtUiH@vger.kernel.org, AJvYcCXsEEMRwnkHWm0sVIBbfSia2lD4bXqEeGS5D4pr8sfj6sJ4U40h+TVrttrr3FgBKsGbvJkCZkgQMtrSew0t@vger.kernel.org
X-Gm-Message-State: AOJu0YyR0Q+xHyrzuqF9GU6WGdk4HkpbDF4ErTxgDo9OXw2CWEUBda+R
	PtqpttriWm2HoK2xGQxg8s/G/F52so9wy1xzRAOBTp8T4Ly5Tk1Eelq+
X-Gm-Gg: ASbGncvw41r1DK1kGKO2+r7ANEjlvo5Wpic/pk3yeoTO/yG9MoNP1PvbWoZpZOAZiyX
	EylNDeVVPUtAHpZvDhoxix9O8gyHIEktFDvp5Njg5m5pIv9udeOd6QxpTs/+peB/3Jwzr/veAQ4
	0fu2So18xVjGR9Pu6zubqUxVkSVF6Zj6DznRj3uivFrzvZokT9x9OT5kFYeb4Q1iP773tVWBQcG
	+7a8qBry5EoWdbtiLM7i6iPtGKr5yGwLpSDnaGSpVQ1DHiV7EcKg3yT8IaVaMEXI/cShhfY78pe
	GSr7hN3k0Wd+OPVqLemHu4F6hFcypH9Ik5h1/Olac1pV46a/uPohUQ==
X-Google-Smtp-Source: AGHT+IEOwVnmlW8HJGJmZZDAcMv1C94tin+GyGqBRrpDOir6cIrcvjw4rGkN6VVwGeWeSc86EeXQ9w==
X-Received: by 2002:a17:902:c40f:b0:22e:6d69:1775 with SMTP id d9443c01a7336-2368edfcb64mr66047925ad.11.1750324794607;
        Thu, 19 Jun 2025 02:19:54 -0700 (PDT)
Received: from [0.0.0.0] ([2a09:bac1:3b40:120::16:1d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3157a615170sm2229196a91.0.2025.06.19.02.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 02:19:53 -0700 (PDT)
Message-ID: <9f098eab-7b98-4827-8538-3cab0e8d7c63@gmail.com>
Date: Thu, 19 Jun 2025 17:19:32 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: detlev.casanova@collabora.com
Content-Language: en-US
Reply-To: 20250325213303.826925-5-detlev.casanova@collabora.com
From: Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: Re: [PATCH v4 4/6] media: rockchip: Introduce the rkvdec2 driver
Cc: alchark@gmail.com, andrzej.p@collabora.com, cassel@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.perchanov@intel.com,
 dsimic@manjaro.org, ezequiel@vanguardiasur.com.ar,
 gregkh@linuxfoundation.org, heiko@sntech.de, hverkuil@xs4all.nl,
 jacopo.mondi@ideasonboard.com, jeanmichel.hautbois@ideasonboard.com,
 jonas@kwiboo.se, kernel@collabora.com, kieran.bingham@ideasonboard.com,
 krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, Jianfeng Liu <liujianfeng1994@gmail.com>,
 mchehab@kernel.org, naush@raspberrypi.com, nicolas.dufresne@collabora.com,
 robh@kernel.org, sakari.ailus@linux.intel.com,
 sebastian.reichel@collabora.com, tomi.valkeinen@ideasonboard.com,
 umang.jain@ideasonboard.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Detlev,

On Tue, 25 Mar 2025 17:22:20 -0400, Detlev Casanova wrote:

 >+        case RKVDEC2_ALLOC_SRAM:
 >+            virt_addr = (unsigned long)ctx->rcb_bufs[i].cpu;
 >+
 >+            iommu_unmap(rkvdec->iommu_domain, virt_addr, rcb_size);

I'm testing your patch with ffmpeg patched with v4l2-request patches[1], 
and I usually

get kernel panic here. After checking rkvdec->iommu_domain before 
running iommu_unmap,

I can pass fluster ffmpeg v4l2-request test. Here is my patch based on 
your commit:


diff --git a/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c 
b/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
index 75768561399..122bcdcebd4 100644
--- a/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
+++ b/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
@@ -681,8 +681,8 @@ static void rkvdec2_free_rcb(struct rkvdec2_ctx *ctx)
                 switch (ctx->rcb_bufs[i].type) {
                 case RKVDEC2_ALLOC_SRAM:
                         virt_addr = (unsigned long)ctx->rcb_bufs[i].cpu;
-
-                       iommu_unmap(rkvdec->iommu_domain, virt_addr, 
rcb_size);
+                       if (rkvdec->iommu_domain)
+ iommu_unmap(rkvdec->iommu_domain, virt_addr, rcb_size);
                         gen_pool_free(ctx->dev->sram_pool, virt_addr, 
rcb_size);
                         break;
                 case RKVDEC2_ALLOC_DMA:


[1] https://github.com/amazingfate/FFmpeg/commits/n6.1.1-new-patches/


Best regards,

Jianfeng



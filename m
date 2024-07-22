Return-Path: <linux-media+bounces-15269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC87B9391F8
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A28C5282375
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A7516EB40;
	Mon, 22 Jul 2024 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ldex+0BA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0238FC2FD
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721663034; cv=none; b=sudvbQrTrQw0cCjNBjNwd9qiAqCzv+69JGM8rnBkvuDM/jf1Y/2TBFsGh2ysRgMDCFLwPGHqt6oWFqLBX8u1T3Rshki+IVmrBB+z9+sxE4pzjNp+LtDJUVmODwwwcjBbvo4c/4tkAtfVT39lW5r9i/SH2n3yHs6P/W8g/h3GN7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721663034; c=relaxed/simple;
	bh=mOD/VqOK3QRrsU9wLyLJWrcLSaKFWSraizA2iYJ1WCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gluunYzLO39t7Su9O5tyrXaFMLmAW8nhIA8o+mt7oFwhC9EntNYOmArroAIwknnS8C1KlG/i9sctLEKUrpoS1rbYig6Bk9c4glAuwtCPrvUomBZX5yqt9v8Y5vWtPmGG3V5CJJK9Vz1t9CDKU6UJaLnJJn0AZamGNtqaH39w61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ldex+0BA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc4fccdd78so22339405ad.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1721663032; x=1722267832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HY/45sHbJIy2qcayb7XSnbeV+XKE0XpbEA826lBhjF0=;
        b=Ldex+0BAUEKrne7z9uwbr3FNZ4nJJQoCEwfS/XvxUO1nz9h2FnY85vZ96LDRAK4T+A
         UpbghKvP02nn4nesUd+hSXPfIeVNdIu0A3RX9CihWAnwsMoblouimuOisufLlKiuQ1RZ
         oVoLXSXZC2toGi08l2Q4npeGkcJeUjYrkUsrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721663032; x=1722267832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY/45sHbJIy2qcayb7XSnbeV+XKE0XpbEA826lBhjF0=;
        b=YVicVhXxSJ58xetMeLIybqakrO8CxVdArGxm3FfyFc31Xe+DgfWKIwvVjE05CuS1mn
         5zvDU+37rGaeTADtP14RH6nGyzcxbrwe2WI8LuGgsRDEa/pZBmfd36akb4JVGW4ajktF
         bn3j1MoNe94BWKJ2WarKyDz5DfYREoflg0NN8h5eSkLNSGPqAZf74xS/B9FVSHsZwcKN
         xj97FPOJq2+Fp55ZIm3Z/OfMnTql/UhAGe+BALMstUSX7vF9debEUJlnpg06vmrMgNGb
         YXUshDQBeIg77ZL5hpOtBA+G8+8Xbsr324x61GZKqXP/9hBe3DrPUJConpq5bhdUqryV
         b2QQ==
X-Gm-Message-State: AOJu0YxCJhJrf6W7UnI1oeMzx9xr/z88xTvyNa80qo00+x+qWsvV1c8h
	8GuN4wlwiPesuhhQB7Zc/bN2ARRQ9ZdHBYFefAe8QU7/Uvi/c0oHmwZfZDMVcw==
X-Google-Smtp-Source: AGHT+IEc7QufvotFWBaifCXSkm/JzCWHhi/xDKlSEy8kNnjdwaRcSS2abiLnek3SNWKqWXm2rfOF0Q==
X-Received: by 2002:a17:902:e885:b0:1fb:8e00:e5e8 with SMTP id d9443c01a7336-1fd74532a56mr47332125ad.10.1721663032276;
        Mon, 22 Jul 2024 08:43:52 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f48ca81sm56055485ad.299.2024.07.22.08.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 08:43:51 -0700 (PDT)
Message-ID: <a1bda167-670a-4613-83c4-5282dd5a7091@broadcom.com>
Date: Mon, 22 Jul 2024 08:43:49 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: raspberrypi: VIDEO_RASPBERRYPI_PISP_BE should
 depend on ARCH_BCM2835
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
 Naushir Patuck <naush@raspberrypi.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 David Plowman <david.plowman@raspberrypi.com>
Cc: linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <8e1c6c3a32919603072bb7278c66b4d469f7e762.1721661958.git.geert+renesas@glider.be>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <8e1c6c3a32919603072bb7278c66b4d469f7e762.1721661958.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/22/2024 8:28 AM, Geert Uytterhoeven wrote:
> Currently, the Raspberry Pi PiSP Backend (BE) ISP is only present on the
> Broadcom BCM2712-based Raspberry Pi 5.  Hence add a dependency on
> ARCH_BCM2835, to prevent asking the user about this driver when
> configuring a kernel without Broadcom BCM2835 family support.  The
> dependency can be relaxed if/when the encoder appears on other SoC
> families.
> 
> Fixes: 12187bd5d4f8c128 ("media: raspberrypi: Add support for PiSP BE")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: FLorian Fainelli <florian.fainelli@broadcom.com>

Thanks!
-- 
Florian


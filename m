Return-Path: <linux-media+bounces-34754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AA1AD8EB9
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDED1188A0A0
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4A81A5BBD;
	Fri, 13 Jun 2025 13:55:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AF619047A;
	Fri, 13 Jun 2025 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822906; cv=none; b=qEPc3qbgezMqvF70dIuATB+qc/TzSKG+myOt3UjXfGr93fRKjFZRpNBjhsYXDDIw1esj7r66YqHnwMXS5/n2Lvb01tJuPSjrwPRZhxsTKXWWtCCoOGjVBjo8z+o3X8r3/fSx73bZatNSsx7bxGmG1+O5PPkufMP9a0NoHIf+mtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822906; c=relaxed/simple;
	bh=ENX9QtWbYw4Rxu2kw33jFBDaHiweTvxpiRQiKM+M9rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJL9v8S3AAGFeCNuGcmvE0k1QAsJ5ZoPDt1eQij0FNFeIh6k2XeAZOR2ynpdS5tEqyvamD3j4nQQNZ2zJZy8o6DzCvHfX326vfjogliVkntlGZSnakBsf3gFwFo5l5GKbzFLl/9+b3kBV72PAS1PfCNip70XgpZ/3Xk7Vp4cOHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 775451C0A;
	Fri, 13 Jun 2025 06:54:42 -0700 (PDT)
Received: from [10.57.28.131] (unknown [10.57.28.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A0C03F59E;
	Fri, 13 Jun 2025 06:54:52 -0700 (PDT)
Message-ID: <1437fe89-341b-4b57-b1fa-a0395081e941@arm.com>
Date: Fri, 13 Jun 2025 14:54:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] bitfield: introduce HWORD_UPDATE bitfield macros
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sandy Huang
 <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-12 7:56 pm, Nicolas Frattaroli wrote:
> Hardware of various vendors, but very notably Rockchip, often uses
> 32-bit registers where the upper 16-bit half of the register is a
> write-enable mask for the lower half.
> 
> This type of hardware setup allows for more granular concurrent register
> write access.
> 
> Over the years, many drivers have hand-rolled their own version of this
> macro, usually without any checks, often called something like
> HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
> semantics between them.
> 
> Clearly there is a demand for such a macro, and thus the demand should
> be satisfied in a common header file.
> 
> Add two macros: HWORD_UPDATE, and HWORD_UPDATE_CONST. The latter is a
> version that can be used in initializers, like FIELD_PREP_CONST. The
> macro names are chosen to not clash with any potential other macros that
> drivers may already have implemented themselves, while retaining a
> familiar name.

Nit: while from one angle it indeed looks similar, from another it's 
even more opaque and less meaningful than what we have already. 
Personally I cannot help but see "hword" as "halfword", so logically if 
we want 32+32-bit or 8+8-bit variants in future those would be 
WORD_UPDATE() and BYTE_UPDATE(), right? ;)

It's also confounded by "update" not actually having any obvious meaning 
at this level without all the implicit usage context. FWIW my suggestion 
would be FIELD_PREP_WM_U16, such that the reader instantly sees 
"FIELD_PREP with some additional semantics", even if they then need to 
glance at the kerneldoc for clarification that WM stands for writemask 
(or maybe WE for write-enable if people prefer). Plus it then leaves 
room to easily support different sizes (and potentially even bonkers 
upside-down Ux_WM variants?!) without any bother if we need to.

Thanks,
Robin.

> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   include/linux/bitfield.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 6d9a53db54b66c0833973c880444bd289d9667b1..b90d88db7405f95b78cdd6f3426263086bab5aa6 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -8,6 +8,7 @@
>   #define _LINUX_BITFIELD_H
>   
>   #include <linux/build_bug.h>
> +#include <linux/limits.h>
>   #include <linux/typecheck.h>
>   #include <asm/byteorder.h>
>   
> @@ -142,6 +143,52 @@
>   		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
>   	)
>   
> +/**
> + * HWORD_UPDATE() - prepare a bitfield element with a mask in the upper half
> + * @_mask: shifted mask defining the field's length and position
> + * @_val:  value to put in the field
> + *
> + * HWORD_UPDATE() masks and shifts up the value, as well as bitwise ORs the
> + * result with the mask shifted up by 16.
> + *
> + * This is useful for a common design of hardware registers where the upper
> + * 16-bit half of a 32-bit register is used as a write-enable mask. In such a
> + * register, a bit in the lower half is only updated if the corresponding bit
> + * in the upper half is high.
> + */
> +#define HWORD_UPDATE(_mask, _val)					 \
> +	({								 \
> +		__BF_FIELD_CHECK(_mask, ((u16) 0U), _val,		 \
> +				 "HWORD_UPDATE: ");			 \
> +		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask)) | \
> +		((_mask) << 16);					 \
> +	})
> +
> +/**
> + * HWORD_UPDATE_CONST() - prepare a constant bitfield element with a mask in
> + *                        the upper half
> + * @_mask: shifted mask defining the field's length and position
> + * @_val:  value to put in the field
> + *
> + * HWORD_UPDATE_CONST() masks and shifts up the value, as well as bitwise ORs
> + * the result with the mask shifted up by 16.
> + *
> + * This is useful for a common design of hardware registers where the upper
> + * 16-bit half of a 32-bit register is used as a write-enable mask. In such a
> + * register, a bit in the lower half is only updated if the corresponding bit
> + * in the upper half is high.
> + *
> + * Unlike HWORD_UPDATE(), this is a constant expression and can therefore
> + * be used in initializers. Error checking is less comfortable for this
> + * version.
> + */
> +#define HWORD_UPDATE_CONST(_mask, _val)					  \
> +	(								  \
> +		FIELD_PREP_CONST(_mask, _val) |				  \
> +		(BUILD_BUG_ON_ZERO(const_true((u64) (_mask) > U16_MAX)) + \
> +		 ((_mask) << 16))					  \
> +	)
> +
>   /**
>    * FIELD_GET() - extract a bitfield element
>    * @_mask: shifted mask defining the field's length and position
> 



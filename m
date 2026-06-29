Return-Path: <linux-media+bounces-65967-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4jvHKwh5Qmoy8AkAu9opvQ
	(envelope-from <linux-media+bounces-65967-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:54:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 285686DB93F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:54:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=m42PatBh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65967-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65967-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3868302A9CF
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A612932B989;
	Mon, 29 Jun 2026 13:49:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E82E7373;
	Mon, 29 Jun 2026 13:49:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740948; cv=none; b=DRWuMewS1vljPh0bEtIOGxTg8RfwHgAYafjWNZWCSMgRtuwPBs5SzShqjyqZoDTMGEUwl8hnI0xfKHs4v/K3Qq419/9Gpxm2aNMqEr1oZW8DXxNB8To0dryZdyzXMxprW27XpCoA5Tm4GI9KUBzPzFHYDHyXDX0NruGdGVCdeRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740948; c=relaxed/simple;
	bh=5x7LXj6Xv+wH+tY0b96tw75JkZArsKaXLbZMhpOFk4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8N5u0syUAoGb2BFskGMeeIJSorsdvrOvubz01Vtlj2qGm1IY+VOjlMAEC9Jw/o/bJucrxxrz4sJGNBrdw76Y7+I5fFXpNw4AVmCGwba/HDf1k5nz6ox7h3vUM54idunWQA5secf/tQC4PC1Id5oydpBCwMq4OUDgCePlUlqCdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m42PatBh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260B41F00A3A;
	Mon, 29 Jun 2026 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782740940;
	bh=HYk8qiqXyyHIUwSoa1yWOH/jlve8iHP5ed/KeFu3srI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=m42PatBhwvpm/3H654brhEQpjD+iO6qs5qYNIcqtTZg5ff+0MZFWUwie0CncYMYZY
	 9oBAz77NbwNEWq+iI/xVPdnaBK+oSnFT7ZTAQWJzDI7mwLJUy+cBalO/8Hmws8KZJX
	 g7JGpexyZOInvpqZUREbP2IWyclAq10fL9SodI3zmk5S9uTl03KSD+MeawZ5XP7nqe
	 0Qag+cas9ydO1q5l/8R91Al14KVM+IOu1l/Gays0t48UpiYjlFtEORCZij+Rc7kFbh
	 L8P8tyKyv89g42BN/7sKtWB4UkVDiFaeGP8fN63GEN+PAuwNk03npoMrgaIjeHvVRc
	 vd/MIE5Q2gzMA==
Message-ID: <596dd8d5-638a-42d3-a00b-9a72f26508a9@kernel.org>
Date: Mon, 29 Jun 2026 14:48:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <Y9WX7hRMg5NeQn7hKU-aCdf1CzI2ex1Jvr51mDjIfeCVmAeFddzvwgpwL72IxUH3Z_f2tsYrzg0tcqCwywi9wQ==@protonmail.internalid>
 <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 xsFNBGRJNSgBEADD7Vm2ZFa+v+JGJ2QYTJqQAkqis/uOHkhdFNXqpBarVBd47QU/DMNU5Rxg
 jedMQEmHoeDbJ6UOpjbrUQ63c5sgG1JbroHJJctwsEI75OOlekMuebEbjIJBLfgENGwPBMHv
 piv5TgCWr0VgYaXfp2eh2LINFywzqj823HiDPibQAXDrjzvF1ogksi/6cQZs8d4if8YQkLOr
 YISFouG+eR0nN1I7mUfIddXOWu6lJeTyqbWVurv58k2ekIXKaOC9ixLHFbcfYV0hOgRaTwQC
 B8CYF9nfqZla19iItfsN9QxN+ZdQjcRoYipp6HPCMfJlKH7GfaFcW93LKc4DKJ2lVL+pg/OQ
 lythZbjRPY492NG9kZ65aYstCs90uhMUEVVPuGUw7wBEku+6IEwZfrbMVKeWzLlPyM4Hv9hM
 8ktxSmxWsPTPqpBC8eyeAQLalMELAyVcZlkaCtEcbj7w4l/JkYz+4l37obG8ZD+B34udBUUz
 MsAJ8foDFrBh2MOFA3hxD6G90D23mmWsri7pnKA2tZs92aQX7Ee+FbCyg6g5ln62Sq83ZDbf
 53DdBs55EVpBadeInWmXhzCHPQx06H+CwTEjShTYIaMmBfrewvYUDKvFTC5iKQhAEUgt6i94
 JsbG7NoeqcxkUMcBOEUQ3uCQG1D70ugspgXc0wd3Rimiq6535wARAQABzSFCcnlhbiBPJ0Rv
 bm9naHVlIDxib2RAa2VybmVsLm9yZz7CwZEEEwEIADsWIQTmk/sqq6Nt4Rerb7QicTuzoY3I
 OgUCZ+R+mwIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRAicTuzoY3IOimUD/94
 BwVEJX31JRe2sxbB/e1w2p8x1bxvTw5AeIzpV3ox7coJg1bSU2mnGuj1V4o0Yxf/3zmcJzCN
 VfVjwRF8Ii3GnC7uUXk2t+87piQfKTyJAYQABhZUKgoVJbjJq/S+C3XCKIyBA+EiezoUsgsA
 jTzwU+FzV7zVWIXFPJNtBERLwboE9w9U3KjAExOa1kSY8eLrsg6kOwlOHWy5UsQqYOjrS96M
 mzm2xuc1+RCjrndAyYhCnrOKvJ67HsPnBeJCjw7ImGD/U1GchwYbX8o3DO3JNHm3qfC86ZqX
 2sCouENg4OzgPTtLKUrueM6xsu6KMM7gj17vxsiR3KQEoJnnMB8D1xtBofN3mFZE0wD9M24m
 8yGunZbtntMCUHzIrlJgAPwKWKuGOYtA8UgMTFkccnUJtQrg9KotKtEF/FuftG9zLG9XEkt4
 5ZdNgbSoLWgelu3T47mbOJ8LHhiLaCWP7yrovtVAvLUQ1BsiA42u8ECrFCFvQj9nrejE/ICv
 kP+uqcKtdDvP9HrIGycF1WZyfZLp0RvopKW92FLvI4I1QFWJ+wenk6+LGyJ5bzlrWzevjxmf
 nHcXE6sJBHrE7eijlbbImDAi3uLYN8Nd9Dm11IDAy4GAIQxSiQn0yblDhPiyGtchy80EVkCm
 g9k17Wol+2E2mC4DKgVdCkyUtTRSLgsJCs7BTQRkSTUoARAAuTnmWHBS6izRcEE93ajpzI7h
 dgQO4U3IRvOEsvIKR5NGcNEs0ngGebwsZ/lVULjN4vYU0LleqVhPBidNXUoZCN3A0F0Z2Ov8
 NZdef+2EhQPBVWxFO7JBzhe8Z3ALj+wFtlg8akJjBzU56azW/iJzAobqHVrudzKoO2b1/CMg
 VbiAQ+RXjgfN5kY/HqYDU7mw+hXuUV9PbtX1L8xqQQac95oM9rHzKHHpiVwxTeJnGQsa+THi
 Kze+YET3rCoGHMvOQEJhdrucTv5FpAakKdkOFNel9FFckLRKEuWgCzhpFsjQ7xbirQgFUxG9
 vlk1+q4hMRGNyEqoD6svYEeqbiUSd0oPUJeioiC3rNMRCNHLVrfZ2J6SCPkxfda08uzSdDQU
 1/YPjOh8ZtQDMu7WctZ3XO288Z1gyBR49V7fbFs2w4sQxG+h/enlxqP7fdw1mjUlZjU5huCJ
 ielS0oEaIpmUpkugli7x4WhwLnhK2EbSoz7nLBC0y+ALUOdMlz/Y1l9xRt+bkDhpmf4O4IcI
 MxgZ0QMLq8rHDkGaEbsgZZHQPS58T0XE3IP30Q9SNxsruCMXtd2hYtBssf/wohc6JVsTtMg2
 VYTPDPIFNZFSXupEJB7jlqpDWJ8ooJfJRLBatbjT5+mVQaMYB7Hs/t+zWYWaJKHyc8O6WLEC
 NUV5Tdt5EkkAEQEAAcLBdgQYAQoAIBYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJkSTUoAhsM
 AAoJECJxO7Ohjcg6LuIQALnXt36OUuK43wqw6UYt0cnN6EbUqJHApAF5eNFn0jCCB2XELjSz
 JKJwuNAweowBdabiBniJ+501WIW+ewEsz1uby5fUQjZuCEsIkuaIluyfUFPb73qrQyAGuusd
 7teA4WT+/jUku9g7lX5sVoRCrKQPkd16f6Bzfztyqyjcn43/X5yQI+wlboQ6HuKe/3I3yiOx
 OgmCHzOawpC9PvhEcKj79RLM3Zz5Ts5AuHpRX70Jz8Be76LwVFLp5Msx3S24ZTU1lBo2uiJ3
 xSkay2lTpyVWRPx9vgcwzxGguOPJQJwsQeLb7wpoJMPpD3ERoaRii7Q7hvmxklpZjhKYWB3d
 t6nQ497Ek9loCrp3MIjRCSDN5xEGffiHks9yTeGMUQwO4tX8RE04uOJPkUY7uCFzFqN6/qey
 X3oFfPgkULMdiHofPAL1OskZSTzGPSfTYRE46NCJw8yoZBQ/oOyWeqaUQbK0wmW/g81wm8p7
 LKSGEglMpiX07M1AotgvylN5C8fjbouoK+/RAMsXkk8jba6rPfuuXPaDjCyyKn6zSVHETnHW
 3AJbgVY50T8STpnxayBQvWbCvu+6NOEjXCbyaOJig+5l0zlGN9XHjdANXC5HnwmyaGRL9YDq
 Jh2nVXVJDincOdQRdKcJjYLqaOAoWrYWSDi1iZGspHBTDrnOvfMQzzHY
In-Reply-To: <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65967-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 285686DB93F

On 29/06/2026 13:17, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
> 
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
> 
> This series targets SM8250 (Kona) platforms.
> 
> The jpeg-encoder node is described as a child node of the CAMSS block
> and is probed automatically via of_platform_populate() in camss_probe().
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> media: qcom: jpeg: restore JPEG_ENCODE_H1V1 for CAPTURE format lookup
> 
> V4L2_PIX_FMT_JPEG must remain in jpeg_encode_fmt[] with JPEG_ENCODE_H1V1
> so that jpeg_get_encode_fmt() and jpeg_get_memory_fmt() resolve correctly
> for the Write Engine (CAPTURE queue) path.
> 
> The corresponding jpeg_mcu_blocks[H1V1] entry is also restored.
> 
> V4L2_PIX_FMT_JPEG is not present in jpeg_src_formats[] so it cannot be
> set as a SOURCE format by userspace.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> fixup! media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Your rebase needs to squash the log, at least twice.

I'd be obliged if you could add an example usage to the commit log for 
the driver too.

Ideally someone should be able to run git log on 
drivers/media/platform/qcom/jpeg/ and find the initial master commit 
showing how to meaningfully exercise and validate this code.

It would be especially interesting to benchmark - to show that using the 
jpeg accelerattor hardwre block is after than say - using pure software 
in ffmpeg or gstreamer.

> ---
>   drivers/media/platform/qcom/Kconfig           |    1 +
>   drivers/media/platform/qcom/Makefile          |    1 +
>   drivers/media/platform/qcom/jpeg/Kconfig      |   17 +
>   drivers/media/platform/qcom/jpeg/Makefile     |    9 +
>   .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  310 ++++
>   .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  337 ++++
>   .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  111 ++
>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  354 ++++
>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
>   .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1524 +++++++++++++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
>   .../media/platform/qcom/jpeg/qcom_jenc_res.c  |   39 +
>   .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   30 +
>   .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  527 ++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1150 +++++++++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
>   16 files changed, 4606 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
>   create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
> 
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
> index 4f4d3a68e6e5..f33d53a754a0 100644
> --- a/drivers/media/platform/qcom/Kconfig
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
>   source "drivers/media/platform/qcom/camss/Kconfig"
>   source "drivers/media/platform/qcom/iris/Kconfig"
>   source "drivers/media/platform/qcom/venus/Kconfig"
> +source "drivers/media/platform/qcom/jpeg/Kconfig"
> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> index ea2221a202c0..011b5d237193 100644
> --- a/drivers/media/platform/qcom/Makefile
> +++ b/drivers/media/platform/qcom/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y += camss/
>   obj-y += iris/
> +obj-y += jpeg/
>   obj-y += venus/
> diff --git a/drivers/media/platform/qcom/jpeg/Kconfig b/drivers/media/platform/qcom/jpeg/Kconfig
> new file mode 100644
> index 000000000000..8a96b37b919b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_QCOM_JENC
> +	tristate "Qualcomm V4L2 JPEG Encoder driver"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select VIDEOBUF2_DMA_SG
> +	select V4L2_JPEG_HELPER
> +	select V4L2_MEM2MEM_DEV
> +	help
> +	  Qualcomm JPEG memory-to-memory V4L2 encoder driver.
> +
> +	  Provides:
> +	    - qcom-jenc (encode)
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called qcom-jenc
> diff --git a/drivers/media/platform/qcom/jpeg/Makefile b/drivers/media/platform/qcom/jpeg/Makefile
> new file mode 100644
> index 000000000000..310f6c3c1f19
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_VIDEO_QCOM_JENC) += qcom-jenc.o
> +
> +qcom-jenc-objs += \
> +	qcom_jenc_dev.o \
> +	qcom_jenc_v4l2.o \
> +	qcom_jenc_ops.o \
> +	qcom_jenc_res.o \
> +	qcom_jenc_hdr.o
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
> new file mode 100644
> index 000000000000..cd6216fc3424
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
> @@ -0,0 +1,310 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_DEFS_H
> +#define QCOM_JENC_DEFS_H
> +
> +#include <linux/bitfield.h>
> +#include <linux/io.h>
> +#include <linux/types.h>
> +#include <linux/videodev2.h>
> +#include <media/videobuf2-core.h>
> +
> +/* Offline JPEG encoder constraints */
> +#define QCOM_JPEG_HW_MAX_WIDTH	8192
> +#define QCOM_JPEG_HW_MAX_HEIGHT	8192
> +#define QCOM_JPEG_HW_MIN_WIDTH	256
> +#define QCOM_JPEG_HW_MIN_HEIGHT	256
> +
> +#define QCOM_JPEG_HW_DEF_HSTEP	16
> +#define QCOM_JPEG_HW_DEF_VSTEP	16
> +
> +#define QCOM_JPEG_HW_DEF_WIDTH	1920
> +#define QCOM_JPEG_HW_DEF_HEIGHT	1088
> +
> +#define QCOM_JPEG_MAX_PLANES	3
> +
> +#define QCOM_JPEG_QUALITY_MIN	1
> +#define QCOM_JPEG_QUALITY_DEF	98
> +#define QCOM_JPEG_QUALITY_MAX	100
> +#define QCOM_JPEG_QUALITY_MID	(QCOM_JPEG_QUALITY_MAX / 2)
> +#define QCOM_JPEG_QUALITY_UNT	1
> +
> +/*
> + * V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO - enable adaptive performance scaling.
> + *
> + * When set to 1 the driver selects the core clock OPP level based on the
> + * encoded frame resolution and quality factor.  When set to 0 (default) the
> + * driver always runs at NOMINAL (highest) OPP level, trading power for
> + * deterministic latency.
> + *
> + * Accessible via v4l2-ctl:
> + *   v4l2-ctl --set-ctrl=perf_level_auto=1
> + */
> +#define V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO \
> +	(V4L2_CID_USER_BASE + 0x1240)
> +
> +/*
> + * V4L2_CID_QCOM_JPEG_FPS_TARGET - target encode rate in frames per second.
> + *
> + * Used together with V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO to select the lowest
> + * OPP level whose throughput is sufficient for the requested frame rate.
> + * Has no effect when perf_level_auto is 0.
> + *
> + * Range: 1 to 240 fps. Default: 30.
> + *
> + * Accessible via v4l2-ctl:
> + *   v4l2-ctl --set-ctrl=fps_target=60
> + */
> +#define V4L2_CID_QCOM_JPEG_FPS_TARGET \
> +	(V4L2_CID_USER_BASE + 0x1241)
> +
> +#define QCOM_JPEG_FPS_MIN	1
> +#define QCOM_JPEG_FPS_MAX	240
> +#define QCOM_JPEG_FPS_DEF	30
> +#define QCOM_JPEG_FPS_UNT	1
> +
> +#define JPEG_CLK_LOWSVS_HZ	300000000ULL
> +#define JPEG_CLK_SVS_HZ		400000000ULL
> +#define JPEG_CLK_SVS_L1_HZ	480000000ULL
> +#define JPEG_CLK_NOMINAL_HZ	600000000ULL
> +
> +/*
> + * Reference measurements:
> + *
> + *  - JPEG clock      : 600 MHz
> + *  - Input           : Worst-case (NOISE)
> + *
> + * Although ~120 MPixel/s was measured, use a conservative value of
> + * 110 MPixel/s to provide operating margin.
> + */
> +#define JPEG_REF_CLK_HZ             JPEG_CLK_NOMINAL_HZ
> +#define JPEG_REF_THROUGHPUT_MPPS    110ULL
> +#define JPEG_REF_PIXEL_RATE         (JPEG_REF_THROUGHPUT_MPPS * 1000000ULL)
> +
> +/*
> + * Performance levels for the JPEG core clock, used as level values.
> + * The numeric values must match the opp-level entries in the DTS node:
> + *
> + *   LOWSVS  = 0  -> opp-level = <0>  (e.g. 300 MHz on SM8250)
> + *   SVS     = 1  -> opp-level = <1>  (e.g. 400 MHz on SM8250)
> + *   SVS_L1  = 2  -> opp-level = <2>  (e.g. 480 MHz on SM8250)
> + *   NOMINAL = 3  -> opp-level = <3>  (e.g. 600 MHz on SM8250)
> + */
> +enum qcom_soc_perf_level {
> +	QCOM_SOC_PERF_LOWSVS = 0,
> +	QCOM_SOC_PERF_SVS,
> +	QCOM_SOC_PERF_SVS_L1,
> +	QCOM_SOC_PERF_NOMINAL
> +};
> +
> +/* hardware register field mask identifiers */
> +enum qcom_jpeg_mask_id {
> +	/* hW version fields */
> +	JMSK_HW_VER_STEP,
> +	JMSK_HW_VER_MINOR,
> +	JMSK_HW_VER_MAJOR,
> +
> +	/* hW capability fields */
> +	JMSK_HW_CAP_ENCODE,
> +	JMSK_HW_CAP_DECODE,
> +	JMSK_HW_CAP_UPSCALE,
> +	JMSK_HW_CAP_DOWNSCALE,
> +
> +	/* reset command fields for individual JPEG subsystems */
> +	JMSK_RST_CMD_COMMON,
> +	JMSK_RST_CMD_FE_RESET,
> +	JMSK_RST_CMD_WE_RESET,
> +	JMSK_RST_CMD_ENCODER_RESET,
> +	JMSK_RST_CMD_DECODER_RESET,
> +	JMSK_RST_CMD_BLOCK_FORMATTER_RST,
> +	JMSK_RST_CMD_SCALE_RESET,
> +	JMSK_RST_CMD_REGISTER_RESET,
> +	JMSK_RST_CMD_MISR_RESET,
> +	JMSK_RST_CMD_CORE_RESET,
> +	JMSK_RST_CMD_JMSK_DOMAIN_RESET,
> +	JMSK_RST_CMD_RESET_BYPASS,
> +
> +	/* hW command fields */
> +	JMSK_CMD_HW_START,
> +	JMSK_CMD_HW_STOP,
> +	JMSK_CMD_CLR_RD_PLNS_QUEUE,
> +	JMSK_CMD_CLR_WR_PLNS_QUEUE,
> +	JMSK_CMD_APPLY_SWC_RD_PARAMS,
> +
> +	/* core configuration fields */
> +	JMSK_CORE_CFG_FE_ENABLE,
> +	JMSK_CORE_CFG_WE_ENABLE,
> +	JMSK_CORE_CFG_ENC_ENABLE,
> +	JMSK_CORE_CFG_SCALE_ENABLE,
> +	JMSK_CORE_CFG_TESTBUS_ENABLE,
> +	JMSK_CORE_CFG_MODE,
> +	JMSK_CORE_CFG_CGC_DISABLE,
> +
> +	/* core status fields */
> +	JMSK_CORE_STATUS_ENCODE_STATE,
> +	JMSK_CORE_STATUS_SCALE_STATE,
> +	JMSK_CORE_STATUS_RT_STATE,
> +	JMSK_CORE_STATUS_BUS_STATE,
> +	JMSK_CORE_STATUS_CGC_STATE,
> +
> +	/* interrupt status fields */
> +	JMSK_IRQ_STATUS_SESSION_DONE,
> +	JMSK_IRQ_STATUS_RD_BUF_PLN0_DONE,
> +	JMSK_IRQ_STATUS_RD_BUF_PLN1_DONE,
> +	JMSK_IRQ_STATUS_RD_BUF_PLN2_DONE,
> +	JMSK_IRQ_STATUS_RD_BUF_PLNS_ATTN,
> +	JMSK_IRQ_STATUS_WR_BUF_PLN0_DONE,
> +	JMSK_IRQ_STATUS_WR_BUF_PLN1_DONE,
> +	JMSK_IRQ_STATUS_WR_BUF_PLN2_DONE,
> +	JMSK_IRQ_STATUS_WR_BUF_PLNS_ATTN,
> +	JMSK_IRQ_STATUS_SESSION_ERROR,
> +	JMSK_IRQ_STATUS_STOP_ACK,
> +	JMSK_IRQ_STATUS_RESET_ACK,
> +
> +	/* combined mask for clearing all interrupt status bits */
> +	JMSK_IRQ_STATUS_ALL_BITS,
> +
> +	/* fetch engine (FE) configuration fields */
> +	JMSK_FE_CFG_BYTE_ORDERING,
> +	JMSK_FE_CFG_BURST_LENGTH_MAX,
> +	JMSK_FE_CFG_MEMORY_FORMAT,
> +	JMSK_FE_CFG_CBCR_ORDER,
> +	JMSK_FE_CFG_BOTTOM_VPAD_EN,
> +	JMSK_FE_CFG_PLN0_EN,
> +	JMSK_FE_CFG_PLN1_EN,
> +	JMSK_FE_CFG_PLN2_EN,
> +	JMSK_FE_CFG_SIXTEEN_MCU_EN,
> +	JMSK_FE_CFG_MCUS_PER_BLOCK,
> +	JMSK_FE_CFG_MAL_BOUNDARY,
> +	JMSK_FE_CFG_MAL_EN,
> +
> +	JMSK_FE_VBPAD_CFG_BLOCK_ROW,
> +	JMSK_FE_VBPAD_CFG,
> +
> +	/* fetch engine plane address/geometry fields */
> +	JMSK_PLNS_RD_OFFSET,
> +	JMSK_PLNS_RD_BUF_SIZE_WIDTH,
> +	JMSK_PLNS_RD_BUF_SIZE_HEIGHT,
> +	JMSK_PLNS_RD_STRIDE,
> +	JMSK_PLNS_RD_HINIT,
> +	JMSK_PLNS_RD_VINIT,
> +	JMSK_PLN0_RD_HINIT_INT,
> +	JMSK_PLN1_RD_HINIT_INT,
> +	JMSK_PLN2_RD_HINIT_INT,
> +	JMSK_PLN0_RD_VINIT_INT,
> +	JMSK_PLN1_RD_VINIT_INT,
> +	JMSK_PLN2_RD_VINIT_INT,
> +
> +	/* write engine (WE) configuration fields */
> +	JMSK_WE_CFG_BYTE_ORDERING,
> +	JMSK_WE_CFG_BURST_LENGTH_MAX,
> +	JMSK_WE_CFG_MEMORY_FORMAT,
> +	JMSK_WE_CFG_CBCR_ORDER,
> +	JMSK_WE_CFG_PLN0_EN,
> +	JMSK_WE_CFG_PLN1_EN,
> +	JMSK_WE_CFG_PLN2_EN,
> +	JMSK_WE_CFG_MAL_BOUNDARY,
> +	JMSK_WE_CFG_MAL_EN,
> +	JMSK_WE_CFG_POP_BUFF_ON_EOS,
> +
> +	/* write engine plane address/geometry fields */
> +	JMSK_PLNS_WR_BUF_SIZE_WIDTH,
> +	JMSK_PLNS_WR_BUF_SIZE_HEIGHT,
> +	JMSK_PLNS_WR_STRIDE,
> +	JMSK_PLNS_WR_HINIT,
> +	JMSK_PLNS_WR_VINIT,
> +	JMSK_PLNS_WR_HSTEP,
> +	JMSK_PLNS_WR_VSTEP,
> +	JMSK_PLNS_WR_BLOCK_CFG_PER_COL,
> +	JMSK_PLNS_WR_BLOCK_CFG_PER_RAW,
> +
> +	/* encoder configuration fields */
> +	JMSK_ENC_CFG_IMAGE_FORMAT,
> +	JMSK_ENC_CFG_APPLY_EOI,
> +	JMSK_ENC_CFG_HUFFMAN_SEL,
> +	JMSK_ENC_CFG_FSC_ENABLE,
> +	JMSK_ENC_CFG_OUTPUT_DISABLE,
> +	JMSK_ENC_CFG_RST_MARKER_PERIOD,
> +	JMSK_ENC_IMAGE_SIZE_WIDTH,
> +	JMSK_ENC_IMAGE_SIZE_HEIGHT,
> +
> +	/* scaler configuration fields */
> +	JMSK_SCALE_CFG_HSCALE_ENABLE,
> +	JMSK_SCALE_CFG_VSCALE_ENABLE,
> +	JMSK_SCALE_CFG_UPSAMPLE_EN,
> +	JMSK_SCALE_CFG_SUBSAMPLE_EN,
> +	JMSK_SCALE_CFG_HSCALE_ALGO,
> +	JMSK_SCALE_CFG_VSCALE_ALGO,
> +	JMSK_SCALE_CFG_H_SCALE_FIR_ALGO,
> +	JMSK_SCALE_CFG_V_SCALE_FIR_ALGO,
> +	JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH,
> +	JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT,
> +	JMSK_SCALE_PLNS_HSTEP_FRACTIONAL,
> +	JMSK_SCALE_PLNS_HSTEP_INTEGER,
> +	JMSK_SCALE_PLNS_VSTEP_FRACTIONAL,
> +	JMSK_SCALE_PLNS_VSTEP_INTEGER,
> +
> +	/* dMI table configuration and write fields */
> +	JMSK_DMI_CFG,
> +	JMSK_DMI_ADDR,
> +	JMSK_DMI_DATA,
> +
> +	JMSK_ID_MAX
> +};
> +
> +struct qcom_jpeg_reg_offs {
> +	u32 hw_version;
> +	u32 hw_capability;
> +	u32 reset_cmd;
> +	u32 core_cfg;
> +	u32 int_mask;
> +	u32 int_clr;
> +	u32 int_status;
> +	u32 hw_cmd;
> +	u32 enc_core_state;
> +
> +	struct {
> +		u32 pntr[QCOM_JPEG_MAX_PLANES];
> +		u32 offs[QCOM_JPEG_MAX_PLANES];
> +		u32 bsize[QCOM_JPEG_MAX_PLANES];
> +		u32 stride[QCOM_JPEG_MAX_PLANES];
> +		u32 hinit[QCOM_JPEG_MAX_PLANES];
> +		u32 vinit[QCOM_JPEG_MAX_PLANES];
> +		u32 pntr_cnt;
> +		u32 vbpad_cfg;
> +	} fe;
> +	u32 fe_cfg;
> +
> +	struct {
> +		u32 pntr[QCOM_JPEG_MAX_PLANES];
> +		u32 bsize[QCOM_JPEG_MAX_PLANES];
> +		u32 stride[QCOM_JPEG_MAX_PLANES];
> +		u32 hinit[QCOM_JPEG_MAX_PLANES];
> +		u32 hstep[QCOM_JPEG_MAX_PLANES];
> +		u32 vinit[QCOM_JPEG_MAX_PLANES];
> +		u32 vstep[QCOM_JPEG_MAX_PLANES];
> +		u32 blocks[QCOM_JPEG_MAX_PLANES];
> +		u32 pntr_cnt;
> +	} we;
> +	u32 we_cfg;
> +
> +	struct {
> +		u32 hstep[QCOM_JPEG_MAX_PLANES];
> +		u32 vstep[QCOM_JPEG_MAX_PLANES];
> +	} scale;
> +	u32 scale_cfg;
> +	u32 scale_out_cfg[QCOM_JPEG_MAX_PLANES];
> +
> +	u32 enc_cfg;
> +	u32 enc_img_size;
> +	u32 enc_out_size;
> +
> +	u32 dmi_cfg;
> +	u32 dmi_data;
> +	u32 dmi_addr;
> +};
> +
> +#endif /* QCOM_JENC_DEFS_H */
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> new file mode 100644
> index 000000000000..c3573853f24a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> @@ -0,0 +1,337 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interconnect.h>
> +#include <linux/interrupt.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "qcom_jenc_dev.h"
> +
> +#include "qcom_jenc_defs.h"
> +#include "qcom_jenc_ops.h"
> +#include "qcom_jenc_res.h"
> +#include "qcom_jenc_v4l2.h"
> +
> +static int qcom_jpeg_clk_init(struct qcom_jenc_dev *jenc)
> +{
> +	int c_idx;
> +
> +	jenc->num_clks = devm_clk_bulk_get_all(jenc->dev, &jenc->clks);
> +	if (jenc->num_clks < 0)
> +		return jenc->num_clks;
> +
> +	for (c_idx = 0; c_idx < jenc->num_clks; c_idx++) {
> +		if (!strcmp(jenc->clks[c_idx].id, "jpeg")) {
> +			jenc->core_clk = jenc->clks[c_idx].clk;
> +			return 0;
> +		}
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
> +{
> +	struct dev_pm_opp *opp;
> +	unsigned long freq;
> +	int rc;
> +
> +	/* look up the OPP entry by level to obtain the core clock frequency */
> +	opp = dev_pm_opp_find_level_exact(jenc->dev, jenc->perf);
> +	if (IS_ERR(opp)) {
> +		dev_err(jenc->dev, "OPP not found for perf level %u: %pe\n", jenc->perf, opp);
> +		return PTR_ERR(opp);
> +	}
> +	freq = dev_pm_opp_get_freq(opp);
> +	dev_pm_opp_put(opp);
> +
> +	rc = clk_set_rate(jenc->core_clk, freq);
> +	if (rc) {
> +		dev_err(jenc->dev, "core clock set rate failed: %d\n", rc);
> +		return rc;
> +	}
> +
> +	rc = clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
> +	if (rc) {
> +		clk_set_rate(jenc->core_clk, 0);
> +		return rc;
> +	}
> +
> +	dev_dbg(jenc->dev, "JPEG core clock: %ld\n", clk_get_rate(jenc->core_clk));
> +
> +	return 0;
> +}
> +
> +static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
> +{
> +	clk_set_rate(jenc->core_clk, 0);
> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
> +}
> +
> +static int qcom_jpeg_icc_on(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_dev_resources	*res = jenc->res;
> +	int p_idx;
> +	int rc;
> +
> +	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++) {
> +		rc = icc_set_bw(jenc->icc_paths[p_idx], res->icc_res[p_idx].pair.aggr,
> +				res->icc_res[p_idx].pair.peak);
> +		if (rc) {
> +			dev_err(jenc->dev, "icc_set_bw failed for path %s: %d\n",
> +				res->icc_res[p_idx].icc_id, rc);
> +			goto err_icc_set_bw;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_icc_set_bw:
> +	while (--p_idx >= 0)
> +		icc_set_bw(jenc->icc_paths[p_idx], 0, 0);
> +
> +	return rc;
> +}
> +
> +static void qcom_jpeg_icc_off(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_dev_resources	*res = jenc->res;
> +	int p_idx;
> +
> +	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++)
> +		icc_set_bw(jenc->icc_paths[p_idx], 0, 0);
> +}
> +
> +static int qcom_jpeg_icc_init(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_dev_resources	*res = jenc->res;
> +	int p_idx;
> +
> +	jenc->icc_paths = devm_kcalloc(jenc->dev, res->num_of_icc, sizeof(*jenc->icc_paths),
> +				       GFP_KERNEL);
> +	if (!jenc->icc_paths)
> +		return -ENOMEM;
> +
> +	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++) {
> +		jenc->icc_paths[p_idx] = devm_of_icc_get(jenc->dev, res->icc_res[p_idx].icc_id);
> +		if (IS_ERR(jenc->icc_paths[p_idx])) {
> +			return dev_err_probe(jenc->dev, PTR_ERR(jenc->icc_paths[p_idx]),
> +					     "failed to get ICC path: %pe\n",
> +					     jenc->icc_paths[p_idx]);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_pm_suspend(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +
> +	qcom_jpeg_clk_off(jenc);
> +
> +	qcom_jpeg_icc_off(jenc);
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_pm_resume(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc = qcom_jpeg_icc_on(jenc);
> +	if (rc)
> +		return rc;
> +
> +	rc = qcom_jpeg_clk_on(jenc);
> +	if (rc) {
> +		qcom_jpeg_icc_off(jenc);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_suspend(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	v4l2_m2m_suspend(jenc->m2m_dev);
> +
> +	rc = pm_runtime_force_suspend(dev);
> +	if (rc)
> +		v4l2_m2m_resume(jenc->m2m_dev);
> +
> +	return rc;
> +}
> +
> +static int qcom_jpeg_resume(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc = pm_runtime_force_resume(dev);
> +	if (rc)
> +		return rc;
> +
> +	v4l2_m2m_resume(jenc->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops qcom_jpeg_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(qcom_jpeg_suspend, qcom_jpeg_resume)
> +	RUNTIME_PM_OPS(qcom_jpeg_pm_suspend, qcom_jpeg_pm_resume, NULL)
> +};
> +
> +static int qcom_jpeg_probe(struct platform_device *pdev)
> +{
> +	const struct qcom_dev_resources *res;
> +	struct qcom_jenc_dev *jenc;
> +	int rc;
> +
> +	jenc = kzalloc_obj(*jenc, GFP_KERNEL);
> +	if (!jenc)
> +		return -ENOMEM;
> +
> +	jenc->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, jenc);
> +	rc = devm_mutex_init(&pdev->dev, &jenc->dev_mutex);
> +	if (rc)
> +		goto err_free_jenc;
> +	spin_lock_init(&jenc->hw_lock);
> +	init_completion(&jenc->reset_complete);
> +	init_completion(&jenc->stop_complete);
> +
> +	res = device_get_match_data(jenc->dev);
> +	if (!res) {
> +		rc = dev_err_probe(jenc->dev, -ENODEV, "unsupported SoC\n");
> +		goto err_free_jenc;
> +	}
> +	jenc->res = res;
> +
> +	if (!jenc->res->hw_offs || !jenc->res->hw_ops) {
> +		rc = dev_err_probe(jenc->dev, -EINVAL, "missing hw resources\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
> +		goto err_free_jenc;
> +	}
> +
> +	jenc->jpeg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(jenc->jpeg_base)) {
> +		rc = dev_err_probe(jenc->dev, PTR_ERR(jenc->jpeg_base),
> +				   "failed to map JPEG resource\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = devm_pm_opp_of_add_table(jenc->dev);
> +	if (rc && rc != -ENODEV) {
> +		dev_err_probe(jenc->dev, rc, "failed to add OPP table\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = qcom_jpeg_clk_init(jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to get clocks\n");
> +		goto err_free_jenc;
> +	}
> +
> +	jenc->irq = platform_get_irq(pdev, 0);
> +	if (jenc->irq < 0) {
> +		rc = dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = devm_request_threaded_irq(jenc->dev, jenc->irq,
> +				       jenc->res->hw_ops->hw_irq_top,
> +				       jenc->res->hw_ops->hw_irq_bot,
> +				       IRQF_ONESHOT, dev_name(jenc->dev), jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = qcom_jpeg_icc_init(jenc);
> +	if (rc)
> +		goto err_free_jenc;
> +
> +	rc = v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to register V4L2 device\n");
> +		goto err_free_jenc;
> +	}
> +
> +	jenc->perf = QCOM_SOC_PERF_NOMINAL;
> +
> +	rc = devm_pm_runtime_enable(jenc->dev);
> +	if (rc)
> +		goto err_v4l2_device_unregister;
> +
> +	rc = qcom_jpeg_v4l2_register(jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to register video device\n");
> +		goto err_v4l2_device_unregister;
> +	}
> +
> +	dev_dbg(jenc->dev, "Qualcomm JPEG encoder registered\n");
> +
> +	return 0;
> +
> +err_v4l2_device_unregister:
> +	v4l2_device_unregister(&jenc->v4l2_dev);
> +	kfree(jenc);
> +	return rc;
> +err_free_jenc:
> +	kfree(jenc);
> +	return rc;
> +}
> +
> +static void qcom_jpeg_remove(struct platform_device *pdev)
> +{
> +	struct qcom_jenc_dev *jenc = platform_get_drvdata(pdev);
> +
> +	/* v4l2_device_unregister() is called from the release callback. */
> +	qcom_jpeg_v4l2_unregister(jenc);
> +
> +	dev_dbg(jenc->dev, "Qualcomm JPEG encoder deregistered\n");
> +}
> +
> +static const struct of_device_id qcom_jpeg_of_match[] = {
> +	{
> +		.compatible	= "qcom,sm8250-jenc",
> +		.data		= &qcom_t165_t480_jpeg_drvdata
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_jpeg_of_match);
> +
> +static struct platform_driver qcom_jpeg_platform_driver = {
> +	.probe  = qcom_jpeg_probe,
> +	.remove = qcom_jpeg_remove,
> +	.driver = {
> +		.name = QCOM_JPEG_ENC_NAME,
> +		.of_match_table = qcom_jpeg_of_match,
> +		.pm             = pm_ptr(&qcom_jpeg_pm_ops),
> +	},
> +};
> +
> +module_platform_driver(qcom_jpeg_platform_driver);
> +
> +MODULE_DESCRIPTION("QCOM JPEG mem2mem V4L2 encoder");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
> new file mode 100644
> index 000000000000..0e830e4eae3d
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
> @@ -0,0 +1,111 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_DEV_H
> +#define QCOM_JENC_DEV_H
> +
> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/irqreturn.h>
> +#include <linux/mutex.h>
> +
> +#include <media/videobuf2-core.h>
> +
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/v4l2-ctrls.h>
> +
> +#include "qcom_jenc_res.h"
> +#include "qcom_jenc_hdr.h"
> +#include "qcom_jenc_defs.h"
> +
> +#define QCOM_JPEG_ENC_NAME "qcom-jpeg-enc"
> +
> +#define TYPE2QID(t) \
> +	(V4L2_TYPE_IS_OUTPUT(t) ? JENC_SRC_QUEUE : JENC_DST_QUEUE)
> +
> +enum qcom_enc_qid {
> +	JENC_SRC_QUEUE = 0,
> +	JENC_DST_QUEUE,
> +	JENC_QUEUE_MAX
> +};
> +
> +struct jenc_enc_format {
> +	u32 type;
> +	u32 fourcc;
> +};
> +
> +struct qcom_jpeg_buff {
> +	struct {
> +		struct sg_table		*sgt;
> +		dma_addr_t		dma;
> +		unsigned long		size;
> +
> +	} plns[QCOM_JPEG_MAX_PLANES];
> +};
> +
> +struct qcom_jenc_queue {
> +	struct v4l2_pix_format_mplane	vf;
> +	u32				sequence;
> +	struct qcom_jpeg_buff		buff[VB2_MAX_FRAME];
> +	int				buff_id;
> +};
> +
> +struct qcom_jenc_dev {
> +	struct device			*dev;
> +	struct v4l2_device		v4l2_dev;
> +	struct v4l2_m2m_dev		*m2m_dev;
> +	struct video_device		*vdev;
> +	const struct qcom_dev_resources	*res;
> +	enum qcom_soc_perf_level	perf;
> +	int				irq;
> +	void __iomem			*jpeg_base;
> +	struct clk_bulk_data		*clks;
> +	int				num_clks;
> +	struct clk			*core_clk;
> +	/* device mutex lock */
> +	struct mutex			dev_mutex;
> +	atomic_t			ref_count;
> +	struct completion		reset_complete;
> +	struct completion		stop_complete;
> +	/* encoder hardware lock */
> +	spinlock_t			hw_lock;
> +	struct jenc_context		*actx;
> +	struct icc_path			**icc_paths;
> +
> +	u32				pending_irq_status;
> +
> +	void (*enc_hw_irq_cb)
> +		(void *data, enum vb2_buffer_state ev, size_t out_size);
> +};
> +
> +struct jenc_context {
> +	struct device		 *dev;
> +	struct qcom_jenc_dev	 *jenc;
> +	struct v4l2_fh		 fh;
> +
> +	/* quality update lock */
> +	struct mutex		 quality_mutex;
> +	struct v4l2_ctrl	 *quality_ctl;
> +	u32			 quality_requested;
> +	u32			 quality_programmed;
> +	struct v4l2_ctrl	 *perf_level_auto_ctl;
> +	struct v4l2_ctrl	 *fps_target_ctl;
> +	struct v4l2_ctrl_handler ctrl_hdl;
> +
> +	/* session context lock */
> +	struct mutex		 ctx_lock;
> +
> +	bool			 is_stopping;
> +	bool			 hw_acquired;
> +
> +	struct qcom_jenc_queue	bufq[JENC_QUEUE_MAX];
> +	struct qcom_jenc_header	hdr_cache;
> +
> +	struct work_struct finish_work;
> +	struct work_struct stop_work;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
> new file mode 100644
> index 000000000000..cce15cc18186
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
> @@ -0,0 +1,354 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/string.h>
> +
> +#include <media/jpeg.h>
> +#include <media/v4l2-jpeg.h>
> +
> +#include "qcom_jenc_dev.h"
> +#include "qcom_jenc_hdr.h"
> +
> +/*
> + * The elements defined in this header are specified
> + * in the ITU-T T.81 / JPEG specification.
> + *
> + * https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +
> +#define JFIF_HEADER_WIDTH_OFFS		0x07
> +#define JFIF_HEADER_HEIGHT_OFFS		0x05
> +
> +#define JPEG_MARKER_PREFIX		0xff
> +
> +#define JFIF_APP0_LENGTH_HI		0x00
> +#define JFIF_APP0_LENGTH_LO		0x10
> +#define JFIF_IDENT_TERM		0x00
> +#define JFIF_VERSION_MAJOR		0x01
> +#define JFIF_VERSION_MINOR		0x01
> +#define JFIF_DENSITY_HI			0x00
> +#define JFIF_DENSITY_LO			0x01
> +#define JFIF_THUMBNAIL_SIZE		0x00
> +
> +#define JPEG_SEG_LEN_HI			0x00
> +#define JPEG_LEN_DQT_LUMA_LO		0x43
> +#define JPEG_LEN_DQT_CHROMA_LO		0x43
> +#define JPEG_LEN_SOF0_MONO_LO		0x0b
> +#define JPEG_LEN_SOF0_COLOR_LO		0x11
> +#define JPEG_LEN_DHT_MONO_LO		0xd2
> +#define JPEG_LEN_DHT_COLOR_HI		0x01
> +#define JPEG_LEN_DHT_COLOR_LO		0xa2
> +#define JPEG_LEN_SOS_MONO_LO		0x08
> +#define JPEG_LEN_SOS_COLOR_LO		0x0c
> +
> +#define JPEG_SAMPLE_PRECISION_BITS	0x08
> +#define JPEG_COMP_MONO			1
> +#define JPEG_COMP_COLOR		3
> +
> +#define JPEG_SAMPLING_H1V1		0x11
> +#define JPEG_SAMPLING_H2V2		0x22
> +
> +#define JPEG_QTABLE_LUMA		0
> +#define JPEG_QTABLE_CHROMA		1
> +
> +#define JPEG_DC_HT_INDEX_LUMA		0x00
> +#define JPEG_DC_HT_INDEX_CHROMA		0x01
> +#define JPEG_AC_HT_INDEX_LUMA		0x10
> +#define JPEG_AC_HT_INDEX_CHROMA		0x11
> +
> +#define JPEG_SPECTRAL_START		0x00
> +#define JPEG_SPECTRAL_END		0x3f
> +#define JPEG_APPROX_HIGH_LOW		0x00
> +#define JPEG_TABLE_SEL_LUMA		0x00
> +#define JPEG_TABLE_SEL_CHROMA		0x11
> +
> +struct jpeg_header_buf {
> +	u8  *ptr;
> +	u32 size;
> +	u32 pos;
> +};
> +
> +static const struct jpeg_soi_app0 soi_app0 = {
> +	.soi		= { JPEG_MARKER_PREFIX, JPEG_MARKER_SOI },
> +	.app0_marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_APP0 },
> +	.app0_length	= { JFIF_APP0_LENGTH_HI, JFIF_APP0_LENGTH_LO },
> +	.jfif_id	= { 'J', 'F', 'I', 'F', JFIF_IDENT_TERM },
> +	.version	= { JFIF_VERSION_MAJOR, JFIF_VERSION_MINOR },
> +	.units		= 0x00,
> +	.density_x	= { JFIF_DENSITY_HI, JFIF_DENSITY_LO },
> +	.density_y	= { JFIF_DENSITY_HI, JFIF_DENSITY_LO },
> +	.thumb_x	= JFIF_THUMBNAIL_SIZE,
> +	.thumb_y	= JFIF_THUMBNAIL_SIZE,
> +};
> +
> +static const struct jpeg_record_hdr dqt_luma_hdr = {
> +	.marker = { JPEG_MARKER_PREFIX, JPEG_MARKER_DQT },
> +	.length = { JPEG_SEG_LEN_HI, JPEG_LEN_DQT_LUMA_LO }
> +};
> +
> +static const struct jpeg_record_hdr dqt_chroma_hdr = {
> +	.marker = { JPEG_MARKER_PREFIX, JPEG_MARKER_DQT },
> +	.length = { JPEG_SEG_LEN_HI, JPEG_LEN_DQT_CHROMA_LO }
> +};
> +
> +/* Luminance quantization table */
> +static const struct jpeg_dqt_header dqt_luma_data = {
> +	.index = 0x00,
> +};
> +
> +/* Chrominance quantization table */
> +static const struct jpeg_dqt_header dqt_chroma_data = {
> +	.index = 0x01,
> +};
> +
> +static const struct jpeg_record_hdr  sof0_mono_hdr = {
> +	.marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_SOF0 },
> +	.length	= { JPEG_SEG_LEN_HI, JPEG_LEN_SOF0_MONO_LO },
> +};
> +
> +static const struct jpeg_sof0_mono sof0_mono_data = {
> +	.precision	= JPEG_SAMPLE_PRECISION_BITS,
> +	.height		= { 0x00, 0x00 },
> +	.width		= { 0x00, 0x00 },
> +	.components	= JPEG_COMP_MONO,
> +	.y_id		= 1,
> +	.y_sampling	= JPEG_SAMPLING_H1V1,
> +	.y_qtable	= JPEG_QTABLE_LUMA,
> +};
> +
> +static const struct jpeg_record_hdr  sof0_color_hdr = {
> +	.marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_SOF0 },
> +	.length	= { JPEG_SEG_LEN_HI, JPEG_LEN_SOF0_COLOR_LO },
> +};
> +
> +static const struct jpeg_sof0_color sof0_color_data = {
> +	.precision	= JPEG_SAMPLE_PRECISION_BITS,
> +	.height		= { 0x00, 0x00 },
> +	.width		= { 0x00, 0x00 },
> +	.components	= JPEG_COMP_COLOR,
> +	.y_id		= 1,
> +	.y_sampling	= JPEG_SAMPLING_H2V2,
> +	.y_qtable	= JPEG_QTABLE_LUMA,
> +	.cb_id		= 2,
> +	.cb_sampling	= JPEG_SAMPLING_H1V1,
> +	.cb_qtable	= JPEG_QTABLE_CHROMA,
> +	.cr_id		= 3,
> +	.cr_sampling	= JPEG_SAMPLING_H1V1,
> +	.cr_qtable	= JPEG_QTABLE_CHROMA,
> +};
> +
> +static const struct jpeg_record_hdr coeff_mono_hdr = {
> +	.marker = { JPEG_MARKER_PREFIX, JPEG_MARKER_DHT },
> +	.length = { JPEG_SEG_LEN_HI, JPEG_LEN_DHT_MONO_LO },
> +};
> +
> +static const struct jpeg_record_hdr coeff_color_hdr = {
> +	.marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_DHT },
> +	.length	= { JPEG_LEN_DHT_COLOR_HI, JPEG_LEN_DHT_COLOR_LO },
> +};
> +
> +static const struct jpeg_record_hdr sos_mono_hdr = {
> +	.marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_SOS },
> +	.length	= { JPEG_SEG_LEN_HI, JPEG_LEN_SOS_MONO_LO },
> +};
> +
> +static const struct jpeg_sos_mono sos_mono_data = {
> +	.components	= JPEG_COMP_MONO,
> +	.y_id		= 1,
> +	.y_tables	= JPEG_TABLE_SEL_LUMA,
> +	.spectral	= { JPEG_SPECTRAL_START, JPEG_SPECTRAL_END },
> +	.approx		= JPEG_APPROX_HIGH_LOW,
> +};
> +
> +static const struct jpeg_record_hdr sos_color_hdr = {
> +	.marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_SOS },
> +	.length	= { JPEG_SEG_LEN_HI, JPEG_LEN_SOS_COLOR_LO },
> +};
> +
> +static const struct jpeg_sos_color sos_color_data = {
> +	.components	= JPEG_COMP_COLOR,
> +	.y_id		= 1,
> +	.y_tables	= JPEG_TABLE_SEL_LUMA,
> +	.cb_id		= 2,
> +	.cb_tables	= JPEG_TABLE_SEL_CHROMA,
> +	.cr_id		= 3,
> +	.cr_tables	= JPEG_TABLE_SEL_CHROMA,
> +	.spectral	= { JPEG_SPECTRAL_START, JPEG_SPECTRAL_END },
> +	.approx		= JPEG_APPROX_HIGH_LOW,
> +};
> +
> +static inline int jb_put_mem(struct jpeg_header_buf *hdr, const void *src, u32 len)
> +{
> +	if (len > hdr->size - hdr->pos)
> +		return -ENOSPC;
> +
> +	memcpy(hdr->ptr + hdr->pos, src, len);
> +	hdr->pos += len;
> +
> +	return 0;
> +}
> +
> +static int jb_put_dht(struct jpeg_header_buf *hdr, u8 index, const u8 *table, u32 len)
> +{
> +	u8 data[1 + V4L2_JPEG_REF_HT_AC_LEN];
> +
> +	if (len > V4L2_JPEG_REF_HT_AC_LEN)
> +		return -EINVAL;
> +
> +	data[0] = index;
> +	memcpy(&data[1], table, len);
> +
> +	return jb_put_mem(hdr, data, len + 1);
> +}
> +
> +static inline void patch_u16be(u8 *buf, u32 off, u16 v)
> +{
> +	buf[off]	= (v >> 8) & 0xff;
> +	buf[off + 1]	=  v & 0xff;
> +}
> +
> +int qcom_jenc_header_init(struct qcom_jenc_header *c, u32 fourcc)
> +{
> +	int rc;
> +	struct jpeg_header_buf hdr = {
> +		.ptr = c->data,
> +		.size = sizeof(c->data),
> +		.pos = 0,
> +	};
> +
> +	c->sof_offset	= 0;
> +	c->dqt_luma_offs = 0;
> +	c->dqt_chroma_offs = 0;
> +
> +	rc = jb_put_mem(&hdr, &soi_app0, sizeof(soi_app0));
> +	if (rc)
> +		return rc;
> +
> +	/* luma DQT is always present */
> +	rc = jb_put_mem(&hdr, &dqt_luma_hdr, sizeof(dqt_luma_hdr));
> +	if (rc)
> +		return rc;
> +
> +	c->dqt_luma_offs = hdr.pos;
> +	rc = jb_put_mem(&hdr, &dqt_luma_data, sizeof(dqt_luma_data));
> +	if (rc)
> +		return rc;
> +
> +	/* chroma DQT only for color images */
> +	if (fourcc != V4L2_PIX_FMT_GREY) {
> +		rc = jb_put_mem(&hdr, &dqt_chroma_hdr, sizeof(dqt_chroma_hdr));
> +		if (rc)
> +			return rc;
> +
> +		c->dqt_chroma_offs = hdr.pos;
> +		rc = jb_put_mem(&hdr, &dqt_chroma_data, sizeof(dqt_chroma_data));
> +		if (rc)
> +			return rc;
> +	}
> +
> +	/* store the offset of the SOF record for later use */
> +	c->sof_offset = hdr.pos;
> +
> +	if (fourcc != V4L2_PIX_FMT_GREY) {
> +		rc = jb_put_mem(&hdr, &sof0_color_hdr, sizeof(sof0_color_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&hdr, &sof0_color_data, sizeof(sof0_color_data));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&hdr, &coeff_color_hdr, sizeof(coeff_color_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_dht(&hdr, JPEG_DC_HT_INDEX_LUMA,
> +				v4l2_jpeg_ref_table_luma_dc_ht,
> +				ARRAY_SIZE(v4l2_jpeg_ref_table_luma_dc_ht));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_dht(&hdr, JPEG_AC_HT_INDEX_LUMA,
> +				v4l2_jpeg_ref_table_luma_ac_ht,
> +				ARRAY_SIZE(v4l2_jpeg_ref_table_luma_ac_ht));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_dht(&hdr, JPEG_DC_HT_INDEX_CHROMA,
> +				v4l2_jpeg_ref_table_chroma_dc_ht,
> +				ARRAY_SIZE(v4l2_jpeg_ref_table_chroma_dc_ht));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_dht(&hdr, JPEG_AC_HT_INDEX_CHROMA,
> +				v4l2_jpeg_ref_table_chroma_ac_ht,
> +				ARRAY_SIZE(v4l2_jpeg_ref_table_chroma_ac_ht));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&hdr, &sos_color_hdr, sizeof(sos_color_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&hdr, &sos_color_data, sizeof(sos_color_data));
> +		if (rc)
> +			return rc;
> +	} else {
> +		rc = jb_put_mem(&hdr, &sof0_mono_hdr, sizeof(sof0_mono_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&hdr, &sof0_mono_data, sizeof(sof0_mono_data));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&hdr, &coeff_mono_hdr, sizeof(coeff_mono_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_dht(&hdr, JPEG_DC_HT_INDEX_LUMA,
> +				v4l2_jpeg_ref_table_luma_dc_ht,
> +				ARRAY_SIZE(v4l2_jpeg_ref_table_luma_dc_ht));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_dht(&hdr, JPEG_AC_HT_INDEX_LUMA,
> +				v4l2_jpeg_ref_table_luma_ac_ht,
> +				ARRAY_SIZE(v4l2_jpeg_ref_table_luma_ac_ht));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&hdr, &sos_mono_hdr, sizeof(sos_mono_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&hdr, &sos_mono_data, sizeof(sos_mono_data));
> +		if (rc)
> +			return rc;
> +	}
> +
> +	c->size = hdr.pos;
> +
> +	return 0;
> +}
> +
> +void qcom_jenc_dqts_emit(const struct qcom_jenc_header *c, u8 *dst)
> +{
> +	/* Propagate DQT tables into the JPEG header */
> +	if (c->dqt_luma_offs) {
> +		u32 luma_offs = c->dqt_luma_offs + sizeof(dqt_luma_data.index);
> +
> +		memcpy(dst + luma_offs, &c->data[luma_offs], sizeof(dqt_luma_data.value));
> +	}
> +
> +	if (c->dqt_chroma_offs) {
> +		u32 chroma_offs = c->dqt_chroma_offs + sizeof(dqt_chroma_data.index);
> +
> +		memcpy(dst + chroma_offs, &c->data[chroma_offs], sizeof(dqt_chroma_data.value));
> +	}
> +}
> +
> +u32 qcom_jenc_header_emit(const struct qcom_jenc_header *c, u8 *dst, u32 dst_size, u16 width,
> +			  u16 height)
> +{
> +	/* Copy JFIF into JPEG header and update actual image size */
> +	if (dst_size < c->size)
> +		return 0;
> +
> +	memcpy(dst, c->data, c->size);
> +
> +	/* Update output image size */
> +	patch_u16be(dst, c->sof_offset + JFIF_HEADER_WIDTH_OFFS, width);
> +	patch_u16be(dst, c->sof_offset + JFIF_HEADER_HEIGHT_OFFS, height);
> +
> +	return c->size;
> +}
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
> new file mode 100644
> index 000000000000..db1e5298e51f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
> @@ -0,0 +1,119 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_HDR_H
> +#define QCOM_JENC_HDR_H
> +
> +#include <linux/types.h>
> +
> +#include <media/v4l2-jpeg.h>
> +
> +#include "qcom_jenc_defs.h"
> +
> +#define JPEG_HEADER_MAX	1024
> +
> +struct qcom_jenc_header {
> +	u8  data[JPEG_HEADER_MAX];
> +	u32 size;
> +	u32 sof_offset;
> +	u32 dqt_luma_offs;
> +	u32 dqt_chroma_offs;
> +};
> +
> +struct jpeg_record_hdr {
> +	u8 marker[2];
> +	u8 length[2];
> +} __packed;
> +
> +struct jpeg_dqt_header {
> +	u8 index;
> +	u8 value[V4L2_JPEG_PIXELS_IN_BLOCK];
> +} __packed;
> +
> +struct jpeg_soi_app0 {
> +	u8 soi[2];
> +	u8 app0_marker[2];
> +	u8 app0_length[2];
> +	u8 jfif_id[5];
> +	u8 version[2];
> +	u8 units;
> +	u8 density_x[2];
> +	u8 density_y[2];
> +	u8 thumb_x;
> +	u8 thumb_y;
> +} __packed;
> +
> +struct jpeg_sof0_mono {
> +	u8 precision;
> +	u8 height[2];
> +	u8 width[2];
> +	u8 components;
> +
> +	u8 y_id;
> +	u8 y_sampling;
> +	u8 y_qtable;
> +} __packed;
> +
> +struct jpeg_sof0_color {
> +	u8 precision;
> +	u8 height[2];
> +	u8 width[2];
> +	u8 components;
> +
> +	u8 y_id;
> +	u8 y_sampling;
> +	u8 y_qtable;
> +
> +	u8 cb_id;
> +	u8 cb_sampling;
> +	u8 cb_qtable;
> +
> +	u8 cr_id;
> +	u8 cr_sampling;
> +	u8 cr_qtable;
> +} __packed;
> +
> +struct jpeg_sos_hdr {
> +	u8 sos_marker[2];
> +	u8 sos_length[2];
> +	u8 components;
> +} __packed;
> +
> +struct jpeg_sos_mono {
> +	u8 components;
> +
> +	u8 y_id;
> +	u8 y_tables;
> +
> +	u8 spectral[2];
> +	u8 approx;
> +} __packed;
> +
> +struct jpeg_sos_color {
> +	u8 components;
> +
> +	u8 y_id;
> +	u8 y_tables;
> +
> +	u8 cb_id;
> +	u8 cb_tables;
> +
> +	u8 cr_id;
> +	u8 cr_tables;
> +
> +	u8 spectral[2];
> +	u8 approx;
> +} __packed;
> +
> +struct jenc_context;
> +
> +int qcom_jenc_header_init(struct qcom_jenc_header *c, u32 fourcc);
> +
> +void qcom_jenc_dqts_emit(const struct qcom_jenc_header *c, u8 *dst);
> +
> +u32 qcom_jenc_header_emit(const struct qcom_jenc_header *c, u8 *dst, u32 dst_size, u16 width,
> +			  u16 height);
> +
> +#endif /* QCOM_JENC_HDR_H */
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
> new file mode 100644
> index 000000000000..a34c87fc59ec
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
> @@ -0,0 +1,1524 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/math64.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/scatterlist.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-sg.h>
> +
> +#include "qcom_jenc_defs.h"
> +#include "qcom_jenc_dev.h"
> +#include "qcom_jenc_ops.h"
> +
> +#define JPEG_RESET_TIMEOUT_MS	300
> +#define JPEG_STOP_TIMEOUT_MS	200
> +
> +#define JPEG_DQT_SHIFT		20
> +
> +#define JPEG_MCU_BLOCK_8	8
> +#define JPEG_MCU_BLOCK_16	16
> +#define JPEG_MCU_BLOCK_128	128
> +#define JPEG_MCU_BLOCK_256	256
> +
> +#define JPEG_DEFAULT_SCALE_STEP	0x200000
> +
> +#define JPEG_CLR_U32	(0U)
> +#define JPEG_SET_U32	(~0U)
> +
> +/*
> + *  JPEG | V4L2
> + *  ---- | -------
> + *  H1V1 | GREY
> + *  H1V2 | YUV422M
> + *  H2V1 | NV16M
> + *  H2V2 | NV12M
> + */
> +enum qcom_jpeg_encode_fmt {
> +	JPEG_ENCODE_H1V1 = 0,
> +	JPEG_ENCODE_H1V2,
> +	JPEG_ENCODE_H2V1,
> +	JPEG_ENCODE_H2V2,
> +	JPEG_ENCODE_MONO,
> +};
> +
> +enum qcom_jpeg_memory_fmt {
> +	JPEG_MEM_FMT_PLANAR	 = 0x0,
> +	JPEG_MEM_FMT_PPLANAR	 = 0x1,
> +	JPEG_MEM_FMT_MONO	 = 0x2,
> +	JPEG_MEM_FMT_COEFFICIENT = 0x3
> +};
> +
> +enum jpeg_mal_bounds {
> +	JPEG_CFG_MAL_BOUND_32_BYTES	= 0x0,
> +	JPEG_CFG_MAL_BOUND_64_BYTES	= 0x1,
> +	JPEG_CFG_MAL_BOUND_128_BYTES	= 0x2,
> +	JPEG_CFG_MAL_BOUND_256_BYTES	= 0x3,
> +	JPEG_CFG_MAL_BOUND_512_BYTES	= 0x4,
> +	JPEG_CFG_MAL_BOUND_1K_BYTES	= 0x5,
> +	JPEG_CFG_MAL_BOUND_2K_BYTES	= 0x6,
> +	JPEG_CFG_MAL_BOUND_4K_BYTES	= 0x7
> +};
> +
> +struct qcom_jpeg_scale_blocks {
> +	u8 w_block[QCOM_JPEG_MAX_PLANES];
> +	u8 h_block[QCOM_JPEG_MAX_PLANES];
> +};
> +
> +struct qcom_jpeg_mal_boundary {
> +	u32 bytes;
> +	int boundary;
> +};
> +
> +struct qcom_jpeg_formats {
> +	enum qcom_jpeg_encode_fmt encode;
> +	enum qcom_jpeg_memory_fmt memory;
> +	u32 fourcc;
> +};
> +
> +/*
> + * Luminance quantization table defined by CCITT T.81.
> + * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +static const u8 t81k1_dct_luma_table[V4L2_JPEG_PIXELS_IN_BLOCK] = {
> +	16,  11,  10,  16,  24,  40,  51,  61,
> +	12,  12,  14,  19,  26,  58,  60,  55,
> +	14,  13,  16,  24,  40,  57,  69,  56,
> +	14,  17,  22,  29,  51,  87,  80,  62,
> +	18,  22,  37,  56,  68, 109, 103,  77,
> +	24,  35,  55,  64,  81, 104, 113,  92,
> +	49,  64,  78,  87, 103, 121, 120, 101,
> +	72,  92,  95,  98, 112, 100, 103,  99
> +};
> +
> +/*
> + * Chrominance quantization table defined by CCITT T.81.
> + * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +static const u8 t81k2_dct_chroma_table[V4L2_JPEG_PIXELS_IN_BLOCK] = {
> +	17,  18,  24,  47,  99,  99,  99,  99,
> +	18,  21,  26,  66,  99,  99,  99,  99,
> +	24,  26,  56,  99,  99,  99,  99,  99,
> +	47,  66,  99,  99,  99,  99,  99,  99,
> +	99,  99,  99,  99,  99,  99,  99,  99,
> +	99,  99,  99,  99,  99,  99,  99,  99,
> +	99,  99,  99,  99,  99,  99,  99,  99,
> +	99,  99,  99,  99,  99,  99,  99,  99
> +};
> +
> +/*
> + * Zig-zag scan order for quantized DCT coefficients
> + * as defined by CCITT T.81.
> + * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +static const u8 t81a6_dct_zig_zag_table[] = {
> +	 0,  1,  5,  6, 14, 15, 27, 28,
> +	 2,  4,  7, 13, 16, 26, 29, 42,
> +	 3,  8, 12, 17, 25, 30, 41, 43,
> +	 9, 11, 18, 24, 31, 40, 44, 53,
> +	10, 19, 23, 32, 39, 45, 52, 54,
> +	20, 22, 33, 38, 46, 51, 55, 60,
> +	21, 34, 37, 47, 50, 56, 59, 61,
> +	35, 36, 48, 49, 57, 58, 62, 63
> +};
> +
> +static const struct qcom_jpeg_formats jpeg_encode_fmt[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_GREY,
> +		.encode = JPEG_ENCODE_MONO,
> +		.memory = JPEG_MEM_FMT_MONO
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_JPEG,
> +		.encode = JPEG_ENCODE_H1V1,
> +		.memory = JPEG_MEM_FMT_PPLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YUV422M,
> +		.encode = JPEG_ENCODE_H1V2,
> +		.memory = JPEG_MEM_FMT_PLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YVU422M,
> +		.encode = JPEG_ENCODE_H1V2,
> +		.memory = JPEG_MEM_FMT_PLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV16M,
> +		.encode = JPEG_ENCODE_H2V1,
> +		.memory = JPEG_MEM_FMT_PPLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV61M,
> +		.encode = JPEG_ENCODE_H2V1,
> +		.memory = JPEG_MEM_FMT_PPLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12M,
> +		.encode = JPEG_ENCODE_H2V2,
> +		.memory = JPEG_MEM_FMT_PPLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV21M,
> +		.encode = JPEG_ENCODE_H2V2,
> +		.memory = JPEG_MEM_FMT_PPLANAR
> +	}
> +};
> +
> +static const struct qcom_jpeg_mal_boundary jpeg_mal_bounds[] = {
> +	{ .bytes =   32, .boundary = JPEG_CFG_MAL_BOUND_32_BYTES  },
> +	{ .bytes =   64, .boundary = JPEG_CFG_MAL_BOUND_64_BYTES  },
> +	{ .bytes =  128, .boundary = JPEG_CFG_MAL_BOUND_128_BYTES },
> +	{ .bytes =  256, .boundary = JPEG_CFG_MAL_BOUND_256_BYTES },
> +	{ .bytes =  512, .boundary = JPEG_CFG_MAL_BOUND_512_BYTES },
> +	{ .bytes = 1024, .boundary = JPEG_CFG_MAL_BOUND_1K_BYTES  },
> +	{ .bytes = 2048, .boundary = JPEG_CFG_MAL_BOUND_2K_BYTES  },
> +	{ .bytes = 4096, .boundary = JPEG_CFG_MAL_BOUND_4K_BYTES  }
> +};
> +
> +static const struct qcom_jpeg_scale_blocks jpeg_mcu_blocks[] = {
> +	[JPEG_ENCODE_H1V1] = {
> +		.w_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +		.h_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +	},
> +	[JPEG_ENCODE_H1V2] = {
> +		.w_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8  },
> +		.h_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +	},
> +	[JPEG_ENCODE_H2V1] = {
> +		.w_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +		.h_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8  },
> +	},
> +	[JPEG_ENCODE_H2V2] = {
> +		.w_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +		.h_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +	},
> +	[JPEG_ENCODE_MONO] = {
> +		.w_block = { JPEG_MCU_BLOCK_8 },
> +		.h_block = { JPEG_MCU_BLOCK_8 }
> +	},
> +};
> +
> +static inline int jpeg_get_memory_fmt(u32 fourcc)
> +{
> +	u32 fi;
> +
> +	for (fi = 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
> +		if (jpeg_encode_fmt[fi].fourcc == fourcc)
> +			return jpeg_encode_fmt[fi].memory;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static inline int jpeg_get_encode_fmt(u32 fourcc)
> +{
> +	u32 fi;
> +
> +	for (fi = 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
> +		if (jpeg_encode_fmt[fi].fourcc == fourcc)
> +			return jpeg_encode_fmt[fi].encode;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static inline int jpeg_get_mal_boundary(u32 width, const struct qcom_jpeg_mal_boundary *table,
> +					u32 count)
> +{
> +	u32 bi;
> +
> +	for (bi = 0; bi < count; bi++) {
> +		if (table[bi].bytes > width)
> +			break;
> +	}
> +
> +	if (!bi)
> +		return table[0].boundary;
> +
> +	if (bi >= count)
> +		return table[count - 1].boundary;
> +
> +	return table[bi - 1].boundary;
> +}
> +
> +static inline int jpeg_get_mcu_geometry(enum qcom_jpeg_encode_fmt fmt, u32 width, u32 height,
> +					u32 *blk_w, u32 *blk_h, u32 *mcu_cols, u32 *mcu_rows)
> +{
> +	const struct qcom_jpeg_scale_blocks *blks;
> +	u32 bw = 0, bh = 0;
> +	u8 pln;
> +
> +	blks = &jpeg_mcu_blocks[fmt];
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		bw = max(bw, blks->w_block[pln]);
> +		bh = max(bh, blks->h_block[pln]);
> +	}
> +
> +	if (!bw || !bh)
> +		return -EINVAL;
> +
> +	if (blk_w)
> +		*blk_w = bw;
> +	if (blk_h)
> +		*blk_h = bh;
> +
> +	if (mcu_cols)
> +		*mcu_cols = ALIGN(width, bw) / bw;
> +
> +	if (mcu_rows)
> +		*mcu_rows = ALIGN(height, bh) / bh;
> +
> +	return 0;
> +}
> +
> +static inline u32 jpeg_io_read(struct qcom_jenc_dev *jenc, u32 offset)
> +{
> +	return readl(jenc->jpeg_base + offset);
> +}
> +
> +static inline void jpeg_io_write(struct qcom_jenc_dev *jenc, u32 offset, u32 value)
> +{
> +	writel(value, jenc->jpeg_base + offset);
> +}
> +
> +/*
> + * Runtime bitfield helpers (for non-constant masks).
> + *
> + * Requirements:
> + *  - mask must be non-zero
> + *  - mask must be contiguous (e.g. 0x7u << n)
> + */
> +
> +static inline u32 jpeg_bits_get(u32 mask, u32 val)
> +{
> +	/* __ffs(0) is undefined; fail-safe on invalid masks. */
> +	if (WARN_ON_ONCE(!mask))
> +		return 0;
> +
> +	return (val & mask) >> __ffs(mask);
> +}
> +
> +static inline u32 jpeg_bits_set(u32 mask, u32 val)
> +{
> +	/* __ffs(0) is undefined; fail-safe on invalid masks. */
> +	if (WARN_ON_ONCE(!mask))
> +		return 0;
> +
> +	return (val << __ffs(mask)) & mask;
> +}
> +
> +static inline u32 jpeg_rd_bits(struct qcom_jenc_dev *jenc, u32 offs, enum qcom_jpeg_mask_id mid)
> +{
> +	u32 reg  = jpeg_io_read(jenc, offs);
> +	u32 mask = jenc->res->hw_mask[mid];
> +
> +	return jpeg_bits_get(mask, reg);
> +}
> +
> +/*
> + * Read-modify-write (for R/W registers)
> + */
> +static inline void jpeg_rw_bits(struct qcom_jenc_dev *jenc, u32 offs, enum qcom_jpeg_mask_id mid,
> +				u32 val)
> +{
> +	u32 reg  = jpeg_io_read(jenc, offs);
> +	u32 mask = jenc->res->hw_mask[mid];
> +
> +	reg &= ~mask;
> +	reg |= jpeg_bits_set(mask, val);
> +
> +	jpeg_io_write(jenc, offs, reg);
> +}
> +
> +/*
> + * Write-only variant (for write only registers)
> + */
> +static inline void jpeg_wo_bits(struct qcom_jenc_dev *jenc, u32 offs, enum qcom_jpeg_mask_id mid,
> +				u32 val)
> +{
> +	u32 mask = jenc->res->hw_mask[mid];
> +
> +	jpeg_io_write(jenc, offs, jpeg_bits_set(mask, val));
> +}
> +
> +static u8 jpeg_calculate_dqt(struct jenc_context *ectx, u8 dqt_value)
> +{
> +	u8 calc_val;
> +	u64 ratio;
> +
> +	ratio = (QCOM_JPEG_QUALITY_MAX - ectx->quality_requested) << JPEG_DQT_SHIFT;
> +	ratio = max_t(u64, 1, ratio);
> +	do_div(ratio, QCOM_JPEG_QUALITY_MID);
> +
> +	calc_val = DIV64_U64_ROUND_CLOSEST(ratio * dqt_value, 1LU << JPEG_DQT_SHIFT);
> +
> +	return max_t(u8, 1, calc_val);
> +}
> +
> +/*
> + * jpeg_update_dqt_cache - compute scaled DQT coefficients and store them in
> + * the software JPEG header cache (hdr_cache).  Safe to call from buf_prepare
> + * before the hardware is powered on; no MMIO access is performed here.
> + */
> +static void jpeg_update_dqt_cache(struct jenc_context *ectx)
> +{
> +	u8 *base;
> +	u8 dqt_val, idx;
> +	int i;
> +
> +	/* Luma DQT cache update */
> +	if (ectx->hdr_cache.dqt_luma_offs) {
> +		base = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_luma_offs + 1];
> +		for (i = 0; i < ARRAY_SIZE(t81k1_dct_luma_table); i++) {
> +			dqt_val = jpeg_calculate_dqt(ectx, t81k1_dct_luma_table[i]);
> +			idx = t81a6_dct_zig_zag_table[i];
> +			base[idx] = dqt_val;
> +		}
> +	}
> +
> +	/* Chroma DQT cache update */
> +	if (ectx->hdr_cache.dqt_chroma_offs) {
> +		base = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_chroma_offs + 1];
> +		for (i = 0; i < ARRAY_SIZE(t81k2_dct_chroma_table); i++) {
> +			dqt_val = jpeg_calculate_dqt(ectx, t81k2_dct_chroma_table[i]);
> +			idx = t81a6_dct_zig_zag_table[i];
> +			base[idx] = dqt_val;
> +		}
> +	}
> +}
> +
> +/*
> + * jpeg_upload_dmi_table - write the scaled DQT coefficients to the hardware
> + * DMI registers.  Must only be called from the job execution path where
> + * runtime PM has already been acquired (pm_runtime_resume_and_get).
> + *
> + * Reads precomputed values from hdr_cache (populated by jpeg_update_dqt_cache)
> + * to avoid redundant per-coefficient recalculation on the hot encode path.
> + */
> +static void jpeg_upload_dmi_table(struct jenc_context *ectx)
> +{
> +	const u8 *luma_qt = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_luma_offs + 1];
> +	const struct qcom_jpeg_reg_offs *offs = ectx->jenc->res->hw_offs;
> +	u32 pcfg = 0x00000011;
> +	u32 addr = 0x00000000;
> +	u32 reg_val;
> +	int i;
> +
> +	/* DMI upload start sequence */
> +	jpeg_io_write(ectx->jenc, offs->dmi_addr, addr);
> +	jpeg_io_write(ectx->jenc, offs->dmi_cfg, pcfg);
> +
> +	/* DMI Luma upload - values are stored in zigzag order in hdr_cache */
> +	for (i = 0; i < ARRAY_SIZE(t81k1_dct_luma_table); i++) {
> +		reg_val = div_u64(U16_MAX + 1U, luma_qt[i]);
> +		reg_val = clamp_t(u32, reg_val, 0, U16_MAX);
> +		jpeg_io_write(ectx->jenc, offs->dmi_data, reg_val);
> +	}
> +
> +	/* DMI Chroma upload - only present for color formats */
> +	if (ectx->hdr_cache.dqt_chroma_offs) {
> +		const u8 *chroma_qt = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_chroma_offs + 1];
> +
> +		for (i = 0; i < ARRAY_SIZE(t81k2_dct_chroma_table); i++) {
> +			reg_val = div_u64(U16_MAX + 1U, chroma_qt[i]);
> +			reg_val = clamp_t(u32, reg_val, 0, U16_MAX);
> +			jpeg_io_write(ectx->jenc, offs->dmi_data, reg_val);
> +		}
> +	}
> +
> +	/* DMI upload end sequence */
> +	jpeg_io_write(ectx->jenc, offs->dmi_cfg, addr);
> +
> +	ectx->quality_programmed = ectx->quality_requested;
> +
> +	dev_dbg(ectx->dev, "quality_programmed=%d\n", ectx->quality_programmed);
> +}
> +
> +static void jpeg_sync_sg(struct device *dev,
> +			 struct qcom_jpeg_buff *frame,
> +			 enum dma_data_direction direction, bool for_device)
> +{
> +	u8 pln;
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		struct sg_table *sgt = frame->plns[pln].sgt;
> +
> +		if (!frame->plns[pln].dma || !sgt)
> +			break;
> +
> +		if (for_device)
> +			dma_sync_sgtable_for_device(dev, sgt, direction);
> +		else
> +			dma_sync_sgtable_for_cpu(dev, sgt, direction);
> +	}
> +}
> +
> +static int jpeg_init(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs;
> +	unsigned long rtime;
> +	u32 hw_ver;
> +
> +	if (WARN_ON_ONCE(!jenc || !jenc->dev || !jenc->jpeg_base || !jenc->res->hw_offs))
> +		return -EINVAL;
> +
> +	offs	 = jenc->res->hw_offs;
> +
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
> +
> +	reinit_completion(&jenc->reset_complete);
> +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_RESET_ACK, JPEG_SET_U32);
> +
> +	jpeg_wo_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_COMMON, JPEG_SET_U32);
> +
> +	rtime = wait_for_completion_timeout(&jenc->reset_complete,
> +					    msecs_to_jiffies(JPEG_RESET_TIMEOUT_MS));
> +	if (!rtime) {
> +		dev_err(jenc->dev, "encoder HW reset timeout\n");
> +		return -ETIME;
> +	}
> +
> +	hw_ver = jpeg_io_read(jenc, offs->hw_version);
> +	dev_dbg(jenc->dev, "JPEG HW encoder version %d.%d.%d\n",
> +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_MAJOR], hw_ver),
> +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_MINOR], hw_ver),
> +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_STEP], hw_ver));
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_SET_U32);
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_CLR_U32);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_SET_U32);
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_CLR_U32);
> +
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
> +	jpeg_wo_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
> +
> +	return 0;
> +}
> +
> +static int jpeg_exec(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_START, 1);
> +
> +	return 0;
> +}
> +
> +static void jpeg_stop(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_START, 0);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_SET_U32);
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_CLR_U32);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_SET_U32);
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_CLR_U32);
> +
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
> +	jpeg_wo_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
> +}
> +
> +static int jpeg_deinit(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	unsigned long rtime;
> +
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
> +
> +	reinit_completion(&jenc->stop_complete);
> +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_STOP_ACK, JPEG_SET_U32);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_STOP, 1);
> +
> +	rtime = wait_for_completion_timeout(&jenc->stop_complete,
> +					    msecs_to_jiffies(JPEG_STOP_TIMEOUT_MS));
> +	jpeg_wo_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_ALL_BITS, JPEG_CLR_U32);
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
> +
> +	if (!rtime) {
> +		dev_err(jenc->dev, "encoder HW stop timeout\n");
> +		return -ETIME;
> +	}
> +
> +	return 0;
> +}
> +
> +static int jpeg_apply_fe_addr(struct jenc_context *ectx, struct qcom_jenc_queue *q,
> +			      struct vb2_buffer *vb)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct qcom_jpeg_buff *frame = &q->buff[vb->index];
> +	struct v4l2_pix_format_mplane *fmt = &q->vf;
> +	unsigned long flags;
> +	u8 pln;
> +
> +	jpeg_sync_sg(jenc->dev, frame, DMA_TO_DEVICE, true);
> +
> +	for (pln = 0; pln < fmt->num_planes; pln++) {
> +		if (!frame->plns[pln].sgt || !frame->plns[pln].sgt->sgl)
> +			break;
> +
> +		jpeg_io_write(jenc, offs->fe.pntr[pln], frame->plns[pln].dma);
> +		jpeg_io_write(jenc, offs->fe.offs[pln], 0);
> +
> +		dev_dbg(jenc->dev, "FE pln=%d addr=%pad idx:%d\n",
> +			pln, &frame->plns[pln].dma, vb->index);
> +	}
> +
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +	q->buff_id = vb->index;
> +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int jpeg_store_fe_next(struct jenc_context *ectx, struct vb2_buffer *vb2)
> +{
> +	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb2->type)];
> +	struct qcom_jpeg_buff *buff = &q->buff[vb2->index];
> +	u8 pln;
> +
> +	for (pln = 0; pln < q->vf.num_planes; pln++) {
> +		buff->plns[pln].sgt = vb2_dma_sg_plane_desc(vb2, pln);
> +		if (!buff->plns[pln].sgt || !buff->plns[pln].sgt->sgl)
> +			return -EINVAL;
> +
> +		buff->plns[pln].dma = sg_dma_address(buff->plns[pln].sgt->sgl);
> +		if (!buff->plns[pln].dma)
> +			return -EINVAL;
> +
> +		buff->plns[pln].size = vb2_plane_size(vb2, pln);
> +		if (!buff->plns[pln].size)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_fe_size(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct v4l2_pix_format_mplane *sfmt = &q->vf;
> +	u8 pln;
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH, 0);
> +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT, 0);
> +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_STRIDE, 0);
> +	}
> +
> +	for (pln = 0; pln < sfmt->num_planes; pln++) {
> +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH,
> +			     sfmt->width  - 1);
> +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT,
> +			     sfmt->height  - 1);
> +		jpeg_rw_bits(jenc, offs->fe.stride[pln], JMSK_PLNS_RD_STRIDE,
> +			     sfmt->plane_fmt[pln].bytesperline);
> +
> +		dev_dbg(ectx->dev, "FE pln=%d width=%d height=%d stride=%d\n",
> +			pln,
> +			jpeg_rd_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH),
> +			jpeg_rd_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT),
> +			jpeg_rd_bits(jenc, offs->fe.stride[pln], JMSK_PLNS_RD_STRIDE));
> +	}
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_fe_hinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u8 pln;
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> +		jpeg_io_write(jenc, offs->fe.hinit[pln], 0);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_fe_vinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u8 pln;
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> +		jpeg_io_write(jenc, offs->fe.vinit[pln], 0);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_fe_params(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	struct v4l2_pix_format_mplane *sfmt = &q->vf;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u8 expected_planes, pln;
> +	int rval;
> +
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_EN, 1);
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_BOTTOM_VPAD_EN, 1);
> +
> +	rval = jpeg_get_memory_fmt(sfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "invalid memory format for v4l2 format: %p4cc\n",
> +			&sfmt->pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	switch (rval) {
> +	case JPEG_MEM_FMT_MONO:
> +		expected_planes = 1;
> +		break;
> +	case JPEG_MEM_FMT_PPLANAR:
> +		expected_planes = 2;
> +		break;
> +	case JPEG_MEM_FMT_PLANAR:
> +		expected_planes = 3;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (sfmt->num_planes != expected_planes) {
> +		dev_err(ectx->dev, "plane mismatch fmt=%u expected=%u got=%u\n",
> +			rval, expected_planes, sfmt->num_planes);
> +		return -EINVAL;
> +	}
> +
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MEMORY_FORMAT, rval);
> +
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN0_EN, 0);
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN1_EN, 0);
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN2_EN, 0);
> +
> +	/* Scaling is not supported; always configure for 1:1 */
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN, 1);
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK, 0);
> +
> +	dev_dbg(ectx->dev, "sixteen MCU enabled=%d, %d MCU per blocks\n",
> +		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN),
> +		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK));
> +
> +	rval = jpeg_get_mal_boundary(sfmt->width, jpeg_mal_bounds, ARRAY_SIZE(jpeg_mal_bounds));
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "failed to get FE mal boundary width=%u\n",
> +			sfmt->width);
> +		return -EINVAL;
> +	}
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_BOUNDARY, rval);
> +
> +	dev_dbg(ectx->dev, "optimal FE mal boundary=%d\n",
> +		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_BOUNDARY));
> +
> +	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
> +			&sfmt->pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	switch (rval) {
> +	case JPEG_ENCODE_MONO:
> +	case JPEG_ENCODE_H1V1:
> +	case JPEG_ENCODE_H2V1:
> +		jpeg_rw_bits(jenc, offs->fe.vbpad_cfg, JMSK_FE_VBPAD_CFG_BLOCK_ROW,
> +			     DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_8));
> +		break;
> +	case JPEG_ENCODE_H1V2:
> +	case JPEG_ENCODE_H2V2:
> +		jpeg_rw_bits(jenc, offs->fe.vbpad_cfg, JMSK_FE_VBPAD_CFG_BLOCK_ROW,
> +			     DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_16));
> +		break;
> +	default:
> +		dev_err(ectx->dev, "unsupported encode format: %d\n", rval);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(ectx->dev, "FE vpad config=%d\n",
> +		jpeg_rd_bits(jenc, offs->fe.vbpad_cfg, JMSK_FE_VBPAD_CFG_BLOCK_ROW));
> +
> +	if (sfmt->pixelformat == V4L2_PIX_FMT_NV21M || sfmt->pixelformat == V4L2_PIX_FMT_NV61M)
> +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_CBCR_ORDER, 1);
> +	else
> +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_CBCR_ORDER, 0);
> +
> +	for (pln = 0; pln < sfmt->num_planes; pln++) {
> +		if (sfmt->width && sfmt->height) {
> +			switch (pln) {
> +			case 0:
> +				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN0_EN, 1);
> +				break;
> +			case 1:
> +				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN1_EN, 1);
> +				break;
> +			case 2:
> +				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN2_EN, 1);
> +				break;
> +			}
> +		}
> +	}
> +
> +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_FE_ENABLE, 1);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_fe(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	int rc;
> +
> +	rc = jpeg_setup_fe_size(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	rc = jpeg_setup_fe_hinit(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	rc = jpeg_setup_fe_vinit(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	rc = jpeg_setup_fe_params(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +static int jpeg_ensure_header_cache(struct jenc_context *ectx)
> +{
> +	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
> +	int rc;
> +
> +	if (ectx->hdr_cache.size)
> +		return 0;
> +
> +	rc = qcom_jenc_header_init(&ectx->hdr_cache, sq->vf.pixelformat);
> +	if (rc) {
> +		dev_err(ectx->dev, "JFIF header lazy init failed\n");
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int jpeg_apply_we_addr(struct jenc_context *ectx, struct qcom_jenc_queue *q,
> +			      struct vb2_buffer *vb)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct qcom_jpeg_buff *frame = &q->buff[vb->index];
> +	void *mptr = vb2_plane_vaddr(vb, 0);
> +	dma_addr_t dma = frame->plns[0].dma;
> +	unsigned long flags;
> +	size_t header_size;
> +	int rc;
> +	u8 pln = 0;
> +
> +	if (WARN_ON_ONCE(!dma))
> +		return -EPERM;
> +
> +	if (WARN_ON_ONCE(!mptr))
> +		return -EPERM;
> +
> +	rc = jpeg_ensure_header_cache(ectx);
> +	if (rc)
> +		return rc;
> +
> +	/* Update DQT cache if quality changed, then upload to HW DMI. */
> +	mutex_lock(&ectx->quality_mutex);
> +	if (!ectx->hdr_cache.size || ectx->quality_programmed != ectx->quality_requested)
> +		jpeg_update_dqt_cache(ectx);
> +	jpeg_upload_dmi_table(ectx);
> +	mutex_unlock(&ectx->quality_mutex);
> +
> +	/*
> +	 * Invalidate stale CPU cache lines before writing the JPEG header
> +	 * with the CPU into the destination buffer.
> +	 */
> +	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, false);
> +
> +	header_size = min_t(size_t, vb->planes[0].length, ectx->hdr_cache.size);
> +	header_size = qcom_jenc_header_emit(&ectx->hdr_cache, mptr,
> +					    (u32)header_size, (u16)q->vf.width,
> +					    (u16)q->vf.height);
> +
> +	dma += header_size;
> +	qcom_jenc_dqts_emit(&ectx->hdr_cache, mptr);
> +
> +	/*
> +	 * Flush CPU writes to the header before handing the buffer to the
> +	 * hardware DMA engine.
> +	 */
> +	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, true);
> +
> +	jpeg_io_write(jenc, offs->we.pntr[pln], dma);
> +
> +	dev_dbg(jenc->dev, "WE pln=%d addr=%pad idx:%d\n",
> +		pln, &dma, vb->index);
> +
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +	q->buff_id = vb->index;
> +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int jpeg_store_we_next(struct jenc_context *ectx, struct vb2_buffer *vb2)
> +{
> +	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb2->type)];
> +	struct qcom_jpeg_buff *frame = &q->buff[vb2->index];
> +	struct sg_table *sgt;
> +	dma_addr_t dma;
> +
> +	sgt = vb2_dma_sg_plane_desc(vb2, 0);
> +	if (!sgt || !sgt->sgl)
> +		return -EINVAL;
> +
> +	dma = sg_dma_address(sgt->sgl);
> +	if (!dma)
> +		return -EINVAL;
> +
> +	if (!vb2_plane_vaddr(vb2, 0))
> +		return -EINVAL;
> +
> +	frame->plns[0].sgt = sgt;
> +	frame->plns[0].dma = dma;
> +	frame->plns[0].size = vb2_plane_size(vb2, 0);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_we_size(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct v4l2_pix_format_mplane *dfmt = &q->vf;
> +	u8 pln;
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> +		jpeg_rw_bits(jenc, offs->we.stride[pln], JMSK_PLNS_WR_STRIDE, 0);
> +
> +	jpeg_io_write(jenc, offs->we.bsize[0], dfmt->plane_fmt[0].sizeimage);
> +
> +	dev_dbg(ectx->dev, "WE size=%u\n", dfmt->plane_fmt[0].sizeimage);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_we_hinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct v4l2_pix_format_mplane *dfmt = &q->vf;
> +	u8 pln;
> +
> +	if (!dfmt->width) {
> +		dev_err(ectx->dev, "invalid destination width=%d\n", dfmt->width);
> +		return -EINVAL;
> +	}
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		jpeg_rw_bits(jenc, offs->we.hinit[pln], JMSK_PLNS_WR_HINIT, 0);
> +		jpeg_rw_bits(jenc, offs->we.hstep[pln], JMSK_PLNS_WR_HSTEP, 0);
> +	}
> +
> +	jpeg_rw_bits(jenc, offs->we.hstep[0], JMSK_PLNS_WR_HSTEP, dfmt->width);
> +
> +	dev_dbg(ectx->dev, "WE hstep=%u\n",
> +		jpeg_rd_bits(jenc, offs->we.hstep[0], JMSK_PLNS_WR_HSTEP));
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_we_vinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct v4l2_pix_format_mplane *dfmt = &q->vf;
> +	u8 pln;
> +
> +	if (!dfmt->height) {
> +		dev_err(ectx->dev, "invalid destination height=%d\n", dfmt->height);
> +		return -EINVAL;
> +	}
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		jpeg_rw_bits(jenc, offs->we.vinit[pln], JMSK_PLNS_WR_VINIT, 0);
> +		jpeg_rw_bits(jenc, offs->we.vstep[pln], JMSK_PLNS_WR_VSTEP, 0);
> +	}
> +
> +	jpeg_rw_bits(jenc, offs->we.vstep[0], JMSK_PLNS_WR_VSTEP, dfmt->height);
> +
> +	dev_dbg(ectx->dev, "WE vstep=%u\n",
> +		jpeg_rd_bits(jenc, offs->we.vstep[0], JMSK_PLNS_WR_VSTEP));
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_we_params(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct v4l2_pix_format_mplane *dfmt = &q->vf;
> +	u32 blk_w = 0, blk_h = 0, mcu_cols = 0, mcu_rows = 0;
> +	int rval;
> +
> +	rval = jpeg_get_memory_fmt(dfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "invalid memory format for v4l2 format: %p4cc\n",
> +			&dfmt->pixelformat);
> +		return -EINVAL;
> +	}
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MEMORY_FORMAT, rval);
> +
> +	rval = jpeg_get_mal_boundary(dfmt->width, jpeg_mal_bounds, ARRAY_SIZE(jpeg_mal_bounds));
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "failed to get WE mal boundary width=%u\n",
> +			dfmt->width);
> +		return -EINVAL;
> +	}
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_BOUNDARY, rval);
> +
> +	dev_dbg(ectx->dev, "optimal WE mal boundary=%d\n",
> +		jpeg_rd_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_BOUNDARY));
> +
> +	rval = jpeg_get_encode_fmt(dfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
> +			&dfmt->pixelformat);
> +		return rval;
> +	}
> +
> +	rval = jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_w, &blk_h,
> +				     &mcu_cols, &mcu_rows);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "invalid MCU geometry mcu_cols=%d mcu_rows=%d\n",
> +			mcu_cols, mcu_rows);
> +		return rval;
> +	}
> +
> +	dev_dbg(ectx->dev, "WE blk_w=%u blk_h=%u cols=%u rows=%u\n",
> +		blk_w, blk_h, mcu_cols, mcu_rows);
> +
> +	jpeg_rw_bits(jenc, offs->we.blocks[0], JMSK_PLNS_WR_BLOCK_CFG_PER_RAW, mcu_rows - 1);
> +	jpeg_rw_bits(jenc, offs->we.blocks[0], JMSK_PLNS_WR_BLOCK_CFG_PER_COL, mcu_cols - 1);
> +
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_CBCR_ORDER, 1);
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_EN, 1);
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_POP_BUFF_ON_EOS, 1);
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_PLN0_EN, 1);
> +
> +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_MODE, 1);
> +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_WE_ENABLE, 1);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_we(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	int rc;
> +
> +	rc = jpeg_setup_we_size(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	rc = jpeg_setup_we_hinit(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	rc = jpeg_setup_we_vinit(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	return jpeg_setup_we_params(ectx, q);
> +}
> +
> +static int jpeg_setup_scale(struct jenc_context *ectx)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
> +	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
> +	struct v4l2_pix_format_mplane *sfmt = &sq->vf;
> +	struct v4l2_pix_format_mplane *dfmt = &dq->vf;
> +	u32 blk_w = 0, blk_h = 0, mcu_cols = 0, mcu_rows = 0;
> +	int rval;
> +	u8 pln;
> +
> +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_SCALE_RESET, 1);
> +
> +	/* explicit no scaling */
> +	jpeg_rw_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE, 0);
> +	jpeg_rw_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE, 0);
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		jpeg_io_write(jenc, offs->scale.hstep[pln], JPEG_DEFAULT_SCALE_STEP);
> +		jpeg_io_write(jenc, offs->scale.vstep[pln], JPEG_DEFAULT_SCALE_STEP);
> +	}
> +
> +	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
> +			&sfmt->pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	rval = jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_w, &blk_h,
> +				     &mcu_cols, &mcu_rows);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "invalid MCU geometry blk_w=%d blk_h=%d\n",
> +			blk_w, blk_h);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(ectx->dev, "scale blk_w=%u blk_h=%u cols=%u rows=%u\n",
> +		blk_w, blk_h, mcu_cols, mcu_rows);
> +
> +	for (pln = 0; pln < sq->vf.num_planes; pln++) {
> +		jpeg_rw_bits(jenc, offs->scale_out_cfg[pln],
> +			     JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH, mcu_cols - 1);
> +		jpeg_rw_bits(jenc, offs->scale_out_cfg[pln],
> +			     JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT, mcu_rows - 1);
> +	}
> +
> +	dev_dbg(ectx->dev, "scale src=%ux%u dst=%ux%u enable=%d/%d\n",
> +		sfmt->width, sfmt->height, dfmt->width, dfmt->height,
> +		jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE),
> +		jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE));
> +
> +	/* Disabled, but must be configured */
> +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_SCALE_ENABLE, 0);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_encode(struct jenc_context *ectx)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
> +	struct v4l2_pix_format_mplane *sfmt = &sq->vf;
> +	u32 blk_w = 0, blk_h = 0, mcu_cols = 0, mcu_rows = 0;
> +	int rval;
> +
> +	if (!sfmt->width || !sfmt->height)
> +		return -EINVAL;
> +
> +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_ENCODER_RESET, 1);
> +
> +	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
> +			&sfmt->pixelformat);
> +		return -EINVAL;
> +	}
> +	jpeg_rw_bits(jenc, offs->enc_cfg, JMSK_ENC_CFG_IMAGE_FORMAT, rval);
> +
> +	rval = jpeg_get_mcu_geometry(rval, sfmt->width, sfmt->height, &blk_w, &blk_h,
> +				     &mcu_cols, &mcu_rows);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "invalid MCU geometry mcu_cols=%d mcu_rows=%d\n",
> +			mcu_cols, mcu_rows);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(ectx->dev, "encode blk_w=%u blk_h=%u cols=%u rows=%u\n",
> +		blk_w, blk_h, mcu_cols, mcu_rows);
> +
> +	jpeg_rw_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_WIDTH, mcu_cols - 1);
> +	jpeg_rw_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_HEIGHT, mcu_rows - 1);
> +
> +	dev_dbg(ectx->dev, "encode width=%d height=%d\n",
> +		jpeg_rd_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_WIDTH),
> +		jpeg_rd_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_HEIGHT));
> +
> +	jpeg_rw_bits(jenc, offs->enc_cfg, JMSK_ENC_CFG_APPLY_EOI, 1);
> +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_ENC_ENABLE, 1);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t op_jpeg_irq_bot(int irq, void *data)
> +{
> +	struct qcom_jenc_dev *jenc = data;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	unsigned long flags;
> +	u32 irq_status;
> +	u32 irq_mask;
> +
> +	irq_status = READ_ONCE(jenc->pending_irq_status);
> +
> +	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_DONE];
> +	if (jpeg_bits_get(irq_mask, irq_status)) {
> +		struct jenc_context *ctx;
> +
> +		spin_lock_irqsave(&jenc->hw_lock, flags);
> +		ctx = jenc->actx;
> +		jenc->actx = NULL;
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +		if (ctx && ctx->bufq[JENC_DST_QUEUE].buff_id >= 0) {
> +			struct qcom_jenc_queue *dq = &ctx->bufq[JENC_DST_QUEUE];
> +			struct qcom_jpeg_buff *frame = &dq->buff[dq->buff_id];
> +			size_t out_size = jpeg_io_read(jenc, offs->enc_out_size);
> +
> +			dev_dbg(jenc->dev, "complete idx:%d addr=%pad size=%zu\n",
> +				dq->buff_id, &frame->plns[0].dma, out_size);
> +
> +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
> +					    out_size + ctx->hdr_cache.size);
> +		}
> +
> +		jpeg_stop(jenc);
> +	}
> +
> +	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_ERROR];
> +	if (jpeg_bits_get(irq_mask, irq_status)) {
> +		struct jenc_context *ctx;
> +
> +		spin_lock_irqsave(&jenc->hw_lock, flags);
> +		ctx = jenc->actx;
> +		jenc->actx = NULL;
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +		dev_err(jenc->dev, "encoder hardware failure=0x%x\n",
> +			jpeg_bits_get(irq_mask, irq_status));
> +		if (ctx)
> +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_ERROR, 0);
> +
> +		jpeg_stop(jenc);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t op_jpeg_irq_top(int irq, void *data)
> +{
> +	struct qcom_jenc_dev *jenc = data;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	unsigned long flags;
> +	u32 irq_status;
> +	u32 irq_mask;
> +
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +
> +	irq_status = jpeg_io_read(jenc, offs->int_status);
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_STATUS_ALL_BITS, irq_status);
> +
> +	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_RESET_ACK];
> +	if (jpeg_bits_get(irq_mask, irq_status)) {
> +		complete(&jenc->reset_complete);
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +		return IRQ_HANDLED;
> +	}
> +
> +	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_STOP_ACK];
> +	if (jpeg_bits_get(irq_mask, irq_status)) {
> +		complete(&jenc->stop_complete);
> +		dev_dbg(jenc->dev, "hardware stop acknowledged\n");
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +		return IRQ_HANDLED;
> +	}
> +
> +	WRITE_ONCE(jenc->pending_irq_status, irq_status);
> +
> +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static void op_jpeg_get_hw_caps(struct qcom_jenc_dev *jenc, u32 *caps)
> +{
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u32 hw_caps;
> +
> +	hw_caps = jpeg_io_read(jenc, offs->hw_capability);
> +	dev_dbg(jenc->dev, "CAPS: encode=%d decode=%d upscale=%d downscale=%d\n",
> +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_ENCODE], hw_caps),
> +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_DECODE], hw_caps),
> +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_UPSCALE], hw_caps),
> +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_DOWNSCALE], hw_caps));
> +
> +	*caps = hw_caps;
> +}
> +
> +static struct qcom_jenc_queue *op_jpeg_get_buff_queue(struct jenc_context *ectx,
> +						      enum qcom_enc_qid id)
> +{
> +	return &ectx->bufq[id];
> +}
> +
> +static int op_jpeg_queue_setup(struct jenc_context *ectx, enum qcom_enc_qid id)
> +{
> +	int rc;
> +
> +	if (id == JENC_SRC_QUEUE) {
> +		struct qcom_jenc_queue *q = &ectx->bufq[id];
> +
> +		rc = qcom_jenc_header_init(&ectx->hdr_cache, q->vf.pixelformat);
> +		if (rc) {
> +			dev_err(ectx->dev, "JFIF header init failed\n");
> +			return rc;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int op_jpeg_src_fmt_update(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc)
> +{
> +	bool old_is_mono = (old_fourcc == V4L2_PIX_FMT_GREY);
> +	bool new_is_mono = (new_fourcc == V4L2_PIX_FMT_GREY);
> +	int rc;
> +
> +	/* header layout changes only for mono <-> color source format switch */
> +	if (old_is_mono == new_is_mono)
> +		return 0;
> +
> +	rc = qcom_jenc_header_init(&ectx->hdr_cache, new_fourcc);
> +	if (rc) {
> +		dev_err(ectx->dev, "JFIF header reinit failed\n");
> +		return rc;
> +	}
> +
> +	/* force DQT upload after source profile switch */
> +	ectx->quality_programmed = 0;
> +
> +	return 0;
> +}
> +
> +static int op_jpeg_buffer_prepare(struct jenc_context *ectx, struct vb2_buffer *vb2)
> +{
> +	int rc;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vb2->type)) {
> +		rc = jpeg_store_fe_next(ectx, vb2);
> +		if (rc)
> +			dev_err(ectx->dev, "cannot set up fetch engine address\n");
> +	} else {
> +		rc = jpeg_store_we_next(ectx, vb2);
> +		if (rc)
> +			dev_err(ectx->dev, "cannot set up write engine address\n");
> +	}
> +
> +	return rc;
> +}
> +
> +static int op_jpeg_process_exec(struct qcom_jenc_dev *jenc, struct jenc_context *ectx,
> +				struct vb2_buffer *vb)
> +{
> +	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
> +	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
> +	unsigned long flags;
> +	int rc;
> +
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +	jenc->actx = ectx;
> +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
> +		rc = jpeg_setup_fe(ectx, sq);
> +		if (rc)
> +			goto err_clear_ctx;
> +
> +		rc = jpeg_apply_fe_addr(ectx, sq, vb);
> +		if (rc)
> +			goto err_clear_ctx;
> +	} else {
> +		rc = jpeg_setup_we(ectx, dq);
> +		if (rc)
> +			goto err_clear_ctx;
> +
> +		rc = jpeg_apply_we_addr(ectx, dq, vb);
> +		if (rc)
> +			goto err_clear_ctx;
> +	}
> +
> +	if (sq->sequence == dq->sequence) {
> +		rc = jpeg_setup_scale(ectx);
> +		if (rc)
> +			goto err_clear_ctx;
> +
> +		rc = jpeg_setup_encode(ectx);
> +		if (rc)
> +			goto err_clear_ctx;
> +
> +		jpeg_exec(jenc);
> +	}
> +
> +	return 0;
> +
> +err_clear_ctx:
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +	if (jenc->actx == ectx)
> +		jenc->actx = NULL;
> +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +	return rc;
> +}
> +
> +static int op_jpeg_prepare(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +
> +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_ENCODER_RESET, 1);
> +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_BLOCK_FORMATTER_RST, 1);
> +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_CORE_RESET, 1);
> +
> +	return 0;
> +}
> +
> +static enum qcom_soc_perf_level jpeg_calc_perf_level(struct device *dev, u32 width, u32 height,
> +						     u32 fps)
> +{
> +	enum qcom_soc_perf_level level;
> +	u64 required_clk;
> +	u64 pixel_rate;
> +
> +	if (!width || !height || !fps)
> +		return QCOM_SOC_PERF_LOWSVS;
> +
> +	pixel_rate = (u64)width * height * fps;
> +
> +	required_clk = DIV_ROUND_UP_ULL(pixel_rate * JPEG_REF_CLK_HZ, JPEG_REF_PIXEL_RATE);
> +
> +	if (required_clk <= JPEG_CLK_LOWSVS_HZ)
> +		level = QCOM_SOC_PERF_LOWSVS;
> +	else if (required_clk <= JPEG_CLK_SVS_HZ)
> +		level = QCOM_SOC_PERF_SVS;
> +	else if (required_clk <= JPEG_CLK_SVS_L1_HZ)
> +		level = QCOM_SOC_PERF_SVS_L1;
> +	else
> +		level = QCOM_SOC_PERF_NOMINAL;
> +
> +	dev_dbg(dev, "JPEG perf: %ux%u @ %u FPS, %llu MPix/s -> %llu MHz -> %d\n",
> +		width, height, fps,
> +		div64_u64(pixel_rate, 1000000ULL), div64_u64(required_clk, 1000000ULL), level);
> +
> +	return level;
> +}
> +
> +static enum qcom_soc_perf_level jpeg_get_perf_level(struct jenc_context *ectx)
> +{
> +	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
> +	u32 fps;
> +
> +	/*
> +	 * If adaptive performance scaling is not requested always run at
> +	 * highest clock level for deterministic latency.
> +	 */
> +	if (!v4l2_ctrl_g_ctrl(ectx->perf_level_auto_ctl))
> +		return QCOM_SOC_PERF_NOMINAL;
> +
> +	if (!sq->vf.width || !sq->vf.height)
> +		return QCOM_SOC_PERF_NOMINAL;
> +
> +	fps = (u32)v4l2_ctrl_g_ctrl(ectx->fps_target_ctl);
> +	fps = clamp(fps, (u32)QCOM_JPEG_FPS_MIN, (u32)QCOM_JPEG_FPS_MAX);
> +
> +	return jpeg_calc_perf_level(ectx->dev, sq->vf.width, sq->vf.height, fps);
> +}
> +
> +static int op_jpeg_acquire(struct jenc_context *ectx, struct vb2_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
> +	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
> +	int rc;
> +
> +	/* reset per-context stream state for each (re)acquire */
> +	sq->sequence = 0;
> +	sq->buff_id = -1;
> +	dq->sequence = 0;
> +	dq->buff_id = -1;
> +	/*
> +	 * Recreate JPEG header lazily per destination buffer to tolerate
> +	 * different valid V4L2 call orders (e.g. STREAMON before first QBUF).
> +	 */
> +	ectx->hdr_cache.size = 0;
> +	/* force DQT upload on first frame after (re)acquire */
> +	ectx->quality_programmed = 0;
> +
> +	if (atomic_inc_return(&jenc->ref_count) == 1) {
> +		jenc->perf = jpeg_get_perf_level(ectx);
> +		dev_dbg(jenc->dev, "perf=%u src=%ux%u\n", jenc->perf,
> +			sq->vf.width, sq->vf.height);
> +
> +		rc = pm_runtime_resume_and_get(jenc->dev);
> +		if (rc < 0) {
> +			dev_err(jenc->dev, "PM runtime get failed\n");
> +			atomic_dec(&jenc->ref_count);
> +			return rc;
> +		}
> +
> +		rc = jpeg_init(jenc);
> +		if (rc) {
> +			dev_err(jenc->dev, "hardware init failed\n");
> +			atomic_dec(&jenc->ref_count);
> +			pm_runtime_put_sync(jenc->dev);
> +			return rc;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int op_jpeg_release(struct jenc_context *ectx, struct vb2_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	int rc = 0;
> +	int pm_rc;
> +	int ref;
> +
> +	ref = atomic_dec_if_positive(&jenc->ref_count);
> +	if (ref < 0) {
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}
> +
> +	if (!ref) {
> +		rc = jpeg_deinit(jenc);
> +		if (rc)
> +			dev_err(jenc->dev, "hardware exit failed\n");
> +
> +		pm_rc = pm_runtime_put_sync(jenc->dev);
> +		if (pm_rc < 0) {
> +			dev_err(jenc->dev, "PM runtime put failed\n");
> +			if (!rc)
> +				rc = pm_rc;
> +		}
> +
> +		dev_dbg(jenc->dev, "JPEG HW encoder released\n");
> +	}
> +
> +	return rc;
> +}
> +
> +const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops = {
> +	.hw_get_cap	= op_jpeg_get_hw_caps,
> +	.hw_acquire	= op_jpeg_acquire,
> +	.hw_release	= op_jpeg_release,
> +	.hw_prepare	= op_jpeg_prepare,
> +	.get_queue	= op_jpeg_get_buff_queue,
> +	.queue_setup	= op_jpeg_queue_setup,
> +	.src_fmt_update	= op_jpeg_src_fmt_update,
> +	.buf_prepare	= op_jpeg_buffer_prepare,
> +	.process_exec	= op_jpeg_process_exec,
> +	.hw_irq_top	= op_jpeg_irq_top,
> +	.hw_irq_bot	= op_jpeg_irq_bot
> +};
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
> new file mode 100644
> index 000000000000..857af4a24794
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_OPS_H
> +#define QCOM_JENC_OPS_H
> +
> +#include <linux/types.h>
> +#include <linux/device.h>
> +#include <media/videobuf2-core.h>
> +
> +#include "qcom_jenc_dev.h"
> +
> +/*
> + * JENC encoder hardware operations.
> + */
> +struct qcom_jpeg_hw_ops {
> +	void (*hw_get_cap)
> +		(struct qcom_jenc_dev *jenc_dev, u32 *hw_caps);
> +
> +	int (*hw_acquire)
> +		(struct jenc_context *ectx, struct vb2_queue *queue);
> +
> +	int (*hw_release)
> +		(struct jenc_context *ectx, struct vb2_queue *queue);
> +
> +	int (*hw_prepare)
> +		(struct qcom_jenc_dev *jenc);
> +
> +	struct qcom_jenc_queue * (*get_queue)
> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
> +
> +	int (*queue_setup)
> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
> +
> +	int (*src_fmt_update)
> +		(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc);
> +
> +	int (*buf_prepare)
> +		(struct jenc_context *ectx, struct vb2_buffer *vb2);
> +
> +	int (*process_exec)
> +		(struct qcom_jenc_dev *jenc, struct jenc_context *ectx, struct vb2_buffer *vb2);
> +
> +	irqreturn_t (*hw_irq_top)(int irq_num, void *data);
> +	irqreturn_t (*hw_irq_bot)(int irq_num, void *data);
> +};
> +
> +extern const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops;
> +
> +#endif /* QCOM_JENC_OPS_H */
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
> new file mode 100644
> index 000000000000..d3f78b9a672d
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "qcom_jenc_ops.h"
> +#include "qcom_jenc_res.h"
> +
> +#include "qcom_jenc_v420_hw_info.h"
> +
> +static const struct qcom_icc_resource qcom_jpeg_default_icc[] = {
> +	{
> +		.icc_id = "cpu-cfg",
> +		.pair	= { 38400, 76800 }
> +	},
> +	{
> +		.icc_id = "hf-mnoc",
> +		.pair	= { 2097152, 2097152 }
> +	},
> +	{
> +		.icc_id = "sf-mnoc",
> +		.pair	= { 0, 2097152 }
> +	},
> +	{
> +		.icc_id	= "icp-mnoc",
> +		.pair	= { 2097152, 2097152 }
> +	},
> +};
> +
> +/*
> + * Resources for T165, T170, T480 JPEG version and derivatives
> + */
> +const struct qcom_dev_resources qcom_t165_t480_jpeg_drvdata = {
> +	.hw_ops		= &qcom_jpeg_default_ops,
> +	.hw_offs	= &qcom_jpeg_v420_hw_reg_offs,
> +	.hw_mask	= &qcom_jpeg_v420_hw_reg_mask[0],
> +	.icc_res	= qcom_jpeg_default_icc,
> +	.num_of_icc	= ARRAY_SIZE(qcom_jpeg_default_icc),
> +};
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
> new file mode 100644
> index 000000000000..d7ffc69b142c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_RES_H
> +#define QCOM_JENC_RES_H
> +
> +#include "qcom_jenc_defs.h"
> +
> +struct qcom_icc_resource {
> +	const char *icc_id;
> +	struct {
> +		u32 aggr;
> +		u32 peak;
> +	} pair;
> +};
> +
> +struct qcom_dev_resources {
> +	const struct qcom_jpeg_hw_ops	*hw_ops;
> +	const struct qcom_jpeg_reg_offs	*hw_offs;
> +	const u32			*hw_mask;
> +
> +	const struct qcom_icc_resource	*icc_res;
> +	unsigned int			num_of_icc;
> +};
> +
> +extern const struct qcom_dev_resources qcom_t165_t480_jpeg_drvdata;
> +
> +#endif	/* QCOM_JENC_RES_H */
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
> new file mode 100644
> index 000000000000..b3b6589db079
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
> @@ -0,0 +1,527 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_V420_HW_INFO_H
> +#define QCOM_JENC_V420_HW_INFO_H
> +
> +#include "qcom_jenc_defs.h"
> +
> +#define JPEG_V420_HW_VER_STEP_POS 0
> +#define JPEG_V420_HW_VER_STEP_MSK \
> +	(0xffffu << JPEG_V420_HW_VER_STEP_POS)
> +
> +#define JPEG_V420_HW_VER_MINOR_POS 16
> +#define JPEG_V420_HW_VER_MINOR_MSK \
> +	(0x0fffu << JPEG_V420_HW_VER_MINOR_POS)
> +
> +#define JPEG_V420_HW_VER_MAJOR_POS 28
> +#define JPEG_V420_HW_VER_MAJOR_MSK \
> +	(0xfu << JPEG_V420_HW_VER_MAJOR_POS)
> +
> +#define JPEG_V420_HW_CAP_ENCODE_MSK BIT_U32(0)
> +#define JPEG_V420_HW_CAP_DECODE_MSK BIT_U32(1)
> +
> +#define JPEG_V420_HW_CAP_UPSCALE_POS 4
> +#define JPEG_V420_HW_CAP_UPSCALE_MSK \
> +	(0x7u << JPEG_V420_HW_CAP_UPSCALE_POS)
> +
> +#define JPEG_V420_HW_CAP_DOWNSCALE_POS 8
> +#define JPEG_V420_HW_CAP_DOWNSCALE_MSK \
> +	(0x7u << JPEG_V420_HW_CAP_DOWNSCALE_POS)
> +
> +#define JPEG_V420_RST_CMD_FE_RESET_MSK			BIT_U32(0)
> +#define JPEG_V420_RST_CMD_WE_RESET_MSK			BIT_U32(1)
> +#define JPEG_V420_RST_CMD_ENCODER_RESET_MSK		BIT_U32(4)
> +#define JPEG_V420_RST_CMD_DECODER_RESET_MSK		BIT_U32(5)
> +#define JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST_MSK	BIT_U32(6)
> +#define JPEG_V420_RST_CMD_SCALE_RESET_MSK		BIT_U32(7)
> +#define JPEG_V420_RST_CMD_REGISTER_RESET_MSK		BIT_U32(13)
> +#define JPEG_V420_RST_CMD_MISR_RESET_MSK		BIT_U32(16)
> +#define JPEG_V420_RST_CMD_CORE_RESET_MSK		BIT_U32(17)
> +#define JPEG_V420_RST_CMD_JPEG_V420_DOMAIN_RESET_MSK	BIT_U32(29)
> +#define JPEG_V420_RST_CMD_RESET_BYPASS_MSK		BIT_U32(31)
> +
> +#define JPEG_V420_CORE_CFG_FE_ENABLE_MSK	BIT_U32(0)
> +#define JPEG_V420_CORE_CFG_WE_ENABLE_MSK	BIT_U32(1)
> +#define JPEG_V420_CORE_CFG_ENC_ENABLE_MSK	BIT_U32(4)
> +#define JPEG_V420_CORE_CFG_SCALE_ENABLE_MSK	BIT_U32(7)
> +#define JPEG_V420_CORE_CFG_TESTBUS_ENABLE_MSK	BIT_U32(19)
> +#define JPEG_V420_CORE_CFG_MODE_MSK		BIT_U32(24)
> +#define JPEG_V420_CORE_CFG_CGC_DISABLE_MSK	BIT_U32(31)
> +
> +#define JPEG_V420_CMD_HW_START_MSK		BIT_U32(0)
> +#define JPEG_V420_CMD_HW_STOP_MSK		BIT_U32(1)
> +#define JPEG_V420_CMD_CLR_RD_PLN0_QUEUE_MSK	BIT_U32(4)
> +#define JPEG_V420_CMD_CLR_RD_PLN1_QUEUE_MSK	BIT_U32(5)
> +#define JPEG_V420_CMD_CLR_RD_PLN2_QUEUE_MSK	BIT_U32(6)
> +#define JPEG_V420_CMD_CLR_WR_PLN0_QUEUE_MSK	BIT_U32(8)
> +#define JPEG_V420_CMD_CLR_WR_PLN1_QUEUE_MSK	BIT_U32(9)
> +#define JPEG_V420_CMD_CLR_WR_PLN2_QUEUE_MSK	BIT_U32(10)
> +#define JPEG_V420_CMD_APPLY_SWC_RD_PARAMS_MSK	BIT_U32(11)
> +
> +#define JPEG_V420_CORE_STATE_STATUS_ENCODE_STATE_MSK	BIT_U32(0)
> +#define JPEG_V420_CORE_STATE_STATUS_SCALE_STATE_MSK	BIT_U32(2)
> +#define JPEG_V420_CORE_STATE_STATUS_REALTIME_STATE_MSK	BIT_U32(4)
> +#define JPEG_V420_CORE_STATE_STATUS_BUS_STATE_MSK	BIT_U32(8)
> +#define JPEG_V420_CORE_STATE_STATUS_CGC_STATE_MSK	BIT_U32(9)
> +
> +#define JPEG_V420_FE_CFG_BYTE_ORDERING_POS 0
> +#define JPEG_V420_FE_CFG_BYTE_ORDERING_MSK \
> +	(0xfu << JPEG_V420_FE_CFG_BYTE_ORDERING_POS)
> +
> +#define JPEG_V420_FE_CFG_BURST_LENGTH_MAX_POS 4
> +#define JPEG_V420_FE_CFG_BURST_LENGTH_MAX_MSK \
> +	(0xfu << JPEG_V420_FE_CFG_BURST_LENGTH_MAX_POS)
> +
> +#define JPEG_V420_FE_CFG_MEMORY_FORMAT_POS 8
> +#define JPEG_V420_FE_CFG_MEMORY_FORMAT_MSK \
> +	(0x3u << JPEG_V420_FE_CFG_MEMORY_FORMAT_POS)
> +
> +#define JPEG_V420_FE_CFG_CBCR_ORDER_MSK		BIT_U32(12)
> +#define JPEG_V420_FE_CFG_BOTTOM_VPAD_EN_MSK	BIT_U32(13)
> +#define JPEG_V420_FE_CFG_PLN0_EN_MSK		BIT_U32(16)
> +#define JPEG_V420_FE_CFG_PLN1_EN_MSK		BIT_U32(17)
> +#define JPEG_V420_FE_CFG_PLN2_EN_MSK		BIT_U32(18)
> +#define JPEG_V420_FE_CFG_SIXTEEN_MCU_EN_MSK	BIT_U32(21)
> +#define JPEG_V420_FE_CFG_MCUS_PER_BLOCK_MSK	BIT_U32(22)
> +#define JPEG_V420_FE_CFG_MAL_BOUNDARY_MSK	BIT_U32(24)
> +#define JPEG_V420_FE_CFG_MAL_EN_MSK		BIT_U32(27)
> +
> +#define JPEG_V420_PLN_RD_OFFS_OFFSET_POS 0
> +#define JPEG_V420_PLN_RD_OFFS_OFFSET_MSK \
> +	(0x1fffffffu << JPEG_V420_PLN_RD_OFFS_OFFSET_POS)
> +
> +#define JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_POS 0
> +#define JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK \
> +	(0xffffu << JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_POS)
> +
> +#define JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_POS 16
> +#define JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK \
> +	(0xffffu << JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_POS)
> +
> +#define JPEG_V420_PLN_RD_STRIDE_STRIDE_POS 0
> +#define JPEG_V420_PLN_RD_STRIDE_STRIDE_MSK \
> +	(0xffffu << JPEG_V420_PLN_RD_STRIDE_STRIDE_POS)
> +
> +#define JPEG_V420_PLN_RD_HINIT_FRACTIONAL_POS 0
> +#define JPEG_V420_PLN_RD_HINIT_FRACTIONAL_MSK \
> +	(0x1fffffu << JPEG_V420_PLN_RD_HINIT_FRACTIONAL_POS)
> +
> +#define JPEG_V420_PLN_RD_VINIT_FRACTIONAL_POS 0
> +#define JPEG_V420_PLN_RD_VINIT_FRACTIONAL_MSK \
> +	(0x1fffffu << JPEG_V420_PLN_RD_VINIT_FRACTIONAL_POS)
> +
> +#define JPEG_V420_WE_CFG_BYTE_ORDERING_POS 0
> +#define JPEG_V420_WE_CFG_BYTE_ORDERING_MSK \
> +	(0xfu << JPEG_V420_WE_CFG_BYTE_ORDERING_POS)
> +
> +#define JPEG_V420_WE_CFG_BURST_LENGTH_MAX_POS 4
> +#define JPEG_V420_WE_CFG_BURST_LENGTH_MAX_MSK \
> +	(0xfu << JPEG_V420_WE_CFG_BURST_LENGTH_MAX_POS)
> +
> +#define JPEG_V420_WE_CFG_MEMORY_FORMAT_POS 8
> +#define JPEG_V420_WE_CFG_MEMORY_FORMAT_MSK \
> +	(0x3u << JPEG_V420_WE_CFG_MEMORY_FORMAT_POS)
> +
> +#define JPEG_V420_WE_CFG_CBCR_ORDER_MSK		BIT_U32(12)
> +#define JPEG_V420_WE_CFG_PLN0_EN_MSK		BIT_U32(16)
> +#define JPEG_V420_WE_CFG_PLN1_EN_MSK		BIT_U32(17)
> +#define JPEG_V420_WE_CFG_PLN2_EN_MSK		BIT_U32(18)
> +#define JPEG_V420_WE_CFG_MAL_BOUNDARY_MSK	BIT_U32(24)
> +#define JPEG_V420_WE_CFG_MAL_EN_MSK		BIT_U32(27)
> +#define JPEG_V420_WE_CFG_POP_BUFF_ON_EOS_MSK	BIT_U32(28)
> +
> +#define JPEG_V420_PLN_WR_BUFF_SIZE_WIDTH_POS 0
> +#define JPEG_V420_PLN_WR_BUFF_SIZE_WIDTH_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_BUFF_SIZE_WIDTH_POS)
> +
> +#define JPEG_V420_PLN_WR_BUFF_SIZE_HEIGHT_POS 16
> +#define JPEG_V420_PLN_WR_BUFF_SIZE_HEIGHT_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_BUFF_SIZE_HEIGHT_POS)
> +
> +#define JPEG_V420_PLN_WR_STRIDE_STRIDE_POS 0
> +#define JPEG_V420_PLN_WR_STRIDE_STRIDE_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_STRIDE_STRIDE_POS)
> +
> +#define JPEG_V420_PLN_WR_HINIT_INTEGER_POS 0
> +#define JPEG_V420_PLN_WR_HINIT_INTEGER_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_HINIT_INTEGER_POS)
> +
> +#define JPEG_V420_PLN_WR_VINIT_INTEGER_POS 0
> +#define JPEG_V420_PLN_WR_VINIT_INTEGER_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_VINIT_INTEGER_POS)
> +
> +#define JPEG_V420_PLN_WR_HSTEP_INTEGER_POS 0
> +#define JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK \
> +	(0x1ffffu << JPEG_V420_PLN_WR_HSTEP_INTEGER_POS)
> +
> +#define JPEG_V420_PLN_WR_VSTEP_INTEGER_POS 0
> +#define JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK \
> +	(0x1ffffu << JPEG_V420_PLN_WR_VSTEP_INTEGER_POS)
> +
> +#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS 0
> +#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS)
> +
> +#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS 16
> +#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK \
> +	(0xffffu << JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS)
> +
> +#define JPEG_V420_ENC_CFG_IMAGE_FORMAT_POS 0
> +#define JPEG_V420_ENC_CFG_IMAGE_FORMAT_MSK \
> +	(0x7u << JPEG_V420_ENC_CFG_IMAGE_FORMAT_POS)
> +
> +#define JPEG_V420_ENC_CFG_APPLY_EOI_MSK		BIT_U32(7)
> +#define JPEG_V420_ENC_CFG_HUFFMAN_SEL_MSK	BIT_U32(8)
> +#define JPEG_V420_ENC_CFG_FSC_ENABLE_MSK	BIT_U32(11)
> +#define JPEG_V420_ENC_CFG_OUTPUT_DISABLE_MSK	BIT_U32(15)
> +#define JPEG_V420_ENC_CFG_RST_MARKER_PERIOD_MSK	BIT_U32(16)
> +
> +#define JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_POS 0u
> +#define JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_MSK \
> +	(0x1fffu << JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_POS)
> +
> +#define JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_POS 16u
> +#define JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK \
> +	(0x1fffu << JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_POS)
> +
> +#define JPEG_V420_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_POS 0
> +#define JPEG_V420_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_MSK \
> +	(0x1fffffffu << JPEG_V420_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_POS)
> +
> +#define JPEG_V420_SCALE_CFG_HSCALE_ENABLE_MSK		BIT_U32(4)
> +#define JPEG_V420_SCALE_CFG_VSCALE_ENABLE_MSK		BIT_U32(5)
> +#define JPEG_V420_SCALE_CFG_UPSAMPLE_EN_MSK		BIT_U32(6)
> +#define JPEG_V420_SCALE_CFG_SUBSAMPLE_EN_MSK		BIT_U32(7)
> +#define JPEG_V420_SCALE_CFG_HSCALE_ALGO_MSK		BIT_U32(8)
> +#define JPEG_V420_SCALE_CFG_VSCALE_ALGO_MSK		BIT_U32(9)
> +
> +#define JPEG_V420_SCALE_CFG_H_SCALE_FIR_ALGO_POS  12u
> +#define JPEG_V420_SCALE_CFG_H_SCALE_FIR_ALGO_MSK \
> +	(0x3u << JPEG_V420_SCALE_CFG_H_SCALE_FIR_ALGO_POS)
> +
> +#define JPEG_V420_SCALE_CFG_V_SCALE_FIR_ALGO_POS  16u
> +#define JPEG_V420_SCALE_CFG_V_SCALE_FIR_ALGO_MSK \
> +	(0x3u << JPEG_V420_SCALE_CFG_V_SCALE_FIR_ALGO_POS)
> +
> +#define JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_POS 0
> +#define JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_MSK \
> +	(0xffu << JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_POS)
> +
> +#define JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_POS 16
> +#define JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK \
> +	(0xfu << JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_POS)
> +
> +#define JPEG_V420_SCALE_PLN_HSTEP_FRACTIONAL_POS 0
> +#define JPEG_V420_SCALE_PLN_HSTEP_FRACTIONAL_MSK \
> +	(0x1fffffu << JPEG_V420_SCALE_PLN_HSTEP_FRACTIONAL_POS)
> +
> +#define JPEG_V420_SCALE_PLN_HSTEP_INTEGER_POS 21
> +#define JPEG_V420_SCALE_PLN_HSTEP_INTEGER_MSK \
> +	(0x3fu << JPEG_V420_SCALE_PLN_HSTEP_INTEGER_POS)
> +
> +#define JPEG_V420_SCALE_PLN_VSTEP_FRACTIONAL_POS 0
> +#define JPEG_V420_SCALE_PLN_VSTEP_FRACTIONAL_MSK \
> +	(0x1fffffu << JPEG_V420_SCALE_PLN_VSTEP_FRACTIONAL_POS)
> +
> +#define JPEG_V420_SCALE_PLN_VSTEP_INTEGER_POS 21
> +#define JPEG_V420_SCALE_PLN_VSTEP_INTEGER_MSK \
> +	(0x3fu << JPEG_V420_SCALE_PLN_VSTEP_INTEGER_POS)
> +
> +#define JPEG_V420_DMI_CFG_MEM_SEL_POS 0
> +#define JPEG_V420_DMI_CFG_MEM_SEL_MSK \
> +	(0x7u << JPEG_V420_DMI_CFG_MEM_SEL_POS)
> +
> +#define JPEG_V420_DMI_CFG_AUTO_INC_EN_MSK	BIT_U32(4)
> +
> +#define JPEG_V420_DMI_ADDR_ADDR_POS 0
> +#define JPEG_V420_DMI_ADDR_ADDR_MSK \
> +	(0x3ffu << JPEG_V420_DMI_ADDR_ADDR_POS)
> +
> +#define JPEG_V420_TESTBUS_CFG_BUS_SEL_POS 0
> +#define JPEG_V420_TESTBUS_CFG_BUS_SEL_MSK \
> +	(0x3fu << JPEG_V420_TESTBUS_CFG_BUS_SEL_POS)
> +
> +#define JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_POS 0
> +#define JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK \
> +	(0x1fffu << JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_POS)
> +
> +#define JPEG_V420_PLN_RD_HINIT_INT_INTEGER_POS 0
> +#define JPEG_V420_PLN_RD_HINIT_INT_INTEGER_MSK \
> +	(0x1ffffu << JPEG_V420_PLN_RD_HINIT_INT_INTEGER_POS)
> +
> +#define JPEG_V420_PLN_RD_VINIT_INT_INTEGER_POS 0
> +#define JPEG_V420_PLN_RD_VINIT_INT_INTEGER_MSK \
> +	(0x1ffffu << JPEG_V420_PLN_RD_VINIT_INT_INTEGER_POS)
> +
> +#define JPEG_V420_IRQ_STATUS_SESSION_DONE_MSK		BIT_U32(0)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK	BIT_U32(4)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK	BIT_U32(5)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK	BIT_U32(6)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	BIT_U32(7)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	BIT_U32(8)
> +#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK	BIT_U32(9)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	BIT_U32(10)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK	BIT_U32(11)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK	BIT_U32(12)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	BIT_U32(13)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	BIT_U32(14)
> +#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK	BIT_U32(15)
> +#define JPEG_V420_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	BIT_U32(19)
> +#define JPEG_V420_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	BIT_U32(20)
> +#define JPEG_V420_IRQ_STATUS_DCD_COEFF_ERROR_MSK	BIT_U32(21)
> +#define JPEG_V420_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	BIT_U32(22)
> +#define JPEG_V420_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	BIT_U32(23)
> +#define JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_MSK	BIT_U32(24)
> +#define JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	BIT_U32(25)
> +#define JPEG_V420_IRQ_STATUS_DCD_MISSING_RSM_MSK	BIT_U32(26)
> +#define JPEG_V420_IRQ_STATUS_STOP_ACK_MSK		BIT_U32(27)
> +#define JPEG_V420_IRQ_STATUS_RESET_ACK_MSK		BIT_U32(28)
> +
> +#define	JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_DONE_MSK \
> +	(JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK)
> +
> +#define	JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_DONE_MSK \
> +	(JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK)
> +
> +#define	JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_REQ_ATTN_MSK \
> +	(JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK)
> +
> +#define	JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_REQ_ATTN_MSK \
> +	(JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK)
> +
> +#define	JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK \
> +	(JPEG_V420_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_COEFF_ERROR_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_DCD_MISSING_RSM_MSK)
> +
> +#define JPEG_V420_IRQ_STATUS_ALL_BITS \
> +	(JPEG_V420_IRQ_STATUS_SESSION_DONE_MSK		| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_REQ_ATTN_MSK	| \
> +	 JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK		| \
> +	 JPEG_V420_IRQ_STATUS_STOP_ACK_MSK		| \
> +	 JPEG_V420_IRQ_STATUS_RESET_ACK_MSK)
> +
> +static const u32 qcom_jpeg_v420_hw_reg_mask[] = {
> +	[JMSK_HW_VER_STEP]	= JPEG_V420_HW_VER_STEP_MSK,
> +	[JMSK_HW_VER_MINOR]	= JPEG_V420_HW_VER_MINOR_MSK,
> +	[JMSK_HW_VER_MAJOR]	= JPEG_V420_HW_VER_MAJOR_MSK,
> +
> +	[JMSK_HW_CAP_ENCODE]	= JPEG_V420_HW_CAP_ENCODE_MSK,
> +	[JMSK_HW_CAP_DECODE]	= JPEG_V420_HW_CAP_DECODE_MSK,
> +	[JMSK_HW_CAP_UPSCALE]	= JPEG_V420_HW_CAP_UPSCALE_MSK,
> +	[JMSK_HW_CAP_DOWNSCALE]	= JPEG_V420_HW_CAP_DOWNSCALE_MSK,
> +
> +	[JMSK_RST_CMD_COMMON]	=
> +		(JPEG_V420_RST_CMD_FE_RESET_MSK			|
> +		 JPEG_V420_RST_CMD_WE_RESET_MSK			|
> +		 JPEG_V420_RST_CMD_ENCODER_RESET_MSK		|
> +		 JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST_MSK	|
> +		 JPEG_V420_RST_CMD_SCALE_RESET_MSK		|
> +		 JPEG_V420_RST_CMD_REGISTER_RESET_MSK		|
> +		 JPEG_V420_RST_CMD_MISR_RESET_MSK		|
> +		 JPEG_V420_RST_CMD_CORE_RESET_MSK		|
> +		 JPEG_V420_RST_CMD_JPEG_V420_DOMAIN_RESET_MSK),
> +
> +	[JMSK_RST_CMD_FE_RESET]			= JPEG_V420_RST_CMD_FE_RESET_MSK,
> +	[JMSK_RST_CMD_WE_RESET]			= JPEG_V420_RST_CMD_WE_RESET_MSK,
> +	[JMSK_RST_CMD_ENCODER_RESET]		= JPEG_V420_RST_CMD_ENCODER_RESET_MSK,
> +	[JMSK_RST_CMD_DECODER_RESET]		= JPEG_V420_RST_CMD_DECODER_RESET_MSK,
> +	[JMSK_RST_CMD_BLOCK_FORMATTER_RST]	= JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST_MSK,
> +	[JMSK_RST_CMD_SCALE_RESET]		= JPEG_V420_RST_CMD_SCALE_RESET_MSK,
> +	[JMSK_RST_CMD_REGISTER_RESET]		= JPEG_V420_RST_CMD_REGISTER_RESET_MSK,
> +	[JMSK_RST_CMD_MISR_RESET]		= JPEG_V420_RST_CMD_MISR_RESET_MSK,
> +	[JMSK_RST_CMD_CORE_RESET]		= JPEG_V420_RST_CMD_CORE_RESET_MSK,
> +	[JMSK_RST_CMD_JMSK_DOMAIN_RESET]	= JPEG_V420_RST_CMD_JPEG_V420_DOMAIN_RESET_MSK,
> +	[JMSK_RST_CMD_RESET_BYPASS]		= JPEG_V420_RST_CMD_RESET_BYPASS_MSK,
> +
> +	[JMSK_CORE_CFG_FE_ENABLE]		= JPEG_V420_CORE_CFG_FE_ENABLE_MSK,
> +	[JMSK_CORE_CFG_WE_ENABLE]		= JPEG_V420_CORE_CFG_WE_ENABLE_MSK,
> +	[JMSK_CORE_CFG_ENC_ENABLE]		= JPEG_V420_CORE_CFG_ENC_ENABLE_MSK,
> +	[JMSK_CORE_CFG_SCALE_ENABLE]		= JPEG_V420_CORE_CFG_SCALE_ENABLE_MSK,
> +	[JMSK_CORE_CFG_TESTBUS_ENABLE]		= JPEG_V420_CORE_CFG_TESTBUS_ENABLE_MSK,
> +	[JMSK_CORE_CFG_MODE]			= JPEG_V420_CORE_CFG_MODE_MSK,
> +	[JMSK_CORE_CFG_CGC_DISABLE]		= JPEG_V420_CORE_CFG_CGC_DISABLE_MSK,
> +
> +	[JMSK_CMD_HW_START]			= JPEG_V420_CMD_HW_START_MSK,
> +	[JMSK_CMD_HW_STOP]			= JPEG_V420_CMD_HW_STOP_MSK,
> +
> +	[JMSK_CMD_CLR_RD_PLNS_QUEUE]		=
> +		(JPEG_V420_CMD_CLR_RD_PLN0_QUEUE_MSK |
> +		 JPEG_V420_CMD_CLR_RD_PLN1_QUEUE_MSK |
> +		 JPEG_V420_CMD_CLR_RD_PLN2_QUEUE_MSK),
> +	[JMSK_CMD_CLR_WR_PLNS_QUEUE]		=
> +		(JPEG_V420_CMD_CLR_WR_PLN0_QUEUE_MSK |
> +		 JPEG_V420_CMD_CLR_WR_PLN1_QUEUE_MSK |
> +		 JPEG_V420_CMD_CLR_WR_PLN2_QUEUE_MSK),
> +
> +	[JMSK_CMD_APPLY_SWC_RD_PARAMS]	= JPEG_V420_CMD_APPLY_SWC_RD_PARAMS_MSK,
> +
> +	[JMSK_CORE_STATUS_ENCODE_STATE]	= JPEG_V420_CORE_STATE_STATUS_ENCODE_STATE_MSK,
> +	[JMSK_CORE_STATUS_SCALE_STATE]	= JPEG_V420_CORE_STATE_STATUS_SCALE_STATE_MSK,
> +	[JMSK_CORE_STATUS_RT_STATE]	= JPEG_V420_CORE_STATE_STATUS_REALTIME_STATE_MSK,
> +	[JMSK_CORE_STATUS_BUS_STATE]	= JPEG_V420_CORE_STATE_STATUS_BUS_STATE_MSK,
> +	[JMSK_CORE_STATUS_CGC_STATE]	= JPEG_V420_CORE_STATE_STATUS_CGC_STATE_MSK,
> +
> +	[JMSK_IRQ_STATUS_SESSION_DONE]	= JPEG_V420_IRQ_STATUS_SESSION_DONE_MSK,
> +
> +	[JMSK_IRQ_STATUS_RD_BUF_PLN0_DONE]	= JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK,
> +	[JMSK_IRQ_STATUS_RD_BUF_PLN1_DONE]	= JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK,
> +	[JMSK_IRQ_STATUS_RD_BUF_PLN2_DONE]	= JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK,
> +	[JMSK_IRQ_STATUS_RD_BUF_PLNS_ATTN]	= JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_REQ_ATTN_MSK,
> +
> +	[JMSK_IRQ_STATUS_WR_BUF_PLN0_DONE]	= JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK,
> +	[JMSK_IRQ_STATUS_WR_BUF_PLN1_DONE]	= JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK,
> +	[JMSK_IRQ_STATUS_WR_BUF_PLN2_DONE]	= JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK,
> +	[JMSK_IRQ_STATUS_WR_BUF_PLNS_ATTN]	= JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_REQ_ATTN_MSK,
> +
> +	[JMSK_IRQ_STATUS_SESSION_ERROR]	= JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK,
> +
> +	[JMSK_IRQ_STATUS_STOP_ACK]	= JPEG_V420_IRQ_STATUS_STOP_ACK_MSK,
> +	[JMSK_IRQ_STATUS_RESET_ACK]	= JPEG_V420_IRQ_STATUS_RESET_ACK_MSK,
> +
> +	[JMSK_IRQ_STATUS_ALL_BITS]	= JPEG_V420_IRQ_STATUS_ALL_BITS,
> +
> +	[JMSK_FE_CFG_BYTE_ORDERING]	= JPEG_V420_FE_CFG_BYTE_ORDERING_MSK,
> +	[JMSK_FE_CFG_BURST_LENGTH_MAX]	= JPEG_V420_FE_CFG_BURST_LENGTH_MAX_MSK,
> +	[JMSK_FE_CFG_MEMORY_FORMAT]	= JPEG_V420_FE_CFG_MEMORY_FORMAT_MSK,
> +	[JMSK_FE_CFG_CBCR_ORDER]	= JPEG_V420_FE_CFG_CBCR_ORDER_MSK,
> +	[JMSK_FE_CFG_BOTTOM_VPAD_EN]	= JPEG_V420_FE_CFG_BOTTOM_VPAD_EN_MSK,
> +	[JMSK_FE_CFG_PLN0_EN]		= JPEG_V420_FE_CFG_PLN0_EN_MSK,
> +	[JMSK_FE_CFG_PLN1_EN]		= JPEG_V420_FE_CFG_PLN1_EN_MSK,
> +	[JMSK_FE_CFG_PLN2_EN]		= JPEG_V420_FE_CFG_PLN2_EN_MSK,
> +	[JMSK_FE_CFG_SIXTEEN_MCU_EN]	= JPEG_V420_FE_CFG_SIXTEEN_MCU_EN_MSK,
> +	[JMSK_FE_CFG_MCUS_PER_BLOCK]	= JPEG_V420_FE_CFG_MCUS_PER_BLOCK_MSK,
> +	[JMSK_FE_CFG_MAL_BOUNDARY]	= JPEG_V420_FE_CFG_MAL_BOUNDARY_MSK,
> +	[JMSK_FE_CFG_MAL_EN]		= JPEG_V420_FE_CFG_MAL_EN_MSK,
> +
> +	[JMSK_FE_VBPAD_CFG_BLOCK_ROW]	= JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK,
> +
> +	[JMSK_PLNS_RD_OFFSET]		= JPEG_V420_PLN_RD_OFFS_OFFSET_MSK,
> +	[JMSK_PLNS_RD_BUF_SIZE_WIDTH]	= JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK,
> +	[JMSK_PLNS_RD_BUF_SIZE_HEIGHT]	= JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK,
> +	[JMSK_PLNS_RD_STRIDE]		= JPEG_V420_PLN_RD_STRIDE_STRIDE_MSK,
> +	[JMSK_PLNS_RD_HINIT]		= JPEG_V420_PLN_RD_HINIT_FRACTIONAL_MSK,
> +	[JMSK_PLNS_RD_VINIT]		= JPEG_V420_PLN_RD_VINIT_FRACTIONAL_MSK,
> +
> +	[JMSK_WE_CFG_BYTE_ORDERING]	= JPEG_V420_WE_CFG_BYTE_ORDERING_MSK,
> +	[JMSK_WE_CFG_BURST_LENGTH_MAX]	= JPEG_V420_WE_CFG_BURST_LENGTH_MAX_MSK,
> +	[JMSK_WE_CFG_MEMORY_FORMAT]	= JPEG_V420_WE_CFG_MEMORY_FORMAT_MSK,
> +	[JMSK_WE_CFG_CBCR_ORDER]	= JPEG_V420_WE_CFG_CBCR_ORDER_MSK,
> +	[JMSK_WE_CFG_PLN0_EN]		= JPEG_V420_WE_CFG_PLN0_EN_MSK,
> +	[JMSK_WE_CFG_PLN1_EN]		= JPEG_V420_WE_CFG_PLN1_EN_MSK,
> +	[JMSK_WE_CFG_PLN2_EN]		= JPEG_V420_WE_CFG_PLN2_EN_MSK,
> +	[JMSK_WE_CFG_MAL_BOUNDARY]	= JPEG_V420_WE_CFG_MAL_BOUNDARY_MSK,
> +	[JMSK_WE_CFG_MAL_EN]		= JPEG_V420_WE_CFG_MAL_EN_MSK,
> +	[JMSK_WE_CFG_POP_BUFF_ON_EOS]	= JPEG_V420_WE_CFG_POP_BUFF_ON_EOS_MSK,
> +
> +	[JMSK_PLNS_WR_BUF_SIZE_WIDTH]	= JPEG_V420_PLN_WR_BUFF_SIZE_WIDTH_MSK,
> +	[JMSK_PLNS_WR_BUF_SIZE_HEIGHT]	= JPEG_V420_PLN_WR_BUFF_SIZE_HEIGHT_MSK,
> +
> +	[JMSK_PLNS_WR_STRIDE]	= JPEG_V420_PLN_WR_STRIDE_STRIDE_MSK,
> +	[JMSK_PLNS_WR_HINIT]	= JPEG_V420_PLN_WR_HINIT_INTEGER_MSK,
> +	[JMSK_PLNS_WR_VINIT]	= JPEG_V420_PLN_WR_VINIT_INTEGER_MSK,
> +	[JMSK_PLNS_WR_HSTEP]	= JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK,
> +	[JMSK_PLNS_WR_VSTEP]	= JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK,
> +
> +	[JMSK_PLNS_WR_BLOCK_CFG_PER_COL]	= JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK,
> +	[JMSK_PLNS_WR_BLOCK_CFG_PER_RAW]	= JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK,
> +
> +	[JMSK_SCALE_CFG_HSCALE_ENABLE]		= JPEG_V420_SCALE_CFG_HSCALE_ENABLE_MSK,
> +	[JMSK_SCALE_CFG_VSCALE_ENABLE]		= JPEG_V420_SCALE_CFG_VSCALE_ENABLE_MSK,
> +	[JMSK_SCALE_CFG_UPSAMPLE_EN]		= JPEG_V420_SCALE_CFG_UPSAMPLE_EN_MSK,
> +	[JMSK_SCALE_CFG_SUBSAMPLE_EN]		= JPEG_V420_SCALE_CFG_SUBSAMPLE_EN_MSK,
> +	[JMSK_SCALE_CFG_HSCALE_ALGO]		= JPEG_V420_SCALE_CFG_HSCALE_ALGO_MSK,
> +	[JMSK_SCALE_CFG_VSCALE_ALGO]		= JPEG_V420_SCALE_CFG_VSCALE_ALGO_MSK,
> +	[JMSK_SCALE_CFG_H_SCALE_FIR_ALGO]	= JPEG_V420_SCALE_CFG_H_SCALE_FIR_ALGO_MSK,
> +	[JMSK_SCALE_CFG_V_SCALE_FIR_ALGO]	= JPEG_V420_SCALE_CFG_V_SCALE_FIR_ALGO_MSK,
> +
> +	[JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH]	= JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_MSK,
> +	[JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT]	= JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK,
> +
> +	[JMSK_SCALE_PLNS_HSTEP_FRACTIONAL]	= JPEG_V420_SCALE_PLN_HSTEP_FRACTIONAL_MSK,
> +	[JMSK_SCALE_PLNS_HSTEP_INTEGER]		= JPEG_V420_SCALE_PLN_HSTEP_INTEGER_MSK,
> +	[JMSK_SCALE_PLNS_VSTEP_FRACTIONAL]	= JPEG_V420_SCALE_PLN_VSTEP_FRACTIONAL_MSK,
> +	[JMSK_SCALE_PLNS_VSTEP_INTEGER]		= JPEG_V420_SCALE_PLN_VSTEP_INTEGER_MSK,
> +
> +	[JMSK_ENC_CFG_IMAGE_FORMAT]		= JPEG_V420_ENC_CFG_IMAGE_FORMAT_MSK,
> +	[JMSK_ENC_CFG_APPLY_EOI]		= JPEG_V420_ENC_CFG_APPLY_EOI_MSK,
> +	[JMSK_ENC_CFG_HUFFMAN_SEL]		= JPEG_V420_ENC_CFG_HUFFMAN_SEL_MSK,
> +	[JMSK_ENC_CFG_FSC_ENABLE]		= JPEG_V420_ENC_CFG_FSC_ENABLE_MSK,
> +	[JMSK_ENC_CFG_OUTPUT_DISABLE]		= JPEG_V420_ENC_CFG_OUTPUT_DISABLE_MSK,
> +	[JMSK_ENC_CFG_RST_MARKER_PERIOD]	= JPEG_V420_ENC_CFG_RST_MARKER_PERIOD_MSK,
> +	[JMSK_ENC_IMAGE_SIZE_WIDTH]		= JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_MSK,
> +	[JMSK_ENC_IMAGE_SIZE_HEIGHT]		= JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK,
> +};
> +
> +static const struct qcom_jpeg_reg_offs qcom_jpeg_v420_hw_reg_offs = {
> +	.hw_version	= 0x000,
> +	.hw_capability	= 0x004,
> +	.reset_cmd	= 0x008,
> +	.core_cfg	= 0x00c,
> +	.hw_cmd		= 0x010,
> +	.int_mask	= 0x018,
> +	.int_clr	= 0x01c,
> +	.int_status	= 0x020,
> +	.enc_core_state = 0x014,
> +
> +	.fe = {
> +		.pntr	= { 0x038, 0x044, 0x050 },
> +		.offs	= { 0x03c, 0x048, 0x054 },
> +		.bsize	= { 0x060, 0x068, 0x070 },
> +		.stride	= { 0x064, 0x06c, 0x08c },
> +		.hinit	= { 0x074, 0x078, 0x07c },
> +		.vinit	= { 0x080, 0x084, 0x088 },
> +		.pntr_cnt	= 0x05c,
> +		.vbpad_cfg	= 0x2e8
> +	},
> +	.fe_cfg	= 0x024,
> +
> +	.we = {
> +		.pntr	= { 0x0cc, 0x0d0, 0x0d4 },
> +		.bsize	= { 0x0e8, 0x0ec, 0x0f0 },
> +		.stride	= { 0x0f4, 0x0f8, 0x0fc },
> +		.hinit	= { 0x100, 0x104, 0x108 },
> +		.hstep	= { 0x118, 0x11c, 0x120 },
> +		.vinit	= { 0x10c, 0x110, 0x114 },
> +		.vstep	= { 0x124, 0x128, 0x12c },
> +		.blocks	= { 0x130, 0x134, 0x138 },
> +		.pntr_cnt = 0x0e4
> +	},
> +	.we_cfg	= 0x0c0,
> +
> +	.scale = {
> +		.hstep	= { 0x27c, 0x280, 0x284 },
> +		.vstep	= { 0x28c, 0x290, 0x294 },
> +	},
> +	.scale_cfg	= 0x26c,
> +	.scale_out_cfg	= { 0x270, 0x274, 0x278 },
> +
> +	.enc_cfg	= 0x13c,
> +	.enc_img_size	= 0x140,
> +	.enc_out_size	= 0x180,
> +
> +	.dmi_cfg	= 0x298,
> +	.dmi_data	= 0x2a0,
> +	.dmi_addr	= 0x29c,
> +};
> +
> +#endif /* QCOM_JENC_V420_HW_INFO_H */
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> new file mode 100644
> index 000000000000..20f698f77acf
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> @@ -0,0 +1,1150 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/videodev2.h>
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "qcom_jenc_defs.h"
> +#include "qcom_jenc_dev.h"
> +#include "qcom_jenc_ops.h"
> +#include "qcom_jenc_v4l2.h"
> +
> +static const struct v4l2_frmsizeenum jpeg_def_frmsize = {
> +	.stepwise = {
> +		.min_width	= QCOM_JPEG_HW_MIN_WIDTH,
> +		.max_width	= QCOM_JPEG_HW_MAX_WIDTH,
> +		.step_width	= QCOM_JPEG_HW_DEF_HSTEP,
> +		.min_height	= QCOM_JPEG_HW_MIN_HEIGHT,
> +		.max_height	= QCOM_JPEG_HW_MAX_HEIGHT,
> +		.step_height	= QCOM_JPEG_HW_DEF_VSTEP,
> +	},
> +	.type = V4L2_FRMSIZE_TYPE_STEPWISE
> +};
> +
> +static const struct jenc_enc_format jpeg_src_formats[] = {
> +	{
> +		.fourcc	= V4L2_PIX_FMT_NV12M,
> +		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	{
> +		.fourcc	= V4L2_PIX_FMT_NV21M,
> +		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	{
> +		.fourcc	= V4L2_PIX_FMT_GREY,
> +		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
> +#define JPEG_SRC_FMT_COUNT ARRAY_SIZE(jpeg_src_formats)
> +
> +static const struct jenc_enc_format jpeg_dst_formats[] = {
> +	{
> +		.fourcc	= V4L2_PIX_FMT_JPEG,
> +		.type	= V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +	}
> +};
> +
> +#define JPEG_DST_FMT_COUNT ARRAY_SIZE(jpeg_dst_formats)
> +
> +static inline struct jenc_context *jpeg_file2ctx(struct file *file)
> +{
> +	return container_of(file_to_v4l2_fh(file), struct jenc_context, fh);
> +}
> +
> +static struct qcom_jenc_queue *jpeg_get_bufq(struct jenc_context *ectx, enum qcom_enc_qid id)
> +{
> +	return &ectx->bufq[id];
> +}
> +
> +static bool jpeg_v4l2_queues_busy(struct jenc_context *ctx)
> +{
> +	struct vb2_queue *out_q;
> +	struct vb2_queue *cap_q;
> +
> +	out_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +
> +	cap_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +
> +	return vb2_is_busy(out_q) || vb2_is_busy(cap_q);
> +}
> +
> +static bool jpeg_is_invalid_src(struct jenc_context *ectx, u32 type)
> +{
> +	bool is_invalid = (type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +
> +	if (is_invalid)
> +		dev_dbg(ectx->dev, "invalid src type or format\n");
> +
> +	return is_invalid;
> +}
> +
> +static bool jpeg_is_invalid_dst(struct jenc_context *ectx, u32 type)
> +{
> +	bool is_invalid = (type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +
> +	if (is_invalid)
> +		dev_dbg(ectx->dev, "invalid dst type or format\n");
> +
> +	return is_invalid;
> +}
> +
> +static const struct jenc_enc_format *jpeg_find_pix_format(enum qcom_enc_qid id, u32 fourcc)
> +{
> +	const struct jenc_enc_format *efmt;
> +	unsigned int i, count;
> +
> +	if (id == JENC_SRC_QUEUE) {
> +		count = JPEG_SRC_FMT_COUNT;
> +		efmt = &jpeg_src_formats[0];
> +	} else {
> +		count = JPEG_DST_FMT_COUNT;
> +		efmt = &jpeg_dst_formats[0];
> +	}
> +
> +	for (i = 0; i < count; i++) {
> +		if (efmt[i].fourcc == fourcc)
> +			return &efmt[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static const struct jenc_enc_format *jpeg_get_format(struct jenc_context *ectx,
> +						     enum qcom_enc_qid qid, u32 pixelformat)
> +{
> +	const struct jenc_enc_format *efmt = jpeg_find_pix_format(qid, pixelformat);
> +
> +	if (!efmt)
> +		efmt = (qid == JENC_SRC_QUEUE) ? &jpeg_src_formats[0] : &jpeg_dst_formats[0];
> +
> +	return efmt;
> +}
> +
> +static int jpeg_update_src_planes(const struct jenc_enc_format *ef, struct v4l2_format *v4f)
> +{
> +	const struct v4l2_format_info *info = v4l2_format_info(ef->fourcc);
> +	struct v4l2_pix_format_mplane *f = &v4f->fmt.pix_mp;
> +	int rc;
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	f->pixelformat = ef->fourcc;
> +
> +	f->field	= V4L2_FIELD_NONE;
> +	f->colorspace	= V4L2_COLORSPACE_SRGB;
> +	f->xfer_func	= V4L2_MAP_XFER_FUNC_DEFAULT(f->colorspace);
> +	f->ycbcr_enc	= V4L2_MAP_YCBCR_ENC_DEFAULT(f->colorspace);
> +	f->quantization =
> +		V4L2_MAP_QUANTIZATION_DEFAULT(f->ycbcr_enc == V4L2_YCBCR_ENC_601,
> +					      f->colorspace, f->ycbcr_enc);
> +
> +	v4l2_apply_frmsize_constraints(&f->width, &f->height, &jpeg_def_frmsize.stepwise);
> +
> +	rc = v4l2_fill_pixfmt_mp(f, ef->fourcc, f->width, f->height);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +static void jpeg_update_dst_plane(const struct jenc_enc_format *ef, struct v4l2_format *v4f)
> +{
> +	struct v4l2_pix_format_mplane *f = &v4f->fmt.pix_mp;
> +	u32 nbx, nby;
> +	u64 size;
> +
> +	f->pixelformat  = ef->fourcc;
> +	f->field	= V4L2_FIELD_NONE;
> +	f->colorspace	= V4L2_COLORSPACE_SRGB;
> +	f->xfer_func	= V4L2_MAP_XFER_FUNC_DEFAULT(f->colorspace);
> +	f->ycbcr_enc	= V4L2_MAP_YCBCR_ENC_DEFAULT(f->colorspace);
> +	f->quantization =
> +		V4L2_MAP_QUANTIZATION_DEFAULT(f->ycbcr_enc == V4L2_YCBCR_ENC_601,
> +					      f->colorspace, f->ycbcr_enc);
> +
> +	v4l2_apply_frmsize_constraints(&f->width, &f->height, &jpeg_def_frmsize.stepwise);
> +
> +	/*
> +	 * JPEG is a variable-size format. The output size cannot be derived
> +	 * from bits per point or line stride.
> +	 *
> +	 * Provide a conservative upper bound based on worst-case entropy
> +	 * coding of 8x8 DCT blocks:
> +	 *
> +	 * - Each 8x8 block has 64 coefficients (1 DC + 63 AC).
> +	 * - In worst-case (high-entropy input, low quantization), all
> +	 *   coefficients may be non-zero.
> +	 * - Huffman coding then emits (code + magnitude bits) per coefficient,
> +	 *   which can approach ~2 bytes per coefficient in the worst case.
> +	 *
> +	 * => Worst-case is 64 coefficients * 2 bytes = 128 bytes per 8x8 block
> +	 * => approximately 2 bytes per point
> +	 *
> +	 * This bound implicitly covers byte stuffing (0xFF escaping) and is
> +	 * conservative with respect to subsampled formats (e.g. 4:2:0).
> +	 *
> +	 * Additional margin is added for headers and alignment.
> +	 *
> +	 * Note: This is a conservative upper bound, not an exact size.
> +	 */
> +
> +	nbx = DIV_ROUND_UP(f->width,  8);
> +	nby = DIV_ROUND_UP(f->height, 8);
> +
> +	size = nbx * nby * 128;
> +	size += JPEG_HEADER_MAX; /* JPEG header written by CPU before HW DMA */
> +	size += SZ_4K;           /* safety margin and alignment */
> +
> +	f->plane_fmt[0].bytesperline = 0;
> +	f->plane_fmt[0].sizeimage    = ALIGN(size, SZ_4K);
> +}
> +
> +static int jpeg_enum_fmt_src(struct v4l2_fmtdesc *f)
> +{
> +	if (f->index >= JPEG_SRC_FMT_COUNT)
> +		return -EINVAL;
> +
> +	f->pixelformat = jpeg_src_formats[f->index].fourcc;
> +
> +	return 0;
> +}
> +
> +static int jpeg_enum_fmt_dst(struct v4l2_fmtdesc *f)
> +{
> +	if (f->index >= JPEG_DST_FMT_COUNT)
> +		return -EINVAL;
> +
> +	f->pixelformat = jpeg_dst_formats[f->index].fourcc;
> +
> +	return 0;
> +}
> +
> +static int jpeg_v4l2_try_format(struct jenc_context *ectx, struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pm = &f->fmt.pix_mp;
> +	const struct jenc_enc_format *ef;
> +	int rc;
> +
> +	/* The function always returns valid driver format */
> +	ef = jpeg_get_format(ectx, TYPE2QID(f->type), pm->pixelformat);
> +
> +	dev_dbg(ectx->dev, "type=%d %p4cc\n",
> +		TYPE2QID(f->type), &ef->fourcc);
> +
> +	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> +		f->fmt.pix_mp.num_planes = 1;
> +
> +		jpeg_update_dst_plane(ef, f);
> +
> +		dev_dbg(ectx->dev, "\tImage: %dx%d Size:%9d\n", f->fmt.pix_mp.width,
> +			f->fmt.pix_mp.height, f->fmt.pix_mp.plane_fmt[0].sizeimage);
> +	} else {
> +		const struct v4l2_format_info *info = v4l2_format_info(ef->fourcc);
> +		u8 pln = 0;
> +
> +		if (!info)
> +			return -EINVAL;
> +
> +		f->fmt.pix_mp.num_planes = info->comp_planes;
> +
> +		rc = jpeg_update_src_planes(ef, f);
> +		if (rc)
> +			return rc;
> +
> +		for (pln = 0; pln < f->fmt.pix_mp.num_planes; pln++)
> +			dev_dbg(ectx->dev, "\tImage: %dx%d BPL:%5d Size:%9d\n",
> +				pm->width, pm->height, pm->plane_fmt[pln].bytesperline,
> +				pm->plane_fmt[pln].sizeimage);
> +	}
> +
> +	return 0;
> +}
> +
> +static int jpeg_v4l2_set_defaults(struct jenc_context *ectx)
> +{
> +	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
> +	struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
> +	struct v4l2_format f = {0};
> +	int rc;
> +
> +	f.type			 = jpeg_src_formats->type;
> +	f.fmt.pix_mp.pixelformat = jpeg_src_formats->fourcc;
> +	f.fmt.pix_mp.width	 = QCOM_JPEG_HW_DEF_WIDTH;
> +	f.fmt.pix_mp.height	 = QCOM_JPEG_HW_DEF_HEIGHT;
> +
> +	rc = jpeg_v4l2_try_format(ectx, &f);
> +	if (rc)
> +		return rc;
> +
> +	sq->vf = f.fmt.pix_mp;
> +
> +	f.type			 = jpeg_dst_formats->type;
> +	f.fmt.pix_mp.pixelformat = jpeg_dst_formats->fourcc;
> +	f.fmt.pix_mp.width	 = QCOM_JPEG_HW_DEF_WIDTH;
> +	f.fmt.pix_mp.height	 = QCOM_JPEG_HW_DEF_HEIGHT;
> +
> +	rc = jpeg_v4l2_try_format(ectx, &f);
> +	if (rc)
> +		return rc;
> +
> +	dq->vf = f.fmt.pix_mp;
> +
> +	return 0;
> +}
> +
> +static int jpeg_v4l2_set_format(struct jenc_context *ectx, struct v4l2_format *f)
> +{
> +	const struct qcom_jpeg_hw_ops *hw = ectx->jenc->res->hw_ops;
> +	struct qcom_jenc_queue *q = jpeg_get_bufq(ectx, TYPE2QID(f->type));
> +	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
> +	struct v4l2_pix_format_mplane *pm = &f->fmt.pix_mp;
> +	u32 old_src_fourcc = sq->vf.pixelformat;
> +	int rc;
> +
> +	if (jpeg_v4l2_queues_busy(ectx))
> +		return -EBUSY;
> +
> +	if (!v4l2_m2m_get_vq(ectx->fh.m2m_ctx, f->type)) {
> +		dev_err(ectx->dev, "cannot get video queue\n");
> +		return -EINVAL;
> +	}
> +
> +	rc = jpeg_v4l2_try_format(ectx, f);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * Because scaling is not supported, source and destination image
> +	 * sizes must be equal.
> +	 */
> +	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> +		/* Adjust source size to match capture size */
> +		if (pm->width != sq->vf.width || pm->height != sq->vf.height) {
> +			struct v4l2_format nf = {0};
> +
> +			nf.type			  = jpeg_src_formats->type;
> +			nf.fmt.pix_mp.pixelformat = sq->vf.pixelformat;
> +			nf.fmt.pix_mp.width	  = pm->width;
> +			nf.fmt.pix_mp.height	  = pm->height;
> +
> +			rc = jpeg_v4l2_try_format(ectx, &nf);
> +			if (rc)
> +				return rc;
> +
> +			sq->vf = nf.fmt.pix_mp;
> +		}
> +
> +	} else {
> +		struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
> +		struct v4l2_format nf = {0};
> +
> +		/* Adjust destination size to match source size */
> +		if (pm->width != dq->vf.width || pm->height != dq->vf.height) {
> +			nf.type			  = jpeg_dst_formats->type;
> +			nf.fmt.pix_mp.pixelformat = dq->vf.pixelformat;
> +			nf.fmt.pix_mp.width	  = pm->width;
> +			nf.fmt.pix_mp.height	  = pm->height;
> +
> +			rc = jpeg_v4l2_try_format(ectx, &nf);
> +			if (rc)
> +				return rc;
> +
> +			dq->vf = nf.fmt.pix_mp;
> +
> +			/*
> +			 * The horizontal alignment of the destination is larger, and the
> +			 * result after adjustment may still differ. In this case, the
> +			 * requested image size should also be modified.
> +			 */
> +			if (pm->width != nf.fmt.pix_mp.width ||
> +			    pm->height != nf.fmt.pix_mp.height) {
> +				pm->width  = nf.fmt.pix_mp.width;
> +				pm->height = nf.fmt.pix_mp.height;
> +			}
> +		}
> +	}
> +
> +	q->vf = *pm;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(f->type) && hw->src_fmt_update) {
> +		rc = hw->src_fmt_update(ectx, old_src_fourcc, q->vf.pixelformat);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static void jpeg_v4l2_get_format(struct jenc_context *ectx, struct v4l2_format *f)
> +{
> +	struct qcom_jenc_queue *q = jpeg_get_bufq(ectx, TYPE2QID(f->type));
> +
> +	f->fmt.pix_mp = q->vf;
> +}
> +
> +static void jpeg_v4l2_work_stop(struct jenc_context *ctx, enum vb2_buffer_state buff_state);
> +
> +static void jpeg_finish_work(struct work_struct *work)
> +{
> +	struct jenc_context *ctx = container_of(work, struct jenc_context, finish_work);
> +
> +	v4l2_m2m_job_finish(ctx->jenc->m2m_dev, ctx->fh.m2m_ctx);
> +}
> +
> +static void jpeg_stop_work(struct work_struct *work)
> +{
> +	struct jenc_context *ctx = container_of(work, struct jenc_context, stop_work);
> +	struct qcom_jenc_dev *jenc = ctx->jenc;
> +
> +	mutex_lock(&jenc->dev_mutex);
> +	jpeg_v4l2_work_stop(ctx, VB2_BUF_STATE_ERROR);
> +	mutex_unlock(&jenc->dev_mutex);
> +}
> +
> +static void jpeg_v4l2_work_done(struct jenc_context *ctx, size_t out_size)
> +{
> +	struct vb2_v4l2_buffer *vb;
> +
> +	vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	if (vb)
> +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
> +
> +	vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	if (vb) {
> +		vb2_set_plane_payload(&vb->vb2_buf, 0, out_size);
> +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
> +	}
> +
> +	schedule_work(&ctx->finish_work);
> +}
> +
> +static void jpeg_v4l2_work_stop(struct jenc_context *ctx, enum vb2_buffer_state buff_state)
> +{
> +	bool was_stopping = ctx->is_stopping;
> +	struct vb2_v4l2_buffer *vb;
> +
> +	ctx->is_stopping = false;
> +
> +	/* Drain CAPTURE queue; signal EOS on last buffer if V4L2_ENC_CMD_STOP. */
> +	while ((vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx))) {
> +		if (was_stopping && !v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx)) {
> +			vb2_set_plane_payload(&vb->vb2_buf, 0, 0);
> +			v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vb);
> +		} else {
> +			v4l2_m2m_buf_done(vb, buff_state);
> +		}
> +	}
> +
> +	while ((vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
> +		v4l2_m2m_buf_done(vb, buff_state);
> +
> +	/* Always call job_finish to let m2m schedule the next job. */
> +	schedule_work(&ctx->finish_work);
> +}
> +
> +static void jpeg_v4l2_process_cb(void *priv, enum vb2_buffer_state ev, size_t out_size)
> +{
> +	struct jenc_context *ctx = priv;
> +	struct qcom_jenc_dev *jenc = ctx->jenc;
> +
> +	/* threaded IRQ path */
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	if (ev == VB2_BUF_STATE_DONE && out_size)
> +		jpeg_v4l2_work_done(ctx, out_size);
> +	else
> +		jpeg_v4l2_work_stop(ctx, ev);
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +}
> +
> +static int jpeg_v4l2_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct jenc_context *ectx = container_of(ctrl->handler, struct jenc_context, ctrl_hdl);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
> +		mutex_lock(&ectx->quality_mutex);
> +		ectx->quality_requested = ctrl->val;
> +		mutex_unlock(&ectx->quality_mutex);
> +		break;
> +	case V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO:
> +		/* value is read via v4l2_ctrl_g_ctrl() in jpeg_select_perf_level() */
> +		break;
> +	case V4L2_CID_QCOM_JPEG_FPS_TARGET:
> +		/* value is read via v4l2_ctrl_g_ctrl() in jpeg_select_perf_level() */
> +		break;
> +	default:
> +		dev_err(ectx->dev, "invalid control id=%#x\n", ctrl->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops qcom_jpeg_v4l2_ctrl_ops = {
> +	.s_ctrl = jpeg_v4l2_s_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config qcom_jpeg_perf_level_auto_cfg = {
> +	.ops	= &qcom_jpeg_v4l2_ctrl_ops,
> +	.id	= V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO,
> +	.name	= "perf_level_auto",
> +	.type	= V4L2_CTRL_TYPE_BOOLEAN,
> +	.min	= 0,
> +	.max	= 1,
> +	.step	= 1,
> +	.def	= 0,
> +};
> +
> +static const struct v4l2_ctrl_config qcom_jpeg_fps_target_cfg = {
> +	.ops	= &qcom_jpeg_v4l2_ctrl_ops,
> +	.id	= V4L2_CID_QCOM_JPEG_FPS_TARGET,
> +	.name	= "fps_target",
> +	.type	= V4L2_CTRL_TYPE_INTEGER,
> +	.min	= QCOM_JPEG_FPS_MIN,
> +	.max	= QCOM_JPEG_FPS_MAX,
> +	.step	= QCOM_JPEG_FPS_UNT,
> +	.def	= QCOM_JPEG_FPS_DEF,
> +};
> +
> +static int bop_jpeg_vb2_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> +				    unsigned int *plns_per_buff, unsigned int sizes[],
> +				    struct device *alloc_devs[])
> +{
> +	struct jenc_context *ectx = vb2_get_drv_priv(vq);
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
> +	struct qcom_jenc_queue *q;
> +	int pln;
> +
> +	q = hw->get_queue(ectx, TYPE2QID(vq->type));
> +	if (!q || !q->vf.num_planes)
> +		return -EINVAL;
> +
> +	if (*plns_per_buff) {
> +		if (*plns_per_buff != q->vf.num_planes)
> +			return -EINVAL;
> +
> +		for (pln = 0; pln < q->vf.num_planes; ++pln) {
> +			if (sizes[pln] < q->vf.plane_fmt[pln].sizeimage)
> +				return -EINVAL;
> +		}
> +
> +		return 0;
> +	}
> +
> +	*plns_per_buff = q->vf.num_planes;
> +	for (pln = 0; pln < q->vf.num_planes; ++pln) {
> +		sizes[pln] = q->vf.plane_fmt[pln].sizeimage;
> +		dev_dbg(ectx->dev, "queue=%d size[%d]=%d\n", TYPE2QID(vq->type),
> +			pln, sizes[pln]);
> +	}
> +
> +	return hw->queue_setup(ectx, TYPE2QID(vq->type));
> +}
> +
> +static int bop_jpeg_vb2_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	if (vbuf->field == V4L2_FIELD_ANY)
> +		vbuf->field = V4L2_FIELD_NONE;
> +
> +	if (vbuf->field != V4L2_FIELD_NONE)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int bop_jpeg_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct jenc_context *ectx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
> +	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb->type)];
> +	int pln;
> +	int rc;
> +
> +	if (vb->num_planes != q->vf.num_planes)
> +		return -EINVAL;
> +
> +	for (pln = 0; pln < q->vf.num_planes; pln++) {
> +		if (q->vf.plane_fmt[pln].sizeimage == 0)
> +			return -EINVAL;
> +
> +		if (vb2_plane_size(vb, pln) < q->vf.plane_fmt[pln].sizeimage)
> +			return -EINVAL;
> +	}
> +
> +	rc = hw->buf_prepare(ectx, vb);
> +	if (rc) {
> +		dev_err_ratelimited(ectx->dev, "buffer prepare failed\n");
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static void bop_jpeg_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct jenc_context *ectx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	v4l2_m2m_buf_queue(ectx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int bop_jpeg_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct jenc_context *ectx = vb2_get_drv_priv(q);
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
> +	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
> +	struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
> +	u32 hw_caps;
> +	u8 pln;
> +	int rc;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		dev_dbg(ectx->dev, "%p4cc %dx%d\n",
> +			&sq->vf.pixelformat, sq->vf.width, sq->vf.height);
> +
> +		for (pln = 0; pln < sq->vf.num_planes; pln++) {
> +			dev_dbg(ectx->dev, "\tpln=%d %dx%d bpl:%d size:%d\n", pln,
> +				sq->vf.width, sq->vf.height,
> +				sq->vf.plane_fmt[pln].bytesperline,
> +				sq->vf.plane_fmt[pln].sizeimage);
> +		}
> +	} else {
> +		dev_dbg(ectx->dev, "%p4cc %dx%d\n",
> +			&dq->vf.pixelformat,
> +			dq->vf.width, dq->vf.height);
> +	}
> +
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	/*
> +	 * Header cache is initialized lazily on CAPTURE QBUF, so valid V4L2
> +	 * orders like STREAMON before first QBUF still get a proper JPEG header.
> +	 */
> +	if (!ectx->hw_acquired) {
> +		rc = hw->hw_acquire(ectx, q);
> +		if (!rc) {
> +			ectx->hw_acquired = true;
> +			hw->hw_get_cap(jenc, &hw_caps);
> +			dev_dbg(ectx->dev, "hw_caps=0x%x\n", hw_caps);
> +		}
> +	} else {
> +		rc = 0;
> +	}
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +
> +	return rc;
> +}
> +
> +static void bop_jpeg_vb2_stop_streaming(struct vb2_queue *q)
> +{
> +	struct jenc_context *ectx = vb2_get_drv_priv(q);
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
> +
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
> +
> +	if (ectx->hw_acquired) {
> +		hw->hw_release(ectx, q);
> +		ectx->hw_acquired = false;
> +	}
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +}
> +
> +static const struct vb2_ops qcom_jpeg_v4l2_vb2_ops = {
> +	.queue_setup		= bop_jpeg_vb2_queue_setup,
> +	.buf_out_validate	= bop_jpeg_vb2_buf_out_validate,
> +	.buf_prepare		= bop_jpeg_vb2_buf_prepare,
> +	.buf_queue		= bop_jpeg_vb2_buf_queue,
> +	.start_streaming	= bop_jpeg_vb2_start_streaming,
> +	.stop_streaming		= bop_jpeg_vb2_stop_streaming,
> +};
> +
> +static void mop_jpeg_m2m_job_abort(void *priv)
> +{
> +	struct jenc_context *ectx = priv;
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +}
> +
> +static void mop_jpeg_m2m_job_run(void *priv)
> +{
> +	struct jenc_context *ectx = priv;
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
> +	struct vb2_v4l2_buffer *src_vb, *dst_vb;
> +	struct qcom_jenc_queue *sq, *dq;
> +
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	src_vb = v4l2_m2m_next_src_buf(ectx->fh.m2m_ctx);
> +	dst_vb = v4l2_m2m_next_dst_buf(ectx->fh.m2m_ctx);
> +
> +	if (!src_vb || !dst_vb)
> +		goto err_stop;
> +
> +	if (hw->hw_prepare(jenc))
> +		goto err_stop;
> +
> +	sq = hw->get_queue(ectx, TYPE2QID(src_vb->vb2_buf.type));
> +	src_vb->sequence = sq->sequence++;
> +	if (hw->process_exec(jenc, ectx, &src_vb->vb2_buf))
> +		goto err_stop;
> +
> +	dq = hw->get_queue(ectx, TYPE2QID(dst_vb->vb2_buf.type));
> +	dst_vb->sequence = dq->sequence++;
> +	if (hw->process_exec(jenc, ectx, &dst_vb->vb2_buf))
> +		goto err_stop;
> +
> +	v4l2_m2m_buf_copy_metadata(src_vb, dst_vb);
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +	return;
> +
> +err_stop:
> +	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
> +	mutex_unlock(&jenc->dev_mutex);
> +}
> +
> +static const struct v4l2_m2m_ops qcom_jpeg_v4l2_m2m_ops = {
> +	.device_run	= mop_jpeg_m2m_job_run,
> +	.job_abort	= mop_jpeg_m2m_job_abort,
> +};
> +
> +static int iop_jpeg_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, QCOM_JPEG_ENC_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, QCOM_JPEG_ENC_NAME, sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s", QCOM_JPEG_ENC_NAME);
> +
> +	return 0;
> +}
> +
> +static int iop_jpeg_enum_fmt_vid_dst(struct file *file, void *priv, struct v4l2_fmtdesc *f)
> +{
> +	struct jenc_context *ectx = jpeg_file2ctx(file);
> +
> +	if (jpeg_is_invalid_dst(ectx, f->type))
> +		return -EINVAL;
> +
> +	return jpeg_enum_fmt_dst(f);
> +}
> +
> +static int iop_jpeg_enum_framesizes(struct file *file, void *priv, struct v4l2_frmsizeenum *fsize)
> +{
> +	const struct jenc_enc_format *efmt;
> +
> +	if (fsize->index != 0)
> +		return -EINVAL;
> +
> +	efmt = jpeg_find_pix_format(JENC_SRC_QUEUE, fsize->pixel_format);
> +	if (efmt) {
> +		fsize->type	= jpeg_def_frmsize.type;
> +		fsize->stepwise	= jpeg_def_frmsize.stepwise;
> +		return 0;
> +	}
> +
> +	efmt = jpeg_find_pix_format(JENC_DST_QUEUE, fsize->pixel_format);
> +	if (efmt) {
> +		fsize->type	= jpeg_def_frmsize.type;
> +		fsize->stepwise	= jpeg_def_frmsize.stepwise;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int iop_jpeg_enum_fmt_vid_src(struct file *file, void *priv, struct v4l2_fmtdesc *f)
> +{
> +	struct jenc_context *ectx = jpeg_file2ctx(file);
> +
> +	if (jpeg_is_invalid_src(ectx, f->type))
> +		return -EINVAL;
> +
> +	return jpeg_enum_fmt_src(f);
> +}
> +
> +static int iop_jpeg_get_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct jenc_context *ectx = jpeg_file2ctx(file);
> +
> +	if (jpeg_is_invalid_dst(ectx, f->type))
> +		return -EINVAL;
> +
> +	jpeg_v4l2_get_format(ectx, f);
> +
> +	return 0;
> +}
> +
> +static int iop_jpeg_try_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct jenc_context *ectx = jpeg_file2ctx(file);
> +
> +	if (jpeg_is_invalid_dst(ectx, f->type))
> +		return -EINVAL;
> +
> +	return jpeg_v4l2_try_format(ectx, f);
> +}
> +
> +static int iop_jpeg_set_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct jenc_context *ectx = jpeg_file2ctx(file);
> +
> +	if (jpeg_is_invalid_dst(ectx, f->type))
> +		return -EINVAL;
> +
> +	return jpeg_v4l2_set_format(ectx, f);
> +}
> +
> +static int iop_jpeg_get_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct jenc_context *ectx = jpeg_file2ctx(file);
> +
> +	if (jpeg_is_invalid_src(ectx, f->type))
> +		return -EINVAL;
> +
> +	jpeg_v4l2_get_format(ectx, f);
> +
> +	return 0;
> +}
> +
> +static int iop_jpeg_try_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct jenc_context *ectx = jpeg_file2ctx(file);
> +
> +	if (jpeg_is_invalid_src(ectx, f->type))
> +		return -EINVAL;
> +
> +	return jpeg_v4l2_try_format(ectx, f);
> +}
> +
> +static int iop_jpeg_set_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct jenc_context *ectx = jpeg_file2ctx(file);
> +
> +	if (jpeg_is_invalid_src(ectx, f->type))
> +		return -EINVAL;
> +
> +	return jpeg_v4l2_set_format(ectx, f);
> +}
> +
> +static int iop_jpeg_encoder_command(struct file *file, void *priv, struct v4l2_encoder_cmd *ec)
> +{
> +	struct jenc_context *ectx = jpeg_file2ctx(file);
> +	struct vb2_queue *vq;
> +	int rc;
> +
> +	if (ec->cmd == V4L2_ENC_CMD_STOP) {
> +		vq = v4l2_m2m_get_src_vq(ectx->fh.m2m_ctx);
> +		if (!vb2_is_streaming(vq))
> +			return 0;
> +
> +		vq = v4l2_m2m_get_dst_vq(ectx->fh.m2m_ctx);
> +		if (!vb2_is_streaming(vq))
> +			return 0;
> +
> +		rc = v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
> +		if (rc)
> +			return rc;
> +
> +		ectx->is_stopping = true;
> +		schedule_work(&ectx->stop_work);
> +
> +		return 0;
> +	}
> +
> +	return v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
> +}
> +
> +static const struct v4l2_ioctl_ops qcom_jpeg_v4l2_ioctl_ops = {
> +	.vidioc_querycap		= iop_jpeg_querycap,
> +	.vidioc_enum_fmt_vid_cap	= iop_jpeg_enum_fmt_vid_dst,
> +	.vidioc_enum_fmt_vid_out	= iop_jpeg_enum_fmt_vid_src,
> +	.vidioc_enum_framesizes		= iop_jpeg_enum_framesizes,
> +
> +	.vidioc_g_fmt_vid_cap_mplane	= iop_jpeg_get_fmt_vid_dst,
> +	.vidioc_try_fmt_vid_cap_mplane	= iop_jpeg_try_fmt_vid_dst,
> +	.vidioc_s_fmt_vid_cap_mplane	= iop_jpeg_set_fmt_vid_dst,
> +	.vidioc_g_fmt_vid_out_mplane	= iop_jpeg_get_fmt_vid_src,
> +	.vidioc_try_fmt_vid_out_mplane	= iop_jpeg_try_fmt_vid_src,
> +	.vidioc_s_fmt_vid_out_mplane	= iop_jpeg_set_fmt_vid_src,
> +
> +	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
> +	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
> +	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
> +
> +	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +
> +	.vidioc_encoder_cmd		= iop_jpeg_encoder_command,
> +	.vidioc_try_encoder_cmd		= v4l2_m2m_ioctl_try_encoder_cmd,
> +};
> +
> +static int jpeg_v4l2_init_queue(void *priv, struct vb2_queue *sq, struct vb2_queue *dq)
> +{
> +	struct jenc_context *ectx = priv;
> +	int rc;
> +
> +	sq->drv_priv		= ectx;
> +	sq->dev			= ectx->dev;
> +	sq->type		= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	sq->io_modes		= VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +	sq->buf_struct_size	= sizeof(struct v4l2_m2m_buffer);
> +	sq->ops			= &qcom_jpeg_v4l2_vb2_ops;
> +	sq->mem_ops		= &vb2_dma_sg_memops;
> +	sq->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	sq->lock		= &ectx->ctx_lock;
> +	sq->min_queued_buffers	= 1;
> +
> +	rc = vb2_queue_init(sq);
> +	if (rc)
> +		return rc;
> +
> +	dq->drv_priv		= ectx;
> +	dq->dev			= ectx->dev;
> +	dq->type		= V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	dq->io_modes		= VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +	dq->buf_struct_size	= sizeof(struct v4l2_m2m_buffer);
> +	dq->ops			= &qcom_jpeg_v4l2_vb2_ops;
> +	dq->mem_ops		= &vb2_dma_sg_memops;
> +	dq->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dq->lock		= &ectx->ctx_lock;
> +	dq->min_queued_buffers	= 1;
> +
> +	rc = vb2_queue_init(dq);
> +	if (rc) {
> +		vb2_queue_release(sq);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int fop_jpeg_file_open(struct file *file)
> +{
> +	struct qcom_jenc_dev *jenc = video_drvdata(file);
> +	struct video_device *vdev = video_devdata(file);
> +	struct jenc_context *ectx;
> +	int rc;
> +
> +	ectx = kzalloc_obj(*ectx, GFP_KERNEL);
> +	if (!ectx)
> +		return -ENOMEM;
> +
> +	ectx->dev  = jenc->dev;
> +	ectx->jenc = jenc;
> +
> +	/* default quality if userspace does not set the control explicitly */
> +	ectx->quality_requested = QCOM_JPEG_QUALITY_DEF;
> +	ectx->quality_programmed = 0;
> +
> +	mutex_init(&ectx->ctx_lock);
> +	mutex_init(&ectx->quality_mutex);
> +
> +	INIT_WORK(&ectx->finish_work, jpeg_finish_work);
> +	INIT_WORK(&ectx->stop_work, jpeg_stop_work);
> +
> +	rc = jpeg_v4l2_set_defaults(ectx);
> +	if (rc)
> +		goto err_unlock_free;
> +
> +	v4l2_fh_init(&ectx->fh, vdev);
> +	v4l2_fh_add(&ectx->fh, file);
> +
> +	v4l2_ctrl_handler_init(&ectx->ctrl_hdl, 3);
> +	ectx->quality_ctl = v4l2_ctrl_new_std(&ectx->ctrl_hdl,
> +					      &qcom_jpeg_v4l2_ctrl_ops,
> +					      V4L2_CID_JPEG_COMPRESSION_QUALITY,
> +					      QCOM_JPEG_QUALITY_MIN,
> +					      QCOM_JPEG_QUALITY_MAX,
> +					      QCOM_JPEG_QUALITY_UNT,
> +					      QCOM_JPEG_QUALITY_DEF);
> +	ectx->perf_level_auto_ctl =
> +		v4l2_ctrl_new_custom(&ectx->ctrl_hdl,
> +				     &qcom_jpeg_perf_level_auto_cfg, NULL);
> +	ectx->fps_target_ctl =
> +		v4l2_ctrl_new_custom(&ectx->ctrl_hdl,
> +				     &qcom_jpeg_fps_target_cfg, NULL);
> +	if (ectx->ctrl_hdl.error) {
> +		rc = ectx->ctrl_hdl.error;
> +		goto err_fh_exit;
> +	}
> +
> +	ectx->fh.ctrl_handler = &ectx->ctrl_hdl;
> +
> +	rc = v4l2_ctrl_handler_setup(&ectx->ctrl_hdl);
> +	if (rc)
> +		goto err_ctrl_handler_free;
> +
> +	v4l2_m2m_get(jenc->m2m_dev);
> +	ectx->fh.m2m_ctx = v4l2_m2m_ctx_init(jenc->m2m_dev, ectx, &jpeg_v4l2_init_queue);
> +	if (IS_ERR(ectx->fh.m2m_ctx)) {
> +		rc = PTR_ERR(ectx->fh.m2m_ctx);
> +		v4l2_m2m_put(jenc->m2m_dev);
> +		goto err_ctrl_handler_free;
> +	}
> +
> +	return 0;
> +
> +err_ctrl_handler_free:
> +	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
> +err_fh_exit:
> +	v4l2_fh_del(&ectx->fh, file);
> +	v4l2_fh_exit(&ectx->fh);
> +err_unlock_free:
> +	mutex_destroy(&ectx->quality_mutex);
> +	mutex_destroy(&ectx->ctx_lock);
> +	kfree(ectx);
> +
> +	return rc;
> +}
> +
> +static int fop_jpeg_file_release(struct file *file)
> +{
> +	struct jenc_context *ectx = jpeg_file2ctx(file);
> +	struct v4l2_m2m_dev *m2m_dev = ectx->fh.m2m_ctx->m2m_dev;
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	unsigned long flags;
> +
> +	/*
> +	 * Ensure the threaded IRQ handler cannot dereference this context
> +	 * after it is freed.  Clear jenc->actx under hw_lock before
> +	 * cancelling work and releasing the m2m context.
> +	 */
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +	if (jenc->actx == ectx)
> +		jenc->actx = NULL;
> +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +	cancel_work_sync(&ectx->stop_work);
> +	cancel_work_sync(&ectx->finish_work);
> +
> +	v4l2_m2m_ctx_release(ectx->fh.m2m_ctx);
> +	v4l2_m2m_put(m2m_dev);
> +	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
> +	v4l2_fh_del(&ectx->fh, file);
> +	v4l2_fh_exit(&ectx->fh);
> +	mutex_destroy(&ectx->quality_mutex);
> +	mutex_destroy(&ectx->ctx_lock);
> +	kfree(ectx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations qcom_jpeg_v4l2_file_ops = {
> +	.owner		= THIS_MODULE,
> +	.open		= fop_jpeg_file_open,
> +	.release	= fop_jpeg_file_release,
> +	.poll		= v4l2_m2m_fop_poll,
> +	.mmap		= v4l2_m2m_fop_mmap,
> +	.unlocked_ioctl = video_ioctl2,
> +};
> +
> +/* Release callback: free jenc after last fd is closed. */
> +static void jenc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct qcom_jenc_dev *jenc = container_of(v4l2_dev, struct qcom_jenc_dev, v4l2_dev);
> +
> +	v4l2_device_unregister(&jenc->v4l2_dev);
> +	v4l2_m2m_put(jenc->m2m_dev);
> +	kfree(jenc);
> +}
> +
> +int qcom_jpeg_v4l2_register(struct qcom_jenc_dev *jenc)
> +{
> +	int rc;
> +
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	jenc->enc_hw_irq_cb = jpeg_v4l2_process_cb;
> +
> +	jenc->m2m_dev = v4l2_m2m_init(&qcom_jpeg_v4l2_m2m_ops);
> +	if (IS_ERR(jenc->m2m_dev)) {
> +		dev_err(jenc->dev, "failed to init mem2mem device\n");
> +		rc = PTR_ERR(jenc->m2m_dev);
> +		goto err_mutex_unlock;
> +	}
> +
> +	jenc->vdev = video_device_alloc();
> +	if (!jenc->vdev) {
> +		rc = -ENOMEM;
> +		goto err_m2m_release;
> +	}
> +
> +	snprintf(jenc->vdev->name, sizeof(jenc->vdev->name), "%s", QCOM_JPEG_ENC_NAME);
> +	jenc->vdev->fops	= &qcom_jpeg_v4l2_file_ops;
> +	jenc->vdev->ioctl_ops	= &qcom_jpeg_v4l2_ioctl_ops;
> +	jenc->vdev->minor	= -1;
> +	jenc->vdev->release	= video_device_release;
> +	jenc->vdev->lock	= &jenc->dev_mutex;
> +	jenc->vdev->v4l2_dev	= &jenc->v4l2_dev;
> +	jenc->vdev->vfl_dir	= VFL_DIR_M2M;
> +	jenc->vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
> +
> +	rc = video_register_device(jenc->vdev, VFL_TYPE_VIDEO, -1);
> +	if (rc) {
> +		dev_err(jenc->dev, "failed to register video device\n");
> +		goto err_video_device_release;
> +	}
> +
> +	video_set_drvdata(jenc->vdev, jenc);
> +
> +	jenc->v4l2_dev.release = jenc_v4l2_dev_release;
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +
> +	dev_dbg(jenc->dev, "device registered as /dev/video%d\n", jenc->vdev->num);
> +
> +	return 0;
> +
> +err_video_device_release:
> +	video_device_release(jenc->vdev);
> +err_m2m_release:
> +	v4l2_m2m_release(jenc->m2m_dev);
> +err_mutex_unlock:
> +	mutex_unlock(&jenc->dev_mutex);
> +
> +	return rc;
> +}
> +
> +void qcom_jpeg_v4l2_unregister(struct qcom_jenc_dev *jenc)
> +{
> +	video_unregister_device(jenc->vdev);
> +}
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
> new file mode 100644
> index 000000000000..ee69c510faa2
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_V4L2_H
> +#define QCOM_JENC_V4L2_H
> +
> +#include <linux/types.h>
> +#include <linux/videodev2.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +struct qcom_jenc_dev;
> +
> +int qcom_jpeg_v4l2_register(struct qcom_jenc_dev *jenc);
> +
> +void qcom_jpeg_v4l2_unregister(struct qcom_jenc_dev *jenc);
> +
> +#endif /* QCOM_JENC_V4L2_H */
> --
> 2.34.1
> 
> 



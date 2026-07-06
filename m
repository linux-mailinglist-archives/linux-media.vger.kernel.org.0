Return-Path: <linux-media+bounces-66757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9sAhIv+9S2oUZgEAu9opvQ
	(envelope-from <linux-media+bounces-66757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:38:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D95CD712124
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:38:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=y9ZrAHEM;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66757-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66757-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06636376F0CE
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112F330566A;
	Mon,  6 Jul 2026 13:02:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECCB420881
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 13:02:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342946; cv=none; b=IwG/hGNNC93MTnaNbdn52Qi8Yx2/XIo7kPfsfekreAJ9Rq1m0Mbi4d/hTyOWonaM+dGZbQrTLNY65GhJEG0eym+utQm2H+4QOQ49Z0jV/enggvhCrqTSuh5R0CWnyQwBAIxFKebp9NhtBkDNTvT/QrI2gtWP12VZbt3SWtQCb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342946; c=relaxed/simple;
	bh=iVB4Ya9lmgUdlW6rTmHOExjGXSicdFmtjWrsWgh55Zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbbKUBPEqGLFRZUtVUHqfJj9HLdYdWRJ/rrEHE1Bzi6sHjRj/HMsUErMImthC3tFPXSK7sEokkPWG2fKO9znhcQ/p+xf60bFHcAdJmJbSVVT5iGr9P8MIcuTYJ6qqliwyl0SkzUqRv5b3+IYAOukBnYkHTFlXt0x4j7udGeW6KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y9ZrAHEM; arc=none smtp.client-ip=209.85.167.53
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb40ebefbso778705e87.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 06:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783342943; x=1783947743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7DO4KKs78C2tCMoRZ2/9ZKdQZwoZA/FI3KbAI5N32Bc=;
        b=y9ZrAHEMtpmlD3D0oPb2pu/hF/rQBau95y1dUmCgQFvvYRwanGZZTvWQ2W6I+l2ZLR
         SIxSUQb2m4UEZxpyO7L9BLb7xrDj0THZKHlkGXnUEI25N1ZmFhUJ0Kl0aKlEMw5RgBNy
         uhZ8sJhgAzHz4d6aNSAyNGGtvyzoQ4KyHqEUGVF7eE8Dein5O0Mfp3lnBpXdNbEKlWiw
         Y/NsfzBTAMl/sj3KYB0Uzeg3z1DIIBKbLUtz7GO72ozeElo03TKBBsxgX/cX8vBLCoBm
         8EVeCFC/GyCM8x9wfqSR28rB4Y6wLPSoEz3ulNrepO9Tyl3gRHLja10iobLgpuxbHt1b
         m+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342943; x=1783947743;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DO4KKs78C2tCMoRZ2/9ZKdQZwoZA/FI3KbAI5N32Bc=;
        b=nreN9l+xl3g+OR93hwWB93ugofjBhNUyOpif5os063sIlPH5sW7Br9g8S9ZrYMGZYS
         o7fJy1rBHtyPIw+6Ouda6bgQDdMv0qNNHK3O1U/6TuITKQXZDU0XGZeFYd8DC2IUZmrJ
         WeoxpmXEdifLBmxDwuuVBx05clR5Lr+JbWBypTXlwNmBW/tDldP1SIg1iBe2DdtvVO+K
         Euf2EPhmNEv7KG76iCTiH0Ej37r0e+BfRUj3nNNqU9Cr0s7hgWxlhu7bau9pclRyPsNk
         +5zwD3omsqoxmigctuVhenKcFYKjRM6+4Y3QX2pO2+HMGQHt6Jnbi/xrtUo0vBG0srqz
         UpTw==
X-Forwarded-Encrypted: i=1; AHgh+Roy4qRh0wqWG4WDT17TT5Xuj/TzeMSge7j24ukrtVhKN+xY7o4N5+m7RucDQZoW04T/dElDtjKXz7ynWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKqRfSMFSUvmZLGtJdi3pd5EkgPtENscv2R/oPbzQwIwGp/NhO
	qyngl18FEp0HCIZ7Y5BvIz6+anWcdOyYbc6O1P1+sP1QH/vde7XUaKp18PLEeiZppOA=
X-Gm-Gg: AfdE7ckXY5+DWzEJu7tW2WrRiNvkXchUi3pakXWrXHpahAs59KKQ6Hfs/SiDw/o+yvV
	VzkJr6dhbY2PT/0ambcSiss1W9FdEDGFRPRacqXSzNI5leze43KgdaptprmeVNOno03WQOYIbda
	gVUm7QwuNNfzRt8EbmDo4vywMlQBm4aX7aZZucYeBVIcWgtY0fUVLloigcy6i5uzaOc8+89KDJK
	PpMWO10CLhNNp/0rJ0ySnH208gKA0gWdDFjnyxxY9I45Unh0oFgvgBX2ZfiXDxrOPL6YEjGAIsz
	2h1cEUm/JFwmIhRtP6nRdhUUyY5jYU8HnVlzdWruHV/SyWTo0otuNfylTBLK3e8Uj5RosPOi6z2
	PeSbGdxGbDuVO5b0yAnBqzegLLXERgT8dcKtLwT5LmcV3RpaJmSSA3NEtTm6GbYIqf/ZmheXJ0z
	zEhaHrbnamblaYaEaFIcaVc/byB2WPmpNEMPCKxBqhXmD57kpOtKIqgf+FPd0fd/CH3Cw=
X-Received: by 2002:a05:6512:3b20:b0:5ae:bfab:19c3 with SMTP id 2adb3069b0e04-5aed4541422mr1327878e87.2.1783342943056;
        Mon, 06 Jul 2026 06:02:23 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb3aasm2833601e87.53.2026.07.06.06.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:02:22 -0700 (PDT)
Message-ID: <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
Date: Mon, 6 Jul 2026 16:02:21 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66757-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D95CD712124

On 7/6/26 15:11, Bryan O'Donoghue wrote:
> On 06/07/2026 13:00, Vladimir Zapolskiy wrote:
>>> There is no "master" device in this block of devices - save perhaps for
>>> the CSID mux / wrappers on some of these parts.
>>>
>>> We have shared resources like camera noc, system noc and external clocks.
>>>
>>> Please include power-domains and interconnects.
>>>
>>
>> Why? The common power domain and interconnects have already been
>> described as resources of the parent CAMSS device, there is no need
>> to duplicate descriptions in every child device tree node of CAMSS.
> 
> CSID, IFE etc are not parents of the JPEG encoder.
> 
> The idea is to make all of these peers, eventually. Not particular block
> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
> 

The statement provides the same information as before, e.g. it's found here:

https://lore.kernel.org/linux-media/fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie/

     There's no functional linkage between CAMSS/IFE and JPEG - they are
     peers within the CAMSS power-island.

Thus "the CAMSS power-island" exists, and it got its hardware description
as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
a natural resource of all devices on "CAMSS power-island", including the
ones got their description inline CAMSS device tree node or children nodes.

There is a difference between 1 point of resource description and N points
of resource descriptions, the latter one is more complex and error prone,
therefore I belive it shall be disregarded in favour of the former option.

-- 
Best wishes,
Vladimir


Return-Path: <linux-media+bounces-63701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zObPAjrCIGqL7gAAu9opvQ
	(envelope-from <linux-media+bounces-63701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:09:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C5E63BFFF
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:09:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=U1z3KQEw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63701-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63701-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08177302316C
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 00:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C372E5464D;
	Thu,  4 Jun 2026 00:09:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E501418EB0
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:09:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780531767; cv=none; b=Ivi8lPQnzvwFKPF7geNe8c4TPtQ70xugJ1fMzsFqk9CRMxp4gV21TJkUT6l+/ddAvg/D9SRbS0vUNUZ2NUlQseTptK4C0C/q3B4wDU9q8mFTF/eS5CTngQQeYXwZFa5EvgJmizYJXgAWyjpWHoUaoyZKtoQkGBdJLQzTDPZXfrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780531767; c=relaxed/simple;
	bh=Oky5luA42ST6mjppzADJqKFngQXqBh7GgWzFg4QNMPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LffFfkK9AMEUQTZKeZJwFT9zjoH2QGE4OMrjMwe7POiVvrOF0UfHSZGYLccxCI0RhOy3ceuGdRsjO3+yP2N3L4I6DjtmX6ghgRiEgsVC3P/zhRrLXcT+tNmt0DPwouaF60yuqW5pNbXGNa4NgCdigYBapEfdhFGZ88n/sfC/gis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U1z3KQEw; arc=none smtp.client-ip=209.85.208.176
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-396745b9abfso92671fa.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 17:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780531764; x=1781136564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrH9nbA1I8F4TzBkK1EVYY6LcspB7GUP/tqjuY52j4w=;
        b=U1z3KQEwqWYdj3sj7+I5gT60J1hWhqp+RvlIMsns9Uc1ZHMSKVRQLTiJRjGI7LZmlx
         KoAbhVEcyQZJQy7ZNt0efyrvEmWaPmI9DpN8R8bFpWGpzxqKbPkUcd3TtwI+yALYZh7A
         pzqLc2hnbE6Comdagt/V+0gq/zs1ZVyC6Pez4XJP7s/YYhv5pmAxNfllAIbVc5GHtK4e
         ej5V4M8MsKlLMbCcwrtbnmDpl5laYzvNb8KPTqV6BIv1LtON5MMR1oIwvmq2DqDI+B9R
         zcWvTyDePDlLIrq/L8r4evugQPenJ8jWrjNm5Ozf6F1jDiYuqyx2jtMraPfo+QlIIIx+
         np2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780531764; x=1781136564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CrH9nbA1I8F4TzBkK1EVYY6LcspB7GUP/tqjuY52j4w=;
        b=nL77VFVx2dX4v8cqHalFNeW1MrpFNRAx7GzwZbxMfnibG3mcN0/6Dmw0ZFm9q0XU3p
         3M57Io4F5yKTQPlJr8GYdnRN/r1U/f69QwZbRT43A+A+si5FfDRNPLuW4b4lFdFK31MD
         5uu5BNysCLETPlkSPoR000iVmBJiiVv1fz35aq9Fqtl1eB9InODELHojgoGkyfTjSAXe
         ARULry8JVXd9553y2JpLszsWnKPha3gXKS+oX5tex+PcKKgowgXpBmKEqQTBOZi2qm2a
         k6Tp/mSb4XIicxZGSbOFhTMD5BRRbxuDbTEdTlPjGNuF6FaIzDWPpll3LYqcZZ5LAoPR
         HP6Q==
X-Gm-Message-State: AOJu0YzCKknkrFQtsQYjWD53CYYhgnhQ9qiNbLD/83EdHiTqVIwhJKoU
	HynZYVTb2xPMHD3vcFjYJ137FIvSJ2aO43zXITQ38+hC7eZZw5nwc4Iv0mX/iGwCxtw=
X-Gm-Gg: Acq92OEdzsZj82zmqZkbbWNP9OaxvmO6xaJxBVXwKW3sZxrWm3C6ofq7ZyozjgQvzB/
	FK5sK1jjhoVVN+6I9QcqtHn4p7M07VKgDP+V50z56ze+v1s0VGjCigx92FJ/jUXBRWnvrFeJyQq
	fW5W59Vmykscc5CVK93yZSHdFplASijL+yAPF6DO6E0W8nfD4I79YJApDMCiSP5sL0NRiAL1/9U
	j/R4RWYH8bHXRT3tiPG5VJsfuiGHd0Ma58S6+iq151EFDjZ4fhbSPjxrTKLz7A2vH4yhgyJlUjk
	8AmXs/br2+PB7eRn8QWpMEUtw0jHtDaqJs3KphJ70/NqpLX/iu+k+3UgZ8AVyW/C+T6ZiZ1iuQ3
	CUQoGQQC+vBwzjnDGuYpQD9Doco404QJv2+xpb7KmLShltQzS4YeRsDcQWLD8pnA6b567V71lAx
	Mt09sQJJ3FBFM/EnUol9ZSoiwbqqhKDRH7pjxZV7/8NIXQKg2GwqY8NcP9Aen0dKnFrEde0IJJU
	FRdcmPeZsuOl8PQ
X-Received: by 2002:a05:6512:4012:b0:5aa:67a9:e9da with SMTP id 2adb3069b0e04-5aa81bc78a5mr77694e87.0.1780531764067;
        Wed, 03 Jun 2026 17:09:24 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2d3sm899017e87.5.2026.06.03.17.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 17:09:23 -0700 (PDT)
Message-ID: <386e9ced-18c4-4276-aaf2-e563351b3a64@linaro.org>
Date: Thu, 4 Jun 2026 03:09:22 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Rename unused macro parameter
To: Hungyu Lin <dennylin0707@gmail.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260603231202.6569-1-dennylin0707@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260603231202.6569-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63701-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99C5E63BFFF

On 6/4/26 02:12, Hungyu Lin wrote:
> The ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN() macro
> declares a parameter named 'c' but uses 'cid' in the macro
> body instead.
> 
> Rename the parameter to match the identifier used in the
> macro body and silence the checkpatch warning:
> 
>    WARNING: Argument 'c' is not used in function-like macro
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir


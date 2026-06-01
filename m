Return-Path: <linux-media+bounces-63275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHxlJWueHWqWcgkAu9opvQ
	(envelope-from <linux-media+bounces-63275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:59:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC262146A
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20A503025E5A
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 14:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A312A3A5E9E;
	Mon,  1 Jun 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLSd/+xL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B4B3BB9E3
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325928; cv=none; b=npPxCYmvlrdRvjTzVhOd16/mqO6yaNNM3ogwIkuaNt6mR5sYF+y8jUFltJXnGtHtdsLwiGOo2J/M6oRFQijcfn59uAxvi9P0NDeZ1v7C9azw8cG99GacBenj9upsaRhRuqTCsPbiIKkfnkFUdOONBDbI6NLq6eMqSEPftv1Z4/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325928; c=relaxed/simple;
	bh=rqBnj7fgbdJlTrVFKmmoGA6nL2axLMyCnfR2JX+G2hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/x3TvAF63iEKSK3kGjG7VXp2oT2lBM+48L2Rao2z0LcMREso6lG01tG/Z991TCU3NtdX2iChEyJeDkIkq2eaERSxA3BxL/kVeJHs518mKX+goD/B+Uz77I3zbAbrKWhpd/1H4n0+/on49dmPCZjAcY+EKJgXGi8717aZ8snByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLSd/+xL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490686877a1so59929085e9.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780325925; x=1780930725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qq6eAfjOAZ4Lfq7LauQf4bjJ3RlF5Fcl+6rJ1tXLLa4=;
        b=uLSd/+xL4an32vfrEaURSqZ5jxrxDf+Je5BlMeEWRtFjYbPTxG3qwo2molySdmCNar
         ySHXibbXz8tiHssk9PIHOyolAOy7OU2eiCfdWIsZImKYw8tjwJsPOMkcYc5SW8psaEXM
         OQ75ak3pmVXlznsgExz+mhv6sxxqgnzcHHkLiWQuRzqvG2X/T/BpGPlMgvWlq8Arl3oe
         rMnHBO3SIkoLsLSTlVjsavPkJOH78fF/VYBvRQJGgLob1NulcMXFXTN9IRhw39sL7ucH
         KOROkYsY1v4+pI3CTdoUJcsn/pewlnaOYjs5MQsu/2ewKhZMzppKraLeS4Rw2U3N8LBf
         R8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325925; x=1780930725;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq6eAfjOAZ4Lfq7LauQf4bjJ3RlF5Fcl+6rJ1tXLLa4=;
        b=KfzuSAbxjlmtVb2J2CgkyojsVzXdcgqyo7G8Dzd1h+AVWOa8SC3kI5fsPDXbqPoFSD
         EFfq9t10dql0L7FaZ0TNzKqM9sn9jKT79xruyIZ9Sa0IXva0U7UZCAWlA/ok2g/c2hKS
         ub7ed0v1GPiaLLzT/JivDpypgzng2bnn9hyGw8n268CGNhoAuDWpUvPHOcC9ERfUi53R
         WR2Sv9DCP9BPHY3MEPQPSbo4lEOPzRzPLMrfgvyc0OiT0rsicrcGYEOyKAfLq3JawBU/
         Vp0+ZakAhS0CsoTmvAhFLvl7Jkbtk0InmJ4QW413gTZRz2NIp5sy/ILJzWrDKdjgBPZm
         oCCw==
X-Forwarded-Encrypted: i=1; AFNElJ9BUk9yNYN74BKgqCD/nnKuW08LFVfcLPxsA7z8omFa5a/cIA5zTAFYl61md993OE6BYdsvBXb40l+Wsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfmGgikb9II/NDIsIERsQlntaOXfSvavPJYR1J3e8+GUNOlDx9
	hgYrcvaxbatA4zbLgJWdsl3Ivd+5DqNjpuA9XESrd3rgE7BXuolspYAmLB0BCCrM9V8=
X-Gm-Gg: Acq92OHXYLF9vkFTNQNBKa10akIC+GQr/cUFLR6GkhZyWJE3017KbtsWr6vxXE7pqk/
	KTU4e/IwUvhGnlXheRV+RIHxpeW3iWy6mKAywNOx/4o5OvrhXoB5QPus4MRFdB+NS6rmkohehy1
	WOWN/qfk0s/CZZgn6z8Gev8zqIjsalFuAX2/BPGWH/Qoe3eNWQbIkuHGdLhYjHUh6E5edGyflmw
	TBXDF9L8lOmraOR9TBAQJJlIxb7nUaLQSW5dTqWQ5O4O7MifYa6LosswVXoVfhKVmgdHhsGJsZo
	xwyFxS428pHgFg6ao66McJvxsAs8llbcBYWB7o7pLpVjnd3zO0gHHQGdwSJT4+C44c8Z2Sn9i7o
	jlRjIEAXQ4xCfzm+kURmpPRpop3h30iiVAK5SqPbVHqXpFwPvmQtWXih9yru8GqMK175XceRMXP
	1UtmwsI9Tljmw2A9jgro78N9DeupcNzZhKm6UPFZDhpF8YCQ==
X-Received: by 2002:a05:600c:564a:b0:490:53b0:9e5a with SMTP id 5b1f17b1804b1-4909c11c15cmr174298335e9.5.1780325925446;
        Mon, 01 Jun 2026 07:58:45 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm25172652f8f.0.2026.06.01.07.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:58:45 -0700 (PDT)
Message-ID: <2d7430bc-1bb5-47ff-95c7-c5c4d880cdf2@linaro.org>
Date: Mon, 1 Jun 2026 15:58:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
 <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
 <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
 <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-63275-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 49CC262146A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 15:27, Loic Poulain wrote:
>> Yes I think CDM should be a standalone block and BTW use standard DMA
>> APIs with its own IOMMU entry.
> Interesting, so CDM should be a dedicated subnode as well, and not
> part of the OPE?
> Then, If we want to use it from OPE at some point we would need some
> 'cdm' phandle in OPE node.

Your question makes me think again.

CAMSS:
- IFE/CDM
- IFE Lite/CDM

HFI/BPS/IPE
- BPS/CDM
- IPE/CDM

OPE:
- OPE/CDM

I believe those are the mappings of the various SIDs too.

Come to think of it there is every reason to model the CDM block as

cdm-ife0@ {
     iommus = <IFE0_SID>;
};

cdm-ope0@ {
     iommus = <etc>;
}

And then do use the dma engine API to shift data. I don't see why the 
IFE, OPE or BPS needs to map the IOMMUs and if you are using the BPS via 
HFI you'd simply leave the cdm-bps@ {} disabled in your dtsi anyway.

We should excise CDM IOMMUs unless/until we come to implement CDMs as 
standalone nodes.

I'm open to being corrected of course :)
---
bod


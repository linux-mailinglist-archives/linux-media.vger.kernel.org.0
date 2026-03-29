Return-Path: <linux-media+bounces-57509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKtnAE8LyWnttgUAu9opvQ
	(envelope-from <linux-media+bounces-57509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 13:21:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8936E351C74
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 13:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B95330238F1
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 11:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108412C15AC;
	Sun, 29 Mar 2026 11:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PRk0z8yR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339ED3016EE
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774783295; cv=none; b=nqfLRgmsZ782HuWBA1MzVzdwj0zkSsVdr9QD/AEc7AzCdTw6DZTjJRL9e0/+gClr4mIH43HIsNMD7983XhOUMjOEz47Br9NQpgaUFLJ27GIOwSCU9XfPXMvYI28tcln5QvU+zSx2xYc+i1oK9ewLD3ypMW1kWs+7v3sofIeiDmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774783295; c=relaxed/simple;
	bh=0wR+MgHijwGTIMJCNQj0goJOmIz68prqo+nba/9TQrc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lEzQyJKU57s2U5C/auQwjdgOeOTAe/yJeBkv9Ey7uyecPxqTvPtDTdt/BzmgZhrG3qNk5WCPnjZPpJVHv/ExFNut1/qZ/JnsomqFSvceX7lKabMasIiDtrX+Uslx9HjNsXcNDjRQI1Vs9JfqeEDvsoVbiZbgUqVzgfX4MlCjrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PRk0z8yR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso41496715e9.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 04:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774783293; x=1775388093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TwR3yI+NB25G7HZGBpVG+F40teFK60brAC7VV58HZik=;
        b=PRk0z8yRSIwFZ6p9ut7PnccqOAOZxtNAGJE5fOb6BoheoJ/ssv7jhrgQ7Xks+IVkLo
         WX76YAmAFEqHtUgQQ1LPOWJkyp8C6JefHDjZdwTkdVclx0UKT1gAFbdIEicyut3aBx0s
         4HLE8OE7cpFTX5edbZ+95n2cM0g72s9EQla8hfEUuWr8d7mAACk+hPnmadKjsOcwJihX
         zQbt2Kl2BHywtjjDlXN/8TT1iZisQMpClIhuGZjcpc+4StgY9MMHPNPY5EqPixUXeP2K
         tvN6Wir0npo1fYgz0CQ17pNsKMqKRehjxw9TsjwX7eMI2YFrN6QwC21gGhQlvsbRE2gK
         di0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774783293; x=1775388093;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwR3yI+NB25G7HZGBpVG+F40teFK60brAC7VV58HZik=;
        b=MQh3D+uapXqxaBv953h0sJdV2mdSOUIbTL2Aq/7I4Pds3j2819yDTw1n+EciIah/wz
         rmFkq1toVWO7aaYqd8gifltSjjylGoqaAtx22IKheS7bf6ubD3vlNSXmRs9rpdssQgV+
         28imP0KgLxpHAsIHV17jRBciuoSlgk45COPO3c9+JLSP/pqaye1ePmbLiT8TUDXgFGjD
         ww5MXwseI/8R6PfeMHqSE9DNq92/EPYLA5+8L6mPxEAHAFnoC6WGFBOQyFgb5Dtbkgjo
         AWZ+XjMrSudeIEIO3Q9cqcYTV1o/pvFdZWIGB0zquXTN2Kfj049IDpG+dFsInGK7Ubkq
         OTig==
X-Forwarded-Encrypted: i=1; AJvYcCUEwIzbhe+MDqj5oSdb1YCtJh5pB7Jz1M9G06ZRxkTAlmLM+iwkiIgU9Ozq9/IHzPba0SEZ61vEpBNCBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXWOoHg0tKURxHKVT3Gfbfpsg24jhC9UVwsQnPd57nGgiHV0vS
	z1/w47avo+u4nR8VlC+0C/Q8Rhk7aGbyskZjAZo3FzO0gZL4ceGllcBMJTbbw21kAjw=
X-Gm-Gg: ATEYQzzhqgiTEY2cR6xD+EO7wL3Ef2Xdot4b6TOxCuSwmWYNJYkurTpyaZXf+TUzk4R
	q+1sgo0K1wVnLocC57TuTpFZtve2MkFrZ7wuurF4PuhP6SuDlvQJjWb3+pK9UEd3bUm6UEPWPmq
	eoEy9H6AEPslZuW7GAKeZa1QULCBjmV/a5pb4U1/gakjbJYaZQaG7D5E58K+PoNXS/F8x8L7n2C
	L5Y76gljafPMfzHnFaDlztUoYppN6d4FFArwbw7uNXOAPO12Fjp3CbCzeQKVwH3sEw6K4MClW8c
	Iiu4ImKsN4gZIAnBpylO35Bv4ThdD6ybAiOZs/VyjeOt3vwMD+Hm+t3CAOtmYtKdM/erN4LTfLk
	PgP2lQv8wu/htXyKcA3U8lStlbEgRf955Odd3AdiTMyH4Lt2OdgjxIi4KkVz5r8Y6Vfw1nH1WMB
	lR4ZxeX/EzlNFx/H37ccwhNuLcWhHzlzA=
X-Received: by 2002:a05:600c:1d15:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-48727ee9a7amr146841945e9.16.1774783292450;
        Sun, 29 Mar 2026 04:21:32 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.41.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9403esm84895655e9.1.2026.03.29.04.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 04:21:31 -0700 (PDT)
Message-ID: <7b580a09-672d-4e9a-b2df-0b931d00a5f2@linaro.org>
Date: Sun, 29 Mar 2026 12:21:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 8/9] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
Reply-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-8-e53316d2cc65@ixit.cz>
 <nfc2CPXnL7HNGmguQY70WydVsokdSQ261I11ZurTTGfMaLnHc0UrZH-QO3J-pAeA2hV_ioU_mcW4w7DF5iQKYw==@protonmail.internalid>
 <10c3e5f1-b078-4b48-bfc6-32199270b86b@linaro.org>
Content-Language: en-US
In-Reply-To: <10c3e5f1-b078-4b48-bfc6-32199270b86b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-57509-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[bryan.odonoghue@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 8936E351C74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03/03/2026 09:59, Bryan O'Donoghue wrote:
> On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
>> @bod
>> Proliferating special cases in switch statements on a per-SoC basis is
>> verboten.
> 
> Hmm, your ideas are intriguing to me, and I wish to subscribe to your
> newsletter.
> 
> ---
> bod
> 

@David.

I'm realising my Simpson's reference probably isn't actionable 
development feedback ;)

How about embeddding a pointer to either a DPHY or CPHY init sequence 
somewhere and checking that pointer ?

If it the CPHY init sequence/table in this case, is NULL return 
-EOPTNOTSUPP.

That way instead of constantly extending a switch for each new SoC we 
enumerate a pointer and check that pointer's validity.

Then we have nice clean code which just checks the value of a pointer, 
instead of an ever-growing list of SoCs in a switch.

---
bod


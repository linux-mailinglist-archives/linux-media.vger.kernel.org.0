Return-Path: <linux-media+bounces-54290-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMVKKf6wpmn9SgAAu9opvQ
	(envelope-from <linux-media+bounces-54290-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:59:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE401EC33A
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C98B3058479
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0053D390200;
	Tue,  3 Mar 2026 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rh34oxDD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0F38E5E1
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531953; cv=none; b=TObKl+WK/vwHUPtKY4CcgxbmiIfI/qwzofVhdAL10DqoYFY9yzkt0UewYx6BFfcVHpI6ZAyddFCQ2TKUO9IuLnhSIrfxAuoj8TVnXq+5f6/R9yDoPVhX6cyo+qttsRvJ9pJvDWuYdOnlUN1KvXcsQAb0govt12hbikBnYBHE6Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531953; c=relaxed/simple;
	bh=QGMm0930+mSMs48F38ZiFubmrytzhmnP8xNjA1p9+P8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkxeTTD0NpTttADYLhAh7M0EVTBcu43kU032SsAD5iGur/IIWTxPvNyBdPxXOMfYU4/eeS5P5HaJi6SVbQeWxgPHdGSeOAEypfzzqHv1alR2UsBu0PrEaXkeOXxl5/zd89RTy7nCvmphPE7zGDVLIFWfZ+UU1Y9Zi3N6m3jTYdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rh34oxDD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4399851b14bso3851783f8f.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 01:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531950; x=1773136750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDpYmlYWuGO7Zj9mNcL9eqWVIj/B7W8gyxJf835jpK4=;
        b=rh34oxDDO3Yo/C4e1eTJh9bHQhti2Kon10q8yfvq9QujYV6JDs68elBzrZWUBfPtYG
         AnUTOtelVroue0gs41PaQ2D0gESVpfiDaaSJXYK4GNxF9oVf6E3cJ+SJHuPs/C6EBt25
         UkBZhW+NFjektlgzcUQvkfoaKzNGqSdQFWBl8NgwEZ3FYU/+IYW/WoF3SSfGO8jP1gMJ
         DCvEr4yQjpwfGM7JPfcL8qVUo35SOLnJ16usSR14UfNNAe4aAjqnfkCaioLLkl0FxvoG
         DZCgnfFKWmvVYcuVgBTFl5I+gG0q1v+Tc0AS3hxW3bZwTDMr/WyF8ip9IOQrBJm0xxgn
         Prig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531950; x=1773136750;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDpYmlYWuGO7Zj9mNcL9eqWVIj/B7W8gyxJf835jpK4=;
        b=t+WBQuaSfG1BaJV2PLrRuTWUNoNNVHe2/cHMi7kNu0IIGOIAwL0XogkY7l/QBvrI0H
         IcdG40pjMegIgf7z7G8DRoCYY73A0r8zwdsLLEe9FKAAHba02DpM1eQbwRyHftr9Zk2k
         PHJ37y5KJosGrzn6AnLaOgd9qpBIok0GnIjdUpfdsol3r5WS0iKYW0I6POKkvZSLRmdv
         8bCBv8gt8+EfxiMDzjqvRW4rGFN8cqLLxffd/wJNhD6aVyRvTgJNhfl1H2+0IeD+aWvi
         +VXsiqpRs9qvxKZ6pXT2Ix6U2q9lrpX8A0VzKRewJoTYL2jlhcIju7dLY+VJ0HhPaRft
         a3Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVzTAq1Mm81eptSaXRxLKsBic0MumfwoM4+FVYAdRHfVtidpUZgLjTJKa+Gsi9ELJG7M1m2a4VnJ4eLMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCqixzKmvlpx9wU2l3+LMFsFl9ypDB7yGEhviu/dUJayZudjGe
	f5gzsne5e9lTfrmzALN1Y2vPjACjAA4F/H5qpe1KP/h3tMWELrId39D6p4ycA0N4jW4=
X-Gm-Gg: ATEYQzyZiysrAiM3hRLDgFQzT+/FNaPmohdMH5lv00/Z87VtWmsWB4gPUXu1lgLN9Tq
	Esw2FX2OxWo/5O3X4c8UvKFo87xopACwYPr9vUQlR22Ci/XVtBohaGDFwMne1QJhv0+MkCFpN3Q
	sU89TTUp/crNO6ni/W7lzlzyiweMNl6TEdxMQiSvMUPCdzvvrklPoiWLGkEfzbmmVa3CiSJgmaA
	pDflZlUfmZ0vEiBoN95rQe/VgD2eQAHL6X+k+2PRCtDA+/Pnn1FGtl7ZPrR1oQa770qNjG5J9bj
	TBuO+BBtYq2tMUhoo+eiFT5zQBma+n9gTEuVh2bDZAmWoMx0JyBIb0mwrSw/H8bF4oOpG5kUM7f
	Fcv/NpvWosDD59J7SbPdT2K9IpO9w6/fqs7p/7BZbHid/9b98yDorzaT5+edEcb30s1EGJzzFBe
	e+dsC17uPsS+tSATt35WrFnEZ8UpkZCaK//u1VC/iSA7NqMFidKB4DNq5dXKsZ2skT
X-Received: by 2002:a05:600c:190c:b0:47e:e8c2:905f with SMTP id 5b1f17b1804b1-483c9ba7b9fmr240418195e9.8.1772531950449;
        Tue, 03 Mar 2026 01:59:10 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b44207sm351733085e9.7.2026.03.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:59:09 -0800 (PST)
Message-ID: <10c3e5f1-b078-4b48-bfc6-32199270b86b@linaro.org>
Date: Tue, 3 Mar 2026 09:59:08 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 8/9] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
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
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-8-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-8-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1DE401EC33A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54290-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> @bod
> Proliferating special cases in switch statements on a per-SoC basis is
> verboten.

Hmm, your ideas are intriguing to me, and I wish to subscribe to your 
newsletter.

---
bod


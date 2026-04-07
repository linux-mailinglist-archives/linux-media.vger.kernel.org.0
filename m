Return-Path: <linux-media+bounces-58153-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCmuGKa11GnvwQcAu9opvQ
	(envelope-from <linux-media+bounces-58153-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 09:43:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CD83AAE75
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 09:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3714301A396
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 07:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7963A2551;
	Tue,  7 Apr 2026 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5tZTZ8t"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD97351C09;
	Tue,  7 Apr 2026 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775547792; cv=none; b=XzNYDiiSAP4N9uou9GBJioAj/XV2q63pmFaNDhHFB016ty4LEnXjUkmHY1T1yv7Drmz7sW+Mfioo0mq813SRBGSHF7QscKlJfDYC86Bm0XE1PHYrgKKavjismuz/5V1Y898e2wDIBX18BwcVRCd2rg1wajTEonTkxo1tUtdjZJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775547792; c=relaxed/simple;
	bh=Hk6+VHFenX04clpQAO+mTciYjlspmdalljFSCi4R2lE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kM2Xk7oJUVdRiQqyhirVUttj9FDFlKlWeGRO5sNaMElKgIDoHMy1FSd7urvAJfiJJF2+WiU7vBXOuEKsLp622XYdx7/BIf4U00EgOE+lBlvSHHRm5xLJpFfBznZEQWPAFXpLMRqg2tvPtmabrmkIFiT75tVDZI9iBRBFzC362jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5tZTZ8t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02663C116C6;
	Tue,  7 Apr 2026 07:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775547792;
	bh=Hk6+VHFenX04clpQAO+mTciYjlspmdalljFSCi4R2lE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f5tZTZ8tmknz0ODMnhyBJIAjT0cZAcq9BICzsrVSBsL+tkfWRTImTtDeshkvsQ37E
	 LKba8p0j+msRg1S/CMCwqwb+clJsIgryFfso+qaNbmqeAP6t9baEp/C8yd+lMxSlzq
	 Qg925cf6HQMoy/LsJZxtLW3A0hypkTxwo+6HHlMc2eiHL5XmIH4w9gUtSo9zMSlGBq
	 pScNtGMiFxhnQobv86n3+kmDxo5tR074BabLxcm2vR3j0t+5FwlJQYH5C17ny9XBPy
	 a36tq4avsZPztcMe0OLTQkgbiikTHHle8HHMCTZ3In5en593ajbgCbPqTuilXEPRZu
	 VypIcPaDq5h3Q==
Message-ID: <300fdb0c-3b1c-443c-83b6-9d1d352127bf@kernel.org>
Date: Tue, 7 Apr 2026 08:43:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: qcom: camss: Fix RDI streaming for CSID 680
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Milen Mitkov <quic_mmitkov@quicinc.com>,
 Depeng Shao <quic_depengs@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
 <20260406-camss-rdi-fix-v1-1-d3f8b12473d0@kernel.org>
 <A-DuD16RwvOtjgGY4VILWqm4mQ2smfGOokm9LgPYadMl64lea1MLYte2JQB7iDtuUpzQcMkMIn4pLoPU_em3Bw==@protonmail.internalid>
 <7b349fdc-7a78-4c17-a8ae-2729bc704186@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <7b349fdc-7a78-4c17-a8ae-2729bc704186@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58153-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9CD83AAE75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 06/04/2026 23:41, Vladimir Zapolskiy wrote:
>>           /* Loop through all enabled VCs and configure stream for each */
> The comment should get an update as well, this is applicable and should be done
> for the changes in camss-csid-680.c, camss-csid-gen2.c and camss-csid-gen3.c.

I struggled with the comment myself, it didn't feel strictly necessary 
for a backport but, I take your point, when you read the code the fix 
and the comment should match.

---
bod


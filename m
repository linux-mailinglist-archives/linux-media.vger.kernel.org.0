Return-Path: <linux-media+bounces-62995-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOwKLwzWGGr+nwgAu9opvQ
	(envelope-from <linux-media+bounces-62995-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:55:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3035FB8D2
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8386E304C2FE
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 23:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B2036DA1D;
	Thu, 28 May 2026 23:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gn5v7Vyz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896852E7378;
	Thu, 28 May 2026 23:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780012519; cv=none; b=R+I1iae5cTwqgcurhWNvObPnLTw2+62WGx/8iDboqnDyKg+aXnY4dMCsbTjODlNN495+NfsTf5PiZa6azoMVPU0o8n4rvidz99ga3SD6Qnaljrz5i4Oh4WxL8fK/3E9JCZ+pnJIUhdJhKQFfXzm/QjowsQD/DCsV3OywO0AAxMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780012519; c=relaxed/simple;
	bh=UEhzhUG6MuaaQp0VMyiOLTlOoWY2syRFycF3haAGw4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9ZwEPI2YVyz9itGQWXhvLQ1P8Z4ARUaMsq6+7RC8kOHRcbDjwfuiJ90szYXUcbs4BSJ8ufZuLhwfYJopbhdceJKaEoUOAgOS8MS8BNchqRLLRRSUHJkmo5X/0gYvQPHR5e3brYok4NxLBRynsYC7gLClAhDgqZPHvoimL0ICO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gn5v7Vyz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1DB1F000E9;
	Thu, 28 May 2026 23:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780012517;
	bh=LuxiVg7J0hcoJ8Jco36VJv70g3FFfV7NBvKZ/uFTah8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Gn5v7Vyz3ldrx2s22pqLmzfOYjEzApo5CUfnJnFXQJQMDSiFITr1i+xPsXEwu2nDd
	 g/+AkHgYp1dVBb5ZjZBZqEzvC8f71OmZC47G8M2e0eHTtPaqVYMjvzq19bDqwMTA4g
	 Mk3Bu41IVaDWKavmIS73O8D6zrJoQUVxHTWORv1fjXMjQV+BjQSdulrgby9ArPiX1O
	 6iyVZ44oJHgMkIBiBaPgp7ibwJFGXqoHubejKhPtFpPz9oorKw1fZrQXOas8hCA1+4
	 QUN0UMVsJkyhJR0ZI2i0HDV/cmCtNytUPxbBIoblMOiewCj+daCWVNenyFOHqBzAQP
	 JVnfF42RelqQA==
Message-ID: <4e535b56-7b3d-4092-8771-29dd80bea51f@kernel.org>
Date: Fri, 29 May 2026 00:55:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
 <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
 <feb42925-5704-4266-8c3f-aa944fdbed28@oss.qualcomm.com>
 <12da2953-fe51-4999-9656-2b42a7897f91@oss.qualcomm.com>
 <efC8INpvkG_mAgqLbYhrbzK6YdrI2L5YqirkR-XmEUNUHBJEdy2HX88teurkzomPqbYeN9B52038o5MvEzfIqg==@protonmail.internalid>
 <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62995-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BF3035FB8D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 28/05/2026 14:26, Neil Armstrong wrote:
> I'll test it on the Hamoa T14S I have which should be the closest to purwa,
> but it uses the same driver setup as SM8550 so I expected it to work the same.

Is purwa Iris upstream yet ?

It your series works on Hamoa, I see no good reason to gate it further 
for !upstream Purwa.

---
bod


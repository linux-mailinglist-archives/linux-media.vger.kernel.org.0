Return-Path: <linux-media+bounces-58364-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DrdNc3N12mrTAgAu9opvQ
	(envelope-from <linux-media+bounces-58364-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 18:03:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E303CD4DB
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 18:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EEAD3025C51
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 15:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF232E7621;
	Thu,  9 Apr 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEO6YDau"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CA4322A
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750050; cv=none; b=TeGgATiWu63buEIMRALbei7G0lyp90/IKa+/GQTCG5+/p5faF1yaW8x2B0U5CWwQdWv5pv1QMAThIVNk6wtp9r9QCDXVisOmGFeaJ+FsqqKVT7CN/Qo7a6eDoKcKjNrNa+b2m/JTFxqsr1d+GOFrBOMKEAc3nWAmVjAWTvI0A6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750050; c=relaxed/simple;
	bh=JaKWtpj7aYsMt3Ph+9iFB5XTzYl3apA/279VbkyHog0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NU2b4DlNAnYP3of+tmQFMrdHnCh8L4eqdVE+e/WTKsYR2r9eF/7u48xGYy/W6PF2HDlnNSYmUx+6etdnUpNc+FkGNrRkNxJoNx3JY30G+ZUFaqK2uTWZZNgBjXk7VRDaGg7mcT9YqTpz4lO5BjGCinoYUFbi/+CgLZMpwu9JmEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IEO6YDau; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38cbfb1322aso1254861fa.3
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 08:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775750047; x=1776354847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3M56rBEz5OeVU8uz5WV+I+bOdPl8DKhX5/Z1vQpWSE=;
        b=IEO6YDauyyG+fj4W5uFBfB+k3DTXJXRrA2mmrPhzG/XGRGXiC8fzqr/tbkUs+ikzCo
         ACqtPil47uYkVxllLk6kwo/yK2dhY7eJNhQBYbgxfIAwfdh1faEPQRGrgrJBSmkTgjJx
         1KMaBOXGJSvqeP9vmBSMMwTKU16nzgm2KoWbo/eMMDxww7fd6Wg3eKABpQPVixUaMNge
         E+s4oc+5C2w5IhaoyHhtin/fAGV2aIhfH3UJ2Ts4D3osA3OIUpRSlJSynqTmD9xe9A9d
         RiFa4EemnqzeR24q0oO4Qvvzg6M22YChYoKFwi3GQdLYi79gm6MSheg1seERpN4eji2w
         RnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750047; x=1776354847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3M56rBEz5OeVU8uz5WV+I+bOdPl8DKhX5/Z1vQpWSE=;
        b=K334bOGuJmbOu6uklrkC93+DNHwoqyDEQhHqxKwI/5o9qMbcZzx1K1glCQY0LOVbt5
         nUm61jNoO2hUM3CeQLVz9Efk5mVJAM7BGS784aQr1Gwhgatab1gPnuIoZ5LDypVPMern
         mjOREPWGPSMrY9X69a48QSGaICiuEmCSfUoUz9K/oRPCDffRQENbUumZCA8ILq4RdgH6
         cX+OrMexakZdPcy9v/CpXKAemqs4Cop3BYRvHyyG0hilQts+N0uFjTIa0POEVgMNVsnR
         gJR/BxJmHdIiEenZFJFCL4swi5yZljQ+KcsI/guF886d9HfkXPy/THzE5/CV9PaqnzNm
         9NLQ==
X-Gm-Message-State: AOJu0YwVQuCwxTleKkbr1u1IvB0ZISqSBSDgUsdU4TRkfKI1cUc7yDRb
	F3t/fMjN7pZ5h9cOUblGz52BRaV7uFkOVXMtQSTD5lnnDGT7M9hKSpT1u2TSBYcXJdk=
X-Gm-Gg: AeBDiesjSc3PSOxfsKkkWBezdM0HiKQjrEgE2RW+DJNijmyrSoBSIu4TNZ7hIjlzekv
	fRjjikBxHJzXZwiJmZjC3OJd8juF/1iPGWtiAYsnda+rnT0FbsLv7pJXhK8kIJ0ieVUegCmWXxY
	LmVerPbS1j19wyvh3dAIgs9Oj9P2Mvr46NFg4TZOGM5XMp89Iljy3UeG5DKvdUS/oWA+kjaG0s4
	jirI3aoAJcrC09Lx5D76uY9/UUCJa7nnVbxFaOEjNYVE6Kg0dZmf6RaK3v95j+WVI5hApylpL9R
	jL/0aPs+zIfWIpPAeqxy5OnNQmACpRmifzDy8oqn37a0qhM4VydZs13zBcoXqpNJKPqhiaowSVJ
	N9JYHHn2xmTTccpQosyusAiZbqViQNDimokxm2cVo9wsMjpd58JK93v3mgkiIzSUNPrHAyFXbCf
	TZ5tKvKIjzxwfZlbBrfT1Juf7YxXh4pxlOTVpSobE8A3O8W+IOM2AAMus89ydr9tsHl8XniwnSv
	RuyGw==
X-Received: by 2002:a2e:be2b:0:b0:38a:325a:8a0b with SMTP id 38308e7fff4ca-38d91d47942mr33866011fa.5.1775750046530;
        Thu, 09 Apr 2026 08:54:06 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495ae96fsm205631fa.39.2026.04.09.08.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:54:06 -0700 (PDT)
Message-ID: <9e4b94f8-7792-4310-bcde-b8a810d18e8c@linaro.org>
Date: Thu, 9 Apr 2026 18:54:03 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: qcom: camss: Fix RDI streaming for CSID
 GEN3
To: bod@kernel.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
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
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org>
 <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58364-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 70E303CD4DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 13:34, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern we
> have replicated throughout CAMSS where we use the VC number to populate
> both the VC fields and port fields of the CSID means that in practice only
> VC = 0 on CSIDn:RDI0 to VFEn:RDI0 works.
> 
> Fix that for CSID gen3 by separating VC and port. Fix to VC zero as a
> bugfix we will look to properly populate the VC field with follow on
> patches later.
> 
> Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir


Return-Path: <linux-media+bounces-63825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RYzAENWUIWo0JQEAu9opvQ
	(envelope-from <linux-media+bounces-63825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 17:08:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA1D641397
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 17:08:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TTZ98TBV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63825-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63825-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 534583114E90
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 14:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6412F8EAC;
	Thu,  4 Jun 2026 14:55:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B80E2F8E81
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 14:55:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584935; cv=pass; b=MC+8gzGhHrRIowwhkbdN4bxjDYVbr/C4SQVqEHvyBfPtzTAXuckHxfjwAvuWjzO14tiLUuv9XPF0/RnsJP2pBMN7xOepeEsFMwTp9fr3Tba/oqzVgbDEA5gafJssFJZr4hsTtIBi0I0dBT/T8K+Tmkc3ald9jD1sHjcK+uLM1Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584935; c=relaxed/simple;
	bh=Al48EUUpHFOBNoazSNQ3w0GJbDD5l7GFv4gIU4jH/4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+R98My1ZmWEAiMXNgbPquCGd9JLctTOiFEPmfzoWN+OTWAOm5zx3gnafiEA9WIVt8Mhe/hk/Ypy+xXZ9NBJCN/p7HCVkpbyxENU1ZZE1r/wNDNEpaEnmELZdOM/rMeYrcNStreQY8oCNWai+oVgR38EYwtSi4NdYsMTB8/JVkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTZ98TBV; arc=pass smtp.client-ip=209.85.210.66
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7e6da33a561so614583a34.3
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 07:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780584933; cv=none;
        d=google.com; s=arc-20240605;
        b=NPdrJMYmC+RrJEJZkZCDtR+GMWoROFuDx6GSq3YDvAhsmg+kQqQy6kUEM/bGCzx1cO
         LVBusmJAwqtvbGaIYXcyoG0vclDwFsyGiNe9eoaa/mB0n3RFpaLYYCyCQyQcrFflzbZi
         LbJf/3IxbzJtQrQ1Tkz3VepYQWsaApn/Gi30Cf3Baq55BRSRdUrOqqOiz+Ev+7dUL/pJ
         m2GZaYuM95eVQcPILXSsJmsm51CVmxyqVZt2o1hJhbCiBn96S78A5E2qzjz7HVpOfUdP
         UU5idAAXS7SiM3c6baWxijLkw87oShVSHaqVQI2QWLEntNH+h+CdYhlefTpP1pBuEhdw
         4vrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Al48EUUpHFOBNoazSNQ3w0GJbDD5l7GFv4gIU4jH/4A=;
        fh=Jl4uSOJkoccpN62yDBQehJxVwE6B/a4iONt8pw2Wxiw=;
        b=fnaJllvEEb2wXJBA1MRPY8/lH6I99GMU0Mr7YvNpVNhjEOhp9x6Gwc70AlFEmzPkAq
         51VLXkgTsQwxjOlf0inUj83bcwAVDyFZd2psu+/tZuj1gP8SVwIyUScz3+1Vt7vSplQH
         XVM6U+ABUNg3m0bhwApcIg3jzsJkHcmfm+8rlRbjM+Y2ex1AsFsEa2hr+t88CfLtpivX
         jgpRjDvLxyzZIXt0ke042njDM8T6fYeHUddl9Xo9B3vf6bL9GHy3F1zdnu3li/VvVN5Z
         U4ba/u37TLCI31tbolpoy1hcsmBnUno5t7k9HIhF8i+kISJ1U3ZW/vlgZbzfR26s0CPb
         PPRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584933; x=1781189733; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Al48EUUpHFOBNoazSNQ3w0GJbDD5l7GFv4gIU4jH/4A=;
        b=TTZ98TBVT44/ozRQoZec2iKAuFhvAlXPFBu/5/57rahrxHNhHhhhwpAeeba+oDUcGf
         VPW+kIJ5IUq4zMZKIBzJLgQ3OIw1vmjBl1kLEUmMBKCMdZIF6Bfe67z32wuZK2GCouTz
         BcSb1i/8VwwK/DLlV9K7NlGRgiyiAiQ4ocjAF89wvWbhnjSauBOxJ36IIk1dAv3ZDrog
         KWZFgN90AHlG8Kdh/revQ3lR3VnFV9Yls0Q6wWwXYShNNZSHeyh3VvXpAmDzPZGNGR1A
         7cH/ekv5he7PE1Z+GXHqjYOpwXQ3Po5pL0iRPG2SHPy/Z10AZlSj5V26aCMwd09CiI0H
         HXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584933; x=1781189733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al48EUUpHFOBNoazSNQ3w0GJbDD5l7GFv4gIU4jH/4A=;
        b=P3G5dclyhlQpRLHh4zgUHpudqIIhJvO/LmNZHLYLcliMcpWHn0f7wJLYFYWCAvzdXx
         4Q1bI+lytPLe8Yy6uARQnRlUhAbdpyvZaF79LNe6CqAP1TWwamfZGekY9u5lNQ1gGLu1
         oq4PPUTF1nOTURPaE+dCkgUVZzzrxtrTnrgPLTnIXg2rnr35eAcumd4xzMtM885kng5z
         nIm4uk/lEVB5SMC2eibRXT1vz7o6djhhtBKbgSyoI7c2w3YJnpSj7QMSbDQFkKUYq64V
         lyC3Q4RjphJ9Y1CJMf/+WVLS91LEmDIwX4gkImWg0rhM7QQv95ei9NV3jCbIZ8g9g1gt
         1UnA==
X-Forwarded-Encrypted: i=1; AFNElJ8EnJyTfo4Wt4MGAWJuG/ND963SgLGnqg1Nt6BXlMocidQmfBAVqnh7VAwgTPxlwHmvY6rsk128VCLHfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5PTA7ujndZdaL7udTRSlFuYlT00rB73qsZK49qUBO1GxPTjS1
	AZLdBykYV2AVzhCSG/YdHr5u4hT5UrbvZRK4EWopOtiZCnDtEF4DMxH+Cp9B1JpqI1OgBfKT4vx
	SkPfUssvk+Rcax7aeTKbwW+JmuOXhleM=
X-Gm-Gg: Acq92OHVOZEGM1y7zoFKpw6R1xmMKM8ogZ4Pan06iB3cnduToHRg6G+fCP4krm2Zh3n
	F4Jeu+RDY6ywOvMaQaYIyWrLf52KRBTFETnmE2VlT5ecW16uTn8XkPwWAReYonb2qSfCXZEVcK0
	v+6UD5VqKFbyUvmaD1FPW0OHF8uSzSfTyJGpa7U4SUUQmkhB8NnFEW8gwfnVKmBU5CSuWDA6g/R
	5QgIcvA9pdxXNMq+QmRnnnefuxn/Z2h7PP8mv1IejOvOYF4c8cOKI+1bqB8V9cAjhkA79g5JfY1
	ZK5sTb3lPvAWKWjWcFMAj9Ds0AE+ZaUA30gAIf5u2xJkWh6cYO5SVv5j6QrkkA==
X-Received: by 2002:a05:6830:448f:b0:7dc:d7e8:cb30 with SMTP id
 46e09a7af769-7e6e9e95434mr5044704a34.26.1780584933287; Thu, 04 Jun 2026
 07:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604082510.45733-1-dennylin0707@gmail.com> <agginfn3jo7df7bozpqvggg3rt5fudmh2jwewj37jhkbw3ynhv@demyhaltbpwg>
In-Reply-To: <agginfn3jo7df7bozpqvggg3rt5fudmh2jwewj37jhkbw3ynhv@demyhaltbpwg>
From: Denny Lin <dennylin0707@gmail.com>
Date: Thu, 4 Jun 2026 07:55:21 -0700
X-Gm-Features: AVHnY4K6-C40jVJeanD5_pIjO9t6SQxED5qewSJtKlwbfYq_FUBkTGvMfcGGalQ
Message-ID: <CAGEkeHfAxJUyiaJs7wLb9hX0hsxO-xbPnkQ5LQx800wJZdzoWw@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63825-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCA1D641397

> Please clarfiy why you are performing the changes instead of describing
> the changes on their own. There should be no IRQs coming from the device
> if it is not active.

My concern was a possible ordering where:

T1:
iris_hfi_isr()
-> return IRQ_WAKE_THREAD

T2:
iris_pm_suspend()
-> iris_hfi_pm_suspend()
-> iris_vpu_power_off()
-> power down the VPU

T3:
iris_hfi_isr_handler()
-> iris_vpu_clear_interrupt(core)

Am I missing something that prevents this ordering from occurring?

Thanks,
Hungyu


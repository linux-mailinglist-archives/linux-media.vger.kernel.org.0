Return-Path: <linux-media+bounces-53403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG1gEGgzn2lXZQQAu9opvQ
	(envelope-from <linux-media+bounces-53403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 18:37:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D71FD19BA7E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 18:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBF753012261
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 17:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258673DA7C9;
	Wed, 25 Feb 2026 17:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AS1GkDtK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D413D5230
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041053; cv=none; b=qQItDqIT1/mfLB5VhU8T6CmHQgj+nPSRj8W05P6nCKiig0xR5zsPM0TDJ1+22ttunS/eGygpMy4m4DLAlWSZM1tQ8k1ZDocIK7rCW+ODFhyRQ+BH1kyWXcQ/E4bAiAAxWtdOK9scgonyCB65o8JEgkZhiPJrQydepmxIJPbZtho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041053; c=relaxed/simple;
	bh=kv/A2EIN0uhCCReZv0n1i5Fr/U77+NnW52CPmq472XE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdhTrEd0Ml3jSEtzBnm9WX7FiMqTQROfdWQnZX2HKowcoiraTwQ7U/tiYdXBxmpGND8+GwE9qUQcQ794FpJUWOb+8ywDqFNLgC2hNECaIkJaoPYBnQ5RqrWz8EfoBKYQrjbCrHvUceW6ZT1CdmAsvIiMSzsosZT2v9noTlIGS2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AS1GkDtK; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a1067be982so25322e87.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 09:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772041050; x=1772645850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hGPEVWznUxuljKqRh9MZjaJpnthDr8IRzBmoNyGFLk=;
        b=AS1GkDtKQspsMwNbHmkVev5MBHFUQXzLoy/FwJjVHUXIY1+TMhb5LRSposI09+l2bG
         KQiVJEtgDYM+sWL7+nCOYwqunR9owZyiVLwgeEYkbpSeb7r+n7JSp3+vvCu1Jmu1SsKg
         WtOpbkP4JCzPW4/ScVg5CAgNGbt7fd/IClx+jR4bBwmNppWfQblQegziOeKemrjEiFhB
         9WaI1Ry0SmlHCv6ce677q6pVM+q4+f9HWYTiEyHUHF4i/rYINzWN53saKBQZInLXADzC
         mV5bvDqAIRo+6P3P4FquxutrhFSR0aUFwAEPvRgCTBc7tZ9QagCyvRnOTyCQXUTPqnKT
         LLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041050; x=1772645850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2hGPEVWznUxuljKqRh9MZjaJpnthDr8IRzBmoNyGFLk=;
        b=RZanE3m+mYhRX2z5Ni0NyQSJX5RafbIkPmt8tH8zwwfF/jLLJDHhFBX/MQkQVkXWSZ
         MexZDPVVgHQcqs9j4Ab/QFNn3Yf5G0ndmcYQaGDd8Kyfo7APS016RHTnHKTWZtarog93
         cbwfZeeepaV9Ytrs0aJJKExiVPapAb1jVZBfLflApPiuWMB9H3+JTnl5E3pRCZ0ODlea
         r23vIKmBYYjrt2UGRpCQBUgCT1aaL8RWoJxAz/Rg9PUw0FV6eq/yhLd5Fhri1/N4xzle
         3838yVmmY2IoZvMpXpAu9N+4ue+Nr3p5ryWAQ0gNC+aMkcTca/Ngw0cFxKXv1uKvsd1E
         4rkw==
X-Gm-Message-State: AOJu0YwOHcE4mj7/1S5H23CxxRXDCRAUWj2s/YKpZe97fW9vscnkdwaY
	5ts8Z3cNKL+uZqNGWikeWjfdC/gqylq5q5YoAAXIx9LvMbVaEd8+HbAXtR22SNe14xE=
X-Gm-Gg: ATEYQzzb+lf/Ufq06ASUl1vChXoSopDdJeozOWHz55rWT8Us7HVtO+qOCmlCBy9HS0m
	bs90PNphho34XUYvqKV8vAM1qhzWc+0Z35ZC+ZULShlxQGvF2NIuuerPhzJzUL0hHAZWpok5oEF
	bzf0GqoZMuQevXNYZFGApZAC+3VNoEc0XiLtWMYoybq2+Ue+nNpN/7vntMBSacnOvmSc0C85ECn
	wL3NrPz6qQn5v3DmCoXfDmrao4vvGd1jharjSCytygW9L16Mo7XbBwOmIjGgZt7PgJNpV/vlY5H
	hSAyb1ah0h3Q05VmeKAYq3iqfeIpkLn6GTXn6dJmnsH+7tkQPnN9LXmJtYvOxyV1QkR7AuSZN8y
	25ut4PfPYxnhK+aBIBt5H6PFsW8wMonsI6IcVRsy6y50eg0lI3eTHMnMTIFCew+OEfDSyZrcNY4
	U1x+aKw8dvDhoq6UyQXTC5QE9p4JkhDOenX2IVN+DN2Z6SHzwMd8hobOyn64Z1g4GxwVt45qDUD
	JxQWg==
X-Received: by 2002:a05:651c:31d4:b0:385:fbff:ab38 with SMTP id 38308e7fff4ca-389a5ba336cmr28781451fa.3.1772041050307;
        Wed, 25 Feb 2026 09:37:30 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389eb265625sm3386641fa.23.2026.02.25.09.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:37:29 -0800 (PST)
Message-ID: <95b16445-318c-4ccf-8e17-c7c40f8b3828@linaro.org>
Date: Wed, 25 Feb 2026 19:37:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as a CAMSS patch reviewer
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260225151446.766586-1-loic.poulain@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260225151446.766586-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,cisco.com];
	TAGGED_FROM(0.00)[bounces-53403-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D71FD19BA7E
X-Rspamd-Action: no action

On 2/25/26 17:14, Loic Poulain wrote:
> Add myself as a reviewer of Qualcomm CAMSS subsystem patches
> and delete inactive maintainers (Todor & Robert).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   MAINTAINERS | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e08767323763..b7a79a8fd730 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21390,10 +21390,9 @@ F:	drivers/bluetooth/btqcomsmd.c
>   F:	drivers/bluetooth/hci_qca.c
>   
>   QUALCOMM CAMERA SUBSYSTEM DRIVER
> -M:	Robert Foss <rfoss@kernel.org>
> -M:	Todor Tomov <todor.too@gmail.com>
>   M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>   R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +R:	Loic Poulain <loic.poulain@oss.qualcomm.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/admin-guide/media/qcom_camss.rst

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir


Return-Path: <linux-media+bounces-63400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XIABFnvvHmrWZQAAu9opvQ
	(envelope-from <linux-media+bounces-63400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 16:58:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8404162F867
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 16:58:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Br8bOSL2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63400-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63400-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6579C34014E2
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 14:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1892438A72F;
	Tue,  2 Jun 2026 14:46:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4043B6348
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 14:46:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411604; cv=none; b=ueM/Rjj3WNrAlqSodQ37dT5Zhl+baVCKYvw049jbaR2CLY2P7gcRi9NkP/EwWK4icIIIpz9OOb9acxY2a4wnUlPDEAMHtmRn4a+KV08Mkj1Lb9tqsxxMveHq1IxLBEITICUNXJaWoaxHs/BblLigsfwYxZu732vQNbBeryHn6m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411604; c=relaxed/simple;
	bh=kKsyUzj869JrUGC6zdwIqfY+nNrtAeCgbmcr9S0WYKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ake5v55itf2qlnaFGVXCyotjj/00B/xGtC6bVp5ovl4j9QEVmrlL0rFG/nf6+gk8OkGdsvuMM8m0wKkZr6SyKFYuHKXj/N0Ayd52OcqueH79uq4t89+Y0nBDXEeZs63ENAnFSuC6XmkOFkOIvqgFq6EhTNzvzwT8O1gBGeM9B3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Br8bOSL2; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b3637b90so5819805e9.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780411601; x=1781016401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zuifNF0SxFncxgo58XRKOiC8D290RPKvYCe5WMAJN5c=;
        b=Br8bOSL28qGL1cENEQMNVdVs3P0P0J/TueJheMx6YOLcLrw45dr2aeISsSxDuhuSKI
         l3owqoaXuYsVoYVqdjKYFAy1n3BGdNCjuoWTc3jTG3CPCXDsHCGSbwz9OelpO6USQHuo
         eJ6nyaoaRWefdJv54CBimNYmt3eULYiYo8ouxBLdT5YZOPWNcmeQq4PgqOLz4ZguDyez
         5ivaNAsQJIGt8gf11flxL9PbzQpGuytFHbbE2v3eQv7mdpxR5B0qXP3WYD2QdwoX4jsA
         MVrDBPWvwL/30CaGsEHvR98LlHKAtUFbUjX6JNo/IgZ6P4lp+fENkIALUTrt/KUXz2i8
         9Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780411601; x=1781016401;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuifNF0SxFncxgo58XRKOiC8D290RPKvYCe5WMAJN5c=;
        b=mMWKcR+X/1A50gcXcwcRG40VgsKd9TJROXb0gQ7gyeuJ9wCKLwQ76dFsqt0zJDtScv
         Pi87cUjktTOdOabTI7ildLB3IbfBSk3BTypXfxFgNfLFDRwIPJIKTBUU0tGRlyIogB8W
         Nd4gUOgXiwirhc1/4ssfkONwrFvjfX8vc0lSevvb0Zl9oYhIIP5qNEsfzsQ9ahJKsk3P
         IatSWH7doMQkOuykAJ0UQGrNbGJUdC0XbV4npG1hEJ+Y/MeVgtjMfr9U9ABPCGlcDy0G
         iPjw0+VCCVsfZxZocKjGpOes1JAvM7OPNb29m2wVFft4XxDRGwoUw/MvWPiRHeyaiYNb
         lvFw==
X-Gm-Message-State: AOJu0Yyga2MEER1rnHXAjivtEL+0k3XSQTTd9s8uWH1n3yU+X5tKVhkA
	BQMuPX2JWtgPMrt4z0IMcOqXrgA29hlsDPJ2wUjkDktEmZfrbL/p1Tv/5Psi73iNkNk=
X-Gm-Gg: Acq92OGLmadrQiua48I9cA9Ep6d7b72ewbWwdtLwx9d8qnFg0QKBRdb454bluIohWrB
	uOqQAxRVg/EMOT9VYMIqL/sLY8f4EcAXCmVKCO6dzTmzKiG2Q7WeH7NgdDJdIaxRbJDLfpUhQYc
	frmncA/Y+MI/1RTa5jEgv031rQ+tHC/j/pKsGOz7ijQJ4tl7D3wQGJpWKnu0PBDtEJNfDZExNK+
	zNX6SQw2V0QUwo28hKlj2/2pZSUCNGd8/aEnQSc7xH87QoehGPBUeSszG2Zp80En/srpoRfMrbA
	PHSDl4RW3pTQt39TLEXONRoTdkZXus1qVa7FoUO/lV+56H6UKAO5cuNt7lfel35YARVJLkbdKs9
	H7iGgqIEcFGD9fEM+7OThjhv3ir/rcS4LIWli2fkGY8Zl5wZqUROf4/o+sB7IDNq0F1GkloPfAD
	gEjrs0J0aV9c8gpyyAqBH+zdilTYYSW5uhTbDVsCZemkLWng==
X-Received: by 2002:a05:600c:4e52:b0:490:6237:521d with SMTP id 5b1f17b1804b1-490b5080198mr835365e9.13.1780411601411;
        Tue, 02 Jun 2026 07:46:41 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e76153sm73707925e9.11.2026.06.02.07.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 07:46:40 -0700 (PDT)
Message-ID: <e2943036-1347-43db-831b-672b87b538fc@linaro.org>
Date: Tue, 2 Jun 2026 15:46:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Enumerate cap->bus_info to differentiate
 between encoder and decoder
To: sashiko-reviews@lists.linux.dev
Cc: linux-media@vger.kernel.org
References: <20260602-iris-simple-name-fix-ci-check-v1-1-5ec9d0d00983@linaro.org>
 <20260602141154.4C8EA1F00893@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260602141154.4C8EA1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63400-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8404162F867

On 02/06/2026 15:11, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This is a pre-existing issue, but this code brings attention to a race
> condition in the device initialization where video_drvdata() can return a
> null pointer.
> 
> In iris_register_video_device(), video_register_device() is called before
> video_set_drvdata():
> 
> drivers/media/platform/qcom/iris/iris_probe.c:iris_register_video_device() {
> 	...
> 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> 	if (ret)
> 		goto err_vdev_release;
> 
> 	video_set_drvdata(vdev, core);
> 	...
> }
> 
> Calling video_register_device() immediately makes the v4l2 device node
> accessible to userspace.
> 
> If a userspace process races to open the device node before
> video_set_drvdata() executes, iris_open() will be invoked and
> video_drvdata(filp) will return a null pointer.
> 
> This null pointer is then dereferenced in
> pm_runtime_resume_and_get(core->dev), resulting in a kernel panic.
> 
> Should the driver data be set before registering the video device to prevent
> userspace from triggering this?

This is actually a nice catch.

This fix is fine irrespective of any other code, getting the neural 
networks to flag existing stuff is useful, so long as the reviewer 
doesn't just look at red dots in the Sashiko board.

I'll be sure to flag that fact to myself and thx Sashiko follow up on 
this bug you've (its?) found.

---
bod


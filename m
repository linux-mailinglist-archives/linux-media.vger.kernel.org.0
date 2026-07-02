Return-Path: <linux-media+bounces-66312-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mEWeFzEVRmoTJgsAu9opvQ
	(envelope-from <linux-media+bounces-66312-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 09:37:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C56EC6F4423
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 09:37:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=P5+2GMJh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66312-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66312-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E7863116B2A
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 07:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2C43932C6;
	Thu,  2 Jul 2026 07:30:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC1B3921DB
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 07:30:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977450; cv=pass; b=fV9D6DIOApWCgt0houCayi//oG+p2f/0aH0Jv8uJwb8gPFcH675zubLdJpJeEW3vaLoynn0jKy2NyTobwI8SAJgMWjfTpVxQ1JmygYdJfhhmeWqJJBy7e9vt+1/IWYhIYuKSDVG6+YIi1phE4At3D85Jx+HPZ1+fMqGQwD3B4ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977450; c=relaxed/simple;
	bh=bPjlkXbnQLrb0GjdrGJjWhBHHs97vCsRJMBEH+qH2Lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQIuImVfCbe5eXNQ6YszXpiUcQGaQ3j8JyzvqLwEglYkP1BPBHW49Ctxa45kPEC1fQorf/iMPQogR9mWnVe0ni4sjsIRfFzREt5omF+Xz5jY2t99/qFuYoWPdRdtNuTFIpnlYQ5WT5id2LH/KtC5JsVe2qhmfCPnEi3JsL9NxzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5+2GMJh; arc=pass smtp.client-ip=209.85.208.48
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-698b558a792so242400a12.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 00:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782977447; cv=none;
        d=google.com; s=arc-20260327;
        b=emhqVAkqc6G5AgPWYGwpJ4z5KsLsFyYeDVMfFH44gh+f21Mtyr76YfDlP6eYYKNr+7
         PQS4JjKsG5rGz5uKqgqYfJTXU/lkCbdt8V+ImQQod8jIFQr8kbohbj3QSQscuLMRd/iU
         oUe0oFaVh2VDhxFEcuV8f2sCZsEXjUHLWxofaqSZvGaRT830dh4chgQnsk1mccuhiyzB
         YSobJUbqo+KwqktKzq91ceNsJJUDIWFa4WYIjLbDlhYYJsP05B642ZE+8E+DpaV3kMw9
         iUh8wyLCaIcrPpYouEwbi9euNwLazcEUBZrznmZTahWcBfKA/FlW10dH7OApy/SGcIIb
         e/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bPjlkXbnQLrb0GjdrGJjWhBHHs97vCsRJMBEH+qH2Lo=;
        fh=xbvshBNvb9cP/7oPKWggq9TyIpchUu54LaxGivOE8G4=;
        b=ruYc9Z0LLX66Zwykb9aUFmFEnTtVqhcqsGmmahrTJDZkYE7YTEZkTfJ8DTQDhkajAz
         hdYW+gTHqCF9cmICnck8Wjvra6mwjrZkcSNzVxhAtuiqelVmLVNqgrxJPtppLgGRRo0Q
         pT3UYDIKBKrfvNtSohwdWBl3kMYACffc22yD1zoGdFpysCRKqmzmlB0KT/BdZVioyiKO
         6KP4J9KHqdYeyCGk/StBbOOpYssPtZgZeH47LhLuBVKmv5M96vqKHiRNu7MKq8d8b76T
         D3CEp+pjgXG2ygGpdpCWnkuVPRnPBp+t7hKkCMH/MCLM+TbaZARc+KlW/4oFaGwKw5Jd
         L7eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977447; x=1783582247; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bPjlkXbnQLrb0GjdrGJjWhBHHs97vCsRJMBEH+qH2Lo=;
        b=P5+2GMJh2KEmUu/e4RguYrTFD78M03iYeNhDSCmYsvhzNB5+uiCdQ3fF9JUa2U/tWM
         Y5BRqZa0OzHWFFC/ykj7KRln4U5o1l8k89cHBbIj8aFLQNZ/+GFC7N2d9ECe67KXVRYP
         jTWEevdA7NHgRz3LvuoBV0tOLnqlkLTEO1IIElle661gX+A23sGZipA7lbwSQXoA5ysu
         amiPcva7S7Rg7fXVfSqa3ag/Q05Jo4HdJ3volciuZsJjnxK5OwPIhhAzvL/X4viHScjh
         X7q1UD9goyRb7iTLd8fWhQu/k4lW3rBvXqfd2sgglCQaKgC5dM+MgY+Egv/ulAQ2FSJk
         W7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977447; x=1783582247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPjlkXbnQLrb0GjdrGJjWhBHHs97vCsRJMBEH+qH2Lo=;
        b=PaRIewKUNjDyvDMXHY0vVoi/H17+UEZ4nikVH4DWlEc3sXAFm+NwfymZOGRHrWX2tA
         VS8dSZB8EXB53DpRDRfKdqr2QmZDrWIZC3GpLXS5IKtTkYRlzZuq05qdUSlEO4O9hGZU
         oiu8lzxyeZHhO5qMeGrebqZektMtRHfJgwQ1kJWQJvcROj2rrgDni+Xi83BnmpRyoeLh
         wQ8MFGLTLclxHT+5YBazLfV5lpMGPVWQk+Gds6OpegRZsPPlSpAcgV/P/aiW22Mgv7Pi
         CY3egvQlWWcSVsbWTXwiLiaWeKBBxgtYeDc37zNrZr3VOCtzCsBBtdDAU1DK5+ObdcL0
         0F9A==
X-Forwarded-Encrypted: i=1; AHgh+Rqo/hojBhOwapLXZ38w4Vy1qfRgpcY+77kFcQPnbW9wVMiLrjF8LpZG10Z6OAVa1oJSl6vWsyQZ51QoKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+40VXrD3ws3mztLSE//Fyf2TDhCzXZ/uTQdx1NCrhRpTITH6F
	TYwDxCL+IX/Ol+KGVib2oycGeco8/k5nhDgsokcdasq1SXmTRaQF+LEorv03Ogm4ikPD3thbUqC
	SoyRQhZV/kt3P52DzO7MqhvVwPyGgheE=
X-Gm-Gg: AfdE7ckPoYDilY94+VtThcQE20TPgWlop9l0U0ZA9m7aV72mLKSDcTP2ZFc2BCOfWQR
	N5ETWWnmc7SA45LWHJ14kfyLJgSCEQGET8ryaP3Kpst1O7yw2edECm0xHrkKxuxdDK9iCebmeD1
	b2rWXagLSef92mM27oZmsEnvsCDmqnL9CMuzmMcHlHGFNEHF8NR5CzS2QJLDqUd+XrvpX8R5PcC
	Ez1/SzoO00tjZQOxUvV3dZzI6yY6SdJdGBLMtaUVnJoCEfqATw6CnO7wkFsZ8jFaFY9Ya4sOdnB
	kAPZ0vBSv5svPE78YCYF8GY0RDeOCVXy9CUWOozV1rMGbG+LnX54NW/67MxXx6Q=
X-Received: by 2002:a17:907:3cc3:b0:c12:83db:e3ea with SMTP id
 a640c23a62f3a-c12aa14229cmr227716866b.41.1782977447153; Thu, 02 Jul 2026
 00:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
 <20260702-hm1092-driver-v2-1-4f9f369d6a48@gmail.com> <20260702-generous-beaver-of-perception-f2a9bd@quoll>
In-Reply-To: <20260702-generous-beaver-of-perception-f2a9bd@quoll>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 2 Jul 2026 13:00:36 +0530
X-Gm-Features: AVVi8CdU7KatiOHoz-3tO7DGKqQfvZX3ffamBxk1FUMrG18Lr6Ao3tISiYJHmek
Message-ID: <CAJTcUFR08TXjOeQSxdBhoqHe94+7G_HLSrCN00BB8cHmBgTpZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66312-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,bootlin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C56EC6F4423

> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
>
> Best regards,
> Krzysztof
>

I'm adding it in v3 along with changes suggested by sasiko bot.
I didn't check my mail or lore earlier before sending v2


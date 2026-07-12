Return-Path: <linux-media+bounces-67391-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dSOpN+x/U2qybQMAu9opvQ
	(envelope-from <linux-media+bounces-67391-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:52:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2981874488F
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:52:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=URUmaZ9U;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67391-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67391-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DD60302BB82
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 11:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F4A2571DA;
	Sun, 12 Jul 2026 11:51:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D65310645
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 11:51:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857116; cv=pass; b=bu5S+fHe7uZqop3ED1OzxbpMB9YJiwNCf8hyWZ+i1jUC+/6pSDq26RUGryULqTaDhtDFh4IPjmUHsJB6T7Z8SmMf49WAc5WGgwY2UVIREZ0GG9nXwRAAmOn6a97apj3/oLWOQn9PDGqNjd9nMTSFc4rrlZt2vt/8moltu4A7AWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857116; c=relaxed/simple;
	bh=Vq61pPu6R8RhFxhzO6MCMoN7B8JnjWnfrnKR8iKrLVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+1Ux35GZGQCYOjkZ3k9TJ/PslodU4DpjI3Q06W19kjvub1gCkZeJypF1dZdIUm0v5ATSjqoAdzzCQCFeHvkhUc2hxp759kG7rl0FRaHI9KBZPPla0rHkt5dCyFtE3cBedUMu1ggZ7v4CY5/H/ufVp4XIcWZYA7SUTd5wyqTDng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=URUmaZ9U; arc=pass smtp.client-ip=209.85.210.177
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8484a0b998fso3474664b3a.2
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 04:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783857114; cv=none;
        d=google.com; s=arc-20260327;
        b=QRuttIabCihPZ4VTX6QJowNwiKkR47PHyojZ4bGfhFu3vtZ8ndGjt0kQEhGErNRTYr
         I3wiLFLwC8/SP6/zA7F6IJsFWN4lijFzISB1jgMT2sWwZyyxy0QYJaOuuwuP4wuIylR8
         gOBvSYADWrxaqTTOflAfww5ZwNTzyvDGZoDJNK7dNelq6/WUhI9F7QxQ2gnqO7zXk37f
         bLsfcpgfQQ50f4savp1RfqkVGFC+heQ3PqDdWl94NCKLBi98Gx0Mtaulu0TLwAp2YRar
         FdsBqk2hE+cMltWcAI6gu51ffa3lZMCKPKCDrvXOuBBbgiPdpmRhLLVrDAwsv7RJ9RW0
         9yjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YsQpUC4iSbhz2nXUUh9/l1xqUNQEcKgCsyiqdbNE7Cc=;
        fh=0zOot3mH3OkLBW+UZhdHzxtJ0HY3pW8PHwheCurhXKY=;
        b=gzeVi5gK6wSye484zw+uqppMp3Vrthm5LNRr/MongBckrTuQRDWBGSmDkyz57HR8RC
         MT96Ya1Eb22xC066BQdn3crqi3b6AhhM+ZczpQFTQOqKL9FqBbxKbQniBAeZlp7hCnxU
         bZerYQnyIRHi18z+yULJ5ogc8i1Fup+zHdWnluD2HS0vlAozFKdRZZJIq2cyKHkhbXh3
         L5eN4ObGjGOM1Xp3bg3pFr5fMBC+dySOWmyRJpnConqW2eBGhgEOWiQQ+4rygeeUFjDI
         CVkoIns2ZLE6SWbQhjFpb9YIQeEZmghgwEztRVLtcarLYYdBaJrCBLP1ESZjMVqMibbn
         vt+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1783857114; x=1784461914; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsQpUC4iSbhz2nXUUh9/l1xqUNQEcKgCsyiqdbNE7Cc=;
        b=URUmaZ9UW7ebsoLPmv2ZwO+NMA/F/cdUeLiUqXEHvG7svopSwPCAh2vYO8eKQx9+Uq
         qIHblZvsk0rX4E3NZ5TVXxD941gvWnFAmHodF0VYobDRHdLxLkftPV4gzn1z/DEbX8la
         WR0e3xpTmTybNyRCJN6NPBqgRiYhey1vgPKa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857114; x=1784461914;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YsQpUC4iSbhz2nXUUh9/l1xqUNQEcKgCsyiqdbNE7Cc=;
        b=ZJB1wEJU+Mt3+K8U+bkPFOZm7D7B42E8sMiwR0BqZTdMVbMW+OlIS0rtcHv/2/V6+T
         k0lOa7jLsZdK2Jnf6TC8tmQ1n5YN6jpOPkAelL54Wg45mpLsA42sjDjENWtFzd2MRxmw
         B+58KL9HdC4xOuwvaqNtMcponDujZlbN/Gwz5nCF+8hV8Knsx5U9xZwf0fz/dw3puLkl
         VbDC+rNUL0FQJU5muuSm8OF4JW0SYLwF44ABki1fdcNpcA4zyppK0uZaFszJbUugF7ML
         u1qfvZRJIHP9Xr53za1Mynvf9Hq2aFEeCsZ5AEbnNF4r7uLKJBkb94TQesKQ4+jbh7NS
         7+iA==
X-Forwarded-Encrypted: i=1; AHgh+Roo2ArqJ+hndmsRPrNNe+LchjPw9USeUqHse/8U/ZwU5THKBJ36pZeZgeqNnOCWilnxcb4Rt9VcbUxH3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfMWsXh9O4sR95a8GP5A2TevLFM6ItiWH6e0hnVJEBaAtm+/9i
	54alSvRoYsjcDmatZqZCk5xCME6/D+KQyNNYDbuIC+L+cWv269rkfgqvkSZeKwTr3Wk2KOAaRcM
	D6DbvYQGOOvif1JuR65lS1CwrezbvQVcTUbo/ZFkzlA==
X-Gm-Gg: AfdE7ckI7WNyW7cR/0E37PF/UGdqqGxSJBFcOZaA3PKPfUA0HbfK2kLnC0w8X08eCeL
	1cgxh8PfUMuCYj2jhCCJZ3GOulWuMNOoaSVULJHP5DwUTLtEzV/zu5lctuGv3gCYavsap2nH1Av
	XdljSrRVsVal9vBuPnvI9AT9iIcDfvltX7HtxFb+KW+u1CsjwlTkNfJ7H43lIYyONQQ9ryW8J+V
	Yp7tCjU55FyBSScibEM12pj5dcB1knULpf9HyiOkF9KzIPg1JpA6A+URp/hhRmfL5688eDDwB9j
	Qmneyjq57MrtedC0mPl3WQIu6i5x7w5g4jPeH5fCHf4CMjlUzCDmqtCRI5PYAYqkH/5dlO2Qdaj
	AtOB7zY2w47mAGcVvxdvUYk9BbYGDfBGFvvGP3V0qHsmf/Gmc5s0u/9OUcdhHIM60SfLTK1qlrN
	s2EPkWjTMLCmRqmFdyZu++oRmtd/wnmkMwxT5HOGgWCgw/4huuZ/wQZjyLLHFyM3UdL71ZF8A=
X-Received: by 2002:a05:6a00:c88:b0:848:2f77:e2dd with SMTP id
 d2e1a72fcca58-848897a7553mr5221254b3a.70.1783857114306; Sun, 12 Jul 2026
 04:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 12 Jul 2026 19:51:43 +0800
X-Gm-Features: AVVi8CfIxi4WIpFkevKCP00_7Hn3fE6sIEYaOzLrzMtk6xLs3rWmXH2GtZ7E-hM
Message-ID: <CAMVG2stqOscN2CB5Uq4qVvb3vXOze35-JzqH4GpS8z4R2dr+Mw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[quora.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67391-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2981874488F

On Thu, 9 Jul 2026 at 20:35, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
> VPU hardwares have a limitation where VPU streams are associated with
> dedicated addressable address range, as illustrated below
...
> Mapping a stream outside its expected range can cause unintended
> behavior, including device crashes, as reported at:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
...
> To address this limitation, the subset of stream/s are now represented as
> sub nodes, so that they can be associated to the respective addressable
> range.

Amazing work Vikash and team! This patch series applied on 7.2-rc2
resolves spontaneous rebooting with parallel streams eg when opening
https://ui.com in one or more browser tabs, resolving this platform
usability blocker. As such, this is absolutely relevant for -stable.

Tested-by: Daniel J Blueman <daniel@quora.org>

Thanks again,
  Dan
-- 
Daniel J Blueman


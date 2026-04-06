Return-Path: <linux-media+bounces-58127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDzHF1EX1GksqwcAu9opvQ
	(envelope-from <linux-media+bounces-58127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 22:28:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD63A7310
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 22:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FDB93041480
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 20:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BC62BCF45;
	Mon,  6 Apr 2026 20:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZducNsC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E1B212542
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506850; cv=pass; b=WxXgskBN0rok/plMD0DVDBWiCU3SO6q7VShDeh0ZZdtldk6p0xozFVmRmbPiAichwJ0DmcMJrXI0pYFYnzVKzwYUJah6lVbx1YuJ6x3IMnIaTlRIY+mUySDbEN6nCMvK/P/fzkOLGkAt9N8VUG2hm0kl0ApxLuuashqXLx2Q0NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506850; c=relaxed/simple;
	bh=Io1U+2H98QfGuSNNSPp+Om8lrtZl2OSidEXkxdnTsLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fv5i6uZt+a3FoX8I3NluYCbderceJDKFFOPlpNbOmCOEhjQ8YnSsI0KsZylCcfDh9m9PZrGYK6oHZ8muH4A7sMWAobkoUdSAxS3hNn9YAjjI9qU9ECKA80/o6PFLUPib/tKBbCqGe7QOx4O4JHjrWLGZk/CGh0Aq18dWeM4tP0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZducNsC; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488879dcbc3so210105e9.0
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 13:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775506846; cv=none;
        d=google.com; s=arc-20240605;
        b=CQ8wyc+B7OxLgNq1mBcxHCoka9diufev9+xIK3W6nukq6P79VDEJkAB7xwcQm44ppB
         ORHBQpTCTQK4gS9OFTpMcregqo5YwEOfS/NEDQfLVp6FuSWh1t5Tz+bezvij2EmDGEmX
         joPeDBF2d05SasyWLsEgD4hCHL98VJqFa+g+jyJDFfswTCIKb9hKe1FGZtckwMhTvp4T
         ObABdze4nnWU4//qZZGUZuuHfklM32eGCAwAapRFnJmlAkly3veFM2qag4nx8NojByBk
         TsRB3/iCPjoM9h5Z3VKuWxOpVtvhSTaVvl/WFpQm/KHdUd/qqQHoizEInJr9d12BuI7B
         8hXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DAq+hiOQoaI832cP+7lQvu5renHjvWZOnK9BIt/n8bg=;
        fh=/R/T/J2W34B2Q1gn+skzpLsgqkaZT7Pf7bhANJ+BUf8=;
        b=NoMIf20LtsV6W1DWPj4IkfXbhNcMoVm3Lw7buUxJ2fO2CmA6p1xQor9aeoQMZvG4Iy
         urqtnah+cAFtZsEaD5t5ejEblqc5eoqmbFJWlAQVu0/dN9LmtHHdohGATJg5EsVhtsFv
         eP0irzfGKOFrqQDjSBE4YH2hyC4ZfnZV/EnjZdOJulOUXs6+MxTR2WAXQz05fmP50xTY
         lHPAPGwzJ97U4UsVrZPI9tVg+C3ZDdFv7R3ytRh2qQmm0Y+NsPg5erWqObQceEquSIXL
         6PBTW/cMC0akQkNis6a2gA0H2mcu8LAkGpCjj+2byA2tD/bo4pJooJExedMmzAnkaEIB
         wyrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775506846; x=1776111646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAq+hiOQoaI832cP+7lQvu5renHjvWZOnK9BIt/n8bg=;
        b=NZducNsCeDthldSA1iC/qw+RYLlTAgWSoPMkNoHLJJUy3eSrUryydXFFCSSQ6kcapO
         YyzvsWJdVby98cCH4vE7/vgXheqENhcYyE3u+6pQBbuHWs7Hye0VVs7UfPIiO0aBqU6l
         tj38jkKMlxqAiOGJZlgNaH+2fbyi6SqlQJjH9/Fij6uAvX/L/C9ffe2sF0flh+gzcwnO
         IaJKuAmqmc8fJAm2OjXbwBHnfRCB4bGdfZxPzmSUuLbjpfydv3hXbsCASoNdZY1GrUYJ
         X08d8qHhPtcU+N+TPm/l5sRamkcddGUk+VRhQ3kfA8TJl6HAPd1B4Rf0n1g74g+yARVj
         YLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506846; x=1776111646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DAq+hiOQoaI832cP+7lQvu5renHjvWZOnK9BIt/n8bg=;
        b=idKczB1CgoeTQ0XN6Gv+b1k7CKEzhdyF6yQ5J+VQSO/TGonfaeWv8a1omxf/vz9vK6
         sltVpmYY23euMQ3HcGAVgjrbIMZODtL2IR+0a3NjeNdugTdHhBHwecHqNljSaHz+xg1E
         Bc4P9yY+ZdciUZqRAgT698hrtN6+ik1rAllZ4elu9qWwDRoAPS5MUBgtyTr4zQOS9F6I
         91Zq2yQ+L6DuLnnYk7vXoSSL+Rp8WvMd4dQyVJqQG9hfHTnhzdnc+fsy1J5gQ4p2I1FA
         KeycibimF9kB3h4K0eB2JPlvGK81IuJJ6hHHaWxHmsDcQhdZ/zyjw0UusHst3+tUdHJp
         FMnA==
X-Forwarded-Encrypted: i=1; AJvYcCVJcOBUQ98NW5LEGBJ3xHt96Mb9lNb8sROWVnXkoBJqDJOg9h06fhvc7S1HETGJkx37tq3zUbli6u8zhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcgXF0vndzA1rOauSxjyxTMNyQlzrd6uw4bBztjKW2AvTE2BLX
	VIrfpWxa0qDfXlPJ1UNRtin/83WooAscdoASjakEOFJrsFvxDGqj6YVB0wi7So29dtPCa2wNGBC
	k2hRlLb5CgakmatMLxSCrPNMkdZNtBq5NCbCgyrZu
X-Gm-Gg: AeBDievlfK1mmOHjEsFO75LFg3AShKFiFapAQ4fo0EmUIxKWr/CACNJfUksn8lqRJ/W
	hi9fhTItdNrlsJLFJ0CxAHyycBsAURsjtvilvNJarTi7yOSO86ctBRalg2beZ/8Qoa4T/yIUfDN
	ImgF9rDyt2eA7H3GNJeItj8I6O256GXQ+lWg/+Sz46YzMuktHHZiNx6/sMnrGYs/KLBmArECspE
	7Gfc9u0aF5T+UehfuUDhf3uRgFwvVdBD0K9ziica0pfNOpKhpIfa3MWlIS8qvOSyrOLpxVYweiw
	d99wA7YQ23orUY8E2eyRMZA31w/PjwbI+ml6TA==
X-Received: by 2002:a05:600c:6b19:b0:477:86fd:fb47 with SMTP id
 5b1f17b1804b1-4889a458061mr2963095e9.8.1775506845674; Mon, 06 Apr 2026
 13:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402141103.598495-1-jiri@resnulli.us>
In-Reply-To: <20260402141103.598495-1-jiri@resnulli.us>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 6 Apr 2026 13:20:33 -0700
X-Gm-Features: AQROBzBphM-pvVrX6rS78TlEjxwdox4kg-mNa-24N1cUfIDHIUevXFcYB-smPLY
Message-ID: <CABdmKX3N70j8ZZs5DNhx6fhRi=Aa_+2xY1JHcW+uDoaV2+Sngw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: system: document system_cc_shared heap
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58127-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,resnulli.us:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E1FD63A7310
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 7:11=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Document the system_cc_shared dma-buf heap that was introduced
> recently. Describe its purpose, availability conditions and
> relation to confidential computing VMs.
>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 05445c83b79a..591732393e7d 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -16,6 +16,14 @@ following heaps:
>
>   - The ``system`` heap allocates virtually contiguous, cacheable, buffer=
s.
>
> + - The ``system_cc_shared`` heap allocates virtually contiguous, cacheab=
le,
> +   buffers using shared (decrypted) memory. It is only present on
> +   confidential computing (CoCo) VMs where memory encryption is active
> +   (e.g., AMD SEV, Intel TDX). The allocated pages have the encryption
> +   bit cleared, making them accessible for device DMA without TDISP
> +   support. On non-CoCo VMs configurations, this heap is

"non-CoCo VM configurations"

> +   not registered.

Doesn't seem like you need to wrap this line.

with that: Reviewed-by: T.J.Mercier <tjmercier@google.com>

> +
>   - The ``default_cma_region`` heap allocates physically contiguous,
>     cacheable, buffers. Only present if a CMA region is present. Such a
>     region is usually created either through the kernel commandline

Each paragraph starting with '-' confused me for a second there. Those
aren't part of the diff. :)


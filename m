Return-Path: <linux-media+bounces-63112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DwNENm1Gmo+7wgAu9opvQ
	(envelope-from <linux-media+bounces-63112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 12:03:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E2D60C00D
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 12:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D590A30373D3
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 10:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0B13C07A;
	Sat, 30 May 2026 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iy9/C2v0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416D43976B8
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780135376; cv=pass; b=NelzaA32BZrfIx/GKa9VNcYmQ6E20UaOKleaLfx8shK70+M+cf6HV+8TGJicTYfMf2o+sKMDCFIjymTcRgayILC9GPyzTbc8IvXHe1lyE5Dr7UlWf7pUjHar3PyeSybt98KVwov/9yRim9t8E3gY36V1fUj8/2zXA8IHj51HVPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780135376; c=relaxed/simple;
	bh=aRV0xyZX79AA+2ptor+ckfoSILpcXRbuSrq8Ab8c8tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWWv4XxUgeoSPelnsRu0Xvg6+EtgCHhT9HJVoUjqrpZ8gllXP/iBtFUpWB8oJ2e7mLkSdwuK2Yii20h6571ayCCc3j7IXUyBA3T4DRJSVDeHuhR1cd1XXtoNsIg5m+Zsk16KgJTijRGIZxN9Wwal8EO1efry7H1MYFVb/hsnfj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iy9/C2v0; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69d7aa0ac18so5467304eaf.0
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 03:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780135373; cv=none;
        d=google.com; s=arc-20240605;
        b=L+CoJEBqisjgIyzSsKrz4YQqcyc5S7ZcRjt8NpDECInxbdtK4ULp06sotj2UOg6AGB
         Bejv9pp7aeE3vqn7HzcbKYra1qMo8qWizDVl0ICB5f0+jJf/1uPjf+DRF2iY7BztJ2Px
         MoMFmYcscUJPcqXXfyeWG1sJQ+qRIxnpJh13wPhC8YupjoTsx3HT1nLXQ5g7S1I6dOaQ
         zifY3FhCJ2yWfOxhuQP/J0TwPH35q6Y034x7dpzNs32tu0xRXOpB5BzPkuKV12R85wl1
         d3K29D5lb/KEspy2bFkSlqppZzkk1AA3uV5FMh878FarzdOVxdxavWIsGPkMRUXjzMg1
         bYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wA1aH6CmxX7A5iRyqGW8vvL57CBSLJoeivyspRD1x3E=;
        fh=exqunVOD41yw0XKQg8URrEL6vmc+FeaDcxE4T2/XZjk=;
        b=HP9GREcrUkQvYEb60A0FSD7SKW7fkR9S6AHThXDw2K8Tn3S+W9Jkn2ercECjA9zv2D
         +1HTv6y6ml1CAx71RLNqWfvSRak6rTm8oC1W9CCvRK4jw5srX7z22VS+5dhWDSxDOB+V
         wbQbd+09jgXQofW36Q8pNayWBawO5ClTbQfocNb3v7Uj/XRgbxuMptm3G2DJkxet1dm1
         NCy7N13zhTQLklOmRXMC1wxANKxHGsWTM7M1i1TWLd41hrDlSjF4Wi4+euCSLPKX4GZw
         MFdkawe+NH6YUuWLfIv9Zs9c9XvIrKR7vS+RGCniiONSN8b4gL20aq7lhoRB+xQCzuJS
         ickw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780135373; x=1780740173; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wA1aH6CmxX7A5iRyqGW8vvL57CBSLJoeivyspRD1x3E=;
        b=Iy9/C2v0BdretmYRmz0PX2XkiUjK+vgBEUlFQY491bBYz1g3NxciHOQ4rDg1Q6UaBw
         sm0Lmi32B/+5LWXkLk4IKYmlW7kqNqj0NiLDn/4w65XgOXfDGvg/NxR8vgwkl7ht+608
         hFQBPBz1BBoB89l0JTKBpPlMi+cJry/s7TmF5j4hoeo6xlBocGR+1ftaPOy6XFr/OWCU
         iS/kcXvtdVw7f0dMVmraiInjxAM5LYB11hWmQ8cHbHhlWKIAWxmfC4cMzio/1FgwuqXZ
         keLN5Mrr8Iu45suvk+ItCguyPikem61TrW9RbVZTvQE+Z+w5mnP0+87A7g3uxRqxvLcz
         kYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780135373; x=1780740173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA1aH6CmxX7A5iRyqGW8vvL57CBSLJoeivyspRD1x3E=;
        b=q9YEHbmCJeMyIJHGObBbFnQvWsrqF/57LiqevSMdixhfIc7I8qscDxl5DrTMZElkIK
         rv2yl8E+E8fPpmGPmBPkB4epStUbCmFQLobpiwuOG0RnbKrrDEujn82o8iJqFDU0rpCE
         5VU828s+h1Oh9D8lReYG4Omx+TtGbbaRMyVn4kha89sjX6AhdL/Kbe/inXczuGQtUVzQ
         IN8PnvbZOoxMciDmyuRkiEhdTdmUA0M+8NtGag7WAlVBtfIhlF5uM5Y45DKcDayXsO7a
         H+x5WLRxJniTf8XPZsyOneCeDZt+vOSh6sgrJoTOpb3oMGc31RQg32JB6GAYMExCbF7t
         CBSA==
X-Forwarded-Encrypted: i=1; AFNElJ+Jw4ZrqkyCjNe8fIF/v52QdE3F+aZUEEqrs0B7ExSLfT2TubOdZkTwWsaAn/8gTE0u0enJAG3SVKaB9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhrMpkeF77amyXZdLelTJtpRpRMfnOSazeRFWpJjKyiOJDUYTK
	TP3SuHroY2UXMtRCd8XSw4skI4vPsXJvQsIvKpIYx3OVAx4SJjdo19EaPc2Uq5EnchqLhn0lFsv
	imScIeXXpnwok/8FHiq9Sttxoqdy2j+k=
X-Gm-Gg: Acq92OGPfFDgBcO4chesA2I+WwbyO1v2SCzEiNh+kpmVFoarZf8u5q5cKw3ECMn1ub+
	pYuJEljaQQWsh0rHHtwupv1eXqrz6pDu0LQO93m0kNAGAmkYjV9oXPMBa/dAh8TB89S6X8eod4R
	MPv45MbdYtVwjX76yT3u3MeszXmAEBwK31CniwdpYBzzmsEMU7JHqjS90I4G8plKa0jS1YOuAW3
	vxoJ5KMNvKypjRacRq3JYI60CMT8IWvEbSD8x1LbrerjBngUKZDq9f4bWniGc0AKdOM4bVwaZLo
	G+TeTWIIaZAGqaEKiTykunZhwScGKCtZdwfq08VzkXJpFy00iJnY1uZjPlE=
X-Received: by 2002:a05:6820:1c91:b0:69d:d5f5:1727 with SMTP id
 006d021491bc7-69e102b1853mr1483383eaf.5.1780135373192; Sat, 30 May 2026
 03:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529024429.6942-1-devnexen@gmail.com> <20260529050649.14109-1-devnexen@gmail.com>
 <ahqh3Zv8xXNENzHb@zed>
In-Reply-To: <ahqh3Zv8xXNENzHb@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Sat, 30 May 2026 11:02:40 +0100
X-Gm-Features: AVHnY4IJRqkWaRtmQ6e3Icb9LwRiaPlqA4vFhZ-emg9TT2H0DQQNJB7tXh01f5E
Message-ID: <CA+XhMqyhpn0kHgz=i9WUS+1rFN4kWW3DpUYubBN1k-qcKo+RpQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: mali-c55: fix integer overflow in scaler factor calculation
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63112-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D8E2D60C00D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

  On Sat, May 30, 2026 at 10:55:59AM +0200, Jacopo Mondi wrote:
  > Have you hit this issue ?

  Not on hardware, I found it by code analysis. The sink format is clamped to
  8192 and crop is clamped against the sink, so crop->width can reach
  4096+, where (crop << 20) overflows 32 bits before landing in the u64.
  I don't have a >=4096 source to reproduce on, but it's provable from the
  operand widths and the clamp. UHD (3840) is just under; 4096 gives a
  zero increment, wider values a garbage one.

  > Could we maybe first do the crop/scale division and then do the Q4.20
  > conversion ? We could maybe save the below do_div() [...]

  I don't think we can - dividing first loses the fraction the Q4.20
  factor is there to keep. E.g. crop=4096, scale=1920:

    correct:      4096 * 2^20 / 1920 = 2236962  (~2.133)
    divide-first: (4096 / 1920) << 20 = 2097152  (2.0)   -> ~6.7% off

  So the multiply has to come first, and that pushes the numerator up to
  8192 * 2^20 = 2^33, which needs a 64-bit divide either way. BIT_ULL()
  just does the existing multiply in 64-bit. Happy to switch do_div() to
  div_u64() if you prefer, but that's orthogonal.

Cheers !


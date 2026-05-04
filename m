Return-Path: <linux-media+bounces-60230-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD2NLUgw+GnsrAIAu9opvQ
	(envelope-from <linux-media+bounces-60230-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 07:36:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 354E44B8921
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 07:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DF23300A529
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 05:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D020221255A;
	Mon,  4 May 2026 05:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnm8rR3e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB611A6808
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 05:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777872958; cv=pass; b=Fk06ylHwNOzu+3RcXAbPEGlHoxyx2TQj9MEcDiurSVd5ZlT/dFMkx36ybqsgAINXL/AxqQu5b34wts4yJ7C5HNCHIJ5FWGG1SParfIbwye4nxbGJ3KTeSnyG9Cs3XAoxU2NNxf0EYqAJKFF3VvN2ST29LHUdl/vn3IQAg5q7U2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777872958; c=relaxed/simple;
	bh=PpX/DfNN+JlZDcRUbM/17IG5CRLJ4dln0yK2qRlnbws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeplGZ3fnEYNbJPkhhbVmzp8hHuUg9fOClPpNTcXiGKxbdVcpZ2gLUuTZnI93MNCCGQLiOmDFvAti1NZmNJrmm9H0pyE7917gR+iOh99qs3Ro79H09QmBbu44MLZR6imOlS/CXV9FtUcXVRVYFTTkoMtFzCahVcR5/lav9OINQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnm8rR3e; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2eadb000b8cso6970609eec.0
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 22:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777872956; cv=none;
        d=google.com; s=arc-20240605;
        b=N5C+8erLkZu1TSG4Y1r8oCRsS6MHrbJCDdFPvHroM8DsyXRbRLabjwFOrism00Jch8
         SGxLm4Ozqcqi8w9csOpzsB27DQGaIij/FuFWwDpur9NnBtuvfbv4fkH+9GdX7w5dqXc4
         9y0fBCB5RnYjOZRFT02/V7i2cBArirEjuyb9+eej//6vkUFIL6d+C5LAVo4tR0sxA6AT
         otkWkWKCAc34sdcMq2TMaqmMR7AQdbtejtkIhvi+MJx8+BX3XkcvEPplmAiBiZThLCrY
         At1mbPtr77QGqAgtHfd2pX0OtBt0bT7AxF4AHQI1T/AvNZhBoi2NZDvsSOzDCSJ3CrA6
         oygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1uBbstHeNNetK026aMIZ9O9biz0TfRbnDvaNXtEoNZw=;
        fh=gWtQJ/7bA/boAKf2k74UjqDcAOKL75vnIplndau++4I=;
        b=ScLswuftbyly7UO5aHcDtb6eUKgDBJLMa95vJeaRtyubn20B+2Kv+AAsV0CcNl5kDt
         G2CYkM9JOrjw5G+8TAWgq9iqaMA/Qb5F9y/ll6TW3JOFyWbZXi6Pq2V4brS5w8KPq4QH
         A3XLLDxAByu5FQZEX/s0nYpYEG/XehH0f85fQgu/eBPau9yXKRTlKipxgOgYZ8Gve5YJ
         9lLHr0bZtS1syIPhhzGV2WRdTlmNBCa+9qHRavEXouGXn2hT+3yOLk7vsESxYu0KQc7H
         ZNCCvSbifYRLtuqIYyAO1oDWYakIkoY900quYeCliH+bmM7EaDABdqRLzggoiXR2OYDM
         xtCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777872956; x=1778477756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uBbstHeNNetK026aMIZ9O9biz0TfRbnDvaNXtEoNZw=;
        b=jnm8rR3eGBVNrd3NIS5A3I651kNMOQ/T5/9+VqCNHcZULwlLqoZfsB6UTqjkjSEJ1m
         hRfnOlEZnyYnOWq5GqsZ+Prd1lY/T2ZrnErQkOQjh7q8O4LrytGlTT6mWhqoASRW/7K9
         vIIxMDnMT9cAgEaZpflqm/cwinoiBYnPY5zviBZDsAeSIu/yry9/RY7dUACgfNTTC45I
         neWZDzjUX9z1mrWcOcRoMqO9VKJaiC3XNi+yCxZif5vYxdUOzonXBuvuGHIZauVQnibz
         4xuIG8jXSBKWrnLAFe7tVUCfRusLzKEl5GXQxnB7H8XNKucZDVi1yzkXti1W2y81E5ob
         cIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777872956; x=1778477756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1uBbstHeNNetK026aMIZ9O9biz0TfRbnDvaNXtEoNZw=;
        b=SasL+6vx0/VDhoMgcdjUShFfIY8cNL+Cjq7nNWByQpgrcOTvT+Yt4sfMtNWKaOd18V
         LDc2Lhc+o7R2xPY312rDlIZ2nvG817g/LDH3cdW8rOLu21xPreI/YYT1pTQEIiFvGylQ
         l6ez3rgXHUS+QNOX55xl8Qemem+ezfEpl3z/aixNrPdyy5ie8VCC2IwZR8JBE/vHJxhI
         nlcQaXc+E5r+PKiZCPPlwTLpdTeLEiztmSrVTzj4dmrIA9rT2UAMTxhhZwX6AbgLQpBS
         n97GVh4VPh8ey/ENKgRSSLpX8baoMu9LUg/yHMtgmRXI4q5IScu0hGksJzZ+Ka2dmbq9
         H0Fg==
X-Forwarded-Encrypted: i=1; AFNElJ96qgz5a/EMid+mbOIytL20c9VUla5oh5xXet9yOlWVuxtCNolpP5l1+tNjQOcalZ0waybyxDJ65JQDdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rrOSdwAL7SAYUVyQsfrBuJFTBgCopqsY4xuoBVXn7zIxTlG0
	TiYFXpKGJH4gO6XDwUoEo4cS/lagj/pSWN2WYniJug0TLXFyleG52OYPWVXp+kJKjp9dUzNuYPP
	8zMvIYixkgqizzR8yrWvtqjgUW+G1BFM=
X-Gm-Gg: AeBDiethrWTwSl4dBtz1YSFh1lKiuEd3Yjt1K0duf9WC6Yq7bigyiaIXjRM2rwH/o1S
	1uT/47rVRfaDOi0MaYlUb1xbQhscKpJqGodLfHElXB6WOmg/TFd3RenLRMv8xZvp1RCOxHhEbju
	ygqr2uy6skBebmtye6QMvOHLKVJW6ziDcbAoS7n8NsXxdyY+q3L+Zt6nKPyRAVy4xKa8XKvO/cc
	0GcVWt9Es5ha2uBYPlYcGb80Ba9+kWKAUOPaou2JlyTMkRDoXj1lOyRM5Kx1N7/v4Q5ZpyOQS6T
	poMlLzeNhaHF6YPyqfM=
X-Received: by 2002:a05:7301:9f06:b0:2be:142f:d499 with SMTP id
 5a478bee46e88-2efb99a10e1mr3875589eec.16.1777872956015; Sun, 03 May 2026
 22:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164445.215540-1-clamor95@gmail.com>
In-Reply-To: <20260503164445.215540-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 4 May 2026 08:35:44 +0300
X-Gm-Features: AVHnY4IMnap_ID5NH1mOwy7Jn90ifX2mwZC9TXCzuL0FMjV669mX99tEoP4MgoQ
Message-ID: <CAPVz0n1n1qrA=VdCGCwYcGFBfN6aaTULq9OKVa5=mmHMFNkDvQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] media: lm3560: convert to use OF bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 354E44B8921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60230-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

=D0=BD=D0=B4, 3 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 19:44=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
> Remove platform data and switch to OF device tree bindings.
>
> ---
> Changes in v5:
> - schema adjusted to take into account lm3559
> - device_for_each_child_node > for_each_available_child_of_node
> - lm3559 and lm3560 configuration was diverged with data match
> - removed redundant header
>
> Changes in v4:
> - fixed current being off by 10 in schema
> - label property from schema replaced with modern equivalents
> - lm3560_init_device moved before subdev registration
> - v4l2_device_unregister_subdev > v4l2_async_unregister_subdev
> - added subdevice cleanup if second led registration fails
> - added check if "reg" property exists for LED nodes
> - added missing fwnode_handle_put if device loop fails
> - added bitmap to monitor configured LED id
> - added pm_ptr() macro for PM operations pointer
>
> Changes in v3:
> - added note regarding lm3559 in the schema commit
> - lm3560 power on/off functions converted to be part of PM,
>   dropped redundant wrappers
>
> Changes in v2:
> - vendor properties swapped with generic LED properties
> - added mutex lock usage optimization
> - power supply and enable gpio commits squashed into PM
>   configuration since they are both required in making
>   proper on/off sequence.
> ---
>
> Svyatoslav Ryhel (6):
>   dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
>   media: i2c: lm3560: Fix v4l2 subdev registration
>   media: i2c: lm3560: Optimize mutex lock usage
>   media: i2c: lm3560: Convert to use OF bindings
>   media: i2c: lm3560: Add support for PM features
>   media: i2c: lm3560: Add proper support for LM3559
>
>  .../devicetree/bindings/leds/ti,lm3560.yaml   | 163 ++++++++
>  drivers/media/i2c/lm3560.c                    | 385 +++++++++++++++---
>  include/media/i2c/lm3560.h                    |  84 ----
>  3 files changed, 481 insertions(+), 151 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
>  delete mode 100644 include/media/i2c/lm3560.h
>
> --
> 2.51.0
>

Hello Sakari!

During preparation of this patchset 2 important issues were not
tracked and discovered only after sending.

1. In "dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver=
"

flash-max-microamp and led-max-microamp ranges of lm3559 and lm3560
pattern properties were swapped.

2. In "media: i2c: lm3560: Convert to use OF bindings"

In the lm3560_probe struct device_node *node should be removed and
for_each_available_child_of_node should be replaced with
for_each_available_child_of_node_scoped

I am sorry for this inconvenience. If you find it suitable to adjust
these commits on apply feel free to do so, alternatively I can fix
them in the next iteration.

With best regards,
Svyatoslav R.


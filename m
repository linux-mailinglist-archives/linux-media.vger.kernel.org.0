Return-Path: <linux-media+bounces-49509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63CCDD119
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 22:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A71A7302410C
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 21:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185DB32693A;
	Wed, 24 Dec 2025 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJ2kk+mp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE7929E114
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766610477; cv=none; b=JinAEZ0q2z3whI3L9OzkzUgOqzAQEudDz+U5XYxyRCVP5JmIHLxytGa8u27gJdZL0yfcpJv1m9wp368llf96gukZMbqJo0FnaB+QnoyInd6Bmht+0CesTIwQXRz0d81pLoIdEtIp/CRkX4JXiTZII040f4Bp9+m1A07izK5w1uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766610477; c=relaxed/simple;
	bh=iK8yrwDzmNEFEqyLINVb5/IH+5Y1ENvQzdFPFUIzpQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4tK01WCq1j7Q9ZQKwTltMEN1GcVZi3gwTEEurKslo6LlgiMi6ocZ9nv/qbHmWnbYzBYJg5lqqt/WxuU9BqcSRqX68nZvpyJEertYYWwtO4zTxsj4YQ+ppE6JyPbjAx0tQseLDZEkvtYNwRBlY4H3V/OShkLcWVL2jIgUmBA+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJ2kk+mp; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b1dde0961so4565097e0c.2
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 13:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766610475; x=1767215275; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cCTlQAT+iHxugCwpM8vllJhIqqbWFrkNPusExq9MD84=;
        b=IJ2kk+mpGb1xmonrLTpgIczMLR1GDmQ+rOTEoS+EMgC7IN00J/xr3rJsJYXBv2LUUM
         On6W6E2q1bGFrL6ppaLvkhZdF/DHB+LyrMnlpX3T+cjKqocG7lKPdLuGGIdVCFzdfDXC
         DW+NjvrqyLVLZDKCGUNUafZkFleZKdLtFmaflm4lr8Czqoo0Ta82uxO5ecX1EJd71/1w
         qMIZgL3k0PaQLAPNpPRjKeLlQ+s8dFt9h5wPM3Y9FXP5yg7L197dOtv3nRbKcKSsw6mW
         MXsE1Sln5IpYPR1MRL8slqI5eqmTTWhgoiJiT4gzp7ejzhHB+pzsWEQd0ot2cjPvTtwZ
         ZbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766610475; x=1767215275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCTlQAT+iHxugCwpM8vllJhIqqbWFrkNPusExq9MD84=;
        b=b66vcvjFXV5FVch9YzjdUTPqwz4uEC9j6RDBiNrf0THxHpmH40bzLezB7Z10AkG47w
         8X+vvG/uPc2q/i32GTLe4ke7mQdNC7svt0s5XzvtgTvPof1/eDj2sPfUy/s+6vS7KQtF
         i+ZqN+Nix4k3d/fXajECKNc25urY0J8l41FYWyoudtlyCu/rBVrWfm6sxs6lKqpOMvqN
         Le2mE01QC9f5dLogZEmcDLsa51L+6yvilVPInaHVoOBaFklofgB/THcU/Gy+9jm5WZ+i
         ORCFiSvHSisAn4FdDwQYcsnb+ipAsmCNSJn+t7VusBn1dYrVGqAOYebAfMbhGRTk0i0j
         A1uA==
X-Forwarded-Encrypted: i=1; AJvYcCWUYH9oU42NF3LGJf/bky28bWagaXnXDk6oej27J3WqkCxji/AgMFK772CS2FaqpbweobAydistwhRrwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNMUYqkyjNbtRCsIrkIAGNrIZfIUOGAiAyQ2ivcMfG7YVkb8tD
	zlTona0TAbXQlAriUZcvzc4NMSEdgLFPZkPiIypd8Ukjs2uck369jj96+J3K3jNRHUo4RZlMsPb
	zuX0vjHrZkVOjhzZWDPc/0yaIpwQh0ak=
X-Gm-Gg: AY/fxX7/SNJiH5sSp3gmOvFwCcPVRqkExH6kBwyob9nhnz9DHf0TDHup4I59btG+iZ+
	U8/I7AfH7c4XMWnMRdXzVtcCwKwrHnD0dnIJhQRskRN7JXzk0mMwsEN6cutBc0I0PfWeEEjMxVG
	z24B2msEYNTBiJd0ZDVE66I2Kf2QmvACJIfq50tNOyrCT7//4SXjJ2HVSdOkKeNdl7yvKgLO4KS
	LsumPGcGX/rap0XSKvjWCu3PE5enFz2z2ctoYViYiiXQpzLZQOwHDnnqYsK4u2ha/F4dQMv
X-Google-Smtp-Source: AGHT+IH7XGdepg4Z/orwm+2GhryRt9V7S6meYAVUOfpXJTMnfPvQsB1UQ1hzQqkl2cujqzwTv1BXxMsNVDFCF1LJO7Y=
X-Received: by 2002:a05:6122:2a42:b0:55b:305b:4e35 with SMTP id
 71dfb90a1353d-5615beb20f0mr6131823e0c.21.1766610474927; Wed, 24 Dec 2025
 13:07:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766123192.git.alex.t.tran@gmail.com> <6f34ec79ac21d5ab9ad3fafe34a0bf6aca49a10d.1766123192.git.alex.t.tran@gmail.com>
 <20251221-platinum-mongoose-of-might-feec86@quoll>
In-Reply-To: <20251221-platinum-mongoose-of-might-feec86@quoll>
From: Alex Tran <alex.t.tran@gmail.com>
Date: Wed, 24 Dec 2025 13:07:44 -0800
X-Gm-Features: AQt7F2rZCAW0yhAERGrWnfIke5IXQve9uiOJmP7X9t0yJpOUiJVNJR7wsyfvKGM
Message-ID: <CA+hkOd4B425PRzirxLW-J2L+mDGusfRDJ5y1nKLwG9a-dd4M8A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert
 to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pavel@kernel.org, sakari.ailus@linux.intel.com, 
	mehdi.djait@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description:
> > +      XSHUTDOWN GPIO. The XSHUTDOWN signal is active low. The sensor
> > +      is in hardware standby mode when the signal is in the low state.
> > +    maxItems: 1
> > +
> > +  flash-leds:
> > +    $ref: /schemas/media/video-interfaces.yaml#
>
> This and...
>
> > +
> > +  lens-focus:
> > +    $ref: /schemas/media/video-interfaces.yaml#
>
> ... this are weird. LEDs are not video interfaces, for sure. lens focus
> shouldn't be video interface, either.
>
> You also miss unevaluatedProps there.
>
> This needs careful fixing/rewriting, with explanation in commit msg.
>

My mistake. The correct schema reference for these 2 should be video
interface devices.

-- 
Yours,
Alex Tran


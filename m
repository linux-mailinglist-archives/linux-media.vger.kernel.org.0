Return-Path: <linux-media+bounces-23410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3509F1C85
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 05:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA6C2188D82F
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 04:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF23038DE1;
	Sat, 14 Dec 2024 04:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuE14pFy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD41168B1;
	Sat, 14 Dec 2024 04:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734149529; cv=none; b=blOmUfsqwwtIXGvmHOiu5HpZHkytj7TFBvD71NKXtOLedhFe7PUx7EnD/W+/oKQrTh8pnF/ZQTCL0KYU6QCCxbfkcZq0WBZc134qlfFS5Q6bhsbjsKrgz1/+L/lb6aWRt3nWBK1TrSEShWUHTDFTdHZlVsD4EzEjWMno3SU2jdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734149529; c=relaxed/simple;
	bh=Aujp23MA7YyHDLJ2MbjCd8wyARqmkubYdfpJ0Ej5CDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyc3XM/fbvrqG5Nhu2oHm3NXEGBlv2fXRZFvfXSNqQOKoRRIEqrg5aJlaGcIILXr8vhd6039v/tukaOXSwKWzTwVsQYZYQdcXZolPcBz28lH7n3l7zA1TyIWqgNqYCTg9CntsPFLKjnxUBre/2Aj5BBwoSEROuPiJIkdJPlxW9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuE14pFy; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46788c32a69so29503451cf.2;
        Fri, 13 Dec 2024 20:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734149527; x=1734754327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A2ZXUNJUzsIZYyQ65j5HvtYHB4v0YyeGbQjnsrF79CI=;
        b=FuE14pFyFwmN9nWXztl/E8CpM/P8B3Zen+4ZY2KWX/9wgPzztnXfFZoDI+ZlgyTEHR
         WcTwFwpatmzv6G8gcry/8DHMXCvGqYiFyv8fR6GIkMFE4zCPc51MViLAPs12rnvvAbiz
         W6QEdUh4R8hm7GDUM7s54bKMHRwJ5by/B1p9SZXI0nqUgTxDLZ/54L1Nm9n0FF9y5Yu/
         YpEiS/oRpZBxEbLIztv6oD2aJKOj0ok1bPZFa/kbricIPMCJUTOE1ViujHUVpA1nq2s8
         3tMOrvScV5mlyWt+C0/EQDSAJ/FHcqSBJe4pIXpDHOaV39lkPbvqdExVli4s2lyeDq6D
         nAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734149527; x=1734754327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2ZXUNJUzsIZYyQ65j5HvtYHB4v0YyeGbQjnsrF79CI=;
        b=gc87lBrlNtAe0qDzgICPT8Dn7HiPutZjUaM92JiYAf+gCJUSNwJUpPFfe3Zq/gD/gT
         NdwkpzCJSoa1f6/nrSdcIp31w7lc7WiKQwg+hVk1YSBd7Qdf+Nqu617KiZEZ06VJ1ZrM
         kiD2g8V/h0x4fVKsaWUpto4mSW96MEpjv2Ior1vARbFP5qw6QBkN4cLedSbQ5YwKG7s3
         OexdCdSamChJv3BcWirQM25b1G9z6EvTPcXkD6efEYiOoLL+LHFdF+roRTKYNa2Aqkgj
         KKDh19ytDauq1t9fMiiIVqwrK0zlkZ8a33wJm2SBuwUzHD2RNNJPAkaNyqUvUamRSp0+
         +6jg==
X-Forwarded-Encrypted: i=1; AJvYcCUUBt54bWUpUxobvPZSI3T4+gZ0bUKC9oZ7wcZs9pSy7MVfqFekkXbpUOLjSCbCP5cTcMWPwzipaJWyeoVveg==@vger.kernel.org, AJvYcCUtCOrgX9hAPHHBmQ5Z+Cer9Lw/O2DUaXe937zYoEzXD1Wb/X/RTvymXbiQe64LVRIsex2NEjdtrb1N@vger.kernel.org, AJvYcCVbtgjdoUWrT8NnbTgmyZo8seKxxc31oFm7nBGWKZythiqYKOLlqGU0peonYm3Wyu8LbkNNu9nOuAMIcUk=@vger.kernel.org, AJvYcCVmHZoEheEgNY1yjDRukBfF1EXq/KAriXPJ9bnUvl8pHlXEki2/rvJrm1aQ+YceekOs7r8kmLU+5mHA@vger.kernel.org
X-Gm-Message-State: AOJu0Yye2R1k2K6pUikV+MFpH53Vr7A+tVy7VMkOjDqK61jYI6OUufvw
	I3Uw56HR5r51h0R7+4kzlT88W5+r5kHsB1QlCgdUuq/h7zYDP0lc
X-Gm-Gg: ASbGncuDgMyNYuJ5F4yo6CAzr8Ex1EFopAkDM87ZZBNNf5Mk4TvT0Xpp2ck+7H2QKRu
	VIIkMTkMj7mKCcfQ2ULgtGjHLs9j84qUPdIskS03ZRsr0dXfyJ8nAzpI11iTWT5LTCDi0XT2MgU
	KEYm4KXxHXii87mNWqoMHi/yNwwagVrtZLopgROqdKcp9BKKnfjI1ZbvogurbF/LqtUb9VKbid7
	OvBnAQk0uEL3u6uexAVXMdiZCNr9ZrsagIne1YMasYV
X-Google-Smtp-Source: AGHT+IEkT7SA9qD4VQI+Pz7RyOblo7eaTFuND1N51KdlZ8Ie+jaFeyWJHFDM6Wgq/1onp6R5EF6s3Q==
X-Received: by 2002:a05:622a:1dcb:b0:466:8cc1:6221 with SMTP id d75a77b69052e-467a58380eemr112002381cf.50.1734149526794;
        Fri, 13 Dec 2024 20:12:06 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::8f60])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2ed1a0asm4417401cf.87.2024.12.13.20.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 20:12:05 -0800 (PST)
Date: Fri, 13 Dec 2024 23:12:02 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sdm670: add camss and cci
Message-ID: <Z10FkmBq95HQkOgv@radian>
References: <20241210233534.614520-7-mailingradian@gmail.com>
 <20241210233534.614520-12-mailingradian@gmail.com>
 <fe8dbb4e-9d0e-4ecf-874b-be9225ae1487@linaro.org>
 <Z1jdNaeoictuCK7N@radian>
 <a499bc08-1505-4f7c-833c-68240fdec275@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a499bc08-1505-4f7c-833c-68240fdec275@linaro.org>

On Wed, Dec 11, 2024 at 11:24:30AM +0000, Bryan O'Donoghue wrote:
> On 11/12/2024 00:30, Richard Acayan wrote:
> > > I think you sorted the regs, interrupts but forgot the clocks ?
> > Do you mean the first three clocks placed first? The order was suggested
> > by Vladimir in [1], but I can undo it.
> > 
> > [1]https://lore.kernel.org/r/40cd7a52-1c60-40dc-aee6-730b5247b216@linaro.org
> 
> We've had a long, long discussion on ordering subsequent.
> 
> Have a look at the sc7280 and align your ordering with that.

Ok, it seems SC7280 renames the CSID clocks to change their alphabetical
sorting so I'll rename them as well.

	csi0 -> vfe0_csid
	csi1 -> vfe1_csid
	csi2 -> vfe_lite_csid


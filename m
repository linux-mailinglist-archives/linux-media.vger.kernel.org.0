Return-Path: <linux-media+bounces-35210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D1EADF7CD
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 22:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19D11BC12E0
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 20:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3390621B9E2;
	Wed, 18 Jun 2025 20:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKMN7ijq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121A0188006
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278942; cv=none; b=bz2R8CEAC88/3qVEeDiigcSUgMlbX2PXMonMHX3CKHGA4zDnbDOo8+8G+45iyo28a2zjz9JlZq53Fl+TRKM7zcZF4h3UlZ23rNYzIgPkQeuxKqiGvv0O5iMKtsnd1xSZO8vW7jg8tfvIzxghdQEomMTIj1axPQjb9SWBMUiSu6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278942; c=relaxed/simple;
	bh=tdp5QLiOHOlbEuOqjEnrUJUC9ruma8uLiofFcPaxxr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQaGVVD/HANNeDGBBboeAJSPR+xI0bL1BKxA6t5sCCNfgfIBJLglaX4VDLSOi1jHwuqsIRhq8giFXPRM6/PYC8+LoLTiKA34hX7RZKd6o2ksvlKidiYiM29REfjV9QpoGNrg3VzvWV0pxLDf0U7SBDEDsWwo/1biADtAAsUvmjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pKMN7ijq; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-610d87553b6so32685eaf.2
        for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 13:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750278940; x=1750883740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pwz6CXNC/ugKSGzRSaUzyFgubl0Bnw6BYLYgHCUjaIs=;
        b=pKMN7ijqZwoe5p8O6lKr4k431NzjAO86rIJ0HJYY/DCZNNM0P4PSkuEllZbIWtcQj1
         I3vsM0dgapQuSpwirsQZ94iPlfnDP54VcMZW0OArC039/BYzg7JSLsTMxWIIrHfrKHav
         D9ETt1U69gyyllScNvKh4EDEgHjsebG+ceDnGipDcirA3SVcVPGbcbZ9dK7TsQdu375d
         QjI41fPSrQEk/bg3m0KoRmX/VvjPVJvmU0O0SnZmFD8QzEGQ1fhLH2gekc4cgqA66+s/
         OSzUrL3XBN7hbE5kFPcVPYCIHnXT/yFUbnqznWJ0Tc8F1+33n0VWBqdLDTviShqBjSOI
         ipVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278940; x=1750883740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pwz6CXNC/ugKSGzRSaUzyFgubl0Bnw6BYLYgHCUjaIs=;
        b=VpWJ14D0/+u8u+DuVGIIONURMOIadOHfM0mDlt+DdiX7im6BYtF11NBt92zZalUkun
         vxpViqpzajNqn4jQIlh+SARCdK+RO3i8vlzIwABLVszpK/pdI83iN28+puaZYtonuEae
         PwkGocJZl0nqpGvODwMhihbAvigtdIz6a1fRtd3Jvm98ps4oR34k+WtdLQTi6G80cNF5
         QzbqhaLm8a5b+zFakMO8R5wLBvdIDaR75mGjqRR7o8ymzjGryVkJ2xPJIQKcHBRnFeyp
         8UaW2tQLZvkcaWfVM+3gzypbjquqsIxFy03H3OsypOSrt+bRwd2DvMvryIziHa+BKud2
         8IJA==
X-Forwarded-Encrypted: i=1; AJvYcCUKE92W2ewVY0x7UsDDSf02nqWKZpV5E+y6o6Xu0r6s+k27Ryjck3BvpNh+Kt2xcGtdNHDqwHi6oO1MnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8LgrKoGEQZVjacBfJ79Tf25mAzCagwEaRBbbXJNutQEo9Z+z1
	LEop8m8dDQT4smjIgVPeoKMlTigPp7+Uf9XzkCoNdZpOiOxCkE8ak0IydtXhjV2KGlU=
X-Gm-Gg: ASbGncv7+db99G6G9uJUMlovphTWtRpdJvpknOy0yThov2DdlSxbVlGyR5IoH09pRLV
	r+/FTXyKojNf9UX0rXH2bndTjwnwY5Jwuay9LtQpzDTnEXbT5youUkNgu5nIOQzAK9i/DWdjIm1
	BcxJXWaX8/6IGwTaqblnxRClozhEOfsf9QV+jUkonLbfURpXzQHgOn4aqcGvU3z7UAGqY+ev1hU
	TIeywhJUiNuJj375x7sRlfTiTDJxv31Og21Jki3/0tnGzzYqEoEHOSfPxOv7HTaJ5KorfevLKvn
	mqXz2gGuOg+vQsrSNnXjE4l6tyBfbaRalQnjDwJ4Ijuea0eL1p8s56FXClHSrAMX/HZkKA==
X-Google-Smtp-Source: AGHT+IGRCmNb//Da94sttc1weAAS9cWSvAcRjNV3ZWYi9u1xEdpXbwT3dLO6ss01/8BbJ7B/FZfsBA==
X-Received: by 2002:a05:6820:2f03:b0:611:11a3:7cd7 with SMTP id 006d021491bc7-61111a37e53mr7441793eaf.4.1750278940022;
        Wed, 18 Jun 2025 13:35:40 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108d73d80sm1440150eaf.4.2025.06.18.13.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:35:38 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:35:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/5] Staging: media: atomisp: i2c: struct definition style
Message-ID: <e9b65715-7ea6-460f-9749-16e07844d3a2@suswa.mountain>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
 <20250615231143.1558392-4-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615231143.1558392-4-thomas.andreatta2000@gmail.com>

On Mon, Jun 16, 2025 at 01:11:42AM +0200, Thomas Andreatta wrote:
> >From `static struct gc2235_reg const` to `static const struct gc2235_reg`

The patch is probably fine, but this sentence is weird.  Please
re-write the commit message.

regards,
dan carpenter



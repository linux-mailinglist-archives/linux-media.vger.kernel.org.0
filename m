Return-Path: <linux-media+bounces-5456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB385B226
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 06:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183E128380F
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 05:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0938956B91;
	Tue, 20 Feb 2024 05:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0nkvVgq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCBF5677D
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 05:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708405924; cv=none; b=Z+suMWGYswJqkUW8bLg6oZY9lchvciFaWNmHyCJ195dFklOlsI21gr+IoMTuBkW/yb/4IPLYwlIM/jfDPaCz4RVlOh6/uMYDlTh1lEaa0QlTq7RZj2I20Gv25Teyh8t4BQEhpTWjSLkKAiygt4EU5E7LbPSXn5RhCTo4Fiys71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708405924; c=relaxed/simple;
	bh=P+/HhRLclhnIoaOWdptZq/oDYI5tJKDJu31V4vnvpRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAh9MYRuDcWKjQs2s/PYSfp/89rb7qBkBwROoIuCJaebxSxpvRjs9nLHl340wMWSaACHE5EsTiGSUNfFH3pa0ngItLNBr3nxdrmckkJyh/4GW/AoDZrJn3+CxRjC202C6JWnnljmdP8+pMlySNGDXyQtUeuIrb2kFcUhZIyk/BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z0nkvVgq; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512bc0e8ce1so1684773e87.0
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 21:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708405921; x=1709010721; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ho97+Z9XyV0V3EKFp1nj4w01pW7dIUQTWF51opt+P0k=;
        b=z0nkvVgqvrUlYCgPkRVoo/MkW+ZcCTslIch3mycrdlwr9/1Godr/RkDltgOCxoBcdw
         1I3nDr4I9dQciV0dTXPQl3FJtrCqZ7CBctQdx7BW9PT/RdFUtfWs+QWOQF/f0frLqX0y
         vgu1lCNXKfNyXIAiOY8hjUO1lKnetqc+Ln3BZzJVxzoH+moIH9Meg3D2jbInhiJEBBHd
         hH0EPrLR0cdjcTxXTHrFfwjv8kh8Zaspgn1wKJRngK2A06Fk+O3GokIQUcPUcWOPGgzq
         5A/e4ZCcFV7g1htR6l+/Sj3l5d9ja7ZXMRChLOtuJWvzJfQwbw/jopSmH1xqnofVdiVw
         7Iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708405921; x=1709010721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ho97+Z9XyV0V3EKFp1nj4w01pW7dIUQTWF51opt+P0k=;
        b=xF5MWBK9PC7bKOt8piEYWlveTLU05FqgLRXX7CEbLEkyprREy9o5byNHxyYwLcDvHb
         gzEqJHRB4n1mhmsoK5mckbqZB/dSTfjCRL1ZQvU+5niV72igx5gsgCGXpCjkAgBEz9qJ
         DOwG4hXOELDVDXsv/YlcAZH7AaFP9LcZt5cTh+3JVTryO8hCRyEFkkOGOLPH5ain+jxs
         9k7S0QY4nen7zxHvelTnZTpnePB5YbWf9+LZHZluG4fb7kiz4p4wYD0fEbOAXf/YZmGm
         +Fy5CgnEuCud1/vjFDGxXp4GKAXm6T6AdfIg9wQqxKg1S7+1SHY6IlqdyQlZOu9orNRd
         nOqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzoYYkdiQ96rRQFtQujstl8hMWulTNdud05Agbm3C8+Z2WMd2ZUPnTXpNcQ7+XYwD4BN/8sIoOJelDnxfmMl7PjDCnAGKnmsoERfQ=
X-Gm-Message-State: AOJu0Yxx9f2cxqbT3LyRdyn9zK3UaOJz7cycR/I+OWGCpajSDC47kRUF
	XTAoAslU2UHQO5SYvVUSFYqfvEk88HKBcfteRgxJ+rsq2rNQLY4Rop2NEpEXJVM=
X-Google-Smtp-Source: AGHT+IHbqUb2KIKvVKoBjpRJDXqck41PHOxDu5LU7Bz4meGHEBaEjCnZ2bAV7RwH8TMbR2gh5uA+eA==
X-Received: by 2002:a19:f706:0:b0:511:9746:6794 with SMTP id z6-20020a19f706000000b0051197466794mr9220992lfe.60.1708405920674;
        Mon, 19 Feb 2024 21:12:00 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id x19-20020a1709065ad300b00a3e786d8729sm2082419ejs.168.2024.02.19.21.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 21:12:00 -0800 (PST)
Date: Tue, 20 Feb 2024 08:11:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gustavo@embeddedor.com, keescook@chromium.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
Message-ID: <bc59a084-73bb-46a8-b02b-0ef990020458@moroto.mountain>
References: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
 <91d964c2-3d5a-4e96-a4db-e755455c5b5c@moroto.mountain>
 <3fe4c327-b69b-464e-8e4e-005fa1813279@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fe4c327-b69b-464e-8e4e-005fa1813279@wanadoo.fr>

On Mon, Feb 19, 2024 at 06:59:02PM +0100, Christophe JAILLET wrote:
> Le 19/02/2024 à 09:37, Dan Carpenter a écrit :
> > On Sun, Feb 18, 2024 at 06:46:44PM +0100, Christophe JAILLET wrote:
> > > If 'list_limit' is set to a very high value, 'lsize' computation could
> > > overflow if 'head.count' is big enough.
> > > 
> > 
> > The "list_limit" is set via module parameter so if you set that high
> > enough to lead to an integer overflow then you kind of deserve what
> > you get.
> > 
> > This patch is nice for kernel hardening and making the code easier to
> > read/audit but the real world security impact is negligible.
> 
> Agreed.
> 
> That is what I meant by "and unlikely".
> Maybe the commit message could be more explicit if needed.
> 
> Let me know if ok as-is or if I should try to re-word the description.

No, it's fine.  But in the future if there is an integer overflow then
lets mention in the commit message who it affects or what the impact is.

regards,
dan carpenter



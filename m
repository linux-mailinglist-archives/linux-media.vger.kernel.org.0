Return-Path: <linux-media+bounces-16944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8299616D3
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 20:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C79F1C21FF6
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 18:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A473B1D279D;
	Tue, 27 Aug 2024 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qkk/E5Bh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BF61C7B63
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782895; cv=none; b=p3lXQPinwfaVeN8OC7iSHHYG/xAG7zXEu72BFSSUSQ4dImrbIjFQCNOnF9aUolNHOLLcJBUoSyB2muxC4HwwwgG/w+FDVVGUzHS/VkNDN0rFv+T0lJfeKRkrW8qMuHr8eAxSwjxmu3xVXPKfeuoll2xT0p4hOKmJimV+M5H5CW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782895; c=relaxed/simple;
	bh=MpceHBZuHH3o2CueqUk5GDOo7VtJrr197q01MLuthFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hwmd8J6me90/COSAwDea14fzP4psbG65i3wlgrGitk2mudGbnI+rvuYEDuXwZ+LOAxREhdeiUvTbA1qpsiTblQTOMR4W7alzFA+QD/EFmJe0LQ2NLZCZ8YjWBVs5ne/MCL7+nFsbc6HX2J5YF9CJbcWW8GFdbEq1Sa+TRuWOTGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qkk/E5Bh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42816ca797fso52472355e9.2
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 11:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724782891; x=1725387691; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqdvqJEmzWDPrKZyiAdNz0J2ROp2OO31etrcR1BLAWs=;
        b=Qkk/E5BhNTbRLvBwbNC0azY9GNZg/1WDwXdZRF+ItgxohfucYoEN/nKaFSd/tSbOzT
         zJirMTA/wDgFIEmwg8q9JXSpbFnYDNikwrwD1cOcoUsSomSXH/l1vzcLIytNmfPwI8Ky
         uR/QFS2+PGEgBSqD89DcR5asbM1HweLbLrgeeizyOlZil8OQI1KYaC6HfhGgOadXtxJM
         Jvm4slbi+628DresDQ+d+4mS8Ee5Mi2iuwNHMVbua0VAr6luJqxg6OR1xKWAFYvVAqSb
         mndE1zBfRP3XK2hmPHF6bFXnKt0zMXCb7NaD7DhZR5ClRrKDJBv09orSmxOXHhMSARzp
         apKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724782891; x=1725387691;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqdvqJEmzWDPrKZyiAdNz0J2ROp2OO31etrcR1BLAWs=;
        b=WIKB/0fuaTzoMI5JgeoiKUb1HpoF9QDhA+PKD8G6JDPFbs3Gom2nMEY0VqNAW8NDwB
         678xZMlnWHMKhZQNCfiKn0OCnDa5eN7N8Fld92RtJf2ZNQQAxdl1FZOFPwjPQYE5xVAk
         ZyDB1Mag7kI64pIOB2ZUn1OKmf+SLOlM5bg7+zSaJHrLdWrpEs7sN5dgD/udVRkrHbCA
         r3bQYnly2UHvQEn0cufPtxHemWApBKIQNekydXsZCvDk8zyBIrn6tP3ppR5lDcnKwPb6
         LI+s4E7WhjXZs2oRDXFNcACX8MvcY4syHcfgKXpTeeLGF0fw5tHpjd9grISOOw3Slyws
         MXRw==
X-Forwarded-Encrypted: i=1; AJvYcCUZmfktJvv2jYg/vrnZb63pqD44Q3ESghR4auG6//LDZq64GIRpdEeIaz5e/V6U9iEIoisPf8H+uFRylg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+xsL+zQMASM/q50A+wc8f36H172Qev4KtLeU2RkSbq0ytPNU
	wlLSIbd28gcfsIdc88pvj9tfdvpLJSZ2P1TCDZ++T3rXv322gEJCbXB4ly9BKJY=
X-Google-Smtp-Source: AGHT+IEn/urW2WYXErg3s6zWyW9m2P6dJY1Stz7H7aazJRw4zjfpDd/WN9qJrYv1mjZWFicmilsI7Q==
X-Received: by 2002:a05:600c:45d1:b0:429:e637:959e with SMTP id 5b1f17b1804b1-42b9add4764mr27914815e9.10.1724782890655;
        Tue, 27 Aug 2024 11:21:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5180106sm198559695e9.41.2024.08.27.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:21:29 -0700 (PDT)
Date: Tue, 27 Aug 2024 21:21:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Message-ID: <44676cc2-a9e0-45b9-b08b-5280e8aa7a06@stanley.mountain>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>

On Tue, Aug 27, 2024 at 03:18:41PM +0200, Niklas Söderlund wrote:
> @@ -181,7 +186,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>  	}
>  
>  	/* PCLK 75MHz. */
> -	max96712_write(priv, 0x0009, 0x01);
> +	if (!priv->max96724)
> +		max96712_write(priv, 0x0009, 0x01);
>  

I don't like this either.  The comment should move.  I didn't see the ! the
first couple times I read this.  I don't like the MAX96712_ID and
MAX96724_ID defines because when humans read they only see the general shape of
the words.

https://www.dictionary.com/e/typoglycemia/
https://en.wikipedia.org/wiki/Hamming_distance

I guess the best we can do is remove the _ID so at least the last characters are
different.

It should be something like:

	if (priv->id == MAX96712) {
		/* PCLK 75MHz. */
		max96712_write(priv, 0x0009, 0x01);
	}

Or maybe put in function.

regards,
dan carpenter



Return-Path: <linux-media+bounces-41516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A87B3F642
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C1471716A9
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF482E6CD1;
	Tue,  2 Sep 2025 07:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxPGfhMa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCCA2E62B9
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797126; cv=none; b=n9hBeMMYtqcKUfaKU91CWG4h+Ytg3jNK0RuXFww9TiwrOJTpCvVX3MQQ4U1u1M7t4hCBOtSP0NPDEzzheXAG3Lhu48/qVz54K6kemNGsmBRJ77Z4ESlDnuCWO4RwfKN6AURAN151VzQqMK8c546RqbdSMrsdc3MAI69KlD8bZ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797126; c=relaxed/simple;
	bh=4Dj8wHzcKZ+KE+l9JlZw2/wgZaNm5SI7Vg6vhkZUvrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzORWWlcaxnnNYDhMs2pCoruRF3SBlYfkF8cNjAiPmPyioNvX02qVBYgfos0ITLzZcND/udQeGGGuDqsIa+xm9MVQ6hsaqQNUBQqrDQLDqMmP/bWcPhmcOmz0Zsb+CKmJcUdXYJ5ObgidMLQIP3ppONEnAWXv2BUctufN8SLLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxPGfhMa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b883aa3c9so13891225e9.2
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756797122; x=1757401922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=leRMEPgF8RUEvULChzHRAQuhgrQpyQ/k4NKGFx3/OIQ=;
        b=NxPGfhMalr0puieqZ0NjhnLO4k+g37416+742QxVCL39sCZ8MZ0jb++o2JkAxij8ZN
         vJn/GLrFHv4il+X4O+S9k0gc1m3dqqP0sPeNNzTjEIkm47mcjrtddBFWbt0r9Dl7xhtM
         n/Nt60RDPFxYA5LqefiznDa6Dwj1ALVZPuYSoeFC+Po/xGqv2pFlPxJBIAnAM1d4hNb6
         qcND8K1zagmtFFVrGGOii5GgbfTLWGMbqXAYTr3inpqcsYAWui9z0GxlN1GOzu8SK9Hi
         HqUdBxZrkWRxtoDJZRwKzQGI11wktL4skOeXqnTWj9NG88mpdOP4Xw2vAKnsK/vMicQ2
         dE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797122; x=1757401922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leRMEPgF8RUEvULChzHRAQuhgrQpyQ/k4NKGFx3/OIQ=;
        b=BGHIJha5M019hu0B6GvTH/SvEGDRvPxXMRfRpTk/oaj5V/MoWpRKF4tkLf7r7bIr5w
         PZj/z6+UJpMxizZX/xyXT3t6sgCdyWeov1KsOGe6VqpOtZd54PZ72iCtQ45Rl4OJOKM7
         Q52FuhTDEYnofnVLtqQsNt5XRP67at/5l3fZC13q6sQPreE36gLoYhTf8Sixn+pcI6yW
         gltgiJAWaj9y2h7LsLgm6tply+oK79B0cXGk3yBKuBrqz4rlmQe5Naanhge+aHnkQE7a
         GbifoJT7R15rD+5+7ERkY02qz8VeiV4jaH9+MSVw09mw1l+VLkKGmpWwn08aG57Qh4jH
         ESBA==
X-Forwarded-Encrypted: i=1; AJvYcCU6qTO0iG2gA4K4TT0GFLNHttKS9OMBzkFaQJCXrFuMaD8yYjUh723K3bQCgNPISpFvYU6S+etKaMJqSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDOpIwauMoc4uSq21Z2n3aXKSDdVcJ0psn2EeRfe8tyRWbe0m
	k5V5C18Xiu7Y9SocBEBqyq0MNfGQRSAw33BAH5sEORcA0Q+nf5NIW93eGyb1i3zuNW0=
X-Gm-Gg: ASbGncvZvicTzPKDUqk4o2aQFu/arRy5Q3ox2iQr5UFYk2RaYMWX2Ty5Gv/6z2c8OWs
	8BtPp0e9AnnJ0sME9IsF3FXMXVsc1ZsdWAZWTY0fm0W3Bq5m/0l5PIOisCRT2/SYydnlitC1l1s
	AVnZQHl6+0oS1EyFrI6RdFEn1FydDGi23jxaRBkhJojJslsb1E9HxxegTVtaFp8blY63RPX6/bX
	Rnvusp0Odn5LRY1lmknKfIaQmGzLC7t6SlovdgSCC12jgfeQflPhDhm8KJhQheyzOWDpkoHGUmH
	2yMHsO3503D6qmENjiTgkBPXQJO+nDtxEWvEuz7EPoDfcNs+nzOUhx0U4QIDQKA3luzC1y3mbdU
	Ywhu0C+7EG5ZmizwjhYAFQD0cNmY0VId69XROGg==
X-Google-Smtp-Source: AGHT+IFYuCWJOgHXp+J/kYURbVc6VnwzlfI13ByiraVfMdlwIoA3Pz1WV9KjlyYQt58VCk3unM9JLQ==
X-Received: by 2002:a05:600c:4f8f:b0:456:43c:dcdc with SMTP id 5b1f17b1804b1-45b8558baefmr77527515e9.33.1756797122251;
        Tue, 02 Sep 2025 00:12:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0c6dc1sm267152735e9.1.2025.09.02.00.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:12:01 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:11:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mikko Perttunen <mperttunen@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 19/19] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
Message-ID: <aLaYvsh1sCF7uF6Z@stanley.mountain>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-20-clamor95@gmail.com>
 <3643424.irdbgypaU6@senjougahara>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3643424.irdbgypaU6@senjougahara>

On Tue, Sep 02, 2025 at 11:38:18AM +0900, Mikko Perttunen wrote:
> > @@ -282,20 +411,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, bool on)
> >  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
> >  {
> >  	struct tegra_vi *vi = chan->vi;
> > -	struct host1x_syncpt *out_sp;
> > +	struct host1x_syncpt *out_sp, *fs_sp;
> >  
> >  	out_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
> >  	if (!out_sp)
> > -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n");
> > +		return dev_err_probe(vi->dev, -ENOMEM, "failed to request mw ack syncpoint\n");
> 
> Existing issue, but dev_err_probe doesn't print anything when the error is
> -ENOMEM, since "there is already enough output". But that's not necessarily
> the case with failing syncpoint allocation. Maybe we should be using a
> different error code like EBUSY?
> 

I'm not sure I love the rule that -ENOMEM doesn't print a message.
Deleting error messages is fine because it makes the code simpler and
saves a little memory.  But with dev_err_probe() the message is still
there in the memory, we just don't print it.  Printing the error message
doesn't hurt anything.

But if we go down that road, we should make it make it a checkpatch
warning to pass a hard coded -ENOMEM to dev_err_probe().

regards,
dan carpenter


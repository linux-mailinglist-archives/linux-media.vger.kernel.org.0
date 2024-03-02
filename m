Return-Path: <linux-media+bounces-6283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C8686EFD4
	for <lists+linux-media@lfdr.de>; Sat,  2 Mar 2024 10:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1745B238FB
	for <lists+linux-media@lfdr.de>; Sat,  2 Mar 2024 09:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD8515EB0;
	Sat,  2 Mar 2024 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hmfcTGw8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F127134A1
	for <linux-media@vger.kernel.org>; Sat,  2 Mar 2024 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709371849; cv=none; b=BRDTa4EvpPMaSEj+4n4AzLlsvS8QMJ/30N5scay6Uu61GEkBmdrdyqAPd0u1M7frFRswCaPbPlG5d2jM4QaYUXFgHivwDqRMlRjMqVzM9BivMXe24V/t/heTDudD9aLnkTxsNHGnxXGsdrBvCyRh+1Hr2VqBCsBiMk0kqe9lLgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709371849; c=relaxed/simple;
	bh=eCgnW8M/j8u34ZboqlKqp7zGcLxGZiu6FsXWMaJggYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oACPo+HN7rrOHO+IUOavjZSwyoNmXuYpnX7kfAEGjSiqzYFurH+mDRS1wNlJAXZAPKeJtKPueEg/9FV3VhNnp19DPSHWQe9MUK/jumMjH4qqPKwSryIxXxnB2dav+yOgYWcns01r0dnf7hpXhfyNiQGmaoEVGEuT7CA7uOHsd5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hmfcTGw8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33d2b354c72so2063364f8f.1
        for <linux-media@vger.kernel.org>; Sat, 02 Mar 2024 01:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709371845; x=1709976645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jiIgfGNGkcSh1CwXpg72grT/j2Z4zd63NwGcxMrVBgY=;
        b=hmfcTGw8yF9Cy9MHRW5sZ5MU3wbD6jdvUXBreLEQLNPRqKVkd3yLqmOAu0tjC+qE/c
         RPDTTdgwnNr0vM/QFvV4ZgANU4jsIFSSNNT666rtIXZE8gVe+f1FAKEQOsrfR6kve7Yf
         Z77FcjIgmIv/gaNUnrSi1RuDWuIDHGvci2ReRxq9/hfeCMgmNJTF0/anvtT3hwhxi1nT
         p9YyMGIiNfxDZgigSDXf1CjSffgGANAqxIChL0XCKyAVRYeF87o0rF4C7JKJr6D84LzT
         1oA+XuyI2Rrzmd/ZJiWFmqA1wzY5gNZNwxZJC6kYLHZ88mkrNx7jKhbmkqqDslvVux8j
         RsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709371845; x=1709976645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiIgfGNGkcSh1CwXpg72grT/j2Z4zd63NwGcxMrVBgY=;
        b=e6cNhnTvJtyioUbKye6ztYnFVrUjGqWjw1FxU1loo8fDgKxcoCS3oOaynPZKiIaplw
         Zc28Giu2GnPOGWKsWsbEZ2N/UQZH/38uV0H3xigRT9kwk+rWi3zK0ZNFCf7g3fdAqZXd
         hTSP0Hwr+SfjFwZ9kwwqvHPXa+K47M4fwlhfFzeaMnCsTKBJLfbtbxPlYbC4e6Q2c7ve
         vNngdCYf7UUv0xF0SexK9FWujU2CvFEq5pDnkorx/Jw3ebMmKczhohmMQQI6ULKusQyk
         pepZ2eSIrnHaNF6ObStG3U0ZwZwX2bxtPlp00B4l44VM3LJ3IUzZ9h9S/ojRWaAIORU+
         0djw==
X-Forwarded-Encrypted: i=1; AJvYcCVBEt3HyYvuxnYNTInMAYWXbRK2J2qsarfqVFjxSWm1NIbwnXTP8Vd/ol/yopRJMDq48qRmISis+/9ntZCS0K7iulR/c6BwryiEbgI=
X-Gm-Message-State: AOJu0YxIMvPSdf3/uq3AduUHjYHJMT6dG2SB19QS9UjgNsC/PlLm2S9C
	xYdnyGR7Kl1x742cswiZfACLoB1BLAzgZN4uO6f+XrulDBXAG882UqrdeIDCx2k=
X-Google-Smtp-Source: AGHT+IFXnqTy0LUAEYOwQYMJaDu0a5N2FH3MFiuF8hU4HaaEjIayxdAj9Dv0vCC/pvvTbMPTpzxg5A==
X-Received: by 2002:a5d:4d45:0:b0:33a:ff66:fecc with SMTP id a5-20020a5d4d45000000b0033aff66feccmr3044907wru.26.1709371844864;
        Sat, 02 Mar 2024 01:30:44 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d604b000000b0033d9ee09b7asm6832874wrt.107.2024.03.02.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 01:30:44 -0800 (PST)
Date: Sat, 2 Mar 2024 12:30:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: media: tegra-video: Use common error handling
 code in tegra_vi_graph_parse_one()
Message-ID: <9f1b617f-06cb-4b22-a050-325424720c57@moroto.mountain>
References: <dbebaea7-289c-47d9-ba06-cd58a10ea662@web.de>
 <20240301183936.505fcc72@booty>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301183936.505fcc72@booty>

On Fri, Mar 01, 2024 at 06:39:36PM +0100, Luca Ceresoli wrote:
> Hello Markus,
> 
> On Thu, 29 Feb 2024 19:55:46 +0100
> Markus Elfring <Markus.Elfring@web.de> wrote:
> 
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 29 Feb 2024 19:44:36 +0100
> > 
> > Add a jump target so that a bit of exception handling can be better reused
> > at the end of this function implementation.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

These patches make the code worse.  If we're in the middle of a loop,
then we should clean up the partial loop before doing the goto.
Otherwise it creates a mess when we add a new allocation function after
the end of the loop.

Someone is going to add a _scoped() loop which uses cleanup.h magic to
call _put automatically.  This is a good option.

regards,
dan carpenter



Return-Path: <linux-media+bounces-11384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A7A8C3517
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2024 06:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94EA51F21430
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2024 04:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DDEE57E;
	Sun, 12 May 2024 04:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6Eh8Ngb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA135CA40;
	Sun, 12 May 2024 04:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715489225; cv=none; b=DVnJk2ZgMdHe5A1Ey5f5gZXFf9n2XDytWcq0C0mdU+ZDTSIwAtgGlBT9//HZyTqzknY5DqGIgrstKjXRxPlX6agSubwau2oZtNVAsmCOh6czSySQjJmPKNGEC2Zdn9Kkzru5xpbjNbw0ORPfk5JugmcYda0h5su26YJn+DhrOOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715489225; c=relaxed/simple;
	bh=jYe8uLEyqnr17Ei7I34ZJuqQ4C/EH07pnG83ENopPBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGuEFxb34ROLL7/vIuTNHBkjM57e4bJYNDKvZ8SkEIKMGkuRf/BkEcC/saipgubJzlavKL3+c1sXcrYlAjzDvEo5qGZFUQV+519QV5XQyNbDKmLq96Yol084seRRFnz1CXCsMumKTnH74hBTz2kUIyT1qdXoZ70Dy0pGYKPG7vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6Eh8Ngb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41b2119da94so21257015e9.0;
        Sat, 11 May 2024 21:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715489222; x=1716094022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KK6TsAwtGjBbTSQzMUzip8w3QmdfL6P+ac45Lx3W0NM=;
        b=W6Eh8NgbcsD38ZXrJ6A5zpwnZeZTmaNg0EvmwEp/eUx39V9jOZv8n63lqWIzefbsGO
         HzOHK9XRGTU8bkNWEIXYoEiK0HjouQ83H2KAV+Q6hKZX2KmbCqPjaBaL+wEWJjbR5DEe
         annAAReyIr9RGzCCX5Lo53/xJd9RoRVs4kh1rYzizFHAZn6ZqUkdbqlExLPZzAwCtU58
         l5DJB0a2ffj6QHRbhqmuLagBFMAPXbUaV/mdl53nXUZzrOR1s4RP0WBxukVrvvl8jbBG
         9rK8KS0/BFI4IL4hdWpvGQ7FHuD4vmxm/HWPZb/6H58F+1YBGBCo10V8yoDFYT8T+109
         ddLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715489222; x=1716094022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KK6TsAwtGjBbTSQzMUzip8w3QmdfL6P+ac45Lx3W0NM=;
        b=V1gBRRPb+HCuZp/4uvNZ+E2+Os7D/oJJa/gOYXLp8CfwgJmLHWTROvJD8+mhGj9eXQ
         AMmXOmeHUaIKtfkB3r6lUoCXUs+ArVwh+tHu7FqLozukDhdVI2mbUzup/mIOIHDn3ztz
         EM1JM2/vsD12GxlIesnt4F9aqt0q/5DVT+zZwPmiNNQhyBoYDJVY2f0CwLjBAeSN0J7n
         YjyPVThoRVAB9X2JfGZ7BGxwuojKZHiZl6VL02eN53TV9WWUhOiItbecOQRWee8LTBJf
         PWtZAOV5BMlf68LRMXLtKFf2jDauPtLzpUWowmSti7nvTuQQec9NJfRyB/WVCP7nFKzm
         2OUA==
X-Forwarded-Encrypted: i=1; AJvYcCVZNOrbEAxXOeTEjGn4FanrvnVZR+hRlVOIzuaJedqqFv5f4uHenza3OpFGnHWMhF3t0SgUjQDPQkP7wnDditSGFWw6IB5m/f0JV3Myx5Deg1/tPSmOD43yJsTpr54rf/cXuHezjZCJ6d0=
X-Gm-Message-State: AOJu0YyNz/oss9DPrLrfOJqPfSkx4qaBNsT9lt9vBcFgzhEEjCXdBTDT
	HCnwYfQ2ZWaAsFDinuXwGMvsBDlAgzTi4YhYIoCoIkzKANiympA=
X-Google-Smtp-Source: AGHT+IF2rV2/5tiwIRZTS6xAYsYRSQHNfOqwPFODg+hwu4WCB8tZoVeySO0NHnVdDaz/CbLzulaUBA==
X-Received: by 2002:a05:600c:3508:b0:41a:7065:430a with SMTP id 5b1f17b1804b1-41fead7b138mr40562765e9.41.1715489221923;
        Sat, 11 May 2024 21:47:01 -0700 (PDT)
Received: from p183 ([46.53.251.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd09sm8074593f8f.14.2024.05.11.21.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 21:47:01 -0700 (PDT)
Date: Sun, 12 May 2024 07:46:58 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
	sebastian.fricke@collabora.com, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, jani.nikula@intel.com,
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Message-ID: <0e72422c-8c83-4991-8def-97c40e0c06ff@p183>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com>
 <7214a8b5-16d4-42a1-868e-9574c506be85@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7214a8b5-16d4-42a1-868e-9574c506be85@ti.com>

I think

	roundup(x, 1 << n)

is more readable.


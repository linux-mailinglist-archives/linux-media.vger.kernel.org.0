Return-Path: <linux-media+bounces-18587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90C986A19
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 02:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7BDA1F254A2
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 00:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE55B1714B4;
	Thu, 26 Sep 2024 00:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnFYlkYL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009095FEED
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 00:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727308841; cv=none; b=c/PuiwgPGGh+WK5bHzB2hO2jHMPSQ2NTOF46EbAZ9aR6lhtzzVLuiib1eYgZWy+icAG3jrXhgXhqg5d/YE1FeePtErQjbqmsnRE6JI+wPKrsSYaGmlu3jcEuxv/t1Cp7uj+EL5DdO7LrZjPGYmWB5Rxh1NcvWo0Z24rldEGUaJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727308841; c=relaxed/simple;
	bh=kIhF+RuNQEUqyDnNf4F1z6mRKug06QAN6W/E4ijLg1E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tbmu7Pz0l3r6zB4nUQoum6q1aFMHq1t6GS9NLq29K5hPu/GR6uDbZ8sKySOV3jznlGS8wdlbHL5Wzf6krAtlr35UnneOERw1BGLXAgsyEkThHBEctUoUqHkbNmAIkKeVPSg0k3uioSt1EwzJ7HhLAODZ3v6xnD4AEARugrqHKWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnFYlkYL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71798661a52so354921b3a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 17:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727308839; x=1727913639; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mr1KIIbYn5QIB5KMhm2v2FyjwLUbJX+hAJ6OyxAatQs=;
        b=DnFYlkYL3GqXMwnhUbqrNKpWUattouLfuJ273fJXa7mGptJPQ9ukue4Jz19BhuR5IT
         Oh9hLYIuGinsNSKactLn/CVGEywF1UqrKQR4OaHWn16G6W7N/HPWGjJimbmx7SqhNZMG
         hrFMQBRtVZuByZPVHvf/347wiaWcwJZ3ZaM5GlZtDS/V++W8/1cpHyE6d615WPwz2y9M
         +CKn9cIp0SGrLZyo7defOemyZU7PGwOFxWaTFB9Ez40EsfXjGJPwNadkBLzjCa0XGXRP
         WI2ISvA/YGnL17NLJW61FHxh4bBAD7SKHks0Sa6bBecFzIUmdG03N+c+Im4I4TarrmYv
         rOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727308839; x=1727913639;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mr1KIIbYn5QIB5KMhm2v2FyjwLUbJX+hAJ6OyxAatQs=;
        b=LRHRuP6ehQF9RX/aehAZo5nsFjlKEFsSJGPGrhkvm5YXlelalGwSGSrQy97GzF55PH
         /d4oMbDPUgxrVTCM21YLYqlGc8BWBBU1LETcMIfrGZPj2ODHFmGsAKK2T80FlQtPyJ7W
         70+x5MCV6xq+ALU0Rfk1NdOTJxOUAlTzDb4biy3lgTr7GWmhIUACCCl+grR7kYGbi0yJ
         9rkrxkb02bo5k1MKDHiOVivbA1lTiJKpM1FbzsHvlwr0USf6LsvSuaoOOBi1exHzrcHw
         4PCfaRMhn8Vxk2/Lk3T70ZiKRjeC8gEPaQFp22F4/jY2me2m+h5RYohvWPAXA+NySUS3
         QrOw==
X-Forwarded-Encrypted: i=1; AJvYcCXsA4x1Kg1m9IPPMS+QwTUXE7Bhusba3+HuznW7XI2Le7IdPljqncCgSjFW1G7TGlo+29ulWIc5mrzrxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz4huVPop1KDfusb/cOpwXLgsbhLgasJjq057kLP/W/Jrf9Vf8
	1zetL93vQwuRM5Qj76I1nhLnW1uUF5kivgAbqa75zIGzdLQEhnPA
X-Google-Smtp-Source: AGHT+IFO9ZntUHHB/jt7SbctRqy/sN7ybu1RR3WDa0zQVvHnbpnH5nijHyYkP1fMy62CePSX9p7LIw==
X-Received: by 2002:a05:6a00:802:b0:704:151d:dcce with SMTP id d2e1a72fcca58-71b192c8f8cmr1871807b3a.5.1727308839060;
        Wed, 25 Sep 2024 17:00:39 -0700 (PDT)
Received: from ?IPv6:240b:c020:4a0:e908:6c7f:92a7:561c:a438? ([240b:c020:4a0:e908:6c7f:92a7:561c:a438])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc83477dsm3250345b3a.28.2024.09.25.17.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 17:00:38 -0700 (PDT)
Message-ID: <1bfb1b46402268c4b6c79ddb87c2b27a0590c3b5.camel@gmail.com>
Subject: Re: [PATCH v1] media:tuners: Fix typos in comments across various
 files
From: Akihiro TSUKADA <tskd08@gmail.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil-cisco@xs4all.nl>, opensource.kernel@vivo.com
Date: Thu, 26 Sep 2024 09:00:33 +0900
In-Reply-To: <20240925070920.3304189-1-yujiaoliang@vivo.com>
References: <20240925070920.3304189-1-yujiaoliang@vivo.com>
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

>  drivers/media/tuners/mxl301rf.c | 2 +-

> diff --git a/drivers/media/tuners/mxl301rf.c b/drivers/media/tuners/mxl30=
1rf.c
> index 7c03d4132763..3b61c3afed18 100644
> --- a/drivers/media/tuners/mxl301rf.c
> +++ b/drivers/media/tuners/mxl301rf.c
> @@ -64,7 +64,7 @@ static int reg_read(struct mxl301rf_state *state, u8 re=
g, u8 *val)
> =20
>  /* tuner_ops */
> =20
> -/* get RSSI and update propery cache, set to *out in % */
> +/* get RSSI and update property cache, set to *out in % */
>  static int mxl301rf_get_rf_strength(struct dvb_frontend *fe, u16 *out)
>  {
>  	struct mxl301rf_state *state;

Acked-by: Akihiro Tsukada <tskd08@gmail.com>


Return-Path: <linux-media+bounces-45124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D544BF5E0D
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 12:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 284C84FA823
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97A8329C7A;
	Tue, 21 Oct 2025 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NN1V080M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681622F0C67
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 10:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043794; cv=none; b=aWLpE8wMKnEa90DOnJ9NK8D0QHfRRLvP/mCqe3Uu3vGVcR6m0/ZaDjuuwHPrUzMW4zM/HFxCWii1GLI0J+/YeiFOlbhwTayR5jGhkxiTfw4XCHNR/e9qer9f4TWYZiGLwOjs4/uPakufcQ0X9Ifk199kRsVpQiD6i/21RFVfEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043794; c=relaxed/simple;
	bh=tibOHuElsdn98IyG9GdCHJwfonoWwofOLVF9QyGZnAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HR7fAnNtIboOU7pMzPLcqBVRRa2DXsX9vYxBIxN8j/dE9JshexVPk7fkBro+WYBIWrMV0ntOCaFk7kmusSh6yEHHavWsS53TD8gXMmMICryPONtcoYtaYYsCZPGIk8Nsa44FakkRFDDD1xnX5KK11/zyliyUSosqWw0QWUAEJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NN1V080M; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-367444a3e2aso66892161fa.2
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761043790; x=1761648590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5mx/neDnkeSOkePEkm6VBEHII9lIyY01G34R6H9ZvHM=;
        b=NN1V080MvgfvUgCw4iMvVPVFlhUh1UsQKu39jqYzNyNVTXRad+qO4dibOIdUtGsSKq
         RV8RB5l2HufHgvnxiL4UgqwoVzC5R+O/ahYOgOoT7v+r5aYUhOw95/zkE8d1dadLM85b
         6BDjGpNGJFMdjAnydVVVz0Bql8xBSGa841O5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043790; x=1761648590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mx/neDnkeSOkePEkm6VBEHII9lIyY01G34R6H9ZvHM=;
        b=GKC5Vx0X6Gk2VVqRyMxwA1txfCDIExLG3YnOjKMlFNUoxmSRivyvuWdcK3IFN1s4On
         iAbqrhoWd6nt8Wnux/AE8BLczKtubhJaGdXX9P7Ta6b/Sw/3iYgyFoIFUmfHm9NaO8pQ
         PdPbOS4HehBjPRBhU+3zUONEQAIHT5t/sjYUImozU2pFERdCtgQcz95YV5n/GnRStnFz
         C3M5oE8DPuOwcgR3geeoe0QWeEIX/PXsogGDRTBtKH+jM7GNNGMUsZY3VvLZ5bAhdRTp
         TwDXHIIpa2eCnUPKNl483iUdAME8vbOFfIJNrf0StkHBeyTJwY7bOdUr7OQKc3Bu7T1K
         8XvA==
X-Forwarded-Encrypted: i=1; AJvYcCW2gnxeEkTJgfbIGUdFC3lCHxxVxvj8WG2U7r3YJzWE8z2xj75MZBnNpj9ukuGLwYdO1buGH4m7uwfe0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVUMdvz/g4lWmf8wuEqyhCiGeA59xbIRrt5jvHb71pL8WhBu/B
	FnSJ8NMYIDvQwiePXasgoBw/EA7p0JqSz/1666DaUNY1pu/sXf9H9EiXgqxx05pZwaL3JPljX1g
	8n7w=
X-Gm-Gg: ASbGncuqlCN6bA8vm+UcaKb8JLyHHvCPlcDS8PRiTFSKQdyRBN89kEZx1C2+UkwzV4+
	NwEt4j+JaE2WdCrnOgRaMkDYIr6gxUWDkC7cJgIIJclwhqSFiA9t9V5cXM6Fp4xRMu0nODSod23
	Bt5oJW50KWj7n59M6mDK2Z+sBKZ5QrL8r4jhrR2Nds7T6vLTjHU/KxXz1rPf9pH6CekCf7ExO8F
	mWOhW/BRIKrAa61pekSJ6NFf6unWXa9TCA8NJ+U4vCBFoWudU+jL1+5K2KDNAIyyXL8a9sKjvvy
	z4vOsEjENoRe8tAaMaL9gYEwawTC6rgM7miZb9lvQlO0bakesVOnZ4yRWwQRgNu7iGqcOlDAris
	5zv+MUen0K8qa/8Fw8CYEkWs3WDJVkPXlV6MqK1pyfRCTMadnqlnBvPn9t5geLXCQeochAopJuB
	yRQ53e6dgmEws87oTWxbb1UshMfPzIn6YeNL7/8KEpO54Ha3fV
X-Google-Smtp-Source: AGHT+IHjaxX7xBfuA5g1Byo4XU20ZZ9rSmh6Lufx93obbm35lmKshrPPx7cj4C7G6bsJzJ6YjZrWqQ==
X-Received: by 2002:a05:651c:1595:b0:333:b6b1:a151 with SMTP id 38308e7fff4ca-37797823c67mr48101371fa.7.1761043790101;
        Tue, 21 Oct 2025 03:49:50 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def16a23sm3492274e87.67.2025.10.21.03.49.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:49:49 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-591ebf841ddso631838e87.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 03:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXH7z8Zy42Ce5+bjFbzhXVQsgokkrbTTZqOBCzNhD0Jy7Eo89wJ7uvL5k+pWIGA/vm6ZC3LZr0Yfjbfg==@vger.kernel.org
X-Received: by 2002:a05:6512:3e0d:b0:58b:151:bbff with SMTP id
 2adb3069b0e04-591d85aa15amr5272096e87.53.1761043789249; Tue, 21 Oct 2025
 03:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020-imx214-smatch-v3-1-2c9999efc97c@chromium.org> <aPdPyc6Lasmp3EzC@kekkonen.localdomain>
In-Reply-To: <aPdPyc6Lasmp3EzC@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Oct 2025 12:49:36 +0200
X-Gmail-Original-Message-ID: <CANiDSCukjH51Gi5S3ra6Jm_kPWhkrsTPGf42DurC1Mvrd3XMnA@mail.gmail.com>
X-Gm-Features: AS18NWAABhg8E6YVAmQ2J8L5-lvGKrjzv37vA3BgSueW2qvvpDq7brmdJGeLTbs
Message-ID: <CANiDSCukjH51Gi5S3ra6Jm_kPWhkrsTPGf42DurC1Mvrd3XMnA@mail.gmail.com>
Subject: Re: [PATCH v3] media: i2c: imx214: Rearrange control initialization
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Tue, 21 Oct 2025 at 11:18, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the update.
Thanks for the prompt review


>
> On Mon, Oct 20, 2025 at 08:18:13PM +0000, Ricardo Ribalda wrote:
> > Smatch is confused by the control initialization logic. It assumes that
> > there can be a case where imx214->link_freq can be NULL and ctrls_init
> > returns 0.
> >
> > Re-arrage the function to make smatch happy.
Re-arrange the function to make Sakari and Smatch happy :P

Best regards!

> xhci_hcd 0000:09:00.0: HC died; cleaning up
> usb 13-2: USB disconnect, device number 2
> >
> > This patch fixes this smatch error:
> > drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> --
> Sakari Ailus



-- 
Ricardo Ribalda


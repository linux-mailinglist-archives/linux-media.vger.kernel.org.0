Return-Path: <linux-media+bounces-20022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F539A9B2B
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 09:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B84581C221CC
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 07:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1401414F108;
	Tue, 22 Oct 2024 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I8cR+iZA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AF714D708
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729582563; cv=none; b=tiMRlLkTXz9xkjG2SKq/3SMzusqUadr6DWQ+z2XyVT2MeVQMU5xKehNyTDEuIMa83c7Fu822/KqjYCYs1IZ1oh7WSZqThWtqZSWjt46xrg6brJQ04UQ0SP2IYhXGRhSXiwcHf6m89Nd+fD4zanVcr2cERJe2KqaoFF2rv1IzQAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729582563; c=relaxed/simple;
	bh=nWT6k7bB84jHSGmt2PK490FRXMkkgB8yxa7zOi9hrPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqpMkXg/Mx+p1aWOy8W+IIpQg6skBZ7zQjSZVb04jFP0RkptzNeG/ce4Sdc54rwET6Gnyg5eKvbPRYhiFjPoUv2VHicBmpj7Xk/DyS9s20DGCuUZ6PdrkOJqKesOokwHdSrhJY0/FVFa7mLGPqkTfvvb9ERBPv3Mv9x0o06rDcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I8cR+iZA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e59746062fso1857944a91.2
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 00:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729582560; x=1730187360; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WMwdKg1sb6tQDq8w6iPXg7E8VwbkQs18En4LqkuI6WU=;
        b=I8cR+iZAEja//Sz2CJMp3ykyLl1x9itIV3jSPcaBJbeR2wQ0+xsu8nbmgtQpdCF8Oc
         QCNtrPnz7DYIOp1jdnJrC0px0gF3lifL1DlpiDZq1hLVMZqvNQXhejooCmM9dMeZc0pu
         I+W3yrmi3fQSmMQHdCJgawPq/hGMM7qeKyCh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729582560; x=1730187360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMwdKg1sb6tQDq8w6iPXg7E8VwbkQs18En4LqkuI6WU=;
        b=P/RYNbs/ojOHPuB1fQjHap2KrPhP4genItTs+fludjSUZJKr7sMlFK8qGqKZjitvWx
         Nq1PIZR0RTxe2JC/qub9vrZVdNxIlz9BJ/qsgGYYDf+aucy3vqt0vQzFMIRZCCJn8tnV
         05FodizrMPuuKPdoVwFsKJWRL8tyWkZZScd8dASvEgNRUKCTx00vUcOIj3LuhEhWoAhE
         A+dAQzRw5mPjxFd7QKeE53LBhJbFbmXAYM4d1sfE9w+CT0kGhyoByzSocW/5JXbFFICY
         mysLAxvha2yHmUJj3rrVtQbklFpUXyZXqPmZk+kkYizfry4NmLZFgJ8qxy5fezPR2pf5
         NYvg==
X-Forwarded-Encrypted: i=1; AJvYcCVsu8XvmQwCov/TX1plJMWoRkogA98R2CuufKxF3uUAsJfQ3VQguCRiC0tTZ7ogt4x4iY4eeEnalpUKog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwc3MFzYZhnwkc+NuwdRJiO+iCeHGlbbbLmTVRKs4yFwfNeNi9
	8+0yrRoaW8y95aq+Z1Mcon5MDfoS7vSESkn4sqkCrh0g0KxrMgc18K9cM8ADp+SnpJLP8EvvTek
	=
X-Google-Smtp-Source: AGHT+IHyNS7Pro7EV258beLQ/SDHJ5qRfeUKKzB3upyDmATXSAozrPQ8OYnkw9RUEp4L1r8QRVexew==
X-Received: by 2002:a17:90b:48ca:b0:2e2:d879:7cfc with SMTP id 98e67ed59e1d1-2e5ddbaa8f5mr1897160a91.21.1729582560400;
        Tue, 22 Oct 2024 00:36:00 -0700 (PDT)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com. [209.85.210.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed83dsm5302224a91.35.2024.10.22.00.35.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 00:35:58 -0700 (PDT)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e6d988ecfso3954633b3a.0
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 00:35:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhEF8+qOGnx3Lp/4Pb2JcuVToFb12MX3cIHNDzzs0MJY68Ke40lpA1z1pCr+DatQ/U8YfrvWMEzcfuKQ==@vger.kernel.org
X-Received: by 2002:a05:6a00:180f:b0:71e:80b2:240 with SMTP id
 d2e1a72fcca58-71ee50541famr1910359b3a.18.1729582557652; Tue, 22 Oct 2024
 00:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022065037.54572-1-yuancan@huawei.com>
In-Reply-To: <20241022065037.54572-1-yuancan@huawei.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Oct 2024 09:35:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCv3JmkvfaOrtrWgyLtXFvxRZYyBszx+ty2_YwgUYS9gFg@mail.gmail.com>
Message-ID: <CANiDSCv3JmkvfaOrtrWgyLtXFvxRZYyBszx+ty2_YwgUYS9gFg@mail.gmail.com>
Subject: Re: [PATCH] media: siano: Fix error handling in smsdvb_module_init()
To: Yuan Can <yuancan@huawei.com>
Cc: mchehab@kernel.org, akpm@linux-foundation.org, hverkuil-cisco@xs4all.nl, 
	nabijaczleweli@nabijaczleweli.xyz, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Oct 2024 at 08:55, Yuan Can <yuancan@huawei.com> wrote:
>
> The smsdvb_module_init() returns without checking the retval from
> smscore_register_hotplug().
> If the smscore_register_hotplug() failed, the module failed to install,
> leaving the smsdvb_debugfs not unregistered.
>
> Fixes: 3f6b87cff66b ("[media] siano: allow showing the complete statistics via debugfs")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/common/siano/smsdvb-main.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
> index 44d8fe8b220e..9b1a650ed055 100644
> --- a/drivers/media/common/siano/smsdvb-main.c
> +++ b/drivers/media/common/siano/smsdvb-main.c
> @@ -1243,6 +1243,8 @@ static int __init smsdvb_module_init(void)
>         smsdvb_debugfs_register();
>
>         rc = smscore_register_hotplug(smsdvb_hotplug);
> +       if (rc)
> +               smsdvb_debugfs_unregister();
>
>         pr_debug("\n");
>
> --
> 2.17.1
>


-- 
Ricardo Ribalda


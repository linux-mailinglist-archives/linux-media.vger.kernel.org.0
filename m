Return-Path: <linux-media+bounces-20133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C249AD4B6
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 21:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABAA22839C8
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 19:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492671D6DBB;
	Wed, 23 Oct 2024 19:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y/bZ+hIF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E071D0E18
	for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729711550; cv=none; b=IjTCr6DRhQ5g2P91v7VPnc/k58J0Mz8nI52HfX4KRBvB0uUOl6EKEvx6tejUFZB30FpOPwXm15PJ4CznlaQsK8En4lpZo1hjUlSmIBC1rSfkkkX5+qLOdOz42rPxoTA1Z+iAyv3MzDMh8k3NdEM8zVsvpm1iCbHyNxqFSboUEZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729711550; c=relaxed/simple;
	bh=jVfaEMDiqxEbMojHP9PBFB3cC/z3et13Xb9WEIyCI8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGMVzSpTozs24953IfAjWXEK4U973dVHABu6a1XgT578t4qJGKAVH8G1qk0i8OXK5eqMvj6dL0MV4rEMQV7Jt/WEc3FnzuyUKrK7sDFcjW7k69P0ID5lD2yRI9lAugipvkEsBo6PNcxjqUqcxAKnyOrzOEwtP3w+Z8OlakIGUP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y/bZ+hIF; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so155275a12.2
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 12:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729711547; x=1730316347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=Y/bZ+hIFjxF4M+5AfBH4rgUz+zwaUCF8B0ovmO4FvQPqg3eWZPrZWKPdRVlnNfJ/HT
         D518g5DrQ+o0ECfwusNbYdG0k+c+4t7iqVtDJ61yOn9j3eQtg4aiOObhVWSi1gDyMbxY
         YD7Qblwmlm+jBN4c7rhKtDldaK8p6knPcHOjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711547; x=1730316347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=L49GBUxy5QO2JQ0VbfDJfTeh8CCD8FxE1DD7mU0Qix2ezVwqjOx2sKpKnbCuw1wBYG
         A3UvP9Wwc6S7F6T5A2TOOfe7RChc0Z4Go/+6W1r5boALB1z4HWGP/eqxTnd3fIbJGsXB
         pxx7wJXm3HoGtZ7GDR9/OZZpmda/69pqw15ZiQKUDAXiwd8XoK7GRBdpFUl772sokwNH
         NSbrgv8VyFUxTilVLMWK4IdjpN2ZwDGhOS1FMtEklLavPmOW/1dle4+VYEIoY+7P5/qq
         etKfgWDK6P/970UHyV1WFWZoglJZAdIYhpk2MFeP20r2WxykNaWkSbNNe81Z4iPtee4I
         qYEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlrG9Dslzj6h1TZEk8KR4TdmDbFDg0tBi1NNZLGDJ3j1wsjUTS5q45HOsJNt8PWFpjTHgM7SEQaVjh/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDy1Bbip1HuFsLhAB70WZ0tptnxklaQZTMQk6YHL8EXWB1WB/b
	LIjVvZQ6O6ppCWvb7SprycxamDQrdvxYXmLhC0R7fG84c7Z7FE9+MwbMLdxEqisJPsSbgZqaKWx
	TKOIC6g==
X-Google-Smtp-Source: AGHT+IGuvekbJggvcyu8emBEIJ7HAXhZQgdVrLVOo67h130cmmVrZI3Qym3XLskyd2jQBOPgdihbpA==
X-Received: by 2002:a17:907:7e87:b0:a9a:17b9:77a4 with SMTP id a640c23a62f3a-a9abf866520mr286622766b.20.1729711546706;
        Wed, 23 Oct 2024 12:25:46 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91571e3asm517567466b.147.2024.10.23.12.25.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 12:25:46 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so155258a12.2
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 12:25:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHA2bnUdeHmqwE6ruSDQRPNr3LPpvR9pQ8KPzg/jghDUmvptEdxdyu8PPeNlvpWhBuJR6tjnXPpAKcQQ==@vger.kernel.org
X-Received: by 2002:a17:907:72d5:b0:a99:f4be:7a6a with SMTP id
 a640c23a62f3a-a9abf91ed4fmr407338266b.47.1729711194415; Wed, 23 Oct 2024
 12:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org> <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
In-Reply-To: <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 12:19:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Peter Cai <peter@typeblog.net>
Cc: Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, 
	gregkh@linuxfoundation.org, wangyuli@uniontech.com, aospan@netup.ru, 
	conor.dooley@microchip.com, ddrokosov@sberdevices.ru, 
	dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com, 
	geert@linux-m68k.org, hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org, 
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru, 
	ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org, 
	s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru, 
	tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 12:15, Peter Cai <peter@typeblog.net> wrote:
>
> Again -- are you under any sort of NDA not to even refer to a list of
> these countries?

No, but I'm not a lawyer, so I'm not going to go into the details that
I - and other maintainers - were told by lawyers.

I'm also not going to start discussing legal issues with random
internet people who I seriously suspect are paid actors and/or have
been riled up by them.

              Linus


Return-Path: <linux-media+bounces-48921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16562CC49EC
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 18:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CE933140205
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 17:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93BA325727;
	Tue, 16 Dec 2025 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot0lYiiw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF3D32862F
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904600; cv=none; b=GL/jEzCZtWuS8bswE0BPzjrCYubAsbkddxnq99QsF4ydmpPV38BIKh89OTZIBCOX80lBwgo8b1jg5TFJK7JXaMOW3le7AA7qb13IBZlkfVoXwctcyy87E1LSYpH7754N/u2n9lLO1WbN6oyduRYXK9oSy+lsDxbQYZulFnL0EqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904600; c=relaxed/simple;
	bh=o28FZU2eyfE0k0nQhHK9fW9HlH9wMECsfQZDC0284vc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qJ3O+qVKeGcG1YhAZzfCw8HtYoMmd1uGpngSCIaViYSMaHR3FKl4NlU6mQ0SYrHm+Z71qJFxrAm/MszU+I0r67w7CcLChM8tjN5+SU/RcJUUCZCL+iR9LFoHER95SZ1+6G0UeRaaencLAj3rca6JW2nfGnJmdyAxwsQ5+Kr2pZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot0lYiiw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so36464695e9.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904593; x=1766509393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdkr38QTJAPcpLAthn9VgGdaWuWTWa11kuD8ioY1nvw=;
        b=Ot0lYiiw/vEL0Khn1RZ0PCL+gUEcXW8FTVFnRa5HwDTvplv8MCVHx1KOtPZWqaoqQw
         IFURpcGRUmng8kUqma4mpuZZhmUVVcQgSub6PXPXjdU6LmEQ6lwbbxAohxyDdX5PiBzN
         L+lW38sm9zdCb8Nmdoj/DUunaXqRrmZNRRkgTcebK+H6AtH0Em8/hRmj+aOZw06ZlUN6
         j1v3N9fULGa3oLM8yNAvX1IOtwkwKK8a+ZGXIZiGnS6GX/4Oz+2aqo9+dC4ZvQqcnRwf
         igpJt6tfC+r3txSuO+BaJJK7GfMDGcW6lr/dm4eIpSwLZjGPfIRD2+lGfoH1+2PnzXp2
         KPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904593; x=1766509393;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdkr38QTJAPcpLAthn9VgGdaWuWTWa11kuD8ioY1nvw=;
        b=drpeFSrh4osBkI0YKtahq8reweyUs9MoZ/le2T+KYhIXU4cpGcggs8Ckrwvj1rwIBd
         pe/KtPFLD7IZNjh5f53K/yUEI0dLDYc7pugXcy0oFImn2StKFL985AGYhagXCG2ETymz
         subBWsVDm6HIF1WTqGyWSSjJquLCo0iMzuF9JFQghe7BNiSU7cY/tpxvYmlskjm5u8rk
         jtbCTcmXwr/0SNujzlLgQmmrjcMQ5Te3sqj1OrQ3Ovn3K1l3CilBvfMJoHwTrnWQBdrr
         46Qcqhos4MpYXZ/pe7PjPFBXzyLgQ6cFwfZfmzayRrRoEeeZBhrJlViqPaB8hgucteu8
         5yOA==
X-Forwarded-Encrypted: i=1; AJvYcCV8fZakdLWw3PNqq5Pg2lafm/O+0dB/TzlDPrwsEaXQYUTm5YGMePmWeWlKypJDUqKyZWXq/6wyXrXb5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzECcOICOy1LYO/hEbmTJoST/W9KhEO1ahG5rACRUneH6I1Opsl
	lXjUnxfx7XPlGfN8751UOU3iOksxusllA5mZH2GnepDrZF2zhZUKw7nz
X-Gm-Gg: AY/fxX4r/1gDizFsjRzJeUGLXYrrF/59hE355TVGZDsG5Q1VtC1kaubvWL52O4Axw+2
	7CXJhFFI1k7mca/91bUVrUE5B72fV4s4RfF0BE2tBU1C6X84UeMjSVE5dDBwzzd6ipxWH6ddlsa
	hEJQwsgkhOJ53fOKjNxLk3yuY6+dU4DzWhqVIOs2tJJksEd+1hPx8LMcc8uFs3wCcdXr3q2y+SV
	kOYa6zOL5x/5G5G6X0hhsspKwpv6wKVjQ3H10/jvqXlxU8yCsKWiww4xHDmPtJyGVHInZRlAHNB
	x9tuq79yj44/PC87kr5Ey0N+eA+1MfOCx7rZdU2KYk+TBxjn5Z+O0EQbULRnnHgwq7CTPCcsIHG
	DqPDawvzWAAuL15a+Q8iE7AE36LI3ktNcj4i8bSoyrl+7RvVo4X2OOz6lwVRQhaNuC1a7rYiK2U
	IGoYfo7YNHkpPwRXb1jV55GdWM9qORKbAsdYIAeD5dfcATGiW25ib7Q3ATY9ckw6d1LO0HVy/rO
	LB9RXCwhx2o1rpA
X-Google-Smtp-Source: AGHT+IGoEuhivnEJtCF/1hKiY+Xym1qtv77KOIkHQZJWfAGgOE/Hr/PbK0AQK0NfWAZKiftyiU/j6Q==
X-Received: by 2002:a05:600c:4f90:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-47a8f8ab02bmr139278345e9.7.1765904593274;
        Tue, 16 Dec 2025 09:03:13 -0800 (PST)
Received: from [192.168.1.203] (ip-095-222-069-115.um34.pools.vodafone-ip.de. [95.222.69.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ada8477sm100861f8f.7.2025.12.16.09.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 09:03:12 -0800 (PST)
Message-ID: <266b9b35-aed1-4c2f-9fd1-4da349876ac5@gmail.com>
Date: Tue, 16 Dec 2025 18:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daniel.almeida@collabora.com
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, alex.gaynor@gmail.com,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, gary@garyguo.net, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 lossin@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
Subject: Re: [PATCH 0/7] rust: add initial v4l2 support
Content-Language: en-US
From: Frederic Laing <frederic.laing.development@gmail.com>
In-Reply-To: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I’m new to contributing to the kernel and was reading through this 
thread. I would like to ask about the current status of this patch set. 
Is anyone still actively working on it?

If it’s unmaintained at the moment, I’d be happy to take over and work 
on addressing the review comments and resubmitting an updated version.

In case you're wondering why I am interested; I am currently working on 
camera software that utilizes the Microsoft Kinect 360 and V2 camera 
variants. Luckily there is already `drivers/media/usb/gspca/kinect.c` 
but it has some errors (like reporting invalid frame rates for color 
data) and design flaws that makes it impossible to stream depth and 
color data from a single device at the same time. I already got a new 
user space driver working in rust and would like to upstream it to the 
kernel to replace the older kinect driver written in C.

Thanks for your time,
Frederic Laing


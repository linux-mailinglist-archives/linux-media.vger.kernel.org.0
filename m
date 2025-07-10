Return-Path: <linux-media+bounces-37264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6578AAFFB5D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A6304A7418
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 07:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D916289E38;
	Thu, 10 Jul 2025 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flyability.com header.i=@flyability.com header.b="NIpm9J1X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F72F1E515
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 07:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752134041; cv=none; b=iDvvwc1jqlR345cSogXbswnlinv0clV+FFZ+8N5GPl7MX3wrlnXxqR+/ajZBki6yQhJR5q5OGCPHHe3vODMZuopkeZJseyUpjP5B07s7Y/Szeaw7zZSqkxi7VXFF7po7qP7KNdyxAjrNCxbwjSJ9l+IGThY28bST5suHLg5oMWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752134041; c=relaxed/simple;
	bh=nn9OavuGckVhGJfodILvDdJBC/+f1FMlUzvzmwJd9qs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=sDAA7n/0S0A0lVRgI+7DKT7KvRdhVdp0ayGv46rbjRjba71WX3SAS5Asyzb+zxFcFOqY+S1I3AF0HWmXuBUS9uM+k082wyF+JIXL0nwbmnoZjomYIn/16l1l1Gt5Qfv4rABA1Qd4h0cbflJP958FQptQIQiiz2Q88Z3CCNOLbU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flyability.com; spf=pass smtp.mailfrom=flyability.com; dkim=pass (2048-bit key) header.d=flyability.com header.i=@flyability.com header.b=NIpm9J1X; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flyability.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flyability.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so8968771fa.1
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 00:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flyability.com; s=google; t=1752134037; x=1752738837; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nn9OavuGckVhGJfodILvDdJBC/+f1FMlUzvzmwJd9qs=;
        b=NIpm9J1XY/xi7vfFPc58x0qUUr2cY7soh0Ao1tdd4kVGvKWA+cByIMKJB7rzuj1C/O
         /uYuLK3UE8CDQFu59BT4sh5CcP+sy/5+H663nUuuwKMQDPafy/MhWKPejIna35EgSd1F
         wyUTz1xmmwEaINZHWy9Ex4H7XEcui9U7rjFWSPE0o+8C5+Vll1l0rXSgDp/NUz60uvJN
         wqVWb8iGEFjYiwY0rihVbEoqFFsF8E0SGlcPJSVeJ1Pjd2+Sj0elSZta8YHZdhqOl4se
         bMd2DwiJ2c/bsSkypFF2nsLRVuvXm90094e7yhM4tLHGDV25Lih21hlqlwQxemsU+AXX
         BWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752134037; x=1752738837;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nn9OavuGckVhGJfodILvDdJBC/+f1FMlUzvzmwJd9qs=;
        b=dg+G3/3broDUC75URgPH9yl0f/qYdH0+JeDgrbKBxXukdwGD2MmecsDsdoa5VFRZ0p
         2oPSp8pVZ6IW0fkO8jYh8AiBS4LS1PDgrj+9upMyuv2j4uCMI15aCXL5L3aujFe5ZPdI
         O7Zz2IZI7nRMd5B/2AO2rxPYQAPvaM89S1vdntxZxtMOHuWyYCy3zCxw7xIOeDW1l+Hd
         x9d8UvHsAVimWxU9FDexVCNylWxbYMiluA9+sOC6TgBqK5NDqR8mVOdE4LMt+sq3NHcS
         zehQ7vBBzfG+UMOtNgOpho/xWXAubhajPi4SXv9blqy118vX4Ml5JVcPCyHAGyzm93wq
         aiJw==
X-Gm-Message-State: AOJu0YyRkBxVJd1qe/cNAUddXBjiiT4pOAh0KVHQ1vjx0HOSVJ3exae0
	mVXTTnG9Sb8DIRra+Res0NOMTvbvdYR2MloI7SV77YgBG+7HjGvGHFQdB8h2PVEQgIqVHixBVyo
	7c47NLGxixdNbITTf+UUuijPoqdEFq5rNDQd+v6vg8gugJliV/t7/4OE=
X-Gm-Gg: ASbGnct1PnPvN5o3j+GHBnfjzWmPGfbIooO6yvSgs8+iP9PlzA97lZZS5jijeLxPncx
	7OxE2Epiz6fgff0dhhfX7SLtNdH6GKT74+qiVY62n1nhmZAmC356jYyrdDbemlfDMDBsHn4sopU
	F1AfgyjUOsbF5yIe9+eejNYgdGtsugSqAT32huWewGlVc=
X-Google-Smtp-Source: AGHT+IGJBlsCbiI6xzu32iY2VzsixX9wjWRVahq9IX0FHs5zYncMXu2EiTTXm4c/NdlCbggOWq9q9bQkyXIEnD1U+0s=
X-Received: by 2002:a2e:a54d:0:b0:32c:a097:414c with SMTP id
 38308e7fff4ca-32f50fe11bamr7795521fa.11.1752134037464; Thu, 10 Jul 2025
 00:53:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Alexandre_H=C3=A9bert?= <alexandre.hebert@flyability.com>
Date: Thu, 10 Jul 2025 09:53:45 +0200
X-Gm-Features: Ac12FXzbBeHL6x3Dqpmv6anHusNnrsKABTKNm4AvglYsc8oI1-JYQZMqNRgAQxY
Message-ID: <CAH4xmDT818sxE3G1g1yhP2TO79w9TGFp=DUzgnGTkp=Dh+C51w@mail.gmail.com>
Subject: OG01A1B driver
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am writing to you because we just bought an OG01A1B monochrome
camera sensor and we are currently trying to test the performance of
this sensor under various conditions, especially in low-light
environments.

I want to be able to activate advanced functionalities such as binning
to see how it affects the performances. Currently, the linux driver
does not support such advanced capabilities.
I am interested in adding these myself, but I am unfortunately unable
to have access to the datasheet (really difficult to have access to
this kind of info) to know which registers need to be changed.

I am thus wondering since you worked on the development of the base
kernel driver for this sensor if you have any insights or even the
register map so that I can add this functionality.

Thank you for your time!

Best regards,

Alexandre H=C3=A9bert.

[ Robotic Engineer Intern, Flyability SA ]


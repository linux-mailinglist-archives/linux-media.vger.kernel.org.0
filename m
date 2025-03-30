Return-Path: <linux-media+bounces-28993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44465A75A33
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 15:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1B8B167834
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 13:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416C81CDA0B;
	Sun, 30 Mar 2025 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjYkjfo5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B888632C
	for <linux-media@vger.kernel.org>; Sun, 30 Mar 2025 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743341189; cv=none; b=K7AI+XnEvx5cnjWkub7qhMiRk8K3/vMxW6xSzlw6IExVCi6qjkiDjH2zMpmuiCrMXNspV2YGq2VsCVs5sM9cOV8DuNVo/U5XlejapzoT1tqJiVF161s2w4TPUZ3qw8nELbxjBDYDbajj0m4x4mS/nJpUPYagBvu0bjuVAtjL6Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743341189; c=relaxed/simple;
	bh=1MDOPbgwP63zPRhSeb3pmN6k14acCXIgvFbbIkWOmR8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=b/HiaOfI3qMV63MQENLZKOoV0s9mZksmXb5MaRO7jSV+rsNCfvyOqiCZpsPJZ/Ndjiy0Inh+VdQYiARsUVbNY8PAdIZY24/o/1s5zUw3RZKfJmqdTOSAKyY8n5aZ+0Bi+DD9QghgYj2cKe6obiyl2A0nk2JdIZnzDgX63g0gfjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjYkjfo5; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so4753615a91.1
        for <linux-media@vger.kernel.org>; Sun, 30 Mar 2025 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743341187; x=1743945987; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1MDOPbgwP63zPRhSeb3pmN6k14acCXIgvFbbIkWOmR8=;
        b=JjYkjfo5H3C/gA1tl55HESFmAjyJzaNAiwKmiX4rqF5RHGpRofsRthQO6i9tQo/Nd0
         HoTpyobmBvVq13UvskOO2nzSKpiy5aH3b3RT0zcr4+h5LYicDPKNi9NeMdVUmUpH8HTH
         AuzqG5InUIlgD48EZJFeCDj37GZQOJY9pApR/5BkWEBpt5phv/gZTbUdv5SCGavxHYLO
         zoJCAfvs5vYsP77njldWw7P5ZsetyA0L5Uf6WTCkWyisF0w1dKv7lh+kevHTUfVjtB1I
         ASD/VZAyZoToPu/60OXkZU50thEN2X+VzcoiwUxn03+cbW93i4Bbmxs0fEgAXB3sikFq
         jJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743341187; x=1743945987;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MDOPbgwP63zPRhSeb3pmN6k14acCXIgvFbbIkWOmR8=;
        b=UAexj6FgONsM9LwrABC3D4NUPgN11OY/eeHc1wSpsNtphxvFTAQlxOYJsULOLRfAcc
         jdDb4vW3EFSkg9GuNcSh4s0FbN4W5OvHvOdTENpVLkC/qTI4YTb9WELAm5rTawzWspEs
         E6FXzLXaQzw1OvmHIMctAVF8JhDntbG/BaWaNcR3fhb3vaXc/ZK7M+rihYkWLgJf3C+b
         TMxxb2a+9XK3EXmYzXxf8i0ilCyNt5BUrgFiOGTqYru9upOgYF4o73AZCWuEhDA7kpOX
         E5SV9Kz3V0vTWUvUhCfodPURrpFpGfHDmkCKQz2CJolfNJP7sjK7wy9mMbwkAa79VA2p
         udcA==
X-Gm-Message-State: AOJu0YxVYsvm2wZ3rOeIUBaSYhNaPwYJFsb8Ca7jRj7REAYscm9JpQjG
	7UJ9WSt+OwQi2b6YviCmWis74LP/gU5K4BF3wQK9fcx17ZKEM/vOcI7jc6b6Gw9mIKN0LolxKkz
	Kqw4gpB+XQo95/yU6sgy0uHOdJHvdC0Ej
X-Gm-Gg: ASbGncspXWrFUEjJSV10erxEtkmhhhhSpt8HIM6Vx5YbC6d5bCebFCAnPlokRZuUS87
	XVKpvgS8S+jJ9DxT4FlbCgCbA0PTT25lZnv7zaEA2zMTM3EfEsSpuqzRXuc9+4hvek7PaKa2ZxQ
	Hwjg1+QRWqNu8MUjjMP7045Rg25bAyTPMFnDJHlRrCLWZ68t8UABnTK+PsvqEutY12Rw==
X-Google-Smtp-Source: AGHT+IFSQkvbAa2mIVIx3CbNwHkVAEkGzwNeE/zciDQuuEK3DRe8AfdL1ax/ngw62q+pxOam+CpiDaCoE42edUvZb3M=
X-Received: by 2002:a17:90b:1b0f:b0:2ff:5e4e:861 with SMTP id
 98e67ed59e1d1-305321653f4mr8911941a91.24.1743341187417; Sun, 30 Mar 2025
 06:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ioannis Barkas <jnyb.de@gmail.com>
Date: Sun, 30 Mar 2025 16:26:15 +0300
X-Gm-Features: AQ5f1Jr-0iOzzMPEEaaUcw8W002iGj8cAxAg01ut2XK4gGfCm9UzE7IoGJu5LFc
Message-ID: <CADUzMVYZPGtoNqG6jsnpvO+F+kwi8y25pEzQrU3NH4mq3ffJGA@mail.gmail.com>
Subject: Re: [ANNOUNCE] Firmware loader for Samsung TV cameras
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Ondrej,

Thank you for your work man! Well done, you unlocked vendor lock-in
for those cameras!!

I have one of those expensive cameras in my closet for so many years
but have never actually used it. It was bought along with 3 H series
TVs running Linux. Samsung/M$ dropped support for Skype at the very
start of TVs sale so this camera was useless till today. Recent news
for Skype termination, is something I expected :)

A TV device with Linux is not an indicator of a good or open product.
Samsung even gives GPL source for their TVs but guess what, this part
is most likely not included. Anyway my last Samsung product was 5
years ago, I chose better products now :)

Back to my VG-STC5000 camera, it works like a charm after adding the
firmware. Though with the factory shipped firmware I get some errors
with 6.12 till the full fledged firmware is loaded:

[43203.425389] usb 2-5.1: Failed to query (GET_INFO) UVC control 7 on
unit 3: -71 (exp. 1).
[43203.425398] usb 2-5.1: Failed to query (GET_INFO) UVC control 8 on
unit 3: -19 (exp. 1).
[43203.425402] usb 2-5.1: Failed to query (GET_INFO) UVC control 9 on
unit 3: -19 (exp. 1).

[43203.425405] usb 2-5.1: Failed to query (GET_INFO) UVC control 10 on
unit 3: -19 (exp. 1).
[43203.425409] usb 2-5.1: Failed to query (GET_INFO) UVC control 1 on
unit 3: -19 (exp. 1).
[43203.425412] usb 2-5.1: Failed to query (GET_INFO) UVC control 4 on
unit 3: -19 (exp. 1).
[43203.425415] usb 2-5.1: Failed to query (GET_INFO) UVC control 5 on
unit 3: -19 (exp. 1).
[43203.425418] usb 2-5.1: Failed to query (GET_CUR) UVC control 5 on
unit 3: -19 (exp. 1).
[43203.425421] usb 2-5.1: Failed to query (GET_INFO) UVC control 11 on
unit 3: -19 (exp. 1).
[43203.425425] usb 2-5.1: Failed to query (GET_INFO) UVC control 2 on
unit 1: -19 (exp. 1).
[43203.425429] usb 2-5.1: Failed to query (GET_INFO) UVC control 3 on
unit 1: -19 (exp. 1).
[43203.425432] usb 2-5.1: Failed to query (GET_INFO) UVC control 4 on
unit 1: -19 (exp. 1).
[43203.425436] usb 2-5.1: Failed to query (GET_INFO) UVC control 11 on
unit 1: -19 (exp. 1).
[43203.425439] usb 2-5.1: Failed to query (GET_INFO) UVC control 13 on
unit 1: -19 (exp. 1).
[43203.425447] usb 2-5.1: UVC non compliance - GET_DEF(PROBE) not
supported. Enabling workaround.
[43203.425449] uvcvideo 2-5.1:1.1: Failed to query (129) UVC probe
control : -19 (exp. 26).
[43203.425452] uvcvideo 2-5.1:1.1: Failed to initialize the device
(-5).[43203.400522] usb 2-5.1: Failed to query (GET_INFO) UVC control
2 on unit 3: -71 (exp. 1).
[43203.408769] usb 2-5.1: Failed to query (GET_INFO) UVC control 3 on
unit 3: -71 (exp. 1).
[43203.417018] usb 2-5.1: Failed to query (GET_INFO) UVC control 6 on
unit 3: -71 (exp. 1).

Device is not UVC compliant initially so they are expected. Looks like
a quirk will be needed to avoid trying to initialize it without the
necessary firmware. Whenever ID 2065 is detected driver should not
bother with it.

After loading the firmware camera appears to come in life with the
2066 ID. I was able to get pictures and FullHD video with audio! But I
can see extra entries in its capabilities for 2560x1920 at all 3 video
capture modes. This does not work so a quirk will be possibly needed
to filter those out. Hardware documentation just advertised FullHD
capabilities nothing greater than that in contrast with the firmware.

The least I would expect from Samsung is to allow re-distribution of
those firmware files in Linux.

Best regards,
Ioannis


Return-Path: <linux-media+bounces-22250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A649DBCBD
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE0F3B21796
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0799B1C2335;
	Thu, 28 Nov 2024 20:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VudsuYzY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066CB145323
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732824245; cv=none; b=XxZ2/cgFBCNar2oQMGYxrE3b5p/cvyWurMdMu0XqmkiU1uILrQN8nLE/dJ3DiLEvF4gjxo4qEpQV0ZGeL3AfdTnoCmk0TNvI1KZsQN8FlcS7Xv4ytW5NNXByw/MqE3bVqnL0XHX6np4f30/FQ8IapsZ3OY8Usv/vyAgPzLzQyvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732824245; c=relaxed/simple;
	bh=lXGUKoSnwuq+TC5OqXU0wst5dpnGhxjkEJW9K3Em3TE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mnXJ0hB3FJte/zuA+pDoTPf2S4rMp/7hEV6igz8WhRhD+WNj8sx1odaNQrWQTpXYM6FHmKtyims1HVYsIjKyK7pcaDiO4gOu4IL+vikLiSvA6jvJL1OmrmazQajtkxxoDfGJiwiqmpiYBlkbkQ8tOGrBwcpn1FjbQDrWD0o0nFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VudsuYzY; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ef0c64d75cso13488917b3.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732824243; x=1733429043; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lXGUKoSnwuq+TC5OqXU0wst5dpnGhxjkEJW9K3Em3TE=;
        b=VudsuYzYtpo4beG6YZwZgy+QLvlrGu4yjFlSkSf+1Hk0l/NKDQXKtUcx75+coCk1rO
         LKva0T2POpTtKJpTxsEOeqvvL4kgrriMV3lJzabmAC53jTPBU8lgj4R8DqjZB3EwJlpo
         4zVtTi4Wdo0HLkcPin55/lxkPyeV3bFmFXdpDtQShVI3d1cYfKCfqRB+UoyR5fcMhGl5
         io+U5Uc2ZahvVHjtAzovogzIO+hjiWl6v2UiPf/UIPTW7GOHxnXrSgEsW5fT/GwGyx6i
         rBqdHwcshX1Gbv9am9y20Z70fbE1QDAasDZvoIqqgcPNabxQVvVgGsHpUSyK+Qg0iGPS
         W1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732824243; x=1733429043;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXGUKoSnwuq+TC5OqXU0wst5dpnGhxjkEJW9K3Em3TE=;
        b=OGAMXrRVCvgAV50H3J84FeIIhc0n6LO0EKwDiPsV5PbEjYrHzEFRr2IaJ6Yd/p7gIX
         h/lKOKhRBSLiLAlsASVZ2Kbabc7gvxUVZrB/8A8nlxAKYEcplHu8KTRwjW0OQxOSjX6R
         nCvsZu/8K/tr5bLrly4/K6k+fBtyySgo68G49+xz2rBuV/Jal1VeGGfHgKb8NUuiws0T
         G2gupp2ffsbgCIsBejI2VM4n9z03ksxecWykM9nfpAj4mjLuGeNi0yA1S6WygmlRf/6P
         hGuMZhQ3dWG6lfqPGdTvRdSG5/ey27rRj9bCyVJTkMTCMb57eFja4BPeNDHtO2hgiy1R
         eB4w==
X-Gm-Message-State: AOJu0YwfDnnuHjLMO/PLku2r6vsandd2H0AqLvyuQC+DrUw4H2qwXPhU
	WYtdizIs2JG5ae8NOrmM3pOundYZMGomqMNd3r7wm03hAcvUqgm7Yzcv9rVfo0d+FTHa6FZpOa5
	53iY2khbSpWCEk0+BLVg13bg4USCeBM/xwlr0ZQ==
X-Gm-Gg: ASbGncs+mCXbrhH2/0g9DcK8yE8E2/FlaVvvRJZ+PcLpfAA9pQQDpD5546l4vb0R/ZK
	uPoGcFmTlMJjc+ETDsdsS9XyxQEmxgXSbkA==
X-Google-Smtp-Source: AGHT+IFmGQSfLPbE6hkQNKfeygzMrf0ufcfWUy+PR1TxV5VS1ve5Z+xGd289XY+q1K6JB4YMNmWnPmhP/GjgA65lNdk=
X-Received: by 2002:a05:690c:6187:b0:6ee:bc1a:27c3 with SMTP id
 00721157ae682-6ef3720d654mr97881057b3.18.1732824242562; Thu, 28 Nov 2024
 12:04:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Orlando Stockli <stock83@gmail.com>
Date: Thu, 28 Nov 2024 14:03:52 -0600
Message-ID: <CAJhwDWL-+WivYuvyrZdvtTBqmPhKJ9xDURT0m+fUj-Atkjbd4w@mail.gmail.com>
Subject: Support Request for an EM28xx Analog Video Capture Device on
 Raspberry Pi
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Video4Linux Developers,

I hope this message finds you well. I am reaching out to request
assistance with an old analog video capture device that uses the
EM28xx chipset. I recently found this device and decided to experiment
with it on my Raspberry Pi running Ubuntu. Unfortunately, I ran into
some issues during the setup process.

The device seems to be partially detected by the kernel but is not
fully functional. Below are the details of my setup and the relevant
logs:

Device Details:

Product Name (from lsusb): XTV2.0

USB ID: eb1a:2821

Kernel Version: 6.11.0-1004-raspi

Operating System: Ubuntu on Raspberry Pi

Relevant Logs:


em28xx 1-1.1:1.0: Identified as Unknown EM2750/28xx video grabber (card=3D1=
)
em28xx 1-1.1:1.0: Your board has no unique USB ID and thus needs a
hint to be detected.
em28xx 1-1.1:1.0: Please send an email with this log to:
em28xx 1-1.1:1.0: V4L Mailing List <linux-media@vger.kernel.org>
em28xx 1-1.1:1.0: Board EEPROM hash is 0xa5bc808a
em28xx 1-1.1:1.0: Board i2c devicelist hash is 0x014e00e3

Attempted Steps: I tried loading the em28xx module with various
card=3D<n> values (e.g., card=3D0, card=3D1, etc.), but none of them seemed
to work. Additionally, I encountered errors like Decoder not found and
failed to create media graph, preventing the device from functioning
properly.

Here are additional commands I=E2=80=99ve run to gather information:

lsusb confirms the USB ID as eb1a:2821.

The kernel log repeatedly suggests the board lacks a unique ID and
requires manual configuration.


Request for Assistance: I kindly ask for guidance on the following:

1. Whether this device is supported by the existing drivers or if it
requires modifications.


2. Any additional steps I could take to make this device work on my
Raspberry Pi.



I=E2=80=99m more than willing to provide additional logs, test potential
fixes, or gather any information that may help improve the support for
this device. Please don=E2=80=99t hesitate to reach out if there=E2=80=99s =
anything
else you need from me.

Thank you for your time and for your continuous efforts in supporting
the Linux community.

Best regards,
Orlando



Orlando Stockli Contreras
Twitter: @stockli
Los mejores momentos de la vida vienen por si solos, no tiene sentido
esperarlos.
- Thorton Wilder


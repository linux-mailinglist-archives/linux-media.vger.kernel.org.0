Return-Path: <linux-media+bounces-34302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B9AD11F8
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 14:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B591689B2
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 12:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1674519ABB6;
	Sun,  8 Jun 2025 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hggfmjq0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF16A59
	for <linux-media@vger.kernel.org>; Sun,  8 Jun 2025 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749384112; cv=none; b=KMxalOk0H47+108a9B5AtLwEOK0pRE/tpa1kNrMx6PvDw/PAxitzhW/bSpZ3FbCkG5iDL5MPBFzZHV92+APeWMZPvIATrp0yFoizJTuqc0OiEpdqaEX7yGeXq790EMQYzY5mJFGllZF8j/HBKDI/pAc2iufdKLxB5bBAwSt0Xlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749384112; c=relaxed/simple;
	bh=km3W2Wv97jyOfBtBSvEHf6m3uaBSPZ2stLOPVRPHvuA=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=qarMHnE4GClWMHOzrxbaGdVselTD5pwv34LwakYZ+/tyA4KPz4NX3lQtpz8sXzmb95eEQPYp7m9xRAJR6pVMnLTu3GcGX0XcXQtzACqLss4Jf054Zj2t4LkhFSQv/lv5YybNEM6ppIdgJrZqWshhGh79Pg7eZduhpxS8i6dG2Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hggfmjq0; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607873cc6c4so3546061a12.1
        for <linux-media@vger.kernel.org>; Sun, 08 Jun 2025 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749384108; x=1749988908; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=km3W2Wv97jyOfBtBSvEHf6m3uaBSPZ2stLOPVRPHvuA=;
        b=Hggfmjq09ptJu0WVxIEdefWolWzkUJLsyIDRCbiN11gYy8OENmswgJvgcUiGFNacN5
         6S50Q3CC1a5V0pDsQ1S9s1NMVYWijWJMakM3CisVRSzuu03GBq6GYQaodXbV9SL/Icj/
         NRHxBsLu/CHBP+CESrXN9x3qJN9mFCjMEJwDuNNgMjmOsDPPeUAU2zfl0yTRMrQEEmvf
         OllTNopRz13CrqhzbB4HG986IsfIUStnVt5Lks5bnXt2A0JJv2a7NqsVBmsXsYWvAs7B
         eHzovQV99yRRLpM8ZiAT3cprFxMAnEO5jaeMxA0WuA0Rr/iM7pggMy2nmV5NLX3Vk7MK
         GjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749384108; x=1749988908;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km3W2Wv97jyOfBtBSvEHf6m3uaBSPZ2stLOPVRPHvuA=;
        b=uT6IeFUT5qPjDRQ4U1484YIAxfKS+JpGBh6xQmGPxyywtSXvMt+opuR8+HrggKJtqv
         f9jmO+92HYNBu0DEyszK0zydSUSq6cmQfJq0qRrGhAODjiHWFgaetw+We+QldOKXKjlx
         5sTxv/lnlFF+u+7/MW88WS/kE6lVf6aGynOFxQUyI6ATtRbsGTd6Pw8fiWrBB/4/ZgbI
         o1reMnXU3pGDqoEoxM1rYfyV5qQSQRNUnnlpND9RBenslysjtLOrYblynQguj0ponn/s
         mfIFD5kO03HFKFzJHc19yMG9j7/u1kR+80Hf7bMWhOv4rCenaWKuExD0/wxbuojpNo6c
         tNAQ==
X-Gm-Message-State: AOJu0YwiujBFJKXE1McPowF+rJ8oWet8NpJSZss0duITfBh5q4oKvNO7
	e0B6HfzFfxfARLTQxptwN7rgBATXJ4gLEUyhErXAGsakiSHlq5zIEnKHDjTcHw==
X-Gm-Gg: ASbGncs2KlbDUU95kw0QJgaIJ3uzjXlXUy/NuDmke3X0Dbb+gA45FjPWMBiwhQC33/4
	d1nLrW95TuhPl8AZrucx4E798fwgwTf10kqQUt7VgotvnpaKebTtPwuPR1o423v3WgG63WXDcKD
	voQRaoXBvOXp7D092WnZNYRRNA4qOz7XGOVBBHmExUnADibC0HvpfycUNL1sVU5nHwz0IFpwsQV
	QoCeF3BujV9iEGpAnVTW77jxae+O7+kTMERTaNDJRkswF9tvBLmsMifQJZG8Q3veOnUazXgCJD+
	xuaBL8freu8H1PcQQ4E4CKrza4Wylwm1LAWkBrWh7mr7TmzTQ/+LhxQceOFtqX8k2bKCgpjFY3W
	Bz61DO9pkP/T6DhojC5Yk6sX6560LBXrXfX+cPB664Pw=
X-Google-Smtp-Source: AGHT+IGTxzRgkXA3hc8j/0g7RWOdTcEl38DLIQuiJiH5LjqMvj16+cKSj9G+vdbN7onxLDTMqkzl2w==
X-Received: by 2002:a05:6402:51ce:b0:601:470b:6d47 with SMTP id 4fb4d7f45d1cf-60772a66ddcmr8997050a12.1.1749384108284;
        Sun, 08 Jun 2025 05:01:48 -0700 (PDT)
Received: from [192.168.1.110] (62-178-173-104.cable.dynamic.surfer.at. [62.178.173.104])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60778377686sm3501322a12.25.2025.06.08.05.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 05:01:47 -0700 (PDT)
Message-ID: <0af515cfdf57468d431fa7098658fa3de42b5637.camel@gmail.com>
Subject: i.mx6 coda video frame corruption
From: Christian Meissl <meissl.christian@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Christoph Hellwig <hch@lst.de>
Date: Sun, 08 Jun 2025 14:01:47 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

After upgrading from kernel 5.15 to 6.1 or 6.6 I observed some video
frame corruption on an i.mx6q based board.

Reproducing the issue can take quite some time. Sometimes up to an
hour, but it will happen eventually. And once it shows up it seems to
persist and happen more regularly.

The application where this has been observed is a media player based on
gstreamer. The pipeline itself is quite simple and does not do any
post-processing. I was able to reproduce the issue with a simple full
black mp4 h.264 video and extracted some of the corrupted frames.
The data corruption can be seen directly in the video buffer received
by the sink without getting displayed.

A hexdump of a corrupted frame (1920x1080 nv12 all black):
0000000 1010 1010 1010 1010 1010 1010 1010 1010
*
01fe000 8080 8080 8080 8080 8080 8080 8080 8080
*
02e38e0 0001 0000 0001 0000 0000 0000 0000 0000
02e38f0 0000 0000 0000 0000 0000 0000 0000 0000
02e3900 3110 017c 0000 0000 0a88 b6a6 d6b4 b01f
02e3910 0000 0000 04e8 b6a4 0ae8 b6a4 13e8 b6a4
02e3920 8080 8080 8080 8080 8080 8080 8080 8080
*
02e55e0 8000 b6ea aca5 b6e2 ab30 af9f a698 af9f
02e55f0 0018 b5a0 67d9 b69c 0000 0000 004c b5a0
02e5600 8080 8080 8080 8080 8080 8080 8080 8080
*
02e5660 0044 0000 0047 0000 8000 b6ea 0000 0000
02e5670 0000 0000 0047 0000 b8cc af9f 0044 0000
02e5680 8080 8080 8080 8080 8080 8080 8080 8080
*
02e5780 5ed8 b5a1 0000 0000 0000 0000 0000 0000
02e5790 0000 0000 0000 0000 0000 0000 0000 0000
02e57a0 8080 8080 8080 8080 8080 8080 8080 8080
*
02e5940 0000 0000 0000 0000 0000 0000 0000 0000
*
02e5960 8080 8080 8080 8080 8080 8080 8080 8080
*
02e59a0 0000 0000 0000 0000 0000 0000 0000 0000
*
02e59c0 8080 8080 8080 8080 8080 8080 8080 8080
*
02e5e60 aee8 af9f 0001 0000 8000 b6ea 0001 0000
02e5e70 0044 0000 aee8 af9f 98c8 b6ea a7b1 b6e2
02e5e80 8080 8080 8080 8080 8080 8080 8080 8080
*
02e65a0 e3e8 0184 0000 0000 c1b8 0170 0004 0000
02e65b0 0000 0000 0000 0000 0000 0000 30a0 017c
02e65c0 8080 8080 8080 8080 8080 8080 8080 8080
*
02e6dc0 0000 0000 0000 0000 0000 0000 0001 0000
02e6dd0 0000 0000 0000 0020 0000 0000 0000 0000
02e6de0 8080 8080 8080 8080 8080 8080 8080 8080
*
02e9100 4208 b5a0 0015 0000 a6f8 b5a2 0000 0000
02e9110 0000 0000 0045 0000 0008 0000 0007 0000
02e9120 8080 8080 8080 8080 8080 8080 8080 8080
*
02fd000

I was not able to find a consistent way to trigger the issue, but it
seems doing some other operations like bigger file operations
might increase the likelihood.

So far I have only observed corruption in the UV plane and only between
frames 7 and 40. The amount of affected frames also vary between 1 and
7 per video playback.

I first did a manual bisect and was able to limit it to some change
between kernel 5.19 and 6.0-rc1. A bisect of this range landed on
commit ae626eb97376148bb63c3f3ca9517fde0f39bec3: ARM/dma-mapping: use
dma-direct unconditionally

Any guidance on what I could check or provide would be highly
appreciated.

Thanks!

Br,
Christian


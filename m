Return-Path: <linux-media+bounces-28753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59610A70C85
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 23:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 204CD188EFC0
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 22:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1F5269827;
	Tue, 25 Mar 2025 22:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSWFRXOs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDA725BAC9;
	Tue, 25 Mar 2025 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742940306; cv=none; b=ijm+53Bxqq7fsX69/GPY1AdO0LUdrln4rXd91pEBdTX1mIhxSw7h2NXbHP6eY4Ay4yajI/y+UDUVaYkiUgB4yNB71XTNLeHVz5wgvno7wHmJUwDd5Lqe5BXEp94FoBpZKnKZG7Fd2CV07ES8JoywIwgrzjAfA4Pr0tgGDsymCFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742940306; c=relaxed/simple;
	bh=9JjCWAUSbL7MlmQQ6iUu8UnS3Uo7bB5trQqc0l6Y5gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PC02OHSt075t0zMJTLuFYqXByHfEE520weSUaMVKLsR7pHl9fPf7DWGHNuN2YKj3VquHsAtKG+B5p08uJjlA6cxn3VnFTTXxp62zHI3gSluHMWTDUaaCI5eJ+YIWGomSm9iDBRddFQOjliBZpD6QvoXFhbUKfi32AINLf/peM80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSWFRXOs; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47690a4ec97so63114631cf.2;
        Tue, 25 Mar 2025 15:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742940303; x=1743545103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JjCWAUSbL7MlmQQ6iUu8UnS3Uo7bB5trQqc0l6Y5gI=;
        b=XSWFRXOsAOzh68rDgU07hsX2ekSQgn/Qv9WGqJ2h0JDecqj2Bqvn5L9JiR4K1EbgYc
         e5DVJeMdO5XvcSlGnjjD4sJJZa17bvuHnHGRlOFEIkldX7pue0jGy4IBpnfGDrIIAAHT
         pUqir43Lmcwe0/KQ2AESotfHg1/m8E9ibgp7AbPYOkfYQTHmkOnCvkrYuhw0PE28YxA3
         LhG60N7aHRlFKWleiz5CLOdkR7W86+j/tD2/8OBWx1nSTQg0DvSXTI/v62qnZ5DEQmQG
         o6bohY1XuSFvy77ONqTW6vk9/7SFFFXtdLltt8vLeO9s8lx1/7QcRalgb26tzCWWUq8f
         m9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742940303; x=1743545103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JjCWAUSbL7MlmQQ6iUu8UnS3Uo7bB5trQqc0l6Y5gI=;
        b=iJ3dkMJt78HCpiExn0kxZG45OGKcwm0c1DSTMnAw72I5zPbAul/hLOOawRvE4tDcPs
         UPLR3abgh1xFrEyg20EYzeayR4tkj9nCKsalR+/qpZTzy+quLoKp4UcfHgVbgvP7sF+F
         kkTfygAIKBpQ7FyAr0UmoSG6hbgGxNqaIArXqtRHcof6f6WQHNAYdmVqjcX6dZIH7iim
         KQJDMMAjFX9OTiUAY3ZarutTUpkQMzi5CLJZHvCfC+tZ5wK+XSANNxHy8iEPHggZvxHr
         f7SwlmoEf/qOqaEAU8Z7V0h7OnhCqJpTpuHqvsiTNLUabc1OaD82m7tk8iRdjFFUp5me
         l7LA==
X-Forwarded-Encrypted: i=1; AJvYcCUZF80kauJ2P43VL7KAMwDPzoborPbcuKuOquuW0QYm+/PVp8OHppKrLjGm0WqtorUG9RqBdpsElpF6mCQ=@vger.kernel.org, AJvYcCVMy/slrLSnLDfOuJbYDpE8j49ZGUozugQkL6ULo7SvbN9sPU1nNeatNyrwg+u7jxnR4N1fi+zsdNgOaZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcMwPu2b+1E+2az4VyMBpVggm01vQi3S6r91tbd5XwVE9D02kn
	DLs1UZo3E7ZlVJh0pGJ4V85rAUsoqPSa+lrCZLCQl+J2s4ilZZ1pFSjdMpOAtTNjtxhtlkNvwsU
	GVM9pezqATGh7PrxJZ+/gE6QW32M=
X-Gm-Gg: ASbGncvnly9Jq15KJWhoMflqU/mP/A69hJS6ztWBSm+r/Cq4WEkk/z+IsBDCZn2V5xs
	TFUcyNVCn0w/dr5zlZSZ2NpJgkGmdigz+PtvlHFKMjOrDWhJcCywvp5z1ec+2dkDBbubAbQPsRM
	ZB84BInd2pFepGhLxrwL2uP3w7woBm2jXPyQDnJC2jda4E3Ib4c55zkGec5g==
X-Google-Smtp-Source: AGHT+IHpdlbiQP4YYJBEsemRtGzoMbPGKleaESyu1c1F0dSUX0w9aFseEGmo0pEXcdk28J/qW7ignG2k2BLc4X/Aeho=
X-Received: by 2002:a05:622a:17c8:b0:475:531:9b0b with SMTP id
 d75a77b69052e-4771dd8dfc4mr304156421cf.20.1742940303221; Tue, 25 Mar 2025
 15:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67e26157.0c0a0220.36adcd.506e@mx.google.com> <CANiDSCsvEke31SAgXhs_sXEN7d6fXrwuhJFsi2mzESq1Jc8pxA@mail.gmail.com>
In-Reply-To: <CANiDSCsvEke31SAgXhs_sXEN7d6fXrwuhJFsi2mzESq1Jc8pxA@mail.gmail.com>
From: Gabriel <gshahrouzi@gmail.com>
Date: Tue, 25 Mar 2025 18:05:00 -0400
X-Gm-Features: AQ5f1JrXOkjuU1L7Mb87J1If6bWwRxGb7oz_C0O_PA4BFYQ2OlEXvYvUsMQim3Q
Message-ID: <CAKUZ0zJjdSDH3cw=8iKJauU5dmcq9TFhAaJX4yS5UQoiCUaguA@mail.gmail.com>
Subject: Re: [PATCH] media: Fix invalid link creation when source entity has 0 pads
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com, 
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

> I cannot reach that URL
I was unable to access the URL from my email client when I initially
sent the email, but a couple of hours later, I was able to. Initially,
copying and pasting the URL into the browser provided a workaround.

> Shouldn't it be?:
> Fixes: 4ffc2d89f38a ("[media] uvcvideo: Register subdevices for each enti=
ty")
You're right, I incorrectly referenced the wrong commit. However, I=E2=80=
=99m
not certain if it should reference a96aa5342d57 (Fixes: a96aa5342d57 -
'[media] uvcvideo: Ignore entities for terminals with no supported
format') as it's the latest commit affecting the line I'm changing or
the one you mentioned.

> Shouldn't source->num_pads be the same as remote->num_pads?
The fuzzer (Syzkaller) that triggered the warning appears to have
encountered a case where source->num_pads and remote->num_pads were
different. When analyzing the case in GDB, remote->num_pads was 1,
while source->num_pads was 0.

> Are you sure that your kernel does not contain?
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/drivers/media/usb/uvc/uvc_entity.c?id=3D41ddb251c68ac75c101d3a50a68c46=
29c9055e4c
Yes, it should be included since I am running the upstream kernel.

Regards,
Gabriel


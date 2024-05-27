Return-Path: <linux-media+bounces-11949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE58D01B2
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94F2F2913E1
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4D615FCEB;
	Mon, 27 May 2024 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOMRFmn1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D6E15F300;
	Mon, 27 May 2024 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816790; cv=none; b=gwR/ThVb2FUKSxAM45hLg9nRZn+0mXmxTvnSJp+1zjMqF5TfHGVLDMgHtQ/f+/0ejRdpgcFhn968tEOxf/tjcRlXnN9gJMP53ya+fEGBLnnuszCJ7Z6S9BNGrIuiIDY/LThTV3/BhafA1HriAoRvamNEn5apOJeDnRs8IA3UOHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816790; c=relaxed/simple;
	bh=J3KCaq64Mtkk/C2k6he8ygY1EXRhh+bT8+uurta63IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRw5zSaBjw0hgjcJHaZ595+n0Ytg50Sekz2KvHhz59w+4vA+Z2MkB3uxz5SKJ3lH6yHWUnXEnfDaHDBTa3sIfEXE+W7WpGlahuYPGfzUq5o0Ak/xV9veE6C4HghZ8je2TKq5yx/iIw0PNouo/wqZV9y8xvojHdEAz7+imEC8mZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOMRFmn1; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f6a045d476so4851438b3a.1;
        Mon, 27 May 2024 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716816788; x=1717421588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UWiRBPSwzVvYK1VP60gVsXLcDfJ3tPzDNK0/6tHNpI=;
        b=nOMRFmn1JFCh9OhCXFx3VhwX/L32h/eVKErfCSLN42Q1ETdCXL9sTa2FFarBuCsmkc
         uYjcNIz/lcvaV/9PWZzfPwg7wePpH0PHcE/r9CJo3ak35GbJBZs7gTs/HQbNISJCn5w4
         JScL/p9g0DT/IiQESYi3GMpyFtRMlz400UAnjfECXJ5kjRWD6mZkmrBm6KSutytbsC5y
         wtBOUERwTddO6/9ddyQ/wG73wLQU+6qr7WnWmiYreaJ0q04WxaD/Lh9UQD//61Boq/j5
         lr1qGlys5Jz+CRtGrilWq86WgUV96OPVkEdb1YQzYtUepbqxLXWzCR6jiD/flKkb411v
         Yhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716816788; x=1717421588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UWiRBPSwzVvYK1VP60gVsXLcDfJ3tPzDNK0/6tHNpI=;
        b=HknkbUogLvslLREzpNBuZpNTgr+u2dYFo72rz7vRWTKeWQPuN2TIENMz+J3j1Vxkh8
         k5IRbxOmsy8ElrbRe1mK+RPPk80lpqBnh3MmTJchWqnvNiLYVm5gVsiqEMLmO03vrDeV
         Phbps8l/yod2DzVgXfDhcsx5vRBESxJxPXlCxQMh6WY10agOiRqNbtG/iOMM8hZVZNCX
         Y4e6e3/SXLKBV3QAmc9MpL8zXxDVt71uL7ZjZ3cSAszuPgMAFZ8Hi8lc5KCAKf0C3TGL
         X79WXZ7VC3uTBE4+c+BacXZ43x9ipgCuAOV7ho4Y3LsMwt2A0raiMbDBXh78YtdquROG
         34ng==
X-Forwarded-Encrypted: i=1; AJvYcCXK64TV4XoEhYAAu2jmKBp3Y3D03MY18fGjxlWZEeVvLRpqBPKrsMuHnFnsySTpmHwMW3BbW1dEBns2Ew0LciKbN6pYdqLY5ue7hiR+yquZ+s5zxflm/Qu7Ocg0Mcfm6xbjZ3WBWY26mmA=
X-Gm-Message-State: AOJu0Yy0g76M2oEeDRrAtc9jfuZDs5GnLRkYHeVM8kPEfWc7IDZptjIR
	YSVtfsWr4C+bsZrjKWygUbznY4rj3aG0Iu2g5Yfp4lD6nxKrdgkz8dGuEZyb0IOl9PVZP/tWeg3
	jJSiygCpQA5w5qKE99idNLBTyH5s=
X-Google-Smtp-Source: AGHT+IGCD01yxAmkuifVJ0znIE7AzJGvXPU4l7WsO32vmO52xOL7VX7Xqsfm+qnnRn6o6Ym2joDHwRLI5d2gyHQZ27M=
X-Received: by 2002:a17:90a:a017:b0:2b5:af18:4778 with SMTP id
 98e67ed59e1d1-2bf5f10a968mr9472339a91.26.1716816788350; Mon, 27 May 2024
 06:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308121338.1983-1-yongsuyoo0215@gmail.com> <e5e1b2cc-6e21-41d5-bfb7-f0f7cf8c6ed4@moroto.mountain>
In-Reply-To: <e5e1b2cc-6e21-41d5-bfb7-f0f7cf8c6ed4@moroto.mountain>
From: YongSu Yoo <yongsuyoo0215@gmail.com>
Date: Mon, 27 May 2024 22:32:56 +0900
Message-ID: <CANXPkT5EndLDXLqR070KtiPQX-dmkZcFtBUFHiEtFPRODXvY2g@mail.gmail.com>
Subject: Re: [PATCH] media: dvb_ca_en50221: Add a returing EBUSY logic into CA_RESET
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: mchehab@kernel.org, v4bel@theori.io, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, yongsu.yoo@lge.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Dan Carpenter

CA_RESET is a very long process.
CA_RESET usually takes around 1 ~ 2 seconds (It depends on the CICAM
brand, some CICAMs take a long time whereas other CICAMs take less
time.
No matter if it takes a long time or less time, if it occurs two
times, its time will become double.
Imagine how bad it is, if your TV's channel changes time and DC-on
time increases more than 2 ~ 4 seconds.
Most of all, it can cause video blinking or video momentarily garbage.
The Kernel controls CA_RESET operation and CA mw also control the CA_RESET.
If the two operations are overlapped (duplicated), this kind of
problem can occur.
I found these bugs while I developed a DVB TV using Linux Kernel.
By adding this solution, I fixed this bug.

2024=EB=85=84 5=EC=9B=94 27=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 7:56, D=
an Carpenter <dan.carpenter@linaro.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> On Fri, Mar 08, 2024 at 12:13:38PM +0000, yongsuyoo0215@gmail.com wrote:
> > From: Yongsu yoo <yongsuyoo0215@gmail.com>
> >
> > Signed-off-by:Yongsu Yoo <yongsuyoo0215@gmail.com>
>
> You've sent several patches that have not recieved any feedback.  Resend
> them all as a patchset.
>
> The Signed-off should go at the bottom.  Run your patches through
> scripts/checkpatch.pl.
>
> >
> > In source/drivers/media/dvb-core/dvb_ca_en50221.c, if the CA_RESET ioct=
l
> > is called, in a normal case, the state of the thread of the
> > dvb_ca_en50221_thread_state_machine will transit like below order.
> > DVB_CA_SLOTSTATE_NONE -> DVB_CA_SLOTSTATE_UNINITIALISED ->
> > DVB_CA_SLOTSTATE_WAITREADY -> DVB_CA_SLOTSTATE_VALIDATE ->
> > DVB_CA_SLOTSTATE_WAITFR -> DVB_CA_SLOTSTATE_LINKINIT ->
> > DVB_CA_SLOTSTATE_RUNNING
> > But in some problem cases, the state will become DVB_CA_SLOTSTATE_INVAL=
ID.
> > Among the above mentioned states, the DVB_CA_SLOTSTATE_NONE and
> > the DVB_CA_SLOTSTATE_INVALID are "already stablized" states,
> > whereas other states are "transiting" states.
> > The "already stablized" states mean no matter how long time we wait,
> > the state will not be changed.
> > The "transiting" states mean the states whose final state is not yet
> > determined. The state keeps to be changed. Only after some time passes,
> > we get to know whether the final state will be DVB_CA_SLOTSTATE_RUNNING
> > or DVB_CA_SLOTSTATE_INVALID.
> > During the "transiting" states, we do not yet know whether the
> > CA_RESET operation, which triggered the "transiting" states, will
> > succeed or fail. For this reason, during the "transiting" states, if
> > another CA_RESET ioctl is called and if this new CA_RESET ioctl
> > operation begins again, it will be meaningless and waste time.
> > For preventing this problem from happening, we make CA_RESET ioctl do
> > nothing and only return EBUSY if the ioctl is called during the
> > "transiting" states.
>
> A lot of the commit messages are confusing.  It seems from looking at
> the patches that you have been testing CA_RESET and fixing the bugs.
> Please talk more about how you are finding these bugs?
>
> In this case the bug is that if you call CA_RESET twice before the
> first reset has completed then it is a waste of time?  How serious is
> this bug for normal users?  How much time are we talking about?
>
> regards,
> dan carpenter
>
>


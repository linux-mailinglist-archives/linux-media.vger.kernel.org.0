Return-Path: <linux-media+bounces-5107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF473853C4A
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 21:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C80D11C22A4E
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 20:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225B3612EF;
	Tue, 13 Feb 2024 20:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9LggeAH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F1860866;
	Tue, 13 Feb 2024 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707856637; cv=none; b=IJjyTcFGT+uD0CqHjfM/RtN9I6DgU7UpJ/nCMWTxsPwvUPZRJnBXa9VOmIQjippLrNuyhZryzMQ55E00ieLUrQeQhnakCvCZVODsgHg0ixkqZ3m4rkbkOy2HePagzIRtfsWhWJana6UGHq3OBJm8VeUzwJ2u1U2TFrgNUQXwth0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707856637; c=relaxed/simple;
	bh=n/wW7PIGgqQXSlQ0F7NCV5oNj8FXGjtLdH3aZqJKeHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwLoOdMfSMH/a+ZqMmC6Uufiogy8sP3vuC+cY/2CbE3QljMmj/ZQ1GFoe4WtIrEg4Wxo15eQUGnA7C1Zwc9+ZevrXQkBn75WXWMh9DF6uZRmLT0mlNyZhzsO06yBiZ6BtpurTvDS8B8TDa4BUq0nbpi/TFPx0wbE2Qo2pQk9Um0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9LggeAH; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso152950276.1;
        Tue, 13 Feb 2024 12:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707856635; x=1708461435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/wW7PIGgqQXSlQ0F7NCV5oNj8FXGjtLdH3aZqJKeHE=;
        b=T9LggeAHXPaMnY2Z6kcbCjoSs7sB81l81h7xoXhLvUi3e1IGhJtuY23ASxUyUO4LKR
         C+Hq1nehVfmZnj+XLaVsjP9tjTCGhqCJDHBxSg2ueOoUrJB6IBnKpwDCw5RG7yugyODQ
         acicxATPqZ2riCN/1nV2hXFReuTeKVPBOVifPlUKV5Vnh27ZlTRapyx/uWm2vfmsFuMs
         7ZWgKToIitzOWA3SiwVc0aAClWKEOmajZQFAuS/jldi+H7tM9oAtfN5R3KASKt9tCtX+
         h41Sgrvmanjaf1wFvArp6bkCBnLTUEIg1BWh8dKAMIsj3bU6X/rYJFEPEQwZ81zmezX2
         x2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707856635; x=1708461435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/wW7PIGgqQXSlQ0F7NCV5oNj8FXGjtLdH3aZqJKeHE=;
        b=nnXAbFz9g9wTIQUQw1+PLQc5TD8EDXbn2kJ/ScXTYhhvjaqSp8RJLZFT7XhIep7Xq4
         EHsTn6gc+I5vTZwYqen0ij9xGJlW528mdHDLs6tl9ods2c9D2JY7mgCPC93ua21iqPlo
         2kWohUMCTwpITj1i2w/FTCGXU0a4+iO9Pt8QoLd/c7Y3UNCMNggta4si4HeF/UxnMDa7
         QeuHPmGgTkKRXG66sYjzBfqa3a7bAoW8S4ALEZlg6ym165KpHgYdvygbCQ1azfAnbVRt
         OQGoK753xN40YkQ5EoEl6qFuveh4y0InPHMyGz8Bq4v0XrSquRlyfZrJFHscLIkDKUzs
         n3ng==
X-Forwarded-Encrypted: i=1; AJvYcCXOn6TjtyY3V9BJdsdJsB5moUZpfEVKyEQpSRo0bDAKofGTGE9PzIqdc5T3JQGTS6pMP6L1nCS8lY1KsPOaSdF/Ky9wniY1FpyPA8vyxZSRXpQ/mJFnmaCdDmpHB3TFgsloVdo=
X-Gm-Message-State: AOJu0YywBSS6yuAdz8BZcNZrMBrJpXblaVoR/nPCDAJyv3BSi3lkwszM
	6wamZI49WWOvBZmxLVhztzAsrvfwdla9Ry+bTsbglkFwfldSIbBdER+deF8qVOxuVmkBeE2+cPr
	DDuty5Fm9AM1dH/9s5/GqkGu5SHk=
X-Google-Smtp-Source: AGHT+IE7LRxEWEyLjD3Dvo0o8c7YVHNu9ELBH7AyR73SwTWGh6EmoBFMKAf18L2S2tVVni7yUNl0BAAtY4km7kss1Cs=
X-Received: by 2002:a25:ae16:0:b0:dcd:3172:7271 with SMTP id
 a22-20020a25ae16000000b00dcd31727271mr445383ybj.3.1707856635046; Tue, 13 Feb
 2024 12:37:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240111-dvb-mxl5xx-move-structs-off-stack-v1-1-ca4230e67c11@kernel.org>
 <20240210162604.342349-1-ojeda@kernel.org> <20240212232757.GA3221859@dev-arch.thelio-3990X>
In-Reply-To: <20240212232757.GA3221859@dev-arch.thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Feb 2024 21:37:03 +0100
Message-ID: <CANiq72nYc0aVOwYKgJ13Fsdp84jZqxPsL=VdCQjGtoFdFVZziQ@mail.gmail.com>
Subject: Re: [PATCH] media: mxl5xx: Move xpt structures off stack
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, justinstitt@google.com, linux-media@vger.kernel.org, 
	llvm@lists.linux.dev, mchehab@kernel.org, morbo@google.com, 
	ndesaulniers@google.com, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 12:28=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Thanks for taking a look, this is great to hear!

My pleasure!

I am happy to report that it also worked with the new toolchain you
just uploaded (i.e. the one that included `libclang.so` :)

Cheers,
Miguel


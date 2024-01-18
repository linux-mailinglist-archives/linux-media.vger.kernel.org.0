Return-Path: <linux-media+bounces-3898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F30832115
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 22:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 106261F255C3
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 21:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DA12EB09;
	Thu, 18 Jan 2024 21:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Z8YBglC+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B8B2E85D
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 21:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705614678; cv=none; b=omI840roZ4/U8lCEvwkABRuZZRjQNOzbXuTc1GNFfml9o7ClFLmp5MeatvsnIWDjeeJvZQri+92qj2hOf/bY1teGBrQ/W6Ayk9NvvdphBQi3uNfS9B02YSC6GaKVGldtX+uJNBxxynOSsDliIs2B3egWsDp+Hac+ePArICxFsPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705614678; c=relaxed/simple;
	bh=EW4GgO79tM0kh74EqEgdTANw9zj1cbLCONoBa8UPMNQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fV0KTRfYLHKDV1RD8l+ENwcWqcATfzrUorvT33xcqWCPmQq6eD4o+C+ojXk/dCEnOxl8qFMWt+BZkQsexSkJpakhvvT/QPFKWERC0Nz9UvlNBwfHJb5cPsgVSUembOfKA506mU2e7NxsP8Jl/Z7RMuFLknVZnb5iV9sFQNFXhgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Z8YBglC+; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6ddeec84e35so72691a34.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 13:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1705614676; x=1706219476; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nhk4KIpFoW3go0xMs8gft3n3SAiaXQPK/lZKUl9AxEY=;
        b=Z8YBglC+Le+cFsTn/WMWj+S3wbi3u0rK40+GMCoO8e/3EFn6elqLcDA61zB00uUhX/
         Jozsp+4y8kbLELy5LQX7bkBOdpdp6W6Mt24wu9a4AQ3+1kBEdOciD82/jLO9Fp6YZwTE
         eVUjRnD72VQtX10MRgbxn24a42ZppwGAgLjwDv/ibloJ7tW/NxNl5r4h++h1F3pS8E3/
         qeRFQtx73RLQ8m5MIxVt7eqdAwtoUmEJMevYH6klAZgPyfFOwjd2otvaNaUbVxSg45Xj
         8SSql8CM+a4d9/zKrOjr/R67s0+PGqrl/jbGCQQNZQYSVikvxe8QFUEHRsg5y1I9LY0I
         axQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705614676; x=1706219476;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nhk4KIpFoW3go0xMs8gft3n3SAiaXQPK/lZKUl9AxEY=;
        b=h0FM9Wq0DtWxH8p88YjHE8LK6m9uAuEmG2dzB64LeKisWmrrQunLYcue44GQtVP89s
         1wCNEbD7eu2FCpjAoLUw7qYyurMuwOngD1bZY5IIMgeCJMBHkmTLDWunfXYHf7p0D7oB
         5I/KFiGdftm78JLY3KMTF3DSpdNWdnRKblT0VsJmVdYgeAPZiun0edLtfMX/gCbHgFvd
         HZo6sVeSFfIc4FtEyomCxLS2wqq7RN0mKiLQf401NdLKiKwc2qXM89YpyqvU2P48BeYv
         ip6ijeRsHrEGpxbYtOSk0rpvecuj5PH5FmK6WlvUyVTgOEThXpWOH3VRm34rKKPk/1tE
         IMTw==
X-Gm-Message-State: AOJu0YykRzIvbMv44xGQZL+nDs2aOtidoN8DI6ZV5QLdcabFF7yo+AW2
	IwPAYVAoR73jHSu+uqyiZzlVP93iO7U6RpjDfyLTlfBsj0nwfdLyAhBDrqHr0wg=
X-Google-Smtp-Source: AGHT+IGgqtBGmFG8kvlkAhQYkj2Grg7+gfte7xCW9k695YvWwZSCXx/G6muSDjj4VaP+kGoVNbQmTA==
X-Received: by 2002:a05:6830:5:b0:6e0:c35c:241d with SMTP id c5-20020a056830000500b006e0c35c241dmr1508100otp.75.1705614676589;
        Thu, 18 Jan 2024 13:51:16 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id ge9-20020a05622a5c8900b00427b3271ab4sm7147198qtb.41.2024.01.18.13.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 13:51:16 -0800 (PST)
Message-ID: <fc225f62a8ec396eddb335a7d906d274802be3fc.camel@ndufresne.ca>
Subject: Re: [PATCH v3 0/2] [v3]Add hantro g1 video decoder support for
 RK3588
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, liujianfeng1994@gmail.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, elezegarcia@gmail.com, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,  knaerzche@gmail.com,
 krzysztof.kozlowski+dt@linaro.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org, "open
 list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 mchehab@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring
 <robh+dt@kernel.org>,  sfr@canb.auug.org.au
Date: Thu, 18 Jan 2024 16:51:15 -0500
In-Reply-To: <2CFF2A39-6416-4599-AD32-E99EF95F5A36@gmail.com>
References: <5490507acc121113e52a8cdddb155fddf6dbb374.camel@ndufresne.ca>
	 <20240118113051.10773-1-liujianfeng1994@gmail.com>
	 <2CFF2A39-6416-4599-AD32-E99EF95F5A36@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 18 janvier 2024 =C3=A0 14:53 +0100, Piotr Oniszczuk a =C3=A9crit=
=C2=A0:
> > Wiadomo=C5=9B=C4=87 napisana przez amazingfate <liujianfeng1994@gmail.c=
om> w dniu 18.01.2024, o godz. 12:30:
> >=20
> > Before rkvdec2 launching mainline
>=20
> Ooooo - is there concrete plan for this?
>=20
> Asking as imho rk35xx can be really nice multimedia soc.
>=20
> Can be=E2=80=A6. but is not due current lack of hevc/vp9 hw decode in mai=
nline due lack of rkvdec2 support
> This seems to be clear blocker for many multimedia use cases :-(
>=20
> Having rkvdec2 support via v4l2_request in mainline imho will make rk35xx=
 killer soc for multimedia=E2=80=A6.
>=20
> ps: rkvdec support seems available since years on mainline and works well=
.
> So maybe rkvdec code base can be basis to gradually added support for rkv=
dec2?
> =C2=A0=C2=A0

You'd be surprised that we are still upstreaming HEVC/10bit and 4:2:2 suppo=
rt
(well Jonas is) and are missing a proper solution to some needed HW reset l=
ogic
(to fix concurrent decoding). Though all these exist in some form in LibreE=
LEC
patchset.

When this is behind, Jonas reported that he might be interested in looking =
into
rkvdec2. Consider that his is volunteer work, but it would indeed be amazin=
g.
The HW work blob free (no firmware needed) supports up to 8K (rk3588).  Som=
e
early work on adding encoder interface for this type of HW is also in progr=
ess.
The AV1 decoder for rk3588 (which is a chip from Verisillicon, not RK) is
already upstream.

regards,
Nicolas


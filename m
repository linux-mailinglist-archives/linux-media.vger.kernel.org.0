Return-Path: <linux-media+bounces-40337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4229BB2D3A7
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 07:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA396229E9
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 05:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C812B2C3256;
	Wed, 20 Aug 2025 05:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WddedWoD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B522BE7D2;
	Wed, 20 Aug 2025 05:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755668224; cv=none; b=UdJhqoaaXZ7UfWYoug20PMbooxRYGQL1RIMETFtyJGzRH/s6msYP3Cs/QLT7UQ2YSYCZathOGU1SlXKAYrqI7SEItrXJgYbziPWxmnfKqkGm0yLVKa717a8auveffeby/pgvjzkV2hFzIOHhva43iJZ7Aie23RpuQBGCf44OXbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755668224; c=relaxed/simple;
	bh=78sK7PM+e6rv0rS1Pp4UQwzdhAWb5ZMXoADM3lH7i0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imTW/agmRluuw2bUQSCY2x2RcGssq9bKLITQky1sPvpLrhV4fsN676vT5M4puYMhz4sRRtBPqJSEnG1vE3YuwLYXlKVcBqrIHg42RWN9fc5gZJjSmZKhGJ3jGFaSfvFIE9rjz/IELvxkbjt2+7rFiYrZ5Imo1QPTN3d38PL8LMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WddedWoD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3c380aa1ad0so96420f8f.3;
        Tue, 19 Aug 2025 22:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755668221; x=1756273021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78sK7PM+e6rv0rS1Pp4UQwzdhAWb5ZMXoADM3lH7i0g=;
        b=WddedWoDdtAB3RKxka0/Fh1dBnQfZpjWSeehUGhFpHmERl5YbbhBaJk7ja0z3CXtno
         MnhPENYH3FS2zhj93o62UDNcDGIgFvPGHsMsm7m9VOJOj2vS0NRcLpttDp8QkGhJTxCY
         orEtq2h9Jh8pOuzQ1hI/c0EKuoXQ4vcB0y9D22IASKZajIIqJ1/L6u2t2/bBs0SCCDn3
         +mi+QU2mifIgExTww2LQnuyWHxaHzH7duI6c8OT29RaBI7quMs375XzzMsAL9ljSQn7l
         hLJnR9AGgut7UHG2zC2qeR6VRSsLDC+KUD2DzRxsXjoXtDB5nB0uMqDFnVVqZpbuwdbX
         lFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755668221; x=1756273021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78sK7PM+e6rv0rS1Pp4UQwzdhAWb5ZMXoADM3lH7i0g=;
        b=fmlS0D8Hyx5VRuGbzAny8yy5xP1ok28zdJzI3yrq4J9dopQkXsmhS+w6uKqSjuSIP+
         BQCkCTI/l8imP8t9Hz63fBqvH8JHf3H7BarVCIpX+8r5Zo9K7k38IDOQUJ0ER18KzKhT
         dDbz+NY9izkvJ6hRegeH5TVDL/yaHVuWmS+x9Vf/Hq+vtV6BE/GOCy0/v29Dw4huhVlp
         hps8DpMoXIb178S5lP3edYfeFnwsKqurM7xSnuRP5JkAQwaB7e/JGmS6/WfQh7YtQhzi
         BApQsYJGhDbu6SIQ6Qynt82Q9h/Lh/MdozvyQrAaZqyLfzyRrKH2wIQnHDSg4V5oHgQJ
         NxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3V9zkxVONhWziGvU4VMEGKaPUXpFcxqP+XkO298lHfmFole1biqk0vvYhYIDSPWASSDy0we9WDEVH/ECx@vger.kernel.org, AJvYcCVsTFheIa8ipfnxzOOegTafH20WW+82dnaCub+dbM566bivERD1vABZIUcfvtbnN//y00+hAaXVOb61Qro=@vger.kernel.org, AJvYcCW5FTh0TtHZFP3iPjAmYXZDZHNVf0MVYy7IQRWFGZotr1yt1jE9yQtA2RcMtFUM4EWzKN5GFsT443kA@vger.kernel.org, AJvYcCWw+/f7passbPvSlkAxUVAM3lcukrfh2RXlv1QL82L0vtet1Cb7n7po1xwL3iykb+Ww45mfYgb8yrAx@vger.kernel.org, AJvYcCXG5//n1g3V8daMfHYfOLcdX416ozly4JQebkjSalJYoixNZvUbEV/qV3MTpXf2Q6ofAzfhlol0p3OHFx4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ttnZxmS4d68q0RrQ557Ka2HU25rkul/4/6uYPq46uv5V8hQQ
	nZOGYneN0JdVNTTEsTY0fv+S5V0KTN6sYGC3zZ4sxeQjmU4OnVhTiPXrpnyD/qlz3gcDt1wiyqx
	uNFTbMKjDGFIzXdecsY1UFtCiKNtd5Vo=
X-Gm-Gg: ASbGnctlYKmaN2OgIBE2CQWwa6lg7mGDBCfeK0YM6GbkfDS7659KLwKnp6/xlov3qPZ
	WUXYIbMPvKTTsNB4C0XOsBUqXQOlx6iBIC+UjzoeYFiRxY79SirC5F2QRQNrcOq1n19Ut5+ptE/
	E9oK/6nXE9tkRyUay/+7Hmg5HxbwcCCS/FL5HgUFdgYQXXS3sZPw6cP7au5Mkksg9so7FH7sTTU
	etAoQo717/qYykx6oo=
X-Google-Smtp-Source: AGHT+IEV4H6vaBjmF9//jxvsy0f2IPX46V6T4SJQdX0TD7nXqj91eKUZEBuSglg4gtxux4A8T7pdQvDuhbFvozPrkmk=
X-Received: by 2002:a05:6000:2f82:b0:3b8:ffd2:6745 with SMTP id
 ffacd0b85a97d-3c32fe1a0f0mr1054185f8f.44.1755668220666; Tue, 19 Aug 2025
 22:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-5-clamor95@gmail.com>
 <20250819202722.GA1264491-robh@kernel.org>
In-Reply-To: <20250819202722.GA1264491-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 Aug 2025 08:36:49 +0300
X-Gm-Features: Ac12FXwkyBBfR9rShdkWvufqBh2fUhj3y4r2YpvDmS3nJ98Pel0j9Thm5sQ5jzo
Message-ID: <CAPVz0n2CQ14DDFAhAHsxm_-nkDRTrGbBKVRkwzs_2eo0p+6NVw@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] dt-bindings: display: tegra: document Tegra30 VIP
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org, 
	linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 19 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 23:2=
7 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Aug 19, 2025 at 03:16:16PM +0300, Svyatoslav Ryhel wrote:
> > Parallel VI interface found in Tegra30 is exactly the same as Tegra20 h=
as.
>
> That's not what the compatible schema says. 'exactly the same' implies a
> fallback to whatever it is exactly the same as.
>

I will reword commit message. Thank you.


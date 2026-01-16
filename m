Return-Path: <linux-media+bounces-50929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 740D7D38A48
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 00:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97F0A309BC88
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 23:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3884E27700D;
	Fri, 16 Jan 2026 23:35:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5117993
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 23:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768606525; cv=pass; b=s13YHd9957JLr7kLFpcMwyk/4w5MnGocn65Jaae9ktohwzBWI/JGMlmnZSVHvd4WakC5aV9vzrdEu41P/wqFrfrGSfRdh/zhzMzrSiQMDRS0x+XAIJoIiJTMFPQRJRZAELH1b8LDhgdpv3t/FGjmsUOE3Uzz6990pqU8KCXDp80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768606525; c=relaxed/simple;
	bh=x8FFDlF/fesOWEb5mpSebQwC7vWTQTshDMbtChx063o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUA606ohPjagIFTyviiwLSW/7D+9TQtq7Y4byOhYJfACTYvpu07zT4s8jbR+1gB9zlCzoPx8QE0aqeHzOP9Z4AGPboCSQnwL9tvND2d5CXecH1mQNJgqpbGDVzn+By+w+rZhW+RkVM2AxCuL8rDzWN3+GWi8JON/zMZA8xME2i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chrisli.org; spf=pass smtp.mailfrom=chrisli.org; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chrisli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisli.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78e7ba9fc29so24274607b3.2
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 15:35:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768606518; cv=none;
        d=google.com; s=arc-20240605;
        b=C9Y5nfNYyxI2/Uyr9gSkRbmXW8mrqzEB2Itqbd7s2rz3ifOW2iQFYzyjErQBza46K/
         obnRWm5tXCcCQpDlymmTbCcsQsAqMXXQ72CJWO3BF4mfNJtShUW6Eq2iyCbeLrcLnJlw
         Ov3BBDvWJLp3PXR91cBaDAFXOpQROfgD+g2zCMGLY/zqAywTcdhhcZpp53R6GMOae563
         CVxAM0SX3r6muQwwVPxz67ySc0KIKRuyBmw4l+cfkcsVq4BTjn3K7KbmrQ0obYOR3fEy
         2xxbkpSwtsmOOtd9dlhpMma2Ai1mZS3XyyWDPs5+WSARB6liLsTht3SfHhe/Q3Xr3i8d
         vq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=nVvMcHxFKWpFeIwQX6rcqpoxp4jR1OruPjaEq0/Db20=;
        fh=/61h0sYtngpYrgakjthTj3WzEjnq5Kr4kym7D/lVASk=;
        b=eP8zFcAFR0chkIayYtco6oGdLYYIkwAZHRXRIokSMZyoxEdc9g33+BVuOztUcGPe+j
         WYWuu7dEj+1NUaUn01zfGDltQ8tQJQl2UnKZ+H5eJvvC1UTG1n1EYo6sQ7ZkHkktJVbQ
         SOu6zlwodKQDEyzmJvsyAK2h3z179UubA5h3ugrLXJT/x/UT3wZp42f/8MYt45Gm5wsj
         xazWGLov5d0AqXhsHe6kyiehLRlx9aIbRw1qaFFkcSslAaRIaDFzfkzTLPgGlroMTWmS
         GVplKl04+cvhjwhg8Fa/dPOutyBpkLzvpzh/YgQ0NYTBT8p2tNyXFSiHYANzkwv4TLzR
         22GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768606518; x=1769211318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nVvMcHxFKWpFeIwQX6rcqpoxp4jR1OruPjaEq0/Db20=;
        b=gX0QbDVmstu+oF7yGY1059YER5A9dDpGrhcxtcLsVc+ZRthHnLBFaY1ygl8IWEFf5J
         462bQyaI1VVbn7MCpVW/6at17SlrS3WoURGyxzIMD24ZffrJkA9jvvyDtA8qCEPJFZna
         xfWnUExWtQ+R+M3l9lVfMUKJTxLwtfSl3Fr6tMPHmIu68I6AScNJ6SSlCRs8z8btBQr3
         wbuhkr2W2UfjUgtJeCgaVqdQGIzs213S7Z6K+3BFTJ/ONQcn6jsIUSK7MenoqgP3bCQE
         7PHBJBkMTQFAgpzDwGpDi66bWk4Q+x/VIh3x0ku1awzg1PKIcx4oiJsOF29yzEx19+FR
         8P5g==
X-Forwarded-Encrypted: i=1; AJvYcCUBFB9C8PEri5+tdld7kpto4hCuNf5b6j3qcuF5LRIORRzGTG5LriLlLZSddNY3v456sge+0KiTasJGvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrbMkvSrmPddC1Tf2ohKj1pQUyHoxD6ZK+UlplwnAJw5qJc/Tc
	xyUbo0eBdDR1FHIrYbc90//PFVz2s5nfG1Eavdwwg8yeYTIZZ4Xj9g9jN3fZr+QK4FGXgjkT1Qu
	bIYZlT1wGKVLCMms5gZyTsPqO8u8RB2Xp7YXNOXzkbA==
X-Gm-Gg: AY/fxX55BUd5cXxLfexVWgou2saWxyhfA+8UdUNbNTNt+JbNGcEoJuRkvj/f/aCI2js
	wH6w+/ClNZFH4BMR/6CFvVrHkPdUWVKxXqC4QpF13SCen/T3OCw7gr6HqyDaegBO0dmfS3qoE5u
	S7jTndHjICe2iu8rWUuikVze0mhjJwqn7yGRI82pc4GHbTdnn6LTV0vC9uMz1Uqm95gEBFNCWke
	DLA0iAWelRsw3KNLqMp+GyNCdKc1rJ2N4oOjLVeTrKc08AwFUskoLg3078JgiuD2MMhgwi12n1E
	Y46YUiBwDZ0PW12/iVCIr/i+x1+R4kQiobRzmnofI1RSQtPHhHUv6F3mZg==
X-Received: by 2002:a05:690c:ed3:b0:78c:10d6:1e8b with SMTP id
 00721157ae682-793c66fed4cmr36954647b3.26.1768606517669; Fri, 16 Jan 2026
 15:35:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010030348.it.784-kees@kernel.org> <20251010030610.3032147-3-kees@kernel.org>
 <47a2f0c7-c25f-4734-840b-fdefc2f3c4a9@kernel.org> <aUVIlvOSvobrdrKV@stanley.mountain>
 <bf5b9a62-a120-421e-908d-1404c42e0b60@kernel.org>
In-Reply-To: <bf5b9a62-a120-421e-908d-1404c42e0b60@kernel.org>
From: Chris Li <sparse@chrisli.org>
Date: Fri, 16 Jan 2026 15:35:06 -0800
X-Gm-Features: AZwV_Qi7IfV4loLjy6_M4Wg9pj-bZgstydRyU-pSfKvInieL_J8lQ-37srUWiOQ
Message-ID: <CACePvbU5Pqo=bw_j8arOq16o1JBOSwPtuMZBVozy4FV7YsSLGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] module: Add compile-time check for embedded NUL characters
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Kees Cook <kees@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-modules@vger.kernel.org, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Malcolm Priestley <tvboxspy@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-sparse@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 6:59=E2=80=AFAM Matthieu Baerts <matttbe@kernel.org=
> wrote:
>
> Hi Dan, Daniel
>
> On 19/12/2025 13:44, Dan Carpenter wrote:
> > On Fri, Dec 19, 2025 at 01:29:21PM +0100, Matthieu Baerts wrote:
> >> net/mptcp/crypto_test.c:72:1: error: bad integer constant expression
> >> net/mptcp/crypto_test.c:72:1: error: static assertion failed: "MODULE_=
INFO(license, ...) contains embedded NUL byte"
> >> net/mptcp/crypto_test.c:73:1: error: bad integer constant expression
> >> net/mptcp/crypto_test.c:73:1: error: static assertion failed: "MODULE_=
INFO(description, ...) contains embedded NUL byte"
> >
> > There was a fix for that posted.  Let me ping them to see if anyone is
> > planning to send an actual patch.

Should I wait for the actual patch for sparse?

> >
> > https://lore.kernel.org/all/20251211175101.GA3405942@google.com/
>
> Thank you both for your reply! I didn't think about looking at the v1.
>
> I confirm that Sami's patch silences the errors on my side. Thanks!

Thanks for the report.

Chris


Return-Path: <linux-media+bounces-32384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E53AB5525
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48B2716C993
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 12:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4EE28D8EE;
	Tue, 13 May 2025 12:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Rp4wW456"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2217597
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 12:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140370; cv=none; b=hCl0V2Ne8JWWCB4QF8IfjKBTeHnQjjlzgqrKh4GWTNiB3NfxeclVLkSFT+0EJrgETfwxOja4ipw1Y3RXPKhdPRrtNP9rcZ4ftdgtvlWNt7O7k/jQlh8E+XLqoIaTBB0VptnTb17kf1Y40RB/fm+AM6h27W5/ewi3S4NBwSK01oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140370; c=relaxed/simple;
	bh=9XGUZtHjZZO59uocEEiPLnwaOkVr02GWBIQgyo1V/2A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zkr9crZ60ke79IcQm9Mi+8L7Mzw9uUn7DFkSnMwzlvCrpwhHkhvAbFcy1fuI7cez3UxAsoYC7dEJWokNEUbd0IJ1vuZpbA2GpQsxPgJbgx4Yc4yMVfP7rZJ6lAN4GoOhtkzVR8IyOSsV267sYbCtffIvrjckoVjOO2+bP1irMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Rp4wW456; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso59564595e9.1
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747140366; x=1747745166; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9XGUZtHjZZO59uocEEiPLnwaOkVr02GWBIQgyo1V/2A=;
        b=Rp4wW456jQJAz9XYoWgkbF1wdJlTCyqnBC9geet7P2rfQDHAjlA8IPDfYY7H1rmeUw
         UGoqWu+Z9TDiXWVO9azNZYB/fNTMGPMNAfxODC73hj6WLe+/xda3lPrqj8VIIMsScFep
         zg3VYHH3oeDrNNk0FpJdrztOG2vWiS2Xs75BPxS5cRx4V7d/av2vaNnUKYoL9gzGUe21
         DtdsWRE0pHbIwCGECdIBE3QJ/dWtNWB0ienzA1aK6wKuDM9tZaEEDcPJliEc2OQRhxeg
         NOHQuwV3PvgXewSva+12o/4m2x25jXC4JowgMwDgtbtMertTCC4NfzTN2SQ7yKU/u2uY
         B9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140366; x=1747745166;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XGUZtHjZZO59uocEEiPLnwaOkVr02GWBIQgyo1V/2A=;
        b=NE6Y/53mK0l00B/BiE63dwZzGq43OsLWw7ZlAbRCLy5aVaj3CUT/yi0WrZ2Um23Vu8
         IuiU7HE2iHvpzw2m3LPxaRmoM5fMfMil8y0ACVzmq5SnzmliW3ARaH2ukYa7XK9JPDGO
         NzgD/5V/Ql9m+8YtNyBH7Ykqh2bCpC+r6v7zSH3m9UtV6Q9gbS7NSGaE0m0yeMhxK74z
         tZpBrTMpyMybrwTd9Gg4++c9aNgFmEUj34Jy03nVtkCD10b15XwEJ/vxIDATTfkJsYYa
         Iiq3H5Yzzp7Id4Mp+H/I388AExb63TvRoLjUmxvh2am629FVe59DOrpJYN1Rz4NcNR1o
         jLWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk3P7ush8uy1Oq9S86VEAzrueh7GH/9HxV4XDxt8X4zB5oC0531NtxOY4ImX2KGurfmZjGPWklStmnsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytp+e3jTpo1WUdDLsX3Irv6hhiMpjtjknUiw6OQ8+UQFfy0JN+
	fBfp5fQ/XE6ah9ZbQXCnDMKMujnZtJ655acKQEIPJswql46hpD6HXv88b20VVSepgdBCSeDSVAl
	7b7B05A==
X-Gm-Gg: ASbGncvxjKWvnRkTxzu9DSDelCjvaqiuSmdYiwRtNwDHTP8ueJBpuNha8zrwQfg88s8
	EKR1opKTfOb4mLZed4ELRuEpGSM41dZ++/Zba5kribtxzuxfdPBH7qGBhpevarRua/tEfaXO+B2
	0l91osEjnceNBaVllt3rt09x+njw4p1lu6JVLxhfldBxPEWtIgtGZw3DzrHyEO+DwwWINsXwAXq
	xpRQxE0uMOChHq81EcJ36I5JrnqfYXW/YDmclP67LCdD1f/FW/KRJPudwsnAqppPLaHnA4c8gS5
	HMddHyc41X1ijPEIGTuhVJBUUTCDqbvSXQLZnTdT8JHZ+0qI3FU64nY=
X-Google-Smtp-Source: AGHT+IHdeFcoL7yjVkt2d1xpcFPkpISKn/6aiPUUhhy9V/cZhqP7DcMpUN9FCuq9N993UhvpUJFq7Q==
X-Received: by 2002:a05:600c:46c3:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-442d6d18bdcmr159295855e9.2.1747140366159;
        Tue, 13 May 2025 05:46:06 -0700 (PDT)
Received: from [10.68.117.232] ([146.0.28.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f331sm211754605e9.13.2025.05.13.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 05:46:05 -0700 (PDT)
Message-ID: <1c4602cbc29b02e36e96e271178e764e42fe48ad.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Opasiak <krzysztof.opasiak@neat.no>, Greg KH
	 <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michael Grzeschik	
 <m.grzeschik@pengutronix.de>, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, balbi@kernel.org, paul.elder@ideasonboard.com,
 	kernel@pengutronix.de, kieran.bingham@ideasonboard.com
Date: Tue, 13 May 2025 14:46:05 +0200
In-Reply-To: <2efb125c-d8ef-468a-a7ea-afcb5b5bee44@neat.no>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
	 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com> <Y4xaXHLoiPupWM6V@kroah.com>
	 <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
	 <2025051253-trimmer-displease-1dde@gregkh>
	 <f07db888-8342-491b-86b1-43309a1d2456@neat.no>
	 <696f471b-c2d9-4733-9795-0fc31a48e6f8@neat.no>
	 <2025051317-deflation-discuss-1201@gregkh>
	 <e5cd5e9d64123b319bae1a73c96cd33a3ad9e805.camel@ndufresne.ca>
	 <2efb125c-d8ef-468a-a7ea-afcb5b5bee44@neat.no>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

Le mardi 13 mai 2025 =C3=A0 12:31 +0200, Krzysztof Opasiak a =C3=A9crit=C2=
=A0:
> On 13.05.2025 12:04, Nicolas Dufresne wrote:
> > Hi Greg, Krzysztof,
> >=20
> > Le mardi 13 mai 2025 =C3=A0 07:04 +0200, Greg KH a =C3=A9crit=C2=A0:
> > > On Mon, May 12, 2025 at 11:03:41PM +0200, Krzysztof Opasiak wrote:
> > > > On 12.05.2025 12:43, Krzysztof Opasiak wrote:
> > > > > On 12.05.2025 12:38, Greg KH wrote:
> > > > > > On Mon, May 12, 2025 at 12:19:07PM +0200, Krzysztof Opasiak wro=
te:
> > > > > > > Hi Greg,
> > > > > > >=20
> > > > > > > On 4.12.2022 09:29, Greg KH wrote:
> > > > > > > > On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart =
wrote:
> > > > > > > > > Hi Michael,
> > > > > > > > >=20
> > > > > > > > > On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzesch=
ik wrote:
> > > > [...]
> > > > > > >=20
> > > > > > > Given that I'd like to suggest that it seems to actually make=
 sense to
> > > > > > > revert this unless there are some ideas how to fix it.
> > > > > >=20
> > > > > > Sorry about this, can you submit a patch series that reverts th=
e
> > > > > > offending commits?=C2=A0 As it was years ago, I don't exactly k=
now what you
> > > > > > are referring to anymore.
> > > > > >=20
> > > > >=20
> > > > > Sure! Will do.
> > > > >=20
> > > >=20
> > > > Would you prefer to have a set of actual reverts related to this:
> > > >=20
> > > > da692963df4e Revert "usb: gadget: uvc: add v4l2 enumeration api cal=
ls"
> > > > bca75df69aaf Revert "usb: gadget: uvc: add v4l2 try_format api call=
"
> > > > e56c767a6d3c Revert "usb: gadget: uvc: also use try_format in set_f=
ormat"
> > > > 20f275b86960 Revert "usb: gadget: uvc: fix try format returns on
> > > > uncompressed formats"
> > > > 059d98f60c21 Revert "usb: gadget: uvc: Fix ERR_PTR dereference in
> > > > uvc_v4l2.c"
> > > > e6fd9b67414c Revert "usb: gadget: webcam: Make g_webcam loadable ag=
ain"
> > > >=20
> > > > but have a negative consequence that the series isn't really bisect=
able from
> > > > functional perspective. For example commit e6fd9b67414c breaks g_uv=
c until
> > > > we apply da692963df4e so the series would have to go in as a whole.
> > > >=20
> > > > Or you would prefer a single commit that technically isn't a revert=
 but it
> > > > just "undoes" the negative consequences of "usb: gadget: uvc: add v=
4l2
> > > > enumeration api calls" (kind of a squash of all commits above)?
> > >=20
> > > Ideally we can bisect at all places in the tree, so it's odd that
> > > reverting patches would cause problems as when adding them all should
> > > have been ok for every commit, right?
> > >=20
> > > But if there are merge issues, or other problems, then yes, maybe jus=
t
> > > one big one is needed, your choice.
> >=20
> > Won't a plain revert break userspace like GStreamer that have depended =
on
> > that patch for years ? In such a delicate case, wouldn't it be less
> > damageable to introduce workaround, like alias ? This is one personal
> > script against numerous users of a generic framework implementation.
>=20
> Shouldn't GStreamer be robust enough to handle cases of old-kernel which=
=20
> haven't had this feature at all?

This only valid if the userspace code was written before this change made
in 2022. The uvcsink code in GStreamer is based on kernel at the time it
was written, and will effectively maintain backward compatibility from
there.

That being said, would be nice for someone with a working setup
to first verify it if breaks, how it breaks, and share.

>=20
> The main reason why I reported this is not really the name limitation=20
> but the fact that this patch is just incorrect for cases where you would=
=20
> like to expose different formats at different speeds. This feature was=
=20
> there for years and we do have products that depend on it and this=20
> change along with the further commits that depend on it broke that=20
> support for us.
>=20
> You are absolutely right that those commits added a feature that now=20
> someone else may depend thus it would be perfect to fix it in a way that=
=20
> doesn't break anyone's userspace but the problem is that due to the way=
=20
> v4l2 API is designed I really don't see a way how we could make it=20
> "speed-aware" without breaking all the users. That's why we are kind of=
=20
> stuck between:
>=20
> 1. Leave those commits in and then you cannot different streaming=20
> headers for different speeds but users of those API will keep working.
>=20
> 2. Revert and bring back the feature of UVC ConfigFS interface that was=
=20
> there since its inception but break the users of "New API".
>=20
> >=20
> > I believe due to the delay, you are facing an unusual ABI breakage, whi=
ch
> > requires a more delicate handling.
>=20
> Agree. The situation isn't simple as whatever we do would break some=20
> userspace... I'm not an expert on v4l2, so if anyone with a better=20
> knowledge of v4l2 internals has a suggestion how we could make this work=
=20
> with the existing API I'd be more than happy to try to follow that path.

It is a situation for sure, and I'm not denying either way, am not deeply
into the details either. I was just reviewing that work in GStreamer with
little view on the kernel activity.

regards,
Nicolas

>=20
> Best regards,


Return-Path: <linux-media+bounces-37733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D31A4B05247
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0365A7AB1AB
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 06:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBDD26D4D7;
	Tue, 15 Jul 2025 06:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTIeNHJR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E855E25B1FC;
	Tue, 15 Jul 2025 06:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752562679; cv=none; b=Sty28zCLBeh8jzIJaACF0KBIqmrKCCfYH/PcZiqjzwdTRPm+sohVLl1miceEDvvaqAgncyV8pjxjk7cn4zrGWIbqeFnIlD4Y5Rz8cQN3VCXv2B/48YG04dmUwLZW6nlG2cZFDtHTSXR5RdVapX/0OdwPyvLCX7I5oS0UsizW8C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752562679; c=relaxed/simple;
	bh=hi3b18kCJ2PN/uE94e7W0oedaOkuFFQ0dFZ0p41G3yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfmfSaYCMjg+CrU69oXi5gWcIVbcFHpvxhw0ZGUl9QD3p5js121aIThT/d4FORU68visqBLwfenrVneQRU5Qf4+U1yn+9YSbrBO9rbZsrZb+TUYYdYlmBqZiX7lS6tb1ewLc4PaqbEYTnF6LNbMHl+dlIWYObqQIpMMtc0h4ILk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTIeNHJR; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so12666648a12.1;
        Mon, 14 Jul 2025 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752562676; x=1753167476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi3b18kCJ2PN/uE94e7W0oedaOkuFFQ0dFZ0p41G3yg=;
        b=cTIeNHJRaUUw8VnwxaCdZuHYynlEr1dzXZjrdJ4ljqwh+FVvF0PsXVAIUzWtkBVVw/
         Ugxg3lyjWF4jkHgSwJod4/ZE2ostJrqPHdV8mJRhIFxAEUTr7BGlIl52vZDrEkTIDtBE
         OeDFs1WXMRRCatKDfMEIFnmLAUhQ8VTKtQ1DVOEwqA1I6EfrPkF88IlcPMBqZ7OFLZZx
         lT5qERJrKHFLsucjryRQI0kUcKqh/xsjUYNjB23NysP6d9msjXqThFqOuPr/iiH10YPx
         EeqTTN4DUPlRjQL+MTz324WRDuoG4YDgQCg+1tuHtudU7szTGFZ/h30S7RlD7QWijRFw
         MMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752562676; x=1753167476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi3b18kCJ2PN/uE94e7W0oedaOkuFFQ0dFZ0p41G3yg=;
        b=sEggjcS7xlDCzKIGpGN3DfSVTxmP1wRgJjrdfp07PuwSKZhXXzwTzJ0w3TDgwqZs1T
         spbgYXeee6yN4ZIEavzAx0htg0+afrEe6ViVSqoAcc2YTPMEf2VmDPVq33Hc1QM85sGi
         VHXyfT+wO2cCsMzFtoy+FozJEyuQKCTSPCkV/JdiYPqVtLcvsM/yuwoZ0k6EFxAyn+1B
         ngyoQxuJM8FxFoihtsPUHj14/T9dJLni6SRetU4hpzAF+qF00vm9kf92IyTT2HUnOQbv
         h6K/r5Tzpac//y2+2OoCFUk6Bu4ocoa5/3KO+b71ly7A+la/5xromTtTQT5+38nhiw0/
         svyw==
X-Forwarded-Encrypted: i=1; AJvYcCUIPK3lUJlZ2K2Sq2J8n7hEKJb3lkN992Z8QCS8Ak8jXYNq7fPD1rcUG3nmfEdIcGChcNWNqqM3jCHCXJ4=@vger.kernel.org, AJvYcCXPn0zxWBXgsce6Tflc9afwvQ3ilIB/kUC+gywBIdV7IpKx4nWYmDxo24JbeJju974DWle6ziAzCZAGMHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzshv+AsRATZOQW2l26msPHjV6Bw1jSgB3J1HRDlhgFJdClEFNc
	aO5uuAIHSROdxOTi6eE5iWR+MvULIUuGFd50ButJgDCvzjlOk693O+XaA9aD2P5MTZ3G2awVXn9
	Yu4NBuK/+tsIjt6cDxZiKhN69sfstkqs=
X-Gm-Gg: ASbGnctjscZTQ299ySJhfEu7WFKIWefjLsonhun32suI+epG2x3E2WK5pIG7QIUTRVX
	8Vp2hbwpPpLAdXc6XYETBRFIbIsqTvlxqHc5KTyr6d5/6FrBSY3e6TxZm24q6YXRixlX5EVy4n+
	Cdl5H0q+/VsmDWU9lk5xyOhHA/AYDwdIZPFnQrZkHF4dGlNixtnv6SyouzbvZEwOo/XHaeXD1i8
	wytYqx3U+vX8YmUaST8
X-Google-Smtp-Source: AGHT+IG0UYcy/IX+HCgW4D/Eb7WFEQbTW2Fprb7+3GKJ779x4KY8mPx/djHYIJol9OlevhyUSkGo9wlgh5i3URkxtE4=
X-Received: by 2002:a17:907:f810:b0:ae0:a465:1c20 with SMTP id
 a640c23a62f3a-ae9b5c2bf92mr234673866b.14.1752562675871; Mon, 14 Jul 2025
 23:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714153409.46085-1-martin@weidenauer.cc> <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
 <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc> <CAHp75VcvOaSPbrpurRAjrvwW992qiP-ffZcroQ-feg=_PAoquQ@mail.gmail.com>
 <1D5485BE-E03F-4364-A48D-051AAECFBA9A@weidenauer.cc>
In-Reply-To: <1D5485BE-E03F-4364-A48D-051AAECFBA9A@weidenauer.cc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Jul 2025 09:57:19 +0300
X-Gm-Features: Ac12FXz-ngLNhXyig1mNzAZmiCXxYtUqkaoJxPmRSqbAxbX9Ie3FUAhsw-uMXeY
Message-ID: <CAHp75Veovvxbr_6EuubDa7x8P5j12WjER=ar7E69A4r=sGONsw@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
To: Martin Weidenauer <martin@weidenauer.cc>
Cc: Woohee Yang <woohee9527@gmail.com>, Jongmin Kim <jmkim@debian.org>, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 12:54=E2=80=AFAM Martin Weidenauer <martin@weidenau=
er.cc> wrote:
> On 14 July 2025 23:38:47 CEST, Andy Shevchenko <andy.shevchenko@gmail.com=
> wrote:
> >On Mon, Jul 14, 2025 at 10:39=E2=80=AFPM Martin Weidenauer <martin@weide=
nauer.cc> wrote:
> >> On 14 July 2025 19:47:41 CEST, Andy Shevchenko <andy.shevchenko@gmail.=
com> wrote:
> >
> >> >Guys, please, coordinate and issue only one (or a few) patch(es) per
> >> >an issue. No need to send zillions patches for the same problem
> >> >file-by-file.
> >
> >> >On Mon, Jul 14, 2025 at 6:34=E2=80=AFPM Martin Weidenauer <martin@wei=
denauer.cc> wrote:
> >> >>
> >> >> Fix checkpatch error "ERROR: that open brace { should be on the pre=
vious line"
> >> >> in ia_css_dvs.host.c:277.
> >
> >> I deeply apologize, however this was the instruction of our workshop i=
n DebConf by Helen Koike <koike@igalia.com>
> >
> >This may be okay for the driver that consists of let's say less than
> >10 files, AtomISP consists of dozens of files in several (nested)
> >folders. It's not a good example for such an approach.
> >
> >> Here is the link to the exact workshop:
> >> <https://debconf25.debconf.org/talks/55-submit-your-first-contribution=
-to-the-linux-kernel/>
> >
> >Hmm... this really needs an update to explain how to work with the
> >drivers that contain many files and literally tens of thousands lines
> >of code.
> >
> >In any case the problem with your contribution is not the code, the
> >absence of coordination and possibility to clash with somebody else.
> >Also it looks like a DDoS attack against maintainers capacity. The
> >smaller patches are and the more of them --- the less the usefulness
> >of all this activity as at some point that floods the maintainer's
> >mailbox.
> >
> >TL:DR; (always) Use common sense!
>
> To be honest, such a contribution also seemed to me a bit useless but I t=
hought all of this had been discussed with you maintainers beforehand.
>
> As it seems this was not the case, although the workshop has shown us how=
 easy it is to make contributions and for my part I will use the knowledge =
to make meaningful changes.
> So you can scrap this commit and I'll make a few commits in the next days=
 which make more sense.

The problem is not the code, the contribution is okay and appreciated.
The problem is that for _the same_ issue there are tons of patches
from _different_ people. Just discuss who does what and send "one
contributer =3D=3D one issue" (under one issue, I mean class of the issues
checkpatch or other tools report, for instance, the "if (foo)
return;"-like which are on one line and needs to be two or more lines,
do _all_ of them by _a single_ contributor.


--=20
With Best Regards,
Andy Shevchenko


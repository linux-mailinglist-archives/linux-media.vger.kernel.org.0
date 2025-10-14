Return-Path: <linux-media+bounces-44473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 95183BDAD36
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76BA04EAC52
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A312F280025;
	Tue, 14 Oct 2025 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNwagXvi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B9F27A10F
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463755; cv=none; b=NTfsQjK9n/4NOzQPLARV7xMfNf13WNOIxipQ1iK9e3KnLedihfYugi2YSBQZTVS6PwJSgJFUSYUHECFGJF8ckckSekWNsLqvHIC3liWyUfkcMzBMBNsz1WGlfGCQe0jCOeoMFiEVR1bNvn5GXGDjgn4g3a6fpt8xcjwi3/g+WZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463755; c=relaxed/simple;
	bh=7pn62HVkh8jK/fkXKd6tnVQ5BSf29LQZ0Tu6TpsYU3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2Y/Qg9Pm3bUT8IW+44r+spkHTcnv2/WEmrIMVFMo9sU62yUkv/TsjabZzQk7wzvbf4Ths1r9u2sE44Z1OmSRf7XQSv4vOzzHOBxLf8Y5BTvJF9ZYMoaO6fh2gfBkFVJx4F/KRbgSsTzxKXMWkktmO48/qBRKkYixurkzzXtubM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNwagXvi; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-87808473c3bso1020328585a.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 10:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760463751; x=1761068551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pn62HVkh8jK/fkXKd6tnVQ5BSf29LQZ0Tu6TpsYU3Y=;
        b=aNwagXvibQGDyN9PbW2gubqW5gIyCbuyY09a/ZODaWjWotmZEFRrsQDNrHHUZScXId
         NV1uR6CdVr7vDhLDsf3vL3sR8tx6Q3iNPUm54gOFO0gba7qFmIgvFxfLv1JRp0sKvKn6
         YZoXRSRUalGn3GqSrmyJCa107nc8o2EexPxYQXlaNajPZU5miQNSrjyqxPxCrMnpiw6i
         kxmu0UANNRrVbk6pxSU4x5kzqwNGKs9xeauxGqeerKbNWuJAOnVY58MPOnivWZDJ1Bfj
         uOW9naMxFegIxWj6PXTZpstAXHgnYcE9aSnrmonKRTHAY1T7QUcUWrBIP5U3ST/Rntg1
         zePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760463751; x=1761068551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pn62HVkh8jK/fkXKd6tnVQ5BSf29LQZ0Tu6TpsYU3Y=;
        b=Two8dbaMj0utHQIn0TKpO72OX9B0DTokSBdaFNayQAb0E+HsVyNQxqikKoi9L3HKRX
         Juh2D7C7puqiMKs1j7378mcu6B26ArLa9dGxILUJh04jLjfP5Ad/gjSmcnXAN79JlLGv
         nXPUDM3lpyCgRAws8EuJscTMZtB2m9kPI8JMpin6GD6WNuf3N9Xs7J0wLOthzXrpiNpN
         BcSfR72H9aa/f2QXp+/R1jLl/cE1QaoR6xJuvIm3dVl1W8egoOIyaVi9Ek5+8DHVYMd3
         ewYNx++cYnGOxNqDiDLroaHrk2aDXNRco+PAaLy/j/VwTOVMk5lCmH+1bWHwcQovVHeR
         NeZA==
X-Gm-Message-State: AOJu0YxIzQq1JWdZ18Mm3lxARve4iZKD1Hr2AnmQkgfM7HZK9y2fQ2u2
	VKCo9bQdbtdDsQE3K0Z3v9kHMvF7E0OoKKJL7tH53DveJW0BT4ECblrgdwDioaRAaQanIUcjm+r
	00xnkEl/Zowj7BEmvhTQ+oZg0EObxpqE=
X-Gm-Gg: ASbGncuTkIOtyEvGRZQby8u4RxYaqHoTkLzoztidPvI2q16DyTS4axFU9n6cqK3kULx
	c91zDuolg4TvhWnABTwiw/HhhleAkzrf3eZyzIUM4gr15U4uI6wBjWTj8DM5HNCn5YPFbdu33Oe
	n/9vmPnN5NeVBs7MCmhI5aI/CxkCiUJrlggWiXQzv5vCgC8o0g+I84Os8/qypn+NXAj+JqfLOGd
	JagfvtV1QBSJFheuYyTpKHpuVb3Rk9JWDtH4gmUi5YPNAKr
X-Google-Smtp-Source: AGHT+IG6hnwAoXgtUGujN0/GC+AIZG1OEEqDQrD9sXDvzat+GXNJkfXV+S8iGrmRQPXmxSu6lhqUulcAYKTCYlZu9Pc=
X-Received: by 2002:a05:620a:44d5:b0:86e:21a4:473e with SMTP id
 af79cd13be357-88351de7a59mr3634798185a.13.1760463751082; Tue, 14 Oct 2025
 10:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB-99LvD2cCmPt91Kh-1Zj69=_xczV6oUA7soAfFXQBcZxA+pQ@mail.gmail.com>
 <CAO3ALPx9FK=ayO8WWt7zguTfaA=e5q2wxUPc1ojpPFqFvstxBA@mail.gmail.com> <CAB-99Lu1+OB0OyKQLh9Y89+BdLc23j6nJAn59VbS9qVwAb-4vw@mail.gmail.com>
In-Reply-To: <CAB-99Lu1+OB0OyKQLh9Y89+BdLc23j6nJAn59VbS9qVwAb-4vw@mail.gmail.com>
From: Forest Crossman <cyrozap@gmail.com>
Date: Tue, 14 Oct 2025 12:42:19 -0500
X-Gm-Features: AS18NWCSSacmaYarlToN7_0MMz16CtDNu8u3lHSZMaDXBiARKpKQsk1a8riqlNA
Message-ID: <CAO3ALPxbYGG5fxO1Dd989bjg=a4xRLBSDwtDL41Bd9ym7pt6KQ@mail.gmail.com>
Subject: Re: Support for Mygica A681B (ATSC/QAM USB tuner)
To: Michael Goffioul <michael.goffioul@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 9:13=E2=80=AFAM Michael Goffioul
<michael.goffioul@gmail.com> wrote:
>
> On Fri, Oct 10, 2025 at 11:22=E2=80=AFAM Forest Crossman <cyrozap@gmail.c=
om> wrote:
>>
>> On Sun, Jun 22, 2025 at 8:46=E2=80=AFPM Michael Goffioul
>> <michael.goffioul@gmail.com> wrote:
>> >
>> > Hi,
>> >
>> > I have a Mygica A681B USB tuner and I'm wondering whether there's any
>> > hope to have it supported by the Linux kernel. I've attached the lsusb
>> > output for the device at the end of this email.
>> >
>> > So far, I've downloaded the Linux driver from Geniatech web site. This
>> > is made for Ubuntu 20 and kernel 5.4. From what I can tell from the
>> > driver sources, the device 1f4d:692f seems to use a mxl692 frontend
>> > driver, but it uses a binary-only mxl692_fe.o module, without
>> > providing the source code for it. Kernel 6 includes its own mxl692
>> > driver, however it appears to use a different interface/API (and
>> > apparently also a firmware blob that does not look to be easy to
>> > find...).
>> >
>> > Any help or hint would be greatly appreciated.
>> >
>> > Michael.
>>
>> Hi, Michael,
>>
>> I've recently submitted some patches [1] to enable support for the
>> A681B and its more-compact USB-C sibling, the PT682C. The patches are
>> not yet ready for mainline (hence why I marked them "RFC"), but
>> they're good enough to get the hardware working and streaming TV from
>> over the air. If you're willing to patch your kernel, the patches
>> should get you up and running while you wait for support in mainline
>> or your distro's kernel.
>>
>> Also, while the cover letter for the patch series contains a link to a
>> script I wrote to download and extract the firmware image from the
>> Windows driver, I recently learned that the firmware can simply be
>> downloaded directly from here [2].
>>
>> I hope this helps!
>>
>> Forest
>>
>> [1]: https://lore.kernel.org/linux-media/20251001051534.925714-1-cyrozap=
@gmail.com/T/
>> [2]: https://github.com/LibreELEC/dvb-firmware/blob/90261ae2934329f6ca84=
dd6c72d10d0777bf4b0e/firmware/dvb-demod-mxl692.fw
>
>
> Hi Forest,
>
> Thanks for the info. I will give it a try when I get a chance.
>
> Do you know whether this would support Clear QAM too? While I had some
> success with ATSC with some reverse engineering, I was not able to get
> the device to work with QAM (with the device directly connected to a
> VeCOAX modulator).
>
> Thanks,
> Michael.
>

Michael,

No, I don't think QAM works yet. The message for the commit that added
the mxl692 driver to the kernel mentions that "Only ATSC is currently
advertised via DVB properties. QAM still has issues." And the patch
series cover letter[1] mentions "The ATSC portion works fully, the QAM
portion needs some TLC and is therefore not listed in the DVB
capabilities." Since no commits have been added since then to get QAM
demod working, I think it probably still doesn't work. Not that I've
tried, though--my first objective was to just get the driver for the
A681B and PT682C working, then maybe later if I could get a Clear QAM
source up and running (I have some SDRs that can do this, but I
haven't used them in years) I'd try getting QAM demod working.

All the best,
Forest

[1]: https://lore.kernel.org/all/20210126015416.5622-1-brad@nextdimension.c=
c/


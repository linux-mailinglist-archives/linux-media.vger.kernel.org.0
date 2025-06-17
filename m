Return-Path: <linux-media+bounces-35077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47EADCC87
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 15:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85B9517BDF8
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AE02E88A3;
	Tue, 17 Jun 2025 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bbq66bqK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F9328C2A5
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165341; cv=none; b=s38gP+yIUeO8fQ7dyKjFkIIKaRCgD0mb6uN/IAnHyKP/SsEEonPEReM0W075UwwLD+kLC5rvMM9NwaV8z9gOJNRdwUw717nIB92H/3Lezawv+3QftgIiErnWDcScRbqCu1m+q9qF2lA1PtPJXZIQ7/imFfv3xzUr8/2VL/2uKv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165341; c=relaxed/simple;
	bh=hivB+dXHgRfjrGL6GmS+WrnxltFxrNiXvd8BH0IhvP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlYt0GPoM8U7Cq7aUx9Q9PBwy3mU1e1vbY0Hu6/qHSlqGwlw7PBNWffhT+jPOqdBq8LRjXji+3n05FYCv6J8uKYQQOYp5/ffdqHK4W403lwpM49OLDYHZ7cUjal3aIoaWpgh6KeLsgmqkPMpfGfaJ3E4afYnPiobooUmdd2msFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bbq66bqK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553c31542b1so2235676e87.2
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 06:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750165337; x=1750770137; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QwCxDdGoBWfUjiiVuZKb9ARlDqK974ap4X+wrWrD4eE=;
        b=bbq66bqKS0pQIBNsQVOkIC3dPS5zpuJv5AuI+/Z50Vtc+2Q+7BYex7YYzH3mfe341d
         LOKiSnJdj2rVa7ApyPpVl7ZX2emWl20Dbdd4ZA+Sm3/SiU0nTIeMl6Ayhfo3AxRxR2hu
         SVfNUmYVakO+Kfkip6BU8sznT3yI4KT9b0Ft0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165337; x=1750770137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwCxDdGoBWfUjiiVuZKb9ARlDqK974ap4X+wrWrD4eE=;
        b=WLO0AIOd0Z24nqwj77aZCURP4flwVSd8ysVFNH108F38p22PQV6T6Xj7XRev5TNR+r
         uMeb99B7x5fQhn7Cw3e1U5LlhFqhQdJqVE63watRLwB8Y8eytvGrADphJ7WVs8HTNSvo
         m3IRcNU+Lpc1/DUIfNQNOECzm7jSUq1v1S+Rn8gpNSsJJ9bDbbs9/3VVV3AL50EYrHlG
         ieMoFM5vOmvfwaTLXioEGZQ4KrfPrpYtOGGXOJBGc20SC1LIXUxUtXot8gS7sfHXYzjz
         wU4018oJl/sUpD4WHjy6hgoV0pRazfVuXkzbendSkjSantHvSaN2G0SliUaMaGxsZszR
         +ssg==
X-Forwarded-Encrypted: i=1; AJvYcCVemKrhmiyBCfvrIQsCGGcHgaTc3loHZnkI1rApCuOf6aP5X70eXTqONfgo87ppAI/DnDvwaVnXQY+6mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzxdLJzPbEJ2ynw3/ZZyuNrei2oZKrAxsqaFkWFh8e0G9qM+YT
	iIejlquxP7PIdtB5OTfP+/gmf5SaC47PHcCpw6emnv+nFze0/rp4/c0E0+f7ugih0LSHbTyhLv/
	Cxsw=
X-Gm-Gg: ASbGncuik8U/CX8w6kpRYJ2Gz5R2TsUECVfrU+FIXxQmy0M67WJdWiXHRmgLtsAhYQy
	fHo7ExVf0g2QXPniH1pxEnn2ABtRgn5c2It3QIZDNlZoypTUWjsR6fwcQDIkfbXy+GHJX95pVBe
	JdPtrer0oN1K9w4/IZKk13sdJ1VfvAiV8Q0goL9OvxufuUWyPwRXjjT5rha4Jn3MOLaowA5/gMQ
	fvHv2s+2HS4dfJzbqlDQ4iUfd7ftCw7zUtFT/ihlnfk4cCsjYRYg2jM6p/UIsM7UrcSFiOmP7Rw
	mhCuhRzB+qXYxGK+gNonmGNpQHv2Ywi+wzzgP3rIwTgnulqTYWhIGptHOg1aSsxfUc8lxqttpL6
	IyG0gUWSsSHBkRb25FVmIBIG/
X-Google-Smtp-Source: AGHT+IEF4MjN1WQxTAgJCoMnPF6BdUJDQeniWIM8ULLcJ4ccgemZU7dcAoDknkFB3kvCK7CNxFwhHA==
X-Received: by 2002:a05:6512:398b:b0:553:2698:99c5 with SMTP id 2adb3069b0e04-553b6f137a7mr3160153e87.39.1750165336108;
        Tue, 17 Jun 2025 06:02:16 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1e0dcesm1886437e87.202.2025.06.17.06.02.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:02:15 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553c31542b1so2235605e87.2
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 06:02:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWui9G4vUKO2YGT13Rg0rRRX0kAvmKVcoWtypyfDZOFwjFhn4Ii3z8KMKOs7crm/eyOtKx2ltRhZFvt+Q==@vger.kernel.org
X-Received: by 2002:a05:6512:2314:b0:549:5866:6489 with SMTP id
 2adb3069b0e04-553b6f31234mr3198961e87.47.1750165334708; Tue, 17 Jun 2025
 06:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
 <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org> <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
 <b78cde8b-23b2-48c5-b8c6-b935a403963f@kernel.org> <CANiDSCuPP+EOCps0gjH_bpJWsbyJDBcD+NoOeTB-sSUjUr0=Sg@mail.gmail.com>
 <61600bf6-92dc-49cd-bad9-a7342ce2fef9@kernel.org> <08a426ae-be6e-4cbc-aaaf-7197bf839632@jjverkuil.nl>
 <20250617125343.GB10006@pendragon.ideasonboard.com>
In-Reply-To: <20250617125343.GB10006@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 15:02:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCvTQzur1UqEKdwkd9vKcPQhG1sjWvbtwyf0jokFY-S2tA@mail.gmail.com>
X-Gm-Features: AX0GCFvXv_wP2CeSoip02hb0L6n1uKzrxqB73o9WKz_cufCcvR4pJCu5P3eXUss
Message-ID: <CANiDSCvTQzur1UqEKdwkd9vKcPQhG1sjWvbtwyf0jokFY-S2tA@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 14:54, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jun 17, 2025 at 01:52:50PM +0200, Hans Verkuil wrote:
> > On 16/06/2025 15:38, Hans de Goede wrote:
> > > On 16-Jun-25 15:31, Ricardo Ribalda wrote:
> > >> On Mon, 16 Jun 2025 at 15:26, Hans de Goede <hansg@kernel.org> wrote:
> > >>> On 16-Jun-25 15:22, Ricardo Ribalda wrote:
> > >>>> On Mon, 16 Jun 2025 at 15:05, Hans de Goede <hansg@kernel.org> wrote:
> > >>>>> On 29-Apr-25 15:47, Ricardo Ribalda wrote:
> > >>>>>> When committers contribute quirks to the uvc driver, they usually add
> > >>>>>> them out of order.
> > >>>>>>
> > >>>>>> We can automatically validate that their follow our guidelines with the
> > >>>>>> use of keep-sorted.
> > >>>>>>
> > >>>>>> This patchset adds support for keep-sorted in the uvc driver. The two
> > >>>>>> patches can be squashed if needed.
> > >>>>>>
> > >>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >>>>>
> > >>>>> I've no objections against these 2 patches, but these need to be
> > >>>>> rebased on top of the latest uvc/for-next. Can you send out a new
> > >>>>> version please ?
> > >>>>
> > >>>> I was waiting for HansV to say that keep-sorted was useful and then
> > >>>> add it to the CI.
> > >>>
> > >>> Ok, so should we drop this series from patchwork then ?
> > >>
> > >> If the series does not bother you too much in patchwork let it stay
> > >> there until HansV replies to the makefile series.
> >
> > I did that. Basically I don't like the keep-sorted annotation unless it
> > is rolled out kernel-wide. It's not something we should do just in the
> > media subsystem.
> >
> > That doesn't mean that a patch fixing the uvc_ids order isn't welcome,
> > but just drop the annotation.
> >
> > If we do that, then patch 1/2 is also no longer needed. Although it
> > feels more logical that match_flags is at the end. I leave that to
> > HdG and Laurent to decide.
>
> .match_flags is first to match the order of the fields in the
> usb_device_id structure. Is there a need to move it last, or is only the
>
>         }, {
>
> construct that the tool doesn't like ?

The },{ construct is fine.

The tool sorts all the content in the block

Eg:
{
 tail= AA;
 head = BBB;
}

is sorted before:
{
 tail = CC;
 head= AAAA;
}
It can be tuned with a regex:
https://github.com/google/keep-sorted?tab=readme-ov-file#regular-expressions
But the syntax is not particularly nice.

This is why I moved "head" to the beginning of every struct.

Anyway, since keep-sorted is not going to be part of the CI unless it
is adopted by other subsystems we can ignore this for now.

Regards!

>
> > > Sure that works for me.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda


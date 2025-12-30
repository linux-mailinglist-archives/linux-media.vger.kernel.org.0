Return-Path: <linux-media+bounces-49742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BEDCEA29E
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55A9A300750C
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 16:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2A3320CC2;
	Tue, 30 Dec 2025 16:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9qDZIb6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A899320A0A
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 16:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767111830; cv=none; b=qTEMtdC1p3bPWGTBulCwZO5jKbQEhjWLkjUUgGaGZY/auwOo0lT+HFGTh31bX2MTKR4xiVCNqPZ4XbwsMoxw+qKNbMnJMKHH/VGVxtP2xOx6jBqVUU3SHsH62PXsmNhPKm0v3s7IkAdzIJcvXf63GaqOCJ3jMsXg24dvCGJFsLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767111830; c=relaxed/simple;
	bh=LLEJx1gu3qW6OBUMZZLVJ7RMyWdtOAfqVujeAebMk6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5ZeltktzyUHcI8sXduWAJ6Owii0OZNADydqu+PP2jUzad5Y/dDUdL7QXE0PV09VTI6a9RhNuydGCREBuSekgCSvs5p8olE/uPvMGLJeojXKkl6fqrhuaDN0uippksFhxTq0t3lHnal10sAxPF9/NtEmFnkhjcJTLK9ArHcUSRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9qDZIb6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B24C4CEFB
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767111830;
	bh=LLEJx1gu3qW6OBUMZZLVJ7RMyWdtOAfqVujeAebMk6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l9qDZIb6nRlzlDUXnbYJ4EOYQZ9F8i+xukvliKfwmK0GiI+xE1VaywKMHPIBcxb4F
	 9fiPRdlqga3x83825ThFPgfcT0z4vnzjgf+hGwQmx1euQQMfj99G0nbmZ0KzddxAS4
	 d7AmH4gipHZeFrdt+sXJg+JwOFApivK3Ty5GF6hPSGJF6Y6tfp2azHtz07UHKXwfcq
	 SiwoNe79H2sSDKaH4nVkkvIOvj19/yWClHwpcf4vuf8YPQiRHcA2uXJvYkAY8bEX2D
	 Tf4mBGTdL4yfK0ZMQGzbjxoRNTVIa1HidIi677W849extycfcTe42HDgosqCnwtrg5
	 dRITKYOpR/Oow==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b736ffc531fso1840008866b.1
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 08:23:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdtysUYT/SZPOF1j5mttovXFZ0gc4zUELnlbYVKHusHeB5bbhMNQjb/Wuy/NAGS2d8Uq807lYy94lW4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNvefXctm/e5ClLW/PO8PiDfFiccebXqqtj3lcpXkCHq/lPXG9
	KizOLkFUFldRJLjPrcOCWyLPfrlo6EgJ6oQLP4oPP2y4CZUov76XiAp2FGNZYofhk2s0hUIkrPP
	MOOUJQWT60okKK0i3el0n6o6UOK0zUA==
X-Google-Smtp-Source: AGHT+IFjxLu3B50keyp/PZwNrvLAbWpaoMwdKL3c8gAPg5ARFW7ainyJeObFPkkAV5tE0RFgAPF7L7kYqNbRIg8DeuI=
X-Received: by 2002:a17:907:9408:b0:b7d:1cf:52ad with SMTP id
 a640c23a62f3a-b80371f6e06mr3479266866b.58.1767111828760; Tue, 30 Dec 2025
 08:23:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766123192.git.alex.t.tran@gmail.com> <6f34ec79ac21d5ab9ad3fafe34a0bf6aca49a10d.1766123192.git.alex.t.tran@gmail.com>
 <6d5b7422-e1b6-4bfa-8dbf-e95c3dd19f57@kernel.org> <20251221-courageous-subtle-sparrow-75fa52@quoll>
In-Reply-To: <20251221-courageous-subtle-sparrow-75fa52@quoll>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Dec 2025 10:23:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKBF9HvDgLHV8xV5eCMwQBwwhSn9VWBwSuKV+8HPhpM7Q@mail.gmail.com>
X-Gm-Features: AQt7F2rqzBaTcbfKIOk6RS3lVwWvVEpR5JWW-1vRfLiB0BrcZCyNuvLv-R-1Vwk
Message-ID: <CAL_JsqKBF9HvDgLHV8xV5eCMwQBwwhSn9VWBwSuKV+8HPhpM7Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert
 to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alex Tran <alex.t.tran@gmail.com>, mchehab@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pavel@kernel.org, sakari.ailus@linux.intel.com, 
	mehdi.djait@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 9:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Dec 21, 2025 at 02:15:10PM +0100, Krzysztof Kozlowski wrote:
> > On 20/12/2025 21:42, Alex Tran wrote:
> > > Convert binding for toshiba,et8ek8 from TXT to YAML format.
> > > Update MAINTAINERS file accordingly.
> > >
> > > Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> > > ---
> >
> >
> > Please use scripts/get_maintainers.pl to get a list of necessary people
> > and lists to CC. It might happen, that command when run on an older
> > kernel, gives you outdated entries. Therefore please be sure you base
> > your patches on recent Linux kernel.
> >
> > Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> > people, so fix your workflow. Tools might also fail if you work on some
> > ancient tree (don't, instead use mainline) or work on fork of kernel
> > (don't, instead use mainline). Just use b4 and everything should be
> > fine, although remember about `b4 prep --auto-to-cc` if you added new
> > patches to the patchset.
> >
> > You missed at least devicetree list (maybe more), so this won't be
> > tested by automated tooling. Performing review on untested code might b=
e
> > a waste of time.
> >
> > Please kindly resend and include all necessary To/Cc entries.
>
> Odd, I see this reached DT list, but was marked by one of my filters.

Perhaps it is because the new PW instance isn't dependent on the DT
list, but uses a lei filter.

Rob


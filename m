Return-Path: <linux-media+bounces-27517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA18A4EAD2
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C48517DD9C
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9949828FFCE;
	Tue,  4 Mar 2025 17:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fhYhvYHZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AE125F983
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 17:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741110426; cv=none; b=Z+8ZAPQEmqSbb9F1En3NUPFN0IRFJjuF7h41+uXAQqLWynUcPi17h0EJwQojbFFK0Y/EF6m38pUyrm10C5mUVfpQPFgfTtpQk5icn4Nx71lptS6bOmkl09o61IfLLNPiKhMgvriQo0/OeVc9mFocp9S1wVACzFNVksNxj/vHOPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741110426; c=relaxed/simple;
	bh=0BeTHKn/9rkWCHe8dQS4KM5fYtL6wfV7Q0u6lZxJe/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2fmudVsUgQdI+mQMti/soDvx7aCt98hr32PTxUMl7Cexzn3y3Yj4+2AXYnz29y1PwODB+B64dbGD1LB7ZISAKGwdLeVXX/U96wc+SFl6n7w4kdWlGcVQWh4dCE+HgH0idayz05UanIflMVYngJTEwVxEA2VclXNfr5/uykkn+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fhYhvYHZ; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6fd6f7a8c84so25354407b3.2
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 09:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1741110424; x=1741715224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mxnywYP2lTqSlnLFR3ftUdo5O+Ug+wLHKmeRYSDuQTk=;
        b=fhYhvYHZWBjOHZjsgx2cCqY0vT/rnPWWn0ORAW2AdyNHVftWw0I5UxEvG5SZ5VbfFD
         3VBjQjbxzlf0xcTOzGO7zTycOamfvGDGD8dI8pNjGbMibvPs2+qG8j2kh1nnc2yXiMim
         qd3u80yskocyMnvkStAEZfNKZ4sd83NNT1g48AqkiNrTAkrfXoWrxBNxj8h2OijyCWwC
         olC+vx58HxmVQ96NBD2P5CXs2wMqRZd4Q90fBUlYYROilnQRcaIOkc1vHf8xNSKrN+hH
         l3LqWDM/4yqc8qvdSkj5GldGAYvIciR/TNW1sRC1nYpZEsDT/gyktMDh0F50j7u8nb9m
         CKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741110424; x=1741715224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxnywYP2lTqSlnLFR3ftUdo5O+Ug+wLHKmeRYSDuQTk=;
        b=nrtbpMJXR0Saa8s7mY6Ejz9LjgQ+o75rCZzjDg1MfKxSJKu9bEPgsozvAzuEEvpht4
         vEcwxF38It9/qhl1V0d+laRO146X1SuRh3QPAaCG0LtmW+AqEvYiHizeUD44k+FszJUN
         PbLXH+qSBTyacHNOn8QF5rkCPMJO+gGwHgDNVjlJmOiohd+k2muAnTU4GPkgttwtdADi
         Hxs4w79vsm3oF9+FYQ18i1UirspCHfB6ASF/fuXTs7G6kSj8R8gZkA2SjIxQ+9yWe0NR
         06fAwFMesy0Jj4BRhkNECFG8Wgxkb/t5RpX4msDVaw02qgL1wqAkaB3YQyv6wUIAAsqb
         MUow==
X-Forwarded-Encrypted: i=1; AJvYcCVjHU1XH5fhLQaUK3gSnGIpMVZnrYNfke2+G9Ybi9nja23P1I24OnSvfISg9rO/Y4MZPbN/UzP133Endg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOWum/AIgjSgHstuN0R6/uNQpyb95216dYjJN5TGt8pHl0AEt
	CNgB/Fv0SO77U02uDrLojnI9lv73LRLBa1I3uWb4mAZ4Y+LwB1PfE4z6WD+7Vo7/8tl2oho4qsE
	Y6ht6pdWqxft6ItFODjcwAsbkiIxDUQ3pBC8rFQ==
X-Gm-Gg: ASbGncvb+anS6oA4/UlDesJoiJk0C6o2h91xyEQ40d4G247j+I+0TwlbDz/7YrTnQSP
	VvrDlbctcyH98SKsM5UxPH8pBlZgIFX6fXJBulMF8b+SQ5wI2VD0NU5QEhPaAyRaBHr+FmzBCpp
	ZNvKMYTvFAhLLoslTbAuGUYjYLrWbXCfhag4DvAhnixvOkN5t+SZ1ckTeT6w==
X-Google-Smtp-Source: AGHT+IGPlfxsnL8xkZ525LntzQCfam2wCKsFv2c35BiU8Iy6Us9VMAZ/4ps8ZbWXqXudbJreVUIbo0hr9QOb+DIDfWA=
X-Received: by 2002:a05:690c:7243:b0:6fb:9389:3cde with SMTP id
 00721157ae682-6fda2fe10a1mr2553737b3.3.1741110424008; Tue, 04 Mar 2025
 09:47:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
In-Reply-To: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 4 Mar 2025 17:46:34 +0000
X-Gm-Features: AQ5f1JprQl2-aACC5Zkamr8nD2QNVsrsLvufWKjEDPBWI84GrWquHohlN1sdMzE
Message-ID: <CAPY8ntB8i4OyUWAL8k899yUd5QsRifJXiOfWXKceGQ7TNZ4OUw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add flash/strobe support for ov9282
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

Thanks for the series.

On Mon, 3 Mar 2025 at 22:59, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> This series adds basic flash/strobe support for ov9282 sensors using
> their "hardware strobe output".
>
> Apart from en-/disabling the flash/strobe output, setting a timeout
> (duration of activated strobe per frame) is implemented. The calculation
> of this timeout is only interpolated from various measurements, as no
> documentation was found.

The bigger picture question is whether using these flash controls is
appropriate for controlling the strobe output on a sensor. That's a
question for others (mainly Sakari and Laurent).

V4L2_CID_FLASH_TIMEOUT feels wrong for setting the duration of the strobe pulse.
Whilst the description in the docs [1] is a little brief, you then
have the description of V4L2_FLASH_FAULT_TIMEOUT for
V4L2_CID_FLASH_FAULT
"The flash strobe was still on when the timeout set by the user ---
V4L2_CID_FLASH_TIMEOUT control --- has expired. Not all flash
controllers may set this in all such conditions."
which implies it is the hardware watchdog timeout to ensure the flash
LEDs don't burn out, not configuring the duration of the flash pulse.
Then again adp1653 adopts it as the flash duration.

Is there an expectation that V4L2_CID_FLASH_STROBE_SOURCE should also
be implemented, even if it is fixed to
V4L2_FLASH_STROBE_SOURCE_EXTERNAL?

The one saving grace with this sensor is that it has a global shutter,
so the strobe does correspond to the exposure period. With rolling
shutter sensors, the flash duration is typically two frames to cover
the exposure duration of all lines as the shutter rolls down.

  Dave

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html

> Further flash/strobe-related controls as well as a migration to v4l2-cci
> helpers will likely be implemented in future series.
>
> All register addresses/values are based on the OV9281 datasheet v1.53
> (january 2019). This series was tested using an ov9281 VisionComponents
> camera module.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
> Richard Leitner (3):
>       media: i2c: ov9282: add output enable register definitions
>       media: i2c: ov9282: add led_mode v4l2 control
>       media: i2c: ov9282: add strobe_timeout v4l2 control
>
>  drivers/media/i2c/ov9282.c | 89 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 86 insertions(+), 3 deletions(-)
> ---
> base-commit: f41427b3bdee7d9845b13a80c0d03882212f4b20
> change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6
> prerequisite-change-id: 20250225-b4-ov9282-gain-ef1cdaba5bfd:v1
> prerequisite-patch-id: 86f2582378ff7095ab65ce4bb25a143eb639e840
> prerequisite-patch-id: b06eb6ec697aaf0b3155b4b2370f171d0d304ae2
> prerequisite-patch-id: b123047d71bfb9b93f743bbdd6893d5a98495801
>
> Best regards,
> --
> Richard Leitner <richard.leitner@linux.dev>
>
>


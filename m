Return-Path: <linux-media+bounces-35814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EAFAE6DD8
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 19:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8BC93BFA49
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 17:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0822E6123;
	Tue, 24 Jun 2025 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3y+IUQE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EE2126C05;
	Tue, 24 Jun 2025 17:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750787390; cv=none; b=UMXsbjCP+pUWMxRLwr22XyVoeQWxSsfLX9eWVS2Dv9CAwfBsaVPzmiyP9/o5LcaMXZ7+i1cCyJaMhKah/eimzyni7HfLrCFDJIP2V4y9KBrSpGxaYhS7M6m6HoCU09EhlEdU5rojwozxNprOH5+uNwrNBPOtT2wYZTUKnPzWVAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750787390; c=relaxed/simple;
	bh=8niqH5fusWQPHqYJrJO/JVSi3IX9VpCP8k4+ksxMVbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKBbSp9/ngY0jXKg09X3boZdrCjizbB1fBazQkem5ZNOxA60NMb0gIbsdme1LRBjdNuUh/Qwf/d/cjxZBXAQR/x5ub2a1XphMbamBrNqvY3fw8AIMox4mVCFZ3f2vkNi3JxICcMFl5cSZNI87itUXTVOFfL9wI2SDA3NG9E2yko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3y+IUQE; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-712e7aceb69so2364027b3.1;
        Tue, 24 Jun 2025 10:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750787388; x=1751392188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLsroaxh6H23HmTdr1hU2iPbjZDZO6XpHfKvVskaNvc=;
        b=B3y+IUQEsS6V2feZCjvvXBSXp/F9uPL1+i+wfa+Fxo9tjNZUaRt+98eu3of35aEQ7g
         QR+oINuxnEzEWNkWseI5GeGVTbLOvgiRCeYmwC8yjzix9u4145qsQ47GRusgJ6X8wkVx
         6mUanwzxnJ4HGlruh+Iih8b94BQsQG0oOk0ZJKk1fpusmcy7Nu3QzHfZxefqgc6S1fKJ
         yIwKCPx4KQhTOt88vGXVQ7l9DCFpvs5sI+DsFo6M0VFycmFZIqC+v6q7XFvlWfY/X+Qe
         1EmISXa5lS1K42LmsCO2XHXFgIkzBr1vNNzapBVkBm4A4ZBGx20n8Sjdf+1VNPuiz4mf
         DH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750787388; x=1751392188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLsroaxh6H23HmTdr1hU2iPbjZDZO6XpHfKvVskaNvc=;
        b=TEUvh8tM6uOkFfyhCtaMByUQhIGCIe1V+kdgfSkKGi7RlGmSNBaQvaVptjzJzcfyyQ
         tyWgk6Ck72448+mrrbestefwGOLVRvRN93OI71KF+eUV3AKeDK7c8GuqMufesEeGISw5
         E1jQOWwrHaltAIqFoYndCQfRzk0nQ9iwa6fU5wqePGcJbvFObQrKbhZWEDIRemAjf5+A
         6S0i/9rgYCULFb2YwXBYkPCRGnJ2Je3Kjva15Kwxiajzh4+LOyyIL7vOBcyzHTn2MhMQ
         r+ICTz676AzuI2l/jw6CZ6MI6snPdD+44HH2k62lU1z8qYA/CtpD3CQl0l0GcTGg4ZwP
         s5+A==
X-Forwarded-Encrypted: i=1; AJvYcCUTW81QlyNjgeVSbtRCqeG/3cuGdGOE7tWn5xN9g3Lr7G7mMMLkcTZbcDqlJE9sQ4vnYH39myQqwnZlaTw=@vger.kernel.org, AJvYcCUvcd8Zti0W2gjRBE7Gsm4rl/N8L+4FzUmW6cMJIJdTmHmUYWV6ugkU9qrPhSsTdiwywKR+y/ilaoaxhwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3MqOpA0CSjUg0AiGfj6nrCMqjkHLkCO4B4w8r0jvjyK+1Mimk
	o/B/O9k47XRTmEX7nXOJdOR5pTckpvRhbDSmPHZfBEdJzTMc867sjQ06Or9n3PIwVIOEV64vNqz
	DOgXXmH4o+xveG20IkIYGwrJID0H9Vmg=
X-Gm-Gg: ASbGncvPfnu+Joh6xzXuICnU+e2yqNKmhLjWFtCxnnl206++r0sNosOYLyiz7LcYDHE
	HZCzbOsX5vsBLlHo2rdEjvsCuzkjSw62xjUWHUWsYzz2dfgtp7GI7SZgReFIAFJBhysYmwIHjEe
	qCJlQ7Tb8kJBH+83OPSF83/V35l1zAlAZnIYqOdtIljyFL
X-Google-Smtp-Source: AGHT+IHssEQUuu01VUDAu3vxZsftAv+2vtYum0imCop2U200xncw4P31YPiG+rjvnGExrz8CdV9P1MuuH2EjpUS796g=
X-Received: by 2002:a05:690c:8311:10b0:714:305:7c74 with SMTP id
 00721157ae682-7140305800dmr6986487b3.3.1750787387601; Tue, 24 Jun 2025
 10:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain> <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
 <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
In-Reply-To: <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 24 Jun 2025 20:49:36 +0300
X-Gm-Features: AX0GCFsdhv7HQVaajzKljLDAqd4l2c2MitEjFuxVm2eTzN8YoTlF9MTss_Chq_0
Message-ID: <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 8:32=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Jun 24, 2025 at 07:51:10PM +0300, Abdelrahman Fekry wrote:
> > On Tue, Jun 24, 2025 at 7:31=E2=80=AFPM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > >
> > > On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
> > > >  int hmm_init(void)
> > > >  {
> > > >       int ret;
> > > > @@ -130,14 +48,6 @@ int hmm_init(void)
> > > >        */
> > > >       dummy_ptr =3D hmm_alloc(1);
> > > >
> > > > -     if (!ret) {
> > > > -             ret =3D sysfs_create_group(&atomisp_dev->kobj,
> > > > -                                      atomisp_attribute_group);
> > > > -             if (ret)
> > > > -                     dev_err(atomisp_dev,
> > > > -                             "%s Failed to create sysfs\n", __func=
__);
> > > > -     }
> > > > -
> > > >       return ret;
> > >
> > >
> > > It's really unclear how this "return ret;" is supposed to work.  Was
> > > that part of the sysfs_create_group()?
> > >
> > yes , but still it can be set by hmm_bo_device_init so even after remov=
ing
> > sysfs_create_group , ret value depends on another function.
> >
>
> You're in too big of a hurry.  Wait for a day between resending patches.
> I have looked at this some more and it turns out that nothing checks the
> error code so the "return ret;" doesn't work.  What do you think we
> should do?
>
sorry , will keep the time issue in mind.
regarding the "return ret", its now basically returning the error code of
hmm_bo_device_init () inside the function , but outside the function
scope like you mentioned, no function call to the hmm_init() checks
the error code. Thats what you mean right ?

> regards,
> dan carpenter
>


Return-Path: <linux-media+bounces-43432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F0BAEBAF
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 01:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2065F16B075
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 23:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0838C2D238D;
	Tue, 30 Sep 2025 23:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLMYUycy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60609263F5E
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 23:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759273574; cv=none; b=Jgj+EehbKFKFtP/LqtLKTlCbhasYKBwMRSHD5D1Q5HaaFmsZNdkwC/q+byYfSUs7r6Mm2bLu94+3LXXvwJm8hFUPlrDMyJb4HKfv+kKzXjzZ44KxIOUixXaPMNaMQR7bPtsQjFfcN+4a8J2h5y7A6Nu2zjkqyLXuXxETgljskJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759273574; c=relaxed/simple;
	bh=mFz+L72B9DjiruUWCPt3+uUkwCHLqPB81lzn9f7L9es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtrHDqul8P+lpED0lp+jir+NVJO+KOPiZ63DoxSZDF+YTBRlMvyLBtnwyVOjtsSSAD2e6AvgjOr5ZSZY8aX3W/og5+CT4zraTD0piNSAYSmlG0Niwi7KTVgCgtxBVqGmjE5As7VmTE/M8SxukwIxx/xn0kC3EKG7RpLjeVLTNkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLMYUycy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8942C2BC9E
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 23:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759273573;
	bh=mFz+L72B9DjiruUWCPt3+uUkwCHLqPB81lzn9f7L9es=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TLMYUycydyqqjUP15CWlEFWzraN18TkKIePRecxtCkCy1V5Q6/cfOULx67IJAdEQY
	 EFNXsgnj/eXNVpwvz/ZXK8sN2Kv+2EroVbxbQTHggT3RrnWzpqW/+Z+m7tk7o9dfFo
	 sEq6s7AbWNouIEML4E8VJ1WTkAEhu3E135shP2Vr1R/buR2pnuVKgi3JwzjqUc5Wm0
	 DWzbQKPLIcspHPUxfkQnFXFz1R8Rm8sSnElOO/CFIwGkfzxfOMPgGpPyR3P6DpgPBJ
	 o2/bpIo5eTMgdzFUbE3ysoaO3uOcJaWiK5lanpjA19JNzBPG/nwdL23imNUc9InoM5
	 H64dZ454YRRPw==
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27d3540a43fso72542735ad.3
        for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 16:06:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXi7LapZBwwh36S3RFPgB7TeH7fCBME6IQcCRO+TZZMuExobgCdwrNKdXqOCx+Sevm6BLIyxrNo3J0nXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ovocvdHOnbI1p1fo+fLWxRmZYEYavmz6gVwbViCdoefYNXre
	XPTNijp/uRuXmawJWPU0CtC224F/k9QT5uL35cKLCjKr/i8Qipvcj1EQNsGazLQT3Wqnc0/tVpQ
	3kWP+q0eUhMKCWA3upuTOaSyZX6IR2Dk=
X-Google-Smtp-Source: AGHT+IEtVABxEKyxN7a+U3Kp2sBw7bT8AmKlK9sbcU4p8q7V3u9HMuNYcQ/g3mBtE/Xshs31HBFf6QR4rED4d0MupEk=
X-Received: by 2002:a17:903:4b48:b0:275:2aac:fef8 with SMTP id
 d9443c01a7336-28e7f33067fmr14927905ad.38.1759273573411; Tue, 30 Sep 2025
 16:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com> <20250930040348.3702923-9-h.dewangan@samsung.com>
 <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
 <75d06769-4896-4095-9969-03a517705196@samsung.com> <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
In-Reply-To: <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 1 Oct 2025 08:06:01 +0900
X-Gmail-Original-Message-ID: <CAJKOXPchnA2k4sghuSBxA4h=CKJEQU0=09F+AAxPxA-rBpUW_g@mail.gmail.com>
X-Gm-Features: AS18NWB-7qq3WRSu2_4sN54O9Pq__ESSuLB-fBN1o7du1U_PSVDKaJXEOusJU-4
Message-ID: <CAJKOXPchnA2k4sghuSBxA4h=CKJEQU0=09F+AAxPxA-rBpUW_g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_08=2F29=5D_media=3A_mfc=3A_Add_Exynos=E2=80=91MFC_drive?=
	=?UTF-8?Q?r_probe_support?=
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Himanshu Dewangan <h.dewangan@samsung.com>, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, alim.akhtar@samsung.com, manjun@samsung.com, 
	nagaraju.s@samsung.com, ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Oct 2025 at 07:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, 1 Oct 2025 at 00:46, Marek Szyprowski <m.szyprowski@samsung.com> =
wrote:
> >
> > Hi Krzysztof,
> >
> > On 30.09.2025 07:54, Krzysztof Kozlowski wrote:
> > > On Tue, 30 Sept 2025 at 12:56, Himanshu Dewangan <h.dewangan@samsung.=
com> wrote:
> > >> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
> > >>
> > >> Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
> > >> Exynos MFC driver that supports firmware version=E2=80=AF13 and late=
r.
> > >> Extend the top=E2=80=91level Samsung platform Kconfig to disable the=
 legacy
> > >> S5P=E2=80=91MFC driver when its firmware version is >=E2=80=AFv12 an=
d to select the
> > >> new Exynos=E2=80=91MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not=
 enabled.
> > >>
> > >> Add exynos-mfc Kconfig and Makefile for probe functionality and crea=
tion
> > >> of decoder and encoder device files by registering the driver object
> > >> exynos_mfc.o and other relevant source files.
> > >>
> > >> Provide header files mfc_core_ops.h and mfc_rm.h containing core
> > >>    operation prototypes, resource=E2=80=91manager helpers,
> > >>    and core=E2=80=91selection utilities.
> > >>
> > >> Add a configurable option MFC_USE_COREDUMP to enable core=E2=80=91du=
mp
> > >> support for debugging MFC errors.
> > >>
> > >> These changes bring support for newer Exynos=E2=80=91based MFC hardw=
are,
> > >> cleanly separate it from the legacy S5P=E2=80=91MFC driver, and lay =
the
> > >> groundwork for future feature development and debugging.
> > >>
> > > No, NAK. Existing driver is well tested and already used on newest
> > > Exynos SoC, so all this new driver is exactly how you should not work
> > > in upstream. You need to integrate into existing driver.
> > >
> > > Samsung received this review multiple times already.
> >
> > Please don't be so categorical. The MFC hardware evolved quite a bit
> > from the ancient times of S5PV210 SoC, when s5p-mfc driver was designed=
.
> > The feature list of the new hardware hardly matches those and I really
> > don't see the reason for forcing support for so different hardware in a
> > single driver. Sometimes it is easier just to have 2 separate drivers i=
f
> > the common part is just the acronym in the hardware block name...
> >
>
> I know it is easier for Samsung to write new driver, but this should
> answer to - why the maintainers and the community would like to
> maintain two drivers. Sure, make a case why we would like to take this
> code.
>
> The easiest argument here why we wouldn't is: new vendor downstream
> code means replicating all known issues, old coding style, everything
> which we already fixed and changed.

And 15 second look at one of the patches already confirmed this:
replicating downstream issue - undocumented DT ABI not following
current style, code relying on some other downstream drivers. 15
seconds was enough to find it.


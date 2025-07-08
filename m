Return-Path: <linux-media+bounces-37119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A5FAFCE65
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06894172BCF
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 14:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E8D2E041C;
	Tue,  8 Jul 2025 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iV/SHiw1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681B42E041F
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751986724; cv=none; b=nydHNOdn6jtnfRQ+Muij0yaCvOlMV9OPP/NRyioKmEVsB6NeELF/41prxKp3C9VCG8pEIHlxFtc1ENNe0jbOnbuO1ucvqn7X24gPvupu+scl5B6GmR+qMQUypQXQmxcZmN0dykb7Q4wzVFnLfOCPbvGzEL52gBMI/wwTTdrmDCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751986724; c=relaxed/simple;
	bh=HGTpVxEEJn+4Z8F/2vfMSUr1vMJyUPWvL7WDo/xrVN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luLV3sbeR+MY1MCjxMLsfSVwDlUc7bAF+kGtWc4G89F9FqPHByeTZtoncwsRqcDYnK23TbtinzWUG/AXOtHz1J1tpnyqojmBoB+gBh5av2gjXeKcQ2hDEX5GTcaBcO1fp7IvBSKWv0Nw6eAG2KsnhfZR6aCbegXzXHFPltC7gLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iV/SHiw1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55511c3e203so4057600e87.3
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751986720; x=1752591520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsjEc9LmeMOTlM1N3xvojXwrwvOBpBec3I1iTp5IlDk=;
        b=iV/SHiw1WPWcKwV+GMPbxGhFJWHy3MSOaVW3Q6Nz2n2AqdKiKGyAed3rI3h+s6Y06K
         edWkKrK8zTRDLssDBG1VL9FrH57jl7+wla8Hv1JqWMZA6rpjQ0/R+LYEPx6eXcIt4/ie
         6FOrMOKFq6jQGWc2aqpC6JlsKHrq7rgCCULvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986720; x=1752591520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsjEc9LmeMOTlM1N3xvojXwrwvOBpBec3I1iTp5IlDk=;
        b=RT5dSLCTkkQwNYDa8cwlM1B7KIP+xNKHIJlcV9ZXZdRwG5hl9/ch0riZ/jHLa4Wqej
         vJ00YEFroW9JxUAW8dO5bycjVYlDAY+M3XQ/MJVCUxbxo3ckPthTvkdrtNJvFqRfz/Mt
         YitOqZI6XvYVSQ+vFiY30BgV9l7GC+eZ+mVeyAZdU3jhvr9WcS9pI9NGPnGrmeV9NWq5
         99xcLGFygDVErWhcyEWpBJkycNUX83Y307rYqGPhy1WqxQ12eicK+KbXdmGyJjC/B1Or
         XdpXAr6GCHM0xTRxPGYFfirBkpobSma7eYWvKWZ+VrxIoFRgpiQ3RQ/PV+ad76lIBDhb
         iHpA==
X-Forwarded-Encrypted: i=1; AJvYcCXjNFKDuim5/tOX0lL6G52RzNx/NUXVjM2TpKvIamkpG9/n0ytutXPvEvXAwM9GiqZe19uw415rneLLGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCxiPXXYnyXqt0qFTp5hCNVEMEE62+SRZx30+IkoXn+V8htWaO
	64HVsSuOsIhc9NWDCtrD6oigP1j241fak4xv1fi2ITHUB6nplpSSbIrp1t1GbIsY0M1fHMoaWj9
	qQ2Psrmf8
X-Gm-Gg: ASbGnctR/k54ec55k5JKvHwUsHB4W568K1vLZRS6DwtnsyiHYaNl1NmJ914AjuVHB9K
	IHAIhPh05bvDPbYfePmZ8OVhp/E2WeWpMXFZNjkbssSTDaL3rkC+xlSiEtpdodTwmC9VvHubpV3
	s13RzRK85+L3/dEPI/hsuU3M8YALEDUTErWx/aHSYYYyhtutCM9kUjlPE93Pr+sMcK6UBuf3YnB
	QjBYO5m5AHpnkX/TLklmepoi78HNl+W/7/pqrXyjdZ/I5NFjcVyrDVHTPf0/xRw3rxczT90KOzU
	y3k77sVicC1sf0ycaRCHzfCFUfZCJK384OHmhSvN6aROCytDwDARfF8j+rmvWv1fLMXc8Te+ZpB
	zayBdLzPp8R+9zjwy+jnlD0D4
X-Google-Smtp-Source: AGHT+IGFGzV9/dRdzf5qelLEINyd2VPmir++KJOh43xvU3CWfTttqi2PTgUVWL4638yuTr3dht+PKQ==
X-Received: by 2002:a05:6512:3050:b0:553:358e:72a8 with SMTP id 2adb3069b0e04-556ddb95ff6mr5454741e87.38.1751986720441;
        Tue, 08 Jul 2025 07:58:40 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb16dsm1674576e87.24.2025.07.08.07.58.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:58:39 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55511c3e203so4057551e87.3
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 07:58:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNHNYF+X5F4i+Ckep76Vc3PXxJmozvgeThvG+mMrH8xaanRH8xLIe1tf7i8oKhw25srhMDrj7vi+yWgg==@vger.kernel.org
X-Received: by 2002:a05:6512:ac8:b0:553:3028:75ae with SMTP id
 2adb3069b0e04-556de076273mr5727105e87.46.1751986718368; Tue, 08 Jul 2025
 07:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-5-5710f9d030aa@chromium.org> <aGw_1T_Edm8--gXW@kekkonen.localdomain>
 <CANiDSCup2iRx+0RcaijSmbn04nBY4Ui9=esCPFsQzOKe=up9Gg@mail.gmail.com>
 <aGzjTRSco39mKJcf@kekkonen.localdomain> <CANiDSCsqEHTnbvzLMoe_yxi8JRzp+2PQe3ksXhD=Y3+AqC_9hw@mail.gmail.com>
 <aG0NI2V0Tfh2HZ6O@kekkonen.localdomain>
In-Reply-To: <aG0NI2V0Tfh2HZ6O@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 16:58:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCu=wU_Oi7CLPcYTC3Xf_pGbDroaVitPAiAj7ND5pXy-6g@mail.gmail.com>
X-Gm-Features: Ac12FXx3zIz7eqEIVhgOFhdr-yyA-k97hK_sQ1bucetsK4DfnOnoX-8awEd9Sp8
Message-ID: <CANiDSCu=wU_Oi7CLPcYTC3Xf_pGbDroaVitPAiAj7ND5pXy-6g@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] media: ipu-bridge: Use v4l2_fwnode for unknown rotations
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Jul 2025 at 14:21, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> Hi Ricardo,
>
> On Tue, Jul 08, 2025 at 02:09:28PM +0200, Ricardo Ribalda wrote:
> > On Tue, 8 Jul 2025 at 11:22, Sakari Ailus <sakari.ailus@linux.intel.com=
> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Tue, Jul 08, 2025 at 11:16:25AM +0200, Ricardo Ribalda wrote:
> > > > Hi Sakari
> > > >
> > > > Thanks for your review
> > > >
> > > > On Mon, 7 Jul 2025 at 23:45, Sakari Ailus <sakari.ailus@linux.intel=
.com> wrote:
> > > > >
> > > > > Hi Ricardo,
> > > > >
> > > > > On Thu, Jun 05, 2025 at 05:52:58PM +0000, Ricardo Ribalda wrote:
> > > > > > The v4l2_fwnode_device_properties contains information about th=
e
> > > > > > rotation. Use it if the ssdb data is inconclusive.
> > > > >
> > > > > As SSDB and _PLD provide the same information, are they always al=
igned? Do
> > > > > you have any experience on how is this actually in firmware?
> > > >
> > > > Not really, in ChromeOS we are pretty lucky to control the firmware=
.
> > > >
> > > > @HdG Do you have some experience/opinion here?
> > > >
> > > > >
> > > > > _PLD is standardised so it would seem reasonable to stick to that=
 -- if it
> > > > > exists. Another approach could be to pick the one that doesn't tr=
anslate to
> > > > > a sane default (0=C2=B0).
> > > >
> > > > I'd rather stick to the current prioritization unless there is a
> > > > strong argument against it. Otherwise there is a chance that we wil=
l
> > > > have regressions (outside CrOS)
> > >
> > > My point was rather there are no such rules currently for rotation: o=
nly
> > > SSDB was being used by the IPU bridge to obtain the rotation value,
> > > similarly only _PLD is consulted when it comes to orientation.
> >
> > So something like this:?
> >
> > static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
> >                                      struct ipu_sensor_ssdb *ssdb,
> >                                      struct
> > v4l2_fwnode_device_properties *props)
> > {
> >         if (props->rotation !=3D V4L2_FWNODE_PROPERTY_UNSET)
> >                 return props->rotation;
> >
> >         switch (ssdb->degree) {
> >         case IPU_SENSOR_ROTATION_NORMAL:
> >                 return 0;
> >         case IPU_SENSOR_ROTATION_INVERTED:
> >                 return 180;
> >         }
> >
> >         dev_warn(ADEV_DEV(adev),
> >                  "Unknown rotation %d. Assume 0 degree rotation\n",
> >                  ssdb->degree);
>
> Maybe:
>
>         acpi_handle_warn(acpi_device_handle(adev), ...);
>
> ?
>
> >         return 0;
> > }
>
> Looks good to me. Maybe something similar for orientation?

Do you mean using ssdb also for orientation or using acpi_handle_warn?


I cannot find anything related to orientation for SSDB
https://github.com/coreboot/coreboot/blob/main/src/drivers/intel/mipi_camer=
a/chip.h#L150

Am I looking in the right place?

Regards!
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda


Return-Path: <linux-media+bounces-56086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPCPJLVWuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:27:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7AF2AAD86
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B02C230EA346
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7D73CB2EA;
	Tue, 17 Mar 2026 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O/xSXxvp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uIivrdR0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E43CB2C1
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753880; cv=pass; b=qFhYEt6hsquxV9F7yG4yIfWq1PPRHjE25zaSSb6sz4ffVeqoUlR1GGD3XyuF0kwkihDn1NxguH/eColEvjFKgFpnuhl9O436lB2+FP+yL0CM6x5K94eelRCGrU1yuU1Gc4jSry8QPwONHzr08wqacN8SG9si3n76rFdu06NGn5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753880; c=relaxed/simple;
	bh=BNtrX0L+uJ4bBdoZ3iajB/SjrUyl5EbcZT7COtuhScE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVamyLjq6X39p0SjIM+4IgtUO0qw8WEIZnFdg6rWaH0CgoOrgNSjGlIwWTf6RMm6GfRSPG5GfYtvChsCvzx14Cjj9MFlbBTjUYIWGbT468hgJD76Dy0WS4UZlz/DpEQBhUn5814ipWyca6uLCmlcEEPC4FBhIq6R645LYvH1Hi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O/xSXxvp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uIivrdR0; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773753876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A2Kh1mr6Pa9C03v2li1tKfB2OJtXlSeUex9GGkEHNH0=;
	b=O/xSXxvpJ2CKZ+sD3bWDxSXtWtTSXXZm2IIEgMgajUzN0FTjpf0Onbgk7hKyW3beq8gBIB
	xVtNndhBOyzwuDz+9qpWAFCDwGQjVE/53GUicliAUCcKIDkAG9i+yd92VRqClsBlktB+0O
	FkIsx/7KEtjLgJczJLQUNhMh8hu96D0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-lUmEmvAlPMW0LNRA4oem6A-1; Tue, 17 Mar 2026 09:24:34 -0400
X-MC-Unique: lUmEmvAlPMW0LNRA4oem6A-1
X-Mimecast-MFC-AGG-ID: lUmEmvAlPMW0LNRA4oem6A_1773753874
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d73a9553bfso67262541a34.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 06:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773753874; cv=none;
        d=google.com; s=arc-20240605;
        b=W0EKj0WCCeTcNwWf56/hMQP851BnN9kRkMQ3A2jdFr/vVmJAB2uS/vJtOt0Eab+UD3
         vuVkTJ+UkDYiXxZk+ysE2yiEypikPMrUmbeoKoucCixdukrZ7cL3Fd1FCkpTZ8+VjtSZ
         m/PsnFLtd0iUWDXEVq0/IB5n1FYGOcreWUgfPYGeKd7w3+YjB3wVwaSO/LtdXK0twXxy
         7POpLDrNwHiAv1IZKRJ9R9Rp90px/1skCZhCctXNI19InLISMynvuv7lTxC32Af35CTl
         IEuGyoJINiq8MEhDcHjMML1Pp3zwJMjKiqj4mFAmJHAuvpvPNvyrylXt1nRonu12mAra
         Kj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A2Kh1mr6Pa9C03v2li1tKfB2OJtXlSeUex9GGkEHNH0=;
        fh=QdjfaKk6CvTPJMACLLmRB6BPTZXfaJZAJMNudczBoIY=;
        b=kSjQLplGt91RPln2wqPHZJD7W7CPB3IOkvsIytM0yvez8iGazy3hYMjSmfj1qiz94i
         Cu/6yf+yvfdJ3L2HJC+3mHaZmyC0u3AecRQlBMEJqI3jmPceWVrmIiGAm770GuhaGZk6
         QxfyjBEXUiEi8168rETQstcNoW4g9XJj3N3Lcgej43SaU+rvtw8za3ViwZv5FQ/YaGPk
         jYLRMXk5T/HhsqO02B+UKPpyd3aUMzB2RmVy1KG/zpmmQG14/MMiTQRMVH9nUt5kxqJm
         IHyq3Fw+gxIUpECP0WtGzSbyVUEacGmB+TWA57DaMVqJdNsSm4j1kwo5pxseG2aCJlYi
         T93A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773753874; x=1774358674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2Kh1mr6Pa9C03v2li1tKfB2OJtXlSeUex9GGkEHNH0=;
        b=uIivrdR0M3p4GSc8OQcaHgrjaDNop3pXVqDo0DaBFfQ4mAKAigwX/qNJbSx1qVI8Cy
         ZoVkF55nJqaosO4bU5C/JUFVQc5qjP2jnoIoW26lE2aVuz/yGMDvOBBe9pHaK7v1EHCd
         PJjD89IidHlU6KFrm3MxfIwjgWLH11bGxImUKkdmNcfWWqHsNbqD33EWZERFDAC3GmIU
         y7Vx5FO0oE2AHXGU8QgBzomKbQPtFglA4BKSfNj27AzJRx19QxXPqGF1/ja1jq4Vd3Vm
         D/iZlkzzWSABKMdo3DScu6a3n8BK2WGtfFU8OpLYxcpEluzXEIQy+iK+RefQJmM8GTjW
         vHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773753874; x=1774358674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A2Kh1mr6Pa9C03v2li1tKfB2OJtXlSeUex9GGkEHNH0=;
        b=jDUN4EgWUNNUmjj/ETaQ/VQFYI1Rrp351naX38vZ7hrH+GqFJ8ntIYl0WINKxnRWpq
         BeCNhRKZwu4waCuiPcYaroCARNw65uU4eUAFg4K7u331sM70/3hYM+7eJ3r8arNNLsJd
         TTnta4KqkNKCuhZ0UaIpy+M5vM5dq6XCKmwb/8Ui+/+9UDXSC34diHw93j4HM7oLZR/X
         wn0GP/ZBs7NYS0Tn4Pv33Alo161UjUjBX7a0a9EA5q6IYiIP0FYvISdUqJeQKxwr/75T
         f22eUkL7obqjDyEQCvTa8k5rVRkwAEPfVTHxr0DHlkNYp6jYykPlvMVD+wdBQfl33ZY+
         Df8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoPt645XFVOa+jUMZqw3XOTzfT6y6LUhJWKBlKpFCmsELahDwqdocEpUNy+XrylRTsEhX08WjZTyySuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLvMvYLR8eJKGgOrqwl8h2G4eCQWZFnYWJ/IgrfhopylDZ4JrF
	+24dF9+rtU8NuodiZ/W4FhGTK3qJuFLxFcVyLl9ykDmZusm/3t3JuR6/gp3UuRKDZz6LFYQK1P4
	VLHrg7ZJGsuoCeAyWbkBgcRDuXkmoF5n2AgztnFeKR0/77L1lSWw1lMiY8eT1gXDUqMb1L4K8Je
	zKNq8xvZZugFbWMoLbcwWILMTM479uEQ4twL2eCGU=
X-Gm-Gg: ATEYQzzjgh0bGvKypcVjSGgOlewtgA+YG9x48h8DMaAYl5ri4YBY3N87pi/bh5h+GsM
	cGrzvTUcvkqjGYyPsyFwGzGjjvuKdSXPmCItJSI06VUK55k5a/q7F0OrXQ04ebOLsvZFQtw/kc4
	rEcJ3Bd5sSo2qVd4abDBTr6f4px0NvJhViaBp59fBFZUt6xgTYCILruk7S6KKBa73YNS6TekjQV
	Di82Q==
X-Received: by 2002:a9d:6351:0:b0:7d7:b85f:5eea with SMTP id 46e09a7af769-7d7b85f5f98mr2159162a34.14.1773753873586;
        Tue, 17 Mar 2026 06:24:33 -0700 (PDT)
X-Received: by 2002:a9d:6351:0:b0:7d7:b85f:5eea with SMTP id
 46e09a7af769-7d7b85f5f98mr2159145a34.14.1773753872668; Tue, 17 Mar 2026
 06:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316085704.352669-1-hpa@redhat.com> <abh9evUPzozh40k-@kekkonen.localdomain>
In-Reply-To: <abh9evUPzozh40k-@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 17 Mar 2026 21:24:20 +0800
X-Gm-Features: AaiRm51i79o-T9oKP3A8QWDNPim5LBeDFYYTGTWvSBBAIwdhZrtglBocjJpuYSU
Message-ID: <CAEth8oHPaWg9U5GWSeF4R5FmKfgxdxE3jfPut8egP=8c5oxHJw@mail.gmail.com>
Subject: Re: [PATCH v11] media: Add t4ka3 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56086-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,intel.com:email,rect.top:url]
X-Rspamd-Queue-Id: AB7AF2AAD86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thank you for reviewing it.

And thank you, Hans

On Tue, Mar 17, 2026 at 6:00=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> Thanks for the patch.
>
> Where have you seen this sensor being used, if I may ask?

It can be found on the Xiaomi Pad2 that is based on an Intel Cherry
Trail platform.

>
> On Mon, Mar 16, 2026 at 04:57:04PM +0800, Kate Hsuan wrote:
> > Add the t4ka3 driver from:
> > https://github.com/kitakar5525/surface3-atomisp-cameras.git
> >
> > With many cleanups / changes (almost a full rewrite) to make it suitabl=
e
> > for upstream:
> >
> > * Remove the VCM and VCM-OTP support, the mainline kernel models VCMs a=
nd
> >   calibration data eeproms as separate v4l2-subdev-s.
> >
> > * Remove the integration-factor t4ka3_get_intg_factor() support and IOC=
TL,
> >   this provided info to userspace through an atomisp private IOCTL.
> >
> > * Turn atomisp specific exposure/gain IOCTL into standard v4l2 controls=
.
> >
> > * Use normal ACPI power-management in combination with runtime-pm suppo=
rt
> >   instead of atomisp specific GMIN power-management code.
> >
> > * Turn into a standard V4L2 sensor driver using
> >   v4l2_async_register_subdev_sensor().
> >
> > * Add vblank, hblank, and link-freq controls; drop get_frame_interval()=
.
> >
> > * Use CCI register helpers.
> >
> > * Calculate values for modes instead of using fixed register-value list=
s,
> >   allowing arbritrary modes.
> >
> > * Add get_selection() and set_selection() support
> >
> > * Add a CSI2 bus configuration check
> >
> > This been tested on a Xiaomi Mipad2 tablet which has a T4KA3 sensor wit=
h
> > DW9761 VCM as back sensor.
> >
> > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Co-developed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> > Changes in v11:
> > 1. Rebase on the latest next branch.
> >
> > Changes in v10:
> > 1. Fix the format settings.
> > 2. Fix the hblank range calculation.
> > 3. In t4ka3_enable_stream(), powerdown when pm_runtime_get_sync() fails=
.
> > 4. Fix the clean up call sequence when removing the driver.
> > 5. Fix the error handling in t4ka3_probe().
> >
> > Changes in v9:
> > 1. Apply Hans' fix patch to fix the lock issue and squash it into this
> >    patch.
> > https://lore.kernel.org/linux-media/33dd5660-efb6-47e0-9672-f3ae6575118=
5@kernel.org/
> >
> > Changes in v8:
> > 1. Drop the local mutex lock and v4l2-core manages all the locking.
> > 2. __t4ka3_get_pad_format() and __t4ka3_get_pad_crop() are replaced wit=
h
> >    v4l2_subdev_state_get_format() and v4l2_subdev_state_get_crop().
> > 3. The deprecated s_stream was replaced with enable_streams() and
> >    disable_streams().
> > 4. Drop unused functions.
> > 5. t4ka3_get_active_format() helper is used to get the active format.
> > 6. v4l2_link_freq_to_bitmap() is used to check and get the supported
> >    link frequency.
> >
> > Changes in v7:
> > 1. Add pixel_rate control.
> >
> > Changes in v6:
> > 1. t4ka3_s_config() was removed.
> > 2. The unused macros were removed.
> > 3. The runtime pm initial flow was improved.
> > 4. In remove(), if the device is not in the "suspend" state, the device
> >    will be manually turned off.
> >
> > Changes in v5:
> > 1. Improved Kconfig help description.
> >
> > Changes in v4:
> > 1. Another CI issue fixes.
> >
> > Changes in v3:
> > 1. Fix the issues reported by the CI system.
> >
> > Changes in v2:
> > 1. The regmap information was obtained before configuring runtime PM so
> >    probe() can return without disabling runtime PM.
> > 2. In t4ka3_s_stream(), return -EBUSY when the streaming is enabled.
> > ---
> >  drivers/media/i2c/Kconfig  |   12 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/t4ka3.c  | 1085 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 1098 insertions(+)
> >  create mode 100644 drivers/media/i2c/t4ka3.c
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 20482be35f26..6344defdbb51 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -790,6 +790,18 @@ config VIDEO_S5KJN1
> >         To compile this driver as a module, choose M here: the
> >         module will be called s5kjn1.
> >
> > +config VIDEO_T4KA3
> > +     tristate "Toshiba T4KA3 sensor support"
> > +     depends on ACPI || COMPILE_TEST
> > +     depends on GPIOLIB
> > +     select V4L2_CCI_I2C
> > +     help
> > +       This is a Video4Linux2 sensor driver for the Toshiba T4KA3 8 MP
> > +       camera sensor.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called t4ka3.
> > +
> >  config VIDEO_VD55G1
> >       tristate "ST VD55G1 sensor support"
> >       select V4L2_CCI_I2C
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index a3a6396df3c4..64c0c7964998 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -139,6 +139,7 @@ obj-$(CONFIG_VIDEO_SAA717X) +=3D saa717x.o
> >  obj-$(CONFIG_VIDEO_SAA7185) +=3D saa7185.o
> >  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) +=3D sony-btf-mpx.o
> >  obj-$(CONFIG_VIDEO_ST_MIPID02) +=3D st-mipid02.o
> > +obj-$(CONFIG_VIDEO_T4KA3) +=3D t4ka3.o
> >  obj-$(CONFIG_VIDEO_TC358743) +=3D tc358743.o
> >  obj-$(CONFIG_VIDEO_TC358746) +=3D tc358746.o
> >  obj-$(CONFIG_VIDEO_TDA1997X) +=3D tda1997x.o
> > diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
> > new file mode 100644
> > index 000000000000..d9af5e51f7a8
> > --- /dev/null
> > +++ b/drivers/media/i2c/t4ka3.c
> > @@ -0,0 +1,1085 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Support for T4KA3 8M camera sensor.
> > + *
> > + * Copyright (C) 2015 Intel Corporation. All Rights Reserved.
> > + * Copyright (C) 2016 XiaoMi, Inc.
> > + * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
>
> Any 2026 copyrights?
>
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/bits.h>
> > +#include <linux/delay.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/mutex.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/types.h>
> > +
> > +#include <media/media-entity.h>
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#define T4KA3_NATIVE_WIDTH                   3280
> > +#define T4KA3_NATIVE_HEIGHT                  2464
> > +#define T4KA3_NATIVE_START_LEFT                      0
> > +#define T4KA3_NATIVE_START_TOP                       0
> > +#define T4KA3_ACTIVE_WIDTH                   3280
> > +#define T4KA3_ACTIVE_HEIGHT                  2460
> > +#define T4KA3_ACTIVE_START_LEFT                      0
> > +#define T4KA3_ACTIVE_START_TOP                       2
> > +#define T4KA3_MIN_CROP_WIDTH                 2
> > +#define T4KA3_MIN_CROP_HEIGHT                        2
> > +
> > +#define T4KA3_PIXELS_PER_LINE                        3440
> > +#define T4KA3_LINES_PER_FRAME_30FPS          2492
> > +#define T4KA3_FPS                            30
> > +#define T4KA3_PIXEL_RATE \
> > +     (T4KA3_PIXELS_PER_LINE * T4KA3_LINES_PER_FRAME_30FPS * T4KA3_FPS)
> > +
> > +/*
> > + * TODO this really should be derived from the 19.2 MHz xvclk combined
> > + * with the PLL settings. But without a datasheet this is the closest
> > + * approximation possible.
> > + *
> > + * link-freq =3D pixel_rate * bpp / (lanes * 2)
> > + * (lanes * 2) because CSI lanes use double-data-rate (DDR) signalling=
.
> > + * bpp =3D 10 and lanes =3D 4
> > + */
> > +#define T4KA3_LINK_FREQ                              ((u64)T4KA3_PIXEL=
_RATE * 10 / 8)
> > +
> > +/* For enum_frame_size() full-size + binned-/quarter-size */
> > +#define T4KA3_FRAME_SIZES                    2
> > +
> > +#define T4KA3_REG_PRODUCT_ID_HIGH            CCI_REG8(0x0000)
> > +#define T4KA3_REG_PRODUCT_ID_LOW             CCI_REG8(0x0001)
> > +#define T4KA3_PRODUCT_ID                     0x1490
> > +
> > +#define T4KA3_REG_STREAM                     CCI_REG8(0x0100)
> > +#define T4KA3_REG_IMG_ORIENTATION            CCI_REG8(0x0101)
> > +#define T4KA3_HFLIP_BIT                              BIT(0)
> > +#define T4KA3_VFLIP_BIT                              BIT(1)
> > +#define T4KA3_REG_PARAM_HOLD                 CCI_REG8(0x0104)
> > +#define T4KA3_REG_COARSE_INTEGRATION_TIME    CCI_REG16(0x0202)
> > +#define T4KA3_COARSE_INTEGRATION_TIME_MARGIN 6
> > +#define T4KA3_REG_DIGGAIN_GREEN_R            CCI_REG16(0x020e)
> > +#define T4KA3_REG_DIGGAIN_RED                        CCI_REG16(0x0210)
> > +#define T4KA3_REG_DIGGAIN_BLUE                       CCI_REG16(0x0212)
> > +#define T4KA3_REG_DIGGAIN_GREEN_B            CCI_REG16(0x0214)
> > +#define T4KA3_REG_GLOBAL_GAIN                        CCI_REG16(0x0234)
> > +#define T4KA3_MIN_GLOBAL_GAIN_SUPPORTED              0x0080
> > +#define T4KA3_MAX_GLOBAL_GAIN_SUPPORTED              0x07ff
> > +#define T4KA3_REG_FRAME_LENGTH_LINES         CCI_REG16(0x0340) /* aka =
VTS */
> > +/* FIXME: need a datasheet to verify the min + max vblank values */
> > +#define T4KA3_MIN_VBLANK                     4
> > +#define T4KA3_MAX_VBLANK                     0xffff
> > +#define T4KA3_REG_PIXELS_PER_LINE            CCI_REG16(0x0342) /* aka =
HTS */
> > +/* These 2 being horz/vert start is a guess (no datasheet), always 0 *=
/
> > +#define T4KA3_REG_HORZ_START                 CCI_REG16(0x0344)
> > +#define T4KA3_REG_VERT_START                 CCI_REG16(0x0346)
> > +/* Always 3279 (T4KA3_NATIVE_WIDTH - 1, window is used to crop */
> > +#define T4KA3_REG_HORZ_END                   CCI_REG16(0x0348)
> > +/* Always 2463 (T4KA3_NATIVE_HEIGHT - 1, window is used to crop */
> > +#define T4KA3_REG_VERT_END                   CCI_REG16(0x034a)
> > +/* Output size (after cropping/window) */
> > +#define T4KA3_REG_HORZ_OUTPUT_SIZE           CCI_REG16(0x034c)
> > +#define T4KA3_REG_VERT_OUTPUT_SIZE           CCI_REG16(0x034e)
> > +/* Window/crop start + size *after* binning */
> > +#define T4KA3_REG_WIN_START_X                        CCI_REG16(0x0408)
> > +#define T4KA3_REG_WIN_START_Y                        CCI_REG16(0x040a)
> > +#define T4KA3_REG_WIN_WIDTH                  CCI_REG16(0x040c)
> > +#define T4KA3_REG_WIN_HEIGHT                 CCI_REG16(0x040e)
> > +#define T4KA3_REG_TEST_PATTERN_MODE          CCI_REG8(0x0601)
> > +/* Unknown register at address 0x0900 */
> > +#define T4KA3_REG_0900                               CCI_REG8(0x0900)
> > +#define T4KA3_REG_BINNING                    CCI_REG8(0x0901)
> > +#define T4KA3_BINNING_VAL(_b) \
> > +     ({ typeof(_b) (b) =3D (_b); \
> > +     ((b) << 4) | (b); })
>
> I'd either use an inline function or a regular macro here; in the latter
> case I wouldn't mind about the checkpatch.pl warning related to argument
> double use.
>
> > +
> > +struct t4ka3_ctrls {
> > +     struct v4l2_ctrl_handler handler;
> > +     struct v4l2_ctrl *hflip;
> > +     struct v4l2_ctrl *vflip;
> > +     struct v4l2_ctrl *vblank;
> > +     struct v4l2_ctrl *hblank;
> > +     struct v4l2_ctrl *exposure;
> > +     struct v4l2_ctrl *gain;
> > +     struct v4l2_ctrl *test_pattern;
> > +     struct v4l2_ctrl *link_freq;
> > +     struct v4l2_ctrl *pixel_rate;
>
> Do you need all these in the struct? E.g. gain appears to be unused.
I'll review all the items in it and drop the unused variables.

>
> > +};
> > +
> > +struct t4ka3_mode {
> > +     int                             binning;
> > +     u16                             win_x;
> > +     u16                             win_y;
>
> The rest of the fields have just a space between the type and the field
> name. I'd do the same here.
I'll fix it.


>
> > +};
> > +
> > +struct t4ka3_data {
> > +     struct v4l2_subdev sd;
> > +     struct media_pad pad;
> > +     struct mutex lock; /* serialize sensor's ioctl */
> > +     struct t4ka3_ctrls ctrls;
> > +     struct t4ka3_mode mode;
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +     struct gpio_desc *powerdown_gpio;
> > +     struct gpio_desc *reset_gpio;
> > +     s64 link_freq[1];
> > +     int streaming;
> > +
> > +     /* MIPI lane info */
> > +     u32 link_freq_index;
> > +     u8 mipi_lanes;
> > +};
> > +
> > +/* init settings */
> > +static const struct cci_reg_sequence t4ka3_init_config[] =3D {
> > +     {CCI_REG8(0x4136), 0x13},
>
>         { Spaces inside braces, please. },
>
> > +     {CCI_REG8(0x4137), 0x33},
> > +     {CCI_REG8(0x3094), 0x01},
> > +     {CCI_REG8(0x0233), 0x01},
> > +     {CCI_REG8(0x4B06), 0x01},
> > +     {CCI_REG8(0x4B07), 0x01},
> > +     {CCI_REG8(0x3028), 0x01},
> > +     {CCI_REG8(0x3032), 0x14},
> > +     {CCI_REG8(0x305C), 0x0C},
> > +     {CCI_REG8(0x306D), 0x0A},
> > +     {CCI_REG8(0x3071), 0xFA},
> > +     {CCI_REG8(0x307E), 0x0A},
> > +     {CCI_REG8(0x307F), 0xFC},
> > +     {CCI_REG8(0x3091), 0x04},
> > +     {CCI_REG8(0x3092), 0x60},
> > +     {CCI_REG8(0x3096), 0xC0},
> > +     {CCI_REG8(0x3100), 0x07},
> > +     {CCI_REG8(0x3101), 0x4C},
> > +     {CCI_REG8(0x3118), 0xCC},
> > +     {CCI_REG8(0x3139), 0x06},
> > +     {CCI_REG8(0x313A), 0x06},
> > +     {CCI_REG8(0x313B), 0x04},
> > +     {CCI_REG8(0x3143), 0x02},
> > +     {CCI_REG8(0x314F), 0x0E},
> > +     {CCI_REG8(0x3169), 0x99},
> > +     {CCI_REG8(0x316A), 0x99},
> > +     {CCI_REG8(0x3171), 0x05},
> > +     {CCI_REG8(0x31A1), 0xA7},
> > +     {CCI_REG8(0x31A2), 0x9C},
> > +     {CCI_REG8(0x31A3), 0x8F},
> > +     {CCI_REG8(0x31A4), 0x75},
> > +     {CCI_REG8(0x31A5), 0xEE},
> > +     {CCI_REG8(0x31A6), 0xEA},
> > +     {CCI_REG8(0x31A7), 0xE4},
> > +     {CCI_REG8(0x31A8), 0xE4},
> > +     {CCI_REG8(0x31DF), 0x05},
> > +     {CCI_REG8(0x31EC), 0x1B},
> > +     {CCI_REG8(0x31ED), 0x1B},
> > +     {CCI_REG8(0x31EE), 0x1B},
> > +     {CCI_REG8(0x31F0), 0x1B},
> > +     {CCI_REG8(0x31F1), 0x1B},
> > +     {CCI_REG8(0x31F2), 0x1B},
> > +     {CCI_REG8(0x3204), 0x3F},
> > +     {CCI_REG8(0x3205), 0x03},
> > +     {CCI_REG8(0x3210), 0x01},
> > +     {CCI_REG8(0x3216), 0x68},
> > +     {CCI_REG8(0x3217), 0x58},
> > +     {CCI_REG8(0x3218), 0x58},
> > +     {CCI_REG8(0x321A), 0x68},
> > +     {CCI_REG8(0x321B), 0x60},
> > +     {CCI_REG8(0x3238), 0x03},
> > +     {CCI_REG8(0x3239), 0x03},
> > +     {CCI_REG8(0x323A), 0x05},
> > +     {CCI_REG8(0x323B), 0x06},
> > +     {CCI_REG8(0x3243), 0x03},
> > +     {CCI_REG8(0x3244), 0x08},
> > +     {CCI_REG8(0x3245), 0x01},
> > +     {CCI_REG8(0x3307), 0x19},
> > +     {CCI_REG8(0x3308), 0x19},
> > +     {CCI_REG8(0x3320), 0x01},
> > +     {CCI_REG8(0x3326), 0x15},
> > +     {CCI_REG8(0x3327), 0x0D},
> > +     {CCI_REG8(0x3328), 0x01},
> > +     {CCI_REG8(0x3380), 0x01},
> > +     {CCI_REG8(0x339E), 0x07},
> > +     {CCI_REG8(0x3424), 0x00},
> > +     {CCI_REG8(0x343C), 0x01},
> > +     {CCI_REG8(0x3398), 0x04},
> > +     {CCI_REG8(0x343A), 0x10},
> > +     {CCI_REG8(0x339A), 0x22},
> > +     {CCI_REG8(0x33B4), 0x00},
> > +     {CCI_REG8(0x3393), 0x01},
> > +     {CCI_REG8(0x33B3), 0x6E},
> > +     {CCI_REG8(0x3433), 0x06},
> > +     {CCI_REG8(0x3433), 0x00},
> > +     {CCI_REG8(0x33B3), 0x00},
> > +     {CCI_REG8(0x3393), 0x03},
> > +     {CCI_REG8(0x33B4), 0x03},
> > +     {CCI_REG8(0x343A), 0x00},
> > +     {CCI_REG8(0x339A), 0x00},
> > +     {CCI_REG8(0x3398), 0x00}
> > +};
> > +
> > +static const struct cci_reg_sequence t4ka3_pre_mode_set_regs[] =3D {
> > +     {CCI_REG8(0x0112), 0x0A},
> > +     {CCI_REG8(0x0113), 0x0A},
> > +     {CCI_REG8(0x0114), 0x03},
> > +     {CCI_REG8(0x4136), 0x13},
> > +     {CCI_REG8(0x4137), 0x33},
> > +     {CCI_REG8(0x0820), 0x0A},
> > +     {CCI_REG8(0x0821), 0x0D},
> > +     {CCI_REG8(0x0822), 0x00},
> > +     {CCI_REG8(0x0823), 0x00},
> > +     {CCI_REG8(0x0301), 0x0A},
> > +     {CCI_REG8(0x0303), 0x01},
> > +     {CCI_REG8(0x0305), 0x04},
> > +     {CCI_REG8(0x0306), 0x02},
> > +     {CCI_REG8(0x0307), 0x18},
> > +     {CCI_REG8(0x030B), 0x01},
> > +};
> > +
> > +static const struct cci_reg_sequence t4ka3_post_mode_set_regs[] =3D {
> > +     {CCI_REG8(0x0902), 0x00},
> > +     {CCI_REG8(0x4220), 0x00},
> > +     {CCI_REG8(0x4222), 0x01},
> > +     {CCI_REG8(0x3380), 0x01},
> > +     {CCI_REG8(0x3090), 0x88},
> > +     {CCI_REG8(0x3394), 0x20},
> > +     {CCI_REG8(0x3090), 0x08},
> > +     {CCI_REG8(0x3394), 0x10}
> > +};
> > +
> > +static const s64 link_freq_menu_items[] =3D {
> > +     T4KA3_LINK_FREQ,
> > +};
> > +
> > +static inline struct t4ka3_data *to_t4ka3_sensor(struct v4l2_subdev *s=
d)
> > +{
> > +     return container_of(sd, struct t4ka3_data, sd);
> > +}
> > +
> > +static inline struct t4ka3_data *ctrl_to_t4ka3(struct v4l2_ctrl *ctrl)
> > +{
> > +     return container_of(ctrl->handler, struct t4ka3_data, ctrls.handl=
er);
> > +}
>
> I'd use macros and container_of_const().
>
> > +
> > +/* T4KA3 default GRBG */
> > +static const int t4ka3_hv_flip_bayer_order[] =3D {
> > +     MEDIA_BUS_FMT_SGRBG10_1X10,
> > +     MEDIA_BUS_FMT_SBGGR10_1X10,
> > +     MEDIA_BUS_FMT_SRGGB10_1X10,
> > +     MEDIA_BUS_FMT_SGBRG10_1X10,
> > +};
> > +
> > +static const struct v4l2_rect t4ka3_default_crop =3D {
> > +     .left =3D T4KA3_ACTIVE_START_LEFT,
> > +     .top =3D T4KA3_ACTIVE_START_TOP,
> > +     .width =3D T4KA3_ACTIVE_WIDTH,
> > +     .height =3D T4KA3_ACTIVE_HEIGHT,
> > +};
> > +
> > +static int t4ka3_detect(struct t4ka3_data *sensor, u16 *id);
>
> Not needed.
Okay.


>
> > +
> > +static void t4ka3_set_bayer_order(struct t4ka3_data *sensor,
> > +                               struct v4l2_mbus_framefmt *fmt)
> > +{
> > +     int hv_flip =3D 0;
>
> unsigned int?
unsigned int :)

>
> > +
> > +     if (sensor->ctrls.vflip && sensor->ctrls.vflip->val)
> > +             hv_flip +=3D 1;
> > +
> > +     if (sensor->ctrls.hflip && sensor->ctrls.hflip->val)
> > +             hv_flip +=3D 2;
> > +
> > +     fmt->code =3D t4ka3_hv_flip_bayer_order[hv_flip];
> > +}
> > +
> > +static struct v4l2_mbus_framefmt *t4ka3_get_active_format(struct t4ka3=
_data *sensor)
> > +{
> > +     struct v4l2_subdev_state *active_state =3D
> > +             v4l2_subdev_get_locked_active_state(&sensor->sd);
> > +
> > +     return v4l2_subdev_state_get_format(active_state, 0);
> > +}
> > +
> > +static struct v4l2_rect *t4ka3_get_active_crop(struct t4ka3_data *sens=
or)
> > +{
> > +     struct v4l2_subdev_state *active_state =3D
> > +             v4l2_subdev_get_locked_active_state(&sensor->sd);
> > +
> > +     return v4l2_subdev_state_get_crop(active_state, 0);
>
> Please avoid adding such helpers.
As Hans mentioned, we can put active format and crop in the t4ka3_data
or keep the helpers.

>
> > +}
> > +
> > +static int t4ka3_update_exposure_range(struct t4ka3_data *sensor)
> > +{
> > +     struct v4l2_mbus_framefmt *fmt;
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
>
> Can be assigned in declaration.
Okay
>
> > +
> > +     int exp_max =3D fmt->height + sensor->ctrls.vblank->val -
> > +                   T4KA3_COARSE_INTEGRATION_TIME_MARGIN;
> > +
> > +     return __v4l2_ctrl_modify_range(sensor->ctrls.exposure, 0, exp_ma=
x,
> > +                                     1, exp_max);
> > +}
> > +
> > +static void t4ka3_fill_format(struct t4ka3_data *sensor,
> > +                           struct v4l2_mbus_framefmt *fmt,
> > +                           unsigned int width, unsigned int height)
> > +{
> > +     memset(fmt, 0, sizeof(*fmt));
> > +     fmt->width =3D width;
> > +     fmt->height =3D height;
> > +     fmt->field =3D V4L2_FIELD_NONE;
> > +     fmt->colorspace =3D V4L2_COLORSPACE_RAW;
> > +     t4ka3_set_bayer_order(sensor, fmt);
> > +}
> > +
> > +static void t4ka3_calc_mode(struct t4ka3_data *sensor)
> > +{
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     struct v4l2_rect *crop;
> > +     int width;
> > +     int height;
> > +     int binning;
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +     crop =3D t4ka3_get_active_crop(sensor);
>
> Ditto.
>
> > +
> > +     width =3D fmt->width;
> > +     height =3D fmt->height;
> > +
> > +     if (width <=3D (crop->width / 2) && height <=3D (crop->height / 2=
))
> > +             binning =3D 2;
> > +     else
> > +             binning =3D 1;
> > +
> > +     width *=3D binning;
> > +     height *=3D binning;
> > +
> > +     sensor->mode.binning =3D binning;
> > +     sensor->mode.win_x =3D (crop->left + (crop->width - width) / 2) &=
 ~1;
> > +     sensor->mode.win_y =3D (crop->top + (crop->height - height) / 2) =
& ~1;
> > +     /*
> > +      * t4ka3's window is done after binning, but must still be a mult=
iple of 2 ?
> > +      * Round up to avoid top 2 black lines in 1640x1230 (quarter res)=
 case.
> > +      */
> > +     sensor->mode.win_x =3D DIV_ROUND_UP(sensor->mode.win_x, binning);
> > +     sensor->mode.win_y =3D DIV_ROUND_UP(sensor->mode.win_y, binning);
> > +}
> > +
> > +static void t4ka3_get_vblank_limits(struct t4ka3_data *sensor, int *mi=
n, int *max, int *def)
> > +{
> > +     struct v4l2_mbus_framefmt *fmt;
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
>
> Ditto.
>
> > +
> > +     *min =3D T4KA3_MIN_VBLANK + (sensor->mode.binning - 1) * fmt->hei=
ght;
> > +     *max =3D T4KA3_MAX_VBLANK - fmt->height;
> > +     *def =3D T4KA3_LINES_PER_FRAME_30FPS - fmt->height;
> > +}
> > +
> > +static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_format *format)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *try_fmt;
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     const struct v4l2_rect *crop;
> > +     unsigned int width, height;
> > +     int min, max, def, ret =3D 0;
> > +
> > +     crop =3D t4ka3_get_active_crop(sensor);
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +
> > +     /* Limit set_fmt max size to crop width / height */
> > +     width =3D clamp_val(ALIGN(format->format.width, 2),
> > +                       T4KA3_MIN_CROP_WIDTH, crop->width);
> > +     height =3D clamp_val(ALIGN(format->format.height, 2),
> > +                        T4KA3_MIN_CROP_HEIGHT, crop->height);
> > +     t4ka3_fill_format(sensor, &format->format, width, height);
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> > +             try_fmt =3D v4l2_subdev_state_get_format(sd_state, 0);
> > +             *try_fmt =3D format->format;
> > +             return 0;
> > +     }
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && sensor->str=
eaming)
> > +             return -EBUSY;
> > +
> > +     *v4l2_subdev_state_get_format(sd_state, 0) =3D format->format;
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +             return 0;
> > +
> > +     t4ka3_calc_mode(sensor);
> > +
> > +     /* vblank range is height dependent adjust and reset to default *=
/
> > +     t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.vblank, min, max, =
1, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     def =3D T4KA3_PIXELS_PER_LINE - fmt->width;
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, =
1, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, def);
> > +     if (ret)
> > +             return ret;
>
>         return __v4l2_ctrl_s_ctrl(...);
Okay
>
> > +
> > +     return 0;
> > +}
> > +
> > +/* Horizontal or vertically flip the image */
> > +static int t4ka3_t_vflip(struct v4l2_subdev *sd, int value, u8 flip_bi=
t)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     int ret;
> > +     u64 val;
> > +
> > +     if (sensor->streaming)
> > +             return -EBUSY;
> > +
> > +     val =3D value ? flip_bit : 0;
> > +
> > +     ret =3D cci_update_bits(sensor->regmap, T4KA3_REG_IMG_ORIENTATION=
,
> > +                           flip_bit, val, NULL);
> > +     if (ret)
> > +             return ret;
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +     t4ka3_set_bayer_order(sensor, fmt);
>
> A newline would be nice here.
Okay

>
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_test_pattern(struct t4ka3_data *sensor, s32 value)
> > +{
> > +     return cci_write(sensor->regmap, T4KA3_REG_TEST_PATTERN_MODE, val=
ue, NULL);
> > +}
> > +
> > +static int t4ka3_detect(struct t4ka3_data *sensor, u16 *id)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->sd);
> > +     struct i2c_adapter *adapter =3D client->adapter;
> > +     u64 high, low;
> > +     int ret =3D 0;
> > +
> > +     /* i2c check */
> > +     if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
> > +             return -ENODEV;
> > +
> > +     /* check sensor chip ID  */
> > +     cci_read(sensor->regmap, T4KA3_REG_PRODUCT_ID_HIGH, &high, &ret);
> > +     cci_read(sensor->regmap, T4KA3_REG_PRODUCT_ID_LOW, &low, &ret);
> > +     if (ret)
> > +             return ret;
> > +
> > +     *id =3D (((u8)high) << 8) | (u8)low;
> > +     if (*id !=3D T4KA3_PRODUCT_ID) {
> > +             dev_err(sensor->dev, "main sensor t4ka3 ID error\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct t4ka3_data *sensor =3D ctrl_to_t4ka3(ctrl);
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     int ret;
> > +
> > +     /* Update exposure range on vblank changes */
> > +     if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +             ret =3D t4ka3_update_exposure_range(sensor);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
>
> You could assign this in declaration.
Okay
>
> > +
> > +     /* Only apply changes to the controls if the device is powered up=
 */
> > +     if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
> > +             t4ka3_set_bayer_order(sensor, fmt);
>
> Does this call belong here?
I think it can be. It is a simple update of t4ka3_hv_flip_bayer_order.
>
> > +             return 0;
> > +     }
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_TEST_PATTERN:
> > +             ret =3D t4ka3_test_pattern(sensor, ctrl->val);
> > +             break;
> > +     case V4L2_CID_VFLIP:
> > +             ret =3D t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_VFLIP=
_BIT);
> > +             break;
> > +     case V4L2_CID_HFLIP:
> > +             ret =3D t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_HFLIP=
_BIT);
> > +             break;
> > +     case V4L2_CID_VBLANK:
> > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_=
LINES,
> > +                             fmt->height + ctrl->val, NULL);
> > +             break;
> > +     case V4L2_CID_EXPOSURE:
> > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_COARSE_INTEGR=
ATION_TIME,
> > +                             ctrl->val, NULL);
> > +             break;
> > +     case V4L2_CID_ANALOGUE_GAIN:
> > +             ret =3D cci_write(sensor->regmap, T4KA3_REG_GLOBAL_GAIN,
> > +                             ctrl->val, NULL);
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +             break;
> > +     }
> > +
> > +     pm_runtime_put(sensor->sd.dev);
>
> Newline here?
Okay
>
> > +     return ret;
> > +}
> > +
> > +static int t4ka3_set_mode(struct t4ka3_data *sensor)
> > +{
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     int ret =3D 0;
> > +
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +
> > +     cci_write(sensor->regmap, T4KA3_REG_HORZ_OUTPUT_SIZE, fmt->width,=
 &ret);
> > +     /* Write mode-height - 2 otherwise things don't work, hw-bug ? */
> > +     cci_write(sensor->regmap, T4KA3_REG_VERT_OUTPUT_SIZE, fmt->height=
 - 2, &ret);
> > +     /* Note overwritten by __v4l2_ctrl_handler_setup() based on vblan=
k ctrl */
> > +     cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES, T4KA3_LIN=
ES_PER_FRAME_30FPS, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_PIXELS_PER_LINE, T4KA3_PIXELS=
_PER_LINE, &ret);
> > +     /* Always use the full sensor, using window to crop */
> > +     cci_write(sensor->regmap, T4KA3_REG_HORZ_START, 0, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_VERT_START, 0, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_HORZ_END, T4KA3_NATIVE_WIDTH =
- 1, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_VERT_END, T4KA3_NATIVE_HEIGHT=
 - 1, &ret);
> > +     /* Set window */
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_START_X, sensor->mode.win=
_x, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_START_Y, sensor->mode.win=
_y, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_WIDTH, fmt->width, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_WIN_HEIGHT, fmt->height, &ret=
);
> > +     /* Write 1 to unknown register 0x0900 */
> > +     cci_write(sensor->regmap, T4KA3_REG_0900, 1, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_BINNING, T4KA3_BINNING_VAL(se=
nsor->mode.binning), &ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int t4ka3_enable_stream(struct v4l2_subdev *sd, struct v4l2_sub=
dev_state *state,
> > +                            u32 pad, u64 streams_mask)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_get_sync(sensor->sd.dev);
> > +     if (ret < 0) {
> > +             dev_err(sensor->dev, "power-up err.\n");
> > +             goto error_powerdown;
> > +     }
> > +
> > +     cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
> > +                         ARRAY_SIZE(t4ka3_init_config), &ret);
> > +     /* enable group hold */
> > +     cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
> > +     cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
> > +                         ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     ret =3D t4ka3_set_mode(sensor);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     ret =3D cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_r=
egs,
> > +                               ARRAY_SIZE(t4ka3_post_mode_set_regs), N=
ULL);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     /* Restore value of all ctrls */
> > +     ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     /* disable group hold */
> > +     cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     sensor->streaming =3D 1;
> > +
> > +     return ret;
> > +
> > +error_powerdown:
> > +     pm_runtime_put(sensor->sd.dev);
>
> And here?
Okay
>
> > +     return ret;
> > +}
> > +
> > +static int t4ka3_disable_stream(struct v4l2_subdev *sd, struct v4l2_su=
bdev_state *state,
> > +                             u32 pad, u64 streams_mask)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     int ret;
> > +
> > +     ret =3D cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NULL);
> > +     pm_runtime_put(sensor->sd.dev);
> > +     sensor->streaming =3D 0;
> > +     return ret;
>
> Return 0 here but complain about it.
Do you mean return 0 here and print a message when ret !=3D 0?
>
> > +}
> > +
> > +static int t4ka3_get_selection(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *state,
> > +                            struct v4l2_subdev_selection *sel)
> > +{
> > +     switch (sel->target) {
> > +     case V4L2_SEL_TGT_CROP:
> > +             sel->r =3D *v4l2_subdev_state_get_crop(state, sel->pad);
> > +             break;
> > +     case V4L2_SEL_TGT_NATIVE_SIZE:
> > +     case V4L2_SEL_TGT_CROP_BOUNDS:
> > +             sel->r.top =3D 0;
> > +             sel->r.left =3D 0;
> > +             sel->r.width =3D T4KA3_NATIVE_WIDTH;
> > +             sel->r.height =3D T4KA3_NATIVE_HEIGHT;
> > +             break;
> > +     case V4L2_SEL_TGT_CROP_DEFAULT:
> > +             sel->r =3D t4ka3_default_crop;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_set_selection(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *state,
> > +                            struct v4l2_subdev_selection *sel)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *format;
> > +     struct v4l2_rect *crop;
> > +     struct v4l2_rect rect;
> > +
> > +     if (sel->target !=3D V4L2_SEL_TGT_CROP)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Clamp the boundaries of the crop rectangle to the size of the =
sensor
> > +      * pixel array. Align to multiples of 2 to ensure Bayer pattern i=
sn't
> > +      * disrupted.
> > +      */
> > +     rect.left =3D clamp_val(ALIGN(sel->r.left, 2),
> > +                           T4KA3_NATIVE_START_LEFT, T4KA3_NATIVE_WIDTH=
);
> > +     rect.top =3D clamp_val(ALIGN(sel->r.top, 2),
> > +                          T4KA3_NATIVE_START_TOP, T4KA3_NATIVE_HEIGHT)=
;
> > +     rect.width =3D clamp_val(ALIGN(sel->r.width, 2), T4KA3_MIN_CROP_W=
IDTH,
> > +                            T4KA3_NATIVE_WIDTH - rect.left);
> > +     rect.height =3D clamp_val(ALIGN(sel->r.height, 2), T4KA3_MIN_CROP=
_HEIGHT,
> > +                             T4KA3_NATIVE_HEIGHT - rect.top);
> > +
> > +     crop =3D v4l2_subdev_state_get_crop(state, sel->pad);
> > +
> > +     if (rect.width !=3D crop->width || rect.height !=3D crop->height)=
 {
> > +             /*
> > +              * Reset the output image size if the crop rectangle size=
 has
> > +              * been modified.
> > +              */
> > +             format =3D v4l2_subdev_state_get_format(state, sel->pad);
> > +             format->width =3D rect.width;
> > +             format->height =3D rect.height;
> > +             if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> > +                     t4ka3_calc_mode(sensor);
> > +     }
> > +
> > +     sel->r =3D *crop =3D rect;
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +t4ka3_enum_mbus_code(struct v4l2_subdev *sd,
> > +                  struct v4l2_subdev_state *sd_state,
> > +                  struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     if (code->index)
> > +             return -EINVAL;
> > +
> > +     code->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_enum_frame_size(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +     struct v4l2_rect *crop;
> > +
> > +     if (fse->index >=3D T4KA3_FRAME_SIZES)
> > +             return -EINVAL;
> > +
> > +     crop =3D v4l2_subdev_state_get_crop(sd_state, fse->pad);
> > +
> > +     fse->min_width =3D crop->width / (fse->index + 1);
> > +     fse->min_height =3D crop->height / (fse->index + 1);
> > +     fse->max_width =3D fse->min_width;
> > +     fse->max_height =3D fse->min_height;
> > +
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_check_hwcfg(struct t4ka3_data *sensor)
> > +{
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(sensor->dev);
> > +     struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +             .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +     };
> > +     struct fwnode_handle *endpoint;
> > +     unsigned long link_freq_bitmap;
> > +     int ret;
> > +
> > +     /*
> > +      * Sometimes the fwnode graph is initialized by the bridge driver=
.
> > +      * Bridge drivers doing this may also add GPIO mappings, wait for=
 this.
> > +      */
>
> No need for such a comment.
I'll drop it.

>
> > +     endpoint =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +     if (!endpoint)
> > +             return dev_err_probe(sensor->dev, -EPROBE_DEFER,
> > +                                  "waiting for fwnode graph endpoint\n=
");
>
> This
> <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=3Dcleanup&id=
=3D8181d18d45d593d8499cbf0e83de08c6d913516c>
> will be merged soon.
Does it mean "return  -EPROBE_DEFER;" is enough?
>
> > +
> > +     ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > +     fwnode_handle_put(endpoint);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_freque=
ncies,
> > +                                    bus_cfg.nr_of_link_frequencies,
> > +                                    link_freq_menu_items,
> > +                                    ARRAY_SIZE(link_freq_menu_items),
> > +                                    &link_freq_bitmap);
> > +
> > +     if (ret =3D=3D -ENOENT) {
> > +             dev_err_probe(sensor->dev, -ENOENT,
> > +                           "No match found between driver-supported li=
nk frequencies.\n");
> > +             goto out_free_bus_cfg;
> > +     }
> > +
> > +     if (ret =3D=3D -ENODATA) {
> > +             dev_err_probe(sensor->dev, -ENODATA,
> > +                           "No link frequency was specified in the fir=
mware.\n");
> > +             goto out_free_bus_cfg;
> > +     }
>
> No need for printing these error messages -- v4l2_link_freq_to_bitmap()
> already does.
I'll drop the above two if sections.
>
> > +
> > +     sensor->link_freq_index =3D ffs(link_freq_bitmap) - 1;
> > +
> > +     /* 4 MIPI lanes */
> > +     if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 4) {
> > +             ret =3D dev_err_probe(sensor->dev, -EINVAL,
> > +                                 "number of CSI2 data lanes %u is not =
supported\n",
> > +                                 bus_cfg.bus.mipi_csi2.num_data_lanes)=
;
> > +             goto out_free_bus_cfg;
> > +     }
> > +
> > +     sensor->mipi_lanes =3D bus_cfg.bus.mipi_csi2.num_data_lanes;
> > +
> > +out_free_bus_cfg:
> > +     v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +     return ret;
> > +}
> > +
> > +static int t4ka3_init_state(struct v4l2_subdev *sd,
> > +                         struct v4l2_subdev_state *sd_state)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +
> > +     *v4l2_subdev_state_get_crop(sd_state, 0) =3D t4ka3_default_crop;
> > +
> > +     t4ka3_fill_format(sensor, v4l2_subdev_state_get_format(sd_state, =
0),
> > +                       T4KA3_ACTIVE_WIDTH, T4KA3_ACTIVE_HEIGHT);
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops t4ka3_ctrl_ops =3D {
> > +     .s_ctrl =3D t4ka3_s_ctrl,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops t4ka3_video_ops =3D {
> > +     .s_stream =3D v4l2_subdev_s_stream_helper,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops t4ka3_pad_ops =3D {
> > +     .enum_mbus_code =3D t4ka3_enum_mbus_code,
> > +     .enum_frame_size =3D t4ka3_enum_frame_size,
> > +     .get_fmt =3D v4l2_subdev_get_fmt,
> > +     .set_fmt =3D t4ka3_set_pad_format,
> > +     .get_selection =3D t4ka3_get_selection,
> > +     .set_selection =3D t4ka3_set_selection,
> > +     .enable_streams =3D t4ka3_enable_stream,
> > +     .disable_streams =3D t4ka3_disable_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_ops t4ka3_ops =3D {
> > +     .video =3D &t4ka3_video_ops,
> > +     .pad =3D &t4ka3_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops t4ka3_internal_ops =3D {
> > +     .init_state =3D t4ka3_init_state,
> > +};
> > +
> > +static int t4ka3_init_controls(struct t4ka3_data *sensor)
> > +{
> > +     const struct v4l2_ctrl_ops *ops =3D &t4ka3_ctrl_ops;
> > +     struct t4ka3_ctrls *ctrls =3D &sensor->ctrls;
> > +     struct v4l2_ctrl_handler *hdl =3D &ctrls->handler;
> > +     struct v4l2_fwnode_device_properties props;
> > +     int ret, min, max, def;
> > +     static const char * const test_pattern_menu[] =3D {
> > +             "Disabled",
> > +             "Solid White",
> > +             "Color Bars",
> > +             "Gradient",
> > +             "Random Data",
> > +     };
> > +
> > +     v4l2_ctrl_handler_init(hdl, 11);
> > +
> > +     hdl->lock =3D &sensor->lock;
> > +
> > +     ctrls->vflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1=
, 1, 0);
> > +     ctrls->hflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1=
, 1, 0);
> > +
> > +     ctrls->test_pattern =3D v4l2_ctrl_new_std_menu_items(hdl, ops,
> > +                                                        V4L2_CID_TEST_=
PATTERN,
> > +                                                        ARRAY_SIZE(tes=
t_pattern_menu) - 1,
> > +                                                        0, 0, test_pat=
tern_menu);
> > +     ctrls->link_freq =3D v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_L=
INK_FREQ,
> > +                                               0, 0, sensor->link_freq=
);
> > +     ctrls->pixel_rate =3D v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL=
_RATE,
> > +                                           0, T4KA3_PIXEL_RATE,
> > +                                           1, T4KA3_PIXEL_RATE);
> > +
> > +     v4l2_subdev_lock_state(sensor->sd.active_state);
> > +     t4ka3_calc_mode(sensor);
> > +     t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> > +     v4l2_subdev_unlock_state(sensor->sd.active_state);
> > +
> > +     ctrls->vblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, mi=
n, max, 1, def);
> > +
> > +     def =3D T4KA3_PIXELS_PER_LINE - T4KA3_ACTIVE_WIDTH;
> > +     ctrls->hblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
> > +                                       def, def, 1, def);
> > +
> > +     max =3D T4KA3_LINES_PER_FRAME_30FPS - T4KA3_COARSE_INTEGRATION_TI=
ME_MARGIN;
> > +     ctrls->exposure =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE=
,
> > +                                         0, max, 1, max);
> > +
> > +     ctrls->gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAI=
N,
> > +                                     T4KA3_MIN_GLOBAL_GAIN_SUPPORTED,
> > +                                     T4KA3_MAX_GLOBAL_GAIN_SUPPORTED,
> > +                                     1, T4KA3_MIN_GLOBAL_GAIN_SUPPORTE=
D);
> > +
> > +     ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);
> > +     if (ret)
> > +             return ret;
> > +
> > +     v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> > +
> > +     if (hdl->error)
> > +             return hdl->error;
> > +
> > +     ctrls->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +     ctrls->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +     ctrls->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +     ctrls->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     sensor->sd.ctrl_handler =3D hdl;
>
> A newline would be nice here.
okay
>
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_pm_suspend(struct device *dev)
> > +{
> > +     struct t4ka3_data *sensor =3D dev_get_drvdata(dev);
> > +
> > +     gpiod_set_value_cansleep(sensor->powerdown_gpio, 1);
> > +     gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> > +
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_pm_resume(struct device *dev)
> > +{
> > +     struct t4ka3_data *sensor =3D dev_get_drvdata(dev);
> > +     u16 sensor_id;
> > +     int ret;
> > +
> > +     usleep_range(5000, 6000);
> > +
> > +     gpiod_set_value_cansleep(sensor->powerdown_gpio, 0);
> > +     gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> > +
> > +     /* waiting for the sensor after powering up */
> > +     msleep(20);
>
> fsleep() maybe?
I can change it.
>
> > +
> > +     ret =3D t4ka3_detect(sensor, &sensor_id);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "sensor detect failed\n");
> > +             return ret;
>
> What about gpio values in this case?
both powerdown_gpio and reset_gpio are 0 when resuming and 1 when suspended=
.
t4ka3_detect() reads the sensor name through i2c. If it finds the
product ID then return 0;

>
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(t4ka3_pm_ops, t4ka3_pm_suspend, t4ka3=
_pm_resume, NULL);
>
> You could run
>
>         $ ./scripts/checkpatch.pl --strict --max-line-length=3D80
I'll try it. :)
>
> on the patch.
>
> > +
> > +static void t4ka3_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +
> > +     v4l2_async_unregister_subdev(&sensor->sd);
> > +     v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +     v4l2_subdev_cleanup(sd);
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +
> > +     /*
> > +      * Disable runtime PM. In case runtime PM is disabled in the kern=
el,
> > +      * make sure to turn power off manually.
> > +      */
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             t4ka3_pm_suspend(&client->dev);
> > +     pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static int t4ka3_probe(struct i2c_client *client)
> > +{
> > +     struct t4ka3_data *sensor;
> > +     int ret;
> > +
> > +     /* allocate sensor device & init sub device */
> > +     sensor =3D devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL=
);
> > +     if (!sensor)
> > +             return -ENOMEM;
> > +
> > +     sensor->dev =3D &client->dev;
> > +
> > +     ret =3D t4ka3_check_hwcfg(sensor);
> > +     if (ret)
> > +             return ret;
> > +
> > +     mutex_init(&sensor->lock);
> > +
> > +     sensor->link_freq[0] =3D T4KA3_LINK_FREQ;
>
> The driver supports a single link frequency. Could the array holding the
> requencies be static const?
i'll try it. It is used by v4l2_ctrl_new_int_menu()
>
> > +
> > +     v4l2_i2c_subdev_init(&sensor->sd, client, &t4ka3_ops);
> > +     sensor->sd.internal_ops =3D &t4ka3_internal_ops;
> > +
> > +     sensor->powerdown_gpio =3D devm_gpiod_get(&client->dev, "powerdow=
n",
> > +                                             GPIOD_OUT_HIGH);
> > +     if (IS_ERR(sensor->powerdown_gpio))
> > +             return dev_err_probe(&client->dev, PTR_ERR(sensor->powerd=
own_gpio),
> > +                                  "getting powerdown GPIO\n");
> > +
> > +     sensor->reset_gpio =3D devm_gpiod_get_optional(&client->dev, "res=
et",
> > +                                                  GPIOD_OUT_HIGH);
> > +     if (IS_ERR(sensor->reset_gpio))
> > +             return dev_err_probe(&client->dev, PTR_ERR(sensor->reset_=
gpio),
> > +                                  "getting reset GPIO\n");
> > +
> > +     sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +     if (IS_ERR(sensor->regmap))
> > +             return PTR_ERR(sensor->regmap);
> > +
> > +     ret =3D t4ka3_pm_resume(sensor->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     pm_runtime_set_active(&client->dev);
> > +     pm_runtime_get_noresume(&client->dev);
>
> You can omit get_noresume() here...
Okay
>
> > +     pm_runtime_enable(&client->dev);
> > +
> > +     sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pa=
d);
> > +     if (ret)
> > +             goto err_pm_disable;
> > +
> > +     sensor->sd.state_lock =3D sensor->ctrls.handler.lock;
> > +     ret =3D v4l2_subdev_init_finalize(&sensor->sd);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to init subdev: %d", ret);
> > +             goto err_media_entity;
> > +     }
> > +
> > +     ret =3D t4ka3_init_controls(sensor);
> > +     if (ret)
> > +             goto err_controls;
> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> > +     if (ret)
> > +             goto err_controls;
> > +
> > +     pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> > +     pm_runtime_use_autosuspend(&client->dev);
> > +     pm_runtime_put_autosuspend(&client->dev);
>
> as well as the two autosuspend functions above by switching to
> pm_runtime_idle() here.
okay
>
> > +
> > +     return 0;
> > +
> > +err_controls:
> > +     v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +     v4l2_subdev_cleanup(&sensor->sd);
> > +
> > +err_media_entity:
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +
> > +err_pm_disable:
> > +     pm_runtime_disable(&client->dev);
> > +     pm_runtime_put_noidle(&client->dev);
> > +     t4ka3_pm_suspend(&client->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static struct acpi_device_id t4ka3_acpi_match[] =3D {
>
> const?
const
>
> > +     { "XMCC0003" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(acpi, t4ka3_acpi_match);
> > +
> > +static struct i2c_driver t4ka3_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "t4ka3",
> > +             .acpi_match_table =3D ACPI_PTR(t4ka3_acpi_match),
> > +             .pm =3D pm_sleep_ptr(&t4ka3_pm_ops),
> > +     },
> > +     .probe =3D t4ka3_probe,
> > +     .remove =3D t4ka3_remove,
> > +};
> > +module_i2c_driver(t4ka3_driver)
> > +
> > +MODULE_DESCRIPTION("A low-level driver for T4KA3 sensor");
> > +MODULE_AUTHOR("HARVEY LV <harvey.lv@intel.com>");
> > +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
> > +MODULE_LICENSE("GPL");
>
> --
> Kind regards,
>
> Sakari Ailus
>

I'll propose the v12 patch to include all the changes based on the comments=
.

--=20
BR,
Kate



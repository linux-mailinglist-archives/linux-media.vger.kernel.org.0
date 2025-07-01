Return-Path: <linux-media+bounces-36410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D99D0AEF660
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD1F81BC490E
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FBE272E61;
	Tue,  1 Jul 2025 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DC+4LSPl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C588821
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368833; cv=none; b=MgF9WcF2wKmbTwEqchNTu/PD49zgwrMRuKeAJYMhXD0ZZDdzVWZu2CFOrhUmqurE+f9nUdLwyR8R8Dw7Yt1P1bUIlW2RK3wGJfF56CknKkaHoUjVSO8sVO7DvFjD81Xgv/+nYjxs9xAXf98aiuvcGscu2JNynPUHXsBajGejOTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368833; c=relaxed/simple;
	bh=9ksikN0iTD/GCWHlwVzlhstVFQF+DnzhexLRXUKHtb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gA72/cnLH5nDpf/JlkUd37vCRyl5V6i5NIyGEByXB6lO20Nlxd7uZzX/yTMx8vwaMSgNFpDSt55b7I4BdfK+g5GEhOw6udoSccctzHlnomWx2JQl3qx7ehBoXBpRW2aMG99lx22geRt5etkTsJdp5hmHB1A0icPp9/85CQg32hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DC+4LSPl; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so7201883e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751368830; x=1751973630; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZwGCtkc+w6FZ7pTS+qyfMjlhro6+usoRehWf2lDots=;
        b=DC+4LSPlbOL5B1i2hpsxitGwkCtWdlEnBmYvx33nK/ME0K6qbPOzlHP7QdXd7fuZ24
         ozrRN0giZQC99ShptGyAiS0G9q7w9i+Pw3LKztaFN6RxWHa6FDhnbRT1+ok2aWAkRLoy
         AEFCzlgJnARHMYAib7UUifNY3t8/8r3nsW5ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368830; x=1751973630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZwGCtkc+w6FZ7pTS+qyfMjlhro6+usoRehWf2lDots=;
        b=fOULQdqCbJyVqDFTCSjTSi0nZMO1eDofEnUQq6IQssHvhPjLeZqvt94YbpWepaqci/
         qKB6tgowxvmfwi+3hddLahMJpv4Aibc9VsKVDj8fZM/G/ZFd7x9+zcz9Tq4MpbtoQ+wL
         Db8rTVKatcbYzIFTwuzKRcizUCvhOxTfLVDFKFns1ghg5m4x/6QTSWqMtIrj/drbAuFQ
         wqlpM/cckVtwDy50erowgHxwbb8Bl6gZ2+EJLopG/H3HIBA3MI6YJlBq4WnEnfMOu8tr
         viz5ISioBbFVYckHJZ+OkZV/tpzgfGXNJE5lnCO4KyOkHprH0yXqUX46EJFQaB9QlVUA
         rJmA==
X-Forwarded-Encrypted: i=1; AJvYcCWN6iqpvesG09JH2sG6xxdiXTUSIlprcDXy/dgvFL2vS2wRumWFbB5RBjM3tntzTQkIr1kgCSJXrfjs6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynvhx72jMN4uM4dGocFRPWFXpSK1d7j/HaBt0HNsGywd1SmdOZ
	K66hNrWA9V6QoY4n2jGT2qDmZntfHjQzuPirw3eobiWISCleEBqViyegNz9l3+TO1OTMS0uMGnA
	rcBhbmA==
X-Gm-Gg: ASbGncts2JTA4BmrDy+VjG2GK6Y54K01KeufB/zeEuvIMuk2yJfzmzrw/+W6jk/ZO0M
	Rx0yQ+K6kpI9a7DBtL9PD8RglLLTYgU6R+NQoP8cCq63iHpTCWoJmK/G+h3qDhE8hD0Fse6tYjj
	GdDkWXCeX0czNc/tLeCZYDBZcf9gaoXHjB+ng0spm5jjq0YuaR6lP/92ZnDh3lE1LGGBruETYfI
	EXO6KxBBUxKMTZNwaE/LYvqbG0UHnAM1ULUOQ8mvYw4CNUIDwsatoqT/yNeKmoXkzbunxsZEYlI
	NNuFow8A1JrLzR1+DY9t85M0N1TlG04TQw+kdNHj3uofPQU5Eb6HyFaXqFt2nbJ4NblEQf4YB0c
	9NggLFx4HtKO2fTld1CFiVpnD
X-Google-Smtp-Source: AGHT+IGbHqBQDtns23nV+bOIAOGj6II+ud8G/HzWB1W9yL/Dzw6+vIkPp8ZFziQw/38B145ny5cjng==
X-Received: by 2002:a05:6512:10c8:b0:553:2308:1ac5 with SMTP id 2adb3069b0e04-556234d551dmr535529e87.4.1751368829952;
        Tue, 01 Jul 2025 04:20:29 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2dd93asm1801216e87.229.2025.07.01.04.20.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:20:27 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55516abe02cso2722754e87.0
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 04:20:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8MGixhYtY6djag+yDVnnYrT96cv31peGTcVNttX2ajWZffmxE+1VCHcWBdkrlbAXOSQ96aNPzuCAy+Q==@vger.kernel.org
X-Received: by 2002:a05:6512:3f24:b0:553:2159:8716 with SMTP id
 2adb3069b0e04-556235309fdmr606439e87.26.1751368826374; Tue, 01 Jul 2025
 04:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-12-5710f9d030aa@chromium.org> <20250629180534.GN24912@pendragon.ideasonboard.com>
In-Reply-To: <20250629180534.GN24912@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 13:20:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
X-Gm-Features: Ac12FXzZWFSV19mV0XJRYxH4cTBUxCR__A0Z2BgypZ23AIk9o_remHKEgYijnOg
Message-ID: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] media: uvcvideo: Do not create MC entities for
 virtual entities
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent and Hans


On Sun, 29 Jun 2025 at 20:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> I would use "software entities" and not "virtual entities" in the
> subject line and everywhere else, as those entities are not virtual.
>
> On Thu, Jun 05, 2025 at 05:53:05PM +0000, Ricardo Ribalda wrote:
> > Neither the GPIO nor the SWENTITY entities form part of the device
> > pipeline. We just create them to hold emulated uvc controls.
> >
> > When the device initializes, a warning is thrown by the v4l2 core:
> > uvcvideo 1-1:1.0: Entity type for entity SWENTITY was not initialized!
> >
> > There are no entity function that matches what we are doing here, and
> > it does not make to much sense to create a function for entities that
> > do not really exist.
>
> I don't agree with this. The purpose of reporting entities to userspace
> through the MC API is to let application enumerate what entities a
> device contains. Being able to enumerate software entities seems as
> useful as being able to enumerate hardware entities.

What function shall we use in this case? Nothing here seems to match a
software entity
https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/media-types.html

Any suggestion for name?
Shall we just live with the warning in dmesg?

>
> > Do not create MC entities for them and pretend nothing happened here.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > index d1a652ef35ec34801bd39a5124b834edf838a79e..2dbeb4ab0c4c8cc763ff2dcd2d836a50f3c6a040 100644
> > --- a/drivers/media/usb/uvc/uvc_entity.c
> > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > @@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> >  {
> >       int ret;
> >
> > +     /*
> > +      * Do not initialize virtual entities, they do not really exist
> > +      * and are not connected to any other entities.
> > +      */
> > +     switch (UVC_ENTITY_TYPE(entity)) {
> > +     case UVC_EXT_GPIO_UNIT:
> > +     case UVC_SWENTITY_UNIT:
> > +             return 0;
> > +     }
> > +
> >       if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
> >               u32 function;
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda


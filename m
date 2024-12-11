Return-Path: <linux-media+bounces-23164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD29EC713
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99211285A8B
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 08:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A601D90D4;
	Wed, 11 Dec 2024 08:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WKLnb2Sp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58231D8A0B
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905551; cv=none; b=qBNcu0WYoL5QJxjYt3YeMj51/MU4pELk7jX9cUzR36AmtgezwsE8loHcgt0gP3cJ2CGOUW+jmWwg8Po1u9er+X3T+m2QmuSz6hL0a38TSZl7/di+9RG/R63PtAAe4jCUei7dJ5qEfDLMLlD/TYML+jwXh3GHoT8L1DzqegVgBqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905551; c=relaxed/simple;
	bh=pbxla0yTksNMB/yfJqiplYk5I6ztCJkCMOXdq941Wsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QflApyluOdDqfpIr/YThQlCP06mrrKaLlm6w6SXOmcKT//oqa6Dj9LEBbgoLor829o0qQAiElXy1mxHjgheZ0zcyuGFy22CaEzTC2foMOMBRoOEVLNKk7v/+BMqx/lfa0bDwALzaY07wztd+/CD8hn+FdQeQgSRyKOhE1CmLo/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WKLnb2Sp; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-725c86bbae7so4158632b3a.3
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 00:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733905549; x=1734510349; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aMeiDMRxTxRMOSHecISft1Z76qFjuaNBQ/+kSc1K3bY=;
        b=WKLnb2SpgMifZH4tGfyQZQV0qyrwVtFjFI6YdEsHCWZjSkkRusgkMPNarRpohYyxJF
         e3dRqhRq7bnMeIwz7nh+IM8yC35DUX7KEedu0Kk2HhWgEwamcpu2Sw8XQ/kaeqoMCHpM
         IejWtZRCo0wN6Jt+N9nc9qXwDtk8rXLhNyiTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905549; x=1734510349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMeiDMRxTxRMOSHecISft1Z76qFjuaNBQ/+kSc1K3bY=;
        b=U6hNU8CTEkJ2JNNgCiEPGVwnq6ImimARzf7F/3fV2BgmcHRATlEuhGxKC/cTz8FOhj
         rDQu/qmo6zuj1/EkUrNe3rwBRHlbBysvZvhooqoF2n8fPP7Lb6owlR6NOSPHbzIpD3vj
         RHePB/2bAI7qnQDZaDQU59jjS/rMIZuiQ7sPeuOjVDurJExE5eEeiwv+SS0dnq9pnAS6
         +vCTpLaQxiIToHLc2tXKCsFLhXAwNAbkSem+p34Tph2kDmAdAsyu7O4UQHAWeprD2kH/
         pCMViEKpm/ADGGteVUkr9hYv4X5YqAJLXvjqDdO80mJWOOC+gJ7yoKwSNEtVtuQYkWJq
         PE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE9HbaEqcjEXkBmmlxDhYmIkIOjsRnAp5VNKi5nWc3tPSs2wywAKUCnNB47ET3KNDUBkzszjYxbD4nMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybYz68Yd+hrxs39LpeGHg6n60mNGeyzDSwen5mo4JBDvyF+n6d
	YZ5m7tGh9ZCa3WAIdJkE1xcpSiDgdd7Eqa2QQVsXcsOPl+hOgPjTTioOjA/JwTlOFav1rUb2uuw
	=
X-Gm-Gg: ASbGncvMAoMU32kYp71JfMlxWwh+f+AUiGTLhwwR2aSv1FzdXTVv/em5QjBuOhF0qSS
	VHxByzx1g1ChRbSUEf+znyG8+BmlW9bTqM98PqqP0riVmwroDjFNKq8/xpAdBcooPtLqd0b5pjG
	R4gDPfKShezfp2/Hr627GZJ+qs7RderROdiU1/Byyj66fkq1gmUHCoz5I98mUWkLya+x0kuAllX
	tAOYFR3euLcWSsFbRYFymVoz6RgGm14PlFWFZK4KuyB3uROmdleb3CC+Skv0tCqrKqToPDR/Oxf
	H4zIv/rPinTHRz1k
X-Google-Smtp-Source: AGHT+IHskt1keaLgNZuGDfwfhyaqxKxLxFRJf2KhgXdjjeyzwUlCuTbwEXRxUVvGX5jRxTR/9HAvqQ==
X-Received: by 2002:a05:6a20:d491:b0:1e0:d380:fe71 with SMTP id adf61e73a8af0-1e1c10acc58mr3754690637.0.1733905548659;
        Wed, 11 Dec 2024 00:25:48 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd463e442esm5435178a12.33.2024.12.11.00.25.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 00:25:46 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2efa806acfdso2511148a91.2
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 00:25:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcc0T2iLiEKP7Co3uoVkBD4jrm0lILnE0/FiFfIbA8eQnQP2Xc9991QAbTLX5ZOKYP1T9aQ159x4XVAg==@vger.kernel.org
X-Received: by 2002:a17:90b:1650:b0:2ee:a4f2:b311 with SMTP id
 98e67ed59e1d1-2f127f55cacmr3203942a91.8.1733905545661; Wed, 11 Dec 2024
 00:25:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
 <20241210-fix-ipu-v3-7-00e409c84a6c@chromium.org> <20241211091954.42a5c778@foz.lan>
In-Reply-To: <20241211091954.42a5c778@foz.lan>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 11 Dec 2024 09:25:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCsHk+QbF3BtrFU8G3UOgZZjTbQf4RhwkYCr+BeFiTYrEg@mail.gmail.com>
X-Gm-Features: AZHOrDlU23tnNgp0likxdl9TeO5EWHsYT3mOqJQICrAuiOLJ0FM89Lhe827RLJA
Message-ID: <CANiDSCsHk+QbF3BtrFU8G3UOgZZjTbQf4RhwkYCr+BeFiTYrEg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] media: ipu-bridge: Remove unneeded conditional compilations
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[only Mauro]

On Wed, 11 Dec 2024 at 09:20, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Tue, 10 Dec 2024 19:56:04 +0000
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>
> > The ACPI headers have introduced implementations for some of their
> > functions when the kernel is not configured with ACPI.
> >
> > Let's use them instead of our conditional compilation. It is easier to
> > maintain and less prone to errors.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/pci/intel/ipu-bridge.c | 28 +++++-----------------------
> >  1 file changed, 5 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> > index be82bc3e27d0..1db994338fdf 100644
> > --- a/drivers/media/pci/intel/ipu-bridge.c
> > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > @@ -2,6 +2,7 @@
> >  /* Author: Dan Scally <djrscally@gmail.com> */
> >
> >  #include <linux/acpi.h>
> > +#include <acpi/acpi_bus.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/device.h>
> >  #include <linux/i2c.h>
> > @@ -107,7 +108,6 @@ static const char * const ipu_vcm_types[] = {
> >       "lc898212axb",
> >  };
> >
> > -#if IS_ENABLED(CONFIG_ACPI)
> >  /*
> >   * Used to figure out IVSC acpi device by ipu_bridge_get_ivsc_acpi_dev()
> >   * instead of device and driver match to probe IVSC device.
> > @@ -127,11 +127,11 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
> >               const struct acpi_device_id *acpi_id = &ivsc_acpi_ids[i];
> >               struct acpi_device *consumer, *ivsc_adev;
> >
> > -             acpi_handle handle = acpi_device_handle(adev);
> > +             acpi_handle handle = acpi_device_handle(ACPI_PTR(adev));
> >               for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
> >                       /* camera sensor depends on IVSC in DSDT if exist */
> >                       for_each_acpi_consumer_dev(ivsc_adev, consumer)
> > -                             if (consumer->handle == handle) {
> > +                             if (ACPI_PTR(consumer->handle) == handle) {
> >                                       acpi_dev_put(consumer);
> >                                       return ivsc_adev;
> >                               }
> > @@ -139,12 +139,6 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
> >
> >       return NULL;
> >  }
> > -#else
> > -static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
> > -{
> > -     return NULL;
> > -}
> > -#endif
> >
> >  static int ipu_bridge_match_ivsc_dev(struct device *dev, const void *adev)
> >  {
> > @@ -261,9 +255,8 @@ static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_dev
> >       struct acpi_pld_info *pld = NULL;
> >       acpi_status status = AE_ERROR;
> >
> > -#if IS_ENABLED(CONFIG_ACPI)
> > -     status = acpi_get_physical_device_location(adev->handle, &pld);
> > -#endif
> > +     status = acpi_get_physical_device_location(ACPI_PTR(adev->handle),
> > +                                                &pld);
> >       if (ACPI_FAILURE(status)) {
> >               dev_warn(ADEV_DEV(adev), "_PLD call failed, using default orientation\n");
> >               return V4L2_FWNODE_ORIENTATION_EXTERNAL;
> > @@ -498,9 +491,7 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
> >       if (sensor->csi_dev) {
> >               const char *device_hid = "";
> >
> > -#if IS_ENABLED(CONFIG_ACPI)
> >               device_hid = acpi_device_hid(sensor->ivsc_adev);
> > -#endif
> >
> >               snprintf(sensor->ivsc_name, sizeof(sensor->ivsc_name), "%s-%u",
> >                        device_hid, sensor->link);
> > @@ -671,11 +662,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
> >       struct acpi_device *adev = NULL;
> >       int ret;
> >
> > -#if IS_ENABLED(CONFIG_ACPI)
> >       for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
> > -#else
> > -     while (true) {
> > -#endif
> >               if (!ACPI_PTR(adev->status.enabled))
> >                       continue;
>
> Heh, that's what I pointed on patch 1: you don't need it there, as this
> will be handled on patch 2.
>
> >
> > @@ -768,15 +755,10 @@ static int ipu_bridge_ivsc_is_ready(void)
> >       unsigned int i;
> >
> >       for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
> > -#if IS_ENABLED(CONFIG_ACPI)
> >               const struct ipu_sensor_config *cfg =
> >                       &ipu_supported_sensors[i];
> >
> >               for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
> > -#else
> > -             while (false) {
> > -                     sensor_adev = NULL;
> > -#endif
> >                       if (!ACPI_PTR(sensor_adev->status.enabled))
> >                               continue;
> >
> >
>
> Considering that you drop patch 1, and keep the ACPI dependencies
> at the header, as proposed by patches 2-6:
>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kerenel.org>
I will fix the typo in your email


>
> Thanks,
> Mauro



-- 
Ricardo Ribalda


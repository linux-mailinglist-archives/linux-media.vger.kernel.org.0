Return-Path: <linux-media+bounces-23115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D89309EBDEB
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62948281A80
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 22:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0551F193A;
	Tue, 10 Dec 2024 22:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BY9tZV7I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF6F1F1907
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 22:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733870155; cv=none; b=jQTl7VFNwRZfPRv/OQ8gyRuPYaIS3l3avjTvpf1Zcx/swmwGy85PTsJj43UOu+wSgSOV3x7BMuT/dpOeoT9V/a8HnXwhNpN2m49ouq6mz26z9mmbFD7Co7Rjvz8aeb93xJsgtqU71qC2bdMzPEIjuwCFw3uyQ2PwujRi1lgoZF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733870155; c=relaxed/simple;
	bh=tvt3zv+eF6/MbzKSgaDb44zYstTrL0JwPAz1hDN8QLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2e+o4rtq75POlgkanb+g7nKpTQ6Y1uIaxxreIsUrZ1r8OLJlce7CHgHCKqJ6Uo4hdNMQL4ZyK/AoCvLFYlXk2FP+Ut5ki63D0RNwa9u4Bg9ZXrlDhcmUyRX2WMN3mWEu1IlXQnCXJ7QVSJbAmcdYgeat445G0R8QpXFf1hE6EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BY9tZV7I; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-725d9f57d90so2564962b3a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 14:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733870152; x=1734474952; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SegVvC3hp1egRino8jTe24lodQ7Lif4l65T8hABKrm0=;
        b=BY9tZV7IaJ+Wfp1JTHMsdlfY0fd3hhAOM4Q+OG02cfdQQ++3HPKeVmJhdydv97hIbp
         1684miZdGCsZttf4KteRwKnao3gcNGXHT1sTe2xdCN2qY9GeionC34PfMWCTpen6ABY7
         /Ee4X2GKGp9JIq19uwc0FySw+METK5AS2bZEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733870152; x=1734474952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SegVvC3hp1egRino8jTe24lodQ7Lif4l65T8hABKrm0=;
        b=Lh3uVQZbpPFtU7Azt90tO03vH5VDVpdMwY+p2mnyyBB0YiFELumtmBsSL3QVONlJXL
         a3KIsFCHBXPXskDp+AR93Gz3XF4E7LM2ruwq2GF9bpJr/eRbl5uAtNm4/4VlnYTAc6aO
         fF1yNYuH3As6IXgI18KHRqqlnetFCfmNqDRdfENuZqFGw+8JdrrwQuqIcohJwuxbQbuX
         WnUlZEaSNbYBF8l2Hx/i8Q9TbzDafubhrQMmJ9Hiytflcr6YiRt18ROlg0A9U4td50D1
         bloiq40KcIgtyamYjOwQ9yzCy8mACN2OKWbOXHnFacRGq7bl72VWuy2FIZRRKU6TEEoY
         DXkw==
X-Forwarded-Encrypted: i=1; AJvYcCUvMhLZ65B25w8TblBiseWP5iJNoOC+CWkjqicXIg9K61ZtIPiGIJqz5T4xJEWsx5S4I4A/q46LbOvgMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG7TjaobLhBw3yCDhDF9OPsT3TEZFE+9rPYOkma3pig2yIG32V
	2VIFae3PHOR3ezbswWIjvaONhX3BNOgYtn7E0+1+pW7FeeGvaluuiXJDj/2LHq1cAZuoAioRJdk
	=
X-Gm-Gg: ASbGnctAKOsYjsAR/bw0RWcHbMP/mISoyaxDoUc4jhdQADW2ZaYp3fd2nWisNIG4dg3
	c+YqPuoNfvTe0A7GCAEu36UBLO4vdPmV6SAvsaOk1Vzp+mNspVn2n7113ub6VxQY5rKHCPUQYez
	q3eMjucbuFTb3dmoXxjv/bdV67mM4xLSRxDOKEfQX/JPQwqd6dezHwyNznZiIpxgSKjJLm9pniu
	5plOviWnUYQYMr2NiT3jdDiLdCJG3XALq8O0UWYcwJlihjWB3tN7Gni8dMJ4/gnrR8Cdn9IugRj
	ndPWIu/3aXvDf4ta
X-Google-Smtp-Source: AGHT+IHGe+KRWRK6oMSCFzE0evaSQtgoVYB/1uotlAr+PrJqaqn5E+6DcGN+RjYCUHBf0C+PxAPwCQ==
X-Received: by 2002:a05:6a20:cf83:b0:1e1:afd3:bbfa with SMTP id adf61e73a8af0-1e1c1246531mr1624655637.7.1733870151841;
        Tue, 10 Dec 2024 14:35:51 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f3ef962bsm3593469b3a.96.2024.12.10.14.35.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 14:35:48 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so4573593a91.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 14:35:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbHgjWuY/hm98aN1iYKYlk7TZPAsJ4eScb0Yx3cwDCMJCO+fUlP0/X1xun3EdBZHASEgTCwIBwhHJvYw==@vger.kernel.org
X-Received: by 2002:a17:90b:1c08:b0:2ef:67c2:4030 with SMTP id
 98e67ed59e1d1-2f128032323mr929730a91.27.1733870147516; Tue, 10 Dec 2024
 14:35:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
 <20241210-fix-ipu-v3-6-00e409c84a6c@chromium.org> <Z1isHpuHqHSX-jHd@kekkonen.localdomain>
In-Reply-To: <Z1isHpuHqHSX-jHd@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 23:35:35 +0100
X-Gmail-Original-Message-ID: <CANiDSCt64N5iheWgE0UhmTriLC8duraAaTaiX5fb7+NpXBRiUw@mail.gmail.com>
X-Gm-Features: AZHOrDk0jwuT4BPdDBgtbco-BoT1AXVUFGOsS3tfXUhEEPMwjjkEUWAtW-dj0G0
Message-ID: <CANiDSCt64N5iheWgE0UhmTriLC8duraAaTaiX5fb7+NpXBRiUw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] ACPI: bus: implement acpi_device_hid when !ACPI
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Dec 2024 at 22:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Tue, Dec 10, 2024 at 07:56:03PM +0000, Ricardo Ribalda wrote:
> > Provide an implementation of acpi_device_hid that can be used when
> > CONFIG_ACPI is not set.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  include/acpi/acpi_bus.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> > index 4f1b3a6f107b..c25914a152ee 100644
> > --- a/include/acpi/acpi_bus.h
> > +++ b/include/acpi/acpi_bus.h
> > @@ -1003,6 +1003,11 @@ static inline int unregister_acpi_bus_type(void *bus) { return 0; }
> >
> >  static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
> >
> > +static inline const char *acpi_device_hid(struct acpi_device *device)
> > +{
> > +     return "";
> > +}
>
> I wonder if any caller might expect something of a string if provided?
> Valid _HIDs are either 7 or 8 characters whereas the proper version of the
> function returns "device" when one cannot be found (dummy_hid in
> drivers/acpi/scan.c). Unlikely to be a problem perhaps.

Good point. I changed it to return "device"

Thanks!

>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> > +
> >  static inline acpi_status
> >  acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld)
> >  {
> >
>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda


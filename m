Return-Path: <linux-media+bounces-23114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC649EBDDF
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB75B1678CF
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 22:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAC31EE7DC;
	Tue, 10 Dec 2024 22:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hp1euByq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A515442C
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 22:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733869934; cv=none; b=TnnhoJuun+dF9lw2+7bni7Jb6JPbwozHvsqH3EjxXkAtkBScUKvYUszKspkhFPdES0iSu54mdy2wO9yrNCMoEoJwmjjbtgvVlErMZMgTbIhrUnbnUwUCGyGR7FP5/q6u21/p/iOC09/LZ6ssnOMjgi7y99YeWSTGZP1z9aqHZJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733869934; c=relaxed/simple;
	bh=5sAckLh2O+Xqp/B3w/FFV+cbSlpNec1FrjP1mHYiP74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srsCzroC6btroJATyeL7MYvA2y7Rb8lZyLPYmzCXqKRa2OmAlV/TKjReAR6avNZrbP2B6H+vNeO6tCIpXm6ZyeEE6sQjJOcj7qvidSTXqWwtR2xfnLgaF+sOE8mQfWLa3YFCJbqlO2+PzZgXO3/vnx33h16vg16yVG6CnS6x7sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hp1euByq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2164b662090so25736605ad.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 14:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733869932; x=1734474732; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bbiia8j7j6jNdjJNl2DYQMz55vjkekkDfU83OLWkpH8=;
        b=Hp1euByqmK84QDuMKywicw7Xsl96neP0hhR1ilBpsLceJRXiXgk8KoYRLNl1BmKCpC
         SOi16q1UinbG87+j3x1zkVbwRzqTCfIaI4nGrys8xF+fjFFxcsECgcCmbMOEDIHpp5eo
         dAYk5K624IiM1IEYOj0tVAEhG79TZKDK1VNSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733869932; x=1734474732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bbiia8j7j6jNdjJNl2DYQMz55vjkekkDfU83OLWkpH8=;
        b=m+CfCLqDk/384tkja7uqTg2lPozaEHQciksJKE+wEHX5xOvzXF0rkl0b2fyhkwkksA
         JlpUOgHdH9+FhKrpWKC752W+KQ1TgB3ICu5C1/auXf5CDUDakn8m1+Qe3IfQnVbjDyum
         vRCmc7qkNEwmBMGqXoucPmYIbakxjVNSgAle0qljtvwJfQOndYgRFyXsdXLM+hlR3PqA
         rKtSPc2qOS54ms9PvrWcOerjCwVUAJgzGq7QZxWjMMwQRSCEyK9pm/nvZCex6aclQ1fe
         xaJcduZZC7W8no7+Tam1xpBybnzHndlyAKO16fuz8H5aDatPT5KulOalk6d3nrFNDFst
         TD0g==
X-Forwarded-Encrypted: i=1; AJvYcCWfEzfjFIVsL+TgwZ5Ev+ZjF0X+LotA/cZnYMLHyimSZxJPtky/pFTggF0CSKnvs/JxMefwni4d0J7Kmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6FN5DT14mt9/ZLUwj0zZ42mvPTKySTkHL+s+Yu8PLamWcvTX
	SWvYGgBEcBC/DrBjpNvnNpDtVS2SgBFlicj19XOCzTy1I6mcBSGTr2tvoz6KLc2XgU/qWB9wofI
	=
X-Gm-Gg: ASbGncsdBXl/xbD0gwQeApvmcv5PlZSOG3u6jDE7AqpytO8HVTi5RwRCn/lD2gowWA0
	enFcpNwMvuyuib7Q8DSVzXDlE5nSYYAaUCAj9T1XbnQ4Y/X7kn5Wa5/K754nNKyPkJAxymduSj0
	ae4xSGBSte22zyhzeRdo8wv4Z4XCJgeP3z2mvVxwalT3uPj9JKrM+lZxXkOcIjtN1bVVZOPTDGP
	0ABwBRlhIEmXwFA3KINwTmrf7wFERzvLMfT7W29xyyG5WwXo7MFXvZXfoqTpcNcBTWZuDI0kwi5
	pczgvl/pjUbLhS4O
X-Google-Smtp-Source: AGHT+IFyozLusI2g7Cw7uwpTdg8GkLG/SxMkIHCwvNzoUFrVUOgB+D0q7j7a0qLz2TpoPDOHZgcSNA==
X-Received: by 2002:a17:90b:3812:b0:2ee:74a1:fb92 with SMTP id 98e67ed59e1d1-2f127f565f9mr1009974a91.6.1733869932309;
        Tue, 10 Dec 2024 14:32:12 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd47a510e1sm4688294a12.47.2024.12.10.14.32.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 14:32:11 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so1022000a91.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 14:32:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8xSolxtestvSE/0lP/0et6KAEO6dihI5ekLJ2AmHu9yl9uYFr8Fst7GcljuPKVcqs1zqRQ6/xkP34/Q==@vger.kernel.org
X-Received: by 2002:a17:90b:4b12:b0:2ee:c797:e27f with SMTP id
 98e67ed59e1d1-2f12804fc63mr899384a91.36.1733869929209; Tue, 10 Dec 2024
 14:32:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
 <20241210-fix-ipu-v3-4-00e409c84a6c@chromium.org> <Z1irAT0KVwqhBSSZ@kekkonen.localdomain>
In-Reply-To: <Z1irAT0KVwqhBSSZ@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 23:31:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCsLOODLhGrpPwOQ1j+coSb9yHYi=wjGpZ+F7VbA7AM0og@mail.gmail.com>
X-Gm-Features: AZHOrDm5Mc-6e5PYz70Xt3CVLGWF-rWtXL2uCKjRJio5ykJKaQ08kVB9D3kD-OE
Message-ID: <CANiDSCsLOODLhGrpPwOQ1j+coSb9yHYi=wjGpZ+F7VbA7AM0og@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] ACPI: header: implement acpi_device_handle when !ACPI
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Dec 2024 at 21:56, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Tue, Dec 10, 2024 at 07:56:01PM +0000, Ricardo Ribalda wrote:
> > Provide an implementation of acpi_device_handle that can be used when
> > CONFIG_ACPI is not set.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  include/linux/acpi.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > index 05f39fbfa485..59a5d110ff54 100644
> > --- a/include/linux/acpi.h
> > +++ b/include/linux/acpi.h
> > @@ -787,6 +787,12 @@ const char *acpi_get_subsystem_id(acpi_handle handle);
> >  #define acpi_dev_hid_uid_match(adev, hid2, uid2)     (adev && false)
> >
> >  struct fwnode_handle;
> > +struct acpi_device;
> > +
> > +static inline acpi_handle acpi_device_handle(struct acpi_device *adev)
> > +{
> > +     return NULL;
> > +}
> >
> >  static inline bool acpi_dev_found(const char *hid)
> >  {
> >
>
> Please remove the extra forward declaration of struct acpi_device a few
> lines below this.

Instead I have moved the function under the forward declaration. Let
me know if you disagree.

>
> With that,
>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda


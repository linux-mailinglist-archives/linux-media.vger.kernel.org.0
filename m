Return-Path: <linux-media+bounces-15913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672594A367
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20F3A1F23B49
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AB41CB302;
	Wed,  7 Aug 2024 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjGE5SkD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA773171E64;
	Wed,  7 Aug 2024 08:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723020624; cv=none; b=WADvwXKo7GlaiSUxJjSIT0UtCXgAoDZxNODQygwff/btYeCWkfhcUJGp69tiF9HyY/bn9KgfJ6X8X9JX49tjP00na53ddK6mOFCOe/y5IHemnNRAjDzp8RVk7SjGKdAcq5GMXy6ldgHsKbesBASxvKSJ0c65hOcLUzTHrpdWbHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723020624; c=relaxed/simple;
	bh=lwisAiBZd8mNg2cdx2iyRTs9sj97OOyls4hcndSIjnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZ9g1jYjpQhz/GY85ac2Stnd1mXAyX7vVRqONCBGb22RlkE4PcgTEPRF64Xvgh9nWSd50vrUSITDuwOtm8dEL+3depTiRdEkZAMBwagcx+aHkeK3I8q/DodhgcoIU+5QVgrOaMh9CCZ/Vx8LXnm+FUJNOA1h2HfcWEVT9xApcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjGE5SkD; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5af51684d52so1823023a12.1;
        Wed, 07 Aug 2024 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723020621; x=1723625421; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kg/vw4VlzTVDpnIbh8QBBllVO31IqkbKb+xEe/Fc+vE=;
        b=UjGE5SkD7L/4Za5YwkGHC8qU5kWIfD78+b/l0wFTMFDr3EQPM482E00EBxjJ142w0L
         qz5V80M/y+TFCCVrzi9URqqsXvp2shxwf/phN97NV4pmRAEK64F41QO3RiXE89NXImhu
         cdkKTvGKPL7Q0rvWjELz5ODIt7PZbrMJi38jm35wENXot/dsv3R2YEmot4O/jJc9J+HB
         uOATy9A7h8oWinkBkspkt2i7GHslC/0RQxmh0aCn7eH6q6OZChjHmmaCAzcTrmGoGJjK
         o9k2APztH8Xg5Tph2zN7z3OwviIurz1YSxsDC/yzRiKW5igaYpmnnSewhdDN7s6FxiaP
         j6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723020621; x=1723625421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kg/vw4VlzTVDpnIbh8QBBllVO31IqkbKb+xEe/Fc+vE=;
        b=Pg5YXOW0ek0xtwqqS9SNTcfIrCebryN+IjUQt8/HOjujp7ewaRwhNaX0nETuXp7CSR
         Q93BaiVjWNnSuNc16m5Omsw1CSbgb1Q8hgLFu6E6mT2Htzmf/h2civdQALIARuLRZt8u
         TmQCmDPFufS0M/L5e5iKH3NdOfqP7p1NNv8gEg02Q9Imko/xzv1Mw7CyVxeX8axxYP5x
         yG2hJTofmYMRij2nalbJrwb58mFeCaPc3a6dQel5YtOX345wehdaBeNPguob4qasleJa
         5LorebHCbNlJE8sJHAkmEyH2VcT63fir++SA4HsN/KSioIcsFaEX99q+DTtp1Zo/nMI4
         ujbA==
X-Forwarded-Encrypted: i=1; AJvYcCVjq1xiAC5gEJy4XKKOHQlTBRRXRKXN6hA28MiXFjA9aLrhT4GVeg1BXSOFYIjGmxNud9deQmqx8uBapADeVx97xHHYkNsQYZyFat46dq2ZX0pJkBJ+/k2ofIktrh15NAe0FzATsQnBGdI=
X-Gm-Message-State: AOJu0YyK/Iw0yuM0jSCupNKdcIRvtnxvsTodrugUTBdzk4FH7dfhENVN
	Xdc8npTtqO8HGEzQyG6O+jczrW1Lyj2bEH0HJmCNS4tyV/ALhXYOZM9D7cVZ5izmgYv+nBd+9Ld
	Xm57E7H1Vj/v022OEzzy9/P7q1Nc=
X-Google-Smtp-Source: AGHT+IHlgHgwM6yFOAyKq1npixJjOR1pVgGh/hcSETl2pzGUvVgA9QmdL166gDBz9Jcq9EoESuoJwLnbP+uiqSbvxQs=
X-Received: by 2002:aa7:dac1:0:b0:58b:12bd:69c8 with SMTP id
 4fb4d7f45d1cf-5b7f56fc0ecmr11282814a12.36.1723020620741; Wed, 07 Aug 2024
 01:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com>
 <20240807-imx290-avail-v1-2-666c130c7601@skidata.com> <6072611.lOV4Wx5bFT@steina-w>
 <ZrMzrJlbOpd8V0n9@kekkonen.localdomain>
In-Reply-To: <ZrMzrJlbOpd8V0n9@kekkonen.localdomain>
From: Benjamin Bara <bbara93@gmail.com>
Date: Wed, 7 Aug 2024 10:50:09 +0200
Message-ID: <CAJpcXm4CChJUjcZg3DkDb5xJ_ebk7v6VN82BoiF5m27rLgTrfQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: imx290: Check for availability in probe()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi!

On Wed, 7 Aug 2024 at 10:43, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> Hi,
>
> On Wed, Aug 07, 2024 at 10:33:51AM +0200, Alexander Stein wrote:
> > Hi Benjamin,
> >
> > Am Mittwoch, 7. August 2024, 10:10:28 CEST schrieb Benjamin Bara:
> > > Currently, the V4L2 subdevice is also created when the device is not
> > > available/connected. In this case, dmesg shows the following:
> > >
> > > [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> > > [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> > > [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> > > [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> > >
> > > which seems to come from imx290_ctrl_update() after the subdev init is
> > > finished. However, as the errors are ignored, the subdev is initialized
> > > but simply does not work. From userspace perspective, there is no
> > > visible difference between a working and not-working subdevice (except
> > > when trying it out or watching for the error message).
> > >
> > > This commit adds a simple availability check before starting with the
> > > subdev initialization to error out instead.
> >
> > There is already a patch reading the ID register at [1]. This also reads the
> > ID register. But I don't have any documentation regarding that register,
> > neither address nor values definitions. If there is known information about
> > that I would prefer reading the ID and compare it to expected values.
> >
> > Best regards,
> > Alexander
> >
> > [1] https://gitlab.com/ideasonboard/nxp/linux/-/commit/85ce725f1de7c16133bfb92b2ab0d3d84efcdb47
>
> I'd also prefer reading a register and indeed comparing the read value with
> the expected value.

Sure - I can drop the first patch and check if it contains a "1" (standby).
Probably we learn more about the CHIP_ID, then I can switch to it instead.

Best regards
Benjamin

> --
> Regards,
>
> Sakari Ailus


Return-Path: <linux-media+bounces-17224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD90965D04
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 11:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D3E31F223FF
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 09:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BF4171658;
	Fri, 30 Aug 2024 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Lp7kv3b8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8166017AE01
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725010445; cv=none; b=YtzkdUz1GLn0uvzbZ8mVwME5i/x+k8qtEf3K83iUksBUfVrZ0UTuvfJddf3Q5u7/XrYkuZdPJeITP5fZR9DS0L/2UNKbObmpKoiFYsGB2idHcX2TQ/wAEVxVegypG6E3SUvNwjmQTce9HU7M6I2OW29FiJ2XQfcUI4p3WrxVcHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725010445; c=relaxed/simple;
	bh=5rP5zL2KLmr+ypRtFJIOpFNWn0XTqmd0dwtczaD1wMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEMNs5Sd1fv4Ggz+532RBT4XI9/JP+sZc5+ur6aAX/KtfEuV2uLR+Mwf5ttJvF3y0D78tf8eP1jmtByS7+3AwNfW9M865ju1G36gH0kQV2qJBFWHxOPZZErmx2o6u/GXfpmkxY+DZs2EmRsST3ZdfGbu1K2ksEc+cEAT993qziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Lp7kv3b8; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e1a7fa52bacso50345276.1
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1725010442; x=1725615242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rP5zL2KLmr+ypRtFJIOpFNWn0XTqmd0dwtczaD1wMo=;
        b=Lp7kv3b818VevBRZFbg9sFkUzHya5kT3hJ4LjSbgt9v3uTz/DJoFkzZRUtFxQHDahM
         Dg3rWQoDmwdWJSRFnw7KM62edUtilxxqWdRIaYO8PZ5KgIygGj2DgIfnX+2nSRYACiQ3
         rf5P911nrQYKYiujpr+IQk9SSSAljSCv7NoMC6mQUuJDeK/rqN63J+VN/cWaHedMoXDE
         1ykTZNf1p26bDzZ1rc3D9bSErF0eMFs+nMFXpKEXI/PSfCOgWq01hNvzwtSVrhAMiOAw
         f+xEnK1SLek/HrtLW3YDp/QXhBT4OWN8hfHkjcU/lpo0sWnYKaI/GA7mqDhv4+CgAmjm
         FqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725010442; x=1725615242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rP5zL2KLmr+ypRtFJIOpFNWn0XTqmd0dwtczaD1wMo=;
        b=spXou/8ImSFNITL0G8pL9404RUme+Qel0y+/ghANXLquWhiVwNH6LUEhir25VvEqdp
         fTj9FmAEtBtYHA8+psdkTH+RSItmZbHfJO97xNVkXNoW7/Xjmq1qRmjIXD71mTUAxGBf
         Mxmc4VLJnlodvburUY+5ORq0qlhbKd0drfQqroa/kWfsNrvI2gpircxNJJ3AN2S4Nvyx
         hCtA+SihUuZWjRKhaKVlUG31MMLnYcqFK2LG+ii4CoWcMUubO//YC6oup1uxn8sMa5uV
         0yfFhG4ayp+aMBuhaFneQjKOoRsgmAWK/hY4k/DT86EtwylUzKYT4beVffnS9HBtLLmR
         AnnA==
X-Forwarded-Encrypted: i=1; AJvYcCXxNTatVJ8JxXiISs1DnRNk6ebclRrMDnCHirqsZhlHhtr22/Q2KXndSJyAyj7YrZYOKLd5tOUozUjTpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkw/3YUXAD47w3ktQwBXrP1U5b4UE4MimwOBY5DM4zhc1KlrFZ
	zQTCACIi6sm520vdel6qO4fiqHBiHeQOWiAyQFZwNXeP/466L2VT4KAvXtBYgfxBsZw8YE+8R+7
	DfZ1rAdzMFYtZ0yaUnI1hx2OgApnxHD8nA1dBMA==
X-Google-Smtp-Source: AGHT+IGI1I8xF4tSkkkuAM2tC1QhUAKtihp4AiB8cFNzmGSA3P/TjVLFGKmwMrM8BHcIKtVV+Zif+H7HNvm1FVotljY=
X-Received: by 2002:a05:690c:e1f:b0:6d3:c7d:5eaa with SMTP id
 00721157ae682-6d4105dd651mr8373437b3.8.1725010442337; Fri, 30 Aug 2024
 02:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729090042.GA2725@pendragon.ideasonboard.com>
In-Reply-To: <20240729090042.GA2725@pendragon.ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 30 Aug 2024 10:33:35 +0100
Message-ID: <CAEmqJPoHUXpX3F7dDKAYCr59YKCWz9rggKD5C6hTyyOSr=EiaQ@mail.gmail.com>
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

Here are a few agenda items that RPi would like to include in the discussions:

1) Raw reprocessing API
2) Per-stream control RFC
3) Non-image data streams

Thanks,
Naush

On Mon, 29 Jul 2024 at 10:01, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello everybody,
>
> Following the success of our workshop in Brussels in February, we would
> like to host another event in September.
>
> We have evaluated different options, and opted for week 38 in Vienna.
> The city will host during that week the Linux Media Summit (Monday the
> 16th, [1]), OSS Europe (Monday the 16th to Wednesday the 18th, [2]) and
> the Linux Plumbers Conference (Wednesday the 18th to Friday the 20th,
> [3]), and we expect that co-locating with those events will ease travel
> for attendees of the libcamera workshop.
>
> The week is already busy with camera-related events on Monday with the
> Linux Media Summit, and on Thursday afternoon with the Complex Camera
> micro-conference at LPC ([4]). We have therefore selected Tuesday the
> 17th for libcamera.
>
> To help us plan the venue, could you please register your interest by
> replying to this e-mail, either publicly, or in private to Kieran and me
> ? The event will be free of charge for attendees.
>
> Please also let us know if you have any preferred discussion topics you
> would like to include. We will draft and circulate an agenda in the next
> few weeks.
>
> [1] https://lore.kernel.org/all/ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl/
> [2] https://events.linuxfoundation.org/open-source-summit-europe/
> [3] https://lpc.events/
> [4] https://lpc.events/event/18/sessions/193/
>
> --
> Regards,
>
> Laurent Pinchart


Return-Path: <linux-media+bounces-10834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2CD8BC92B
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 10:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC6E1C2145A
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 08:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8C4140E22;
	Mon,  6 May 2024 08:10:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E37927456;
	Mon,  6 May 2024 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714983037; cv=none; b=J6l573RVxXWx869+BXfdPUmeaG4YpxjaLNLAAexea4ODblI0z/JvaiJ8PauMU8kG5heWmP6HivZP9cupNotlIVsV5gBpUk59E0pbHcOiSmV1VnPCzjK1+W926pNEhlJmqLgvGD/MD39F/8s+5t/itJjRjWEc4QhCzn0blgG6M7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714983037; c=relaxed/simple;
	bh=qyZ9PKKgJWGrc2qyQNNFBv/ntY78R/FCw42GAtBxQ8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jW+HeXiWaBRCP92R44ObWFHiBFTeFCFugg/AHeYR+0tHfyu9PfGrKLNVHHAwyb751+4OMckt9XBLuxJbduKF8GlGBIMufTb+kpcT8CkafUSERPp6AEKyUp2Boq7+IUZ8gsfqvC398n7tpQ9Cr3dryVrvBy3b/QsYTsToYvykWSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61816fc256dso15424457b3.0;
        Mon, 06 May 2024 01:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714983034; x=1715587834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2QE62R3nwlo/YjkO4pqNT7mQ4PBo4s92oTndNe4V8U=;
        b=DKpinsWtCMcZ5qDnHrFcksmAGBp8uAcN8NDdP8QP7pU7Eq+BSzfjC/2uf7JgFXCdAx
         Oy8Mq6kdG6nk6o+VYRbWtMKZQncXEctLvhcwewAMqCD+utDQZ9vn0CXcVywYvo11vuC1
         dNXHmt0lrYX2/UnRK6mGW0zqFnIgLKyOLCK4WQKqedEH1cw4a7LCCCv145Kku1eMFK2m
         AMVMS1Vl0cNhKsUvIXzemv6zWfa4S1CNtK2JyThVaHDDyO99fgbudyKWMliMLNl66KT5
         +e1PIhwUpx0YUGzZDADwGy9QhkdjCy7tkrunEGq1HpKZ3923H0j65rXybhtpiT5+SXzO
         CGcw==
X-Forwarded-Encrypted: i=1; AJvYcCVG3T+2B1r5iSB0CaoLX6GQK+TbZoVsN++8ZRKB0vMVvYcexx3ylLZFSwTeq/rZyAVD2Ffdbt0nE6a6X9ATHGF2sEjPUPViNETxr5yJbuLf0+wjx5Gvxz6bMGn7afd1cH5eGzmSYV4KiFHVsEcJmg==
X-Gm-Message-State: AOJu0Yz062fpGQQrc4uJKlpoop5cFvD5qpmoaez+9ApeNXeOnW/Vi3rj
	w7Hepr5hkdcrZyf0pTUEoD/knk1ksXCJ9VvTvPGM3JNZU/HJYYyjL59+NT5G
X-Google-Smtp-Source: AGHT+IE3kCDRksyIVyPDcxu1MXRorwHdT3VT8RsZCtDGyS85lSCsGlurehSSRY8aCy5FlXbQz8qLEQ==
X-Received: by 2002:a81:8397:0:b0:61b:330d:bcee with SMTP id t145-20020a818397000000b0061b330dbceemr8473524ywf.18.1714983033721;
        Mon, 06 May 2024 01:10:33 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id u30-20020a81b61e000000b0062036e4c8c2sm975252ywh.51.2024.05.06.01.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 01:10:32 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61bee45d035so17683147b3.1;
        Mon, 06 May 2024 01:10:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDaEEPnGJKCRiKca5cfMHf7m/MzCAZIWRLLoJCnIx7GwXxbt3WSLurQ4S8ykJ/K3+/YM/qjcTUtg7/a3z/rLkmlg6Yd1wIqrbv1abXf4SXXI/eMbwACqIJI9dKY4h3DYgtyoVaCQn0FEcXhICiMg==
X-Received: by 2002:a81:4c52:0:b0:618:5b27:e12b with SMTP id
 z79-20020a814c52000000b006185b27e12bmr8822386ywa.7.1714983032367; Mon, 06 May
 2024 01:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-5-jacopo.mondi@ideasonboard.com> <20240503180321.GK3927860@ragnatech.se>
 <hicrcteav2thufxnlfbukmt23svoomiw6c2p3ngkg55z7e3bo5@l7f5chrf3lsk>
In-Reply-To: <hicrcteav2thufxnlfbukmt23svoomiw6c2p3ngkg55z7e3bo5@l7f5chrf3lsk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 May 2024 10:10:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2KvdgWPooHxnxaGwriaqDSZ0JH_Qq_0bDGMgccFbgPg@mail.gmail.com>
Message-ID: <CAMuHMdV2KvdgWPooHxnxaGwriaqDSZ0JH_Qq_0bDGMgccFbgPg@mail.gmail.com>
Subject: Re: [PATCH 04/11] media: rcar-csi2: Use the subdev active state
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Mon, May 6, 2024 at 9:25=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> On Fri, May 03, 2024 at 08:03:21PM GMT, Niklas S=C3=B6derlund wrote:
> > Renesas Salvator-X 2nd version board based on r8a77965
> > 0;root@arm64:~
> > arm64 ~ # echo wkbfirytku $$; rm -fr /tmp/vin-capture; echo ygxezpiinz =
$?
> > echo wkbfirytku $$; rm -fr /tmp/vin-capture; echo ygxezpiinz $?
>
> What are these random strings in test logs ? (out of curiosity)

They are sync patterns from Niklas' automated testing framework,
to sync console output and test progress.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


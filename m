Return-Path: <linux-media+bounces-42131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5BFB50477
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 19:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F3421753BD
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 17:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40C433438C;
	Tue,  9 Sep 2025 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZ+8ZOl1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD68B350D69;
	Tue,  9 Sep 2025 17:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438916; cv=none; b=N/whpmkgi/UfXnTGlZSzYKTBI1zGtkRwaOmjdvsuPNzywtIeuutIv2jOfj2/W8bJtELXeTV81Q/c4W0WDqUUfDooRzU1f0rs+kB1sliSNWkIEBZrpUttxdWlfuzW4aT3tkU04cs9qBo6gC/sUcAJ/V+OxMIqReARWt0+NKR+VVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438916; c=relaxed/simple;
	bh=5iMq1cHF+x9HBFpSpJaAJUWXufWBN+foQpYtq/Nd65g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmL7395+74rJeT4ke912EGHFauiLAQDsMOatbCnFj/NEIWqFS0qndQtyt4HdTvcOUz+DIba6A8R+kw5BxnO3rlt4dZA+EmxidWMAhUyoxE15p1ZkddfmTNVvVOKhT/v25u6Sf94LJkcI6Sigl/PHlVyp/+v7QHiG7BfMjT4XNaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZ+8ZOl1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62bec18abe6so2175514a12.3;
        Tue, 09 Sep 2025 10:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438913; x=1758043713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iMq1cHF+x9HBFpSpJaAJUWXufWBN+foQpYtq/Nd65g=;
        b=nZ+8ZOl1iJ0UP8ow7NOihV5de2g9NyXed2BMZCTD/Y4vIJHk+vzbJtmbtq6g0o12VS
         BJMuKn1gGcmA3CdY7xzn47KTCcV+77W0tEkPfb4w7Ojbx8GrAMOyWSNdvThK5rs7qBtS
         KYTnxi80NFzb7JTRRwPZV2hXa3viBNQmuPiJ093dnRmbTw2+0ldZFh0/iVcZ0X5qahRP
         kINtP4TIZJ4KQjGJXktZefvW0v1deasII0gWIHf/TxPBHZ3cAyV0YEJs2ZHE5ujj/nvH
         ZvEkB86ykDeufmTKgqLX/64iVt0EMeYQH8p9HXoFJRpS7v7cyR2HRyZY0++4LXvPBO6Y
         Hjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438913; x=1758043713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iMq1cHF+x9HBFpSpJaAJUWXufWBN+foQpYtq/Nd65g=;
        b=bcOv+8oCubhjw8ugNVB9t68E2S0dTbnvO+SJNKTBZGvzvdwU3WrNtKNmNeONkegAlQ
         zQCg5Q/sPua1m2/kU1C1jM65p5kXvgtgRN7VgLpQe4VEshwvWebGZe89gNIy2LnhEcIx
         HhANBlhzP/GvGjvGzLCvSSVr2vZxY0FndSEJEP1tb5CELdZtiwh3a93Ad4f0hO2q01+t
         uKU+DQtoANoWv/h5hMuI+rRgVV2eGn/iiNaOa1F7XyQG3HWuUdD0HY3bCnCVOsect5UW
         /N6q/KOMJk6MeNfihH67yANLJ0B+sS06WL3yNfMs7q5hPAtE6QJmXRavjeMGMV385bmY
         WgTg==
X-Forwarded-Encrypted: i=1; AJvYcCVjXRyUHyCgqcWue7hH0DakHpqyX+xAjAdRvrCBqPp0ak7lzj2SgfPzKo8OQx+/Bbqf23cQ5d37mBRlt4lxuTlAjv/m5w==@vger.kernel.org, AJvYcCW/5BW5bsjl2q3iGWgMPTPn+wBfPnD2mMjiHC1P6sIgTkqAIGGl4+mVlzEHf/CZ139QHJ3Kg2wy04au7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfcujxZrDrvsaDSzGapIt1LzLsW0ohDQxV9hJ8BnoMIwuAq83T
	vghQVc6oC9E5WlJUvQjy3T9q4frbi7jzwymBPuECy/DS/3ipiHGMSo7bHw1oY+BrXwUEjla8RkA
	Nj3yRJhkehll6VMGqsHZ6prnPcgKt2qTxypLc
X-Gm-Gg: ASbGncsgQLLCCO0b7vMDGj7iXr0ROsuxwWX/2RhZsd+uMlBFxQ5cIjov2H8R/viTmBF
	vG4vw+OnYsVZ9o7AHkRVm3m8lYd0rK+/3JDClpaHg9bk1JfVuqucOyIYZ6/2UZUsz1nraAaAkf9
	eV/PxxO27iRqIEzfMezz7xyTTcwQWSl7awu//VBE9A+BkaKQReIE+YwiJcpDRrW84vFLgAAKvc0
	Rv0i0SBLfPv/yINfARPhDf4jgl3MTY=
X-Google-Smtp-Source: AGHT+IFAJeaUp1KqCZcTWSjVOoiuhPKEQKWLblb+EOdfEYXnH33Q1y1OAePc/rgDG3baBx51xYftfmyPsorrAyop9y8=
X-Received: by 2002:a17:907:3d16:b0:b04:59d5:fb78 with SMTP id
 a640c23a62f3a-b04b1702bbemr1223814266b.62.1757438912867; Tue, 09 Sep 2025
 10:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909144823.27540-1-hansg@kernel.org>
In-Reply-To: <20250909144823.27540-1-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Sep 2025 20:27:56 +0300
X-Gm-Features: Ac12FXzFWQpBo73mGBBcdjQhL6zHm3vVxpctuL_IuNMJ_sM5q5iJeIH4pymcwic
Message-ID: <CAHp75VeMMKCTDNWhdZJH2F=cmUObbpoYcDUch2jpsLBBNs_EhQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] v4l2-subdev/int3472: Use "privacy" as con_id for the
 LED lookup
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Aleksandrs Vinarskis <alex@vinarskis.com>, platform-driver-x86@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 5:48=E2=80=AFPM Hans de Goede <hansg@kernel.org> wro=
te:
>
> During DT-binding review for extending the V4L2 camera sensor privacy LED
> support to systems using devicetree, it has come up that having a "-led"
> suffix for the LED name / con_id is undesirable since it already is clear
> that it is a LED:
>
> https://lore.kernel.org/linux-media/0e030e7d-0a1a-4a00-ba18-ed26107d07fa@=
oss.qualcomm.com/
>
> There was discussion about making an exception for "privacy-led" since
> that is already used on x86/ACPI platforms, but I'm afraid that will set
> a bad example which ends up being copy and pasted, so lets just drop
> the "-led" prefix from the x86/ACPI side, which we can do since there
> this is only an in-kernel "API".

Since it's an in-kernel API, why can't these two be simply squashed?


--=20
With Best Regards,
Andy Shevchenko


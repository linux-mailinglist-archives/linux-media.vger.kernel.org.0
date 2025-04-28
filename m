Return-Path: <linux-media+bounces-31233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A5A9F8C0
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 20:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 670C14602B1
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 18:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58452951CC;
	Mon, 28 Apr 2025 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu5gHyDv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777412951BF;
	Mon, 28 Apr 2025 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745865648; cv=none; b=ZdxDKCobWNDeWJz6wynP9BpMWyWnlHsKe8lQJchMOxt+f7tAr0Gb9g29s3NRyeO2PmWlOj9lXBVABuMSJL68M0XA32tKnXr1aX9HyOQMoGL34HMi7fiL3Cgq2gTldmdvQG7k/lZQIS+mbCjeainAmMkxD8SrkdeDOGX+bvVdFFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745865648; c=relaxed/simple;
	bh=BGwwVL0HIaHmbSX0ohrKs8ybdOlWCMLz/88f+UFF9JE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UxITGRp/0C8/OIRC3mp6BKXyTDoOtWMH0orAhC4jCBiRPAaf3fMY2aiFJIsSsyuIAv4jq9sk8L6gywcmYHGGK5rh3njDk8E9VdffoJJKYBnuSQlmoCXgHPwJ4MQ26rKrxyD8Df40Az0KJbco+R6T2U7WepmwW4ov/ywt+lOOsQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mu5gHyDv; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c7a5ee85dcso62273685a.2;
        Mon, 28 Apr 2025 11:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745865645; x=1746470445; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fgaBY96VE81PvPbEwYS+skMIdgkg2Q9a/pUkwNmCt44=;
        b=mu5gHyDvWk2/+mb27rCRSx8fwneVBdNWbyFD0Qast4xs6j8FagKf0hzl89EsJIe4R3
         3sr2ejaDYH0a+jx0J7vjnzljJ4WqmUBkvK/G+0nUEe7Igs3oV5J/RAQcP2yR6phixnV5
         T3Pe6sCGATxitdEFPUCSavDsknoYhQP/sO5J4Ct2ibplYqH/c+d9gNZBbiAlp2G9FM55
         XKUNNOWtmiHZfluUxpnMfQ3NW/AxyxJvoWEOHQi7UKRd0uexHEMSADPjLfZjD//Q3pNG
         6h+xRKwmu5t+c5Tb41bMWPIyZnWfjvz+aZny51fKcDuM2WvDqSrsVEnhfrmdJCvY1XPo
         qzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745865645; x=1746470445;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fgaBY96VE81PvPbEwYS+skMIdgkg2Q9a/pUkwNmCt44=;
        b=UOJY4rxCdGdOW/PGedxBDFUVuegxh4WKNl5lPC+2X4n6GSa0Fz0SWO8wCkV+onbWM/
         y7ekrkZeKJOsnbqrySRoNVqA3pfGnOIKISFg81+F7EdD8qt37M6ptuu+I0oBBsCQEt7v
         NQjZ9GzJuZaUNcY1dpffQn0JpDcTqmj+HvrW42VtDabVtePyKACseG6vNc7iqP7M5rWH
         3OOCuhW0dssakV7JYSf/ih1Zd0XMW3vA3L4GUKbrPTowSAZ15k/uxYB+kK2hQlbfrgCh
         AkxoYGHLDNooRusGyhNXOE/Ng1ptHurcbCibBIZQuVbXIBgpL0IRn3Gic+R7aEcc0KlD
         hB5g==
X-Forwarded-Encrypted: i=1; AJvYcCUFB6Y+9obexFCbJzC490H6UdpZQGZJr2nt6Y0LjrxkTQKTn773NocD71dJksmmwp5r/nYbDRrzZK0La8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1YZAflsDZUo1sq6oqxeV4nxtPLuRyRdds790544S3liwuMxJJ
	vCIiS1pqQWjQ6aDKSiqtVivZg9r4J1CDo0NRr9ABRemmzurXiU9E
X-Gm-Gg: ASbGnctCHkxAHML9wOJ3RwtoLfR8+sX2av2FANRJSVbRl3SBULrbqDq/uq4VyLrW59o
	IPPAs59tos+0xOJBuhsJu6jIqN6dpbs5wax6RJMaNITfF3nbnYsjOFfhiRq62QJh2NB+yAi8uQ1
	50C5v4Cf+/t2gfWTr9F8HKMldZ42OP2nAPtA7tU00rFySR0t0koTVy/RTCwX1kONMPuB2xV1KPd
	5REoJAIcXGH5dyKkUj8ZuZf0TDSiX3Izs+jBlwL8ojGzG45xPKLo/kLUrRYip1PIhnU8pVdHo+V
	cW+/QZJLI1ksvP4Gui1v5FKhgHyX4ir2Tjt7lkYtaZF19s5M6qJjXvGQO1jHal+D0Gqp0cj58AM
	T14yXrsr8e/6+MahlOxdl
X-Google-Smtp-Source: AGHT+IE2APmkKsqhEx5YxFzlg9XvLyxc4U0ug8dWuN51lHxmxpo+8GyoRKNjIhDX6KXVxS4jYk3P7Q==
X-Received: by 2002:a05:620a:2550:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7cabe55874dmr11796985a.0.1745865644894;
        Mon, 28 Apr 2025 11:40:44 -0700 (PDT)
Received: from ?IPv6:2600:1002:a012:1653:18fc:2b88:2fa4:6e9f? ([2600:1002:a012:1653:18fc:2b88:2fa4:6e9f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e7f115sm653510085a.72.2025.04.28.11.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:40:44 -0700 (PDT)
Message-ID: <8b0234aeabc8d33a2d8025b42642362481a6c06a.camel@gmail.com>
Subject: Re: [PATCH 0/3] media: vim2m: add multiplanar API support
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Hans Verkuil <hans@jjverkuil.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Hans Verkuil <hverkuil@xs4all.nl>, Uwe Kleine-Konig
 <u.kleine-koenig@baylibre.com>, Shuah Khan	 <skhan@linuxfoundation.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,  Sakari Ailus
 <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 28 Apr 2025 14:40:42 -0400
In-Reply-To: <09726b7e-4ac4-4ebe-b1eb-4d142c2ee0fb@jjverkuil.nl>
References: <20250304191701.2957096-1-mattwmajewski@gmail.com>
	 <09726b7e-4ac4-4ebe-b1eb-4d142c2ee0fb@jjverkuil.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello Hans,

On Sun, 2025-04-27 at 11:45 +0200, Hans Verkuil wrote:
> Hi Matthew,
>=20
> On 04/03/2025 20:16, Matthew Majewski wrote:
> > Hi everyone,
> >=20
> > This patch series adds multiplane API support for the virtual M2M
> > driver, along with some minor driver refactoring/improvements.
> >=20
> > I followed the lead of the vivid driver and made multiplanar
> > support
> > selectable with a module parameter, and the default is to use the
> > single planar api.
> >=20
> > Although there are not yet any pixelformats in the driver that make
> > use of multiple memory planes, adding support for these should be
> > easier now with the API level changes taken care of.
>=20
> Are you planning follow-up patches adding support for at least one
> multiplanar format? That would be really nice.
>=20
> Regards,
>=20
> 	Hans
>=20

Yes, I currently have a WIP patch series to add support for all of the
formats that vivid currently supports to vim2m. It involves a huge
refactor though, so I split the groundwork for supporting the multi-
planar formats into a separate patch series first.=20

Best,

	Matthew

> >=20
> > v4l2-compliance reports the following with multiplane support
> > disabled:
> >=20
> > =C2=A0 Total for vim2m device /dev/video0: 48, Succeeded: 48, Failed: 0=
,
> > Warnings: 0
> >=20
> > and the same with multiplane support enabled:
> >=20
> > =C2=A0 Total for vim2m device /dev/video0: 48, Succeeded: 48, Failed: 0=
,
> > Warnings: 0
> >=20
> > Patches need to be applied in increasing numerical order (Patch
> > [3/3]
> > depends on [1/3] and [2/3]).
> >=20
> > Since the multi-plane changes had to touch a lot of the driver, I
> > did
> > a basic regression test with the following script which generates a
> > test input image with vivid and an output image from vim2m for each
> > supported format. I confirmed all outputs visually and verified
> > they
> > were identical to the outputs before the change. Testing was done
> > on
> > an x86_64 qemu image.
> >=20
> > #!/bin/sh
> >=20
> > # tested with HDMI vivid emulation
> > # modprobe vivid num_inputs=3D1 input_types=3D3
> >=20
> > vim2m=3D/dev/video0
> > vivid=3D/dev/video1
> >=20
> > width=3D640
> > height=3D480
> > out_width=3D320
> > out_height=3D240
> >=20
> > capture_formats=3D$(v4l2-ctl -d $vim2m --list-formats | awk '/\]:/
> > {print $2}' | sed "s/'//g")
> > output_formats=3D$(v4l2-ctl -d $vim2m --list-formats-out | awk '/\]:/
> > {print $2}' | sed "s/'//g")
> >=20
> > # Turn off text mode so that images will be identical
> > v4l2-ctl -d $vivid -c osd_text_mode=3D2
> >=20
> > for ofmt in ${output_formats}; do
> > =C2=A0=C2=A0=C2=A0 # generate input image
> > =C2=A0=C2=A0=C2=A0 inname=3D"${width}x${height}.${ofmt}"
> > =C2=A0=C2=A0=C2=A0 v4l2-ctl -d $vivid -v
> > pixelformat=3D$ofmt,width=3D$width,height=3D$height,field=3Dnone \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 --stream-mmap --stream-count=3D1 --stream-to=3D$inname
> > =C2=A0=C2=A0=C2=A0 for cfmt in ${capture_formats}; do
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 outname=3D"${out_width}x${ou=
t_height}-out.${cfmt}"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2-ctl -d $vim2m -x
> > pixelformat=3D$ofmt,width=3D$width,height=3D$height \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -v
> > pixelformat=3D$cfmt,width=3D$out_width,height=3D$out_height \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 --stream-from=3D$inname --stream-to=3D$outname =
--
> > stream-mmap --stream-out-mmap \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 --stream-count=3D1
> > =C2=A0=C2=A0=C2=A0 done
> > done
> >=20
> > Matthew Majewski (3):
> > =C2=A0 media: v4l2-common: Add RGBR format info
> > =C2=A0 media: vim2m: Simplify try_fmt
> > =C2=A0 media: vim2m: Add parametized support for multiplanar API
> >=20
> > =C2=A0drivers/media/test-drivers/vim2m.c=C2=A0=C2=A0=C2=A0 | 327 ++++++=
+++++++++++++++-
> > ----
> > =C2=A0drivers/media/v4l2-core/v4l2-common.c |=C2=A0=C2=A0 1 +
> > =C2=A02 files changed, 274 insertions(+), 54 deletions(-)
> >=20
>=20



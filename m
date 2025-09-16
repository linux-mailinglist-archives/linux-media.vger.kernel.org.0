Return-Path: <linux-media+bounces-42621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E30B596BB
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 14:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EE6C1886376
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 12:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918D821D3DC;
	Tue, 16 Sep 2025 12:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YZUGGlYc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9294D1CAA7D;
	Tue, 16 Sep 2025 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027379; cv=none; b=SMqvYaFPliuiwa/Iea0pmrh58pIdbS9rIFuOEGC2nVZe5OroMla6BVQZ5JFHliODTw8agC3ClxTRKvU1EDXyvzzt+iAiRFlLUJLtBc/5U6W8yBQWIWCL0KSeJbzHaVzoe3+iSF4kUTjuW5isFUF8q9r+430yEMmRYgPDNkm8CdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027379; c=relaxed/simple;
	bh=Pj2YVYTr06wygdiUW7bh8cdApHVt9jxfnh+u+lUkHZM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=k2boqSTPK7b+I0rM5VWQXhClyEim+baHdLjwTAcYiPj8TZi7LSo87dT1/YQRaYrEIvzSFb47tDqQp0B+A6LnMnQxpmm4q7rzkC6ILCURB60DTuyG9qsDO73Y6OAkK/HbuL9vlEfRcXXwzJStqrbQWiVLy5Wg9siYxi5/OcvvHbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YZUGGlYc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B802C6F;
	Tue, 16 Sep 2025 14:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758027297;
	bh=Pj2YVYTr06wygdiUW7bh8cdApHVt9jxfnh+u+lUkHZM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YZUGGlYc3UGZtXKJYr4A5vR2uDMBDG9a+QVVsHOJZRtqsVmIS/Tu/gQo0ZipUrrFp
	 JeWW3txLez23b/HeEuzyPWP5vVq/iGaf+citCh3ncluxZ1PlTK9k5AofH5i8yMEzuc
	 Tr4Myj7OHxK4R2PifgUWNrW2hxriMBy/PxgV6LmY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250829101425.95442-1-tarang.raval@siliconsignals.io>
References: <20250829101425.95442-1-tarang.raval@siliconsignals.io>
Subject: Re: [PATCH] media: rkisp1: Fix enum_framesizes accepting invalid pixel formats
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Tarang Raval <tarang.raval@siliconsignals.io>, laurent.pinchart@ideasonboard.com
Date: Tue, 16 Sep 2025 13:56:12 +0100
Message-ID: <175802737238.1246375.11921455447379092868@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Tarang Raval (2025-08-29 11:14:24)
> Reject unsupported pixel formats in rkisp1_enum_framesizes() to
> fix v4l2-compliance failure.
>=20
> v4l2-compliance test failure:
>=20
> fail: ../utils/v4l2-compliance/v4l2-test-formats.cpp(403): Accepted frame=
size for invalid format
> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: FAIL
>=20
> Tested on: Debix i.MX8MP Model A

Tested here also on a debix board running v4l2-compliance before and
after.

Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Kernel version: v6.17-rc3
> v4l2-compliance: 1.31.0-5387
>=20
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/dr=
ivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 6dcefd144d5a..107937b77153 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1383,6 +1383,9 @@ static int rkisp1_enum_framesizes(struct file *file=
, void *fh,
>         };
>         struct rkisp1_capture *cap =3D video_drvdata(file);
> =20
> +       if (!rkisp1_find_fmt_cfg(cap, fsize->pixel_format))
> +               return -EINVAL;
> +
>         if (fsize->index !=3D 0)
>                 return -EINVAL;
> =20
> --=20
> 2.34.1
>


Return-Path: <linux-media+bounces-12790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AAE901850
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 23:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 620FB281456
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 21:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5604F5EC;
	Sun,  9 Jun 2024 21:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbFNo2dd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542041865C;
	Sun,  9 Jun 2024 21:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717968920; cv=none; b=JHPA64nIMna3JiL1bcwsT8moZsi/Ul120h+DlTxxJjjO0UqVQWg6YRvzJp+bhB1rtbavd3iPbZ9KIdmx/YBBJxwadZGnXxPp2ynVa3gVI1/airHRAnFZxJdasp5NHv8jtzcLOtSD2n5oYosovA2jmOuRMJsrSAZ8AQR0vrXHsQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717968920; c=relaxed/simple;
	bh=NggCni5/L5cTBXUIBFqY3F7gjWHq0T3xTvnizjfd+xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oz1ZDK0eOEJaVTKPRSRr4ZbfbKi8lDTz5WAYLMd8AcWozsigSmxWNBULcPH8FkYAu/Nuxj+stgWognoPSACPaSvVzydTVe9oDsM/UYdx40pyTcWiFiKdH9ilQYCf/W9J3jmOKkUDTsAv24juk6KVW4CwYBTvyBAOuoLhkVQIlJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbFNo2dd; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c2c6277ef3so1667863a91.3;
        Sun, 09 Jun 2024 14:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717968918; x=1718573718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndimQ1augEQsEDnmgHlTCdtF4xCjGs49iTEPiAaTzOc=;
        b=MbFNo2ddgb+8rPTG/JgLoLW0GOb41FTMDcAX/YtAf0OQSapQeHHJ9VXJp67cDXysxs
         Ht+um1DMf+fc2fSs2rAPOQeLaTAocF/zZ2UErqUobOZXh5/DgG2jQiIpQotycFVvz2zb
         HYwhnhY5WkWK7xt7/HsPP4n6AF72NlvY9482g6/+dJSQonHKrNzyfu0bKwTlnhgwJ5aO
         9q45XlVzwUl9wYAbvJXCtOuslh01bgzHKgbgucpBtLyVk6Cb7NBQDUOnEJx313s48cvp
         iro2kzXfuDR1LgKAkRI6xHo7lm7ZO066BZuUe4ISWiUao2w3Lagx8IWwirMHMSstCFHg
         pCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717968918; x=1718573718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndimQ1augEQsEDnmgHlTCdtF4xCjGs49iTEPiAaTzOc=;
        b=Q3gTupGjI9PtUY4cNBHs6kocySupxYBtr012S481CGf7S07XJM3u/TvCpjDdDcPDmP
         KAh9A+/aEPef0+5DQJM7XPEMzlhXKyr7ulep+FCD36I4pdAVZfItav91laPvEtTErV5/
         YKh1IaM8LTXTaLOjcWWfqXaCvCI3ckN/c2Se6sJjQ6CUw08OEb3Xp5/nFcTdoF4IfiAY
         vJJfnAWFTGPMZhWuO4HQfMH4FLjz6s7aL5dse22qMZ7rpI3DUDA/A+d4mnpcADHwzE5F
         L6QjSnKg+JEfws7orW8hfxsn+2I6tdO6eRC2XJ+O57ufd3oxfGfB9kPBkJFbb+bMV2ME
         WkQg==
X-Forwarded-Encrypted: i=1; AJvYcCUb51PC85jtoCBHZ4RmfbF5C/p1YpHc+/9tDUUvyAPmLPc1Px7mT3bx+mD4ipdnt3DRBK10Fpde/ox5c29dW6dXwqQvcVoBRhJFoPvK
X-Gm-Message-State: AOJu0Yw1tAXCabI6blHGk9TXEgMri/EjK+d71osNLpJEY6ZIGlTcmenr
	ojYfJu24/SrQP9AofVxzbSUZSB57SkPWJN9pv8b4P+5dbdgInEpIimL9w1T/L6nzQ6rNX1Ql6kj
	2d45+HS/v5+727vR3qHZKBtsJ5pQ=
X-Google-Smtp-Source: AGHT+IHN82ILqx4FIWAjpnnC2lPxptbeDHkrLfgro+IoLeVx+9scx89ri565ooDtjx6Wqeih5K4n1sY+2L0D3cT9oKA=
X-Received: by 2002:a17:90a:ee45:b0:2c1:aefa:1e7f with SMTP id
 98e67ed59e1d1-2c2bc9bb6admr6678570a91.3.1717968918503; Sun, 09 Jun 2024
 14:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240607-trimmer-pummel-b452ed15e103@spud>
In-Reply-To: <20240607-trimmer-pummel-b452ed15e103@spud>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 9 Jun 2024 16:35:07 -0500
Message-ID: <CAHCN7xJgjRwBUwy9LgRObTUXUnp9dWDJD9Z9hnZbN9S1h1dR_A@mail.gmail.com>
Subject: Re: [PATCH v1] media: i2c: imx219: fix msr access command sequence
To: Conor Dooley <conor@kernel.org>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andrey Konovalov <andrey.konovalov@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 10:50=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> It was reported to me that the imx219 didn't work on one of our
> development kits partly because the access sequence is incorrect.
> The datasheet I could find [1] for this camera has the access sequence:
> Seq. No. Address (Hex) data
> 1        30EB          05
> 2        30EB          0C
> 3        300A          FF
> 4        300B          FF
> 5        30EB          05
> 6        30EB          09
>
> but the driver swaps the first two elements. Laurent pointed out on IRC
> that the original code used the correct sequence for 1920x1080 but the
> current sequence for 3280x2464 and 1640x1232. During refactoring of the
> init sequence the current order was used for all formats.
>
> Switch to using the documented sequence.
>


Tested-by:  Adam Ford <aford173@gmail.com>  #imx8mp-beacon-kit

adam

> Link: https://www.opensourceinstruments.com/Electronics/Data/IMX219PQ.pdf=
 [1]
> Fixes: 8508455961d5 ("media: i2c: imx219: Split common registers from mod=
e tables")
> Fixes: 1283b3b8f82b ("media: i2c: Add driver for Sony IMX219 sensor")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I got the report of this third hand, I don't have a device and can't
> test this. I do wonder why the RPis get away with the sequence that
> seemingly doesn't work for the guy that reported this to me. My theory
> is either that they noticed the sequence was wrong while adding some
> other MSR access that is needed on this board while either cross
> checking the values written or because the other MSR accesses didn't
> take effect.
>
> CC: Dave Stevenson <dave.stevenson@raspberrypi.com>
> CC: Sakari Ailus <sakari.ailus@linux.intel.com>
> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> CC: Adam Ford <aford173@gmail.com>
> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> CC: Andrey Konovalov <andrey.konovalov@linaro.org>
> CC: linux-media@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/media/i2c/imx219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 51ebf5453fce..e78a80b2bb2e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -162,8 +162,8 @@ static const struct cci_reg_sequence imx219_common_re=
gs[] =3D {
>         { IMX219_REG_MODE_SELECT, 0x00 },       /* Mode Select */
>
>         /* To Access Addresses 3000-5fff, send the following commands */
> -       { CCI_REG8(0x30eb), 0x0c },
>         { CCI_REG8(0x30eb), 0x05 },
> +       { CCI_REG8(0x30eb), 0x0c },
>         { CCI_REG8(0x300a), 0xff },
>         { CCI_REG8(0x300b), 0xff },
>         { CCI_REG8(0x30eb), 0x05 },
> --
> 2.43.0
>


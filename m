Return-Path: <linux-media+bounces-30541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E06EEA936C3
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 14:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ED647AD233
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 12:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DE82741D8;
	Fri, 18 Apr 2025 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="GGnuHJ0M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26B270EAF
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744977723; cv=none; b=DF9q0I/2GSQpw8RD6k8XJVhYtxkxtRLipajn6aDR3vtJRlS2Z1JgV6GUNZsRicqTxmsBgGhojdl0QVcjw9eVw99EelzzO9gUSp1qPapgsvTwQRuzkJrvP4/iQz8obc+06klWIjNSpaoMCqIgDaqjz9nG1ZNpxo5jH2E6ONGKdm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744977723; c=relaxed/simple;
	bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/jiuUWkVoQFJLPMngKMpVnzkuv3TGVPS9DOOWzgSTU6sBe7IeAJpo7KP0h4FTVbciNqKEGpRUm0OU/7FfSm/AKyqIHB0HjrVGSj8RQf5pPrYiI2lE0ZiksW1B3VUljs5x0DDxzbuDmfQA/Bj0Fv/YlyDz0+DH8Qkq5wNabAEqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=GGnuHJ0M; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72bccda48cbso1161296a34.1
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744977721; x=1745582521; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
        b=GGnuHJ0ML8ds0IOu5pxZN771yqriszR/+bXDfmhG9l5hHzouhIx/hgDPcSZgeJBIFy
         2EQaJwRx6LH6KAOC5+u2AfRgISkDd8bG5nLvnkb2QG15a3O+FhcfymMExi6pJG/8H4FO
         +280A0M3KnR0K0kxB+956KGttoBwicMN0Bddgb9Yx9Fqj2jmpSK5rpmWR9bOTroamn61
         fLPh2KMqf9aepkJLcmun92X65pve3K9CaLRZw35OYYFXhLEzkQ/TdqnyMdXBR28Szib9
         RKDbFC1QWkw4jq51b8zpK58SGPT7XYwN1VYHFSB7blLRig32tEZA00qqnGs5p1k58cgT
         IHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977721; x=1745582521;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
        b=EuhEw2jGeG51rUADCA/tMO/pfwQkIKtX1oJ/ZONV7x2HorGaOEf0KZsrE7c7wRQSQj
         onY/u0hoZlbRk1RbMDOWqD2Z8oTWcaXu4BvsK0H/RNPOSQ7fumQUIhADH9AOm0g8ZW5b
         CYPEDZlQkVfyy7gM6DAkjl7rBXU2EdI4p4q1+h9F/1zabYnFSR12QH+6V/He6Jg/uAWk
         qdgwSXSQJElQBoOeWJvIzTKdW2ANDz4JNlOBi9AzzbEMNx6coShalCbF7zs1+qmNkXi0
         Y7gbdE8YnOhqrggE6QXdb6rkIYeotkbs6EJu/QelGjyuPbLJQM7bXAvxS4ZKL6IcuU+F
         2FaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb4eiTzTo50ypUUQx9+jt12uz9sNIo+lJRllE7PDz7Y9gZZAdge8j8LXX0McbqG1t2ZhHMLt8+/Qdt/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiFVaSiJb8WBFaknBg4ely7uzOrAQ/z1Kte++R6Tq3KGFJHeAF
	P4naVrT1a71L9qz2YJ0cL+MvULPM9GsJhhUbvPAV+mItBXoOq+yL0qIquzqYY3Q=
X-Gm-Gg: ASbGncuQ0uh8aiXbcRv+ybB7aHhVsu08ypoBtwULGpCSV/XYv82nmubvNxpKtVI4iKD
	JR02vfL1nR8Ti5x9lxF0S4lNjHYr52TklsgBC+aLcnLi+fSxE5GB2jAzPnYFiU4UA0iYypk0cw3
	GN+8K1lB4dXHv2wseupwJUB0PiSIfkWVJzuoqbRceamFyg4sWBu/Jjp/nU0+m1gpopHt0KjLg85
	2nwiHqCikJbksijF1dNxjX3grjJi7335/2r8cywNUQVENPxwZGnliSLr6S3hWWdGi2bt8gTlqwB
	SSGTSXHDh54UyaQIngZ3ksD90UuMObmIwduR46fyKipYRg==
X-Google-Smtp-Source: AGHT+IFpmEodtbmgdnihqC7sA3nbhK11fYL7TMUIM5m+Rg8CrSkqO37M6jThPDqqOLUcCHvHUJZ9KA==
X-Received: by 2002:a05:6808:8019:b0:401:16e:b8c1 with SMTP id 5614622812f47-401c0a9794cmr981088b6e.15.1744977721359;
        Fri, 18 Apr 2025 05:02:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b324e2sm9870316d6.61.2025.04.18.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:02:00 -0700 (PDT)
Message-ID: <e47bcf7715dc31144b5cb6d81957ab067fdccaa8.camel@ndufresne.ca>
Subject: Re: [PATCH v5 0/5] media: imx-jpeg: Fix some motion-jpeg decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:01:59 -0400
In-Reply-To: <20250418070826.141-1-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ming,

Le vendredi 18 avril 2025 =C3=A0 15:08 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> To support decoding motion-jpeg without DHT, driver will try to decode a
> pattern jpeg before actual jpeg frame by use of linked descriptors
> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
> used for decoding the motion-jpeg.
>=20
> But there is some hardware limitation in the repeat mode, that may cause
> corruption or decoding timeout.
>=20
> Try to make workaround for these limitation in this patchset.

You should maintain a changelog in your cover letter, this way we know
what has been fixed. You may be interested with "b4" tool, with "b4
prep" and "b4 send" the tool will assist you in doing the right thing.

More details on what is missing:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#resp=
ond-to-review-comments

Meanwhile, just reply to this message with the missing information.

regards,
Nicolas

>=20
> Ming Qian (5):
> =C2=A0 media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
> =C2=A0 media: imx-jpeg: Reset slot data pointers when free data
> =C2=A0 media: imx-jpeg: Cleanup after an allocation error
> =C2=A0 media: imx-jpeg: Change the pattern size to 128x64
> =C2=A0 media: imx-jpeg: Check decoding is ongoing for motion-jpeg
>=20
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |=C2=A0=C2=A0 1 +
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 120 =
+++++++++++++-----
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 5 +
> =C2=A03 files changed, 97 insertions(+), 29 deletions(-)


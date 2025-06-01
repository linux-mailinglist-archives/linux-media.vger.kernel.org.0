Return-Path: <linux-media+bounces-33740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38875AC9E4C
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 12:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B5BD3A757A
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 10:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8088A1AB528;
	Sun,  1 Jun 2025 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KGHsw7Uz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB881A238E
	for <linux-media@vger.kernel.org>; Sun,  1 Jun 2025 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748772107; cv=none; b=QfW+tlw86X+7zKH/Q7jfszgbtzGufZ4x+cvFOY0A8RZg1f2SEdnB0XvCbUwpwM0CTNq4jmOyF7q2Yxna9AHy0B0G0a4GfbmvPywOfT5phbsGMJxUpcSY5Xd2XyccrnWgbhl3MnxuP+9TDEKS8KDhFIQZqvkf7YowydjDJ9eqGsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748772107; c=relaxed/simple;
	bh=HAqqkQhnXVAKzdrtZyr3RRPBA83EYmLyR4lq7hAUb2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekybUaQjGVjXIqidctioikzKGoOQUB6EptxG+L5vFu4lKpMyLM4NoTXWtT4FiJzkGLhGYx3JIS6Q/mXV8tj98VTOu4QUqHq9Nv/jOX4W9zmOc4PYE16pisPDNjNKeuGoSeFoqHyTxwz/t+FsiCKFPdL1rr7PxmTH0sLaUZxZI0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KGHsw7Uz; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54e816aeca6so4540675e87.2
        for <linux-media@vger.kernel.org>; Sun, 01 Jun 2025 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748772104; x=1749376904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6fPiywOSKETPbwSw1Rvi5wLhnJZFlc7Zk83IPpMxs9o=;
        b=KGHsw7UzXjakTLNMi/u0lo88Dw9nWxe6oROSuI2MB0XKml6viFr2s9tMpgai+q8rCY
         jtoR3UesyCktD9ksErqUNA/kfJHfafs+zS4+DFWyYYpWhDg69U76BAjyMol8azCqqNHn
         yr3ypg7iNBg1/ZRf4seGCdBvb26KrLLcMfHSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748772104; x=1749376904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fPiywOSKETPbwSw1Rvi5wLhnJZFlc7Zk83IPpMxs9o=;
        b=hxsAbC6Pv7g1/wGLbLTk4rveSMU3pIaisH+F4jkcowa6NZ9+9G4yS7VZmzFnX101Iv
         pYkmZ4NYTdftD3pVzl7GDPoBHNMKUj4C/kwiRHVVkqZUI5tJSSzpvCyDkPy/8QarN9Wh
         sAG/PYfk5OxYKd4IdzOoPP6KBBCawoMyT8DVfSJ0Q/e6O2p6791QeYr7TMom2UEjkNex
         /z5gY23aKk7wLci3YopM2x71ZT/saaez01lYcIn+CAzrXkZREAAEdQDr8NcOQhiMhg9M
         EcCqshCyEBDLFe4SRSE7+NITxKMCbzI1xWaeFQN6Uly3HgEGV1m9/zLzyWs5lS3ozV5U
         upUg==
X-Forwarded-Encrypted: i=1; AJvYcCUsNwdNsk7jgi+PKpQ94KBPOOfZ5vTeMWM6PUx5N8gKXQYq+HvL1jn7tpHBA/pJPDTIGe7yENk9yi2NMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhakK48Y5gmjuWhPsuGaulGIyaBep+c7p/D0vw3IqOJWTFDqIB
	C8KF+Rc6EvdbzDjZ7t50LJN5h76PnOOezwJJctTxUkg931H1Zi6G18PBi6Q/PxLmJH32cRuV7+r
	MF2U=
X-Gm-Gg: ASbGncuk7JEKf/kPKrT22NeWqEyVYbqZGj7VY3tcR4QavIO2fZoUxrp66YtX+bp6/rg
	SZjH9ZaZ8UuguCak8A8i2MGUoa3y514P0CsMXf3DeL01PJyQFz17aGhDsynctnzIiIR7Ju6+iDT
	fnvrZuBkSQ+1olbm6BzlX+c+FN1bRw7EivxdMxJikDLztUR83kT6tkOe3iJUo79X/dPnl8aaGNE
	ja+nxC0MVIXoFaW9gIFCjHhv30nDaBsakER0JMV433wOV6mCW+vYTyktdstoG6IqvY/W724vgrT
	KkAEC/+IMtGuRqAbBRl/UXjt+U2FpPZrnw8vSfkR0BZmcsgk4qOyHHkss9/7B7YAeWpGefmI4Ha
	rPjEiqb0jyYfNfmnf/dRKq/9F
X-Google-Smtp-Source: AGHT+IGYsPVHIO6HG7vkb8Z2ZyGstBYlCIECXDSuHW4u4ckmPZRljai2UGntmoSQul2bILZlmo8kiQ==
X-Received: by 2002:a05:6512:b1c:b0:553:351c:2f3d with SMTP id 2adb3069b0e04-5533b8f3d72mr3218933e87.15.1748772104093;
        Sun, 01 Jun 2025 03:01:44 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d1e9sm1238174e87.25.2025.06.01.03.01.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 03:01:36 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54998f865b8so3292555e87.3
        for <linux-media@vger.kernel.org>; Sun, 01 Jun 2025 03:01:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyTtTUUX4gv/6ufu5sHuyxAcr7+C0RKD3D7g4lsFFAbEjqCD1H+OIqdv3ikjYgCn9m7sivAk0VlshfXA==@vger.kernel.org
X-Received: by 2002:ac2:4c4a:0:b0:553:2418:8c0c with SMTP id
 2adb3069b0e04-5533b93b8e2mr2836561e87.57.1748772095532; Sun, 01 Jun 2025
 03:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
 <CANiDSCsmbiveo4GHX54_q7-1CeKiDAVaGnb8+jsCybM+pyA7Fw@mail.gmail.com> <20250601113425.4d5a3d89@foz.lan>
In-Reply-To: <20250601113425.4d5a3d89@foz.lan>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 1 Jun 2025 12:01:22 +0200
X-Gmail-Original-Message-ID: <CANiDSCt9nGP=r8VxkZH76a1i+xEd+RCJ71=6qx0_iPYdrn+GoQ@mail.gmail.com>
X-Gm-Features: AX0GCFtIPDaP18bEvuALb1ut3l5M3rfFZRAycu45EQi_pjllJ8ZUhbJMMnQNECo
Message-ID: <CANiDSCt9nGP=r8VxkZH76a1i+xEd+RCJ71=6qx0_iPYdrn+GoQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Albert Esteve <aesteve@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	gurchetansingh@google.com, daniel.almeida@collabora.com, adelva@google.com, 
	changyeon@google.com, nicolas.dufresne@collabora.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev, Alexandre Courbot <acourbot@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mauro

On Sun, 1 Jun 2025 at 11:34, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Wed, 28 May 2025 18:23:02 +0200
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>
> > > +static int scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
> > > +                                          unsigned long userptr,
> > > +                                          unsigned long length)
> > > +{
> > > +       int ret;
> > > +       int nents;
> > Could you initialize nents and sg_list?
> > old versions of gcc are a bit picky
> > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/77042562#L4381
>
> Please don't. In this specific case, ret is always initialized:
>
> > +       struct virtio_media_sg_entry *sg_list;
> > +
> > +       ret = __scatterlist_builder_add_userptr(builder, userptr, length,
> > +                                               &sg_list, &nents);
>
> nents and sg_list may or may not be initialized at the function,
> but initializing it is wrong, as, when they are not initialized, the
> ret code shall catch it (and if not, we *do* want gcc to warn).
>
> So, if our CI is warning about that due to an old version, please upgrade
> the version at the CI runner.

The main version of gcc works fine. It is the minimal version (8.1) required by
https://www.kernel.org/doc/html/next/process/changes.html
that  complains.



>
> Regards,
> Mauro
>
>
> Thanks,
> Mauro



-- 
Ricardo Ribalda


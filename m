Return-Path: <linux-media+bounces-30751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665E3A97877
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 23:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 434867A1490
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7866E223DED;
	Tue, 22 Apr 2025 21:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="xECsqvF/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460DD262FF8
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356993; cv=none; b=DFa+YKEK67KRHvvBKkjnhweBKmz3NgOilFsIrLVMcpqqqPtCKM5Pt1D1U2vJ8Dn74M8RdqsrqxDt/7NYjuWwT1fmWCMaEQ2NJKkJ8D+6FmDFvIw1CsuVw7i6e2BFUt1kOhMvadUR4uySsBaEZYEotjIhCHvO71J3HY0WiF5EHvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356993; c=relaxed/simple;
	bh=k2qWAoAh7FbrhsjzDqPPPK9Nre8fNKQvDQg7GZB2jQo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O5qUtZ2KILQ7l9thBLxXRjOUgkokKijGb+7jIVoLZoXQXVYKFjt8+3s8QQJNygxcEZL4rD8x3lxP/mi4juCMw2MOvWbSHL0/pRQH2Jos81O99btWqeQvgwn9l25tu/VjPkZbZe8ZHnacr1YXKGKfpERqr4rQWr3hlAFD+kHanMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=xECsqvF/; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f0ad74483fso64083086d6.1
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 14:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745356991; x=1745961791; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NGSbhZB8ag8p7jHY+v66knIF5zG8Lt6g7GJ9MoKueNI=;
        b=xECsqvF/HPNeSF7xVSOlz2FSXmH9HfZ5y2r1sxnCUl3Wg9uwowOumIJyeS1qsubNhB
         nTcZn4pSL0PfIOok4KqHrewsm6PDZPhNK1vcOzbqLNFp0Bsb0vap07+KV/NpYoweFsQr
         k8Lo9ZF9pYudlLFfXmeBsjRgsYvqefe69IjLkelPFn14MVPWJ85cAreIryqCty0rg0ok
         Yv25j+y8c6YYvxQ/6+ImlAitoq3zVo2F7CU29V2qn4BDG2OarJh5BsDc9Ol/lNKNnq6L
         K+E9Zn4F5VRUad1/sSBh/O97EllqGEuBEotXhMOi2SOxxWPzAPdXAcw26jmMuCsvJE3z
         XkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356991; x=1745961791;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGSbhZB8ag8p7jHY+v66knIF5zG8Lt6g7GJ9MoKueNI=;
        b=qpyOEhvs/7HGMQlkweyQcAaL/XlEnYXAJixo4WmoZpCWJUHuLTefzAdKbPF16Cehsq
         4bZXoelN1FTOrlkiI4B732TNSq2l84NzTomm/fmZwMvMJXsDToftkvqBZoJf/7L3etEd
         Dxw9YFZVTOdhVAwx5sDqlmrvpmlMvnj6r4j/iS+NHGUJ4K1I6FfTwrGPHsmEXk+uAMjM
         WTvIDn/I4tGkN79DU8wuLnjGMAL1kpU9+tKTglFz2LNsdenNvqMDHE5RPdZYRmU4Gg90
         pUF6XLfCGUbOPLEkIuFO+7lXPepsilaz5pOZwQapJpr9EflLkiMO/weQWgGtMo6sRaOR
         ShUw==
X-Forwarded-Encrypted: i=1; AJvYcCWuWE9iNMYFG8/YAl3NgUJGRZ2qS/Au4nYVHr4HQUVQLcFwSlL0U8EMogFBKJgiOzw2Zkr6A9I/nuaQ1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4vg1VRC6q/7Vsy/7AsndkOQLBKqjVzVk8iuVxP7EKwjlRWNrc
	Il2P1a5k0txwi0jmY7TiuB2jbqFRqThCThdYsgGm2QOxyGTj7yd7BVEz0JXoNWE=
X-Gm-Gg: ASbGncvDBJaSg5BtgyMFxK6mGhTib0Jv5+mcm4ThH9kJBQG8Jg/AsjlwnPTipd3HhI5
	kuEJutSgPf65aqWH3DTdv5zO0jxnceDprorAnJZCoEQ6fuYCMsF3lfBUni19XZWnH90R++7emuQ
	0XvRQ7HwFssBsrxXtcSu3OjS3JnJITO3w327liPfCfPrerH/vybIK0AXShhcqhhUCJ7zWXyRloW
	Fk3OlhMnZ+sC9brAW40ali5KEvqz4zY8gInybDhoF5yDYgr3h22Hac/bs/3ijpkEehM0rDT/fi9
	q4VLvTcQRhAF0lN+11Ode4yuq2Rm/HtW6iqzfTbyXW+JLQ==
X-Google-Smtp-Source: AGHT+IF9uypzaq3BBVcupNVm9phJf3EkFEPFQS60GcY07iGqTEuWHuBVOhzqczy1xvt1uMaSYNbYKQ==
X-Received: by 2002:a05:6214:4008:b0:6e8:f166:b19e with SMTP id 6a1803df08f44-6f2c4546788mr247406366d6.17.1745356991131;
        Tue, 22 Apr 2025 14:23:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcfd0sm61986756d6.82.2025.04.22.14.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:23:10 -0700 (PDT)
Message-ID: <99029039e6887b1660c897b25c3792253b477a52.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Slightly simplify vpu_core_register()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Ming Qian
	 <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-media@vger.kernel.org
Date: Tue, 22 Apr 2025 17:23:09 -0400
In-Reply-To: <e59b3387479fcdaa4ae0faf9fe30eb92a8f6034b.1744927294.git.christophe.jaillet@wanadoo.fr>
References: 
	<e59b3387479fcdaa4ae0faf9fe30eb92a8f6034b.1744927294.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 18 avril 2025 =C3=A0 00:01 +0200, Christophe JAILLET a =C3=A9cr=
it=C2=A0:
> "vpu_core->msg_buffer_size" is unused out-side of vpu_core_register().
> There is no need to save this value in struct vpu_core.
>=20
> Remove it and use a local variable instead.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

thanks,
Nicolas

> ---
> =C2=A0drivers/media/platform/amphion/vpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 1 -
> =C2=A0drivers/media/platform/amphion/vpu_core.c | 7 ++++---
> =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platfor=
m/amphion/vpu.h
> index 22f0da26ccec..1451549c9dd2 100644
> --- a/drivers/media/platform/amphion/vpu.h
> +++ b/drivers/media/platform/amphion/vpu.h
> @@ -162,7 +162,6 @@ struct vpu_core {
> =C2=A0	struct delayed_work msg_delayed_work;
> =C2=A0	struct kfifo msg_fifo;
> =C2=A0	void *msg_buffer;
> -	unsigned int msg_buffer_size;
> =C2=A0
> =C2=A0	struct vpu_dev *vpu;
> =C2=A0	void *iface;
> diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/pl=
atform/amphion/vpu_core.c
> index 8df85c14ab3f..da00f5fc0e5d 100644
> --- a/drivers/media/platform/amphion/vpu_core.c
> +++ b/drivers/media/platform/amphion/vpu_core.c
> @@ -250,6 +250,7 @@ static void vpu_core_get_vpu(struct vpu_core *core)
> =C2=A0static int vpu_core_register(struct device *dev, struct vpu_core *c=
ore)
> =C2=A0{
> =C2=A0	struct vpu_dev *vpu =3D dev_get_drvdata(dev);
> +	unsigned int buffer_size;
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	dev_dbg(core->dev, "register core %s\n", vpu_core_type_desc(core->=
type));
> @@ -263,14 +264,14 @@ static int vpu_core_register(struct device *dev, st=
ruct vpu_core *core)
> =C2=A0	}
> =C2=A0	INIT_WORK(&core->msg_work, vpu_msg_run_work);
> =C2=A0	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
> -	core->msg_buffer_size =3D roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
> -	core->msg_buffer =3D vzalloc(core->msg_buffer_size);
> +	buffer_size =3D roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
> +	core->msg_buffer =3D vzalloc(buffer_size);
> =C2=A0	if (!core->msg_buffer) {
> =C2=A0		dev_err(core->dev, "failed allocate buffer for fifo\n");
> =C2=A0		ret =3D -ENOMEM;
> =C2=A0		goto error;
> =C2=A0	}
> -	ret =3D kfifo_init(&core->msg_fifo, core->msg_buffer, core->msg_buffer_=
size);
> +	ret =3D kfifo_init(&core->msg_fifo, core->msg_buffer, buffer_size);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(core->dev, "failed init kfifo\n");
> =C2=A0		goto error;


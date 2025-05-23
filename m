Return-Path: <linux-media+bounces-33298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7C2AC2C8E
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 01:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F97D4A3FD9
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 23:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D9B1F1927;
	Fri, 23 May 2025 23:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ybkvl8V6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA961B0F20
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 23:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748044624; cv=none; b=DefVgawo8AchOWGfplKpQRqaQifmgPioZU50t+qHIymQI6/eCZUVqlS/DMQuQXx47gYOXywawWeMPPS7kYg67kqZQpUTki8BEchz3N3RduFn7dEXVOF/XneiyOmKUPyA3HKeFkaMxzijjk/KTiqdo2FY8/NfoHV1q8GklLQOPBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748044624; c=relaxed/simple;
	bh=6TMOE8tfjhP/pe8QLHmdJ8V7+7q15WDOJwrhvuXiiSs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eayosr514SA9/QY0QkLSM6z0OAhWU3rqu98BLFIRlHoa+zRkSuqlrRXfVACbaULv4rrhVknQkyT9hucgVlBVyHM0hA6CNKlLO6BvtVfwGv4FupSTAT5/eErog6zjogyQN79N2IFtqNRNH1nQoAA9K0AcczKfh9zwhOucYi4rp6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ybkvl8V6; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7cd0a7b672bso21640885a.2
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 16:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748044621; x=1748649421; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1V3jztqEm0v3PJIR69srO63uF29oBzq7VleLsu+OAvc=;
        b=ybkvl8V64KIiwM+Pd7oLY1lZKSH8ULmZMXVTFsCj5as1WSzLg+R6R1HkxgOTva8xP2
         SpCCrOKzYRvAkxGjg/12OMD2IR7UbH4LSxcgXJGJ3wai/cYxUn3/nplXKoCl28vdqDS2
         Zb4lbsp+zhZfPoKUAtWUQs60KVuFbYYXul68fkCue5cLeWCIwERHWzR2EwD/+Vo+2OfO
         jq8m7GWxSJyAmgXxOokl1YxbfvSWzM8zA1eduo9dwkJkhIERsSDYQCaBImp8RcWAL0Kn
         nVjeADp5MuRtyYjH1et/LAex5B41nUlSi8njJq6o/d08K2jaVcdAS9biCXfChuuFHcMd
         k63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748044621; x=1748649421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1V3jztqEm0v3PJIR69srO63uF29oBzq7VleLsu+OAvc=;
        b=sPLLhSh86aiibeLgkKpkFrGs6Nf6GEvvlRJwIJZ8JYnqEmpfS1+Z6uew3f76L7FsFF
         Nl8Ux7vIF1H5kC3vVpfmkZRglMRc81SS9tI7jNPmwXWVcEekEnOOH0U3js1TJVVClVeu
         BDRquK3O1uoALDHHYHbreUDfVsSPg8tmjgzyPDH8iRArqyFWHdTk9VA4r2HrcuaRUbwd
         leY4ye+bhzGlv1QN13UAKhkfTr75eTXlNZPIYpPJUb0ucLeNIh8A6niw57PNUezOgcHm
         GrcNE4TDf3PR4rgOk4oMFeomW+xk2NRPEDTdBEnDDFg43kgiW6yrhT2Ks6AGafQPEl9N
         FR5A==
X-Forwarded-Encrypted: i=1; AJvYcCUQzzgFJFhLFEcZrwf7frMcvnP6wmULS5ycqyQ3KOce2DMa3nE3G73ppQ6oIptj4/56xZ8W2Uy+7FOQvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvBZEFD6GNAmiL7yiMUIwtugBXPGUskCum3lX2XHlRM3CUXavZ
	m2Yp4pwYf9WLGaILnGhrvEoiFoWI9BU+zim9af80dcIOlZlkqSzja1AfU4LrgneXw40=
X-Gm-Gg: ASbGncuzp53vFKRTuFkztvZjFVnlgWlkeqOlmLI48wZ43oJ3gblg/7H5h0Xyra+CrmR
	ITFZ4uBm187sBoVHb4vvGrtfZhBl4m0r3eN9qjYQIiUzR02TOkp9eE//M6nk/kxZuhkvM/19c8t
	+LnYg4EPyxf9Gl7WRL+gnJd54q4ERFMQCo4wjC6BC6bc5gG2KjEb14LWD6aM4Vr8s7HOvg6yt3N
	xowRT+z2Js0sc26ecBpCPFP6FuuBrii0Ku0uYJO6FxD+5Vo0+7ofqYv30btHRR8ProdBU09276S
	zscuyYH96M1O/5gwPszcKDuJWd1fFaI9bQnCGKxl0qD/KuaqGERq/jFL
X-Google-Smtp-Source: AGHT+IF6fgqRDRQ5OBQMveh8h4PNZ39A72J47cOsJyJsBBuyNTZPwp9WTl4uQWPXOOe2jevp6q4Zaw==
X-Received: by 2002:a05:620a:44ca:b0:7c7:a5f6:2633 with SMTP id af79cd13be357-7ceecb6cc93mr218440785a.6.1748044621467;
        Fri, 23 May 2025 16:57:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468ccbfcsm1254223785a.107.2025.05.23.16.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 16:57:01 -0700 (PDT)
Message-ID: <82e84dc1277e08742b8f72c6a6ce475acd6d36d8.camel@ndufresne.ca>
Subject: Re: [PATCH 07/18] media: coda: Add fake IRQ check
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergey Khimich <serghox@gmail.com>, linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Vladimir Yakovlev
	 <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
Date: Fri, 23 May 2025 19:57:00 -0400
In-Reply-To: <20250314152939.2759573-8-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
	 <20250314152939.2759573-8-serghox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 14 mars 2025 =C3=A0 18:29 +0300, Sergey Khimich a =C3=A9crit=C2=
=A0:
> From: Sergey Khimich <serghox@gmail.com>
>=20
> Sometimes we receive fake interrupts. It's better to check
> status register and trace fake irq if occurred.
>=20
> Signed-off-by: Sergey Khimich <serghox@gmail.com>
> ---
> =C2=A0.../media/platform/chips-media/coda/coda-bit.c=C2=A0=C2=A0 | 16 +++=
++++++++++++-
> =C2=A0drivers/media/platform/chips-media/coda/trace.h=C2=A0 | 16 ++++++++=
++++++++
> =C2=A02 files changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers=
/media/platform/chips-media/coda/coda-bit.c
> index 84ded154adfe..3e3bb3d64ec9 100644
> --- a/drivers/media/platform/chips-media/coda/coda-bit.c
> +++ b/drivers/media/platform/chips-media/coda/coda-bit.c
> @@ -2635,9 +2635,23 @@ irqreturn_t coda_irq_handler(int irq, void *data)
> =C2=A0{
> =C2=A0	struct coda_dev *dev =3D data;
> =C2=A0	struct coda_ctx *ctx;
> +	u32 status;
> =C2=A0
> =C2=A0	/* read status register to attend the IRQ */
> -	coda_read(dev, CODA_REG_BIT_INT_STATUS);
> +	status =3D coda_read(dev, CODA_REG_BIT_INT_STATUS);
> +	if (!status) {
> +		/*
> +		 * Sometimes we received wrong interrupts
> +		 * That's why we check status
> +		 * and if one of it is zero - wait next interrupts
> +		 * You need check your HW configuration
> +		 */
> +		dev_warn_ratelimited(dev->dev, "Fake irq status=3D0x%X\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 status);
> +		trace_coda_wrong_irq(dev);
> +		return IRQ_HANDLED;

How often is sometimes ? Does it cause any issues, frame loss ? If not, I w=
ould say
drop the warning and just swallow it.

Nicolas

> +	}
> +
> =C2=A0	coda_write(dev, 0, CODA_REG_BIT_INT_REASON);
> =C2=A0	coda_write(dev, CODA_REG_BIT_INT_CLEAR_SET,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CODA_REG_BIT_INT_CLEAR);
> diff --git a/drivers/media/platform/chips-media/coda/trace.h b/drivers/me=
dia/platform/chips-media/coda/trace.h
> index abc6a01a74e9..15a96bab10ad 100644
> --- a/drivers/media/platform/chips-media/coda/trace.h
> +++ b/drivers/media/platform/chips-media/coda/trace.h
> @@ -10,6 +10,22 @@
> =C2=A0
> =C2=A0#include "coda.h"
> =C2=A0
> +TRACE_EVENT(coda_wrong_irq,
> +	TP_PROTO(struct coda_dev *dev),
> +
> +	TP_ARGS(dev),
> +
> +	TP_STRUCT__entry(
> +		__field(struct coda_dev *, dev)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->dev =3D dev;
> +	),
> +
> +	TP_printk(" dev =3D 0x%p", __entry->dev)
> +);
> +
> =C2=A0TRACE_EVENT(coda_bit_run,
> =C2=A0	TP_PROTO(struct coda_ctx *ctx, int cmd),
> =C2=A0


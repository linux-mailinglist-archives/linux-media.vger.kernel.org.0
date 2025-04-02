Return-Path: <linux-media+bounces-29248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A847A7924F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 17:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E96A3B4E26
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 15:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282AD14F9FB;
	Wed,  2 Apr 2025 15:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="JnhQCe/8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2081F146585
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608440; cv=none; b=DWIeulJY6dxqG4GGKUHLN1GG0yb2MTat5vrrknMwGzwEVs4i1ULIfK+C2uD0E2xFNZuLIr1we4c/5Yvl6LIKyj3dZYgWPsFx7EYkSOmYRMD8gl1ZfCDT5OVsxNF3w3tFhPWbvBissjAchXEX2ZHqOMTjhsRO7LpDJ4hJewyFdb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608440; c=relaxed/simple;
	bh=m8FqCYRPD/ld4g14kTDKwwpuKk7jdYyYNBQfDGTVyiA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iEuo2zJV4I6KE6wSBEA4NiekhxgdJXnUVgTJSiWz01OiMkK3m38lvhkiQk4qDGBECRlZxEYDkRU7Rf8/AkOzCsnxTPHF+zjO8TxpbslZ63zDKVsVw7095bTVCrLPx0msJKUC7pWrimDcFKScpaLV7ftlPe8WhUNVJ8FDaLeu4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=JnhQCe/8; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8f6970326so62838046d6.0
        for <linux-media@vger.kernel.org>; Wed, 02 Apr 2025 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608438; x=1744213238; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSL4oRGEAPHD9iSzx4FRIOJD2xPfGaZhPkphkR7+6y0=;
        b=JnhQCe/8hWac9UyRPioZkA8nFlGO8aaoiifbYrZwB3N4/OvG+JvvtMOqHMJlSQVmgz
         TbX4aM6MnU1RwwH67pdtUGcfDwWpBz5zoQvn9C2QDYmsulZyMacheYvPWrB/1amkdnD1
         rtQFj9wpXUVunIIU5gVcvSIqB5cH3JUhg5mAv3sPxU+bmHkOVH/RtglzYkOoud3RLszf
         ieVe/zFRKdzv/Uz3NQALgisK3mDPTFVfgukXzJMeJbaSiqWxKyxXlFVe95bDq3jpH8qt
         4XHu8/BKJ44bDziTGcvxI5DbqiqT8BQ61gDXTJGcnrnWdrrX8asEFVx2TWoa9P4p5NUJ
         PuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608438; x=1744213238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSL4oRGEAPHD9iSzx4FRIOJD2xPfGaZhPkphkR7+6y0=;
        b=QmMkl7TIjMJXTCxWhM9wJLDXwHKz52JwHRPt4dK/pM/kMQ1y278Zld3GW1dE1f/0Cz
         SCWXHLUgQVydcpvikdqtzxzw7wMJ3NAu1nyv08WdIhGOefoAxavL8z6eJoPK6pSthChs
         uUMEbw1PIe6dQdYDWVJWrCEcsx+EETGmQx+S5try/2krblMuDQU2dUgeNnczmfIHZPW3
         0UprZcFZ8XC57QDnW5FjZiwiV/lNqPh1IuvkczCyKNbHOLYITKpGPd4HEOBtWrGx6mba
         ++vu4mK1XxBv4UgAWmUpX4TgkHbfDtK8N/ZnAFZh7dw2nX511Uau8E7ikcr8wWuPGM/A
         QW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkYbeqwT9fCJ6ZLQ0khycoTqqr8oNw4Xq8xPJuws50qLTr2tp9ZOVgHv2hIsekFx+3ZPDue/ZWxsQrjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLbGqvVqL11ntrLN3+ElnAq+6iQGsVr+A2jSMJLj2F3cBMQuDC
	nFwvJK6GPZZ1xlLD5+HEHE6r5UZmAL4IswpYE8Wd+ZGIlaq17z6XMgIvYPKy1Ko=
X-Gm-Gg: ASbGncvduAoBEASAgPm7CNzyNsTdos9LFUNQwWP/HKW0j67u1/wZoYwxpAmiyuHBblE
	wFGafLCgJZm1YJ+XDydLROVHUIEgj44izXs9f9r74jKVehRkZiH+vjey4beKDQFJUqnasny/QQi
	bb4Qj8dexXYSRWZ46fN8TS49ignH8Bp7wOT0kgSaWiJb6Nc5VavOIie+A7AFxu2YeqkB7BK/RzW
	DMJM6a6SNZLi7jfSAP4qUxvNqaTtkpKud45PT7GnN/2aGGVrOV8HzhQ66Ck4RSzK8vOZNdUG3XB
	It2yL66wGU+X9pCB5+taK/R4jIbF/c8Pqf0rvfSd4Y35kRm9sQ==
X-Google-Smtp-Source: AGHT+IF4Dz/stCS5BEC5GFlEUNzvWwaks8m+IIa7woNJtCMmFQbWLxjNz8YenZdUROs678sB7aZKEw==
X-Received: by 2002:a05:6214:b62:b0:6d8:9ead:c665 with SMTP id 6a1803df08f44-6ef02c92ed5mr46211356d6.27.1743608437967;
        Wed, 02 Apr 2025 08:40:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec965a1desm75344486d6.60.2025.04.02.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:40:37 -0700 (PDT)
Message-ID: <14a86f60d026411eb7e4546b8a4879a90f247843.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-vcodec: Fix reference count leak in
 mtk_vcodec_fw_scp_init
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Miaoqian Lin <linmq006@gmail.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fullway Wang <fullwaywang@outlook.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 02 Apr 2025 11:40:36 -0400
In-Reply-To: <cfc905988dda23078b5086f3eb0975863bbb6c2d.camel@ndufresne.ca>
References: <20250318110556.903-1-linmq006@gmail.com>
	 <cfc905988dda23078b5086f3eb0975863bbb6c2d.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 02 avril 2025 =C3=A0 11:37 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le mardi 18 mars 2025 =C3=A0 19:05 +0800, Miaoqian Lin a =C3=A9crit=C2=A0=
:
> > scp_get() returns a reference that needs to be released with scp_put().
> > Add missing scp_put() before returning error in mtk_vcodec_fw_scp_init(=
).
> >=20
> > Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deferen=
ce in SCP")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> > ---
> > =C2=A0.../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
> > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_f=
w_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> > index ff23b225db70..11ab3bc60217 100644
> > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> > @@ -71,7 +71,6 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *pr=
iv, enum mtk_vcodec_fw_use
> > =C2=A0		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_=
use);
> > =C2=A0		return ERR_PTR(-EINVAL);
> > =C2=A0	}
> > -
>=20
> Might sound nit-picky, but don't do style fixes in patches intended for
> backports. It increases the chance of conflicts.
>=20
> > =C2=A0	scp =3D scp_get(plat_dev);
> > =C2=A0	if (!scp) {
> > =C2=A0		dev_err(&plat_dev->dev, "could not get vdec scp handle");
> > @@ -79,8 +78,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *p=
riv, enum mtk_vcodec_fw_use
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> > -	if (!fw)
> > +	if (!fw) {
> > +		scp_put(scp);
> > =C2=A0		return ERR_PTR(-ENOMEM);
> > +	}
>=20
> With the above style change removed:
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@colllabora.com>

Sorry for the noise, I see that Hans fixed and merged it already.

Nicolas

>=20
> > =C2=A0	fw->type =3D SCP;
> > =C2=A0	fw->ops =3D &mtk_vcodec_rproc_msg;
> > =C2=A0	fw->scp =3D scp;


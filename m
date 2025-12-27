Return-Path: <linux-media+bounces-49602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C576ECDFE68
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 16:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ABF83013964
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 15:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D2C258ECA;
	Sat, 27 Dec 2025 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="St6Nvnnz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6591978F26
	for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 15:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766849650; cv=none; b=V+ryQk2fprITG5VcxmUelz3sscDBctpLaB80ntQ+xV8zOpm8hlFEIcJb61lJwyvKjGDZwhHTEx2kjHhh+3MrC1hY+0RuPFIEjwM2/13aFotrHa99Axj45tD6hqAm/W2P7hbbyJX0Vs87aVQ0G5vlCupeXDdwxdaeeJnGydERDB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766849650; c=relaxed/simple;
	bh=NQxvX3x5mTPTYKHrVRDAHbgDoSQDOwlDQvMBzCndDkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIATLUlYdmH+8e76zxp/tqwrMV7Xm/pO6h8Ar5uPaLLzH9xvxXNoByBlI1UNz133Uo0llwXBsUApTWDEKUK9Ckctpv5OwqzTg/WNyJBjtH7HmCrcBdIogoS2BI1cMP3t+AO1o4PGSY0JEfRWtPoPJIfNkumEuI5ivyjZK+GoTdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=St6Nvnnz; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso9156433a91.2
        for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 07:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766849649; x=1767454449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR8po4wMQCtr4pqMRQrDJXgtKDL3uFWi+WklqGaf9Js=;
        b=St6NvnnzragNaGH14xG3LsGvTtyGa8qRBB0fIXYKGHp+BVUzckNsHf84OR5hVciiPs
         yq4cF9GHfHa5Qe4h40T6Uc++rpHG1xOpIXMbFWxswf3Oj6Gf7fBW6FLPPfOueL9m6NGK
         tAH21lDbio5bVM/Nh3dlo4CxDwsSdJG5fzWte0pMb+eltpms5Av0a+852nPdd8yMOfxE
         Fvj+38QuJuLd/SUB9JG9qPHkqN/PABBTSJc/i2sPBskUENzyfHgyLXnZU5vHMuu74fUg
         buoWU9pgmH+ct8mk9/uuIbrhpPaDhfPbiJez/q5uE5+aFXY4OkDjULphnKxtxALj63W3
         5OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766849649; x=1767454449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WR8po4wMQCtr4pqMRQrDJXgtKDL3uFWi+WklqGaf9Js=;
        b=Q82EpGcHJvtiNowglqVKoPVJ61RZmEmP746SPvoL74XxhPnoxMunXBEdwJ+g6glGxG
         2M3Nw50Es+L3pQm9WTw1NR1sSpt92hQrmwrIimM6Dd2rdMiWt0pRXv7NQQ09C7E/aNBZ
         dfo66CJ/Pk1/+ZqLXyiW2CYOLK5wUNYDwaMw8zZfyjg/TAYnQ1ZlHk5VKYTPSVCwA2Ys
         o7aopYfkUaYovpSJUAlE57wJLXnMzPybC1pl6Yn4sX+N+2sukMSiTblfeAfWZyhWDpfc
         VVbtT79iGKvCkjFjXx9O3qpRnV+sAq/53Di4x6/uycdskf1s6SpHHLGKrHT+dA97qRp2
         sE3A==
X-Forwarded-Encrypted: i=1; AJvYcCVz4gbb8I5tE0q2EfaDsIRV+0HIwCisCB+4gIcuzEKH2TE90JYmrSKPo7mTymbxB2Dh2sDVhuICw3kXeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjmuZLG/l+ilTLnzBhe1CxvJBV+S8uH7m5Knf2CVQAbMaZ0Vd3
	A49ON7QLff5x/BS5t5SqmyNyIyK25ZMxJ//6wbACoXQvCC/8flVF60GFCeNsSVhz7/cAkTdEUC1
	ZU0bEpL8DVYUQnbNyL1e27gQJZWzsnwQ=
X-Gm-Gg: AY/fxX4p1hw6XboS+P5AdMTx2cGbjkPAkZLj+ARJwrPum2RWuKYeY00uxfa9G2JpnSC
	xfCqj53uwAVANGCb7Wy8FqVUHfh18bSe+Vs+SaGSVhq/DGVU/7CJYxtEXNcjxT3ZrP4G1a+Xz8i
	TdT6QYnBq0aYTcuOmvV9Hq536jlWJtdPyTfxEGH6PDlkT9KPWKMguBRpkVYTz7NrZeXn9+mrzqy
	R6xRFmUCX3qPpXQ0n4q+3JNLqp7XLbTr2fKH6JfSpeXOvC0j+Apih2SIYxchCkApabske8=
X-Google-Smtp-Source: AGHT+IE5DYtBJYl10TUXBXy3+f0mRUBJcQtw4g3ss57gq7T6xAuE3sPpG3l4wauq7IqQtjuZux7c/Ckz/JEuRBVOLPc=
X-Received: by 2002:a05:7022:6887:b0:11b:a892:80b4 with SMTP id
 a92af1059eb24-121721ab83amr30442872c88.5.1766849648296; Sat, 27 Dec 2025
 07:34:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227121946.67935-1-alperyasinak1@gmail.com> <20251227130514.GA21104@pendragon.ideasonboard.com>
In-Reply-To: <20251227130514.GA21104@pendragon.ideasonboard.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Sat, 27 Dec 2025 18:33:56 +0300
X-Gm-Features: AQt7F2rO103jEFBGZ1IiFklkHlG984Yl3rCqlhBEhg2YgnVe3_tCRJx_pfWJNXQ
Message-ID: <CAGpma=5i21ObECvQL9EZRQUJ3rfXTZ=78CFkFtLmwoq+Te7c1w@mail.gmail.com>
Subject: Re: [PATCH] media: renesas: rzg2l-cru: Fix possible ERR_PTR
 dereference in rzg2l_cru_get_virtual_channel()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> What makes you think this can happen ?

media_pad_remote_pad_unique() explicitly documents that it can return
-ENOTUNIQ when multiple links are enabled and -ENOLINK when no connected
pad is found.

The return value is dereferenced immediately via remote_pad->index in
the v4l2_subdev_call() without any error check.

While these situations may not occur for this driver, I have
seen other media drivers perform IS_ERR() checks after calling the same
function, so adding the same defensive handling here would be
consistent with existing usage.


Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 27 Ara 2025 Cmt,
16:05 tarihinde =C5=9Funu yazd=C4=B1:
>
> On Sat, Dec 27, 2025 at 03:19:44PM +0300, Alper Ak wrote:
> > media_pad_remote_pad_unique() can return ERR_PTR(-ENOTUNIQ) or
> > ERR_PTR(-ENOLINK) on error situation.
> >
> > The current code dereferences remote_pad without checking for
> > these error cases, which could lead to invalid memory access.
>
> What makes you think this can happen ?
>
> > Add IS_ERR() check before dereferencing the pointer.
> >
> > Fixes: d7d72dae81d5 ("media: rzg2l-cru: Retrieve virtual channel inform=
ation")
> > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 162e2ace6931..bf7d96841c78 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -411,6 +411,9 @@ static int rzg2l_cru_get_virtual_channel(struct rzg=
2l_cru_dev *cru)
> >       int ret;
> >
> >       remote_pad =3D media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CR=
U_IP_SINK]);
> > +     if (IS_ERR(remote_pad))
> > +             return PTR_ERR(remote_pad);
> > +
> >       ret =3D v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, rem=
ote_pad->index, &fd);
> >       if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> >               dev_err(cru->dev, "get_frame_desc failed on IP remote sub=
dev\n");
>
> --
> Regards,
>
> Laurent Pinchart


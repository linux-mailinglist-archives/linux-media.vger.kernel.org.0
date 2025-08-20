Return-Path: <linux-media+bounces-40447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A46B2DFE4
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 750037AD7A3
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD2D30F7FC;
	Wed, 20 Aug 2025 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="ncZKh6/2"
X-Original-To: linux-media@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB10E26E17F
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701331; cv=none; b=ejOmL0Qlz7Tnvp4MGaQL2ACRWoLg36tAw0qLr4lo2mM91dgAbW3SCEl9jKWU3VzW/OwGpRAiUOHD4J18gG0mKY0cDYckW7h5suAF9vrYV0PNSuPLlTGrFhKcu5RBNdGBjYGmrTclEgWzuBnqcDkILsRrhwhWlDOMNKLIpM9xW8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701331; c=relaxed/simple;
	bh=4qmTb8wWx4lwVM7H5BVt74kKN5x1ueUsRy7l9WSpIws=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Alb5GHiJF7xZ9L8dq5w9ochze1nbM0d9QWYcwYhb/JLLI9drxhweatyeZxfaiqsCctU6TSACbsQt/9saaEXU8Zrbd+oVhR0gPL8kWFJSGFSLTA4BeH2cQjh6begbxxQGLf/cOnwfe2ziSS6baO+ByAuD9rfcU5u56sl55UzrpTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=ncZKh6/2; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 0EFB0240103
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 16:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1755701320; bh=Ht4yfG3vGqY4d0zoRqc/dtklOJvqY4LMyfDONnGbWkw=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=ncZKh6/2dWErpTgJdC4tPNibgXi5OxkSuEN+v53adRcnR5WsYM9M08TTM6dSX7DBf
	 0vVw+c2IuXIznbJRxtZ51a4kN68gS2uv90mva+HGH0ujoQDcwHY8xRSd69SVmXu8aJ
	 hZLA/Jg2skFxIg8KEi8lHNjw0fD+Xav4q65FywxM8SingyY9/WQiCM6AsL0p4tdtNU
	 egbUStUHVoeIuhgn6aWCWmJulSE1l8XTQpIPpcdvm81ZqvwpAEWxc+sf/r+BbJobRD
	 ABAFdtVQQXVdpFIIOFxdabV+/IX3yLyqt7VBttwslGwq5OpZ7FsSsm5w8MbOqXriOI
	 jc58MtlD62bdQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4c6Tpt6lB8z6v1T;
	Wed, 20 Aug 2025 16:48:38 +0200 (CEST)
Message-ID: <8bd925340d6297bcae69f4a9b5e098e79830b528.camel@posteo.de>
Subject: Re: [PATCH 1/2] media: mc: Fix MUST_CONNECT handling for pads with
 no links
From: Martin Kepplinger-Novakovic <martink@posteo.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hans@jjverkuil.nl>, 
	Maud Spierings <maudspierings@gocontroll.com>, stable@vger.kernel.org
Date: Wed, 20 Aug 2025 14:48:39 +0000
In-Reply-To: <20250820140021.8026-2-laurent.pinchart@ideasonboard.com>
References: <20250820140021.8026-1-laurent.pinchart@ideasonboard.com>
	 <20250820140021.8026-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Am Mittwoch, dem 20.08.2025 um 17:00 +0300 schrieb Laurent Pinchart:
> Commit b3decc5ce7d7 ("media: mc: Expand MUST_CONNECT flag to always
> require an enabled link") expanded the meaning of the MUST_CONNECT
> flag
> to require an enabled link in all cases. To do so, the link
> exploration
> code was expanded to cover unconnected pads, in order to reject those
> that have the MUST_CONNECT flag set. The implementation was however
> incorrect, ignoring unconnected pads instead of ignoring connected
> pads.
> Fix it.
>=20
> Reported-by: Martin Kepplinger-Novakovi=C4=87 <martink@posteo.de>
> Closes:
> https://lore.kernel.org/linux-media/20250205172957.182362-1-martink@poste=
o.de
> Reported-by: Maud Spierings <maudspierings@gocontroll.com>
> Closes:
> https://lore.kernel.org/linux-media/20250818-imx8_isi-v1-1-e9cfe994c435@g=
ocontroll.com
> Fixes: b3decc5ce7d7 ("media: mc: Expand MUST_CONNECT flag to always
> require an enabled link")
> Cc: stable@vger.kernel.org=C2=A0# 6.1
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> =C2=A0drivers/media/mc/mc-entity.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-
> entity.c
> index 04d69f042a0e..928613d60e8f 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -696,7 +696,7 @@ static int
> media_pipeline_explore_next_link(struct media_pipeline *pipe,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * (already discovered through iterating over links=
)
> and pads
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * not internally connected.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (origin =3D=3D local || !local->num_links ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (origin =3D=3D local || local->num_links ||
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !media_entity_has_pad_interdep(o=
rigin->entity,
> origin->index,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 local->index))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0con=
tinue;

hi Laurent,

Indeed this fixes the crash I see without checking
media_pad_remote_pad_first()'s return value.

Reported-and-tested-by: Martin Kepplinger-Novakovi=C4=87 <martink@posteo.de=
>

Thank you very much!
                         martin



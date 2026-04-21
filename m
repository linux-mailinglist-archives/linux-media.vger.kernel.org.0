Return-Path: <linux-media+bounces-59206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDpBAdxK52lW6QEAu9opvQ
	(envelope-from <linux-media+bounces-59206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:01:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ABF4393EC
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1B67305D16E
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 09:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AAE3B19B2;
	Tue, 21 Apr 2026 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwPvT1z1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABC42C11D5
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 09:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765377; cv=pass; b=ZXsNyHNnt9MZLfy0+tY+Goym9ciEaLh+c3iXufzXqYia5Uosx0LrjSDRUTBtWncIY8ZOiJXrOlICa1f0FtkN9EnZPmKDY05azKqKL+6abSclREoRz3Etuis5YeUIHDJnbt5dMZcreJ8YsGaWtamc1z2R6URc24AYZp6mIdl5J88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765377; c=relaxed/simple;
	bh=l4DrSR2BZIgYH4d/QUNDql7H9ZjohL0n1yHLRqh+zKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqYaHiuZVKSXBMoQxPan9DGUnkIEhM1cTfAA+jbg7Ylo8XEgVO/c14jq75CRmTkmSSz9B5s5xgWq2ls+xyhwN4gwsUanqVxy1RkayPAQNY7B+ftdUVRrx+3esh9FEy4hFh00GuMa79XMg/zTLZY2/BOF34s77mWFvipR4iX4Sg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwPvT1z1; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d73352cf2so3403163f8f.1
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 02:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776765374; cv=none;
        d=google.com; s=arc-20240605;
        b=bzGf7bgNz2h6GrFkzVSaMb6BGETMgWJgpieU68XZICdmFBTthjWEzUZJ1mfIpfovzN
         05YttzSXtyhLutf3dWkRbIQUstUj/d7fckfd1ktSOpaMlGJuU2pQMKjQ26Yw2bWzpbG6
         6Oxu3O0c335O2xbdVRWoOVGFwLvhbFDuMOSjDRxTdaX+CMayWZVDT6pnp0wZKJsdt8dq
         Xinhqw+jTqqkXtdGcTHhMELpKXM36kMqFGgzk1gslfd9kKZUWUM9BuHxSbblLjZ9Fs5L
         ahoRKub+eYeJBKAlarpqlKrLurq+5QZnjhE2aU3n96RTVELZzlli19MjLQMQ3VmTptxz
         IDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fgT8kupPOa4t9aiolsgihVHR1feSg5akKNJAdNp7y9I=;
        fh=eKV5/S8uTT7h90aVzrKR3xbJgx59ApdpnAXkOIEdc1I=;
        b=X02OxM9UxhPmJhqas61JzwRIdoQjedfi1VvDJgoQuFkExisSiuoIpf346Qb6sAlhKr
         mLwhF+e008k/UEE3TNUjHvE/0DnCMZN6ldwPoMFaL+M5HTo00o1Uth1gTt+qY/KWeAs1
         CKcI7FSSXNIS270Dghv0YucezipIeMLQGoBnMaAKXvrzH/UcJOBHqNJOqqpER6yiKAqU
         Qa4oPNY1TiN8yApVK9TqwfS9cOzqRF406PAvaQynyISK1oW4Rtfqk2U91lBQlTpHNQdf
         R25c1Slxr02yJnaMh6AkIszsCkYlDZoOh1cZyr7xr0isdyxmyHX38VR7g7CI56WasqTL
         INWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776765374; x=1777370174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgT8kupPOa4t9aiolsgihVHR1feSg5akKNJAdNp7y9I=;
        b=cwPvT1z14F2OarczFIEf4OqhgNp82scAsR40/zLKQWW6prJBt8/yulk6qnZD66iIkr
         l6YlhSkFXZhIGNbC0D4Eb/SQ8iuLrmBk8nAW8AHlUpkHCRF0aCstrj3AgPKzxpL4QUl0
         w9orggW9dVrLC5i5sld7L7b33/htBJDRTTzL86hNqjYn8oCQIY4weQh3Eo4/EriA36D9
         RNn5A92qgUgpUu1ytLB0UlQS1rRS/54IFsFua0v2LrqIfYs4zJLFKb/nWvyl2wnx0LY6
         iwq47wrNstLQOrAw2M8Po5Un7w59FCMzUBo4AT22HnGOM49+Gl7QPBz9MdiYDHHzfIjZ
         ZYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765374; x=1777370174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fgT8kupPOa4t9aiolsgihVHR1feSg5akKNJAdNp7y9I=;
        b=mbKPu7qs/rhHfwCMl8Y+AQ7pQDsQugBSqPa844698WFAjEN05Mxj2Sz+xtSGXWOS/+
         0R4RR4ioIKR8eTz5Pf+cR1phfOgQvlr3DQhnXUPnB9eVIIasR2mb+CXZ2cCRSu32Pwwb
         qJ/Ltbn2GoDaTn7F2Sz45z/20C0sz0H69R2wPuEybHaADTV5C69VTFOS+VnTzZfhhuSB
         yDlqWMOvDn7yIe9WaSAG5TggXsx1OB3UY+m4YsAEGqfPsytWH6HcZN4xCfnEn1JlWtCH
         U4/el5V9BBy1Lsuyb5yGk93vHj1v1zVXCIMd/CiZY6CM84KelYslkCmsHzyTrZueQOUh
         kiDw==
X-Gm-Message-State: AOJu0Yw9g2IH3DzzKbLBq5CVBb+HtmN7FOoGbloIB8XAl78CWI0q9VkY
	vtQwYQMqIAg8HtFFswH85gzx894fbWnnJ9TRJdYBpZ4d1m6DPSR0jnzrdyt5gpS4J07v6YqABFa
	G9pIBG6x4o6v8WYQYkiir1MnegsTyu8pAyy59
X-Gm-Gg: AeBDiesbqT3fAX9engsGBZpP6zMemRFeNCMF94tf6COGMzRWD1fMExR/afxERexWBcd
	M9AiOiRAQ/+icDC5B7XFJiaIrmsRfxg2nMKJcjJXsMMynkdePbNPnxYhoNXyL9E4G2jB7WBS5EQ
	ICg35DX+tv9bveMHxmRWhFHSZy2mLLB8oqeSskl0kWiI7uR7eHVbrIAdioYviRUL5es3fK6aERt
	wxti1MF3leqIX65jkBCFG/ji3+HWKOLEZlLtnvFhvMvHP9SQce48AAJf4FscDqcmXqD5/KIUEBp
	9iFPh3y08ET81XlbUt5F4TbwyxF+0zI0NRyvwK9paCbnh2jNykqr3QeMetCZQDTkWeSJnro1H4x
	enmNME/wvkZTcxxc=
X-Received: by 2002:a5d:64e4:0:b0:43c:f7e5:817a with SMTP id
 ffacd0b85a97d-43fe3dd4b72mr26892067f8f.19.1776765373943; Tue, 21 Apr 2026
 02:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260318235907.831556-8-laurent.pinchart+renesas@ideasonboard.com>
 <CA+V-a8t481xuwava0nb7uY9CUPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com>
 <20260416211139.GC1824072@killaraus.ideasonboard.com> <20260420235742.GA2315844@killaraus.ideasonboard.com>
In-Reply-To: <20260420235742.GA2315844@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 21 Apr 2026 10:55:47 +0100
X-Gm-Features: AQROBzBoNRQ5n8fSx0jYvJE8eFj8QDo4AVBQM3KMDxf3renBbaMZmEtBBxZLrkA
Message-ID: <CA+V-a8sfM6ujv5b1+CnkSM9Lnsax6-qG4HZTc+qy0PaDcZnGLA@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] media: renesas: vsp1: brx: Fix format propagation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59206-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[jacopo.mondi.ideasonboard.com:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 68ABF4393EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Tue, Apr 21, 2026 at 12:57=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Apr 17, 2026 at 12:11:41AM +0300, Laurent Pinchart wrote:
> > On Thu, Apr 16, 2026 at 06:49:14PM +0100, Lad, Prabhakar wrote:
> > > On Wed, Mar 18, 2026 at 11:59=E2=80=AFPM Laurent Pinchart wrote:
> > > >
> > > > The format width and height is never propagated to the BRX source p=
ad,
> > > > leaving its initial configuration invalid. Propagate the whole form=
at
> > > > from the first sink pad to the source pad instead of only propagati=
ng
> > > > the media bus code. This fixes compliance with the subdev format
> > > > propagation rules.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonbo=
ard.com>
> > > > Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > > Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> > > > ---
> > > >  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++++++++--
> > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drive=
rs/media/platform/renesas/vsp1/vsp1_brx.c
> > > > index dd651cef93e4..911359faa600 100644
> > > > --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > > @@ -156,14 +156,20 @@ static int brx_set_format(struct v4l2_subdev =
*subdev,
> > > >                 compose->height =3D format->height;
> > > >         }
> > > >
> > > > -       /* Propagate the format code to all pads. */
> > > > +       /*
> > > > +        * Propagate the format code to all pads, and the whole for=
mat to the
> > > > +        * source pad.
> > > > +        */
> > > >         if (fmt->pad =3D=3D BRX_PAD_SINK(0)) {
> > > >                 unsigned int i;
> > > >
> > > > -               for (i =3D 0; i <=3D brx->entity.source_pad; ++i) {
> > > > +               for (i =3D 0; i < brx->entity.source_pad; ++i) {
> > > >                         format =3D v4l2_subdev_state_get_format(sta=
te, i);
> > > >                         format->code =3D fmt->format.code;
> > > >                 }
> > > > +
> > > > +               format =3D v4l2_subdev_state_get_format(state, i);
> > > > +               *format =3D fmt->format;
> > >
> > > When running kms-test-plane-position.py (from [0]) on RZ/V2H EVK, Im
> > > getting vblank timeouts as seen below:
> >
> > Oops :-/
> >
> > I'm run the KMS tests on a R-Car board when I submitted the series. I'l=
l
> > test again tomorrow.
>
> I have been able to reproduce an issue with the same test script. It
> doesn't result in a vblank wait timeout, but in display output
> corruption. I'll investigate and fix it, and hopefully the fix will also
> address your issue.
>
Thank you.

Cheers,
Prabhakar


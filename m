Return-Path: <linux-media+bounces-64639-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JqwML8yuK2pEBwQAu9opvQ
	(envelope-from <linux-media+bounces-64639-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:01:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18227677139
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:01:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=PblxrqjE;
	dkim=pass header.d=redhat.com header.s=google header.b=Z3JDw3Ze;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64639-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64639-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E37533367CE
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 06:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF0A3D5247;
	Fri, 12 Jun 2026 06:58:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259412D94BA
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 06:58:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247520; cv=pass; b=FDExADysBDbc9mYC8RMmDKwwIjWUOXyXoNX69c2wmUHLMKYu/kLh+7q0u3JgVlMT0XCD0kGwrEOunquosxw0h2pZ5zWfqwhi702L+T8cXTTdZu8yj+HzuCY+MgcVdXxhs1vKHqXxbIbUA3inHbp2StDY/n8sSQtMQulcOSnrEhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247520; c=relaxed/simple;
	bh=9iTtsRfV/ytmYI7MXQ7lfvEG3TaAh+dPM+IB3uVLgCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITB9ma1SR8OWxQynXPsC3U+u/T/JSAun2JT7gp4WlYi7EfC4snh4Gpi6c4yACxHbi4+LWBmnJXJe++O6Sq5feX6QAavAtinkXHoUEAC20FPW7AhWy0Su3jnFlOZR4EXCbRf+FCOX0RD+tzGQ+//LQ8mwaXnibpLUoGUuraJEbaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PblxrqjE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z3JDw3Ze; arc=pass smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781247518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qVUbJnG3avAuh7auohauigxG3CJwfmr9boX0BMo3xuo=;
	b=PblxrqjEGXxUYHZN/59T88deZk/N8TRQNUkeVVU8U6rGwmwrSuNVhsJll4jZUnAniGTgp5
	vzCWs+ZZCRNkW8CSI3Rx8sFKjUfsOBb9OAlTtZmv9dkQ0MntI9kL9Jz1NxKea1LePPhhRE
	5P/YX+HYpkYsI0nVRgUZvcvQ1CBjXjY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-62X2MGVQPaijY0D9VcikIg-1; Fri, 12 Jun 2026 02:58:35 -0400
X-MC-Unique: 62X2MGVQPaijY0D9VcikIg-1
X-Mimecast-MFC-AGG-ID: 62X2MGVQPaijY0D9VcikIg_1781247514
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4863a0c3105so1018589b6e.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 23:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781247514; cv=none;
        d=google.com; s=arc-20240605;
        b=YAg62QvrhD+ioAVGxr3NWPDV3dtn6807X6SPJy+JD6pBa6uJKlZ0a6cAl2Wkc4DJgb
         saIjyda+4hKhAsbbOV+LgvDeMIBJulGSvSa6I+F31CeX+pHi09nNoeOhd1Svgtw5LXkw
         4dTxNU4kPDaEroRostd5vuD4QsXDSttbwAlTqNr6Zq6bZBuROKg0gzJcZPh2EVgk2UUy
         on6jgA5gtB9sKVG9pMPn3GRSpyBFemCjw+9IED+8eIpnqIX6DvTtEr74Zhznp34jKWKZ
         jM/l9WjOCKgHvYeWEJj8GoiC41zZ0uhgMBs6AmLMa5l1jTZ0V0fC4A6Xfq7Worn02/+l
         03gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qVUbJnG3avAuh7auohauigxG3CJwfmr9boX0BMo3xuo=;
        fh=dhwPSYiUjYKYrVVo2V0VEAUyQ6xze8M5kL2+GPK5olo=;
        b=g79VHNgzHugUj/e0un9UzjbGAkiVXpAkx+sB5qGArmrY16a0cwEuW2MMwGGv0DKYf7
         WyPIZYxYp2YpDDOuI7ZWFCxdto0dI3amG3AQS64Gp5mRzqKr64IOdpy1etm1JSccrPRg
         QSLBFz/Fo7c3Uj0YV8BwADI3t1ClMPHyX7iqqVNv+7wR6+LD2Lysuovmi8Zt1fEY/Zh7
         8SiBCYC9AZ9wMo3RrSdmzD/I6Ehsmu8bmfsetJH72Elg5J73CrWD88rZTO8DzwiiAn5O
         l62h/uYj46s3bnIYhYGG+XkETCKBwhlYDdD+fhjQtdvKIYY+7Ilk1B0gvV5fUxA2I6hr
         yCaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781247514; x=1781852314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVUbJnG3avAuh7auohauigxG3CJwfmr9boX0BMo3xuo=;
        b=Z3JDw3Ze838afbIn8PLDHW2Nmwk/HzxE4n9iEcPhNJ/RUPHvskuRDnrJFFPjG0NMLF
         RHzENDrhNPQwHcQcWcZwwk8GrPmwaaLoxDdsZsYJv6EtFrEa5tfAKJwn0mxjxx7Mwewx
         n2oYHNEPxOdYLbxBeoH1YotTlzBeBLtqgSbdosqc3tZH9KbOGpPQLAGQ27+h9BmFzBsT
         bVyPrfROjqq8nPk8tX2LzEHI1fZT5Jwp4C0rtHWrAvkrk6Jg5iu8uSerNefgA6FWrttc
         imsSrtuQXTOWyXppJrcfiLN85gG3sZqrDLtrz05OFtYWHIQtZ7VNe7fvHxI0tTC+4iRn
         uZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247514; x=1781852314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVUbJnG3avAuh7auohauigxG3CJwfmr9boX0BMo3xuo=;
        b=riu8r6bP6I7VogbZazB4u1aiG5sUhDtE78QnSGejQG1i8iugrqWWxwA/GRvapQbtpA
         WQ4E0Ks6shtD3EzTgRwpjuUI4Kv+2oBhRUVNHN5gr4lBlq186SI/2pgMWdMMctEcqpN4
         aAwWdWG+IABQjoOKLKTVaoTT3CtpxtKkcwhqUYmrcS83H3x/oeNwAlNdXwdd9vVb/k8G
         b5eBPyMdoCjgXLzG2bRwBQAWXcBlyUGrQJW490zE5wLLm4XSsxhybZC9v4m+QRuUFvIg
         5VOuFWr3nl4Sw8TuCiK38w4UhO8gRyiblyABTsl1O0aj6zqkIQGq4jF6gL7Zq0Ay7wDN
         6dpg==
X-Forwarded-Encrypted: i=1; AFNElJ+YeoWGaYVpU8CCu4YVRJmAYrNjjFFYn8aaDeQd/TufRWmUtExGBCQtrujny1AJa+qykmz+yGyEieVhaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV86w5ToZWKvheVDd4/bzSUeUADo13ghxVo/kE3jTw4C3ACxnY
	+Mk2jh1s59yyB3BZa4jNF7toU9pgPDYfPrDCjZHVxOB2/GdQK2s85wlTrVJjxdezN56gvU5B/5a
	SWPyh5YkpC2uXImRTrP7+HkdTAA4qq8+TXOP0kYzcxKlPoQly2URiCIMryx+NKTdrv7avIAtCcH
	8DX5EhhgGQ2POswab8AYsyRZx7i1ZK/ltu/6p9lSk=
X-Gm-Gg: Acq92OFBPrQHk9wFX8NquRLq8wRs2zdInBDl92lC3dGHn9bVDv6oIUVFCV+kKcCqrzL
	Jw8B9Nv4br5BmUwy8SxuAr3FD+CIKQyWY1zb0cMhnohI1zzpN9GPPLXtaeKc6NI8ACTqBffcE3S
	MkXil+kFUViwGDa1/ft6+Ym39NE3vkBqXumx3knjxy6q1gShSlUyugCL0NHzY6Y76zikwurjfp/
	tzGzg==
X-Received: by 2002:a05:6808:5185:b0:479:ff59:dcec with SMTP id 5614622812f47-4872f52d830mr1261623b6e.32.1781247514173;
        Thu, 11 Jun 2026 23:58:34 -0700 (PDT)
X-Received: by 2002:a05:6808:5185:b0:479:ff59:dcec with SMTP id
 5614622812f47-4872f52d830mr1261606b6e.32.1781247513711; Thu, 11 Jun 2026
 23:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609124926.1038981-1-hpa@redhat.com> <20260609124926.1038981-2-hpa@redhat.com>
 <aineK26VD67Fmibd@kekkonen.localdomain> <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>
 <aipwpTo5JCiAACVp@kekkonen.localdomain> <CAEk1YH41bJSoJdjYMj2ZJp5+WF6DpZhBrwkNKaC1HbPvwDV3GA@mail.gmail.com>
 <aiqtsFbFR9SZSDeL@kekkonen.localdomain> <9aaa21ad-6332-4dd4-9b78-6520af6a8619@app.fastmail.com>
In-Reply-To: <9aaa21ad-6332-4dd4-9b78-6520af6a8619@app.fastmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 12 Jun 2026 14:58:21 +0800
X-Gm-Features: AVVi8CfVl9R7RRHd_ZqXxkQ0_GxLgFx_40ewKeaoScr54fqO9XaXiOQ7BJgajPQ
Message-ID: <CAEth8oG3DTQuo2u6F=5zS1yXfJhiWO-oirmUs17uaK2DrNbQUg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
To: Mark Pearson <mpearson@squebb.ca>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Damjan Georgievski <gdamjan@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>, 
	Tarang Raval <tarang.raval@siliconsignals.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,oss.qualcomm.com,intel.com,siliconsignals.io,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64639-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mpearson@squebb.ca,m:sakari.ailus@linux.intel.com,m:gdamjan@gmail.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,squebb.ca:email,lenovo.com:url,mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18227677139

Hi Mark and Sakari,

On Thu, Jun 11, 2026 at 10:55=E2=80=AFPM Mark Pearson <mpearson@squebb.ca> =
wrote:
>
>
> On Thu, Jun 11, 2026, at 8:44 AM, Sakari Ailus wrote:
> > Hi Damjan,
> >
> > On Thu, Jun 11, 2026 at 11:41:19AM +0200, Damjan Georgievski wrote:
> >> On Thu, 11 Jun 2026 at 10:24, Sakari Ailus <sakari.ailus@linux.intel.c=
om> wrote:
> >> >
> >> > Hi Kate,
> >> >
> >> > On Thu, Jun 11, 2026 at 03:25:46PM +0800, Kate Hsuan wrote:
> >> > > Hi Sakari and Mark,
> >> > >
> >> > > On Thu, Jun 11, 2026 at 5:59=E2=80=AFAM Sakari Ailus
> >> > > <sakari.ailus@linux.intel.com> wrote:
> >> > > >
> >> > > > Hi Kate,
> >> > > >
> >> > > > I know several people have given you different advices but...
> >> > > >
> >> > > > On Tue, Jun 09, 2026 at 08:49:24PM +0800, Kate Hsuan wrote:
> >> > > > > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so=
 the image
> >> > > > > was displayed upside-down. Add the DMI information of Lenovo X=
9 to
> >> > > > > resolve the issue.
> >> > > > >
> >> > > > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> >> > > > > ---
> >> > > > >  drivers/media/pci/intel/ipu-bridge.c | 32 +++++++++++++++++++=
+++++++++
> >> > > > >  1 file changed, 32 insertions(+)
> >> > > > >
> >> > > > > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/me=
dia/pci/intel/ipu-bridge.c
> >> > > > > index fc6608e33de4..9e24aaceecdf 100644
> >> > > > > --- a/drivers/media/pci/intel/ipu-bridge.c
> >> > > > > +++ b/drivers/media/pci/intel/ipu-bridge.c
> >> > > > > @@ -134,6 +134,38 @@ static const struct dmi_system_id upside_=
down_sensor_dmi_ids[] =3D {
> >> > > > >               },
> >> > > > >               .driver_data =3D "OVTI02C1",
> >> > > > >       },
> >> > > > > +     {
> >> > > > > +             /* Lenovo X9-14 */
> >> > > > > +             .matches =3D {
> >> > > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> >> > > > > +                     DMI_MATCH(DMI_BOARD_NAME, "21QA"),
> >> > > > > +             },
> >> > > > > +             .driver_data =3D "SONY471A",
> >> > > > > +     },
> >> > > > > +     {
> >> > > > > +             /* Lenovo X9-14 */
> >> > > >
> >> > > > How are the two X9-14's different? It'd be good to have some com=
ment here
> >> > > > which model this actually is: the board name is only available (=
typically
> >> > > > at least) in DMI.
> >> > >
> >> > > According to the datasheet of X9-14 and 15. Lenovo offers 2 screen
> >> > > sizes (14-inch and 15-inch) and 2 CPU types (Core Ultra 5 and 7).
> >> >
> >> > Is the CPU SKU the difference here? If so, can you add that to the c=
omment?
> >> >
> >> > > They may ship customised firmware for a specific purpose with a ra=
ndom
> >> > > DMI_PRODUCT_VERSION.
> >> > > So, using the DMI_BOARD_NAME prefix to identify the laptop SKU is
> >> > > safer and easier.
> >> > >
> >> > > I think DMI_MATCH(DMI_BOARD_NAME, "21Q") covers all X9 but I don't
> >> > > know the side effect :(
> >> > > They may propose a new model with a different MIPI camera or HID.
> >> >
> >> > Indeed. Is the BOARD_NAME guaranteed to be unique by Lenovo? I think=
 I'd
> >> > use DMI_EXACT_MATCH(), too.
> >>
> >> The full board_name is 21QA0048RM (on mine), so 21QA is just the prefi=
x.
> >> The lenovo support site only requires this prefix to get you to the
> >> support page for the laptops and they refer to it as "Type 21QA".
> >>
> >> Is there DMI_MATCH_PREFIX, for these (if not all) Thinkpads it might
> >> make the most sense ?
> >
> > DMI_MATCH() only matches for prefix whereas DMI_EXACT_MATCH() requires =
an
> > exact match.
> >
> There are two BOARD_NAME's for every Thinkpad (which one your system has =
depends on the channel thru which the platform is sold).
>
> The first 4 chars are the important bit - they are defined and won't chan=
ge (they are used internally here). The rest of the BOARD_NAME is based on =
the config and can vary.
> I'm not so sure on the PRODUCT_VERSION I'm afraid which is why I'm hesita=
nt to use it, even though doing the match on two IDs is annoying. I'm tryin=
g to confirm if it's a good idea or not.
>
> A useful trick, for released platforms, is to go to https://psref.lenovo.=
com and type your platform in the search bar and it will come up with the m=
atch and also list the two board codes.
> So if you put in X9-14 you should see 21QA and 21QB - these are the two D=
MI matches you would need to do (X9-15 uses 21Q6 & 21Q7)
>
> Don't do a match on 21Q - that will definitely match up with other platfo=
rms that won't want this change.

Thank you for your clarification and comment.

In summary, v1 is a better revision for now, and I'll update the
comments to describe the reasons for the implementation.

>
> Hope that helps
> Mark
>


--=20
BR,
Kate



Return-Path: <linux-media+bounces-66758-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V8qrJZGoS2pUYAEAu9opvQ
	(envelope-from <linux-media+bounces-66758-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 15:07:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B75711084
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 15:07:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=T80f8UfN;
	dkim=pass header.d=redhat.com header.s=google header.b=TSHMdTmg;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66758-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66758-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 269E0301EF63
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53192D1931;
	Mon,  6 Jul 2026 13:05:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BB142089F
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 13:05:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343124; cv=pass; b=oF5G+LInvbp+wp/aQVQXy9Dkiv9Q3W/0CJWaOKcbU/kEF2vTT8A5kIhWDEy02xNB1ugctr94wuF4qIJBabX9LpftO9AnmAhHQdqmOqt0/cmsVOyKscysmDnrqHREiq44UCqT1jsImgAszIlVvfk++Io7tSy9B/28FPRrfRck3i4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343124; c=relaxed/simple;
	bh=9SbWC6KYVVZRMEQdEAAxcx4p2VOO5rNO11idabNFzgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQtxSC/18XKiy0lJRbUiKOdwXxfn+NORW7AbKWnk6iC4TiXQfe/FjIQPmptmOT4gCRjfEyBShhqTlxo5j/bllWzVq3BsjHmkXG38PxDQsFt1evsJ33SskQXKJfA+P3+/XySM7l9KwwlXQJNIOLZjD85oQ3IvpOH/1sHSgZOKZaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T80f8UfN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TSHMdTmg; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783343121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdTMoj183NRSMeTXAp4YsXZlzmlZIQsL6VbDv6J293s=;
	b=T80f8UfN9nWnfRoMYR64Q9mbLQ5ZIYC+BTLKgneNzThUsoU97o+7griG+7h5mR5kSNzEqr
	6fu7awCIEKXzxmeCe/lAZsPJxiluHdc020UtRpCni38wBD/H3G2ooj30HXM/dBQnjrxs1r
	um5uLd4HmL2kesgxbeMwL80o9Jit1Oc=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-Uc1ttKP9NqWs4ykOd3p9RA-1; Mon, 06 Jul 2026 09:05:20 -0400
X-MC-Unique: Uc1ttKP9NqWs4ykOd3p9RA-1
X-Mimecast-MFC-AGG-ID: Uc1ttKP9NqWs4ykOd3p9RA_1783343120
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a344ad4390so839151eaf.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 06:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783343120; cv=none;
        d=google.com; s=arc-20260327;
        b=Y/3AjEyUfp65kpFdCJ9sZjsWBr+cZSuDr835tI0tOPD22z9Buc62VrOvN1XEWZG2BX
         /ddqo4glo/Ckbjfi5M2E5gM+ZeFK3sYwdJvl+u31r1BoVMSvacdyAYKpUdy3HXisX48/
         +TBxPCg9O4QYhvBOfwk2tzaK4xP+tb9YavnmAN6qdcwwHL2HoO1PhjTpC0dhRrf6uMEr
         AbeHNzTUiwJ2Z/UL1rzTW3yNsTKfvlvL73+Cg4DvOQYMxRbUKj15CuNS6G7zCXyhs9go
         rAIWj7zVVXb5S3qJjC+76LI7K4HnOx6v+2Xvp7q88qK5myNRDpZ119tL+0ajfsvBDL3Q
         wHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sdTMoj183NRSMeTXAp4YsXZlzmlZIQsL6VbDv6J293s=;
        fh=ZivB5HQV9IxzE8X7lQODhsDgj+z9IUF/Ckm3yBW9SU0=;
        b=leD26JpMMxjTGeOgCIAu4iKNMfaajd2f3KntGwLPG4vC14eVYz/SBX+SESymPYqaBk
         B2g5YMxUcHvJ/ZuG3fQ9aANtvPY8Z7YXIqCr75hzcKKJwac3KAZp921zWpfkIoic+g+L
         GgomZ4tcKFsUbPC4AbAHx9KFVR7KC7NTp5E6xg0cX0meV9c7jzYIew2hTWNvL+8HLSPr
         sGWWEx476akuPF+v33avOmUp8JyokHjF+cwMUvARqZBV/NcuavoLh4/JvWxMRJEcFFfH
         OCONyQAJ+TwTC9KGg6eIExpYEB9Lklq9s8ukXrt/VCFhrKTLDvEi5E/O0iz7k+FGJa+G
         RJrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783343120; x=1783947920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdTMoj183NRSMeTXAp4YsXZlzmlZIQsL6VbDv6J293s=;
        b=TSHMdTmguCqBNgMK5qh8i9qDV0IP3V3zCQcZ7MlzzWVfo4CkbIDM0HHOEi/KMn8vtl
         igYRaeQ9csG2odqtV9nNwdPG8tncXELGx1fNolYVQNNknymU/0NvSwJXzxBhUj0dSiae
         nCwldzMAwWP9Nb7o1P6FosXQHgbcmdRpUB6cmmbaPZCW9mSsqNCMYRn0j9XL0DvB2CyY
         XpqOn4lHPi8/Uz9noGm9sCx/UiMw4HoiSHYYoR32B6gxF/82mTLhd2BbhrwuQ4tDjLGc
         JwfrRVBERQG6TxBdmTvMF+NRgtOY+UwENYN8HPQfQ/vwWUhovo8lhaLwiYZQlXPUXjXQ
         tDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343120; x=1783947920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdTMoj183NRSMeTXAp4YsXZlzmlZIQsL6VbDv6J293s=;
        b=XnlLYO5lufL3n9DEpHjUpR9O8XYU9NPrD15crvOnia5XS03UzLDnzvTbxj4axEluhE
         RgNMqccwVyEAAwBmI+6EIwRcVHziBF5Jr3gspjZMlGl/VwTLGekvoPteHsR5ZVofcWv4
         wLNtT56W9Y6KciHT35Ug4Rnk9Rf5/kiIL8JVi4hDYl50WIiGmFBbjiNtShCQLBiApKmX
         3TO74SbfH1RvV1YR5ry56q0HSOZBKgUSGhqqttKYssexK2WZMLGJW/dci3JwRqMuFXZK
         no/MPZG0yoX8WLUOOh4l/7u+YlyET4mi58ySqVDl/5Bvg1pA1ywJjUD+SGQwu7z2E1p0
         imNg==
X-Forwarded-Encrypted: i=1; AFNElJ/jl9tkMpry83aJ/MsAN6qSzIcEDJ0Kzj0v7Zpk/KzqyztsCNaoOsjUyk5xmwajaqXK4nLOxdTKirWaow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkP/tJt/88ArAmfvJGFBQaJOmZSlMCWLhWqM6lknCYpw89Msfc
	oPreeT+SltiRmTnNCCm7F083fncdmv+2TJ7TZv+AgneJF5zGqVQFJLSPYOFCsGN3Sje6gi3AllY
	sHujX6j3vb2I+dAJPKzBGh+kZJUBazgJOMeTtVl9VOhYgXLAYh95VdqnLJkkXIENJv+r9QZIehT
	efo/vzCkf14lg6kn3k/RyljJdeFC6sL0SCOs1t4sU=
X-Gm-Gg: AfdE7ckBBWXPeNDAb39B+E1URep8s7aKaHDXccKvLRI2f0sJ7FHAqFbbOt/xBceoJA4
	yeEfY6+Ys+G41gxF9KNXpuX/lVR+PzKUS+sWHMDGRhki9/pexe9PCLqR1tffcAB1xRJvJcCdCWV
	sZcLxU0JhRVjZTYOeYu6drUG/GerAhWreR1ePVWdEnhMSPRmFKCpIyjOxSUpfPQ7Yu/xw=
X-Received: by 2002:a05:6820:81d3:b0:6a1:6f12:1aac with SMTP id 006d021491bc7-6a35526582bmr205592eaf.10.1783343119993;
        Mon, 06 Jul 2026 06:05:19 -0700 (PDT)
X-Received: by 2002:a05:6820:81d3:b0:6a1:6f12:1aac with SMTP id
 006d021491bc7-6a35526582bmr205575eaf.10.1783343119494; Mon, 06 Jul 2026
 06:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629074026.35490-1-hpa@redhat.com> <20260629074026.35490-4-hpa@redhat.com>
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org> <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org> <akT2CSCbaR0a3BMA@kekkonen.localdomain>
 <PN3P287MB18296E80E1786B05F5ACF37E8BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <d59e796b-fe53-4103-a94b-5ffba53246b9@kernel.org> <aklcEKiFDfZwCFP-@kekkonen.localdomain>
 <PN3P287MB1829FE03558376196C9030328BF12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB1829FE03558376196C9030328BF12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 6 Jul 2026 21:05:08 +0800
X-Gm-Features: AVVi8CddLzx4eQRFaxdBT2pu3p2HbYXIVt8N98r-CMBvGbAxEWVq6TYvkkHLf5w
Message-ID: <CAEth8oG_jDMz3Sspayfv18Ue4vO6103fM0J_f_i_NG6tZ7c4XA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Serin Yeh <serin.yeh@intel.com>, Damjan Georgievski <gdamjan@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, computman <anis@talbi.fr>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66758-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,intel.com,gmail.com,ideasonboard.com,talbi.fr,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,siliconsignals.io:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31B75711084

Hi Hans, Sakari and Tarang,

Thank you for your comments.

On Mon, Jul 6, 2026 at 3:16=E2=80=AFPM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Hi Sakari,
>
> > On Thu, Jul 02, 2026 at 08:05:25PM +0200, Hans de Goede wrote:
> > > > I went through the INT3472 driver and would like to propose a gener=
ic
> > > > approach that satisfies both sides without per-HID quirks or sensor=
 driver
> > > > changes.
> > > >
> > > > The problem is:
> > > >  - INT3472 standardizes on "avdd" internally
> > > >  - Sony IMX sensor drivers use "vana" per datasheet, and all existi=
ng
> > > >    Sony DT bindings (imx219, imx290, imx415) already use vana-suppl=
y
> > > >  - Changing imx471 to "avdd" now will create inconsistency with tho=
se
> > > >    bindings, or require a rename later
> > >
> > > Ack, as mentioned in my reply to Sakari from 1 minute ago I'm ok
> > > with sticking with vana for the imx* case,
> >
> > At least some Sony sensors use "INT" PnP vendor prefix and so telling t=
hem
> > apart from the rest doesn't work at least this way. There could also be
> > other prefixes as well, they're not all "SONY". Right now there is one =
with
> > INT prefix and three with SONY prefix.
> >
> > If we start having lots of devices with the same quirk, we could also
> > introduce a pointer to an array of IDs to avoid repeating the same quir=
k
> > over and over.
> >
> > Kate's patch adds two quirks so this could be already considered (and o=
nly
> > one of these IDs is using SONY prefix).

The idea may look like

const char *sony_hids [] =3D {
"SONY471A",
"TBE20A0,
NULL
};

 { /* imx471 expects "vana" as con_id for power enable */
     .hid =3D sony_hids,   <--- A ponter to sony_hids
     .type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,
     .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
     .con_id =3D "vana",
     .enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
 },

and
and the following functions need to be changed.
Do I understand it correctly?

Sakari, do you want to implement this approach or could Tarang and I do tha=
t?

>
> The HID prefix is not actually a concern for the alias idea, because the
> alias table triggers on supply_name not on HID. Since INT3472 always
> assigns "avdd" to any POWER_ENABLE GPIO regardless of HID prefix, the
> alias would work the same for SONY471A, TBE20A0 or any future INTXXXXX
> prefix.
>
> However there is a different problem with the alias idea: it would regist=
er
> both avdd and vana for every sensor that has a POWER_ENABLE GPIO, not jus=
t
> Sony IMX sensors. So I agree this is not a good approach.
>
> The NULL-terminated HID array is the correct approach, the mapping is
> explicit and only applied to hid we explicitly list.
>
> I can send a patch implementing this on top of Kate's patch.
Sounds good.
If Sakari agree with that, I can include your patch in my series.

Thank you :)
>
> Best Regards,
> Tarang
>


--=20
BR,
Kate



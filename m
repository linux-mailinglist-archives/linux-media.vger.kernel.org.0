Return-Path: <linux-media+bounces-52341-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id L9O4Ek2lh2m1bAQAu9opvQ
	(envelope-from <linux-media+bounces-52341-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 21:49:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9836C1071C3
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 21:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3607A301AD37
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 20:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C52353EC8;
	Sat,  7 Feb 2026 20:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHpnyZ4p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA202C21DF
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770497348; cv=pass; b=b9/xVcO80yP04nRrsFmAajv+tLJzCjGLDd9mNaSRjhBh2TVwmFZElvyg3we95rLv/ZYZ5OxmuyBR+iNG4MZidH5x87VP8niAq38fWQO6XaJr4Yw7JunPvZFZJfiwl6K8T/dlQO/0sSy5jMHSbmU8++1RZOHO9mtJeU1NwoiCmnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770497348; c=relaxed/simple;
	bh=+WMnPqecPZiX7HQrL2/3H3CxHSw0n9xthUFV9lXpB5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9qo62ed6R3gctcp7M/sd7usLCYD56QWwCGs4MzzoZD2D/mNaUZQJ/OxKSwHxxJVXN8qOdx/fo4IHvHDdjb1+pryUFVSqoq1Mi0GVRs4cIXzQzUV7FTcaTylXB/sDNVZnnjers1A2FMnO1YSeE7L+qGBlkXptQtQIeJNrh0tARQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHpnyZ4p; arc=pass smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7d18d2f87c4so548161a34.1
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 12:49:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770497347; cv=none;
        d=google.com; s=arc-20240605;
        b=eMG/WxT2+qtSDNuRwJ9N5ryRKEVWtAWDlzNbaIT7E7ZdDkmKVCk0chAhYxmhsA6KiR
         o7YtoayZ8vaiJtVYFjtnsRQ9ZGWh13Rx1ZGVVbi6wgjd6zHbCDZA3kJul5rQypPWgu3q
         k9QVtecFtLo/puuzKekmEe74fZjWj5bMZ3swFbNySDDXjQWlCrZryGuxw0QGlu2jSVTc
         Fa2Kv7I1Q6G0BC/Hq+h6FZvOg6LWHlbU2wJo2U2Kn87CKke8bvJenuBCkbpyJA0FgsOY
         IVIM8gx8y2o7+O1Div8ou/LO8huDiQxUxYDWQBN8Zedm3e735RvN5/dMx3lGHOtRAwcr
         BpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Esqi5pbnhzPpMywF3YI5BvuDFsEhtH6QRpEn6VwYPGo=;
        fh=fdVFuKLGJWOGPKCxXzEXvExZQxJXz57WPXJCMzQj1ZU=;
        b=a0OHC5DUNscZ3w9DWg5PJCcBcP8CYfNW4Byb0jBWRVkKsZ1FPYTWt95+RbJF+KVQbu
         QEDmWKtrUI5SaSEeZ8zzK5d5p2pcJnCavXZf2wuwAPZjILYawpWmqJkVWvW3FOQvYikD
         M97DrZOX8CULLces0Kv/T6ULdmzRDlfLqbsRQ8coUmNtVOkEfcAHQJB2RGu6jEc1kWec
         8FFjldN6LExDFM0upYRLgo+jXzP8czLt28BgJzHZcSDwClSGckx+N2h9NMYt/EESZS0N
         kbuXIRLwgCC1Q9dyv6BygTe/+mdF0FrQ134WpczP1D7UahFIo4XpMZyH9k/3w3X/V+3T
         b0OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770497347; x=1771102147; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Esqi5pbnhzPpMywF3YI5BvuDFsEhtH6QRpEn6VwYPGo=;
        b=RHpnyZ4pNUysqXujq9vdaUbN5sWoFn7s/pdHxhrOIwHsIm7iyWKDex4nzRuVu0q1Yt
         o/+ccD8OiTEfId/JKh+1wbgqWgj4VYS2c/a6fpZU3mZ+SyuLMe4AtsBKKPkCz6QgNQP7
         Yp293sD/ER+R/qgiaW19EHLpJe0b9q7rH7MjhrDKco+TqfxyqZapDO+5kXjVOnlZWc7/
         fgW0uk2VpRmUgvxw+4jVvBJuryWXTY5pzAffdv9kw5Oa5l8kcwXT3DhWwBEmYlSxrTSe
         BWzff6EAx0cFY+32ir/qDZvZZwSwtj89RcuVpEzHLCg8K66ZQ48BLPn/d8EuqXg1mdKN
         Xriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770497347; x=1771102147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Esqi5pbnhzPpMywF3YI5BvuDFsEhtH6QRpEn6VwYPGo=;
        b=DR2WkdF0LvbotcjR0nYBSqNgTAdc/TXOIJNHiEu1k+dZ9HDSgolVTA9e+r0mYhfpF5
         snC1jMShczuEdjxPPmzK/RMsw93sDk0yl93H611VmH0UcZJiXuS6/+CjEKG9tiipBrwP
         nNe8mBXZ6zbnoGOZnYkWrqX04Twb51KOr+o3zgAv40mGwrxRrIinoZnvgFlsOJS73/n+
         R6STrBPfWXQsWVOCfqySMFLzNYgqvobytMlWvnr9b4Yomvz1azOToOj1y6lqL/FlqXaW
         7dQpPsvCBh+wDmbRLaSnma8OaAGadUsepz4V0fkTDluYerwJBIZtoPrm4lPCjsaErus5
         Qd9g==
X-Forwarded-Encrypted: i=1; AJvYcCUSeo8b1oWmE3XLUfGs+H8Q6snC0qQGHHm9tRijc/FNVxSfLMoSCPsJxdAibdMVlzRSefMvzy3XSXXzOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/J202UJZyjCl1oyhZV695lcjv426aXeBgokUQBtKxOyPE7W2r
	tMt7+Rp1b0oOsFHGsHK+jA1VqSpE6rejWOlslH18RO4KFS4jiMQ6fRTwgY1jfSZXpqSVEDH7k4d
	1Y2MwNSRk7TMf3vtdxS2Xlx0yXC85eS8=
X-Gm-Gg: AZuq6aJuxGtN41rUkY4PAOUidyvI1zfdacsW91AByNGTSDCveGEUyWznByjGuxzADDo
	glW4j1/IHCdCoTj3JNdigfhtPu6A3ShogBNdZe4hgPSD/LN6XYBEmz7xs8irg5bRVxEB5p5grDx
	Klne3Mk15LxZgz7L7xgezbpegqYpwgfViUckdjTLUPgJpMAbIkpgS51I1r5M4gUWpQujErCzEMG
	ud5pfrwnEd/onIYvlvX9myH5BNDTWrXnYw0NnVGRK1hq9r4U519dhxng+WrENpFmphPbrea0VIG
	OfoK56NrfU0UPQgt0ufLM7BrfkkPjAfDKV1jcaNavnkurUR9VwdwHIyUvWi/WhSwPw==
X-Received: by 2002:a05:6808:23d6:b0:44f:f46c:eb4f with SMTP id
 5614622812f47-462fcc42797mr3156260b6e.8.1770497347163; Sat, 07 Feb 2026
 12:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207201601.50478-1-officialsohamkute@gmail.com> <69879db4.a00a0220.37c87e.0040.GAE@google.com>
In-Reply-To: <69879db4.a00a0220.37c87e.0040.GAE@google.com>
From: Soham Kute <officialsohamkute@gmail.com>
Date: Sun, 8 Feb 2026 02:18:55 +0530
X-Gm-Features: AZwV_QjxwLsfqfyLanoY-FzKtwIzBD7JMH5VZaEF4ojEvZIfYjidFw2-2kVh4sA
Message-ID: <CAFxoRw1B=+yo4WbXtoSOhaY8KEZYQr5xDvPAe=NVZW68CUaJQw@mail.gmail.com>
Subject: Re: [PATCH] media: vidtv: fix general protection fault in vidtv_psi_ts_psi_write_into
To: syzbot <syzbot@syzkaller.appspotmail.com>
Cc: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org
Content-Type: multipart/mixed; boundary="000000000000742e62064a420924"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52341-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[officialsohamkute@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9836C1071C3
X-Rspamd-Action: no action

--000000000000742e62064a420924
Content-Type: multipart/alternative; boundary="000000000000742e60064a420922"

--000000000000742e60064a420922
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v2: resend with correct syzbot Reported-by and maintainer To: list.


On Sun, Feb 8, 2026 at 1:52=E2=80=AFAM syzbot <syzbot@syzkaller.appspotmail=
.com>
wrote:

> > Add defensive validation for psi_write_args pointers to avoid
> > null pointer dereference reported by syzbot.
> >
> > Reported-by: syzbot+814c351d094f41a1b86@syzkaller.appspotmail.com
> >
> > Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
> > ---
> >  drivers/media/test-drivers/vidtv/vidtv_psi.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c
> b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> > index 2a51c898c..bac0ea03b 100644
> > --- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
> > +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> > @@ -156,7 +156,13 @@ static void vidtv_psi_set_sec_len(struct
> vidtv_psi_table_header *h, u16 new_len)
> >   * add stuffing (i.e. padding bytes) after the CRC
> >   */
> >  static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args *args)
> > -{
> > +{
> > +     if (!args || !args->dest_buf || !args->from ||
> > +         !args->continuity_counter) {
> > +             pr_warn_once("%s: invalid write arguments\n", __func__);
> > +             return 0;
> > +     }
> > +
> >       struct vidtv_mpeg_ts ts_header =3D {
> >               .sync_byte =3D TS_SYNC_BYTE,
> >               .bitfield =3D cpu_to_be16((args->new_psi_section << 14) |
> args->pid),
> > --
> > 2.34.1
> >
>
> I see the command but can't find the corresponding bug.
> The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
> but the HASH does not correspond to any known bug.
> Please double check the address.
>
>

--000000000000742e60064a420922
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">v2: resend with correct syzbot Reported-b=
y and maintainer To: list.<br><br></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 8, 2026=
 at 1:52=E2=80=AFAM syzbot &lt;<a href=3D"mailto:syzbot@syzkaller.appspotma=
il.com">syzbot@syzkaller.appspotmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">&gt; Add defensive validation for p=
si_write_args pointers to avoid<br>
&gt; null pointer dereference reported by syzbot.<br>
&gt;<br>
&gt; Reported-by: <a href=3D"mailto:syzbot%2B814c351d094f41a1b86@syzkaller.=
appspotmail.com" target=3D"_blank">syzbot+814c351d094f41a1b86@syzkaller.app=
spotmail.com</a><br>
&gt;<br>
&gt; Signed-off-by: Soham Kute &lt;<a href=3D"mailto:officialsohamkute@gmai=
l.com" target=3D"_blank">officialsohamkute@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/media/test-drivers/vidtv/vidtv_psi.c | 8 +++++++-<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/me=
dia/test-drivers/vidtv/vidtv_psi.c<br>
&gt; index 2a51c898c..bac0ea03b 100644<br>
&gt; --- a/drivers/media/test-drivers/vidtv/vidtv_psi.c<br>
&gt; +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c<br>
&gt; @@ -156,7 +156,13 @@ static void vidtv_psi_set_sec_len(struct vidtv_ps=
i_table_header *h, u16 new_len)<br>
&gt;=C2=A0 =C2=A0* add stuffing (i.e. padding bytes) after the CRC<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args *ar=
gs)<br>
&gt; -{<br>
&gt; +{=C2=A0 =C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!args || !args-&gt;dest_buf || !args-&gt;from=
 ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!args-&gt;continuity_counter) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_warn_once(&quot;%s=
: invalid write arguments\n&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vidtv_mpeg_ts ts_header =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.sync_byte =3D T=
S_SYNC_BYTE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.bitfield =3D cp=
u_to_be16((args-&gt;new_psi_section &lt;&lt; 14) | args-&gt;pid),<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt;<br>
<br>
I see the command but can&#39;t find the corresponding bug.<br>
The email is sent to=C2=A0 <a href=3D"mailto:syzbot%2BHASH@syzkaller.appspo=
tmail.com" target=3D"_blank">syzbot+HASH@syzkaller.appspotmail.com</a> addr=
ess<br>
but the HASH does not correspond to any known bug.<br>
Please double check the address.<br>
<br>
</blockquote></div></div>

--000000000000742e60064a420922--
--000000000000742e62064a420924
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-PATCH-v2-media-vidtv-fix-general-protection-fault-in.patch"
Content-Disposition: attachment; 
	filename="0001-PATCH-v2-media-vidtv-fix-general-protection-fault-in.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mlcsc98d0>
X-Attachment-Id: f_mlcsc98d0

RnJvbSBmZDc0NmI5NTk4NzIzOTA3M2Y3ODcyMjc1Y2Q2OGZlOGNiMjllMGVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTb2hhbSBLdXRlIDxvZmZpY2lhbHNvaGFta3V0ZUBnbWFpbC5j
b20+CkRhdGU6IFN1biwgOCBGZWIgMjAyNiAwMTo0Mzo0MCArMDUzMApTdWJqZWN0OiBbUEFUQ0hd
IFtQQVRDSCB2Ml0gbWVkaWE6IHZpZHR2OiBmaXggZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0IGlu
CiB2aWR0dl9wc2lfdHNfcHNpX3dyaXRlX2ludG8KCkFkZCBkZWZlbnNpdmUgdmFsaWRhdGlvbiBm
b3IgcHNpX3dyaXRlX2FyZ3MgcG9pbnRlcnMgdG8gYXZvaWQKbnVsbCBwb2ludGVyIGRlcmVmZXJl
bmNlIHJlcG9ydGVkIGJ5IHN5emJvdC4KClJlcG9ydGVkLWJ5OiBzeXpib3QrODE0YzM1MWQwOTRm
NDFhMWI4NkBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCgpTaWduZWQtb2ZmLWJ5OiBTb2hhbSBL
dXRlIDxvZmZpY2lhbHNvaGFta3V0ZUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS90ZXN0
LWRyaXZlcnMvdmlkdHYvdmlkdHZfcHNpLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS90ZXN0LWRyaXZlcnMvdmlkdHYvdmlkdHZfcHNpLmMgYi9kcml2ZXJzL21lZGlhL3Rlc3QtZHJp
dmVycy92aWR0di92aWR0dl9wc2kuYwppbmRleCAyYTUxYzg5OGMuLmJhYzBlYTAzYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tZWRpYS90ZXN0LWRyaXZlcnMvdmlkdHYvdmlkdHZfcHNpLmMKKysrIGIv
ZHJpdmVycy9tZWRpYS90ZXN0LWRyaXZlcnMvdmlkdHYvdmlkdHZfcHNpLmMKQEAgLTE1Niw3ICsx
NTYsMTMgQEAgc3RhdGljIHZvaWQgdmlkdHZfcHNpX3NldF9zZWNfbGVuKHN0cnVjdCB2aWR0dl9w
c2lfdGFibGVfaGVhZGVyICpoLCB1MTYgbmV3X2xlbikKICAqIGFkZCBzdHVmZmluZyAoaS5lLiBw
YWRkaW5nIGJ5dGVzKSBhZnRlciB0aGUgQ1JDCiAgKi8KIHN0YXRpYyB1MzIgdmlkdHZfcHNpX3Rz
X3BzaV93cml0ZV9pbnRvKHN0cnVjdCBwc2lfd3JpdGVfYXJncyAqYXJncykKLXsKK3sJCisJaWYg
KCFhcmdzIHx8ICFhcmdzLT5kZXN0X2J1ZiB8fCAhYXJncy0+ZnJvbSB8fAorCSAgICAhYXJncy0+
Y29udGludWl0eV9jb3VudGVyKSB7CisJCXByX3dhcm5fb25jZSgiJXM6IGludmFsaWQgd3JpdGUg
YXJndW1lbnRzXG4iLCBfX2Z1bmNfXyk7CisJCXJldHVybiAwOworCX0KKwogCXN0cnVjdCB2aWR0
dl9tcGVnX3RzIHRzX2hlYWRlciA9IHsKIAkJLnN5bmNfYnl0ZSA9IFRTX1NZTkNfQllURSwKIAkJ
LmJpdGZpZWxkID0gY3B1X3RvX2JlMTYoKGFyZ3MtPm5ld19wc2lfc2VjdGlvbiA8PCAxNCkgfCBh
cmdzLT5waWQpLAotLSAKMi4zNC4xCgo=
--000000000000742e62064a420924--


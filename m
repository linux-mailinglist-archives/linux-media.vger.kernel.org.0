Return-Path: <linux-media+bounces-66796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xizHF08lTGpbgwEAu9opvQ
	(envelope-from <linux-media+bounces-66796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 23:59:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB199715DC0
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 23:59:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AXwU4vvv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66796-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66796-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD3BF3036753
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 21:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AD63D810F;
	Mon,  6 Jul 2026 21:59:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02C12ED84A
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 21:59:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783375170; cv=pass; b=iimeKDEKKVOhCQXxKoNUoMbwkPaBVtNyJbVEtNtinpEleZeZbMRx4l5T+g/ASLoJBwjgyjU7AtkX6ZK4WjjsXl+CIVnRDbPCFuPd8Tgl8OYx1jYiieZmvg3u2V+md1GBp1fHa1L2OcU+IsabgQafv0TIAj5UFwNQhueCBWJlEoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783375170; c=relaxed/simple;
	bh=jdKcNjPTLk4t5sB7vBYT7B94qVTUT2yntEybL1W759g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXtTx9oKAGroDLgCr+Ns+4pfTPIDqhHDhitAcl3W8baLrMbd3ToZLNGwVl3w/W3460Gqi87qCY2dUit9IUqFIlJ7Ef5N64H/DnHByYVHa4W2GveUPKM3Ay8HdCVu1sjxx+b7sDXBoVw4eOg5CV2GUunPTnCfGykciFu590/X244=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXwU4vvv; arc=pass smtp.client-ip=209.85.210.46
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e93d011ab2so279266a34.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 14:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783375168; cv=none;
        d=google.com; s=arc-20260327;
        b=OPkQacYiYh21jys2EziXI0qFAF3vKhHTsmRzBsYCE69bNg7sqFR9P9aCrWqtYCn7zK
         vSv8VB6oRU8D9tKPyAVIHtj5MPLFHcIKNVxveTDEngnh+Pyu0AGzjEqpf4529qvtOPKd
         ugIEfVZbFpLSxLRpG48eJiDrP/7V8ns1UgQ57rqwBrYuxBgRV5cDxCwjsXuuN0jC5ZFS
         emLNSJnc0Wq1CqglFtT8YtgABKoROT1n48r12/uxJHKo2CLFLZj//o53QZ5wxQU4fmXy
         iHeMNDFz6DLyvDlYiHt1NZ47UA9a4V1PO0SugwzrZc18/YrApHVbdht9dw7uGd3ayI/N
         SN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wdCTNR4NAcbt+UHljJQJGBCWlwecJPFZO5UT6CqBrWI=;
        fh=utwXD/6yACTPmf5lZCJ1rXsa8joR8nEwjJub+JIA9QQ=;
        b=At3cEKUdrp5O9+t2mjGeDeOURCHQQnm+HrdEhwOt730WmDzPzHIuP0Ggwraey2anzQ
         sfxnFXs3CDk+jgN9eC3mRod/5AIpce7ubaukSFPjw9PmyhiHysPWrfhHWswyjAs2Qdgs
         9W31pxxHsNKNVpWw62vKITxFdHA1Vr8oKwV5ev341So7UsmrNT3ZT5MQOUudgWkXLtwd
         AOEbriu+gthsDAn7EORcL0Akhe6ZtYoxO15AkvolYG39nLz1CeWOevFFphDT5ABEsgJK
         sHDxtbsjExnoA65AUJO9U22WJEmFBzsM0dwt8mxls0xPDAMyNUgW9rHINNf6PqJQZd7l
         gTXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783375168; x=1783979968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdCTNR4NAcbt+UHljJQJGBCWlwecJPFZO5UT6CqBrWI=;
        b=AXwU4vvvoeFCxisphk6rer1IZ3ZF6DvgQxmOpJj/8Z5BE1RlP/hMO+7wLs6bzqYunP
         S2P2WI7cHu0bexh8iZzPa4hUpDaS8IrqDqUN1trQFzctxayMn5GfnNdSjew0EMrQqoNy
         C9dFYItP8n6E8M5siyE7H4R3h0e5JSmE22VkX/PPndTwBWknAo0XXb4Fkzpn4gLjUrJy
         PXNezxGFpcb4IVMsM8Tf74yOzAqiSqNBPK9d9qRev0xyx+svAJ2hlGHan/+L0WYXPfg4
         Cp9u6X90uOtwh2s7Ia/q/Icn+1OH1kfc0U5fgW/kbpmpzqZap7+GXvgXtxQsrXVqshXX
         jvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783375168; x=1783979968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdCTNR4NAcbt+UHljJQJGBCWlwecJPFZO5UT6CqBrWI=;
        b=a1/y+ksTQ0vRm7hsdUhvw9yvC1iY451gBOrhIZQHQlJWyniRF9UYnbNnmx/NOT//kH
         +N8q1t9haY9MNd60XtxNRPOoVXaIjW+8f/HjsiEEi5qbxbrWLjHAzHI5XPwtw0/0lF8A
         ZSeG0qReiVi+8YBIwTXpSb/cl8yxE90aIoKFJXyoYJ8inElzTLbjTN86RJ7xHfiW8/Mh
         EyLKF4oOQg1DcI0TiRbfcrM4fCiDKIzEr3W+GT7OceAzITLcJMf2bw1ozkp/hLcJ1o9C
         0Tr9ZCAx+dLx76esd4n6Ra9DyWgLnKg8JyDb4/DKaTPqkjZxG2GzFKsXC8fSHnIBpemL
         bbjA==
X-Forwarded-Encrypted: i=1; AFNElJ/g5nmMV/Rbc8GIlcJs82oQEAKbD4izIdoE3Xs1N7W2u6sKT4sXM5vjNxSF2zd0MyOMHzlg0PxlgeAdxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC6NCSIjMm7RhfoeBfIqjFJ7HbWRXL6BTt9l1Ecl/ovfAK9Og2
	IRKjhNP/Tji4ogclRfyX4WJdlTtq5SACA43nWBe44MbR2dbbttt8Tk5ADVhhBx2g5m+fuq7dwtD
	NYDt7KbQbiU5VT4woYrDoP9Su/pVJkcI=
X-Gm-Gg: AfdE7clb2PSct20OcMobFgIfy0wnIr8vzGLe0+T/CmTDGeD739/mSxG8aFkaBu1/uc1
	mY1vGgyxMBJA1ZlphGId9vSVK3LNcyKDL/W22znTve1EVWfEY2yQtgnN7QqwOb3IzXg8FKf4Obn
	CFth7sNEi8OEePYNV9PvsFcbZ9mLZIr6PpUX89tsc5l8sTt48RkiFGDG1hzh+CFcsbucSN++B3M
	vDpwCfEYdWMkWdVVXnZwbW2PqN+UAHXRg21KLmwGmRKbGV2c5NZvVyXfScI1IBkg+LkysDHH79h
	iY/0B/aZ
X-Received: by 2002:a05:6808:1995:b0:496:c5a:e126 with SMTP id
 5614622812f47-499bacb258amr6099961b6e.4.1783375167763; Mon, 06 Jul 2026
 14:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706000738.18478-1-nealpatalay0@gmail.com> <CAHp75VcSGXC=x3hFXt8qvyRQjPzy3uLN9iBTURp2yA9+P_jibg@mail.gmail.com>
In-Reply-To: <CAHp75VcSGXC=x3hFXt8qvyRQjPzy3uLN9iBTURp2yA9+P_jibg@mail.gmail.com>
From: Neal Patalay <nealpatalay0@gmail.com>
Date: Mon, 6 Jul 2026 14:59:16 -0700
X-Gm-Features: AVVi8CdG0PfkX4vD-oqmzTQi7x8RBptmf2YrKOaT-BDXOM7UHShSIEj9USx4BO0
Message-ID: <CAGjuiT9gu32wvx2Vf0U0g9deyAzzGtwwCNEdW_R4JVarO9x4JQ@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: refactor pipe graph dump
 stage formatting
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com, matt@mattwardle.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66796-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mugrinphoto@gmail.com,m:matt@mattwardle.net,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com,mattwardle.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB199715DC0

On Sun, Jul 5, 2026 at 10:37=E2=80=AFPM Andy Shevchenko wrote:

> Please, slow down! No need to send a new version immediately after
> replying to the previous one without settling down all aspects of the
> change.
>
> This version is no go, sorry.

Understood, no problem.

> > +static void ia_css_debug_build_info(char *info, size_t info_size,
> > +                                   int *offset,
> > +                                   const char *flag_str, size_t flag_s=
tr_size,
> > +                                   int *line_len,
> > +                                   int *num_lines)
> > +{
> > +       int len =3D *line_len;
> > +       int off =3D *offset;
> > +       int lines =3D *num_lines;
> > +       int len_written;
> > +
> > +       if (lines > 3)
> > +               return;
> > +
> > +       /*
> > +        * If new line length exceeds max line length,
> > +        * replace the last ',' with a "\\n".
> > +        */
> > +       if (len > 0 && off > 0 && info_size - off >=3D 2 &&
> > +           len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> > +               if (lines >=3D 3) {
> > +                       *num_lines =3D lines + 1;
> > +                       return;
> > +               }
> > +               info[off - 1] =3D '\\';
> > +               info[off] =3D 'n';
> > +               off +=3D 1;
> > +               len =3D 0;
> > +               lines +=3D 1;
> > +       }
> > +
> > +       len_written =3D scnprintf(info + off, info_size - off, "%s,", f=
lag_str);
> > +       *offset =3D off + len_written;
> > +       *line_len =3D len + len_written;
> > +       *num_lines =3D lines;
> > +}
>
> This makes helper too ugly and unreadable. Again, study the case
> first, when this can be true. Do we really need to cut it? This whole
> thing AFAICS depends on the dtrace facility in the driver. Is that
> HW-related? Is it pure SW? You need to perform some homework.

I've taken a look at the driver in greater depth. The flag wrapping
functionality being refactored here is used to construct a graph
visualization for debugging.

> >                 dtrace_dot("node [shape =3D circle, fixedsize=3Dtrue, w=
idth=3D2.5, label=3D\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
> >                            bin_type, blob_name, enable_info, blob_name,=
 id);

Each one of these calls generates a node in that graph, and the contents
of the node are decided by the flag string we build in enable_info. Seeing
as we are just collecting debug info and populating a visualization with it=
,
this refactor seems to be software.

Seeing as it's unlikely that every flag is enabled at once, and even if the=
y
are this only causes a slightly more unreadable graph, avoiding 3 line
truncation seems to be the best option since it leads to more readable code
and avoids omitting information.

Additionally, len > 0 && offset =3D=3D 0 is an impossible condition under a=
ny
feasible helper function use condition. This can be documented in a comment=
.

Given this information, to me it seems like the best course of action is to
revert the helper function to its simpler state without line count truncati=
on
or the offset > 0 comparison. What do you think?

--=20
Thank you,
Neal Patalay


Return-Path: <linux-media+bounces-53107-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCRnB65Cl2nzwAIAu9opvQ
	(envelope-from <linux-media+bounces-53107-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 18:04:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71A160EB9
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 18:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A21173013945
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 17:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BCD34D93C;
	Thu, 19 Feb 2026 17:04:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28AC33A710
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 17:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520682; cv=pass; b=o+IsF2wm3JN+vV7My+Ua4r16FGR48/QXx3nUpmJze554lLYSsVvCJV/BA3SMiyVuu59VL1X2QjrHirr7okuSUD11//i4xNuOGlhIxg/Z+G8kFyBlXxa6Fx8hcMxb5aH/1lECT0tMnbsOpugxyFeRS7kJiBvCqT3I47di+RuHrRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520682; c=relaxed/simple;
	bh=b6U1hG3nrOVFz0ecG5N+39M6HPtyrPXlR9zj9WH7HqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qV8IPsn49znt39o0CUGGtbE9T++E+8bzTig4M8EWikjNrwxGm217ROUfhQmSn9dxwmbZ+ILEoRZa4De4cDIbLasCDaLH8h3XPq7q6GDbzINsdIljgdALy9hSBoKIwA1pAy9EDRSMOfYTy7OXu2zCNXDlFSDlwAJqgun0p6THPsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chrisli.org; spf=pass smtp.mailfrom=chrisli.org; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chrisli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisli.org
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ae5f0777dso905274d50.3
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 09:04:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771520680; cv=none;
        d=google.com; s=arc-20240605;
        b=NoXB+ICvy8t/D+WTCf2sCrNJQ4P+Sd+tlvoxVxW8IzK+SIiJVRqsPkUF/aTn51WmSf
         qr6p06GOLIJbmOzzQrTsMVoHIwx5vkpHBUxIT8+7ivxrLBpO4ql5gwDuzw+Dfa/ABEk2
         ByelAt4b8CDaoUtPJEFb98zYvVUhBxwDeeOUMjgtoLn/YR7sDfVqbxhncmTUeaWLT9Hr
         Df5TcJdi3xTGiOdAplcfixKlXK1Zp1lirEF3vVqil9enmZ6J0Gvg4Vt1ZjzjI/XvBXPM
         02Op3240nVcDBNikwedhkmhJ/ra4T4FfcpOfkhqoXcBXBpEPcLSRPSFtV4DObdZ1a7hs
         E/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=GCfnfADMenCdj35GVzlSj1RLfLETxBVqx3iNQnVeu6I=;
        fh=5xSuYhlBhL3+JMpuV/I8bEVcsJ/5YAkJOpdDveMrRaQ=;
        b=O7dBE85+uazCZ5gciWeHwOllJJIOg2KJR+k4AD8owngmBY7eT55QZvVAf2FTEf7KbT
         g/jpuMusql9TA92/SqxCgRG4KcP9HA0UpBkw5l64XIiDHHszWNgDOlLZMhl9tKgVTYRn
         p4JnkqbWI4+W+wDC8oWUVkBVf+GzcYkoSY1543/Wz/DOZ3AqlJSNa7UZSaApDUXabqtp
         CauCfeKlNaIozTuEi6iguAwjlEiw1vuMf1uUdYyZczp/ZYflUjtbph99ZEPkgwpbwqJf
         5bdgcct0DkLzPXS5kXsT0Js2mcIIA1XpkJju4c7DYxRqGWyqAt6fu6Np4+5OYwRbK3Rq
         YnlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771520680; x=1772125480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCfnfADMenCdj35GVzlSj1RLfLETxBVqx3iNQnVeu6I=;
        b=fZseom5+MyIKRqIdgADVp7BiikPf175nwxVG6H2NnaVvKpzbIUCF7BGi2jqf4u2tFG
         8y2yGPE6xxVIsGLQoqeJdbMtn5Jn8Q+YTmMyQ1D9poGIGtwO3hUBoyRufRRtyEqheqCa
         iFbGv7R+U8otF4rF3EkHw1RZ4DCDfG3QUTv322xoCiFo5ZbB7AdYvI3phaHDZsK67V+u
         VJ/zAyyNmyKyhGvC71W/Jf+HkwUVgzdie6+WNqvs+LeX/SPvr5+g3O2sVKtGAZgkbX0E
         1xUSdr3WTBglqKn/zAQF39mPQdVhqdNT5Nakw/5zb/H/AVdqy74vN1dnZOYchMgC7Uzv
         8/IA==
X-Forwarded-Encrypted: i=1; AJvYcCWIXQOSO9zAfB8c7cQmB3nw6720QH8AjEHljaWXi5j62PdGy1VdHplmvnUC2g+GEDW9TYZZxa/XQ+6BYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDO5e2+BaJmcSmTfJjDL62x2IAuQR5wZo3Z8JUr2eA2jVssZxT
	FfR7o50mKuAc1KdWGZESw/MvkHpciS2f76MjlC1osQdmiQ5LJMVQavUDa/hrsZcEtzkE3mu8Bx4
	Pdj93bubFnXIc25QoU9LPB00LrJjnn9PmboB6H/qewQ==
X-Gm-Gg: AZuq6aKoNOk3JuDZ6ampAUvKLnFBuYA7JJFnV42T9zWUXK5hLdEvkYOeg11Z36TWD4e
	/uBR5DmqVYzkwOnndqCvaRsbvsgArlY/riMieQvoVGc7KOABzAuE/6AKarXlGo+JcfMhvIDdsbu
	OanPiN5sB7bFuikfTxi4DTvdWX6WEL7stfhgdPVw1FPrdGROUhUXNPJTj64jsDhU7OOcnwIkOPH
	fMGaQET9z8lH7JrKpiGMWkR2yY+F5mOPP1XBFbotE2ZZY59tcEAm1OHukfu7wTmXPEn4ni4QPbh
	rixmW0suK8jgdp4Vv8skYaKPPEJBAOSl6KywSbDyElJhHcjV
X-Received: by 2002:a05:690e:1c1c:b0:649:c375:974c with SMTP id
 956f58d0204a3-64c55587d75mr4376174d50.28.1771520680340; Thu, 19 Feb 2026
 09:04:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
 <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3> <aThqcq0iGge1pQCr@agluck-desk3>
 <20251210010020.GA2522829@google.com> <aTn0WdVv-S_EpQmS@agluck-desk3>
 <aTqAxfiVCR2ch4I5@stanley.mountain> <CABCJKufWw4VQA_k6Deuf5Bn6401cbYv_St8VV_0-LAau6F0nTw@mail.gmail.com>
 <083ebd92-4b3f-47f8-bf0f-395a604b5f05@kernel.org> <aUVI9smf2t7PvDF6@stanley.mountain>
 <aUV7kyjxlijuy5sC@agluck-desk3>
In-Reply-To: <aUV7kyjxlijuy5sC@agluck-desk3>
From: Chris Li <sparse@chrisli.org>
Date: Thu, 19 Feb 2026 09:04:29 -0800
X-Gm-Features: AZwV_QgEIU-5ticNLcegsMRlOq6nRWIo8xAridFdMNrLj6Suwr-SXxpNMC8DPy0
Message-ID: <CACePvbVCwr2hc+gqUBWz++GKsk6+c97sBrVRFJ015jyeLkDbcw@mail.gmail.com>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL characters
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, 
	Petr Pavlu <petr.pavlu@suse.com>, 
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, Malcolm Priestley <tvboxspy@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53107-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[chrisli.org];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,zeniv.linux.org.uk,kernel.org,google.com,rustcorp.com.au,suse.com,vger.kernel.org,gmail.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sparse@chrisli.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4C71A160EB9
X-Rspamd-Action: no action

Hi Tony,

Sorry for the late reply.

On Fri, Dec 19, 2025 at 8:21=E2=80=AFAM Luck, Tony <tony.luck@intel.com> wr=
ote:
>
> On Fri, Dec 19, 2025 at 03:45:42PM +0300, Dan Carpenter wrote:
> > On Fri, Dec 12, 2025 at 02:30:48AM +0900, Daniel Gomez wrote:
> > > Maybe the flag fix just needs to be applied to the evaluation? Other =
op
> > > structs do the same. But Dan's patch did not implement evaluate. E.g.=
:
> > >
> > > static struct symbol_op constant_p_op =3D {
> > >     .evaluate =3D evaluate_to_int_const_expr,
> > >     .expand =3D expand_constant_p
> > > };
> > >
> >
> > I was waiting for you to send this as a patch.  I can do it if you
> > need me to.
>
> Dan,
>
> Al Viro thought this was wrong. His alternative patch is here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/viro/sparse.git/commit/?i=
d=3D2634e39bf02697a18fece057208150362c985992

Hi Al, should I pull from your git repo
https://git.kernel.org/pub/scm/linux/kernel/git/viro/sparse.git/
instead? I saw there is more than one commit. I assume it is ready to
pull. Please let me know if I shouldn't.

Thanks

Chris


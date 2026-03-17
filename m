Return-Path: <linux-media+bounces-56048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDmbOSY/uWkowQEAu9opvQ
	(envelope-from <linux-media+bounces-56048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:46:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FA22A927C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1860C3013B76
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7564D372666;
	Tue, 17 Mar 2026 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eztc4ESq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A6EACE
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 11:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773747936; cv=pass; b=DBvx0fzye8gQlT+M3MRzMu/bp2xmbJMIgyF4/TT29Y75lGQVtVG4ws/g+UPljsD0GsSJclzLpjqzyzM3tSS6wrpUT1S4uU4sEUwpw+HeeSFWAml8Jpha/FXgjpuOhsv8EEWS1yf5mu3ZsyFMk1AEYqNsLpW1LQl42/3e3W9OBes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773747936; c=relaxed/simple;
	bh=+t9IhjkIytd+JQcrQkuBgXXtVDEz5SaLAsReFPOEG6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpvYwip44vmnpghaOUcpd1g4x1l+0Oo0LDswEP12p/qopXIUsylu8wKtLjPyYlXO7EuGOY7HbdINj8GW0oXX9iOPUPYnAG1iLysmQyGipov5rDWfvEg2BT6LvwIrnqKN+Lp4b7QiTqcJY1cLBPWfIZoyN7z4Qz/1QW237zxiSjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eztc4ESq; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c7384f5a9cdso2446377a12.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 04:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773747935; cv=none;
        d=google.com; s=arc-20240605;
        b=QoUrZ5nICcl7aH7J1rsASs3HDY0+QQ1B+7p3/UBoLnJdF7RiO1SvCQCKWuWrxGk3Em
         RcD6oZhslUFIUXXAeHtu2cxVa31C1i+a8ebAn8feYfCZNYGXhBypLuzrRabOdzcbx22n
         hQb9maNM76LkK6c35lJ/nHSuVpvsjtIe0hbja6Ip7a8XCXblBhqCo3GQpqtvk2QguU1I
         KD7/StE4GaDamu5WdDdESd/kTN8H3XYyy+0GYC7FeqKsRduBY1UbS7e+gTPP3rLPTjj/
         HNdm0SF1pDJHnw1nw/cstJYLPBq2gfZWuiWR7O5rq9zo2k5e9Kc9oZ9lJkK1DUJYfiNY
         ZSfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQC1QWvI8SPm+yIEx3eg0CyhthKmqTwEeWabgDrcFLg=;
        fh=YMGO+S90Vmw5lHGxi5riZgwU4UAo5Syp/Ox2ulk8stc=;
        b=R/DW7t6uHitAtBs0G4szfxr+lwotCnJz9aYpEjxYVa3X11ok/QJE6gWGxzBic3EKFZ
         qEUdxfoK5OXdPPkFhW0KzP8zhBAyV41wEXv/s00W2vJdC1MrUoms0815vrYw2Y2xFyOP
         jeV7nLgGYK2SciwcxvflQ0lNQ5kt03d0n824GGIaqDJto1BNnB+8LnjKuXYr0AMr43rS
         LVHT4x1lIwPqIqG2KgESEtght+5k1Db6/NXR361JuwWEQ6PDUzwMRntSigxiGZUpte35
         hCG+jy8sPq6J704TVQ+hsDgdtZsJoDdRCoUmhAxlW+IhBAxYrjnTfhhebZeaSrM+UNDc
         YtHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773747935; x=1774352735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQC1QWvI8SPm+yIEx3eg0CyhthKmqTwEeWabgDrcFLg=;
        b=eztc4ESqHeDHDVtxsVcbehuUxUrGGXoD1CoR+AHkz1HvGd57hXUnU2Jbj3wiKDicOt
         MEuL5HMLhmFXaczuoZuHNnCKaHKDtr7MkLNszc8BzcZoNejOUIIAN6pNspn4fuyQ+Gnl
         0qq3YpZ9a4kdUzoWBebY3pm+NwAEYuQ9rV02WbGhUPVSJd/kvxe9YHcBd5asdex1GP3d
         gAjF5Cia780NibE77KcH4MvoHaoQc6AFwASM/V0VaiTZ7lLuF2jJ2Z3J1u9DVqjHUnMq
         4xrb98x34Ot+MJP0KZs+6c0AJvENbXRbhPc5K3LvTIVpzinot5mpSdK+dJK0eTj3h5i6
         0RuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773747935; x=1774352735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQC1QWvI8SPm+yIEx3eg0CyhthKmqTwEeWabgDrcFLg=;
        b=MWHl9jNBVhHosKdrNNuoagC+Rfr/kSxmO17L0ap52R/bmVAfORfV1JOR/piUptlyW7
         uGJ5FdI8HdWOsYX7KoQ1So8YKArSD9BLvn0ul1lEhiSJE4lkefzQQRL9PB9JfXGwaAi0
         dNd2Mm4hbT5E+jgETuvRTb01TGskymCIbduP4TfRKdKVuGaZdknEj9ncZXWHXVvR4bYm
         lOt2+Ol9iWAfDO7/FhDVJLFOf8+W7M3DSmX3Xuppog6IQkA9yK8sUuKLDWLeaY/7Nz7E
         xUKXPHHtS/qGpyiFCh7oGfsHWaq7e0HC6UPLX41wtISXms1LJQD3gFUosyTMqDf87PEP
         cUMg==
X-Gm-Message-State: AOJu0Yw4Hpynp4MkL9LL7a5H16vkOr01Oknaeo6KLruxqHONBEyttE8Y
	cHb/cdLUeow2ygbLI6VJV0nmJ5GNZh5tLNOpXE/lzUPdarmjsclK1WXnjiUi2JasuMGMy+qnoqo
	5Fpxn694Py7LsPb9VSh9V0EdZZOLzErw=
X-Gm-Gg: ATEYQzw8F8COVWRbeiPnlaKNFG1eZKyvO8P19cPsWZCwcyA0vUderSLGFnGOEeNj6bR
	/0CvlrcDD+LRbWxBSyx4ZkUQEsfZI5l1hkXQzK6NEWUsQZChrlSV2yEZoIBw5qLsX+aSKeSoFa7
	bj2N8EIxj7uqTymTwPhZX1rYREK+QQRvfVSaHdAbsPSVbo5KNVkhsvyHifj7pPDthLRc0bnoQjR
	QkEuiV0GLGoddL49PH4tf9eqjjkAnYoRJ5wSyIMN8dGS+Pk/0beOhFvyYAerxorHdPcLIG81kr1
	UimtoXajDQJCRNMGfmYaB/cC+FvxpAKTM4d4eQYEAwylRVhitX9IFItrPx6oNjDcU9IyodyVh1t
	xsigZa/g+dlKqdumocrlNpOSjVg==
X-Received: by 2002:a17:903:3850:b0:2ae:cb0e:fd5e with SMTP id
 d9443c01a7336-2aecb0f01cdmr183514545ad.23.1773747935030; Tue, 17 Mar 2026
 04:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102235048.1596-1-r3o2c7fi@duck.com> <f55fdcbf-797e-47fe-865e-27dad0c3545c@kernel.org>
In-Reply-To: <f55fdcbf-797e-47fe-865e-27dad0c3545c@kernel.org>
From: MVallevand <mvallevand@gmail.com>
Date: Tue, 17 Mar 2026 07:45:23 -0400
X-Gm-Features: AaiRm53lGcj_Y-lINTa4MicQvYEnQ71UOz5yiXVToV2EfxFdM-tDRuquAgAMcdw
Message-ID: <CAKCNfLXWzYn5YnLwRi9FPV5n_r3vF-1G97H8N=ONMK8m1rAixQ@mail.gmail.com>
Subject: Re: [PATCH v2] [v4l-utils, v2] libdvbv5: modify T2 delivery system descriptor
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Martin Vallevand <r3o2c7fi@duck.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56048-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mvallevand@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,duck.com:email]
X-Rspamd-Queue-Id: 86FA22A927C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 7:08=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> Hi Martin,
>
> Apologies for the delay. It's been busy and I haven't had the time to go
> through all pending v4l-utils patches until today...
>
> On 03/01/2026 00:50, Martin Vallevand wrote:
> > ETSI EN 300 468 6.4.4.3 specifies the frequency loop length in the T2
> > delivery system descriptor in bytes but libdvbv5 populates  it as the
> > number of frequencies in the descriptor.
> >
> > This change ensures that the byte length is correctly converted
> > to the frequency count, preventing potential memory corruption
> > and buffer overflows.
>
> I need a Signed-off-by line from you before I can merge this.
>
> Just reply with your Sob and I'll merge the patch, since it looks good
> otherwise.
>
> Make sure you use the same email address in your Sob as your 'From' email=
,
> they should match.
>
> Thank you!
>
>         Hans
>
> > ---
> >  lib/libdvbv5/descriptors/desc_t2_delivery.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/libdvbv5/descriptors/desc_t2_delivery.c b/lib/libdvbv5=
/descriptors/desc_t2_delivery.c
> > index f88718d350db..5d245cc973c5 100644
> > --- a/lib/libdvbv5/descriptors/desc_t2_delivery.c
> > +++ b/lib/libdvbv5/descriptors/desc_t2_delivery.c
> > @@ -76,7 +76,7 @@ int dvb_desc_t2_delivery_init(struct dvb_v5_fe_parms =
*parms,
> >               p +=3D sizeof(uint16_t);
> >
> >               if (d->tfs_flag) {
> > -                     d->cell[d->num_cell].num_freqs =3D *p;
> > +                     d->cell[d->num_cell].num_freqs =3D *p / sizeof(*d=
->centre_frequency);
> >                       p++;
> >               }
> >               else
> > --
> > 2.50.1.windows.1
> >

THank you Hans

=E2=80=9CSigned-off-by: Martin Vallevand <r3o2c7fi@duck.com>


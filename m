Return-Path: <linux-media+bounces-65394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kxM4FeN5OWpfuAcAu9opvQ
	(envelope-from <linux-media+bounces-65394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:07:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF86C6B1AC1
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:07:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KIfSLfVO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65394-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65394-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53030302C7A8
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 18:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C503446BE;
	Mon, 22 Jun 2026 18:06:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734BB3438BE
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:06:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782151617; cv=pass; b=DeLikpSSzP3db7Ztj9V6pE2SJO0zg5oQrDxhlitF2sHJwmY19aUlaIhDUJvOS5AnOJ3rAaXqSwDjBpkrWcx9hwJq9QdnfON1VM6L++q14HTDs5DvI/b1IM78CmRpFZJUlkNVRu4S5Sbw7ME8fyQIK/h1UBhGjlGhabqE8SwtC0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782151617; c=relaxed/simple;
	bh=ZFxvmFaQ3UKtaJOV1aVEKSwCcLraSMIZmP+OOYqgiO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBdGLxngwWdlXJHDGH4abddJiEKIq+ma1UksmGKrN72Cl6quxAFINjb1vdJrP157aRaQ4CkPMbkdV2/DozCZzg5UtfNdVGc1T2swyWHjb4TfzWuGgFwF8c2sq7bjih5iL89EVTZ/TE0D/EAfcoA6a7T2LZ9MgRDbbV7d6lWE4AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIfSLfVO; arc=pass smtp.client-ip=209.85.128.182
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7ff6d33ceeaso46828027b3.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782151615; cv=none;
        d=google.com; s=arc-20240605;
        b=DlXxQ6E68qM1Upjth0udUEtTcsBHIo3B4DK9A3bEJuraeZeD3oYGTvqoQv66O80Wm7
         E4v8jFyMvp3DRJMXm1C0TEahnXx0FSCyioK4t8qzYO8AChJVfcMq569ru+ihL0oWKbZO
         PmusRhCnFuDbchzeKqAwlIevm7ANM7nRqybalulCRmbOe0kzja+tf72QPgcD1J6/WyXq
         i5zlf+EFF6sOcYWWiIIBDNnVIKqipPSwhpkYM3STglbIxOMlZHOcgoQ63JvIiLWh0oii
         OkhGPGnHjkwWou5ozePGRKjXXIAHXICoGw/6eoYmE7pLeyWCmH00gh8IqIXQuOkK2pWJ
         z1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZFxvmFaQ3UKtaJOV1aVEKSwCcLraSMIZmP+OOYqgiO0=;
        fh=95fx0EQIqx61YUG4nr7oIK03ZNtNeNQhlOUWanS2GsQ=;
        b=eUFo9qbDIEJFJKlmrReRUfT5LZ/l+KMWHeXatKsSHRPh4tuF9VYSMAc4xI2afAu87G
         vnncmId/ofe4qKQpTGow/4wzhJ7IgD1I5TG+GBg8htgUW0/0bM202GmiJzxgyC6Dd2yA
         EKmdmCWBslCZ8VlMl/yJDBtKQllR6hrc67YCnOjVIDg6zdtvcVWsob97n/Z/D3Sc8v8Z
         u2dGw1FNKMK7wQFpHKZiU6TA5rdjlrUlINtP2GqrV5OqWxNvU3Jm5KUp1nWQ9ojQsOYL
         NFdDEr1XQ8vQr+4UVIhYi8DuITTWDe6kI0MJq9xr0RUBnBNcqMALxN+Uoo7oEL1sw/+i
         mSVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782151615; x=1782756415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFxvmFaQ3UKtaJOV1aVEKSwCcLraSMIZmP+OOYqgiO0=;
        b=KIfSLfVOm8KsT9A82s5ROm9QBP8t9Zds2i5OsP6d+EQPoeM7G26Ms33EuV5ShUKKdq
         Ch6mvIGICI4gZm3DFc+AlG0YxhnAmDl+VLGwqPXR2VOydC1fuYh5i9ii2xIJIwseydQW
         bKRVIoS+RRhwDbaTA6uCUMyLteFkEiwZT+gDnl70eyRJCrPBOopANpffyIAsvisRcQKm
         VGouskXQmVNMnkG60rTfD6LGnoVfeF6qwRxM+xpVgQMI6xmw01T3xsaKa/5pDcOfTJFW
         0cJFAADlElcOP98E2fKIQ3Slt4FxF7ODW0C7FmpRMd9BWdHjrWRi3j8hC2HoFobwOeTm
         tX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782151615; x=1782756415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZFxvmFaQ3UKtaJOV1aVEKSwCcLraSMIZmP+OOYqgiO0=;
        b=m5T9rDYjShGumdPzV1j+ufD6J5m5pu9jGcT7DfQdTuIihjCq4jIDsgDxX4UK9cmUUK
         5N+pgJDtzFs0wZ40f+Wsd3r6Lm04st/kxsAmdONgoP9fp7dHvzQf5cJumch2CT1EJN2t
         SuFsf0I4uO/3zoPyDk6qkGh8pJlq5ajMqA8KWPzJtaMjwxJOozxmHwvRY+5l6CDjhUbx
         dpd61zejBvZiLB/nb/sC1ku4RF4/e3PZu57rlkJ3x519RG+pxLyKj257YIzjiaLJej7W
         wVVtOrOdV1kNjFNYVdK+f+8wBoJDjp/5Sy/GHCkNcap4Vx/PbzYSzlioo/X5QCi6Kfoc
         ByXg==
X-Gm-Message-State: AOJu0YyacYKquCVIrJ0WhJgDhzVHSczo0bQXpG6WsAQQLjCIIGPhU59B
	pLfg61NKrWpyXWNgZry/v/qBQrp/jzmLNOu562pOTpiAtp0jJfguYPIPTtp9Hgn7ndmSLmrnz2O
	1h4ZxZRZhTQqYRA5dTbJMJsdv4obmaPsbpHHo7ck=
X-Gm-Gg: AfdE7clwma1bv9+FwPqRJvZh07lotAls1dkuZ/2c91/Nf1Qi9bPhjbuMFbF7FS+IZ3G
	e6j+EJ2e/UwafCgkOoRBSS8RzP3TD08DjcMnklExi09y/gFsvq88m3U01avDSCvtZHnQZoO6fm+
	0czEsvQNH5/GE1xhRQYQyC8ZETVaYWz/CTGIDq0Wk2wqpmv90860ei7/UeUmhES+4W9pkHZ2ehj
	KOgrWmyfpgogH73B0mn1Ru6FPSaoL6dJvjgZEQhdL1PJHosLv/9hEFB1F7K1RpYqZ4GWK3Z
X-Received: by 2002:a05:690c:dd4:b0:7ff:13d8:bc65 with SMTP id
 00721157ae682-801336f584fmr168668297b3.39.1782151615292; Mon, 22 Jun 2026
 11:06:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622173334.60491-6-birenpandya@gmail.com> <TY3PR01MB11346C45BB533DB88E29EC21F86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C45BB533DB88E29EC21F86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: biren pandya <birenpandya@gmail.com>
Date: Mon, 22 Jun 2026 23:36:44 +0530
X-Gm-Features: AVVi8Cfx5zpmZ9Ho_2C4oBanSIGqnZrz0LZft8yGHlJJxssbM3TnNURelKshtmI
Message-ID: <CAAeMi9JyHZtZUNjM_Wt=_tf0RQYYtN=f+QgNrJ4ZzC6hFWP-jQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] media: renesas: Fix missing media_entity_cleanup()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"jacopo.mondi" <jacopo.mondi@ideasonboard.com>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
	"kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65394-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:linux-media@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:mchehab@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF86C6B1AC1

On Mon, Jun 22, 2026 at 11:18=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Biren Pandya,
>
> > -----Original Message-----
> > From: Biren Pandya <birenpandya@gmail.com>
> > Sent: 22 June 2026 18:34
> > Subject: [PATCH v3 0/4] media: renesas: Fix missing media_entity_cleanu=
p()
> >
> > *** BLURB HERE ***
>
> Consider patch series description next time.
>
> Cheers,
> Biju
>

Hi Biju,

Apologies, I left the git-format-patch placeholder in by mistake =E2=80=94 =
still
learning the tricks of the game; I'll fill in the cover letter next time.
Thanks for the nudge.

For the record: the series adds the missing media_entity_cleanup() calls
to the Renesas media drivers (rcar-csi2, csisp, rcar-vin, rzg2l-cru),
which initialise the entity but never clean it up on probe error paths or
in remove(). It's a no-op today, so no functional change and no backport.

Thanks,
Biren


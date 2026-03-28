Return-Path: <linux-media+bounces-57431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKHxEHG4x2kQbQUAu9opvQ
	(envelope-from <linux-media+bounces-57431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 12:16:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B434E274
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 12:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33DA73047057
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 11:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9643890E7;
	Sat, 28 Mar 2026 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLUSLcLA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B176E377EB8
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774696533; cv=pass; b=o6lgbrQNHXXOqQRV6bXQKbDXkOKdKkbDzo39G+RqVPySkIWDMRinsFemHQHrub3oLHmSgahg7kvlxvOSFx2S607mqGA/JBXpdqz8pbxsJ7pOgjbm1gEZ9VuQ5sJKyqig4pn08YoxYYkjhYGdeJV6JrxPZfTop17s94vQWDXGXRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774696533; c=relaxed/simple;
	bh=GMvNtChBKJjdwyS/+GTl13oTZyqcxPbtMIjyiOqLNgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WOa6COM9awkbSCfbZAqSOo8ABwTYUNQstLt7juT2OeBX7Ad7g4vDFtQz40JSHw67+1+q6BD128KLNh+cGVzUOpNautMcvG86naf+7eY+Q+6otFmBRWjM6uGh0VHhWd6LCOFaHWHkXnlwT+tIDSjzmePAOJE0bt3DQLFM6/+HCp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLUSLcLA; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40ede943bf0so1874045fac.2
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 04:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774696530; cv=none;
        d=google.com; s=arc-20240605;
        b=OwN/8xE1Ll9UrGwNq4zcfOdswoursqW+DN10gEQfmD6zXNPktKQ5EdtOnD9wd1Gbn2
         2PZXeAs78ht1TIPEKR10OwZkJrBFPVWns8tWZKosETvITgcR4YJ5XFhVV0vi/I6YYDr9
         l8Ug5LSA7XT05+SzqSZoGKcaNaLIcrYxborD+ggeAbE05poDHD5rm08mXzLxf7wILbgX
         Jb8vhJTSbhrpiRy+TkUYfrzC4MW2qbdBtVHxo3JKVrixiPnKcNYiToRjI9+cVwagLQ9O
         32bSU62CwXf+1mJDFP6C1qhJuBvKJO0+WKODeqo35xzvfKALIfLtaWoci5sT0FO07vlr
         u6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cncPSoLfsUFWH5ZGfrEC9emTM1DT6AlrNfIAu40YnfY=;
        fh=2br0zGW24NIyEMN2UOS9tkXHYH3Ae/NCcEBr6+kcbas=;
        b=SCVIYq8KfjJVNhSC6Gm2ne+tW7DbOTkv2N4EMFVJpaJ3DAyOf1K3kXOQMeXWeqGqw0
         a+6aS+L+xdF5jRb5dNhssLCuOJm7mNMDb2EC6qYfjaVPGDIEsk0i4mj5Kmsw/r92jFu+
         KrIzOcKEj2/4oI3/hrbvIz6iocv/JhE4Lkx0Gf22xynCzcfQIeagFzRGwXLngP3NkHDc
         G7TEITje60UDVhmFG2b0SMitXLbCIij0g4fvQmuIaltuM8lPNIskz2MbZbtcWf9fuUKj
         kMaKTYIvZzjxiD9GQIGTkge268ectYy4H9NG6ywRG1wbcZdZaEm1UgCI2G8Hh1qPL9rM
         Lwwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774696530; x=1775301330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cncPSoLfsUFWH5ZGfrEC9emTM1DT6AlrNfIAu40YnfY=;
        b=kLUSLcLA4U/K2O0nS0HM/cQnl01PqTYP96CazcXuDqSYUxhN/Hi6udmYHm9OV93NxD
         AKasxCSmS/LI1+A0yvDKxBdRpYU/hPnN1Ovlgol/eeJVfb/eXz9GfZspbF5dBZ4KIUer
         y3zngsYX4plzzQFG1Qpt0qaZ7JMl+V6ZFTPgMxd9ZMw3pr9WMgCpcM4YyQf2Kn9+YlAc
         3LM3lEflmhEk8nHR/juVBlN5FoCeZQkdc3O1DIckjNqXRtNV+oUeT3hAcZR+PloCitfI
         VQcf9sLuIk9kfjPylwMArKVOCTMHgG1ixUBdRaoyitjXTOG7GkaPA+wUSDQUiBCX2+HO
         qDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774696530; x=1775301330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cncPSoLfsUFWH5ZGfrEC9emTM1DT6AlrNfIAu40YnfY=;
        b=sfCu9aJXnsoGN/FfsPNF++Fwtn7odoDgxPjmqU8/46rmveH62yceOgJJoWLOpdLAq1
         RXUY5921I9rUp9648k5ydy8DgdjsdLlr2q59EI18Y+CE4SRzQghi2Rd4ayneVv02czl/
         DWYaqGjHcaLqZaHtAh9bM2RDmm/equLT+9Efnaj8uwXSbTTSGXbZ36aJoaFA2oxTHM43
         ilK31GXgdGDX0xqcieiJGWiGa0fFqExdYIr5bkdodkAh9UDhS1G28cFR+CimsLTQj5pQ
         IQXLA17LoeeTrchLN22TI4zIgZRQNzEi2rGm6NbV1zwtGVKXA/4tKKGnPo5sDSStKQFQ
         CeYg==
X-Forwarded-Encrypted: i=1; AJvYcCUEORtn/LGNjHJeTeCaK2qpk7tZsVgNLMlZF5JxXZ9XX4Mkq7elf3KiqC9Qlw+V/vVKxIgHFxEf3R2gaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdHnHGNjwuZ2kTmH+iMMu1zqYDMJg3rtfSdZge9GCPh6+7UXg4
	Pxnnc5xK6MPkuyDhJ+n9i8ZzKGsBuY/3J8KfAvq9Xc7acd0Ly1L4V9wnMTuQUR8y+Ga3XTqdWRV
	UR1ENG1PBoYhjQAabnwqdyUi6+i+dYoc=
X-Gm-Gg: ATEYQzxL7g/ElFEPbk2HqICRbuaaN2jWr1EL6s9Gfcjn1i8AG/r3Izj0BrGYmzKlgeV
	fKdHm0Sv1kLrAgfrpK5KQaTf8SCInIyN77w2MnotTG8t3RpdUPUho3HJzWWqlh1niwg3Yuo6Tw5
	BYse+SLtirCsrx6EY6cNLs6hewdP+vcg1dI79FTN2ieitlaMXDkzJCOlWWi/feBhbubMXrkeHEp
	sN5BCnl9KI7a3IW03t/+HNzw4Z+OOd+O0kexTGVZEys6DvOyyO1JzqbVhQbEJUDC2XHoHvJGfPn
	AuIN/5KW3CFa1E7imppQ2xMxfwn6KoM0LboA1g==
X-Received: by 2002:a05:6871:341b:b0:409:57ae:54e4 with SMTP id
 586e51a60fabf-41cec068104mr2925514fac.9.1774696529587; Sat, 28 Mar 2026
 04:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327222711.268132-1-devnexen@gmail.com> <20260328100010.41236-1-devnexen@gmail.com>
 <2026032803-tree-stubbed-1e9b@gregkh>
In-Reply-To: <2026032803-tree-stubbed-1e9b@gregkh>
From: David CARLIER <devnexen@gmail.com>
Date: Sat, 28 Mar 2026 11:15:18 +0000
X-Gm-Features: AQROBzADIpiaAdAsSWDXr_2MGaRWWGqF3eyfR0B6mVPGw_ItYK7BztzM9d0l-jY
Message-ID: <CA+XhMqw+pR3fLGbysq3FnfpH+b2GtmdhSjjgCKhTwfZFrF0_0w@mail.gmail.com>
Subject: Re: [PATCH v2] media: nxp: imx8-isi: fix memory leaks in probe error
 paths and remove
To: Greg KH <greg@kroah.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	jacopo@jmondi.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57431-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,kroah.com:email]
X-Rspamd-Queue-Id: A57B434E274
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 at 10:21, Greg KH <greg@kroah.com> wrote:
>
> On Sat, Mar 28, 2026 at 10:00:10AM +0000, David Carlier wrote:
> > mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> > frees it on any probe failure path or in mxc_isi_remove(), leaking the
> > allocation on every failed probe and every normal unbind.
> >
> > Additionally, when mxc_isi_pipe_init() fails partway through the
> > channel loop or when mxc_isi_v4l2_init() fails, the already initialized
> > pipes are not cleaned up =E2=80=94 their media entities and mutexes are=
 leaked.
> >
> > Fix both by adding kfree(isi->pipes) to all probe error paths and to
> > mxc_isi_remove(), and cleaning up already-initialized pipes in the
> > err_xbar error path.
> >
> > Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
>
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.ht=
ml
> for how to do this properly.

Apologies for the confusion =E2=80=94 I wasn't submitting this for stable
inclusion directly. The Cc was added based on CI bot feedback since
the Fixes target is in the
  stable tree, but I understand the correct flow is to let it go
through the maintainer tree first and let the Fixes tag handle stable
backporting.

Cheers.

>
> </formletter>


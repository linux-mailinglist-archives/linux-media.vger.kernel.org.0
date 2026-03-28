Return-Path: <linux-media+bounces-57456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL9CH8X3x2lMfQUAu9opvQ
	(envelope-from <linux-media+bounces-57456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:46:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D178134EF96
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F832302BEB8
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755B234DCD1;
	Sat, 28 Mar 2026 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKKSkX+y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8023031715C
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712505; cv=pass; b=Q8r3toA5KH7AssXIhK5vnKuTyFIi4jMR9S4zbAJxcZkWBJnfXE4VEG4PiPrzb1frQ3MIAY/twEHm2gX1+qsvVQhQAs5CHU7cQp/CE+7e5HgCQf/HuSY4dXQCqS5w9+N0QCt2hEGv8iD4aRExzfUUZB2bUk485G2Ra0psHZffiJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712505; c=relaxed/simple;
	bh=y6n/CqLfd38hQW6svuKj6rGCU5+wiH4QrowOutXhZbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBGKGb7nHG9uqiTLi+dvui7LiYw4Hap21tsBSZfaaZkYBWt1UFvo/Wl5uImzZwqJjP1svuzszxSy6RBbmo8ayevn502BqyaFoDUNo+GBkCgnbWsLCI60x965HuXsKrq2YpmY5QdgSr2mwrASxNPgD84/HVlQFVefdoM8cPxTnbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKKSkX+y; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a1443780c4so3421476e87.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774712503; cv=none;
        d=google.com; s=arc-20240605;
        b=eYJeC9mLcMJDtF64C8fUgLLf0Eaen+MXe3pSUEUcdfBj5OqXJkz5fGJtjWVReJxT3m
         aOwdvlAiNl8WZHDBxgTsFUygv34pLs1xZJs7qZ7zDHNJLkfWW2aupMwERmAG48hGCxe0
         998hfyY5nMnIWmG8uFN2PreFTBVBLIvV+2m8JtVQDaNcTJe/BEaNS/wtV43WLB13copI
         xCnKlY6jWGK3yZ9iFGV35kgLU9BSImoByuGD45tUdtuRujG6p3DRjamLBftD+hSUKlZm
         AynoWR8SiFCIxeuE9Kb/oGR7q557k//Wh4/GPBar6+11+S2h/7Xa1Jnz71JFO7EAqlg3
         LlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=haMXa5Y39fYyaZPwYN+n8TJLxpZQGLuvRxS6HRz+Zto=;
        fh=64eoC/vFxshyMvCmYE/xIcALVdHOxSC8NPMkYN2l/ew=;
        b=Jrxoss8HhrO3Yz5ORh6GimkXeXk9Vpcg2SH7z7zvgsB1aww/8JSMVkLGZEWEO+Uh+a
         TYtMEPVypLV3V6a0/bJoo5etOEj8DFKFyBpePC0VGDjkx2lwcUqh++HIMLhTWw9abZuf
         Gg53AaHL3OlAZL8xHd6sDiwfdpdhhOTNA4aL8QQCVkrZm4LWyHJJ35To3OLDKqm6+p7O
         0PpgDKU1HIZnCNWoCSid0NkCJlkCYv2VIqr5BLaytqbrq97K1jf6v3XQmVkTJbfRobA/
         RoYsgtb4Fz2CJU91Mcm3oWSWtxtsZW2cweaKB1NTEkYZJuuvLnQ+NW5UfKY67uuDbLmi
         sxxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774712503; x=1775317303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haMXa5Y39fYyaZPwYN+n8TJLxpZQGLuvRxS6HRz+Zto=;
        b=MKKSkX+yvGCybqnTv2SmuDwU+kBCO31y0PPl9KpJK/sg/0y1cREdXIyz9xxrVBawlT
         tpaskZPDbyrMjbozDb+jNJO8tLrIuy6Tcdv7C1zF2gLZSwW1ovLHQxJ/4v9YUi4YSTx+
         Aot4czgXH4iOoZ0I1+F8X6xnps732oRpFWaT6TFzj12uRCQO8ms0eYoH3blnqWf6vOSE
         HTqOW50J8ZVf7IiLe1UfPHQslW92hl6G+1Tk2fyvfX17Xz2O9flmpF3Hye/FzBbtCQ0t
         emSSyz2LQzGsQ2yva0qQgmdAgwMpL4CfxdhxlvvTzRCjaXxb2lNf5HiLNCjE/unUk3ul
         AmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712503; x=1775317303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=haMXa5Y39fYyaZPwYN+n8TJLxpZQGLuvRxS6HRz+Zto=;
        b=D/Zw5NS/YmHzFSYGfU8pGB2c3vt3otzxG97PiAMYZq+n0u7kYWfwQhRYOYzcf0AgeP
         V5upbLS48VlYvG/wSAE9CYk7jrrJ+pPEsJUcA69OcsB7UzzbI1GCM+/X1E5nrapn/Uw7
         Qil9cL7TCWNQhgZdBbqVAbfOeXdLlzb+1G7jYwXPikcdQKGAY50bGZV6NAyqg/Fie4Rp
         7IyGSpZbsEQtEznqnlE/JxVrXJT4/Lkr71//RJIVQ8VCtpo9UUMbEagBuaYKN46joGmd
         8O780C4qBflfthszW+K308WD3ZfgYglxkhgWl8A3GFW8kl8WzfOgY1BbHSAzClLcBUIP
         ETaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8p/6/W6aTzndSDkDgbH/xj906fexWURE8P+mDzt4GJzBoRd838Q7a99Uc5XkC/FcRc8iW49g3L/wonw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO7a4Z+i/LpYGkRkzHjcgyf/tjnS9vuzRwR8Z8JyK/OhENKFWJ
	z+ajlSt2lUuHtqKCzkto+nlJTZcyJZgfO8kLBiavxml3zEbEYdLgTipV0k0ZE+f1KzjADjLKeub
	u1z+/PXwb2DOuCH5S7coHNm0ezn7GHq8E6NYmNHI=
X-Gm-Gg: ATEYQzwhCGyRcd/OxYevzMNlxPEcYxcqoMaXOKNW/svkh18p2PO0H+lEMLkQ5EABLKH
	Ga59WVyfXPEB4/ClyuTBAq3dkTG54tWzsB/3EziTxY1oay1CctEPJgSASq5nZtR7DYnXFd1d6xt
	fi8Ou7EWbbWwKV3Skz7UbREtUezMPnWCLS59ROrEAXDh7zI8ZslZ79BCejrxQYCix5P07M/F4Z5
	Q5M4RkRnbtv5S5ZpOyys+/gKSBrCucdIY5T4h9/wrLnM93XmagiDNWHiEBIxy2Y+BMtFn3b28jE
	4aVCUwZoqzBqLqOQvz5SysHSHV1U7/vFc91DSx1P4VIl0OjFOE4HmWeBapqjyApDlvTfrw==
X-Received: by 2002:a5d:5f84:0:b0:43c:edaa:f5e7 with SMTP id
 ffacd0b85a97d-43cedaaf6b1mr4522070f8f.14.1774702587577; Sat, 28 Mar 2026
 05:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <CA+V-a8tGfAzMdFgY7U+pLitDXbnj3xD8-RzXjbkOQ-iH4mtkug@mail.gmail.com> <acfBaMdKDThNhfcX@zed>
In-Reply-To: <acfBaMdKDThNhfcX@zed>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 28 Mar 2026 12:56:01 +0000
X-Gm-Features: AQROBzDQxXJq9DcMQqTPEu_ZQIpk00QlISExPIMUG9fDeLEmqKbhf2mBTMgDkrQ
Message-ID: <CA+V-a8s67j2kFO6moUjKdEBL9uC0s+dm_GxBJetMHPCPDSPppw@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: rzg2l-cru: Rework slot programming for V2H/G3E
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57456-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: D178134EF96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

On Sat, Mar 28, 2026 at 11:55=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Prabhakar
>
> On Fri, Mar 27, 2026 at 05:25:30PM +0000, Lad, Prabhakar wrote:
> > Hi Jacopo,
> >
> > Thank you for the patches.
> >
> > On Fri, Mar 27, 2026 at 5:19=E2=80=AFPM Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > This patch series starts by collecting a patch sent from Dan in the p=
ast
> > > which improves the HW slot programming on V2H(P) to avoid losing fram=
es
> > > under heavy system load conditions.
> > >
> > > Tommaso also sent a series a few months ago for the CRU from which I
> > > collected the first two patches.
> > >
> > > Around it, I've reworked a bit the locking in the driver which is a b=
it
> > > coarse and causes lost of frames under heavy system load conditions.
> > >
> > > Along with these, bit of drive-by cometic changes here and there to
> > > modernize the driver code.
> > >
> > > I've tested on V2H(P) but I've also modified the G2L IRQ handler, so =
if
> > > anyone could test on G2L and G3E it would be great!
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > > Daniel Scally (1):
> > >       media: rzg2l-cru: Rework rzg2l_cru_fill_hw_slot()
> > >
> > > Jacopo Mondi (11):
> > >       media: rzg2l-cru: Modernize spin_lock usage with cleanup.h
> > >       media: rzg2l-cru: Use proper guard() in irq handler
> > >       media: rzg2l-cru: Remove locking from start/stop routines
> > >       media: rzg2l-cru: Do not use irqsave when not needed
> > >       media: rzg2l-cru: Remove wrong locking comment
> > >       media: rz2gl-cru: Introduce a spinlock for hw operations
> > >       media: rzg2l-cru: Split hw locking from buffers
> > >       media: rzg2l-cru: Manually track active slot number
> > You beat me to it, I had a similar patch internally.
>
> Oh that's great, I wasn't sure how this was going to be received!
>
> >
> > >       media: rz2gl-cru: Return pending buffers in order
> > >       media: rzg2l-cru: Remove the 'state' variable
> > >       media: rzg2l-cru: Simplify irq return value handling
> > >
> > > Tommaso Merciai (2):
> > >       media: rzg2l-cru: Skip ICnMC configuration when ICnSVC is used
> > >       media: rzg2l-cru: Use only frame end interrupts
> > >
> > >  .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |   2 +
> > >  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  28 +-
> > >  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 328 ++++++++---=
----------
> > >  3 files changed, 140 insertions(+), 218 deletions(-)
> >
> > I'll test these patches with ISP enabled next week.
>
> My testing platform is v2h with the ISP, if you have a G2L could you
> maybe give it a spin there as I don't have any board with that SoC ?
>
Sure I will.

Cheers,
Prabhakar


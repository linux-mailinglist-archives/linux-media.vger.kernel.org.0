Return-Path: <linux-media+bounces-54695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJpnFCZyqmmmRgEAu9opvQ
	(envelope-from <linux-media+bounces-54695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:20:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C133621C012
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D19430474D7
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 06:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522C5370D76;
	Fri,  6 Mar 2026 06:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wk+XzgGT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8088A36F435
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 06:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772777980; cv=pass; b=k23Wg38Yw2oD9PSd7y6BNCzIxJn7pbyUF6hNab77OoGDcxYhPeAOX3vCOOeG7/CpRoHav8bxyuukB6jfPbctkyUCi8NKyXMvbKn8QvgmSy/vpB2oC/EvQPOVzXLuxJEL9X+VDzqRPuw47EDWcLkrUTlePV5fUDxFO2zc5Usj+AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772777980; c=relaxed/simple;
	bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkgyJ0GrCnD1DyBpFcD0oSLmvGe7w4Fbi0cywlPQaq6+/ElArzYAAg+q4cClh/Yk12iReuyA9YmAj7n3kQSmEJ5pNGB8ujHxuZYNHpVwERmjt8iX+vuFvVm1DtGs3ULybkJf3MJBj/KdxU4ZB8kvtMT+lzNDpgC83QdV/gOgF98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wk+XzgGT; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b941bb3e23cso164113966b.0
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 22:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772777978; cv=none;
        d=google.com; s=arc-20240605;
        b=RS7puF7nZEVTZDDcWuLGPwNLUfnTFBv2ks9+6Ca5aaXuqIOnh9mNNkBtu5cp8ojzhF
         /QU3v1nfzLmDIk1vgrc01ze3MDgC3kIasJ2GtSAGFTcnWrdjWjXdGjzluvpBTjo8I3R6
         5Gw+/J8EzcjtA4SrUf97FZ61LKm/ux7S8Jk8mLLCHnKz6wGaNfHvzXXk2iU3kCQUdI3r
         jDRGdIIsgA4AwMWO7jepo2qWf6dMYPX6qIuJn1fMW6x0jS6SU8sxltj2ztMqyV8Uf4c7
         zmAUall7dag7czjJq6SAphqgZPiA80lSQtEGMjFlEhu5siJVJJdaDqi+UO8OL1mtXppE
         b3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
        fh=qoVn0xwOuymNWt1pah401hvXqNEbzy7WHYAy8YNZY9k=;
        b=Sqnypq4+GwtXCz+y87aeA2NvSSgZILqbfSpzw9rdNFCNn0K2UuTdArZMWFRq7TI2We
         yr2nPFDcnRodFue9K/v3CkKyeZdl3yNoY5Noi+0R6s6jR1i+LVqImvCcmvWLqFlCQmP+
         Jwm2Ovj/HVwLp+yRaOvMp5NH6qxTr5A8zyH12oKhPcZ+tMEI28Uk6BiGTi9x15/IVlv0
         CsPr2IvpP+PlfgHt/lEIcwjYbVeXyZNQt5n73s3fPbAk3GzuZvQgqsjJ+I0XjOLuURFs
         in+TAkElywxcg6s8DmKf7T010BAEmRcGSCrtXA2iARN0J1ExUXn0uSaa//GKkB/IXALz
         dRgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772777978; x=1773382778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
        b=Wk+XzgGT0L6XZ8jL8ce7A/Rjr9z8scgkIA5Eg04VppfqVky6hpibzKxqwlDMdFkHJh
         lBBPERs4VjeiN3+G0sVE0FO9m/+1BZIzai9xIfGAYwTYHnExOq4+vdPPSKPz9qQrZdGm
         lJ25jrRKEiGVLtVxpOy/vwwdqgqoPqQFILfnro6ZyRvxA0c+6x2twqqcEze1FjdjLXp4
         wIx/oM9QW///v9oZK8CIM5C5n2uS8t4+XgWjGbz5pHY6e6Ay5zBTMDc4m/cActPvIn/X
         uzZN/TCKL4YQfcLsO7wI0TOnYztkVycCEDZYc32gZ2uQc0sB9R/9Ovyprrx/TA7QaKbY
         mioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772777978; x=1773382778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
        b=RXdlC0n6Xh51FsCeG2tPbR46HL13H8GM5usopdbsXJhxAjOxnigZsrvjhO1FBwcYEt
         yjROCGfihX1Cq+2Td37bUtvYIS1mEHFxkdzdrh8nMflIKJJbxXzBPp6E3bNH1F5lME6e
         wU2ZcnVCw9HEknL4xz1M8J2Jw4GAil6Zl/q4ueoqIU+/UZxBAl5TcoL7RvZlFVmURkuA
         bMsYPmrZIz0KOhJfojMzlncvad/CNHFvUJR0RFFjYIOM5AO7ckAn5fjJ3h9ZrmYWEv+Q
         P0XSNFO+36Oz+ipSRKkuSY1JckGdwcB/s4OrnZvbaj5vG94GrchqKRzYXUlnZiFjjEAl
         xVWA==
X-Gm-Message-State: AOJu0Ywax7cCHU84Xxz8BdFB3qRHYIZXSP0DuDmf3OXxHRtYHWhDKl8H
	XmJvrkJ4egMlsawv30+K1q4dFoLy7Xocv9zlLvEERzBCe5AMiwP2HIWwYYwPfECiBmiPgQBF+mS
	vhvgdY1mev8A8gkjlkmwByQaI/MogprM=
X-Gm-Gg: ATEYQzwcSyGnEctjCPAs2hl+ROkl4rOVBCf+Ac417N0VWjc2ahwo5AEj4OP+KUvv4M2
	IKeqch8g2RYKlYB0+FB8dwI4XcBYitRN1YivxI8UarDCMDV7/ww5PEn71959oMIzR4IgU2t2Ahg
	kqWziWyEWjAioUDKSq/OCkPH4MxK9XpUfpgECgYcAp8EaYEOIHmIea22aVMAqRjLih5NIvSWhoo
	55IP7wc7TzEL6xvZZx7hcYNaTLBd1pyBxCJX8ur5bSxdiTNsVFH/Lwxfx8nGiR4TT73q6kpt8Qw
	Lbngyl+L54NGem6H3CPFl6hWmXuMK3uy6vKmlzzdRI9QM2jEQWdkkQopdChlaRm7URGcwsl3q45
	2c7PevA==
X-Received: by 2002:a17:906:f5a5:b0:b94:244b:2ba8 with SMTP id
 a640c23a62f3a-b942df74e45mr44939766b.29.1772777977596; Thu, 05 Mar 2026
 22:19:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <aapiBcnPHa3eDLN5@lizhi-Precision-Tower-5810>
In-Reply-To: <aapiBcnPHa3eDLN5@lizhi-Precision-Tower-5810>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 5 Mar 2026 22:19:26 -0800
X-Gm-Features: AaiRm50x7YMCKK1F6zYGE3uuqGNee--50j1jpnmhfHu0gWe_LApncHVHg97bcLc
Message-ID: <CAKxU2N9TyRe_o6zj5pNRdTR65BgZZ6brsgRuq0Oi1EFvQSCiVQ@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-hardening@vger.kernel.org, 
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C133621C012
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54695-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 9:11=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
>
> Subjest: use flexible array to fix memory leak
>
> > Use a flexible arraay member to combine allocations.
>
> typo array
Will fix.
> >
> > It looks like pipes never gets freed anywhere. Meaning this effectively
> > fixes a memory leak.
>
> Remove "It looks like". The pipes never ...
>
> Because fix memory leak, need fixes tag here.
Since its inception. Lovely.

That had no struct_size AFAIK.
>
> Frank
> >


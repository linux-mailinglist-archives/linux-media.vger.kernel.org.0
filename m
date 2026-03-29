Return-Path: <linux-media+bounces-57514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLUtLOweyWl/uwUAu9opvQ
	(envelope-from <linux-media+bounces-57514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 14:45:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E92351FB5
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 14:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F04623016259
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 12:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F58136E487;
	Sun, 29 Mar 2026 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sykENkDT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603D736EA98
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774788281; cv=none; b=naCVFTA5bHwIByq2Ddhll+rO0FV/1uVLHTMgsmHoZAbWIPrtVc2N77zGwhv5Hb1AM8fy4E+XQRil2kfu90hyVfBVBlXN9XphqePuAv1Xm22rRJ2fAtViMu2gaOqnpfI7HZmCHA11QtgvA3qeuaTZUHe6Yg+dlPHzzfRUT8nhKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774788281; c=relaxed/simple;
	bh=vU0+X+y3jioy6E9J30w+FzWYOuFdPtfTOpozKDtwEEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ4ILXNgFqZqMtqXzQgvJaGaHbr7J/0jIGg7uQztVU5itaNQqK/I4HOnhUjiajk/jGJ0NSmuZGlNnjCiU2tSFjjixJJyIUIfVF1fatZg+bTD5NpAPLE4iib39elHAGI5OZkkldcamv4qWBv7JND6cCNQVEmd43q+6lrvy1HVyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sykENkDT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05F5C2BCB3
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774788281;
	bh=vU0+X+y3jioy6E9J30w+FzWYOuFdPtfTOpozKDtwEEc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=sykENkDT++Jf86J8mOgWM6MXobVRK7SW/QNk54DSf995REgGBtIdJj2QRrmJqHA3G
	 oXpmbf5/h7xLeddkmdyIY3BKhMpQ4nf/l4hNEbpzE3MFo659oVTzR7fNISdVs3xeA+
	 Nvt+8WbZcwlvU7eNe3431MVo2eVLLxVuYWjLbRkOy6m7fbYk7T9aRteKtdCIEr5FTT
	 XUaY+KAQeybXF9WcNfuHEWqqn39Z1YaIZUSZzoSkN/gGnkfBoCkFhsLtjaEixEjqnj
	 3nW79M54oN9h6HTPMzK9TbGmmYPLSc39jDauyk6twRCdQf8S3gARUbaU3h55NMFr/0
	 Of/VKc1VTOHxQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a32d36396so32346331fa.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 05:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+NX/hgQYemmvMJxaadyBwev17cyVZog1Z+F1pfXcJsO6vGzuWJxr5W6Bl/LiEzJB+QZMHVQiYTUKNmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZUFmhgYh2tN8eSWU6tk9v4W0OtRGtBwPYq9Xa8zNCSU9swXm
	nsjO1Ds00LnFGUNS9v6WFSc7P+mACcBTWvjbVbzMJAHbloHXCGWc7WOeRV/lB34eh1lY5CaG8hb
	eyjNmjd1h+rh5J8uRjsmfQWlIwQKhULc=
X-Received: by 2002:a2e:a54f:0:b0:38a:2a56:9546 with SMTP id
 38308e7fff4ca-38c75c900demr24797411fa.13.1774788279369; Sun, 29 Mar 2026
 05:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn> <2823210.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <2823210.mvXUDI8C0e@jernej-laptop>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 29 Mar 2026 20:44:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com>
X-Gm-Features: AQROBzBu8cBmUz_qtapXabXSe1cUlYbMC4_Is2O7MBHQ-BNPxfI_Wv0OKcRIafM
Message-ID: <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>, paulk@sys-base.io, 
	mchehab@kernel.org, gregkh@linuxfoundation.org, samuel@sholland.org, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57514-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 41E92351FB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 5:21=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=8Das je=
 Pengpeng Hou napisal(a):
> > Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> > stateless slice control and later uses their indices to look up
> > decode->dpb[] in _cedrus_write_ref_list().
> >
> > Rejecting such controls in cedrus_try_ctrl() would break existing
> > userspace, since stateless H.264 reference lists may legitimately carry
> > out-of-range indices for missing references. Instead, guard the actual
> > DPB lookup in Cedrus and skip entries whose indices do not fit the fixe=
d
> > V4L2_H264_NUM_DPB_ENTRIES array.
> >
> > This keeps the fix local to the driver use site and avoids out-of-bound=
s
> > reads from malformed or unsupported reference list entries.
> >
> > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Tested-by: Chen-Yu Tsai <wens@kernel.org>

This fixes a KASAN slab-use-after-free warning when running fluster H.264
tests.


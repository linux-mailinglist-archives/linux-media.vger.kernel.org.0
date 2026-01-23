Return-Path: <linux-media+bounces-51401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCCzLbwvc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:22:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D37272634
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AB963015A51
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2C8344020;
	Fri, 23 Jan 2026 08:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlLcw8yZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528FC314D1D
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 08:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769156536; cv=none; b=MFdWbemLDRKCP2v4mJpxUAGLDrTTcXmG3iQEOhaCuWF/9IwAiwNaXiSMPwtlHKnDWNdy1M6Ha0GIlV57QOEDQriWeqOpdH4kWiFl3BSp9MADvsb1iCmgk8LB4o+r+4ObRIY7MFL++SYAXtRgpnBIvlNRi34miDa35vIhGkFSiEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769156536; c=relaxed/simple;
	bh=lph7PKeZtySHtJNqYGniag1EmEc9Fae0xkZ5U0av8wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cX1MmoowzzrWQNGUkYZHUTnP1H5mKkSIN8I6vPaXjhwiMQPTAo4aJWKmtJ1p8KCxkdYLQ7N6FiAKWLpkNuYPHgSpCuJfz6eaJ3aBGpM0nILlO1e9idXntwGElMg5d9uzovfm4lF0h0ianZPjcrQdRPDrBfTMwLi8hZ0Ud/Nixnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlLcw8yZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0094FC19423
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769156536;
	bh=lph7PKeZtySHtJNqYGniag1EmEc9Fae0xkZ5U0av8wY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rlLcw8yZx+fFLhd4T3k0YEA1Uk07LyjPJLdlzmiR0DYichyjBxPIfOhWSyr5M6t+v
	 UFa40HQKdOCbbHMhqpc6nhWyp/JOlOnsP+dVY5KqVp0e+WXHD+DqLvBjDn5/innvoG
	 1JMGwK0wUwDqSsrwevGYQQKi2puXj0Bb6bP97vaH2/3O5Zx/q/J/XB3GyaqxefKVWp
	 NBTQcAsguft7GOZzh2h2HKiKK9JnhSJoWy5w9EqOBSSi9bbELUsmtWDHs57MYfcfKp
	 xIQC3P+fmGWyO+fDOaJgIPXiGApGWZ7is6R5irrqCtUP0AMhVaH6gkL3u2jQWcnISD
	 pN64Obl7vsk4g==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-382fb2bb83dso12785951fa.1
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 00:22:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcR2pJXxlbQyq4Cs2XhZswK6pdjJTCLp+eOACCqQlPE3fGkbt/ydTjAoEcvv/pnWuCp8hZCKoZ1d9Wbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrlUXK3qFGBZgAZn3RO2U1sSzc+/3u6vdkYjsJpEmOPdvxcMva
	KavsJ+vvmesOA5Cxu66J4MzOgwL2jInhkWdDG5ge11ClphiTRxEG3SL3QvKdW6vrJ1aom8tA/Nw
	cgQt7OzK8P38aYxw5RXEQivyjZQXSiTH9No0hXgRkPQ==
X-Received: by 2002:a2e:a884:0:b0:383:1704:2203 with SMTP id
 38308e7fff4ca-385e1bbf407mr1910431fa.27.1769156534681; Fri, 23 Jan 2026
 00:22:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114080913.11960-1-bartosz.golaszewski@oss.qualcomm.com> <aWdjds28O6Ph76_I@ninjato>
In-Reply-To: <aWdjds28O6Ph76_I@ninjato>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 23 Jan 2026 09:22:02 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfPJXJbxqrPhe1q+Nv5P=DmTKv4QR4iBR+jDibh=mzX8w@mail.gmail.com>
X-Gm-Features: AZwV_Qgeof2IdJFmWa_NAuEQ3TbElUUJyW8U0V8zLPDWcwrGDMYFbU0RJ7z5Yg8
Message-ID: <CAMRc=MfPJXJbxqrPhe1q+Nv5P=DmTKv4QR4iBR+jDibh=mzX8w@mail.gmail.com>
Subject: Re: [PATCH v2] media: saa7134: rename i2c_dbg() to saa7134_i2c_dbg()
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51401-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sang-engineering.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D37272634
X-Rspamd-Action: no action

On Wed, Jan 14, 2026 at 10:36=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Jan 14, 2026 at 09:09:13AM +0100, Bartosz Golaszewski wrote:
> > Ahead of introducing I2C-adapter-specific printk() helpers, preemptivel=
y
> > avoid a conflict with the upcoming i2c_dbg() and rename the local macro
> > in the saa7134 driver to saa7134_i2c_dbg().
> >
> > Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Great, thanks for the update!
>

Friendly ping. Mauro: can we get this in for v7.0? It will allow me
not to bother you about this next cycle.

Bartosz


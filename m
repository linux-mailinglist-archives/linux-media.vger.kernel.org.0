Return-Path: <linux-media+bounces-62005-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGfxOSAfC2q8DgUAu9opvQ
	(envelope-from <linux-media+bounces-62005-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:16:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D656E868
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13B98304D90E
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6493848AE0D;
	Mon, 18 May 2026 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XcCKlePQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEfglShx"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C83624A6
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113662; cv=pass; b=LgjO//+qqQ+maDfi1O+i1O9gvIGJjG+hF6ITlJNmsR2wubAKrAfyqZCiqOXy+rcMOw6jwSRk6nx7pGtzIta26jgHCEgaXMphy0eYPFXZ1FUYXAALwmZ0xeXPBaECd4cgzMKOeqsePlV6L5sJdELRtoIge4ty2cDkWMB4gws4/5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113662; c=relaxed/simple;
	bh=5qDpVkMt4wmJAuvajXr0K3vaIjTuOXwvJrhqj7SsGUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SiP0gwAz1s3StvXtWIDxwN7w7TlCoNP4di9nDb29AOsboHXIOepjeufUfQbC68BczsF3NiFS7xFn2y/gU6DOGswxSLh8RO72zYY2Xtt8iBDn3MvLvxbmaXjxEscFdxwuYRJhOY856DD9UlIhtSxcVTGQio/LFAN51pzNDAnlQO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XcCKlePQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEfglShx; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779113660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0PKPpLFUcJ5PNICdj+fODP+ieu23TytLui2uhS6hnY=;
	b=XcCKlePQRCeNFJsGcLMSHXQ/fSrJvamD5A2GxmWdoGZQL/RrWD2lyIlTxFTNF9BMo6BpbY
	w0/EpsruSfyA3I1DLVcmyCwiy2DO/qTcIZpk/Bm8sU+YKDkio4I76oPJ2p6UBwLkGoA+Yp
	a20GsbyKFpt8c+g3HBJT5doI0gxJFyA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-PXyXqMJtNGGEodxoaXGGig-1; Mon, 18 May 2026 10:14:18 -0400
X-MC-Unique: PXyXqMJtNGGEodxoaXGGig-1
X-Mimecast-MFC-AGG-ID: PXyXqMJtNGGEodxoaXGGig_1779113657
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5a8d72e2f0aso159116e87.2
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 07:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779113656; cv=none;
        d=google.com; s=arc-20240605;
        b=GTczrRE3S9iZILOhi6Cvkyii2ih6yMeMC8mPHC1TI8dff31i7J7bji1s02MVJf0q2A
         LtMfZb5kfFslid7cWFJlvDDuSBxXfj96kUTlKsNPXk4R9Andi//sDCJBGzVIzWeoAgiY
         5VvcWVamcXvvx8AMmMPg3D4E/GOO4w9GMnSVKNMWEXg94HhjbFQg8G1y4rVbERqZsLiM
         uQ0aWL2w5I4TeLXqj7uMR8eR/8wOefOpHNOX8TbezbpFCS2Fdfa+I6XNp6ikq5eU/8xx
         K8KQIbicUIxl7isn+Bx3jwpJ68IpslRzbMKVw+X51yS1zlf/iTY1ffhKPpRjJ/8AylVr
         2LXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0PKPpLFUcJ5PNICdj+fODP+ieu23TytLui2uhS6hnY=;
        fh=yfMD/LiI852B1Fcp05FnSbmCbYU5nHINI/tnw9B8oPg=;
        b=gGoZSBKTgTMjoSpiru8Di038uR1ULEc77CrsUNkzkaOsl3ctdgwNyXIPkPzdn23Mss
         igp4vLN38xswDAWEp+QxAuzRr52WBmfbeHKDtutjoVs5jk4MdDZKmlbX63uuuJ7IdeiW
         ZbIoTIW557zIGC+QLtcCDO0nSfC+6e6EoAKOR6eIFsDIX4sW4QPqN4u1yEzZ5oCXlN3E
         loqOoWHsTGeUhHJbruRXGheLBAiXNqgqPLsg68u1gOdLaTC0GoDb7DOWvezxkhC319PQ
         Ll3t5jlUHNMaMtbFvf2bSSRM3F2b5B1aBsLYXpFkKx1g1RSzrqb6xI1H0WhK2J+qYSPL
         T/5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779113656; x=1779718456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0PKPpLFUcJ5PNICdj+fODP+ieu23TytLui2uhS6hnY=;
        b=JEfglShxs5yibxIFv6/U19ifYzbXJu1Yd2BQV36kyFt/CBsUG/2wuOTz0C/h8TWSWq
         lA0JN50rELueXLBK637lK56wBfhJdeUjk1j7moM/16fwAyLRRA8pSdFo05VrBaCJpeLD
         7BvNvjhkng11lJG06TgZ/Me/vyBwOAzoOv6vwANalpyj8HxxuWEytpuFKpTQ3xDuaaYf
         EhXQlXNXGhicpWhlEDCZ74YpPN0qfsHPJU65rGjsrwiNllM+sn6q4I2FJb8DnL5QhMWK
         fQakRPvS/mTuCD31oXyalhIEHgFcNYm7JAhiDIxBt0dWS1nmfYpRANM02nVGFn0jDOgB
         gRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113656; x=1779718456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X0PKPpLFUcJ5PNICdj+fODP+ieu23TytLui2uhS6hnY=;
        b=ZubHvpLrJZBspnvDTWVH/KC3YN7xk1DZbNCUnw8Ke9fwyZDxwx4xEuUEj3NREzMg5k
         ZdX4bgHYOn9e8H3NMVivr2U9QqCHTEH92ZutB7amOTRdHpXLZOBXkYcwGX7vuWsuHJfT
         G3V6dJs+elfM8BKYn66zxjirTywOjkLTRMknCRKVvjNZ372FA1QJgHNEwShfcQ+dMQPd
         Xbs9Bn5LNG7+g27P1nI43WYeXcnEzbqIXVI+yqFE0eE8ZmMtRjhgGZV+YQWgKsy8aGiO
         SEUlLwGv51kZW8rXYT1RTX+lrYl8a0LhyW3E5XL0oYP7HGi0C0D69sIww4gWN2I+lwK5
         5q6g==
X-Forwarded-Encrypted: i=1; AFNElJ/Y1W+JHj/aBlpeV0i9oKwljnMtb5ruJblOEtHd5FDE5FKBCTHnwyw6An/28Do7WOnYtWYf+NXNoZonLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHjsYGkohpU2Zcjg4kzr5NBrY03RVfdgsqyIQ6Hs+fimCKhjsV
	Er0i8jBQ44NkHxuiZ7O5z2AMtUgig3aAWzVW9QZ4nNqQ4k6kGNWFLNg/lfqi0l93xfJG6uMDDG0
	kjXeQ5TTdT/Wi5NPGl+s1a0fCp4FNj/+N9IYd5bIsxNaQyVFFfJHnCYhw0Xkja9AGBLX7k6lLA6
	G+yWt8AgkOAw4mxlhHVlFnPOCOzGvkpLRN4xd4SyQ=
X-Gm-Gg: Acq92OF6LCq89ZPFrRoS6OCVNZSlu8bsNQvxE1RSj5sbcZO8bJ4ProYRkTLwMr0bRsh
	6VbdR+WpchHUrsMoTvtfrTxVal7E6BKIYnu6v0G7R10dXbdqxV+JJG/f3yxi/vrNaW9BPVGdp1T
	LuL8SN0Hb6i8NG2yAe/4SSt+aWEZAljRXEfikRU+x3ehZHvRFdvEu+RAm+S2+yeZ3VnDoFDPL8l
	AvzuA==
X-Received: by 2002:a05:651c:410e:b0:38f:f6a2:a61d with SMTP id 38308e7fff4ca-39561f2f883mr11802531fa.4.1779113656358;
        Mon, 18 May 2026 07:14:16 -0700 (PDT)
X-Received: by 2002:a05:651c:410e:b0:38f:f6a2:a61d with SMTP id
 38308e7fff4ca-39561f2f883mr11802281fa.4.1779113655655; Mon, 18 May 2026
 07:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com> <aaGkGwbk-sh0YJqj@jkangas-thinkpadp1gen3.rmtuswa.csb>
In-Reply-To: <aaGkGwbk-sh0YJqj@jkangas-thinkpadp1gen3.rmtuswa.csb>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 18 May 2026 16:14:02 +0200
X-Gm-Features: AVHnY4JRP0kGP-z42K5FI0qcb3gAysvgY6dzw7kUR8X3jOVZKVkXLna2nVCi7XY
Message-ID: <CALE0LRuahJy2EKa7YUukGRq1w9iws6kDvjZ7o33ahJUGc2JSsw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Add DMA support for LINFlexD UART driver
To: Jared Kangas <jkangas@redhat.com>
Cc: Larisa Grigore <larisa.grigore@oss.nxp.com>, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	chester62515@gmail.com, cosmin.stoica@nxp.com, adrian.nitu@freescale.com, 
	stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, s32@nxp.com, 
	imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com, 
	echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62005-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eballetb@redhat.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 695D656E868
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

Any chance these series can be considered? They still apply on top of
the mainline kernel.

On Fri, Feb 27, 2026 at 3:03=E2=80=AFPM Jared Kangas <jkangas@redhat.com> w=
rote:
>
> Hi Larisa,
>
> On Mon, Feb 16, 2026 at 04:01:52PM +0100, Larisa Grigore wrote:
> > This patchset enhances the LINFlexD UART driver and its device tree bin=
dings to
> > support DMA transfers, configurable clock inputs, dynamic baudrate chan=
ges, and
> > termios features. It also includes a series of fixes and improvements t=
o ensure
> > reliable operation across various modes and configurations.
> >
> > The changes added can be summarized as follows:
> > 1. Fixes with respect to FIFO handling, locking, interrupt related regi=
sters and
> > INITM mode transition.
>
> Tested this series with the default devicetree configuration by booting
> the board to a login prompt about 200 times. Without the series applied,
> I was seeing a bug roughly every 30-50 boots where the kernel would
> would hang in linflex_console_putchar() waiting for DTFTFF. In my tests
> with the series applied, I didn't see any regressions and the bug no
> longer appeared. Thanks for the fix!
>
> Tested-by: Jared Kangas <jkangas@redhat.com> # S32G3, interrupt-driven
>

FWIW I also reproduced the issue Jared faced. Current state of the
LinFLEX serial driver in mainline seems a bit buggy and I can confirm
that these fix the problem.

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

> > 2. Removal of the earlycon workaround, as proper FIFO handling and INIT=
M
> > transitions now ensure stable behavior.
> > 3. Support for configurable stop bits and dynamic baudrate changes base=
d on
> > clock inputs and termios settings.
> > 4. Optional DMA support for RX and TX paths, preventing character loss =
during
> > high-throughput operations like copy-paste. Cyclic DMA is used for RX t=
o avoid
> > gaps between transactions.
> >
> > Larisa Grigore (8):
> >   serial: linflexuart: Clean SLEEP bit in LINCR1 after suspend
> >   serial: linflexuart: Check FIFO full before writing
> >   serial: linflexuart: Correctly clear UARTSR in buffer mode
> >   serial: linflexuart: Update RXEN/TXEN outside INITM mode
> >   serial: linflexuart: Ensure FIFO is empty when entering INITM
> >   serial: linflexuart: Revert earlycon workaround
> >   serial: linflexuart: Add support for configurable stop bits
> >   serial: linflexuart: Add DMA support
> >
> > Radu Pirea (5):
> >   serial: linflexuart: Fix locking in set_termios
> >   dt-bindings: serial: fsl-linflexuart: add clock input properties
> >   dt-bindings: serial: fsl-linflexuart: add dma properties
> >   serial: linflexuart: Add support for changing baudrate
> >   serial: linflexuart: Avoid stopping DMA during receive operations
> >
> >  .../bindings/serial/fsl,s32-linflexuart.yaml  |  31 +
> >  drivers/tty/serial/fsl_linflexuart.c          | 972 +++++++++++++++---
> >  2 files changed, 846 insertions(+), 157 deletions(-)
> >
> > --
> > 2.47.0
> >
>



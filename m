Return-Path: <linux-media+bounces-24725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE9A10DB3
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 18:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B92EB1887518
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 17:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CD11D5AD3;
	Tue, 14 Jan 2025 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="G1J6j5k4"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAEC1E764A
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 17:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736875584; cv=none; b=tw0fVIzAFtw2SwV17SWHo3i4ebzpNZMoSNx0e3hE/F5B5CXRl2bH1Zqr+2D+IuCAUselWGKELje9VDMjZUASXvZ7kpVs9zex8w1PKI2vskkmSJkp2xK78Z1mQnB67fsEmZ3WiHxoIA4PzWiQX3npbxF03gkxRPWBMhqQWDnaY+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736875584; c=relaxed/simple;
	bh=EaGvpvXAfJJWd4ividdL7glMt8ns96cbwytnDI/GZU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUwOZznWBT/UXIrj2ZPh7ac1HQvClu1txWW9JyTPVpmJAnbhrkOUgGtB/J8ZP0Pmdi8oD2MVRUTPiOggAo7GqJUvyKG5It6e1EFTxr5EgkxKj1p9/h0tNbpVNPiKprFqCY/xJX7lCMu6wo04BmqExwNpnBdyPO3Q3dtH45E7s9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=G1J6j5k4; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Gq1SB2LaXjxVwa61Dc9hsgDAFFhtuffzThQL+BqW/Z0=; b=G1J6j5k489fDyyhAbcodbs3usJ
	5NFF0BycI7p3GSGhMhJKRr2ox6sZrNqfjGESrTIOKhYpn3QDmOaA/xYMb0HicXWbqRF/ZL3aI4qSK
	GMlPEUSnlU9PqZENEdzNI/PMW+kxjsb+pS4wyospqtTVLBbakDtIEAGwyfEDavME9w7ZuSIczRs2h
	Opsc+7LnBRQBznNQz+A1LmFY3RRhHQ9pqC5ejkUvtGEMmiOmVuJyQpz8iJ1YBJa9H/Gp/mUoQe2f0
	IDiXOWcyjuylXQKVmotLi4bRCSOkX6dLOia+T+2AQ/dkAJRShFbP814HYlEezXHx3GU/Ey7MKc/XJ
	1EuwzvgA==;
Received: from 179-125-92-253-dinamico.pombonet.net.br ([179.125.92.253] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tXkg6-00FkAN-J5; Tue, 14 Jan 2025 18:26:11 +0100
Date: Tue, 14 Jan 2025 14:26:03 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomasz Sikora <sikora.tomus@gmail.com>, hverkuil-cisco@xs4all.nl,
	kernel-dev@igalia.com, linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
Message-ID: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
References: <CADBf=5nS8_cQvG3mRnXe_MGYmFMh=Myf_eptPqN9hgNMu73Wjg@mail.gmail.com>
 <Z36ad0OxZBnQ0Kxx@quatroqueijos.cascardo.eti.br>
 <20250108153637.GE32541@pendragon.ideasonboard.com>
 <Z36gMvN0XxfXwE82@quatroqueijos.cascardo.eti.br>
 <CADBf=5m0WVMJbVfDvpFdqoYdKj=nT+mOW=D-Q2MJJ=TCbsTMuQ@mail.gmail.com>
 <Z3+pQ/xVdpiE/1GN@quatroqueijos.cascardo.eti.br>
 <20250113185059.GA30724@pendragon.ideasonboard.com>
 <CANiDSCtvwUEP+66NiXQRNjxpVyh_XCztJRYwdQQMKWx9p_SOcA@mail.gmail.com>
 <Z4ZbYavHz1DpCCwK@quatroqueijos.cascardo.eti.br>
 <CANiDSCvx4syyRhsX5v_kzFN4dR0JUoB8c0pY4Tf+JB318M=qYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvx4syyRhsX5v_kzFN4dR0JUoB8c0pY4Tf+JB318M=qYA@mail.gmail.com>

On Tue, Jan 14, 2025 at 11:20:30PM +0800, Ricardo Ribalda wrote:
> On Tue, 14 Jan 2025 at 20:41, Thadeu Lima de Souza Cascardo
> <cascardo@igalia.com> wrote:
[...] 
> Please correct me if I am wrong, but the ID is only required to
> configure the topology of the device. If multiple entities have the
> same id then they cannot be part of the topology, because we will
> never be sure about what entity is the correct one.
> 

I can say mostly about the device that has been reported:

Output Terminal has ID 5 and source ID 4.
Processing Unit has ID 5 and source ID 4.
Input Terminal has ID 1.

But we end up connecting them with uvc_scan_fallback:

OT -> PU -> IT

As if Processing Unit had ID 4 and source ID 1.


> My proposal is to mark the duplicated as invalid so they cannot be
> found with uvc_entity_by_id(), but they can still have controls.
> 

I would need to test them.

> I think it can work with multiple duplicated IDs. It is also pretty
> clean and is not affected by the issue found by syszcaller.
> 
> In any case we probably want to act fast on this one. We had reports
> from multiple parties.
> 

Perhaps we should then revert the previous fix (which implies that this
same device would lead to some warnings, but they don't seem to cause any
other issues except for not exposing some media controls). And, then, we
work on reapplying it and another fix on top, or a different fix during
6.14 or 6.15.

Thanks for the patience.
Cascardo.

> Regards!


Return-Path: <linux-media+bounces-52959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNPVGnMilGmqAAIAu9opvQ
	(envelope-from <linux-media+bounces-52959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:10:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E21BC149B98
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0BC93021D33
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0405A2E3387;
	Tue, 17 Feb 2026 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5VdzwvW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572EC2DB7AA;
	Tue, 17 Feb 2026 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315812; cv=none; b=UEO+FX0d5J7vzyEBEQRGesBagfJ00rKDp21RwUwVYRsWK5W8q4mG2vGhny7uxbdj7vxLKofJBhgRkAL2ORBUChDDk0jJETbdmtb5MmEqQZeH2r571sRe/FfvOMyAYimO8G9R0GNnPDWAZVlRwzNWgOXwC5n/uldxdzxRUygZ9T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315812; c=relaxed/simple;
	bh=JES+IBXkN/OopuNkWeM8rDx8cY1hL5qNmn2SSvSLDww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmZanL0Mwmyi9jpPRQ57nr7VaTtdGUEyC7xzM4Fe0fRt78ugMQvTepTrlRzcL+hbKCFFithbLQ2/e2BGy3CoUGPTy6UAM1gkXEMLabuxM0yA/kecvr12RYpatn2qs2huWPd86zH+PnCrmwfUP21+KxMVjV9pcHIyoYOS0d9DdQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5VdzwvW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FC4C19424;
	Tue, 17 Feb 2026 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771315811;
	bh=JES+IBXkN/OopuNkWeM8rDx8cY1hL5qNmn2SSvSLDww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5VdzwvWLXGyzf38GdKR0DP1zmbtvU7hfd3hlDwwRkW80X4l1SWwX85/mwayZB4/i
	 SNrxQLgJxPOUitED/rP9uOf0WeWZdIRg7+iV/SVR3Vaujf3JtmftZDR0u4ab1nywlH
	 ElR11J92kF75uTgTLkjvF1p5qCJu+TSTTDpKcp5z3WMKkTCYKnViNy96BWo6fuWxX1
	 KScScxH49TMGFhxMjUldGPC/sdm2/Mg5ywYdAAmJ7nC+vLcfzIZHfEP+MhH6bP86jL
	 VR7Xml8I39h3w+kxZt/yxdzWvOXuSPJn5BEs/4AyFYkPXjExqMUg+U7GeCux68/TX6
	 nGfyp/ia8y6gg==
Date: Tue, 17 Feb 2026 09:10:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Larisa Grigore <larisa.grigore@oss.nxp.com>, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	chester62515@gmail.com, cosmin.stoica@nxp.com, adrian.nitu@freescale.com, 
	stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, s32@nxp.com, imx@lists.linux.dev, 
	clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com, 
	jkangas@redhat.com, Radu Pirea <radu-nicolae.pirea@nxp.com>
Subject: Re: [PATCH 09/13] dt-bindings: serial: fsl-linflexuart: add dma
 properties
Message-ID: <20260217-stirring-warping-partridge-dd9531@quoll>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-10-larisa.grigore@oss.nxp.com>
 <5c0251b6-5228-4077-a21f-4da179949b90@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c0251b6-5228-4077-a21f-4da179949b90@oss.nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52959-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REDIRECTOR_URL(0.00)[aka.ms];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,aka.ms:url]
X-Rspamd-Queue-Id: E21BC149B98
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 05:29:57PM +0200, Daniel Baluta wrote:
> 
> On 2/16/26 17:02, Larisa Grigore wrote:
> > [You don't often get email from larisa.grigore@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > From: Radu Pirea <radu-nicolae.pirea@nxp.com>
> >
> > Add 'dmas' and 'dma-names' properties to describe optional DMA support
> > for RX and TX channels in the LINFlexD UART controller.
> >
> > This allows the device tree to specify DMA channels used for UART data
> > transfers. If not specified, the driver will fall to interrupt-based
> > operations.
> >
> > Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> 
> If both of you worked on this patch then the last lines must read:
> 
> Co-developed-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> 
> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> 
> Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> 
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>

No, the DCO with this authorship is correct if they both worked. Nothing
has to be changed here.

Best regards,
Krzysztof



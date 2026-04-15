Return-Path: <linux-media+bounces-58791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGHDMeVI32mFRQAAu9opvQ
	(envelope-from <linux-media+bounces-58791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:14:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AEA401CD1
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6908E305C19B
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 08:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444473CE4BC;
	Wed, 15 Apr 2026 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3DLZyu8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A777740DFC9;
	Wed, 15 Apr 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240618; cv=none; b=gFiHPTIktxq6nWK28NSlQj+9rWpK/YeDxSeqYwWkw8dNPul4Kt045hAYve0pEEYdi7erfNDbWppj4NaXYYVO1fSsxooRlJN5ker1ptVenGuG6AYHNhDCj6sknAjWd+J8VlLFsoDiVUBVyPU6v26NcoKtElFeMSL9FffzZ4YU7+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240618; c=relaxed/simple;
	bh=I6eUDp4wTRJP5CSONuLda4AnlkaTkRvF/XhtVGrCOXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pqm/ImGWkYQRvzkj1LV6BT/Bl/HiK6FscHe43ZJ6a8mLV7R/ERH0WULp4nbTfGPdWWlWNxuEXxAn/4C+yBRjjoEUDU0IWFvZEcfogGPboEUtjEgcs/Dr2IK8dw1VzmcS3nm7Xxqt1wo0EKAJ+bcy8tfErSa+MbGTg8TznYQ3kpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3DLZyu8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D051FC19424;
	Wed, 15 Apr 2026 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776240618;
	bh=I6eUDp4wTRJP5CSONuLda4AnlkaTkRvF/XhtVGrCOXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3DLZyu8wclWP9+9yOvpttjvy+zqfD0qAV5MaRuHF9J1O8UwpI4uWV8qnSug3lX2w
	 kPQIXfMqwh36ZO2coLxi2u6jRokNlRwhoEwAxIQ15NumsflWfytZ3O539wqYHLzMQA
	 apBR8Lwl79DV7n4k8/SBFS0ue3GMZb37+qDKGA01GPmaAFRWVRzs3uQc3btQXZxhA3
	 ThI3/I4JeR0GjzCPzyqH4sux85UmwK5LBii9LgahjwUtlHT6VDEM7htJ6/cx+I/+OC
	 4TME98PO+5p1Gb9I01x3Ml1A3UkufM50/TCZv9NuvJKtz8NpIOJhPpoDOEVtOPp1ex
	 lz01AVaghKcuQ==
Date: Wed, 15 Apr 2026 10:10:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <Frank.Li@nxp.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 4/5] media: dt-bindings: add NXP i.MX95 compatible string
Message-ID: <20260415-glaring-premium-nuthatch-ce00fc@quoll>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
 <20260415-csi2_imx95-v1-4-7d63f3508719@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415-csi2_imx95-v1-4-7d63f3508719@oss.nxp.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58791-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6AEA401CD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:46:55AM +0800, Guoniu Zhou wrote:
> The i.MX95 CSI-2 controller is nearly identical to i.MX93, with the
> only difference being the use of IDI (Image Data Interface) instead
> of IPI (Image Pixel Interface). The binding constraints are otherwise
> the same.

Nearly identical with some difference really, really suggests they are
compatible. Express compatibility or explain why they are not compatible
(difference between IDI and IPI unfortunately does not help me).

Best regards,
Krzysztof



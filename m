Return-Path: <linux-media+bounces-51363-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMY6JsJocmnckQAAu9opvQ
	(envelope-from <linux-media+bounces-51363-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 19:13:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA296C1FF
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 19:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6323F3098150
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 17:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CA8358D2F;
	Thu, 22 Jan 2026 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KkCdmLiF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D7367F56
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 17:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769104501; cv=none; b=Bullqbvl5qSukVCAdnwigZoOOMPRPnY0reJqvTw/xDm3t+Ilce4rU3cIAl11u0whZrwCF4rTI81yrc8gDd43HPN+Xm99NEQSXbyytxpXc9VsZJBxFrG6OqXdFLtjiGsoImHIVLR8LlcrjX6VL1zqLbWNwtJ1GSt5EwPuLND5s7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769104501; c=relaxed/simple;
	bh=LLDRvj9moWmzYIlfx/9bJlgLlk53ZsEHnEkrs4dHDbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cg0C0Isj+2jmUJbpwPfJLvMoYuKcrkbPosNpEgpLIQW3dqaiRFDYu5bJFhLAEsyo36Du+IEOwWi0O7a7KUJFuRpjpfg362HhfRn2I4YXnk3gYPQ+zuYvBqWA0ZNeb8BKTXGRpQS5jeXbvEbUvCf1Jmt9tTTyEAr7I8/gIks5N9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KkCdmLiF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3999B460;
	Thu, 22 Jan 2026 18:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769104453;
	bh=LLDRvj9moWmzYIlfx/9bJlgLlk53ZsEHnEkrs4dHDbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkCdmLiFQ7emGTfDaygirfgQo24nGxcZiqlEIZaTIDzUivvO1qS6Hq1NpEzfCevLG
	 JoVZnJcpMKHMweMoTGvzDOr067XuUpfqgWbkOiRmKHCI3jr6y6z2X4aHy3s6ViA9Au
	 ySgqr0nFOGinoDe/hBh1yZ1Sp+aFlE9CP0V1g1A8=
Date: Thu, 22 Jan 2026 19:54:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@debian.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, 1121718-done@bugs.debian.org,
	Ralf Jung <post@ralfj.de>, Salvatore Bonaccorso <carnil@debian.org>,
	linux-media@vger.kernel.org, regressions@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD
 Pro Webcam shows flickering artifacts (sometimes)
Message-ID: <20260122175444.GB274167@killaraus>
References: <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de>
 <aVfPmZ8rUm3Vf7pT@eldamar.lan>
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de>
 <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
 <dc4c95e6-d19d-414a-a7ae-401dacbaebfd@ralfj.de>
 <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <CANiDSCt8KFH7d6cc4zTpf10F4G=O6vmZiSj5pPC0q+_e90Cjpw@mail.gmail.com>
 <aeflgf6qtiqxodjdj7jf3qth6fg47p3wkmiunfpsk7suruhh2s@eud4pqticxxn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeflgf6qtiqxodjdj7jf3qth6fg47p3wkmiunfpsk7suruhh2s@eud4pqticxxn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51363-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0BA296C1FF
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 06:38:56PM +0100, Uwe Kleine-König wrote:
> Hello Ricardo and Ralf,
> 
> On Tue, Jan 20, 2026 at 02:46:54PM +0100, Ricardo Ribalda wrote:
> > Another update
> > 
> > Zoom has notified that they plan to land this even earlier. In 6.7.5
> > 
> > Ralf, if you could confirm that it works/doesn't when zoom is released
> > I will be very grateful.
> 
> Given that this turned out to not be a bug in the kernel (and not even
> Debian), I'm closing this bug. Even if the new Zoom release doesn't fix
> it for you, this is their problem and not one in the kernel where we
> could help.
> 
> I hope this is ok for all affected parties.

We addressed it in the kernel in mainline though, reverting for the time
being the commit that introduced the issue.

-- 
Regards,

Laurent Pinchart


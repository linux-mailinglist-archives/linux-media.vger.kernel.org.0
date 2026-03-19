Return-Path: <linux-media+bounces-56377-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OewK49bvGlRxgIAu9opvQ
	(envelope-from <linux-media+bounces-56377-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:24:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 545CF2D20AB
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F049430F6518
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7F83F7E63;
	Thu, 19 Mar 2026 20:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiuBOTf8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9CD23ABBF;
	Thu, 19 Mar 2026 20:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773951877; cv=none; b=WSXu/PJ1gW4TQOeikuy7fEi7lqW+JmpgdauKBSXmT+O0/R49CiCeeXiu846bSGppTqmiZw4JOwvkcZ+ubMt4FbXvXGNuydk4jywxUTMVvgBexD+Hm2ckWpmgzYqhzSmeWiRbl7PFl4z/vlIF2u3tGDGRIgvCoEPG1s7Oas9bL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773951877; c=relaxed/simple;
	bh=++eEWU9U/XElXTXlMK0AqVMtloqKwDyjsQ+lSYM22fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmSKoHpSaivlQaK4WxuA3amBROstBsMKjGe45cQtno8awqGY+8Ha6MmxgVTnNhu6PBYzeNIy+oD8axrDgxUC3G5aQEQdu2k2sqYMPPzgV6c3dAgFgVOYBsD1j6Kz/Coe7EBlkBOm/xkqsgCMFxlQrp9XFK/Ttjlomz+0MG0MYy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiuBOTf8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7474C19424;
	Thu, 19 Mar 2026 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773951876;
	bh=++eEWU9U/XElXTXlMK0AqVMtloqKwDyjsQ+lSYM22fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiuBOTf8oM3JpowrwY/RK71V0lFiytt3Vy70A5+Se8FSMNpBgrP1LzOd7oZgj2zFO
	 aq37mpoCmue+Ohtsd4hTOp+Ou8urlIAHTqGzwCwS7euP3vimX0ON0XXWIMf99oiYxn
	 uL0HQV6NWlMegU10XI0pVrcNbqc1gr/CUl0IgbuMdWUpEMoXWAsGWiXRl8TO0oVeZk
	 UbfZOBhTjphUVeWMVb0epNP0DwpsmaWenaCJaXmD6ZItKEPk2wV0eWBNJoDRo9hJNa
	 LpDwaOnBgmK9ho9ehOY8NGZiHYSfIV1suik/JeOa1AMGFvccrX/0T6VCSfPDqGOihh
	 FHPWeqtfp2pyA==
Date: Thu, 19 Mar 2026 13:24:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Brian Cain <bcain@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: rockchip: Disable VIDEO_ROCKCHIP_VDEC when
 compile testing for Hexagon
Message-ID: <20260319202430.GA335306@ax162>
References: <20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
 <90e62bf797b0532e5556adaf9e15cc7b73e18411.camel@ndufresne.ca>
 <1a618af9b6c311e8fe5db64ff6fb7c1872c7b2b6.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a618af9b6c311e8fe5db64ff6fb7c1872c7b2b6.camel@ndufresne.ca>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56377-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.946];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 545CF2D20AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 04:08:29PM -0400, Nicolas Dufresne wrote:
> Le lundi 16 février 2026 à 11:17 -0500, Nicolas Dufresne a écrit :
> > Le vendredi 13 février 2026 à 15:10 -0500, Nathan Chancellor a écrit :
> > > Building rkvdec-vdpu383-h264.c can take a few hours to finish building
> > > with Clang 20.1.0 or newer when compile testing for Hexagon. While this
> > > is further investigated and understood on the LLVM side [1], disable
> > > CONFIG_VIDEO_ROCKCHIP_VDEC when compile testing for Hexagon.
> > > 
> > > Link: https://github.com/llvm/llvm-project/issues/178535 [1]
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > >  drivers/media/platform/rockchip/rkvdec/Kconfig | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig
> > > b/drivers/media/platform/rockchip/rkvdec/Kconfig
> > > index 5f3bdd848a2c..d03689464206 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
> > > +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
> > > @@ -1,7 +1,8 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >  config VIDEO_ROCKCHIP_VDEC
> > >  	tristate "Rockchip Video Decoder driver"
> > > -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> > > +	# !HEXAGON: https://github.com/llvm/llvm-project/issues/178535
> > > +	depends on ARCH_ROCKCHIP || (COMPILE_TEST && !HEXAGON)
> > 
> > This is clearly not a pleasing change to make. As this specific data structure
> > and usage of bitfield has been discussed (along with the numerous issues in
> > clang/llvm around these). We also agreed to move away from bitfield for this
> > data structure and use a bitwriter. I would favour delaying this change to
> > give
> > devs the time to port instead. Ping again if nothing moves within few weeks.
> > 
> > best regards,
> > Nicolas
> 
> I haven't heard back about the port to plain bitwriter. I guess I have to pick
> this patch, but I really don't want to have to maintain too many of these hacks.
> Anyone else with an opinion on the topic ? Or a better idea how this can be
> workaround differently ?

For what it's worth, I don't anticipate more of these hacks. Hexagon is
rather special in that it has a lot of target specific optimization
passes, which do not always see code as complex as Linux has in places
during development. Ideally, it is resolved at some point during the
LLVM 23 development cycle then we can version check this workaround and
eventually clean it up altogether.

Cheers,
Nathan


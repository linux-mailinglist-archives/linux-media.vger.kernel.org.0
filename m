Return-Path: <linux-media+bounces-55945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AApXDXgquGnhZgEAu9opvQ
	(envelope-from <linux-media+bounces-55945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:06:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C905929D0B9
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACB6130ADD77
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5F53B895D;
	Mon, 16 Mar 2026 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="CG/wOdvh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F5B3B7B71;
	Mon, 16 Mar 2026 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676658; cv=none; b=X4PpdP4p8bM2FhBTNlnjioOW01RSy9qvOftojtHl/Cjl7fcEMfPN2nKukWehZXbYaKAXROu9+eBy5S9pRdQ0EINwpCBDsY+FPmvvMcgDu0chTh86yjqBwIrEexw2ftpXtBGpXKc2nRfXd2yXbPFUJuFSd4tG491VjYcsRkIbchk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676658; c=relaxed/simple;
	bh=bauaN0rwvZ5ND9o7f7AFwAWfFGS+QIjNybGjmwWpuCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4vskjYHl08NXuI6jiLPRhDfv6n2/IbarLnwx+DJ1gXmCvWO4w7Y1qfqASP9pVQhhkZwNBQp0GGlmFz7m/6JkfZbcDu+k+D6a4xzolGPLEapkJVESMV7hy4sALsSuqAfOGqhcSI6V/VzdsfmWtN9v5hvE2Mkiso+cCKdq4LBrfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=CG/wOdvh; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id C1FF71FA6D;
	Mon, 16 Mar 2026 16:57:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1773676652;
	bh=zEuqXYLwdnr/h2zdw/7lA5Y0YBEZ5aLcF0pDLSnsKRA=; h=From:To:Subject;
	b=CG/wOdvhkrI7VJK5Ltm22UKXsL1TWqPJGrEkmQM+OFCb5ErieX2h0GmDaGar7l/ze
	 dgScDmFbeGnU9gikIGI01vX8r4e+g2W5/9T84gM9+q8M+mrV1FfH+imeEH4nnXXcux
	 LrV3izZODDCLPPypcPFykWsZAJuI1caBi/1PnVJAhKqElkzp1GKzdxHXEiq7GphQ6D
	 8t/g9xlSqhRsoikEwRnegUgGcOFSUZJIrR8quurrXVH8VwaOlBShvhp1VVn4zzBk8w
	 5Uq2Ow60hu8UsLtkPE0RhPbdCfe08wV9+smZ8Vq03LZbtCOZv9qoSVdyJPcSGEjXq5
	 2TY3p4bNKKzcA==
Date: Mon, 16 Mar 2026 16:57:27 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Francesco Dolcini <francesco@dolcini.it>, ming.qian@oss.nxp.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
	shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de,
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de,
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
Message-ID: <20260316155727.GA43134@francesco-nb>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
 <20260312173349.GA137045@francesco-nb>
 <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[dolcini.it,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[dolcini.it:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55945-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[dolcini.it,oss.nxp.com,vger.kernel.org,kernel.org,xs4all.nl,collabora.com,pengutronix.de,linaro.org,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francesco@dolcini.it,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[dolcini.it:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C905929D0B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:25:53AM -0400, Nicolas Dufresne wrote:
> Le jeudi 12 mars 2026 à 18:34 +0100, Francesco Dolcini a écrit :
> > Hello,
> > 
> > On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com wrote:
> > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > 
> > > Fix a kernel panic when probing the driver as a module:
> > > 
> > >   Unable to handle kernel paging request at virtual address
> > >   ffffd9c18eb05000
> > >   of_find_matching_node_and_match+0x5c/0x1a0
> > >   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> > > 
> > > The imx8mq_vpu_shared_resources array is referenced by variant
> > > structures through their shared_devices field. When built as a
> > > module, __initconst causes this data to be freed after module
> > > init, but it's later accessed during probe, causing a page fault.
> > > 
> > > The imx8mq_vpu_shared_resources is referenced from non-init code,
> > > so keeping __initconst or __initconst_or_module here is wrong.
> > > 
> > > Drop the __initconst annotation and let it live in the normal .rodata
> > > section.
> > > 
> > > A bug of __initconst called from regular non-init probe code
> > > leading to bugs during probe deferrals or during unbind-bind cycles.
> > > 
> > > Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
> > > Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
> > > Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
> > > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> > > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > 
> > What's the plan to merge this? It fixes a quite severe regression,
> > a boot failure.
> 
> To be decided this week. The commit message does not say if it was released, or
> came in RCs (and I didn't check myself yet). I'd say, if its the first one, it
> will go through next and backports, otherwise its is really tight to get that
> into the RC series, but serious enough. Please fill the gap if you have time,
> and I'll handle it later, probably tomorrow.

This fixes commit e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error
while decoding H.264 and HEVC"), that was merged in 7.0-rc1.

As of now, because of that, 7.0-rc is not booting on affected platforms
(i.MX8MP), to me this needs to get merged before 7.0 is released.

Francesco



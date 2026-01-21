Return-Path: <linux-media+bounces-51184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLWjNMZOcGlvXQAAu9opvQ
	(envelope-from <linux-media+bounces-51184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 04:57:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8402150B0F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 04:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5B9563E75AA
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A9C355800;
	Wed, 21 Jan 2026 03:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SvLBRk0g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D724730171E
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 03:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768967745; cv=none; b=jCrhuQ+f157uUfT2BtmJTUlaLca39LKi7Pypri+arUYEuQJRCKSlWIY5BXbTej01B+6ABVjsoN2xM8FTF35REQvFMibttewq1EaLIO3vH8N7p7yyM98vPg7GrdZAMXgPXZoIC/7CGbx3vy3eSE06Abhxv+X1Z7/qZQ6XnXj5jdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768967745; c=relaxed/simple;
	bh=LsYz/X+Dty4AJEw5aWAiiBJJ/v1hAsyGmmEoOqxt5Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cu86t4gykt+oN98cbq77l+4t+HJWOUMSRuTODOt0ywtYTGSOV5efcqHhrY05VpZWQaPBdtbPJtJWtouiwheP8t85mfFkg/jEqXHREiP+AHrdXnM4CXjuAATde2w4EILQ1eJWIet7WfEjAGtrwmPpKhk/sEcjaaXakv10e+TyAUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SvLBRk0g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 161FBA06;
	Wed, 21 Jan 2026 04:55:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768967710;
	bh=LsYz/X+Dty4AJEw5aWAiiBJJ/v1hAsyGmmEoOqxt5Rg=;
	h=Date:From:To:Cc:Subject:From;
	b=SvLBRk0gEjH1W8qlV6bVSIpvPWy4M02svapIG0iIZLYV3mLidhSGqLBMaVm39zES0
	 9EE0WAh64yQ8eW2wqxdp2uzY6Q2Tyu++BbFzfSOSvEep9t6Bkm8h2HUwyRQpy9oh4B
	 dP/58QaPwYbOdVaV8iFkO4hlWpGPZBWUlUE0zhss=
Date: Wed, 21 Jan 2026 05:55:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [GIT PULL FOR v6.20] Renesas media changes
Message-ID: <20260121035540.GA419213@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51184-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 8402150B0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

The following changes since commit dde659d37036c6edf5eeef81274b43fe12dfad53:

  media: iris: Introduce vpu ops for vpu4 with necessary hooks (2026-01-20 16:22:24 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-renesas-20260120

for you to fetch changes up to b90b727af97b0fef4e4806f8f245700d4af2440b:

  media: dt-bindings: media: renesas,fcp: Allow three clocks for RZ/V2N SoC (2026-01-21 04:31:26 +0200)

----------------------------------------------------------------
DT binding fix for RZ/V2N FCP

----------------------------------------------------------------
Lad Prabhakar (1):
      media: dt-bindings: media: renesas,fcp: Allow three clocks for RZ/V2N SoC

 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
 1 file changed, 1 insertion(+)

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-60629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ic6IRRT+2k5ZgMAu9opvQ
	(envelope-from <linux-media+bounces-60629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:41:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 110624DC68D
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7989302C810
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1905480DCA;
	Wed,  6 May 2026 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WrehR2Tj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F6C44DB76;
	Wed,  6 May 2026 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077841; cv=none; b=G6Ife+EDpUYnlXs5tROcpLKITYJ/rGJP1wp7d5r39IKIBUm5snG1G1wP8HgnBcE9UigcVs33Y+Zw4UIIr1YhphG3JYX+EAham4qguQu+8u/Fsvp3iaPo95OLncdJZqJ158egV+s9goA6kU0bbsDOlXmKeWm62n5IsneshjRXBjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077841; c=relaxed/simple;
	bh=XSvJ+OmVlLTqJ7h113TNTtPCVhXQ8dW2y/GYuT/4Yc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPMlprfz0WMeCKNLsTO8h7ywoz5MXko8YMtpfLQngcOAV2pFrfULW5E5t9H9cC4ATL54qXtfLtTFFEmxbTvK6TFbqacWaNnZ6YfLGfLhYDfGk2tdZyBVM31cJs5M6xg70oPtuAONJO/jy/IrxKHtOi3MKnOhAz6jQwJ5Ec0JYiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WrehR2Tj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFFB563D;
	Wed,  6 May 2026 16:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778077834;
	bh=XSvJ+OmVlLTqJ7h113TNTtPCVhXQ8dW2y/GYuT/4Yc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WrehR2TjrLABvwpBHdQYZ7tO33iW32DNapFqFOa+/lw7mhXsNCishbETpUzkCOuLf
	 26z6X1VrNPFIW6G56jxVf5rtRPGNrqL6x4qQag1QjIbhq6EhJKH/oGU7AIHC6m9FQ6
	 h4DYzE8LkU5rlC+llbnw6sykd8Y9qsY4NX/lzZsA=
Date: Wed, 6 May 2026 17:30:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robby Cai <robby.cai@nxp.com>, Frank.Li@nxp.com, martink@posteo.de,
	rmfrfs@gmail.com, kernel@puri.sm, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	martin.kepplinger@puri.sm, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example
 endpoint label typo
Message-ID: <20260506143036.GS1598374@killaraus.ideasonboard.com>
References: <20260506090124.2960477-1-robby.cai@nxp.com>
 <5ad1e2df-85f3-4f9a-ab9d-b6ae34eebed3@kernel.org>
 <20260506142155.GR1598374@killaraus.ideasonboard.com>
 <73111cb1-2019-4faf-abc6-c7deea603eb1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <73111cb1-2019-4faf-abc6-c7deea603eb1@kernel.org>
X-Rspamd-Queue-Id: 110624DC68D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60629-lists,linux-media=lfdr.de];
	R_DKIM_ALLOW(0.00)[ideasonboard.com:s=mail];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[nxp.com,posteo.de,gmail.com,puri.sm,kernel.org,pengutronix.de,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.213];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]

On Wed, May 06, 2026 at 04:24:35PM +0200, Krzysztof Kozlowski wrote:
> On 06/05/2026 16:21, Laurent Pinchart wrote:
> > On Wed, May 06, 2026 at 03:33:57PM +0200, Krzysztof Kozlowski wrote:
> >> On 06/05/2026 11:01, Robby Cai wrote:
> >>> The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out} endpoint
> >>> labels, which is confusing for an i.MX8MQ binding. Rename the labels to
> >>> imx8mq_mipi_csi_{in,out} for consistency.
> >>>
> >>> Fixes: 37255747ecbd ("media: dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller")
> >>
> >> Nothing to fix here. Otherwise explain the bug.
> >>
> >>> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> >>> ---
> >>>  .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> >>> index 4fcfc4fd3565..71f79651dd96 100644
> >>> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> >>> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> >>> @@ -220,7 +220,7 @@ examples:
> >>>              port@0 {
> >>>                  reg = <0>;
> >>>  
> >>> -                imx8mm_mipi_csi_in: endpoint {
> >>> +                imx8mq_mipi_csi_in: endpoint {
> >>
> >> Drop the labels instead - they are not used.
> > 
> > I think the label has value, it improves readability of the example by
> > making the purpose of the endpoints more explicit. I won't fight for it
> > though, I know it's hard to change your mind.
> 
> Then should not have imx8mq in the first place. The only information
> coming here is that it is input endpoint. IMO it is close to obvious
> from the opposite of "remote-endpoint = <&imx477_out>;" (if remote is
> OUT, then this must be IN). But keeping the redundant data or actually
> correcting wrong redundant data into correct redundant data, is still
> undesirable. Such patterns then keep spreading to new code.

Dropping the imx8mm_ prefix instead of renaming it is a good idea,
thanks for proposing it. As for the Fixes: tag, I don't see a need to
backport this, so I'd leave it out too.

-- 
Regards,

Laurent Pinchart


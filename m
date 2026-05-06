Return-Path: <linux-media+bounces-60623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPzbDp5Z+2kuZwMAu9opvQ
	(envelope-from <linux-media+bounces-60623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:09:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4084DCE6D
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 674E5312E98B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595EF48034A;
	Wed,  6 May 2026 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dWFsteE5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E79C47ECEF;
	Wed,  6 May 2026 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077319; cv=none; b=SHujzg8+SNQm4T29M0RerxKxGNfCkvJr0uN0oS3mniyaXF2gmtmN3eSDZp9EAcAAh0aS9c7dgJLEs3tEPG3ofqBgh0ZhYGdS7Sp0VFNEqtylRMlCuqdJO+7Qehblq5hNxqPbFthVWIwTumhkCbGZCWu+qRLbMucwiwRtz4jh8ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077319; c=relaxed/simple;
	bh=0Uq1YugYUXzi8pj8HXdSH3+9q4grpd3YGFD2ihnyGEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhOzrs6ldd6G7j7Jlqmim6xhhwnsyKJ4ixLPrBBeHglDVGZCYvJA6iz5XeiHAQiY1yyeN9xOlsCMB/7VzqQN5ekvC74BMrdgy8sbecO3vFr7ZPU1le/hEfrjr/aIewuU+IMKA/0cBQvR95b1FG773X0EWP1ZAK9tYlhviN1v40c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dWFsteE5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64FFE63D;
	Wed,  6 May 2026 16:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778077313;
	bh=0Uq1YugYUXzi8pj8HXdSH3+9q4grpd3YGFD2ihnyGEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWFsteE5Yud9FRc62Ue8FUO1vdIwK1vF//+75iUC2X7IJ1qEGI5wf7uLMVSqUixQL
	 CYkQY5kk6D7xRaLVAInGyyQB7WpzGQiea6RSDdQasbUA8cRbp62zKd8B/r+vafVkbC
	 XaHtZPTfgKXiZBHn4Bu0KHJZEpO9vq4rEUHNlxPM=
Date: Wed, 6 May 2026 17:21:55 +0300
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
Message-ID: <20260506142155.GR1598374@killaraus.ideasonboard.com>
References: <20260506090124.2960477-1-robby.cai@nxp.com>
 <5ad1e2df-85f3-4f9a-ab9d-b6ae34eebed3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5ad1e2df-85f3-4f9a-ab9d-b6ae34eebed3@kernel.org>
X-Rspamd-Queue-Id: 8D4084DCE6D
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
	TAGGED_FROM(0.00)[bounces-60623-lists,linux-media=lfdr.de];
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
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.225];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,ideasonboard.com:dkim,0.0.0.0:email,killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 03:33:57PM +0200, Krzysztof Kozlowski wrote:
> On 06/05/2026 11:01, Robby Cai wrote:
> > The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out} endpoint
> > labels, which is confusing for an i.MX8MQ binding. Rename the labels to
> > imx8mq_mipi_csi_{in,out} for consistency.
> > 
> > Fixes: 37255747ecbd ("media: dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller")
> 
> Nothing to fix here. Otherwise explain the bug.
> 
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---
> >  .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > index 4fcfc4fd3565..71f79651dd96 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > @@ -220,7 +220,7 @@ examples:
> >              port@0 {
> >                  reg = <0>;
> >  
> > -                imx8mm_mipi_csi_in: endpoint {
> > +                imx8mq_mipi_csi_in: endpoint {
> 
> Drop the labels instead - they are not used.

I think the label has value, it improves readability of the example by
making the purpose of the endpoints more explicit. I won't fight for it
though, I know it's hard to change your mind.

> This is just churn and for sure not a fix.
> 
> NAK

-- 
Regards,

Laurent Pinchart


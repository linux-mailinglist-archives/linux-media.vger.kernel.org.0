Return-Path: <linux-media+bounces-62890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD4YE5baFmpVtgcAu9opvQ
	(envelope-from <linux-media+bounces-62890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:50:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F05E3A6F
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4198930EE9D6
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15473FE359;
	Wed, 27 May 2026 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O2gawcK4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131A03FCB14;
	Wed, 27 May 2026 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882311; cv=none; b=YdHKvXzBfagnOkJWtcPpiHxiTzhMfvaTBynA2QuPxERQHJglGazbaWsikS3QXgh+SWe66wXjR+h4HDdInuMYTbRaPym8+q9jWMyjr8qTdGzvF742CnpxEwCt/RjL4c2VeNOy0Op8eQ8tLm9tPcNo6RsZKAfJ+tzx/UhYlWkzNKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882311; c=relaxed/simple;
	bh=J8HWEnOlJ6Qs7xGG5VUasoHKKzXrTRjUX3pcyYjgeGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBognu+fDIKxVNy6RmsEl3XnUTin7e4Z1lyFyDW8zOip6VhKfiq0tL+y1C1OJzGY4yZ19eiZMUtCnUSusia9NgLnEpHEG7Kq3yj+70k4t6+LcPn8IOAER6YDEdO4k8+yh5gcYSPjiupOBaxcKi+oJD3O8WDkKZCb9WhplMmG/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O2gawcK4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (62-193-63-110.as16211.net [62.193.63.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAB949D1;
	Wed, 27 May 2026 13:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779882287;
	bh=J8HWEnOlJ6Qs7xGG5VUasoHKKzXrTRjUX3pcyYjgeGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2gawcK4KnOj/A1H7gp8aanPxKgY9q8qdqLlmxYux04Nd/DsE69P7E95cc6zzdxeZ
	 B3c0LXeUS2T6iPXD82DZl0ED04r96Jtz0bPQlFxhYHDnwDELgyIDlYFpcEg1jgkg9h
	 9hPM1x19a0H7cMLV6xLy8UULktx7vc8VrCu91Fxc=
Date: Wed, 27 May 2026 13:45:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260527114504.GA480025@killaraus.ideasonboard.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
 <20260526-towering-essential-civet-19a5ad@quoll>
 <20260526094438.GE228394@killaraus.ideasonboard.com>
 <14f9923e-ae0a-4e69-b3b9-a7353b84b9f8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <14f9923e-ae0a-4e69-b3b9-a7353b84b9f8@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62890-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[oss.nxp.com,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B74F05E3A6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 11:37:34AM +0200, Krzysztof Kozlowski wrote:
> On 26/05/2026 11:44, Laurent Pinchart wrote:
> >>> +  - |
> >>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> >>> +
> >>> +    syscon@4ac10000 {
> >>> +        compatible = "nxp,imx95-camera-csr", "syscon";
> >>
> >> Drop entire node, not relevant. Or actually this example could be in the
> >> parent binding example.
> > 
> > I asked for this in the review of a previous version. The example only
> > stated "formatter@20" and it was not mentioned anywhere that the device
> > was supposed to be a child node of a syscon. The driver reads the reg
> 
> Binding does not have to state that. Parent's device binding will state
> that.
> 
> > property and uses it as an offset to the regmap of the syscon, I wanted
> > to see where/how the node was meant to be integrated in DT.
> 
> Sure, parent's device schema should have complete example. But we never
> add the parent compatibles to the child schema - that's leading to
> additional work later with no real benefits (that's only example, so no
> real code except maintenance effort).

OK. There was no mention of the child in the parent's bindings in the
previous version. Now that it's being fixed, we can drop the parent
here.

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-3747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1FB82EDB0
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 12:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EAB01C22DAE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 11:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F581B803;
	Tue, 16 Jan 2024 11:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Tc2nwIAn"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C54F1B7F3
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TDmvQ5MwjzyS4;
	Tue, 16 Jan 2024 13:27:30 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1705404451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4I8N1ltAq91SC1+mE1OZ0/Uc32zCT613/VH5/DBnJLc=;
	b=Tc2nwIAnTum+1S3tWEVam4J43PThUhW+pGcpeDtyG55nIX1uu5pAIX4jdh4gAi/Yhp7Sk7
	bUO5HC/HNDkPaD+QJZRs03RmCJOHSBKysIViCajuNrpaA8vX/GAMmmLV7mNh24OwZ0/kU0
	vXzr6iREVmzVHHJlAYgYHSFgJT0dc/8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1705404451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4I8N1ltAq91SC1+mE1OZ0/Uc32zCT613/VH5/DBnJLc=;
	b=b4Hy0vXa43E3R2085jbpAVTcPKduAhFApWmIBiaVL6805kl9zqFeDO+elKbYQ9ITKTC7be
	JdO85Jyp7z5v2seYIes2Z8xt+NAoRlASPSlTZTIZ3ulqjOIbaWuFSuqFqIL869z629jW45
	S2DUx//bZQL38cJxLOIdzbMP+LwquYg=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1705404451; a=rsa-sha256; cv=none;
	b=w+jl7eyDJDOw9nI5ecJw6Z70iZTkqnhx+1s5o1VRc2oi+WGEUgZl/2HNOcJ6PS8IjD2GRI
	s2ghsyqirDBBoyIWu3WBYO57Wswrv/PLifsZJd/OlnwaTMOBOoV6sgqV1PE6ruZTmQZaHU
	F0upxGfcSFKzdu19EsMzYwn8m3taa5E=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A4F59634C93;
	Tue, 16 Jan 2024 13:27:29 +0200 (EET)
Date: Tue, 16 Jan 2024 11:27:29 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: Re: [PATCH v2 1/7] media: mc: Add local pad to pipeline regardless
 of the link state
Message-ID: <ZaZoIXiM0XGDchIo@valkosipuli.retiisi.eu>
References: <20240116084240.14228-1-laurent.pinchart@ideasonboard.com>
 <20240116084240.14228-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116084240.14228-2-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Tue, Jan 16, 2024 at 10:42:34AM +0200, Laurent Pinchart wrote:
> When building pipelines by following links, the
> media_pipeline_explore_next_link() function only traverses enabled
> links. The remote pad of a disabled link is not added to the pipeline,
> and neither is the local pad. While the former is correct as disabled
> links should not be followed, not adding the local pad breaks processing
> of the MEDIA_PAD_FL_MUST_CONNECT flag.
> 
> The MEDIA_PAD_FL_MUST_CONNECT flag is checked in the
> __media_pipeline_start() function that iterates over all pads after
> populating the pipeline. If the pad is not present, the check gets
> skipped, rendering it useless.
> 
> Fix this by adding the local pad of all links regardless of their state,
> only skipping the remote pad for disabled links.
> 
> Cc: Alexander Shiyan <eagle.alexander923@gmail.com>
> Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
> Reported-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Closes: https://lore.kernel.org/linux-media/7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Could you add Cc: stable when sending the PR? This should be applied to 6.1
and later.

-- 
Regards,

Sakari Ailus


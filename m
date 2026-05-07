Return-Path: <linux-media+bounces-60778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JTUHWVl/GkqPgAAu9opvQ
	(envelope-from <linux-media+bounces-60778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 12:11:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B404E6872
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 12:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51F50300F1A5
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 10:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017213BC673;
	Thu,  7 May 2026 10:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KZyDcNtT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE821862A
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148704; cv=none; b=Meayy+sQmoYld8sspXz80ZSibS38TVyZ6ELhizOZkaKrVhNce9pAgg6b6UpjSbgW8we/3fPAdTyypLizQloJMuS2NwHmJWz/tsF1aOhi+7xHnBvZ7rqGqc8SwcHyoY9ht7Fv208eXA1vfaOGYRWY+gcjua80Vh4T2647O5tRqGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148704; c=relaxed/simple;
	bh=wbCA3p2kGnDrZNw1ygxCBxptvCSCzj9n/FNjhvKYLew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQsU/4MkTLlRvkuyMR3dblarAnZKo9DMWv50xXy2cwne7glYpQBQOK+QZsq7/eKbPEb5cU1AIyLVUtoAcxGjGk91CNDdP5mCV8OYwf0G1goJ/AjRTC0AmolX5XL/sM6p7W1WkYaGCt4IAhEpZja+eV7OSlw+NU85PuLeZGKygxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KZyDcNtT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 935B3664;
	Thu,  7 May 2026 12:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778148694;
	bh=wbCA3p2kGnDrZNw1ygxCBxptvCSCzj9n/FNjhvKYLew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KZyDcNtT4cZXwgccK+S9aP1lt1KcZSgmWOVuLOrwm3NiD8/6XwxHGPfJiuv9bq2b5
	 pmCs+K1gPgsS0aW9IPklc5EFHndUV2he6ofW0BzBgA7q65jlZciLImmHFe+ZEsa9AS
	 dLEfkdXb/HCD0S73sMEE7dDJttHWTuRygFqBCUYw=
Date: Thu, 7 May 2026 13:11:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v5 1/1] media: Documentation: Improve LINK_FREQ
 documentation
Message-ID: <20260507101137.GK1778786@killaraus.ideasonboard.com>
References: <20260507101052.89080-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507101052.89080-1-sakari.ailus@linux.intel.com>
X-Rspamd-Queue-Id: E2B404E6872
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60778-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,nxp.com:email]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 01:10:52PM +0300, Sakari Ailus wrote:
> Add a reference to the LINK_FREQ control and clarify the meaning of the
> control as for C-PHY the matter is less obvious.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> I'm posting this separately from the metadata preparation series.
> 
> since v4 metadata preparation:
> 
> - Add the dependency to UI for CSI-2.
> 
>  Documentation/driver-api/media/tx-rx.rst                     | 3 ++-
>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 5 ++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index 22e1b13ecde9..7df2407817b3 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -93,7 +93,8 @@ where
>     * - variable or constant
>       - description
>     * - link_freq
> -     - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
> +     - The value of the :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` integer64
> +       menu item.
>     * - nr_of_lanes
>       - Number of data lanes used on the CSI-2 link.
>     * - 2
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 6d516f041ca2..57c2baf34acf 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -24,7 +24,10 @@ Image Process Control IDs
>  .. _v4l2-cid-link-freq:
>  
>  ``V4L2_CID_LINK_FREQ (integer menu)``
> -    The frequency of the data bus (e.g. parallel or CSI-2).
> +    The fundamental frequency of the operating symbol rate (serial interfaces
> +    such as CSI-2) or the sampling rate (parallel interfaces such as DVP or
> +    Bt.565) of the data interface. For CSI-2, the frequency is equal to
> +    _1 / (2 * UI)_.
>  
>  .. _v4l2-cid-pixel-rate:
>  

-- 
Regards,

Laurent Pinchart


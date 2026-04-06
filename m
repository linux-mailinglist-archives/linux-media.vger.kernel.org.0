Return-Path: <linux-media+bounces-58093-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM4vIA6m02nhjwcAu9opvQ
	(envelope-from <linux-media+bounces-58093-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 14:24:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A4A3A343C
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 14:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 179A730160D8
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 12:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F1C3368B0;
	Mon,  6 Apr 2026 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OHfQfCiY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4943A330D3B;
	Mon,  6 Apr 2026 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478231; cv=none; b=VUFEzyX59IpCfhtJJun4myIqbBhld7OwNjvAf9qISyirHNLLhbjRobqUUn6FEQhxq5g3DYHa7bzoA1qCghdEsW7lfOi+00zR3linj9F0CZT2jnGTXjbZUws2wGyA6G923ZyBPI5bULq8LkBMmqb3TflzmG/PXXYY/PBdf8g8Z50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478231; c=relaxed/simple;
	bh=CZ2TQtbJlcmSqkpVbwk3oMXkS75vL7hpvL/GOHfsj/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cp1Ed5d22EUR1cAGwbjUb3WNPbgY0uUHXbaSsV7foAmHNUOJcL0jZaBZktnVfJmCgeFNXqOjDd7+6jGf/odC8VKU8oPJWBJlfWaivpqsrYEI100y38+BXqjZbwSkbwOxNmwfKX9wJxADbQhY5lcfww04eirRZ064VIeCsTb6Suk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OHfQfCiY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7FB5010D4;
	Mon,  6 Apr 2026 14:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775478141;
	bh=CZ2TQtbJlcmSqkpVbwk3oMXkS75vL7hpvL/GOHfsj/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHfQfCiYXWv+hidfsczBC05rToVqRW92Ozcak1jTsxGolmmqR/yWEy+IVgHLrmh7P
	 4Zw6gNhN762fMUrqQLAlGb2O2bkk3yV/FVmeNoMFlq8XB5Ld8im4JZyuwJPlbwqRFN
	 +MBLwL2QKckmta+GTkCWfn/xepA+9sk0jTc997j4=
Date: Mon, 6 Apr 2026 15:23:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sunny Patel <nueralspacetech@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-core: v4l2-subdev: Removed duplicate lockdep
 assertion
Message-ID: <20260406122346.GA1268443@killaraus.ideasonboard.com>
References: <20260405212020.GG1213462@killaraus.ideasonboard.com>
 <20260406095850.32732-1-nueralspacetech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406095850.32732-1-nueralspacetech@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58093-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: D8A4A3A343C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When submitting new versions of a patch (or patch series), please
remember to indicate the version in the subject line. The -v option to
git-format-patch helps.

On Mon, Apr 06, 2026 at 03:28:50PM +0530, Sunny Patel wrote:
> The __v4l2_subdev_state_get_interval() function has a duplicate
> lockdep_assert_held() call. Removed the redundant assertion.
> 
> Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 32e6f60e26c7..4616e9280a28 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1843,8 +1843,6 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
>  	if (WARN_ON(!state))
>  		return NULL;
>  
> -	lockdep_assert_held(state->lock);
> -

Why do you remove this assertion and not the next one ?

>  	if (state->pads) {
>  		if (stream)
>  			return NULL;

-- 
Regards,

Laurent Pinchart


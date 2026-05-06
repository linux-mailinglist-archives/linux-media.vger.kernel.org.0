Return-Path: <linux-media+bounces-60589-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACSHJ9g1+2nfXgMAu9opvQ
	(envelope-from <linux-media+bounces-60589-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:36:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 120CF4DA480
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5087C303BB8C
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65031329E44;
	Wed,  6 May 2026 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cSZKOwRa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B23449EC3;
	Wed,  6 May 2026 12:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070945; cv=none; b=XDVh9F3dGrBjXa1z36BMEXtrq35gV1xKWSay1tzIX674Gfdz3eqh34qL7HD5VSf6lYs/4pO8+eMSWjkvJ2UPSm7hpbH+pt911hLnzwaSQZOxGqmGuUsl3U8ubdUg8ODrs41Dinsi3F0OsdqfdWo99nYoA8LQpkY3jHhFQBWb6aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070945; c=relaxed/simple;
	bh=nbw46mxLLQX1LlFnsr2gxQX1L3Mtv1grDLT66heuhpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwIEBO0izdCMTmrZPTseqwsWLo1wDKWB5/1e2KiwFUMlTuw+tEfMPASf5C0QuIp+gyLmAMOpNeucj4vmxtHBekwur93rBwx4ogQ/1DxkNOo+gCvp6qaC5YoaQAGrt891LKKhg47VbvYh4TuCCE6YUoNI7o1biPaDADz/u93r3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cSZKOwRa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A77FF63D;
	Wed,  6 May 2026 14:35:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778070939;
	bh=nbw46mxLLQX1LlFnsr2gxQX1L3Mtv1grDLT66heuhpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSZKOwRat5PndRjUnnfnEKJEvP9O19dowtGuzE5GMrN34ox9azsLXJYNV/FhaF/ZU
	 WYrRj2P4GZDbmVjLb+QcGoSX9fSZ939fZ94KGLY5jpnk02BVs8H7eTmY3FVWVD51YL
	 TggPQITr2mL9ELrDSzic3LMV4mMHn2cm10mUYioA=
Date: Wed, 6 May 2026 15:35:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: imx8-isi: add missing
 v4l2_subdev_cleanup() in crossbar and pipe
Message-ID: <20260506123541.GO1598374@killaraus.ideasonboard.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-3-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506031210.2769998-3-xiaolei.wang@windriver.com>
X-Rspamd-Queue-Id: 120CF4DA480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-60589-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,ideasonboard.com:dkim,ideasonboard.com:email,windriver.com:email]

Hello Xiaolei,

Thank you for the patch.

On Wed, May 06, 2026 at 11:12:08AM +0800, Xiaolei Wang wrote:
> Both mxc_isi_crossbar_init() and mxc_isi_pipe_init() call
> v4l2_subdev_init_finalize() which allocates the subdev active state,
> but neither mxc_isi_crossbar_cleanup() nor mxc_isi_pipe_cleanup()
> calls v4l2_subdev_cleanup() to free it.
> 
> This causes a memory leak on every rmmod, reported by kmemleak:
> 
>   unreferenced object 0xffff0000d06fc800 (size 192):
>     comm "(udev-worker)", pid 254, jiffies 4294913455
>     backtrace (crc 36eeae58):
>       kmemleak_alloc+0x34/0x40
>       __kvmalloc_node_noprof+0x5f8/0x7d8
>       __v4l2_subdev_state_alloc+0x1fc/0x30c
>       __v4l2_subdev_init_finalize+0x178/0x368
> 
> Add the missing v4l2_subdev_cleanup() calls before media_entity_cleanup()
> in both crossbar and pipe cleanup paths.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 605a45124103..c580c831972e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -491,6 +491,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>  
>  void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar)
>  {
> +	v4l2_subdev_cleanup(&xbar->sd);
>  	media_entity_cleanup(&xbar->sd.entity);
>  	kfree(xbar->pads);
>  	kfree(xbar->inputs);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0..cb50af2270f6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -819,6 +819,7 @@ void mxc_isi_pipe_cleanup(struct mxc_isi_pipe *pipe)
>  {
>  	struct v4l2_subdev *sd = &pipe->sd;
>  
> +	v4l2_subdev_cleanup(sd);

v4l2_subdev_cleanup() should also be called in some of the error paths
of mxc_isi_pipe_init(). This can be done in a separate patch, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	media_entity_cleanup(&sd->entity);
>  	mutex_destroy(&pipe->lock);
>  }

-- 
Regards,

Laurent Pinchart


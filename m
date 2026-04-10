Return-Path: <linux-media+bounces-58495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JDWGGO52GmmhQgAu9opvQ
	(envelope-from <linux-media+bounces-58495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:48:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB03D44CB
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B97A301107B
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1D43AA500;
	Fri, 10 Apr 2026 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gTxBiQkq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B142D877A
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810912; cv=none; b=YCFShYiGbe4WKPcNXEOMYJwaQjOOo7EGzYr8nkQPV6ShrZWX487Ftj86/6qyJih746E9Zq4aDTAHO2TbfNp61JgrlOEgMUccWR4qsNuMV3Vv0Be+cDsAC1Oz6C5NYRqa/IqLJAKEg6/0keRm6xw7eT6EgplE7EtyD3C33LPY24Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810912; c=relaxed/simple;
	bh=YrYcxetUoCdKpTga/NiRsI7ssOntAeavqcg60Jz4W8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMxi2mlm7TbOrT3mVkCnzP5GG0rBVe7A3BM9cGQVaI6KAzoR+7nkEM5bDJo027egshMohkwv68+ZRxWc7wHadhqG34y3yRnxc+ouXXoIvERrKcqTN+c7nJhXfQNUhfTEQDtBSVOdBrJhShi4qAH+oPA9cYOk/wuR7xd1AU8T4jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gTxBiQkq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A426D1BA;
	Fri, 10 Apr 2026 10:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775810818;
	bh=YrYcxetUoCdKpTga/NiRsI7ssOntAeavqcg60Jz4W8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTxBiQkqFTOn1tKTQGsPD/tnVbiq28mC9oNTMmuI5R/qLizoZBCaeZ8ePbnL2hwKa
	 wrajJJQYFMA6nZTbm9toWTvpAO0uPQgDqGKItTyPM50SWgWU4OrTs+SGIOO/ytE1vp
	 ckx/G9AOY7XVk8Z+iijzg4LVLShLdzaEG1iVbPeY=
Date: Fri, 10 Apr 2026 10:48:24 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 08/29] media: imx274: Remove redundant kernel-doc
 comments
Message-ID: <adi5CH2yE4CLikVv@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-9-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58495-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: CFCB03D44CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:17PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from  regular callback functions. These
> comments have no information value.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

This might be easy, but how is this related to metadata ?
This is a 29 patch series that prepares for an 89 patch series.

review time is not free, piling stuff over stuff is a recipe for
making sure we'll never merge this.

Anyway
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


> ---
>  drivers/media/i2c/imx274.c | 38 --------------------------------------
>  1 file changed, 38 deletions(-)
>
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 8ec78b60bea6..241821572e03 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -897,14 +897,6 @@ static int imx274_regulators_get(struct device *dev, struct stimx274 *imx274)
>  					imx274->supplies);
>  }
>
> -/**
> - * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
> - * @ctrl: V4L2 control to be set
> - *
> - * This function is used to set the V4L2 controls for the imx274 sensor.
> - *
> - * Return: 0 on success, errors otherwise
> - */
>  static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> @@ -1059,16 +1051,6 @@ static int __imx274_change_compose(struct stimx274 *imx274,
>  	return 0;
>  }
>
> -/**
> - * imx274_get_fmt - Get the pad format
> - * @sd: Pointer to V4L2 Sub device structure
> - * @sd_state: Pointer to sub device state structure
> - * @fmt: Pointer to pad level media bus format
> - *
> - * This function is used to get the pad format information.
> - *
> - * Return: 0 on success
> - */
>  static int imx274_get_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *fmt)
> @@ -1081,16 +1063,6 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> -/**
> - * imx274_set_fmt - This is used to set the pad format
> - * @sd: Pointer to V4L2 Sub device structure
> - * @sd_state: Pointer to sub device state information structure
> - * @format: Pointer to pad level media bus format
> - *
> - * This function is used to set the pad format.
> - *
> - * Return: 0 on success
> - */
>  static int imx274_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *format)
> @@ -1423,16 +1395,6 @@ static void imx274_load_default(struct stimx274 *priv)
>  	priv->ctrls.test_pattern->val = TEST_PATTERN_DISABLED;
>  }
>
> -/**
> - * imx274_s_stream - It is used to start/stop the streaming.
> - * @sd: V4L2 Sub device
> - * @on: Flag (True / False)
> - *
> - * This function controls the start or stop of streaming for the
> - * imx274 sensor.
> - *
> - * Return: 0 on success, errors otherwise
> - */
>  static int imx274_s_stream(struct v4l2_subdev *sd, int on)
>  {
>  	struct stimx274 *imx274 = to_imx274(sd);
> --
> 2.47.3
>
>


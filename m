Return-Path: <linux-media+bounces-60812-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJiiNMiZ/Gk6RwAAu9opvQ
	(envelope-from <linux-media+bounces-60812-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:55:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 613AC4E9AD5
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94B0B308AB59
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8343FB7E2;
	Thu,  7 May 2026 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pURbVV6G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E88E3F9F58;
	Thu,  7 May 2026 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161814; cv=none; b=iStZRHOZbsZR7+Y7ht3DBWHNe97UE0zWJDRAzQDZLRTNj7xn8h9ulap/Xm2rYksbfmDyljoBljS2OTLZ8uO5OWlTodjc4yyOBvJqpimUjGy/tqoLDvAmae/XPatxY5yNYQ9Ensi31opdCZcDIJFiYVR/pOmixDLJlUjiNyjaiV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161814; c=relaxed/simple;
	bh=vorkROVhNpCbYfmcuE0cXiAs7QmMD80FnGrS057U7to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRzhGH5UxDIg5Kh3qSJH6fLMaOlVwJYI639W5FdkCZ6Ai5VdOc0mPiJJ6bD1vg3f6a+JEgeFE7a1kxlTZm6S1kPSliropgNgcvnBx5KBdkR6fOOcuBsDMIZF2m9ZJ6w69605+OH9OMv8ooLRw/M+LxRKpVSg8949fGeOjqEgNHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pURbVV6G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B1879CE;
	Thu,  7 May 2026 15:50:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778161807;
	bh=vorkROVhNpCbYfmcuE0cXiAs7QmMD80FnGrS057U7to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pURbVV6GR1iwvHN+nmHKXXUq+wBRermIr80sBnK+r6P3fWJSCPO0hzMEM6SimujsZ
	 JZ/eVJ8PmCJMSOtNKMF+C1oZSuZzkBGrIDbxHrmG2aXyeN7h31FeBNZCmUXkL63EZc
	 1PpjbYDTbE8sWVrfh/4c41w/TG2vj9CcBSNv4Rcc=
Date: Thu, 7 May 2026 15:50:08 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 02/13] media: imx355: Remove setting FRM_LENGTH_LINES in
 the mode regs
Message-ID: <afyYhtS5iKYi97Re@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-2-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-2-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: 613AC4E9AD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60812-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:email]
X-Rspamd-Action: no action

Hi Dave

On Wed, May 06, 2026 at 07:23:40PM +0100, Dave Stevenson wrote:
> Registers 0x0340 and 0x0341 (FRM_LENGTH_LINES) are already written
> from the set_ctrl(V4L2_CID_VBLANK) handler, so don't write them
> from the mode register list.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx355.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index a694d4d742ae..8ea510218c7c 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -256,8 +256,6 @@ static const struct imx355_reg_list imx355_global_setting = {
>  static const struct imx355_reg mode_3268x2448_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0340, 0x0a },
> -	{ 0x0341, 0x37 },
>  	{ 0x0344, 0x00 },
>  	{ 0x0345, 0x08 },
>  	{ 0x0346, 0x00 },
> @@ -280,8 +278,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
>  static const struct imx355_reg mode_3264x2448_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0340, 0x0a },
> -	{ 0x0341, 0x37 },
>  	{ 0x0344, 0x00 },
>  	{ 0x0345, 0x08 },
>  	{ 0x0346, 0x00 },
> @@ -304,8 +300,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
>  static const struct imx355_reg mode_3280x2464_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0340, 0x0a },
> -	{ 0x0341, 0x37 },
>  	{ 0x0344, 0x00 },
>  	{ 0x0345, 0x00 },
>  	{ 0x0346, 0x00 },
> @@ -328,8 +322,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
>  static const struct imx355_reg mode_1940x1096_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0340, 0x05 },
> -	{ 0x0341, 0x1a },
>  	{ 0x0344, 0x02 },
>  	{ 0x0345, 0xa0 },
>  	{ 0x0346, 0x02 },
> @@ -352,8 +344,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
>  static const struct imx355_reg mode_1936x1096_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0340, 0x05 },
> -	{ 0x0341, 0x1a },
>  	{ 0x0344, 0x02 },
>  	{ 0x0345, 0xa0 },
>  	{ 0x0346, 0x02 },
> @@ -376,8 +366,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
>  static const struct imx355_reg mode_1924x1080_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0340, 0x05 },
> -	{ 0x0341, 0x1a },
>  	{ 0x0344, 0x02 },
>  	{ 0x0345, 0xa8 },
>  	{ 0x0346, 0x02 },
> @@ -400,8 +388,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
>  static const struct imx355_reg mode_1920x1080_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0340, 0x05 },
> -	{ 0x0341, 0x1a },
>  	{ 0x0344, 0x02 },
>  	{ 0x0345, 0xa8 },
>  	{ 0x0346, 0x02 },
> @@ -424,8 +410,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
>  static const struct imx355_reg mode_1640x1232_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0340, 0x05 },
> -	{ 0x0341, 0x1a },
>  	{ 0x0344, 0x00 },
>  	{ 0x0345, 0x00 },
>  	{ 0x0346, 0x00 },
> @@ -448,8 +432,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
>  static const struct imx355_reg mode_1640x922_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0340, 0x05 },
> -	{ 0x0341, 0x1a },
>  	{ 0x0344, 0x00 },
>  	{ 0x0345, 0x00 },
>  	{ 0x0346, 0x01 },
> @@ -472,8 +454,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
>  static const struct imx355_reg mode_1300x736_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0340, 0x05 },
> -	{ 0x0341, 0x1a },
>  	{ 0x0344, 0x01 },
>  	{ 0x0345, 0x58 },
>  	{ 0x0346, 0x01 },
> @@ -496,8 +476,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
>  static const struct imx355_reg mode_1296x736_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0340, 0x05 },
> -	{ 0x0341, 0x1a },
>  	{ 0x0344, 0x01 },
>  	{ 0x0345, 0x58 },
>  	{ 0x0346, 0x01 },
> @@ -520,8 +498,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
>  static const struct imx355_reg mode_1284x720_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0340, 0x05 },
> -	{ 0x0341, 0x1a },
>  	{ 0x0344, 0x01 },
>  	{ 0x0345, 0x68 },
>  	{ 0x0346, 0x02 },
> @@ -544,8 +520,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
>  static const struct imx355_reg mode_1280x720_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0340, 0x05 },
> -	{ 0x0341, 0x1a },
>  	{ 0x0344, 0x01 },
>  	{ 0x0345, 0x68 },
>  	{ 0x0346, 0x02 },
> @@ -568,8 +542,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
>  static const struct imx355_reg mode_820x616_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0340, 0x02 },
> -	{ 0x0341, 0x8c },
>  	{ 0x0344, 0x00 },
>  	{ 0x0345, 0x00 },
>  	{ 0x0346, 0x00 },
>
> --
> 2.34.1
>
>


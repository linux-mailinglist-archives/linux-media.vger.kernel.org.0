Return-Path: <linux-media+bounces-16056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B494D237
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 16:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9B911C20C8C
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 14:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D93C156676;
	Fri,  9 Aug 2024 14:32:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAE0946F
	for <linux-media@vger.kernel.org>; Fri,  9 Aug 2024 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723213929; cv=none; b=A2STo5Rk9qyF8ZthdUKit7uKE1Q/EJdfLEf+g3SP4vB+gRlYCdy4PRgXSs02XeyPiW7E8ZBVzDmlC9yZHcO6fm1Ud1VxG/gxRlJhwW4ufxZpD6rWz2C+ioS+LMy5AQoyPXE2LWG+6ZTeN92mpxufpiAGXyyObjeolsYoIp/pHUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723213929; c=relaxed/simple;
	bh=cjwpeh0kqDVJHM+invAc8ZyTc7e+zxck2KdMC6bVlyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQKlXq/sTrDHhCK/XMfLfp4hM4RKXgBo9zfTfmkERVTqS6OZBYRRYbY54xcHGu8sfjnWA7yz2HTG9Z8S/2vAVfeisSRRvSTLX98trY/+rTW98pWamq3O8OYTHXgybPRFF3iKXBvld+QuY/G0uy2pP5PJdrYYnUeDLOdRHtKPgbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1scQei-0000pa-Pc; Fri, 09 Aug 2024 16:31:48 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1scQed-005gfq-Tz; Fri, 09 Aug 2024 16:31:43 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1scQed-00Aq7J-2b;
	Fri, 09 Aug 2024 16:31:43 +0200
Date: Fri, 9 Aug 2024 16:31:43 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: linux-media@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] media: rockchip: rga: fix offset lookup
Message-ID: <ZrYoT7HmTc7OT2Y4@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	John Keeping <jkeeping@inmusicbrands.com>,
	linux-media@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
References: <20240806094842.248775-1-jkeeping@inmusicbrands.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240806094842.248775-1-jkeeping@inmusicbrands.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi John,

On Tue, 06 Aug 2024 10:48:41 +0100, John Keeping wrote:
> The rot_mir_point_matrix is arranged with the rotation values in rows
> and mirror settings in the columns.  Fix the order of indexing to match
> this so that the correct values are used.

The table and indexing is correct. The rows (second index) contain the
mirror modes and the columns (first index) contain the rotation modes,
and the table and the indexing are correct. If you read the columns, the
corner moves clockwise, but if you read the rows, the corner moves in a
z or s form, indicating that these are the mirror modes.

It's probably worth documenting, how the table works.

However, there is a mixup of the arguments between the call to
rga_lookup_draw_pos() and the use in the function.

The function definition is

static struct rga_addr_offset *
rga_lookup_draw_pos(struct rga_corners_addr_offset * offsets,
                    u32 rotate_mode, u32 mirr_mode)

but it is called as

rga_lookup_draw_pos(&offsets, mir_mode, rot_mode);

I think, fixing the order of the arguments in the function call is the
correct fix to your observed bug.

Michael

> 
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 11c3d72347572..b7d51ddb10fa4 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -97,7 +97,7 @@ static struct rga_addr_offset *rga_lookup_draw_pos(struct
>  	if (!offsets)
>  		return NULL;
>  
> -	switch (rot_mir_point_matrix[rotate_mode][mirr_mode]) {
> +	switch (rot_mir_point_matrix[mirr_mode][rotate_mode]) {
>  	case LT:
>  		return &offsets->left_top;
>  	case LB:
> -- 
> 2.45.2
> 
> 
> 


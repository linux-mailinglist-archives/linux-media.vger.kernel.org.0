Return-Path: <linux-media+bounces-13973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A80913529
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 18:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC383B22C0D
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 16:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76B1170834;
	Sat, 22 Jun 2024 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="srSdeYSS";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="N90iPIhE"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE324155310;
	Sat, 22 Jun 2024 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719074682; cv=pass; b=ERy9tChF5YkGS/XfXllr/T2f9XTK001uvzQXdvhzagZullQjMA+cvw+s7CHspHAm+QxZSOzl27xxxh8ohe8QtR+YS2KiNJrtGCbAeg46XKe5A7W5IbDQu2GY93o4YfzMyCCrVKYa/DkLCsyUt3O2lWAdg6lPlM5feIpKPHuyFeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719074682; c=relaxed/simple;
	bh=jvTYbNUocEWWP1kdMsN/c0oMZeK+6Snvd4ua4ffwxc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t08ZiLJrDI3B3/ameBNOF9KUyepNUW01NmzgaS6zqC71VWpt/gj7YMikDzlvFTVRpHLLcZhBByLo1+uRAHtVAdo/JuOhyaIJdrRAQa/dL+FDfabL2q0Sjoxgf/zfa9Lqo8H64rubOFczAoYe6LWk2rIP5EfQ7VFMBEc93ep8JEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=srSdeYSS; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=N90iPIhE; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4W60SF6gTrz4BDtF;
	Sat, 22 Jun 2024 19:44:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719074669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HJw6IIQYlkcwg74atqklAkQ53x7zp+FAHhIjGmyRxCk=;
	b=srSdeYSS47kPsSmdFZfrxoJLC1XxOE67Zb28jXpO/DIJrn9NCyAVpwHsg0yqv0PW4k3pBm
	yB/knUVW/3F3iqnmsCGJ+bQE8R6S89hDyPwpthlCNIqWG7Em4lJp/gynVXQg7iEs9AjKKp
	soF1z1qqBsElGHZXhZ8efB0RDAILrVkwwCPPETBDyZ/X75Db7WbOE6mF6iKCK5EKOSjcal
	HlhlDwsw2OUFlZlAToVW/imWvS4Jpxaewo6+kBDQR4q7ndKLOEhPS7PkvHkDN/5EwInv28
	EmZwKflw2gKr58h6P5b2SveJlC027VxKzXczRuo/FrDm+f14t93fmnj+G6cDsw==
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W60S25kdGzyQm;
	Sat, 22 Jun 2024 19:44:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1719074661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HJw6IIQYlkcwg74atqklAkQ53x7zp+FAHhIjGmyRxCk=;
	b=N90iPIhESxeG/UEeghuV/h3Gj4RUB28Q8mH8YSrZ1Woxgl51fQ7czvB0fJcV6kE192fz+O
	b9zWoSwv0RtF8CM7kf3taQ58GilR59lzZGm00fi+2rohlnHqrb6k254MNWNFcxUR69YPGb
	OBk2S54wCWX9rLtFCIJG56pCEzSAzyE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1719074661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HJw6IIQYlkcwg74atqklAkQ53x7zp+FAHhIjGmyRxCk=;
	b=ZcBWO58ma5Y1x7XusxXgM70Owy/8c/qyLNTaUUi+j/y3XnqStbbBAHOFRjYytS7cx4Os/z
	40FvLlhtwXhlmzHRL6d7/rW3l93EwAgnYYOnxDuFWAnZtyZhokbJ63F2ZypVq1YnQRUahB
	JqDJUsVvkqmlQ1W6KaavnYztIdTKF1c=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719074661; a=rsa-sha256; cv=none;
	b=M9Do9fNj0r+3QmIqo1I6uSBc4toginfDokXPwx9EqhKGaY1eowHsQdoC6hCNvHOb+A7t4O
	oHvWFBi4sp1qcYN9mlz9/7H5uTUQR+X5IHOfWYRwxHfz4rPxKUub7wYtmAq7XCTtG7rjbS
	b6HXIeqpfcpUiTPnXyF7WX7B/fo9ZWA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AB371634C93;
	Sat, 22 Jun 2024 19:44:15 +0300 (EEST)
Date: Sat, 22 Jun 2024 16:44:15 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/8] media: sun4i_csi: Implement link validate for
 sun4i_csi subdev
Message-ID: <Znb_X42wK_UoMUNR@valkosipuli.retiisi.eu>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240619012356.22685-3-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619012356.22685-3-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

On Wed, Jun 19, 2024 at 04:23:50AM +0300, Laurent Pinchart wrote:
> The sun4i_csi driver doesn't implement link validation for the subdev it
> registers, leaving the link between the subdev and its source
> unvalidated. Fix it, using the v4l2_subdev_link_validate() helper.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

This looks like a bugfix. Shouldn't this be backported?

-- 
Sakari Ailus


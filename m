Return-Path: <linux-media+bounces-60495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL7LHiFy+mkDPAMAu9opvQ
	(envelope-from <linux-media+bounces-60495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 00:41:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5724D46D3
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 00:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B65FB3052B6B
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 22:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB09B3264F5;
	Tue,  5 May 2026 22:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N2FdDZC7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EF51DE894;
	Tue,  5 May 2026 22:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778020887; cv=none; b=dYiLAvgGelW7QDL5wxXpf++F3evByL/3mX8BiFIDzpLU3PxZelJLgEeHOyy3XdfXzu9vZSI4JUKKLtVLXI+GgYyWePGKTFX/XHqd1sZ5VUGWAauXaCFJhdEC98Vj9eZ2NTXVuHAF00WDXcNTaK+p+Xv7KoG4E6FROimiDqNIY8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778020887; c=relaxed/simple;
	bh=whhdB0jSlNvIcCn4yTQh1IWX+0kZn4kDL5bgL/kWPXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XI8L0FmC8oKmdRfKFiGRIs+auBx4m/NKhHAV0oBuibAIIY5Z2OogUgCL1C7bUlefjmc4RXzpw1fQUxwFCHd3dyiK1KHbXZ944cr/FM8ZAWks6WsBC6PzEvtrfkR56PQH5swA95/SHqpofifXnDLsdOaC37d3xunQp+5rZpUpBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N2FdDZC7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 645875B2;
	Wed,  6 May 2026 00:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778020881;
	bh=whhdB0jSlNvIcCn4yTQh1IWX+0kZn4kDL5bgL/kWPXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2FdDZC7vLPJArLf0fbyGhKPzHWf3fyR+jP6pUJ2cCvcMLOiZ9ruKzWEs6MoLG5wA
	 bGA0e6n1qC+P2ARixooOQIRp5AvWXpjzibSpNa33b8RVZHMPUNYfFy8YScU9queoUh
	 lFgeB3Kj7CVM8eNJLHvr/hZH6pcgh7DiImZ0e1FE=
Date: Wed, 6 May 2026 01:41:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 2/6] media: i2c: mt9p031: Rewrite assignment to make
 smatch happy
Message-ID: <20260505224123.GD1598374@killaraus.ideasonboard.com>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
 <20260504-smatch-7-1-v3-2-fda125c30058@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-smatch-7-1-v3-2-fda125c30058@chromium.org>
X-Rspamd-Queue-Id: CA5724D46D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60495-lists,linux-media=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	TAGGED_RCPT(0.00)[linux-media,samsung];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,chromium.org:email]

On Mon, May 04, 2026 at 06:54:05AM +0000, Ricardo Ribalda wrote:
> The current code makes smatch a bit uncomfortable:
> drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> 
> Probably because smatch is not clever enough (yet). Do a simple rewrite
> to make sure that smatch understands what we are doing here.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9p031.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index ea5d43d925ff..8dc57eeba606 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -796,7 +796,8 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
>  			data = (1 << 6) | (ctrl->val >> 1);
>  		} else {
>  			ctrl->val &= ~7;
> -			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
> +			data = ((ctrl->val - 64) >> 3) & 0x7f;
> +			data = (data << 8) | (1 << 6) | 32;
>  		}
>  
>  		return mt9p031_write(client, MT9P031_GLOBAL_GAIN, data);

-- 
Regards,

Laurent Pinchart


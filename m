Return-Path: <linux-media+bounces-59856-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I/qCKa48GlQXwEAu9opvQ
	(envelope-from <linux-media+bounces-59856-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:39:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 849304860AA
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2ED2326FC16
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0CA43D4F7;
	Tue, 28 Apr 2026 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n0x4tnkU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44143D500;
	Tue, 28 Apr 2026 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382730; cv=none; b=RWe/67OaIksWh7hH1qaqgwbwRa6CiZTERJdAaBE8GZVtv0utss4I5ie0Kt+Oj7z45BufYtnspLW5tV23ofGEGWGzmHmlJUAcTtc7OT49u3rEYZb3BYkbScAwtcKHqLP4LHh7xavO1ImwO+2/HaVZm+mSXiKBZG15k/C43H3u9Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382730; c=relaxed/simple;
	bh=4//q+TQB27M8M5A4ul7hqiXW0NNLlG0jYooYZoxpG4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E80oH9BSObwq5Aup7Ds3PT4OEt+o992Z4585rncn/ki2VAF9LLzOgZqdb6XcnfDSIKtBzJwAIvy8lxsWgWj5Ox+x/er6mjDk/up1yL5xnbcb2dDe7MuPALczZdlrSn5dpCB/yPYayQSgyNjdI0peWNYFRddri+cfu4T9NF+Qahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n0x4tnkU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6764CE91;
	Tue, 28 Apr 2026 15:23:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777382623;
	bh=4//q+TQB27M8M5A4ul7hqiXW0NNLlG0jYooYZoxpG4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0x4tnkUmIi2GiWsmbS5zrQ2AcclyUm7CG1sTSxlPrMqAP7cpIC9cdDUx9teOb0vr
	 EDXshRtRvD76pRof+zP0VkRdypUs2lmBxQNLCa2v1lt6HNsZouny5uSgAJlgaVb8lo
	 l0pyzGekhnwQAERLONENL2D9aXwxl0xw448KBh/0=
Date: Tue, 28 Apr 2026 16:25:24 +0300
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
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
Message-ID: <20260428132524.GC120836@killaraus.ideasonboard.com>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-2-46890dffb611@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-smatch-7-1-v1-2-46890dffb611@chromium.org>
X-Rspamd-Queue-Id: 849304860AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59856-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 12:41:08PM +0000, Ricardo Ribalda wrote:
> The current code makes smatch a bit uncomfortable:
> drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> 
> Probably because smatch is not clever enough (yet). Do a simple rewrite
> to make sure that smatch understands what we are doing here.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/mt9p031.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index ea5d43d925ff..5c9dff030b4d 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -795,7 +795,7 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
>  			ctrl->val &= ~1;
>  			data = (1 << 6) | (ctrl->val >> 1);
>  		} else {
> -			ctrl->val &= ~7;
> +			ctrl->val -= ctrl->val % 8;

This is less readable than it was :-/ Is there a way to avoid the
warning while keeping the ~7 ? Maybe by assigning

			data = (ctrl->val - 64) >> 3;
 			data = (data << 8) | (1 << 6) | 32;

>  			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
>  		}
>  

-- 
Regards,

Laurent Pinchart


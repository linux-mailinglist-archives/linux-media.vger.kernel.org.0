Return-Path: <linux-media+bounces-60165-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id m4oeK84K9WlcHwIAu9opvQ
	(envelope-from <linux-media+bounces-60165-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 22:19:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 057BF4AF72E
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 22:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7CFB300F5F9
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 20:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD393F7871;
	Fri,  1 May 2026 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QhnIgNjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8162935AC18;
	Fri,  1 May 2026 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777666752; cv=none; b=HazbhsQL/uiyOCcIxsD+InaxXK5BjJJh5BCk3SC99hnVLS2kqNmqy0MLwtopnbS562a89QWTA+r+khAal+TVvWWnHDglFpDEHXRlAHNlVkmRpBcseLghfLPPv80XafhfRKxB4yYQ/kbIQa95CHciHvbB3Ft7XMhv3qoBYlwdpVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777666752; c=relaxed/simple;
	bh=nTjZPSq8DBGTmtRgO55BiuONxSkZofggTHq8jvdoUmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTZI6lCvIL3yLgwR+DzCfogk5K4mLyyk2RFpk/tPfz1tUQ0BCOHOIc1UlXNttpfPSMy7gHL4nruORnLyuo+aFHepWFNj7+qvxxh+WUxqc/+xjOtEaC4l6HnmaWGsw3W6Gn5x0W4PYFUmMeNvD4X0IqNA2s84dYCDFk4rjsVKBOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QhnIgNjQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0662E379;
	Fri,  1 May 2026 22:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777666643;
	bh=nTjZPSq8DBGTmtRgO55BiuONxSkZofggTHq8jvdoUmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QhnIgNjQgi5FyiBaC6epUhdaXRIqM9ZC9nLt/3+8mph0qLiV+/O3kIQOm/RMXjhV4
	 n5KebhU+BX0DpXMRDYuFcUX2TpvHTCMsWyESXxJVcYDVjbkOJ0rCSPqkklox0mZK4P
	 yGzPqF+y/T670DoHjt09RGakaujlNp4zG7HaIlPc=
Date: Fri, 1 May 2026 23:19:06 +0300
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
Subject: Re: [PATCH v2 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
Message-ID: <20260501201906.GA488660@killaraus.ideasonboard.com>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
 <20260501-smatch-7-1-v2-2-a2fcfb2531ac@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-smatch-7-1-v2-2-a2fcfb2531ac@chromium.org>
X-Rspamd-Queue-Id: 057BF4AF72E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60165-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,chromium.org:email]

On Fri, May 01, 2026 at 11:32:47AM +0000, Ricardo Ribalda wrote:
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
>  			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;

I'd still like to keep the ~7 (and, while at it, making the register
computation easier to read). I previously proposed

			ctrl->val &= ~7;
			data = (ctrl->val - 64) >> 3;
			data = (data << 8) | (1 << 6) | 32;

which didn't quite appease smatch. We could use an explicit mask:

			ctrl->val &= ~7;
			data = ((ctrl->val - 64) >> 3) & 0xff;
			data = (data << 8) | (1 << 6) | 32;

>  		}
>  
> 

-- 
Regards,

Laurent Pinchart


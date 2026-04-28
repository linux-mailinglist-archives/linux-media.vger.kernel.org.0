Return-Path: <linux-media+bounces-59851-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMLoMpW08GlwXgEAu9opvQ
	(envelope-from <linux-media+bounces-59851-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:22:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B51485C10
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 086CB321397B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B1343CEC7;
	Tue, 28 Apr 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kUs5YvGs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3932A402B8B;
	Tue, 28 Apr 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381843; cv=none; b=ZraOgrwNv2ln3Cw+Edb5Cg1nJq1225LguP6BEW5R0VmWqP4tRxekUQb5NZhwoJUf56teYWydtAItRi157FCjM4ILxFPrQ/pydVJsRtjToyyCspbPa/D16vU2Dtu/4mTaiMZddshHzNSPuqNcsntdidAgIeF3Z9Hc8Vwi/J5s/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381843; c=relaxed/simple;
	bh=1XQ/j+SutyW07O2zgfWB6CUID3BmPCUjwjCkthfb9vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5Tf2ZE8JvMHj4CLeTslIAnHg9SIvgq7WELBKla1dHZIuYPIlCgUQFkCEe8H65VVAFxuMJjemmDvdavkMM6ouSkwmpgNAhTOeWhKQ3ehPJD7sqsUv/Oi28Ki+uOdsb9Gzs5350t1govGGsCM7Li4Hz7wgpVhgmNqPJYgottCTOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kUs5YvGs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6672CE91;
	Tue, 28 Apr 2026 15:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777381737;
	bh=1XQ/j+SutyW07O2zgfWB6CUID3BmPCUjwjCkthfb9vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUs5YvGsxbaCjgRS0Az70CI9LfFR36x/nmrqXsEPxb+JQwbSyjHWlxAxvPGOvYbiO
	 K48DPIYJmijvFjobipSht9kj4OQRexk66cBUPIMxA6GaaJNvQ0SRm7uvnMNC5x53hi
	 2+m5WSImwtoGi9TR/X11ZoaxV856lS8L/xj5KeKA=
Date: Tue, 28 Apr 2026 16:10:38 +0300
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
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Message-ID: <20260428131038.GA120836@killaraus.ideasonboard.com>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org>
X-Rspamd-Queue-Id: 70B51485C10
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
	TAGGED_FROM(0.00)[bounces-59851-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Ricardo,

Thank you for the patch.

CC'ing Jacopo.

On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> Avoid invalid memory access if the zones_num is bigger than
> zone_weight.
> 
> This patch fixes the following smatch errors:
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> index 6f9ca7a7dd88..42d780f684d1 100644
> --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
>  	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
>  
>  	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> +	if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))

This is triggerable by userspace, it shouldn't result in a WARN_ON().
Ideally the horiz_zones_num and vert_zones_num should be validated at
buf prepare time, and an error should be returned to userspace. That
will likely not fix your smatch issue though, I don't think it will be
able to understand that the values have been validated.

Jacopo, do we need to add a validate function pointer to
v4l2_isp_params_block_type_info ?

> +		zones_num = C3_ISP_AWB_MAX_ZONES;
>  
>  	/* Need to write 8 weights at once */
>  	for (i = 0; i < zones_num / 8; i++) {
> @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
>  	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
>  
>  	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> +	if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> +		zones_num = C3_ISP_AE_MAX_ZONES;
>  
>  	/* Need to write 8 weights at once */
>  	for (i = 0; i < zones_num / 8; i++) {
> 

-- 
Regards,

Laurent Pinchart


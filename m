Return-Path: <linux-media+bounces-60244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE4hCqJI+Gn+sAIAu9opvQ
	(envelope-from <linux-media+bounces-60244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:20:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB874B940D
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21E77301014D
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 07:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD0A2DEA9B;
	Mon,  4 May 2026 07:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bTqfMcXn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5CC283FCF;
	Mon,  4 May 2026 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879185; cv=none; b=D+lHcF8sp5kDUAzbM5luUhgMNaS1ThzQUH1s8x7fTNudDe127g0+IlWaSydmD9dIkJ30LdvNRTlWxzF5yfm2ORYVfMWqiH24jpVDucTnm9lHqfy91enk82/H6Qwiow7adeNexuO3BUgEmS4BvAj6a6FlhjGzgEiMNWYlBI7Wqy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879185; c=relaxed/simple;
	bh=ZwpEgD9dfY1lLa0/0tzE+yUzAUsDEEdYjAkgPNwa27o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qB5069p4aFRlVOD8o8yg5gv9FOClZaEvlXBWc+uTU4fawgSSoceo+jtZSVFEmnvM7l5A/N/IlhJUIT4VDvdAU527cC3R3TFeopFxAQGo3HTV3xdk74GFf7quSLkTV60CbmoVpvzDxthCrQGoX6cr28DNiytRhJdUxd3sMv/tXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bTqfMcXn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E18F08F;
	Mon,  4 May 2026 09:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777879172;
	bh=ZwpEgD9dfY1lLa0/0tzE+yUzAUsDEEdYjAkgPNwa27o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTqfMcXndrnhLd74eNJZVShOfpKjZXblDYGHxTC4M3yh3VPjZKQ4WDraxoXBusIyp
	 Hp4qPP888Kqc5vAk9B7Rip3VFT31cqWzOrQO6k2r8/qSwZPeFkTgWeTcARmuZ+7MUW
	 A3NOYIu+DMETVzblFReNES1pQD33ZYT6dMxRJezg=
Date: Mon, 4 May 2026 09:19:30 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Message-ID: <afhH8Fq_7bIy3Lv3@zed>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
 <20260504-smatch-7-1-v3-6-fda125c30058@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-smatch-7-1-v3-6-fda125c30058@chromium.org>
X-Rspamd-Queue-Id: 6DB874B940D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60244-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]

Hi Ricardo

On Mon, May 04, 2026 at 06:54:09AM +0000, Ricardo Ribalda wrote:
> Avoid invalid memory access if the zones_num is bigger than
> zone_weight.
>
> This patch fixes the following smatch errors:
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
>
> Cc: stable@vger.kernel.org
> Fixes: fb2e135208f3 ("media: platform: Add C3 ISP driver")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> index 6f9ca7a7dd88..aec3eed0e443 100644
> --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
>  	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
>
>  	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> +	if (zones_num > C3_ISP_AWB_MAX_ZONES)
> +		zones_num = C3_ISP_AWB_MAX_ZONES;

Or
        zones_num = min(cfg->horiz_zones_num * cfg->vert_zones_num,
                        C3_ISP_AWB_MAX_ZONES);

Whatever you prefer:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  	/* Need to write 8 weights at once */
>  	for (i = 0; i < zones_num / 8; i++) {
> @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
>  	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
>
>  	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> +	if (zones_num > C3_ISP_AE_MAX_ZONES)
> +		zones_num = C3_ISP_AE_MAX_ZONES;
>
>  	/* Need to write 8 weights at once */
>  	for (i = 0; i < zones_num / 8; i++) {
>
> --
> 2.54.0.545.g6539524ca2-goog
>


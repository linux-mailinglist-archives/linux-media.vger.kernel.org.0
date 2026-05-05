Return-Path: <linux-media+bounces-60411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDUUNo/q+WkLFQMAu9opvQ
	(envelope-from <linux-media+bounces-60411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:03:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D744CE1DF
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC5D303A8DC
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 13:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FFB426EBA;
	Tue,  5 May 2026 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HFEBFlRf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBA833EB17
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 13:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986183; cv=none; b=uDsmAQtp2Q/sLNOu6o16gOkplJ2j5p0DuMCeAR7j/bBpL5FPgSLDwZTCnU5Y49atBv7Mxg961GUzoWr1z8BBuJ+YBhD3kM1N3DBJLnaF+h8qEw4nIyqQUgK6udTq2An0MHTdS6z5fKXpdb3ZPk1jQLLf0g4FWIwUCA2q8mLJ6Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986183; c=relaxed/simple;
	bh=JLYTr15VdQPAoay2dFvierboxsfdwS3Os0ik8jks8g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1TxCBUYGXHrKrrgu4R9QgRLd186PomusO0uArl1Bo+JDoevFac2ipsRSawBnF/kuOeY6c1CmvTIriAS7fC9R0TXd+/GLFNrVTvZ/YG6suH24+IYuYNB3rxOFkhLd29PjXCILhLs6jXsIrAfy71EDGjQLTvjN7a5kW60TulD8TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HFEBFlRf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4493C874;
	Tue,  5 May 2026 15:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777986177;
	bh=JLYTr15VdQPAoay2dFvierboxsfdwS3Os0ik8jks8g0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HFEBFlRfpdaXW0rQ1RFAg6mlgT1BRKnDtEW2mApXgQt0phIEbGPM0+qhGnbv25gxy
	 rBZLyaJskBQMh0YQrb5GgipxB7MQeRfpIdja0wB9Z84+K+28E4zYbcNaH+vvhoIveM
	 sFL1IPi/GS0kZuNYkblDUcHTpPOoKy7GKXRTJ9xY=
Date: Tue, 5 May 2026 16:02:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: Documentation: Use right function to test
 device power state
Message-ID: <20260505130258.GA1601351@killaraus.ideasonboard.com>
References: <20260326104611.1586131-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326104611.1586131-1-sakari.ailus@linux.intel.com>
X-Rspamd-Queue-Id: 95D744CE1DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60411-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid]

Hi Sakari,

Thank you for the patch.

On Thu, Mar 26, 2026 at 12:46:11PM +0200, Sakari Ailus wrote:
> Tell driver authors to use pm_runtime_get_if_active() instead of
> pm_runtime_get_if_in_use() to check the device's power state in the s_ctrl
> callback. pm_runtime_get_if_active() is the right function to use here
> since it returns non-zero if the device is powered on rather than its
> PM runtime usage_count is non-zero.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/camera-sensor.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index 94bd1dae82d5..c8552f70f496 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -114,7 +114,7 @@ of the device. This is because the power state of the device is only changed
>  after the power state transition has taken place. The ``s_ctrl`` callback can be
>  used to obtain device's power state after the power state transition:
>  
> -.. c:function:: int pm_runtime_get_if_in_use(struct device *dev);
> +.. c:function:: int pm_runtime_get_if_active(struct device *dev);

This looks fine, but I think we should also mass-convert drivers. There
are more drivers using pm_runtime_get_if_in_use() than
pm_runtime_get_if_active(), so we'll keep seeing new code using the
former due to cargo cult.

For this patch,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Should I submit a series to mass-convert drivers, or will you do it ?

>  
>  The function returns a non-zero value if it succeeded getting the power count or
>  runtime PM was disabled, in either of which cases the driver may proceed to

-- 
Regards,

Laurent Pinchart


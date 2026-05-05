Return-Path: <linux-media+bounces-60496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKF+L1p5+mlOPQMAu9opvQ
	(envelope-from <linux-media+bounces-60496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 01:12:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C444D4971
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 01:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECB20305616F
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 23:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5818931C56D;
	Tue,  5 May 2026 23:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V1RQrstE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EB63358C2;
	Tue,  5 May 2026 23:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778022735; cv=none; b=mKV/cvdG7vn6vPR7FUmheUUqO5quMaNLNdW/02M0SsGFIJ1a3yT4IbmEZvJHsm2FnRqnWidg6mQLajGe3UZOAW5RI5eIq1aZaDAYv9mlAHba1tPlQSMDqrskm1Xbb38QAriOtRI7TKiPRLelecP7PqIWavD5MnWPC4y6JCBnO+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778022735; c=relaxed/simple;
	bh=yjFbwx4a27WgqwEzpXDAmrlWG7G7Bo3QCHm5UD3y+PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWqexojXjYldFsey1CdHCbYk9oTGu60ED1nYdIX5tuMNQlKe+CNAolF/OxI96xISttYN/rbGYxfrKVTczov7rXnL/96cGRIqANVYm4Im8w1BjrjBH062TKPpP2A7fSTzB08BbQS3xz2sgXwClyjN+tR/0DySJxsnorjxM5BsMUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V1RQrstE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A270B5B2;
	Wed,  6 May 2026 01:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778022729;
	bh=yjFbwx4a27WgqwEzpXDAmrlWG7G7Bo3QCHm5UD3y+PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1RQrstEbX6MuMjwKIodxr6WqTUQt5hzxR8BGaJPhLvAUtlmhLIqJ+p7OleR64884
	 TeLsIG1s5j61Z5CPKQPQWnK5NjIwyPBw5hLqzzFdFYsuMLZ5RhSHnTOduZkChtNuTu
	 faI55vHmrw03bQ76J5979ARXSaNIVpQPzEur54RI=
Date: Wed, 6 May 2026 02:12:11 +0300
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
Subject: Re: [PATCH v3 1/6] media: v4l2-dev: Add range check for vdev->minor
Message-ID: <20260505231211.GE1598374@killaraus.ideasonboard.com>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
 <20260504-smatch-7-1-v3-1-fda125c30058@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-smatch-7-1-v3-1-fda125c30058@chromium.org>
X-Rspamd-Queue-Id: 34C444D4971
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60496-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,killaraus.ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]

On Mon, May 04, 2026 at 06:54:04AM +0000, Ricardo Ribalda wrote:
> If the fixed minor ranges are not properly set we could end up in a
> situation where the calculated minor is invalid. Add a check for this in
> the code to make it more robust.

If it was just for that, we could define the ranges in a way that could
not lead to future programmatic errors.

> This check also fixes the following false positive smatch warning:
> 
> drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 6ce623a1245a..5516b2bbb08f 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
>  	vdev->minor = i + minor_offset;
>  	vdev->num = nr;
>  
> +	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> +		mutex_unlock(&videodev_lock);

I may get tempted to convert code to using scoped guards at some point.

> +		return -EINVAL;
> +	}
> +

I'm annoyed by the proliferation of workarounds for smatch false
positives that generate useless code :-/ This is in particular is not a
big deal though, so

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

but I don't want to continue in this direction with every new kernel
release. We need a way to tell smatch that this is safe with incurring
an runtime cost.

>  	/* Should not happen since we thought this minor was free */
>  	if (WARN_ON(video_devices[vdev->minor])) {
>  		mutex_unlock(&videodev_lock);
> 

-- 
Regards,

Laurent Pinchart


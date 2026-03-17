Return-Path: <linux-media+bounces-56007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIDpHSQfuWmbrQEAu9opvQ
	(envelope-from <linux-media+bounces-56007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:30:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C122A6BF5
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BEE030E0C22
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586A835DA74;
	Tue, 17 Mar 2026 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPXd4DHd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC8233CEAA
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739557; cv=none; b=eQpZnzP3Jx07HqnlZqVlwbOYXE104WYREIxspzdyUfqb+ZXfYWJssD7jR8WkDo+DPr0S8P8PpOJbbsHI6ikQwzXIMbuP8m3NytQV8U6ww7CY2f4GD0Dg3J9+uarXKMryEFKZ2FSwErjcd1Zz4mm/gX1Wcys3lNLoS6fRQAvhySI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739557; c=relaxed/simple;
	bh=v2r6oRoLcWY3Aw9nl0Ucg45fFgShzxK3GDgO7gcrlts=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=CNRN27nCY3715KLk0NRL0ZNMWJ/nDXpxD5Ok+gv69UP2WaMCFRQF2/4bHxJFSSbHCQw2IhsIqBGGbt2EFQNj2GjNdfSuv4DN1HFMDcTqLMvBO6/geTPAWf5trhChMS5OpSeoR+WIo7xxEIoEyz9qqDWrR7vqV2XQJ+kPwGQIfiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPXd4DHd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1770C4CEF7;
	Tue, 17 Mar 2026 09:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739557;
	bh=v2r6oRoLcWY3Aw9nl0Ucg45fFgShzxK3GDgO7gcrlts=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=SPXd4DHdAkBqFuXsI+o69io0CMC7e5dMxhsvKZqQtTgz+01dCpU06Nf8OjrUE/Ict
	 Nwcy1c6j+6CZqB/wJzxddcRv0OcCwfWDlMkwF+ucjnyg+DGujy66EC/t5vMrEks8pV
	 vgAMGS5sgwMaiLQb19dwS+wCe7UGtM2nI+bnsQ581dfnLjzZBdXAlva49pBBi9jFem
	 se8cA6Nk2/S9KXv/P9qQ5/qXgIP1nVVv6k+/WDDIBqNI1SIc8LyO5OZspZVeuZ4Y1T
	 7oXobFeKpHcKXRiNrW1y6fG9t5oFi58zEwlU4n1oZQkx0NLB/+imElM6F8OQbg1YHI
	 WMwwlsfPrE9hA==
Message-ID: <ff901bcb-c8f1-4a5f-950e-322253b59106@kernel.org>
Date: Tue, 17 Mar 2026 10:25:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 05/11] au0828: Fix green screen in analog
To: Bradford Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20260312213532.2907276-1-brad@nextdimension.cc>
 <20260312213532.2907276-6-brad@nextdimension.cc>
Content-Language: en-US, nl
In-Reply-To: <20260312213532.2907276-6-brad@nextdimension.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56007-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nextdimension.cc:email]
X-Rspamd-Queue-Id: D3C122A6BF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 22:35, Bradford Love wrote:
> When the driver was converted to VB2 the original function to fix
> green frame detection was removed and a default vb2 dqbuf function
> was used instead. This vb2 dqbuf function leads to green frames not
> being detected and correupting stream captures.
> 
> The vidioc_dqbuf function checks the greenscreen flag, and, if set
> resets the stream to discard the green frame and decode a real frame.
> 
> Signed-off-by: Bradford Love <brad@nextdimension.cc>
> ---
>  drivers/media/usb/au0828/au0828-video.c | 30 +++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
> index fbaa542c8259..f65f15b1d92a 100644
> --- a/drivers/media/usb/au0828/au0828-video.c
> +++ b/drivers/media/usb/au0828/au0828-video.c
> @@ -1671,6 +1671,32 @@ static int vidioc_log_status(struct file *file, void *fh)
>  	return 0;
>  }
>  
> +static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *b)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	struct au0828_dev *dev = video_drvdata(file);
> +	int rc;
> +
> +	rc = check_dev(dev);
> +	if (rc < 0)
> +		return rc;
> +
> +	/* Workaround for a bug in the au0828 hardware design that
> +	 * sometimes results in the colorspace being inverted
> +	 */
> +	if (dev->greenscreen_detected == 1) {
> +		dprintk(1, "Detected green frame.  Resetting stream...\n");
> +		au0828_analog_stream_reset(dev);
> +		dev->greenscreen_detected = 0;
> +	}
> +
> +	if (vdev->queue->owner && vdev->queue->owner != file->private_data)
> +		return -EBUSY;
> +
> +	return vb2_dqbuf(vdev->queue, b, file->f_flags & O_NONBLOCK);

Please replace those last 4 lines with:

	return vb2_ioctl_dqbuf(file, priv, b);

It's cleaner that way.

Regards,

	Hans

> +}
> +
> +
>  void au0828_v4l2_suspend(struct au0828_dev *dev)
>  {
>  	struct urb *urb;
> @@ -1764,8 +1790,8 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
>  	.vidioc_prepare_buf         = vb2_ioctl_prepare_buf,
>  	.vidioc_querybuf            = vb2_ioctl_querybuf,
>  	.vidioc_qbuf                = vb2_ioctl_qbuf,
> -	.vidioc_dqbuf               = vb2_ioctl_dqbuf,
> -	.vidioc_expbuf               = vb2_ioctl_expbuf,
> +	.vidioc_dqbuf               = vidioc_dqbuf,
> +	.vidioc_expbuf              = vb2_ioctl_expbuf,
>  
>  	.vidioc_s_std               = vidioc_s_std,
>  	.vidioc_g_std               = vidioc_g_std,



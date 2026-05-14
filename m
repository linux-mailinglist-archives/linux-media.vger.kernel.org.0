Return-Path: <linux-media+bounces-61616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJCfJFkGBmrFdwIAu9opvQ
	(envelope-from <linux-media+bounces-61616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 19:28:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20300545515
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 19:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CCDD53016400
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 17:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26DF38F925;
	Thu, 14 May 2026 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=enjuk.jp header.i=@enjuk.jp header.b="lAm6W8qZ"
X-Original-To: linux-media@vger.kernel.org
Received: from www2881.sakura.ne.jp (www2881.sakura.ne.jp [49.212.198.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C10538F957;
	Thu, 14 May 2026 17:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.212.198.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779731; cv=none; b=kyTI28hFAUt5pmocYz+WWFSYPucBxq1Wob7XCgvK5MPCpN9bsdvRpu4RAZwwYltCC5YxJxs7KvB2+FSGusAAcvFuS9+glrfBLEuNvOfPh9VC8UvwDMn7NjglbSHV6O1lBcF8zCeq3DfB8MXDHIyOtv7yskzD7pcWGMrwafm+HrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779731; c=relaxed/simple;
	bh=JkTzan2TAdzxNrkvggvMqzgvCTOcZtWniObFhto6U7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ck59aMhHqItNc7+UP9TQ7mHKSZs4aqAZmjcwSSzFCPCiwqR4a/0SiE9LCtcZ0ohx1x+bawWo3HZhNYcN+957QnZtJPrxNOHzEUoGW3rS/jlZDHdEP3AG2mPiyc/F6PvPwDQHsY9u6GnF19+INYa+aygiXMbt+JkOZws0Gnk+lUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enjuk.jp; spf=pass smtp.mailfrom=enjuk.jp; dkim=pass (2048-bit key) header.d=enjuk.jp header.i=@enjuk.jp header.b=lAm6W8qZ; arc=none smtp.client-ip=49.212.198.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enjuk.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enjuk.jp
Received: from x1 (172.3.31.150.dy.iij4u.or.jp [150.31.3.172])
	(authenticated bits=0)
	by www2881.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 64EGY6kP032253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 15 May 2026 01:34:06 +0900 (JST)
	(envelope-from kohei@enjuk.jp)
DKIM-Signature: a=rsa-sha256; bh=KJXYpWgdI1+8mPaeQVxM9kxMX1aon81hC98dRZdveMY=;
        c=relaxed/relaxed; d=enjuk.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20251215; t=1778776446; v=1;
        b=lAm6W8qZlKCIIUmvkz5TCjMqeeCKFDv3/UzG+SBsEfNiP+fklZkQleHI4uZRFReI
         n4OnaKXKyr+R2WsHbAhopL3oJHBN3RDotma97rtTp7O1rSgcm6lTZCc4kJhTtWpg
         q6MdZU1SL3bKHCxtdhz+3y/2bsfQyQofJ5J/+iBK+UV9H8EFf6HFPLm2lIQ+nrx9
         WHi8ilrbKfRoOzEA92h1oArJ2h84CQJFpbQkfOyIkE+VNSIpjPP4/Ehws+NaljKB
         YPZlDczDgaYCLERFL0OViMe47hioWUmph5eqz+zPFXQvr0WD2yuhftlWxk2wDWLX
         8bxAPvfoCP0OkJa3wcAKbw==
From: Kohei Enju <kohei@enjuk.jp>
To: daiky0325@gmail.com
Cc: kees@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org,
        syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: msi2500: fix memory leak in msi2500_probe error path
Date: Fri, 15 May 2026 01:33:38 +0900
Message-ID: <20260514163406.21476-1-kohei@enjuk.jp>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510015755.198274-1-daiky0325@gmail.com>
References: <20260510015755.198274-1-daiky0325@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 20300545515
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[enjuk.jp,none];
	R_DKIM_ALLOW(-0.20)[enjuk.jp:s=rs20251215];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61616-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[enjuk.jp:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kohei@enjuk.jp,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,b1de0d5fd8a15fac11aa];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Action: no action

On Sun, 10 May 2026 01:57:55 +0000, Daiki Harada wrote:
> When video_register_device() fails in msi2500_probe(), the error path
> jumps to err_unregister_v4l2_dev, which skips the call to
> v4l2_ctrl_handler_free(). This leaks memory allocated by
> v4l2_ctrl_handler_init() and v4l2_ctrl_add_handler().
>
> Fix this by jumping to err_free_controls instead, which properly frees
> the control handler before unregistering the v4l2 device.
> 

Is the missing Fixes: tag intentional?

As far as I can tell from git blame, the Fixes tag might be:
Fixes: 2e68f841a5d1 ("[media] msi3101: use msi001 tuner driver")

That commit changed both the initialization sequence and the cleanup sequence on
failures, but didn't update the label it jumped to when video_register_device()
fails.

Otherwise, it looks good to me.

Side note: 
The code has changed quite a bit since the commit, including a function rename,
so I am not sure whether this can be cleanly backported to older stable trees.
Still, the Fixes tag might be helpful.

> Reported-by: syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
> Tested-by: syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com
> Signed-off-by: Daiki Harada <daiky0325@gmail.com>
> ---
>  drivers/media/usb/msi2500/msi2500.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
> index 1ff98956b680..76e1f2bfab0c 100644
> --- a/drivers/media/usb/msi2500/msi2500.c
> +++ b/drivers/media/usb/msi2500/msi2500.c
> @@ -1265,7 +1265,7 @@ static int msi2500_probe(struct usb_interface *intf,
>  	if (ret) {
>  		dev_err(dev->dev,
>  			"Failed to register as video device (%d)\n", ret);
> -		goto err_unregister_v4l2_dev;
> +		goto err_free_controls;
>  	}
>  	dev_info(dev->dev, "Registered as %s\n",
>  		 video_device_node_name(&dev->vdev));



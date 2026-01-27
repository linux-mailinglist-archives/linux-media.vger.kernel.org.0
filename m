Return-Path: <linux-media+bounces-51621-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPjZL/2TeGmxrAEAu9opvQ
	(envelope-from <linux-media+bounces-51621-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:31:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8D492D1F
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46D913007283
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 10:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FF634106A;
	Tue, 27 Jan 2026 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FslA8Vlw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607C4340A6B;
	Tue, 27 Jan 2026 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509862; cv=none; b=qxG/3WB25TeAWm3ryEIZiRLTSXt3rlzk9Yj0A/cMqu8pa4fDk9g1PzPw8UX+97+gTn+YMoYD2VZ2jPGuvjsTvY7XS0RjEBP44CDId/CEM04boCSCKPB5HRXeqnHpcegC0r8dKxkqJR9TVJ5MS1A0KRrRxdNnSgewWKsI0zLgURQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509862; c=relaxed/simple;
	bh=oPrrMYdAo/wBwjHczoAtaDB5c4aosW2vouQrspzQHTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3jpU1ge90ND6rV5cl0aG4vaG/RSur+qrK+/MXvt5M3x4yPXdPkrYw8yN6qC4wLC0T2lmSvNtmUJD7RlqAPjlfqisrtMUcq7jVjbx+gWXoidYuKr2zH8n6Itz1RN2PpcQP2vMRvAU+qp5QBSCEBYUPs4P1LIJjwUa2ecIjJqTGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FslA8Vlw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA43C116C6;
	Tue, 27 Jan 2026 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769509861;
	bh=oPrrMYdAo/wBwjHczoAtaDB5c4aosW2vouQrspzQHTI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FslA8VlwNIVgfzQbq+iMDIBxDK4gJTujtHVz8eNcwJ7fdg7WMuTBPB1pddDqVBhHi
	 HR9nrkoNtWP1cdJFZs6M1qwV3QEBQlfTUh4zRBOiQjL+nYu+wd7NiyT+4bu63PzYP9
	 MnjvYO7BHGf82CLztf9uRfLbs5GT6j3SNprBblCay51Ve1IXJCHw8L9h0oLJoAWNHg
	 ODf+Flr3tDzv3YWN9iJR92Bp/w6pU7VPZwjTu84do3uQzFuAwDoFOPEnNxNM4KXC6W
	 ryrtTY1XpF5lqsvqmiOVDmHkFWxcYccjA9m+ZuLhCir4x2WqktpTKAnZJ5ZEtPk7Ka
	 5aBAQlgPKFNiw==
Message-ID: <4b8971ee-aac1-4986-9d96-b4b1689b511c@kernel.org>
Date: Tue, 27 Jan 2026 11:30:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: i2c: ov02c10: Fix use-after-free in remove
 function
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bryan.odonoghue@linaro.org, bod@kernel.org, vladimir.zapolskiy@linaro.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org, stable@vger.kernel.org
References: <20260126173444.10228-1-bjsaikiran@gmail.com>
 <20260126173444.10228-2-bjsaikiran@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260126173444.10228-2-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51621-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D8D492D1F
X-Rspamd-Action: no action

Hi,

On 26-Jan-26 18:34, Saikiran wrote:
> The ov02c10_remove() function has a race condition where v4l2_ctrl_handler
> and media_entity resources are freed before the device is powered off.
> If userspace (e.g., PipeWire/WirePlumber) accesses the device during
> removal, this causes a use-after-free leading to kernel oops with
> "Execute from non-executable memory" errors.
> 
> The issue occurs because:
> 1. v4l2_ctrl_handler_free() is called first
> 2. Userspace may still have the device open
> 3. Control access triggers use-after-free
> 4. Device is powered off afterwards (too late)
> 
> Fix by reordering cleanup to disable runtime PM and power off the device
> BEFORE freeing v4l2_ctrl_handler and media_entity resources. This ensures
> the device is in a safe state before any resources are freed.
> 
> Call sequence after fix:
> 1. v4l2_async_unregister_subdev() - unregister from V4L2
> 2. pm_runtime_disable() - disable runtime PM
> 3. ov02c10_power_off() - power off device if needed
> 4. v4l2_subdev_cleanup() - clean up subdev
> 5. media_entity_cleanup() - clean up media entity
> 6. v4l2_ctrl_handler_free() - free control handler (safe now)
> 
> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
> Fixes: 44f8901 ("media: i2c: add OmniVision OV02C10 sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/i2c/ov02c10.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index cf93d36032e1..fa7cc48b769a 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -864,14 +864,14 @@ static void ov02c10_remove(struct i2c_client *client)
>  	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>  
>  	v4l2_async_unregister_subdev(sd);
> -	v4l2_subdev_cleanup(sd);
> -	media_entity_cleanup(&sd->entity);
> -	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  	pm_runtime_disable(ov02c10->dev);
>  	if (!pm_runtime_status_suspended(ov02c10->dev)) {
>  		ov02c10_power_off(ov02c10->dev);
>  		pm_runtime_set_suspended(ov02c10->dev);
>  	}
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  }
>  
>  static int ov02c10_probe(struct i2c_client *client)



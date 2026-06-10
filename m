Return-Path: <linux-media+bounces-64434-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xa2gDq9bKWp+VgMAu9opvQ
	(envelope-from <linux-media+bounces-64434-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:42:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FFD6695F9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:42:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=b6JP8vgP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64434-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64434-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B84030DA516
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E443DEFFE;
	Wed, 10 Jun 2026 12:38:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C836E312826
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 12:38:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095119; cv=none; b=OKCxsZRIcYgNAHoAnB6slGIlF+vP/8a20vIuMblVhAyFnaD54SrINE865EV2H/Q00TZydfK4JHBIikIcTAk8KFYZpgnrBT5v/YXxCspR0OB+SUg/ZNa3g8/DbQEBudN3VK6Dd3C3JLfjs0Dc8EhvWbiWIblyy8A7/LmyBMUDBh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095119; c=relaxed/simple;
	bh=ZWro41jLRDdyy2GUsF5GnlqKAMNsO+ii7qVkOxvgEy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6VBrimrdXkfZEnI/e0HR9BplGjcujsOoxn8MpMHUb8oRppPloQETqEL8NgQVmnEshxUaTrqIVXbqiAOJya/oMUNKnLz8AM56VoDGh8sMid1s1JiB7uMSj9nye7OMcyg1NMTaKMG3mgPYkFoNDWXHSytfDBHJathuMyQyZqjXp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b6JP8vgP; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 258746DF;
	Wed, 10 Jun 2026 14:38:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781095087;
	bh=ZWro41jLRDdyy2GUsF5GnlqKAMNsO+ii7qVkOxvgEy8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b6JP8vgPhfhFnORYSwn0HinQD8KRP/U0pg+q+4F6OoS9adc0oiW0AoBx0LT+R+l+A
	 oTTIGPRVz1ORV9N9P9ixQW0IxmcbzWH9jKk2kmNXjIe2bmbJ0kjlzGNfRome5pduBr
	 wYdy2aWflXSbKz34oQ/DhCpLQQxB6tWuJNV/Umts=
Message-ID: <05bd6f5b-8f13-42b9-9023-ebe2133c0b99@ideasonboard.com>
Date: Wed, 10 Jun 2026 13:38:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: i2c: ov8865: Drop the runtime PM usage
 count on stream failure
To: Jurison Murati <eng.juri@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20260609232255.13559-1-eng.juri@gmail.com>
 <6b764b77a7d78b8ae2cfb8a213a1e844a329db26.1781085860.git.eng.juri@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <6b764b77a7d78b8ae2cfb8a213a1e844a329db26.1781085860.git.eng.juri@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64434-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:eng.juri@gmail.com,m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:engjuri@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	FORGED_SENDER(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82FFD6695F9

Hi Jurison, thanks for the revision

On 10/06/2026 11:22, Jurison Murati wrote:
> ov8865_s_stream() takes a runtime PM reference when enabling the
> stream, but returns without releasing it if ov8865_sw_standby()
> fails, leaving the reference unbalanced and the sensor powered
> indefinitely. The same applies to a failure while disabling the
> stream, in which case the reference acquired at stream start is
> never dropped.
> 
> Drop the reference in a single place, both when disabling the
> stream and on failure, and only update the streaming state on
> success.
> 
> Signed-off-by: Jurison Murati <eng.juri@gmail.com>
> ---
> Changes in v2:
> - Drop the runtime PM usage count in a single place as suggested by
>    Sakari, which now also covers a failure while disabling the stream.
> - Not carrying Dan's Reviewed-by from v1 over since the logic changed.
> - Reordered to 1/2 so the next patch can rely on the unified error
>    handling. This was 2/2 in v1.
> 
>   drivers/media/i2c/ov8865.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index a8586df..5b909a8 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2621,15 +2621,13 @@ static int ov8865_s_stream(struct v4l2_subdev *subdev, int enable)
>   	ret = ov8865_sw_standby(sensor, !enable);
>   	mutex_unlock(&sensor->mutex);
>   
> -	if (ret)
> -		return ret;
> -
> -	state->streaming = !!enable;
> -
> -	if (!enable)
> +	if (ret || !enable)
>   		pm_runtime_put(sensor->dev);
>   
> -	return 0;
> +	if (!ret)
> +		state->streaming = enable;

I think this is ok, so you can have that tag back:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> +
> +	return ret;
>   }
>   
>   static const struct v4l2_subdev_video_ops ov8865_subdev_video_ops = {



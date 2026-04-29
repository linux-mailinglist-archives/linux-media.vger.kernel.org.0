Return-Path: <linux-media+bounces-59941-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO4/Bg668Wl1kAEAu9opvQ
	(envelope-from <linux-media+bounces-59941-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:58:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5363490D99
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D18C304F228
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646A23A5452;
	Wed, 29 Apr 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r34iXuIG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E883A3E77;
	Wed, 29 Apr 2026 07:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449226; cv=none; b=agGHUEIgCJJD3JzyRBkDZcMcO02gYnrmMotTg8id6pSlN2dy/SoeTVIwiKvsrU9sx2uMGQMi60/BSVLdJ+llr4ASMEjkLD3Idw9gY6Cqdu8E+c2QPWJQFEBZT7v0cJIp5msjNIt/TE1ZONODYcVJP5016IDf6H3PmYn4fJxNxCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449226; c=relaxed/simple;
	bh=l0FdvFxnREkwgkY6d6zbEIUX1bdgmbZ54xg2s0Irm5c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kRJS2PtzbzEZc1NKwg26S6UnRg+/GS/WAwRSAyLSFYLtJmTKnOGlwpzoIN2Qs6WWCbsXUlq+Kd4gKq4hMyhPE/mtlL0tHhB90HtqyTmXGLBW0xUQLQXdsdV4b88/rFQ2XXejbM/RbUufZTI0Cb2mlfkl8pK5yZSdOLBxO2QQ4YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r34iXuIG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A884C19425;
	Wed, 29 Apr 2026 07:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777449226;
	bh=l0FdvFxnREkwgkY6d6zbEIUX1bdgmbZ54xg2s0Irm5c=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=r34iXuIGzXOb7I0XeZZ58itr+0j9VFldO14O+gvmve1DwNwt9bp7FJxB1q9HijlYg
	 qvwv8ubs5RY5ZFiKdITa2GE6K2IvygnAw03wXuF9jqIyl4NVqW2voax4WfNbPG/uPu
	 2b4Y6uagVSJ8K9dKAl6X30nBfaNnNKc4TlbdcAiro+DMXjTAJhy8/kztEglntnaojm
	 2vNlExHop2pe7bwl019icCrIvzKP1wwWud1FIIVHZLwMIr3m9dY4sxjtzJvqeKZKAW
	 hHep+eAN3IxRHv6naopjB45PYFweNKveerYwlLasZCMieslvtNg/XwAYpr4/2YTGMK
	 qCzw0ylxJ9rbw==
Message-ID: <40d31660-73c1-417b-a00c-1a83079943e5@kernel.org>
Date: Wed, 29 Apr 2026 09:53:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/6] media: v4l2-dev: Add range check for vdev->minor
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao
 <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-1-46890dffb611@chromium.org>
 <afG2hm-V9uUkUmXk@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <afG2hm-V9uUkUmXk@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A5363490D99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59941-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]

On 29/04/2026 09:43, Sakari Ailus wrote:
> Hi Ricardo,
> 
> On Tue, Apr 28, 2026 at 12:41:07PM +0000, Ricardo Ribalda wrote:
>> If the fixed minor ranges are not properly set we could end up in a
>> situation where the calculated minor is invalid. Add a check for this in
>> the code.
>>
>> This check also fixes the following smatch warning:
>>
>> drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
>> drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
>> drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/v4l2-core/v4l2-dev.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index 6ce623a1245a..a731ffdb91ee 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -1032,6 +1032,12 @@ int __video_register_device(struct video_device *vdev,
>>  	vdev->minor = i + minor_offset;
>>  	vdev->num = nr;
>>  
>> +	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> 
> Could this be combined with the should-not-happen case below? The error
> handling is the same (releasing the mutex) and the error code could be as
> well. I think the message can be just as well removed as we have a
> WARN_ON() here anyway.
> 
> I wonder what Hans thinks.

I actually prefer to keep it separate. If you combine it, then it is hard
to see which of the two possibilities is actually wrong (out of range or
minor in use). And this function sits at the core of V4L2, so it's OK to
be a bit more verbose.

I do agree that a pr_err after a WARN_ON is not needed.

Regards,

	Hans

> 
>> +		mutex_unlock(&videodev_lock);
>> +		pr_err("invalid minor. Check ranges.\n");
>> +		return -EINVAL;
>> +	}
>> +
>>  	/* Should not happen since we thought this minor was free */
>>  	if (WARN_ON(video_devices[vdev->minor])) {
>>  		mutex_unlock(&videodev_lock);
>>
> 



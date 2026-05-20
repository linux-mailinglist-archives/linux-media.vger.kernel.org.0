Return-Path: <linux-media+bounces-62233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPAhDSWIDWpdygUAu9opvQ
	(envelope-from <linux-media+bounces-62233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:08:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC7A58B5D0
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70FC33111643
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B619F3D1CCD;
	Wed, 20 May 2026 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcA0Vm0C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F463D4107;
	Wed, 20 May 2026 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271311; cv=none; b=udMEmAIXgP4SDk2xqp3bQVkmnt6ZgswzqVim75trWqU5PFHSmqD68mvymbiDWwTH162BPhg2ntGtStrr6FobEu34606gO1b6tC4QKtyEWDor9vrKQDCF3M8nxa5o8xGNhIhd3BsVtoDvpG7cbwEaBtxd1DNRFwFwmjfoaYJWJ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271311; c=relaxed/simple;
	bh=2kjOc8Ls0UFdMuSBSDrdXsIoSchDjovZiXS1hsNNsnE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=b60MkqFKAKHERQULbPrELSb9tzdDtZMwqCAOUfOq4jS1q8pbmyIILb9WFbRGfa/z5SNCqsuHvCfpV85fHfZ80qMec7Rxk4qB7ukU/ZCaFPj9FLjSfb2wmgUv7QB557Hxy+nokYJcspVYQnIDNXkTvr60v9ApSO5gI1IzNVtfCdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcA0Vm0C; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468C01F000E9;
	Wed, 20 May 2026 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271309;
	bh=MixzhlBZGcUBFJNAhA8dmKn8MIsBFb+PCbZZFwQKYGM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=AcA0Vm0CQfYpn8/TJGEB1M8PTnJUKOxSlfKC1lkDiWNGbAK5n+sMIUd9Wwu8pAYE+
	 +C82e5oaYyKY88JUm7fIfRknNwPk6Ai19iIanE28U01tIRSbqT22uF4+jr6oY4u3xG
	 LBrUTXNueSGl8kmXRGQQS6/ljiK2a8K4QkO4SoiMIu5ItBYKUviaxoZ0auYN2TFxsM
	 lFpgScJQ0sc33tFSr8VTXazBN+WRv4cHNHEpkMuBmQElCi8RHaY6uY5C7TcjqzE8Hw
	 /GeKjnkLACvDKHLUsHDxhzubFTJgRQIqXn6QtGQKGaWN5T22Od48ujE0Hw5tJT/4Vc
	 ZUo950OtmEHZg==
Message-ID: <14ab929b-f236-48cf-a022-f424fa1e0c1e@kernel.org>
Date: Wed, 20 May 2026 12:01:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: v4l2-dev: do not fire driver's release on
 __video_register_device() failure
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Ma Ke <make24@iscas.ac.cn>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520090624.1071139-1-lgs201920130244@gmail.com>
 <20260520093421.GA215344@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20260520093421.GA215344@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62233-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[ideasonboard.com,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9DC7A58B5D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/05/2026 11:34, Laurent Pinchart wrote:
> On Wed, May 20, 2026 at 05:06:24PM +0800, Guangshuo Li wrote:
>> video_register_device() / __video_register_device() registers vdev->dev
>> with device_register(). Before the call the video core sets
>>
>> 	vdev->dev.release = v4l2_device_release;
>>
>> v4l2_device_release() invokes vdev->release(vdev) as its last step, and
>> the driver's vdev->release hook is commonly video_device_release(), which
>> kfree()s the vdev that the driver allocated with video_device_alloc().
>>
>> When device_register() fails inside __video_register_device() the core
>> does
>>
>> 	put_device(&vdev->dev);
>> 	return ret;
>>
>> which drops the only reference and fires the v4l2_device_release()
>> chain:
>>
>>   __video_register_device()
>>     device_register() -> -E*
>>     put_device(&vdev->dev)
>>       -> v4l2_device_release()
>>          -> vdev->release(vdev)
>>             -> video_device_release(vdev)   /* kfree(vdev), free #1 */
>>
>> video_register_device() returns the error to the driver. Drivers that
>> follow the documented ownership contract release vdev on their own error
>> path, e.g.
>>
>>   driver_probe()
>>     if (video_register_device(vdev, ...))
>>       goto err_release_vdev;
>>     ...
>>   err_release_vdev:
>>     video_device_release(vdev);   /* free #2 -- DOUBLE FREE */
>>
>> This is the contract documented in
>> Documentation/driver-api/media/v4l2-dev.rst: the driver owns vdev and
>> is responsible for releasing it if video_register_device() fails. As
>> Hans Verkuil pointed out, the right place to fix this is the v4l2 core
>> rather than every individual driver, because drivers are expected to
>> follow the documented ownership contract.
>>
>> Neutralise vdev->release around put_device() in the device_register()
>> failure path so the device core cleanup does not run the driver's
>> release hook. The driver-supplied release is restored before returning
>> so the caller can release vdev according to the documented contract.
>> Successful registration is unchanged, so the normal teardown sequence
>> continues to call the driver's release hook and free vdev exactly once on
>> unregister.
>>
>> Fixes: 2a934fdb01db ("media: v4l2-dev: fix error handling in __video_register_device()")
>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index 6ce623a1245a..73648549eb2a 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -1075,9 +1075,14 @@ int __video_register_device(struct video_device *vdev,
>>  	mutex_lock(&videodev_lock);
>>  	ret = device_register(&vdev->dev);
>>  	if (ret < 0) {
>> +		void (*release)(struct video_device *) = vdev->release;
>> +
>>  		mutex_unlock(&videodev_lock);
>>  		pr_err("%s: device_register failed\n", __func__);
>> +
>> +		vdev->release = video_device_release_empty;
>>  		put_device(&vdev->dev);
>> +		vdev->release = release;
> 
> That looks like a big hack. There must be something wrong somewhere else
> in the design.

There is, unfortunately the design was wrong since the beginning of V4L2.

Documentation/driver-api/media/v4l2-dev.rst explicitly says that you should use:

        err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
        if (err) {
                video_device_release(vdev); /* or kfree(my_vdev); */
                return err;
        }

So everyone does that. Luckily device_register never fails in practice (you probably have
bigger problems if it fails then just a double-free).

The reality is that we don't handle this failure well at all, and this change wouldn't
help in all cases either. E.g. drivers/media/platform/renesas/renesas-ceu.c actually relies
on the release() callback in that it doesn't call video_device_release().

But then it would fail on the v4l2_err(vdev->v4l2_dev, ...) call since vdev would be freed
already.

There are probably more drivers like that. (drivers/media/i2c/video-i2c.c)

I'm not sure what is wisdom here.

See also commit 2a934fdb01db ("media: v4l2-dev: fix error handling in __video_register_device()"),
which is where the put_device was introduced in the first place.

Perhaps that should be reverted instead?

Regards,

	Hans

> 
>>  		return ret;
>>  	}
>>  
> 



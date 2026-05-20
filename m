Return-Path: <linux-media+bounces-62245-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ0iGZ2dDWoS0AUAu9opvQ
	(envelope-from <linux-media+bounces-62245-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:40:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC73B58CC02
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A50432C9D1F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAA13EAC75;
	Wed, 20 May 2026 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpDuvdfk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35993EA970;
	Wed, 20 May 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276395; cv=none; b=lcUA0/wZmI6qjESOlV4nXMdPDol8erblpUMzy7pYyucKZHVbyAiPQjT1DOM7HsLc/8w783YXJnrNI9GgX+a72Fu3gGtFhi0tjwQYI2L1KcEQImgZaq0t4hec7hXkgb/W69Fpd/YZ3IPiwfQ1x/+nPV+ejvV0Od7okOnXrZnT9KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276395; c=relaxed/simple;
	bh=6y9yA1agUD7vRXJeb0O88o1Ru0iQm+TT3XoJ4BLrznk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BdzxnMbAw4hwg/f70VB0EWEgBD9UsgNgfPxgD0vhhdFXSkhW/hEZ+OyhNf0tQDOoTbQu5m162Y+B3vrBtuo9Td04/QASMVNBEHLNBZyE7/1p4Wl2yVTrw4PXh2y2X9wr8JAtD5FXYzvEchx3VWaC4VOGkz67O9pnvJJjZV66CX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpDuvdfk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1501F000E9;
	Wed, 20 May 2026 11:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779276393;
	bh=OMmg7r0mW73SIeqiiniogIVTM44PkUCdBOPHp2NvAYM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=DpDuvdfk6gw8BfCHD0b2+GqAT3HqvuGzHymvGQOv9RrbNqmXPDVjqsFSTT9CbaBvc
	 Dw+XuDeUlt9Z6TFpq+z10VBycXsAOtX+hG4F2l0ZEREytJmBRmaGlYLvwB9urxb2Tu
	 W7jX/SYnvZIqaAaZhABMuA43rCO6HbHOlfKKOReuX/XRkCcKCPn3WJiy5eoCltZ3eh
	 HwbbBkvCawnIJCCDZYX0mxHKezBBkiOIw0MSNsVQ60DdgLASwLqMSIhW8OsD2zB8X8
	 mhmlLqDp/V1lF7wrtcJVrNEYE1FXtfSy+lPcdZyz0kg8kiGx12yfJnMDKNxX9FeRLK
	 IiZnTEYuKW1Ng==
Message-ID: <00110771-c722-4208-a0e8-48819952e992@kernel.org>
Date: Wed, 20 May 2026 13:26:30 +0200
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
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Ma Ke <make24@iscas.ac.cn>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520090624.1071139-1-lgs201920130244@gmail.com>
 <20260520093421.GA215344@killaraus.ideasonboard.com>
 <14ab929b-f236-48cf-a022-f424fa1e0c1e@kernel.org>
 <20260520104816.GB215344@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20260520104816.GB215344@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,iscas.ac.cn,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62245-lists,linux-media=lfdr.de,cisco];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BC73B58CC02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/05/2026 12:48, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Wed, May 20, 2026 at 12:01:46PM +0200, Hans Verkuil wrote:
>> On 20/05/2026 11:34, Laurent Pinchart wrote:
>>> On Wed, May 20, 2026 at 05:06:24PM +0800, Guangshuo Li wrote:
>>>> video_register_device() / __video_register_device() registers vdev->dev
>>>> with device_register(). Before the call the video core sets
>>>>
>>>> 	vdev->dev.release = v4l2_device_release;
>>>>
>>>> v4l2_device_release() invokes vdev->release(vdev) as its last step, and
>>>> the driver's vdev->release hook is commonly video_device_release(), which
>>>> kfree()s the vdev that the driver allocated with video_device_alloc().
>>>>
>>>> When device_register() fails inside __video_register_device() the core
>>>> does
>>>>
>>>> 	put_device(&vdev->dev);
>>>> 	return ret;
>>>>
>>>> which drops the only reference and fires the v4l2_device_release()
>>>> chain:
>>>>
>>>>   __video_register_device()
>>>>     device_register() -> -E*
>>>>     put_device(&vdev->dev)
>>>>       -> v4l2_device_release()
>>>>          -> vdev->release(vdev)
>>>>             -> video_device_release(vdev)   /* kfree(vdev), free #1 */
>>>>
>>>> video_register_device() returns the error to the driver. Drivers that
>>>> follow the documented ownership contract release vdev on their own error
>>>> path, e.g.
>>>>
>>>>   driver_probe()
>>>>     if (video_register_device(vdev, ...))
>>>>       goto err_release_vdev;
>>>>     ...
>>>>   err_release_vdev:
>>>>     video_device_release(vdev);   /* free #2 -- DOUBLE FREE */
>>>>
>>>> This is the contract documented in
>>>> Documentation/driver-api/media/v4l2-dev.rst: the driver owns vdev and
>>>> is responsible for releasing it if video_register_device() fails. As
>>>> Hans Verkuil pointed out, the right place to fix this is the v4l2 core
>>>> rather than every individual driver, because drivers are expected to
>>>> follow the documented ownership contract.
>>>>
>>>> Neutralise vdev->release around put_device() in the device_register()
>>>> failure path so the device core cleanup does not run the driver's
>>>> release hook. The driver-supplied release is restored before returning
>>>> so the caller can release vdev according to the documented contract.
>>>> Successful registration is unchanged, so the normal teardown sequence
>>>> continues to call the driver's release hook and free vdev exactly once on
>>>> unregister.
>>>>
>>>> Fixes: 2a934fdb01db ("media: v4l2-dev: fix error handling in __video_register_device()")
>>>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>>>> index 6ce623a1245a..73648549eb2a 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>>>> @@ -1075,9 +1075,14 @@ int __video_register_device(struct video_device *vdev,
>>>>  	mutex_lock(&videodev_lock);
>>>>  	ret = device_register(&vdev->dev);
>>>>  	if (ret < 0) {
>>>> +		void (*release)(struct video_device *) = vdev->release;
>>>> +
>>>>  		mutex_unlock(&videodev_lock);
>>>>  		pr_err("%s: device_register failed\n", __func__);
>>>> +
>>>> +		vdev->release = video_device_release_empty;
>>>>  		put_device(&vdev->dev);
>>>> +		vdev->release = release;
>>>
>>> That looks like a big hack. There must be something wrong somewhere else
>>> in the design.
>>
>> There is, unfortunately the design was wrong since the beginning of V4L2.
>>
>> Documentation/driver-api/media/v4l2-dev.rst explicitly says that you should use:
>>
>>         err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>>         if (err) {
>>                 video_device_release(vdev); /* or kfree(my_vdev); */
>>                 return err;
>>         }
>>
>> So everyone does that. Luckily device_register never fails in practice (you probably have
>> bigger problems if it fails then just a double-free).
>>
>> The reality is that we don't handle this failure well at all, and this change wouldn't
>> help in all cases either. E.g. drivers/media/platform/renesas/renesas-ceu.c actually relies
>> on the release() callback in that it doesn't call video_device_release().
>>
>> But then it would fail on the v4l2_err(vdev->v4l2_dev, ...) call since vdev would be freed
>> already.
>>
>> There are probably more drivers like that. (drivers/media/i2c/video-i2c.c)
>>
>> I'm not sure what is wisdom here.
>>
>> See also commit 2a934fdb01db ("media: v4l2-dev: fix error handling in __video_register_device()"),
>> which is where the put_device was introduced in the first place.
>>
>> Perhaps that should be reverted instead?
> 
> If we want a short term fix I think that would be better.
> 
> Have you seen
> https://lore.kernel.org/all/aeCOdWLaVpH-5w8s@hovoldconsulting.com/ ?

I hadn't seen it. Interesting.

> 
> Having an API contract different from device_register() will likely
> cause issues one way or another.

Looking closely how the driver core works and what commit 2a934fdb01db changed,
I think this might fix it:

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5516b2bbb08f..6ffd385e880f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1071,25 +1071,27 @@ int __video_register_device(struct video_device *vdev,
 	vdev->dev.class = &video_class;
 	vdev->dev.devt = MKDEV(VIDEO_MAJOR, vdev->minor);
 	vdev->dev.parent = vdev->dev_parent;
-	vdev->dev.release = v4l2_device_release;
 	dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);

-	/* Increase v4l2_device refcount */
-	v4l2_device_get(vdev->v4l2_dev);
-
 	mutex_lock(&videodev_lock);
 	ret = device_register(&vdev->dev);
 	if (ret < 0) {
 		mutex_unlock(&videodev_lock);
 		pr_err("%s: device_register failed\n", __func__);
 		put_device(&vdev->dev);
-		return ret;
+		goto cleanup;
 	}
+	/* Register the release callback that will be called when the last
+	   reference to the device goes away. */
+	vdev->dev.release = v4l2_device_release;

 	if (nr != -1 && nr != vdev->num && warn_if_nr_in_use)
 		pr_warn("%s: requested %s%d, got %s\n", __func__,
 			name_base, nr, video_device_node_name(vdev));

+	/* Increase v4l2_device refcount */
+	v4l2_device_get(vdev->v4l2_dev);
+
 	/* Part 5: Register the entity. */
 	ret = video_register_media_controller(vdev);

This mostly reverts 2a934fdb01db, except that we keep the put_device.
But when this is called, vdev->dev.release isn't set yet, so it only
frees the device-related data (device_release in drivers/base/core.c).

Am I missing something?

Regards,

	Hans

> 
>>>>  		return ret;
>>>>  	}
>>>>  
> 



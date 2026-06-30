Return-Path: <linux-media+bounces-66060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FuUBHoWQQ2qJcAoAu9opvQ
	(envelope-from <linux-media+bounces-66060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:46:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F05D6E2677
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:46:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ol5j1g7E;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66060-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66060-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A20923110AF0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810783AB5DA;
	Tue, 30 Jun 2026 09:38:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0F396588
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 09:38:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812302; cv=none; b=ss0rzVUi3qb1cp8q+knXGTNvf8fXhwu2vXyDxo4KuLr1aUtwQ8zyl/PMQRdiXe3RzLgbkt0eKz1hoUSoX5AGfIPahJG5Cws7mHKLZJqTFKHRJA14fXa07tM25R91FnfoBK+FiPtxT5rkXVvbfzokAqi8eNQ7tewel46FZtb7xMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812302; c=relaxed/simple;
	bh=BZ+CmHNAvZxpUlhOggkH18h+UlSwgi7KOcmLlgn2JUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwgQEaHDx091nav9+OOb4QtkolgtNOZRoIJl5Y3ERcP1oPhq0E2FnmwDYzSf8daVC7eQKPHPZ1HX236loHEPbRQ4XzqfBr20fo/35qxDP/ObcEaIPKhBPj1HMxplxle4gR8rVEkJgAqsGuwpsJQCUwv/T7y9zZnkJJPI87xgGeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol5j1g7E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89581F000E9;
	Tue, 30 Jun 2026 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782812300;
	bh=L/7JrjTZq46uBc4qYwssiuG3pchQnOhrmG2mFJqROJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ol5j1g7EqPOTsSKTmiqMOVDfS/jRs3F3Ui4xpXRS5NINr+igi1znsQQIZ9TO3gX4f
	 66xARd4G0TQjuo1HWWNMmkGtoTMSISmsFenIJU4qx2qd1ybhvrEBObIGWqYYwPjbHI
	 qpRwVMxnAas+eU0t/mjJAd5Wxk+DRapzJM6BjVVoJpfSmv67vxUvYiPe1vJ4WHuWqj
	 sq9jeXA8ywPdehbcVAn5RxMR01VKmaRXDpEBIPoMy60cU280vPqcUfbqGo1FQTF3CO
	 LHqt2b7ChtmsO/O4QgX4uqY139dC8GlY95LAeSqyxtyzidcYr8Y6TFfyuNNIVXMLhe
	 Rc5/alvxlAKsg==
Message-ID: <0e26135c-129d-464b-bd83-daeaf3150e25@kernel.org>
Date: Tue, 30 Jun 2026 11:38:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 1/6] media: core: v4l2-async.c: unreg subdev if asc_list
 is empty
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
 <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
 <akN3DglbD4LPxES1@kekkonen.localdomain>
 <3fc7cf62-c7eb-45c0-a961-af2e47f0b589@kernel.org>
 <akOCNKRVeRlebCI1@kekkonen.localdomain>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <akOCNKRVeRlebCI1@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail,vger.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66060-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:mfo@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F05D6E2677

On 6/30/26 10:45, Sakari Ailus wrote:
> Hi Hans,
> 
> On the subject -- I'd write this as, to align with the existing practice:
> 
> media: v4l2-async: Unregister sub-device if asc_list is empty
> 
> On Tue, Jun 30, 2026 at 10:32:20AM +0200, Hans Verkuil wrote:
>> On 6/30/26 09:58, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> Thanks for the patch.
>>>
>>> On Mon, Jun 29, 2026 at 08:55:49AM +0200, Hans Verkuil wrote:
>>>> In v4l2_device_unregister_subdev(), if sd->asc_list is empty,
> 
> s/device/async/
> 
> ?

Yes. Oops, that's a confusing typo!

> 
>>>> then v4l2_device_unregister_subdev() is never called, but that
>>>> should still happen.
>>>>
>>>> This causes crashes with em28xx that uses tvp5150: that i2c
>>>> module uses v4l2_async, but em28xx does not as it predates
>>>> v4l2_async.
>>>
>>> Isn't the sub-device unregistered via v4l2_device_unregister() or do I miss
>>> something? em28xx_v4l2_fini() calls it.
>>>
>>> Or do you mean the issue happens at tvp5150 unbind time?
>>
>> Yes, that's when it happens. The tvp5150 driver is removed, it calls
>> v4l2_async_unregister_subdev(), but that never calls
>> v4l2_device_unregister_subdev() since em28xx doesn't use v4l2-async
>> and so sd->asc_list is empty.
>>
>> This happens when unplugging the USB device.
> 
> Ack.
> 
> Could you add this to the commit message? It'd help understanding what
> really goes on here. I'd also add a comment, see below.

OK.

> 
>>
>>>
>>>>
>>>> So if sd->asc_list is empty, then just call
>>>> v4l2_device_unregister_subdev().
>>>>
>>>> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
>>
>> It was introduced by commit 28a1295795d8, before that commit this was done correctly.
>>
>> Regards,
>>
>> 	Hans
>>
>>>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-async.c | 10 +++++++---
>>>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>>>> index 888a2e213b08..d7437c958028 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-async.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>>>> @@ -898,9 +898,13 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>>>>  	sd->subdev_notifier = NULL;
>>>>  
>>>>  	if (sd->asc_list.next) {
>>>> -		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
>>>> -					 asc_subdev_entry) {
>>>> -			v4l2_async_unbind_subdev_one(asc->notifier, asc);
>>>> +		if (list_empty(&sd->asc_list)) {
> 
> How about:
> 
> 			/*
> 			 * If the sub-device was registered through other means
> 			 * than v4l2-async, there are no async connections but
> 			 * the sub-device may still well be registered.
> 			 * Unregister it now.
> 			 */
> 
>>>> +			v4l2_device_unregister_subdev(sd);
>>>> +		} else {
>>>> +			list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
>>>> +						 asc_subdev_entry) {
>>>> +				v4l2_async_unbind_subdev_one(asc->notifier, asc);
>>>> +			}
> 
> These braces are redundant.
> 
>>>>  		}
>>>>  	}
>>>>  
>>>
>>
> 

I'll prep a v4.

Regards,

Hans


Return-Path: <linux-media+bounces-65840-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h+eUASEXQmog0AkAu9opvQ
	(envelope-from <linux-media+bounces-65840-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 08:56:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B286D69EF
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 08:56:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65840-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65840-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B8DC3023343
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 06:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEF23AEF50;
	Mon, 29 Jun 2026 06:55:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4A3AA1B5
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:55:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716110; cv=none; b=mNhielg79vLR6wIzJPfuKfyh5HHR6iMKHJfZS1tbOq/ZNlZDouFKmrwo7IsN1Qtq93nJh4cP8DH0CzNlpOeEO1i1LQW29HIFEMgIyYJehpMTWc5H9F9+P2w1TfoYPEJ46JONp9awHQuSbVc7ujYWFwsfcGxMR1Rfu32rBYkaG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716110; c=relaxed/simple;
	bh=idVxSAugDnoWKjpJV5h6mReuywkqDVwczrOpq7HxJLU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gdwimBSWsqIKF71ulltzfgydA3jRfPxLHnQ6w78cd9pspRLeve7pXc/oKKZU7U4aEygGPBX7aXAmORw1Kn5MYqwso/lhwWJiS7iW7s9GWJ9uyrAJbWwlZAEIVXhgyliwLkF8V0ZonQ0Skzwxj2OQkDWAXMyFy9VA/AwHRGTYOaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4A81F000E9;
	Mon, 29 Jun 2026 06:55:05 +0000 (UTC)
Message-ID: <390a4281-8f18-4090-bc04-c9dcedbff809@kernel.org>
Date: Mon, 29 Jun 2026 08:55:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCHv2 1/6] media: core: v4l2-async.c: unreg subdev if asc_list
 is empty
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
References: <cover.1781615432.git.hverkuil+cisco@kernel.org>
 <efb6cfeb1053399ebd51b83fcc4daee632281558.1781615432.git.hverkuil+cisco@kernel.org>
 <ajFogY-MkxTmiSN6@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <ajFogY-MkxTmiSN6@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65840-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:mfo@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,async_list.next:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46B286D69EF

On 16/06/2026 17:15, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Jun 16, 2026 at 03:10:27PM +0200, Hans Verkuil wrote:
>> In v4l2_device_unregister_subdev(), if sd->asc_list is empty,
>> then v4l2_device_unregister_subdev() is never called, but that
>> should still happen.
>>
>> This causes crashes with em28xx that uses tvp5150: that i2c
>> module uses v4l2_async, but em28xx does not as it predates
>> v4l2_async.
>>
>> So if sd->asc_list is empty, then just call
>> v4l2_device_unregister_subdev().
>>
>> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> ---
>>  drivers/media/v4l2-core/v4l2-async.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>> index 888a2e213b08..fd0404ce9247 100644
>> --- a/drivers/media/v4l2-core/v4l2-async.c
>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>> @@ -897,7 +897,9 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>>  	kfree(sd->subdev_notifier);
>>  	sd->subdev_notifier = NULL;
>>  
>> -	if (sd->asc_list.next) {
>> +	if (list_empty(&sd->asc_list)) {
> 
> If v4l2_async_unregister_subdev() without calling
> v4l2_async_register_subdev() first, sd->asc_list.next will be NULL. That
> case needs to be handled here, too.

Ah, good point. I'll do that.

BTW, I think setting the next field of a list header to NULL is really
fragile. I would prefer to see a bool to indicate that the asc_list should
not be used (and asc_list should be an empty list in that case).

async_list.next does the same.

Also, asc_list is a poor name, way too similar to async_list. I think
async_conn_list would be much better.

Anyway, that's unrelated to this patch.

Regards,

	Hans

> 
>> +		v4l2_device_unregister_subdev(sd);
>> +	} else {
>>  		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
>>  					 asc_subdev_entry) {
>>  			v4l2_async_unbind_subdev_one(asc->notifier, asc);
> 



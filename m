Return-Path: <linux-media+bounces-56003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMpXHlETuWkmpQEAu9opvQ
	(envelope-from <linux-media+bounces-56003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:39:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D988C2A5C9C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C78303C4C9
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 08:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FB3396B6D;
	Tue, 17 Mar 2026 08:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bFSNCKzZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0210239A7F4;
	Tue, 17 Mar 2026 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736647; cv=none; b=q+VSNxXTUx0ucjyWw6812SF4dtRDGhZsW52bBroyVDh/eEG58TwjL2OMWuLuQpiZrJacfvj6Uim5CAr5LiY1dsCXILIPSD+gpF21pLHxb/mkn2q2+ZYgz8QnDN6N/towhp/NluILUPlCqql0ay0MfskrYKBreBnI0vYk23DdRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736647; c=relaxed/simple;
	bh=TZ8+9C3dSrWLatRaPzuV1lCuEKPTQjAukDwiIzzspns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRkTLr8wSvYegR1EagELZJjOvV0WE0IY9GM1OeAYMELnSEA9UVhVpdMN4h5IYYYpTBYFLRGkmAucZZM/CVg1Occ8d/v63ZgRFzk+1Bo3yWGlKbVHYmFuoqffdULhuwtGS2DuTHRdLffw+JfCehSShXhJlaCn7pvDYb1tF0YkZp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bFSNCKzZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3426E308;
	Tue, 17 Mar 2026 09:36:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773736564;
	bh=TZ8+9C3dSrWLatRaPzuV1lCuEKPTQjAukDwiIzzspns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFSNCKzZ0Nf6Aisln/KE9yjzAGzOil4Mi8+GvaPGsD76lOGKg2cdVyKuB5KqHkMiU
	 4tluNuHDTBwKxTPrdzS8U0/Tni1g21O7f6UAu9GMmCvcRZq3Hg0aW9stO4x3EDpInc
	 vIB2O8Wp8UB6Htr3IhB1y4YAX6+uz+4WaFLNLgzE=
Message-ID: <78e4add8-c156-44d9-aa86-49bf87ce2398@ideasonboard.com>
Date: Tue, 17 Mar 2026 10:37:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: subdev: Split
 v4l2_subdev_get_frame_desc_passthrough() into locked and unlocked
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jai Luthra <jai.luthra@ideasonboard.com>
References: <20260312-frame-desc-passthrough-impro-v1-0-30f64d637a3a@ideasonboard.com>
 <20260312-frame-desc-passthrough-impro-v1-3-30f64d637a3a@ideasonboard.com>
 <abkKnm10SapsRPhe@kekkonen.localdomain>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <abkKnm10SapsRPhe@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56003-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D988C2A5C9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 17/03/2026 10:02, Sakari Ailus wrote:
> Moi,
> 
> On Thu, Mar 12, 2026 at 02:15:30PM +0200, Tomi Valkeinen wrote:
>> The recently added v4l2_subdev_get_frame_desc_passthrough() can be used
>> directly as an implementation for .get_frame_desc subdev op. However, in
>> some cases the drivers may want to add some customizations, while the
>> bulk of the work is still identical to what
>> v4l2_subdev_get_frame_desc_passthrough() does. Current locking scheme
>> makes this impossible to do properly.
>>
>> Split v4l2_subdev_get_frame_desc_passthrough() into two functions:
>>
>> v4l2_subdev_get_frame_desc_passthrough_locked(), which takes a locked
>> subdev state as a parameter, instead of locking and getting the active
>> state internally. Other than that, it does the same as
>> v4l2_subdev_get_frame_desc_passthrough() used to do.
>>
>> v4l2_subdev_get_frame_desc_passthrough(), which locks the active state
>> and calls v4l2_subdev_get_frame_desc_passthrough_locked().
>>
>> In other words, v4l2_subdev_get_frame_desc_passthrough() works as
>> before, but drivers can now alternatively add custom .get_frame_desc
>> code and call v4l2_subdev_get_frame_desc_passthrough().
>>
>> An example use case is with DS90UB953 serializer: in normal use the
>> serializer passes through everything, but when test-pattern-generator
>> (TPG) is used, an internal TPG source is used. After this commit, the
>> UB953 get_frame_desc() can lock the state, look at the routing table to
>> see if we're in normal or TPG mode, then either call
>> v4l2_subdev_get_frame_desc_passthrough_locked() if in normal mode, or
>> construct a TPG frame desc if in TPG mode.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-subdev.c | 46 ++++++++++++++++++++---------------
>>  include/media/v4l2-subdev.h           | 38 +++++++++++++++++++++++++----
>>  2 files changed, 59 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 2757378c628a..8b1a7f00c86b 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -2545,21 +2545,19 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
>>  
>> -int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>> -					   unsigned int pad,
>> -					   struct v4l2_mbus_frame_desc *fd)
>> +int v4l2_subdev_get_frame_desc_passthrough_locked(struct v4l2_subdev *sd,
>> +						  struct v4l2_subdev_state *state,
>> +						  unsigned int pad,
>> +						  struct v4l2_mbus_frame_desc *fd)
>>  {
>>  	struct media_pad *local_sink_pad;
>>  	struct v4l2_subdev_route *route;
>> -	struct v4l2_subdev_state *state;
>>  	struct device *dev = sd->dev;
>>  	int ret = 0;
>>  
>>  	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
>>  		return -EINVAL;
>>  
>> -	state = v4l2_subdev_lock_and_get_active_state(sd);
> 
> This variant appears to be unlocked rather than locked.

The variant expects locked parameters, thus "locked". This is widely
used at least on DRM drivers.

> Could you instead use two underscores as a prefix to the same name? That's
> an established practice.
I can do that, although I don't personally like it. Double underscore
hints at an internal function, something that shouldn't be called
normally, whereas this is not internal or anything to avoid.

 Tomi



Return-Path: <linux-media+bounces-34016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEA6ACC7C0
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 15:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B0EE1895192
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 13:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCD1231858;
	Tue,  3 Jun 2025 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfE5uFXm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBFA230D35
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957240; cv=none; b=X5gffPEg6Ve+t7cvR6mAdWKF7iKLr8uhkL6gnEPPmM6mMh2Ok7OyUgnCSrMh4EowkBB+dwo2fNgY2tKCXa1YuzJCV/unFjFle3J2q8wXiiLcj78BmTCr7NzpCqYd+X9/jEWTd1v+4N/aP0Tx/IqCMNrp64U+M/jr59wgNf0QD+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957240; c=relaxed/simple;
	bh=Xos6q4EQnJmnvdD0nDLtljLQ3UWhBbPLJJp5abPpAP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dY+p1f3N3WHMtOw3sXHdk/E2N+Hjoa4mYEupU5xPZLq+aevbYlzJ53FouRbjZFiUZcX7jrDPh67vJ+3ty6Wy5hMIzX0wfQR1/0/DJuhcimhRaMAnadwucdG20jdfQHfntIWQh9Yc/tZ6kmmoZinHycT6WqmjnSBbf492aq6r9M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfE5uFXm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6B4C4CEED;
	Tue,  3 Jun 2025 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748957240;
	bh=Xos6q4EQnJmnvdD0nDLtljLQ3UWhBbPLJJp5abPpAP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lfE5uFXmaF7uvTkbXpLZsQ9xQ+obqHCtZxLZUc2a1tWVqEfvxULhXTytktnFwQbm8
	 tuLQXMgi52et7Z6hFJAdjD+p5AURanssZCYSN0gbVkmwY63TWQyi1DDKza3Mosb65+
	 /MHlTgpMphuF8L+R00VvavUjPjOyofV41ht29s4vsYrrwmVXbVZ1gyNymvCqNK3F7s
	 19qzdOLdKBwddbFaaMJGwEwa6vIy3Yx9ARaeRWh9za4EQn++Hl+uCjsZ/UEECL8abK
	 WqZcJiaIqJyM39ee12233yOHRrWH+uI6QAG5wmb+AWN1OCjzLX6+/5noWh2jSqmKSs
	 3wlS0mjqsggpw==
Message-ID: <bd0f6da2-d358-47c9-b2d8-4f5352b7e28f@kernel.org>
Date: Tue, 3 Jun 2025 15:27:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] media: mt9m114: Return -EPROBE_DEFER if no
 endpoint is found
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mathis Foerst <mathis.foerst@mt.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-12-hansg@kernel.org>
 <20250603110359.GC27361@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250603110359.GC27361@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

Thank you for your reviews. I agree with most of your
comments and I'll address them when I can make some time.

On 3-Jun-25 1:03 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Sat, May 31, 2025 at 06:31:46PM +0200, Hans de Goede wrote:
>> With IPU# bridges, endpoints may only be created when the IPU bridge is
>> initialized. This may happen after the sensor driver's first probe().
>>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> ---
>>  drivers/media/i2c/mt9m114.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
>> index c4d3122d698e..72914c47ec9a 100644
>> --- a/drivers/media/i2c/mt9m114.c
>> +++ b/drivers/media/i2c/mt9m114.c
>> @@ -2399,11 +2399,14 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
>>  	struct fwnode_handle *ep;
>>  	int ret;
>>  
>> +	/*
>> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
>> +	 * wait for this.
>> +	 */
>>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>> -	if (!ep) {
>> -		dev_err(&sensor->client->dev, "No endpoint found\n");
>> -		return -EINVAL;
>> -	}
>> +	if (!ep)
>> +		return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
>> +				     "waiting for fwnode graph endpoint\n");
> 
> That's a bit annoying, as in non-ACPI systems we'll then get probe
> deferral, making the issue more difficult to debug.

With "then" I assume you mean when the fwnode graph endpoint is missing
on DT systems ?

> Is there a way, on IPU-based systems, to delay probing the sensor until
> the bridge has been initialized ?

Waiting for the fwnode graph endpoint to show up is the way to wait for
bridge init we (Sakari and me) have agreed upon, this is done on all
drivers used on x86/ACPI platforms.

Note that by using dev_err_probe() here and not just
"return -EPROBE_DEFER" the kernel will log a message
during boot some time (1 minute?) after the last probe
has succeeded about devices with a deferred probe pending
logging the reason passed to dev_err_probe(), so debugging
this is should not be that much of an issue. There will still
be a log message, it is just that it will be logged a bit later
rather then directly at probe time.

Regards,

Hans







 I suppose this is a question for
> Sakari too.
> 
>>  
>>  	sensor->bus_cfg.bus_type = V4L2_MBUS_UNKNOWN;
>>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);
> 



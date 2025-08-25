Return-Path: <linux-media+bounces-41038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3D3B345CD
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 17:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CB9D206D99
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 15:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757982D9ED0;
	Mon, 25 Aug 2025 15:31:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179EF2FD1A0;
	Mon, 25 Aug 2025 15:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756135885; cv=none; b=Zh3uJtK0M/VM85Ru2k7qBruEcFPVX5upCgCjN4Em/BK9mZe6JYL9E7r19t594xlrJjk3MgOJPy0j7D1p6bsYYZNnHLf1lGUMSVguw2CnTLW0u3zH9JRupPqGd1jqFXdHO1Sxkx4TtcImdQUQPmYZdJnqZO9eTO+yrxOJTYcbYc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756135885; c=relaxed/simple;
	bh=Rqe8q9DNH0cHvCSESVe1u2EUURZO9LAm7hqOO4R9E5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKH08z+oX6vCv5Hgu5xUwqcjZAiaWZi4CGCi0ybqml9D2HWROsj6lBuqtKmR7iCal05GfHggkLe2YzlFttXV+jFKhnDvBJ46TiByBWTn1js/vxuMlns4HBtcD8sYaj5njyknzpchOOLFu/JI5kWsZguooGp/MPUo+aKFH6adE8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.18] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 20FAC5469E;
	Mon, 25 Aug 2025 17:22:35 +0200 (CEST)
Message-ID: <a486ae80-b53f-4f8c-b7d9-38d51f793981@gpxsee.org>
Date: Mon, 25 Aug 2025 17:22:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: pci: mgb4: Fix timings comparison in
 VIDIOC_S_DV_TIMINGS
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20250804092032.1639-1-tumic@gpxsee.org>
 <7ce56415-77d9-4952-bf7a-a8610d393ded@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <7ce56415-77d9-4952-bf7a-a8610d393ded@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/25/25 5:03 PM, Hans Verkuil wrote:
> On 04/08/2025 11:20, tumic@gpxsee.org wrote:
>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>
>> Compare the whole v4l2_bt_timings struct, not just the width/height when
>> setting new timings. Timings with the same resolution and different
>> pixelclock can now be properly set.
>>
>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>> ---
>>   drivers/media/pci/mgb4/mgb4_vin.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
>> index 989e93f67f75..15182549d108 100644
>> --- a/drivers/media/pci/mgb4/mgb4_vin.c
>> +++ b/drivers/media/pci/mgb4/mgb4_vin.c
>> @@ -610,8 +610,8 @@ static int vidioc_s_dv_timings(struct file *file, void *fh,
>>   	    timings->bt.height < video_timings_cap.bt.min_height ||
>>   	    timings->bt.height > video_timings_cap.bt.max_height)
>>   		return -EINVAL;
>> -	if (timings->bt.width == vindev->timings.bt.width &&
>> -	    timings->bt.height == vindev->timings.bt.height)
>> +	if (!memcmp(&timings->bt, &vindev->timings.bt,
>> +		    sizeof(struct v4l2_bt_timings)))
> 
> I would recommend calling v4l2_match_dv_timings() instead.
> Otherwise you would also match on the reserved fields and 'standards'
> and 'flags' fields.
> 

Yes, that's definitely better. I will post a v2 with this change 
tomorrow. Thanks for pointing this out.

M.

> Regards,
> 
> 	Hans
> 
>>   		return 0;
>>   	if (vb2_is_busy(&vindev->queue))
>>   		return -EBUSY;
>>
>> base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> 



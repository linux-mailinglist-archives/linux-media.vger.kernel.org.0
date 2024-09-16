Return-Path: <linux-media+bounces-18314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E8E97A43C
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 16:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B1AB28EA63
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 14:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C90158853;
	Mon, 16 Sep 2024 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yUSzbb7u"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC01DFCF
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 14:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726497255; cv=none; b=NGsnD71M29Nw8nY14hrA6A2R6W8CuylqKw1sIQjH54oPg6y1sEXlBrZAgyVzrdZXlz0gm8kJ2rPHntcRo1S7FWohPQAGzFeBZic8X+Ou/IqBL2frjDO+eTcviox24vbMJzTTEvXRwB0pO3HNGfwAzoLz8RcGXn9OaKb1TWSRL+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726497255; c=relaxed/simple;
	bh=QnpyoqBN8U/sI+m/XS5c2KVpSCUOR10VsmC+Qu7XSog=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DkKGfkKASebFs1H1aSVaYWrGfS9CEpbiRR/Wy3G/JU/g34kK+W+prNHeC6U/PSiZ6wziIM6hw34E+iT2V/YNaadWg5BTkx1FLsYCu9//+ZLK1QYbIO6HwGukkXSA7kh/dlnNjDjuL/5HTX6ND5BjxG2zm8jWexb/aRQuLRSwv7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yUSzbb7u; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48GEY9Y3060265;
	Mon, 16 Sep 2024 09:34:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726497249;
	bh=dJs0IRCXsaQBdDVRdpDtaXtIK42cplCoVxT4octzjCY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yUSzbb7uOURVWNYpVN0MwoBdcwWQMhVoA5af9rqlj/qG3xP93vIzs/ttB3MdlXL4s
	 aI7J+OSprN/gNNo2xEUIxj285TR0KSerC4OeQ1oGUKID1xiZgKnOzh6eapBYa0pkUV
	 EzrIVwzzyHusv/D5nblnF3dzlr/odPhfucZgU+KE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48GEY9oM026010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Sep 2024 09:34:09 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Sep 2024 09:34:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Sep 2024 09:34:09 -0500
Received: from [10.249.34.164] ([10.249.34.164])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48GEY9iQ008909;
	Mon, 16 Sep 2024 09:34:09 -0500
Message-ID: <b7f8c8f8-b120-4119-a29a-7144c73dc41a@ti.com>
Date: Mon, 16 Sep 2024 09:34:09 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH] yavta: Fix 32-bit compile
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>
References: <20240913194211.12423-1-reatmon@ti.com>
 <20240914003209.GB26457@pendragon.ideasonboard.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240914003209.GB26457@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180


Yes.  That patch is perfect and better worded than mine.  Glad this was 
resolved.  Thank you.



On 9/13/2024 7:32 PM, Laurent Pinchart wrote:
> Hi Ryan,
> 
> Thank you for the patch.
> 
> On Fri, Sep 13, 2024 at 02:42:11PM -0500, Ryan Eatmon wrote:
>> The format for printing various time elements are not working for 64bit
>> times on a 32bit compile.
>>
>> ../git/yavta.c:2195:51: error: format '%ld' expects argument of type 'long int', but argument 8 has type '__time64_t' {aka 'long long int'} [-Werror=format=]
>>   2195 |                 printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
>>        |                                                 ~~^
>>        |                                                   |
>>        |                                                   long int
>>        |                                                 %lld
>> ......
>>   2199 |                         buf.timestamp.tv_sec, buf.timestamp.tv_usec,
>>        |                         ~~~~~~~~~~~~~~~~~~~~
>>        |                                      |
>>        |                                      __time64_t {aka long long int}
>>
>> Change the formats to be lld/llu to accommodate the change for 32bit
>> compiles.
> 
> Ricardo Ribalda has submitted a similar patch previously, see
> https://lore.kernel.org/linux-media/20230920125939.1478-1-ricardo@ribalda.com/.
> It had fallen through the cracks (my bad), and I have now applied it.
> Could you check if it solves your problem ?
> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   yavta.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/yavta.c b/yavta.c
>> index 3bf82b3..0655311 100644
>> --- a/yavta.c
>> +++ b/yavta.c
>> @@ -2192,12 +2192,12 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
>>   
>>   		clock_gettime(CLOCK_MONOTONIC, &ts);
>>   		get_ts_flags(buf.flags, &ts_type, &ts_source);
>> -		printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
>> +		printf("%u (%u) [%c] %s %u %u B %lld.%06lld %lld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
>>   			(buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
>>   			v4l2_field_name(buf.field),
>>   			buf.sequence, video_buffer_bytes_used(dev, &buf),
>> -			buf.timestamp.tv_sec, buf.timestamp.tv_usec,
>> -			ts.tv_sec, ts.tv_nsec/1000, fps,
>> +			(long long int) buf.timestamp.tv_sec, (long long int) buf.timestamp.tv_usec,
>> +			(long long int) ts.tv_sec, ts.tv_nsec/1000, fps,
>>   			ts_type, ts_source);
>>   
>>   		last = buf.timestamp;
>> @@ -2254,8 +2254,8 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
>>   	bps = size/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
>>   	fps = i/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
>>   
>> -	printf("Captured %u frames in %lu.%06lu seconds (%f fps, %f B/s).\n",
>> -		i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
>> +	printf("Captured %u frames in %llu.%06lu seconds (%f fps, %f B/s).\n",
>> +		i, (long long unsigned int) ts.tv_sec, ts.tv_nsec/1000, fps, bps);
>>   
>>   done:
>>   	video_free_buffers(dev);
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


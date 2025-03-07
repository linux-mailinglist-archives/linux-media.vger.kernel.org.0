Return-Path: <linux-media+bounces-27827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACF6A56487
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 11:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CD291896CE0
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC9A20DD52;
	Fri,  7 Mar 2025 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="DHoy5Af/"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9398420B817;
	Fri,  7 Mar 2025 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741341682; cv=pass; b=CCincWxAYJmusKq+f54acsg09z5V16Haug7VnuYzc+IxW0rjgEmRj0YSl5/6qdkzPoArLpJe+S1eOUtYW603N1lqmZj6HffaKEWnqo3Gz83+8YonyPBgwumdp9Ys/kzOd9QqaixZvLy6uIdKaA0wr6DJtrFPRQSCRGvF/Qv9IPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741341682; c=relaxed/simple;
	bh=V4s/rswC7HPrkBCAtPLLzEKWE8tbXG4tCfjCFe0500o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRA2xSBipP51higWuBkFdZWPBHcYXORVyzDYNFkTvYNcqjI6GkB9DF+2R5C0XsYQz6Zv/2yZv/ygNkvlNKJudDUoYl3PODh7D3AADy9F41xxAp1qdtEmkVZGmJk7TCAezAY6GU8OsY/CPGwMfunzOZTkR38gvD+hFQMj0MtijvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=DHoy5Af/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741341655; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dlcC+es6VPHa/QEx9X2dCNTAY09Q7FS8BoJX7UZBfTZqfRdBs74KwUj/T++1wrx1veoL8vK63P7coG0WlW+3l7eKmCIF5Gs4lDlp/38BL7Xd+lKko+8Ea2ftOv1fKt8kZru9iDbAlfDxZMMClYyeh3INTDU9YhwTzuuudJ+gf2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741341655; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RJOi53fsGtFdOR6hzMLI0jBU/Sbetef1Mgy4rx019g4=; 
	b=iIhhMrf7uNCWVNIXdacxU9n8rppUS/rhEz/RyioOOtykZ+yKdP20BSQUMWdrIJib8EB0KFCFEFMz0GigJq1pcRmkYm8uqO+iwFJVnF+vY8fy52FWd55vzgRKJSEwfJtPgExaPzWfKFJJ89IuXECeL7TT4ozQT1kWv3t4moGE2J0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741341655;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RJOi53fsGtFdOR6hzMLI0jBU/Sbetef1Mgy4rx019g4=;
	b=DHoy5Af/+RSr9lehmGyRUvfPOHulFdbMnNSs47ZK5VgyVP9ZV/XneKmLg+03pwb9
	xjiXRlWi9JM/GH17bM45M1Kbv5mYlONTpKvFuxwLKVx+72JO2jGhOUSqKPZFzCyBnCi
	ehQzSte/I40hfuPYk4plKtb53T3gl2yrM34Z4tik=
Received: by mx.zohomail.com with SMTPS id 1741341652743592.2169906435839;
	Fri, 7 Mar 2025 02:00:52 -0800 (PST)
Message-ID: <47f84b59-0ddb-4386-bc8c-2752d240fdde@collabora.com>
Date: Fri, 7 Mar 2025 13:00:49 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] media: synopsys: hdmirx: Fix signedness bug in
 hdmirx_parse_dt()
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dingxian Wen <shawn.wen@rock-chips.com>, linux-media@vger.kernel.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <7ec94789-305c-4de4-b477-c0eb839170e5@stanley.mountain>
 <54d5eef8-66a9-44aa-9e9b-0324d6fee46d@collabora.com>
 <4a50949d-e472-4942-9152-3e5a54c6b076@stanley.mountain>
 <51d0781b-1da4-46c6-b772-718d7833798e@collabora.com>
 <a4f08c9c-b74a-486f-915d-6b0e06e22d7b@xs4all.nl>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <a4f08c9c-b74a-486f-915d-6b0e06e22d7b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/7/25 12:58, Hans Verkuil wrote:
> On 07/03/2025 10:47, Dmitry Osipenko wrote:
>> On 3/7/25 12:45, Dan Carpenter wrote:
>>> On Fri, Mar 07, 2025 at 12:36:47PM +0300, Dmitry Osipenko wrote:
>>>> On 3/7/25 12:30, Dan Carpenter wrote:
>>>>> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>>>> index 4ffc86ad6c35..e0d3fed87a92 100644
>>>>> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>>>> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>>>> @@ -154,7 +154,7 @@ struct snps_hdmirx_dev {
>>>>>  	bool hpd_trigger_level_high;
>>>>>  	bool tmds_clk_ratio;
>>>>>  	bool plugged;
>>>>> -	u32 num_clks;
>>>>> +	int num_clks;
>>>>>  	u32 edid_blocks_written;
>>>>>  	u32 cur_fmt_fourcc;
>>>>>  	u32 color_depth;
>>>>
>>>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>
>>>> Would be also good to return the original error code. There is no need
>>>> to check for the < 1 clock, it should be the < 0 check. Can be done in a
>>>> separate patch later. Thanks for the fix!
>>>
>>> I'm not very familiar with th edevm_clk_bulk_get_all() function and it's
>>> not documented.  But clk_bulk_get_all() does return zero, so I can see why
>>> people would be confused.
>>
>> We will take care of it, thanks again.
>>
> 
> I'm confused. Is Dan's patch correct or is more work needed? If more work is
> needed, then I prefer to have a single patch correcting the devm_clk_bulk_get_all()
> handling.

Dan's patch is good, please merge it.

Propagation of original error code that I said about will be additional
improvement.

-- 
Best regards,
Dmitry


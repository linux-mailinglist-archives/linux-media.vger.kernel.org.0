Return-Path: <linux-media+bounces-45783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEDDC13FF0
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A440F467345
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBC3303C9B;
	Tue, 28 Oct 2025 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1Rei3bh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AC92D7392;
	Tue, 28 Oct 2025 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645769; cv=none; b=ZysShBzup4uf8FqxFb6+O5SN50cp5GWEiNp9MfqsS/9B/0CAqAo5oJppSAQ/NfUqPq46gzYJsPscDUYX0fEZvnpkKq89qmFxRvtVf47154lmqhhAWqRj3SLB6l3wjjVl+ch6uibyAyn+YFtXbD4PMBxTr148sV3SbV0mr6KGfnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645769; c=relaxed/simple;
	bh=6p5T5Xv4NHzrmr0Ks+pmJ8PHuRvVGOBQbtaIBczX3FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTztUqYwPZrcY1IICrzg599ioH4pEpg/1Q1sK9XMuq5TosedBeH0GPn35Nr0hpE3UbDCTWn1fhZKmzUcT4vMXpF1WO+xZkAreH6F4CkLwijEVVfTRdR9i/+EomMNjTb/2MIb8X9E4eun1Z5XzkMShJUko0VdHFhY3tSB6l1l2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1Rei3bh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61247C4CEFF;
	Tue, 28 Oct 2025 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645767;
	bh=6p5T5Xv4NHzrmr0Ks+pmJ8PHuRvVGOBQbtaIBczX3FY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e1Rei3bhmZF0jH3ODKOEBs8N4FSrJYedNxkbQTcdVH8Qp5WoXKsjT3H5eovtehJJw
	 SO0ccdaEwJ1I1PqY2jgQ2c5n8QtUvmm+/s2VkjHlDC1S8lL4ptOmVGV7UFBCh7pPES
	 tDUu7Uqc39NsyK/G2cKwobF7I3oaOS1fsvq/Uld5P0rkrmluPiBsOWIn3H0Egn4P9X
	 Dra1MU7ONYOQMnrvFWt7D1KqXjW5FhCCx4yyKWLTRWcFQOfatkRJ1Z0Zpt4+7V8RfD
	 O+0LcY3Ue61DdnpwbtFlXH8jty/5fSLECn1MH7OKlFkZ/55XkYncja0MiiqvQMvNUL
	 Oy3+3LxOMC6Fw==
Message-ID: <6658f47a-a6f4-4b9e-9711-69a0afb31cf5@kernel.org>
Date: Tue, 28 Oct 2025 11:02:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-ctrls: set AV1 sequence flags for testing
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Pavan Bobba <opensource206@gmail.com>, mchehab@kernel.org,
 hverkuil@kernel.org, ribalda@chromium.org,
 laurent.pinchart@ideasonboard.com, hansg@kernel.org, yunkec@google.com,
 sakari.ailus@linux.intel.com, james.cowgill@blaize.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251028062623.12700-1-opensource206@gmail.com>
 <3a603410869cf876e7693880e0f6ca8ced27be7b.camel@ndufresne.ca>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <3a603410869cf876e7693880e0f6ca8ced27be7b.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/28/25 10:47, Nicolas Dufresne wrote:
> Hi,
> 
> Le mardi 28 octobre 2025 à 11:56 +0530, Pavan Bobba a écrit :
>> Initialize additional AV1 sequence parameters in std_init_compound()
>> to make the default AV1 sequence control compatible with compliance
>> and userspace testing tools.
>>
>> Specifically, set:
>>  - enable both SUBSAMPLING_X and SUBSAMPLING_Y flags
>>
>> These defaults help ensure that V4L2_CID_AV1_SEQUENCE behaves
>> consistently during validation and v4l2-compliance tests.
>>
>> Signed-off-by: Pavan Bobba <opensource206@gmail.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index fa03341588e4..8809912797d2 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -160,7 +160,13 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>  		break;
>>  	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
>>  		p_av1_sequence = p;
>> +		/*
>> +		 *setting below parameters to make AV1 sequence compatible
>> +		 *for the testing
>> +		 */
>>  		p_av1_sequence->bit_depth = 8;
>> +		p_av1_sequence->flags |= V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X |
>> +			V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y;
> 
> There is a bit of a lack of clarity upon why we do this. I would comment on
> that.
> 
> /**
>  * The initial profile is 0 which only allows YUV 420 subsampled data. Set the  
>  * subsampling flags accordingly.
>  */
> 
> With the correction:
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

I'll add that and fast-track this patch so the virtme CI regression tests work
again.

Thank you!

	Hans

> 
> cheers,
> Nicolas
> 
>>  		break;
>>  	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>>  		p_fwht_params = p;



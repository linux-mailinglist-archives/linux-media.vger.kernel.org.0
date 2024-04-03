Return-Path: <linux-media+bounces-8530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4689720F
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 16:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB9F228D8CF
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 14:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E854A149003;
	Wed,  3 Apr 2024 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nKkVnfxX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98E1148308
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712153578; cv=none; b=G0/hG0Qwr3oB020TY8odCuvPXZbKc7KXBvP4rDh9H7ZxBXuzLiHfDuLDjPz00UTyJXDGE93VA6vRIQfxwuhle66DE8JYQWyoKlS2AYukQuDQsQUNFGuFuMlZ8up8Si9a2e0d9MMULtfzSNJO2hP84521/RufMNzlUgs1s46ezTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712153578; c=relaxed/simple;
	bh=GGh0Z3ydRDAXIKFczbiFMwEkwvZNBi5GQ4PvXOPBujw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mfGqgnZ+rjL32+5x/Q9HU7Eg0/XpV9RqTdqnGNna+czodRVKllR8KqEa2mBHtw9f/6XZ4veb/bNMpfUIHnT2fzoqnY1kgG8aEOLoCXlgkKTtFFDS8IWAVD++4hFeICJsTjpMV3k7shY1K/pmLX5VmKFcWDDuOJjkP5PFC/HuPG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nKkVnfxX; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433BKLxh021881;
	Wed, 3 Apr 2024 16:12:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=JAQUs95NgLlIyYWIYRoa+F8yB3FE/wpul4yf0LLhsJE=; b=nK
	kVnfxXoGTtWVuS/bFfTUI0NUWpz/cArckKaUov8wAPtiAMtx6+iXudSBt0YmgZrK
	0ac5xI/Nx5A5jgys+Lcr4nxtH2fPTq83Io/+preNVfpNx2LJ5ay2HTU8v8x1Bu+9
	GAYhgSNoUIVOaiOcQ/E9J09rZxkYyfDBTLzfHTHbl55kkR9zkrW/yFRC3r1SQ4HO
	gUbDVbnkg+9mf6OTwxih+IrMCr7qIL71sNV2GhLIaWC7zxTxcStQMCk0gYuXLUnr
	IoRPG0WcHeA1RZZwYlyITdE6B6mPpKMhBrx3HSClJd3YD4wE14RekGDgfH1sRroG
	JyBSbkVdNPhUzqogTOwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x6w657hus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 16:12:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 547654002D;
	Wed,  3 Apr 2024 16:12:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C0D121D3C8;
	Wed,  3 Apr 2024 16:12:15 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 3 Apr
 2024 16:12:14 +0200
Message-ID: <74ce0bbc-7516-414f-aca6-51b041049415@foss.st.com>
Date: Wed, 3 Apr 2024 16:12:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: i2c: st-vgxy61: Switch to
 {enable,disable}_streams
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Julien Massot <julien.massot@collabora.com>, <mchehab@kernel.org>,
        <sylvain.petinot@foss.st.com>, <linux-media@vger.kernel.org>,
        <kernel@collabora.com>
References: <20240315085158.1213159-1-julien.massot@collabora.com>
 <20240315085158.1213159-4-julien.massot@collabora.com>
 <b659efe5-6dbc-4145-b9e8-2da902ab51b3@foss.st.com>
 <Zg1N3mURA-hI3gzR@kekkonen.localdomain>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <Zg1N3mURA-hI3gzR@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_13,2024-04-03_01,2023-05-22_02



On 4/3/24 14:38, Sakari Ailus wrote:
> On Wed, Apr 03, 2024 at 02:26:32PM +0200, Benjamin Mugnier wrote:
>>> @@ -1188,20 +1188,35 @@ static int vgxy61_stream_disable(struct vgxy61_dev *sensor)
>>>  	return ret;
>>>  }
>>>  
>>> -static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
>>> +static int vgxy61_enable_streams(struct v4l2_subdev *sd,
>>> +				 struct v4l2_subdev_state *state, u32 pad,
>>> +				 u64 streams_mask)
>>>  {
>>
>> Should we also check that 'pad == 0' ? Or is it always so ?
> 
> If the number of pads in the sub-device is 1, then the pad is always 0
> here: this is checked in the framework.
> 

Perfect. Thank you for the clarification.

-- 
Regards,

Benjamin


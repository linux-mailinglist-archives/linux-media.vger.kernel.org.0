Return-Path: <linux-media+bounces-49880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 168D3CF1BAD
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 04:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 587293016349
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 03:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C156231ED65;
	Mon,  5 Jan 2026 03:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yq3KJacV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FE776025
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 03:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767583092; cv=none; b=nCfVI2e3MWy93jxHfQlDW2cXOT8LPBQvyC26IWVTydq/kb26Kolr6yWQcdpyw/ejh/ONg+qocBfAcVQSDTDM278PtMhH2M81qHh424/xjyJITBsnnYHiPdip0efxEciobH0YTgM3eeAE5il6QGadC2Gey4gAiWrlK8KyvUA2Hpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767583092; c=relaxed/simple;
	bh=hLNi0yaFu/GsVLpXIFj1oUB1eDWjKX1Z7Ur9eYkJ20g=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=nBxM0kouLRtm/lZv1hsGPCeSSprpRkc18EMcq2HkFAFZN2gZ9fvNPSukfKF7W8H8UJa9EfUgJNIUWOdj9XRx3j/6iveeVo/wO+BRDs4/C8lUNnaCEFZckqtm2s2czv8hCLSQjyCmfXe/pAo9y61ZbWWLRZ67tyx9GScKzU8Sd4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yq3KJacV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767583090; x=1799119090;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=hLNi0yaFu/GsVLpXIFj1oUB1eDWjKX1Z7Ur9eYkJ20g=;
  b=Yq3KJacV0ShawDJxAVsTWvAxisC8D62LCx0UsGuhnwwX/Tq9USbAffX8
   vHYbDyrhGDZkPtdGclkP+fTFelCNRKNpOjzvoozS/5kKhKT7cRwJrNg7F
   8jU9iEYUjJQLWRbCniQlqKeXhdlQFFKbjGMoEH2pGY3N83hYOpmkwjVKU
   rhFhrhwtdeKgD6Z93v8Kfr7H+jlaHeLtNPQyREdk3hriVbK1J9t/HlCyv
   pb0lCSwKjZhZBuY32dYTpFb9EE7CWjBC72HjPdgZ2kcCXkb49SuNzKFt8
   3LAXiRuC5xjeyYu9kXig1ZDyS3AbvcRwa2wHcRMU8leFrRhbyfqulxz4e
   g==;
X-CSE-ConnectionGUID: YdV+iMflSgOJMFyk5tmFaw==
X-CSE-MsgGUID: zJTcWRKgTo6ma4jbpgrGvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="56511220"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="56511220"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 19:18:09 -0800
X-CSE-ConnectionGUID: Q90jofxtRHSFoEVoK5pE6A==
X-CSE-MsgGUID: tx+huz7WQzGX12ufqU7inQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="203259460"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 19:18:08 -0800
Subject: Re: [PATCH v3 05/13] media: ipu6: Remove redundant streaming start
 via buffer queueing
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tian.shu.qiu@intel.com,
 antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-6-sakari.ailus@linux.intel.com>
 <d76a022b-4971-6228-4ec3-8a31b4a9a34b@linux.intel.com>
 <aVbQRDgTsChf0VAk@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <74eb5b18-cd5b-2fb5-749b-34d09d268040@linux.intel.com>
Date: Mon, 5 Jan 2026 11:07:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aVbQRDgTsChf0VAk@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 1/2/26 3:51 AM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Wed, Dec 31, 2025 at 02:01:14PM +0800, Bingbu Cao wrote:
>> Hi, Sakari,
>>
>> On 12/30/25 9:10 PM, Sakari Ailus wrote:
>>> The videobuf2 framework will ensure buffers are queued before streaming is
>>> started.
>>
>> The logic is only applicable for !start_streaming_called, right?
>> I am not sure it work for multiplex streams like metadata + frame
>> capture case.
> 
> The start_streaming() callback is only called after the minimum number of
> buffers specified for the queue (1 in this case) have been queued. So in
> case of multiple streams from the same CSI-2 receiver, it's a
> start_streaming() callback on one of the queues that triggers starting
> streaming from the source -- not the buf_queue() callback.
> 
> FWIW, multiple streams don't work with the driver right now anyway -- this
> is addressed by the streaming series I hope I'll be able to post soon,
> after addressing some more review feedback.

Ack.

> 
>>
>>> Remove support for starting starting streaming via the
>>
>> double 'starting' here.
> 
> Fixed for v4.
> 
>>
>>> buf_queue() callback.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 -------
>>>  1 file changed, 7 deletions(-)
>>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>>> index 8f05987cdb4e..fdf41b3cf60e 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>>> @@ -408,13 +408,6 @@ static void buf_queue(struct vb2_buffer *vb)
>>>  	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
>>>  	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
>>>  
>>> -	if (!stream->streaming) {
>>> -		ret = ipu6_isys_stream_start(av, &bl, true);
>>> -		if (ret)
>>> -			dev_err(dev, "stream start failed.\n");
>>> -		goto out;
>>> -	}
>>> -
>>>  	/*
>>>  	 * We must queue the buffers in the buffer list to the
>>>  	 * appropriate video buffer queues BEFORE passing them to the
>>>
>>
> 

-- 
Best regards,
Bingbu Cao


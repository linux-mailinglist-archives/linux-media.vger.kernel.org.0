Return-Path: <linux-media+bounces-49879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C59CF1BA7
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 04:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F81F30124F3
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 03:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA2D31E0F2;
	Mon,  5 Jan 2026 03:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1YtV5bA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF6D3D561
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 03:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767583036; cv=none; b=fI5BNxqtuf2NC7l5sHscuymFtHAuAeSRzD+FMPed1XuZr02frnOUA62Q4SySVClAcKqja2MpYbqO7Y9mDNn6cHU/Uew9WHJxBErgHNHE1iQAbIvRR4uh6SsR8zoiQwAiEAhb7mtXyPEG97NjuNyBS45zaP7WGHnV7hgT+q8xRdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767583036; c=relaxed/simple;
	bh=rxxgyp8ApL/OGjTeE9DPi+A6KsBTCRpASRKHsWt7E7E=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pODVTJ4Gulni8LKG+2eQNpyHXfTWnpHXrrwuEgLgkjEQhDopb+pfMimW2wJ2Zc/bHilp9R1OpDgX1uZR3P53ls6DdBSLJTYB/h02yTplWb0ImFvpWKEak1SKOK6KHxsyWirX2K4XFC0icdk+Lh75D77tKi9qfIGE7kiUUAsPc2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1YtV5bA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767583034; x=1799119034;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=rxxgyp8ApL/OGjTeE9DPi+A6KsBTCRpASRKHsWt7E7E=;
  b=U1YtV5bATRKDHsbC7Xj68F2i5/twi3w0jssUyBaEVFqVKvDtqhIfljvk
   JoICgBMM2zbSFmfjGNLq+EyU8QVv3XxIgWWIIzubjApokjoTvRQ+1VC3t
   Wv9WGddnqNpBg829V4lup3cJf4r8MOnRnVmaq7JzAwCingktJ/RbXTmlO
   08JF66qeqEG9cUbqbE56+pz3LFifUFlxqBQvda+2df34Ptc7Rpm1m3bZE
   6TycUzQmUzgUFREgj8yKA1SlrbexEvyBDKVaVB62VMpyL48v+VrnUmqjr
   x6TOxSb50806TqLxFS8NhntvJd/BvKeczd16Wit5/QbgyLJN/KosznnSe
   g==;
X-CSE-ConnectionGUID: PZz4sqjLRk6YMI3Tc5ITgg==
X-CSE-MsgGUID: fVPGoaW0R46jBNJ7H9c5sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="56511198"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="56511198"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 19:17:13 -0800
X-CSE-ConnectionGUID: R85ZP0ojS7uD0be2e+Uyrw==
X-CSE-MsgGUID: xRFTD2Q3RYyyBT5aC6HTzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="203259298"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 19:17:12 -0800
Subject: Re: [PATCH v3 07/13] media: ipu6: Close firmware streams on streaming
 enable failure
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tian.shu.qiu@intel.com,
 antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-8-sakari.ailus@linux.intel.com>
 <6594dfc9-bfb9-a99e-fe92-da2493397e9d@linux.intel.com>
 <aVbRzJOgMxUc7ln6@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <f8efb83d-2b3d-d69d-0613-1b5e64503265@linux.intel.com>
Date: Mon, 5 Jan 2026 11:07:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aVbRzJOgMxUc7ln6@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 1/2/26 3:58 AM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Wed, Dec 31, 2025 at 02:11:40PM +0800, Bingbu Cao wrote:
>> Sakari,
>>
>> Thanks for the patch.
>>
>> On 12/30/25 9:10 PM, Sakari Ailus wrote:
>>> When enabling streaming fails, the stream is stopped in firmware but not
>>> closed. Do this to release resources on firmware side.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> index dec8f5ffcfa5..919b77107cef 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> @@ -1066,6 +1066,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
>>>  
>>>  out_media_entity_stop_streaming_firmware:
>>>  	stop_streaming_firmware(av);
>>> +	close_streaming_firmware(av);
>>
>> It looks the close_streaming_firmware() has no chance to run if
>> v4l2_subdev_disable_streams() above failed. Beside, the
>> stop_streaming_firmware() is better called after subdev
>> disable_streams().
> 
> Do you mean we wouldn't need to call stop_streaming_firmware() at all here?
> That would be actually aligned with start_streaming_firmware() error
> handling.
>

I mean the code above:
  	if (!state) {
		...
		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
						  stream_mask);
		if (ret) {
			...
			return ret;
		}
		close_streaming_firmware(av);
	} else {

close_streaming_firmware() should be called anyway.

-- 
Best regards,
Bingbu Cao


Return-Path: <linux-media+bounces-49781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A9ACEB53D
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 07:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8AFBF3009299
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 06:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F763101CD;
	Wed, 31 Dec 2025 06:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GF7aT/kg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8F62E093F
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 06:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767161491; cv=none; b=jJEhumrAJi1OQlTHEVgAhfsm5CS2hW2k6ZsjewP+xA0e/VAEfY/K4EgBz/5Q8BNBLd4AvVQiI2Jcb1TGWAysCada1n/eb0oWbnN1uYPeBZrlgjIr3uVEJaEYBFoNkZWaejLfoUaX3xMN/PP39paUxAet7ZIBV3OnUZw+JK8XmNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767161491; c=relaxed/simple;
	bh=qUGmHV0Fl+75C+fWuqJaf3kAkpoBqPyEYzSToKVWH7Y=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ohdhdUl9t8uVytusHoArDdZM/V1IUkElr4Q5OdDz7RY9RhNPFiBGb+rtsqRN1DYVrjcghZSnYPqyx/6bzkok9f0MuT7DnhaFSxWpDTmvhMacJwbp3rRtt+LF1RppUplc9VyWN2k7S2y7A7wcXiyjXxTmXPyCuq98S/PdAPsmj3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GF7aT/kg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767161489; x=1798697489;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=qUGmHV0Fl+75C+fWuqJaf3kAkpoBqPyEYzSToKVWH7Y=;
  b=GF7aT/kgWmpZoXqZiY41BswDK0cLSuPP20jz+jj5vLp4G55cVjYWckqF
   FGbwnM2lZ8inGsZC77h+tbHoa3+keNU6wq9YtznFVCEiO7j86ajC3a3Ps
   +cjSkx9GSdUudbiAddxTgsfpJYLh+M/DAu3/B8IpcrE5yfPE1flBQwjLN
   mIcq9GbAl2iu980Bq0YSaZCMSrByCmW7DIDyErwBdmXWW2l1Kdbj/o3YG
   lv8vtufxsvPt5OdQ7kF9ovoDlFjHbC+jqu/kEX65u4nfdu1zuHHYqs8mV
   xdl/4OsEh0rE87D1PEdE9XkmbeFM7JOQom+EsJIcfR0133MsRtVotneu0
   w==;
X-CSE-ConnectionGUID: eDmEjAvvStS91kvB928Z5g==
X-CSE-MsgGUID: 7FrZX/h8Rw+hV9LbUkboXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79852818"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="79852818"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 22:11:29 -0800
X-CSE-ConnectionGUID: DjqbMjZoScGe9i6yag1pVQ==
X-CSE-MsgGUID: KbzEASfSTZ6faqj7KQBx4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201616875"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 22:11:28 -0800
Subject: Re: [PATCH v3 05/13] media: ipu6: Remove redundant streaming start
 via buffer queueing
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-6-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <d76a022b-4971-6228-4ec3-8a31b4a9a34b@linux.intel.com>
Date: Wed, 31 Dec 2025 14:01:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251230131013.75338-6-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi, Sakari,

On 12/30/25 9:10 PM, Sakari Ailus wrote:
> The videobuf2 framework will ensure buffers are queued before streaming is
> started.

The logic is only applicable for !start_streaming_called, right?
I am not sure it work for multiplex streams like metadata + frame
capture case.

>Remove support for starting starting streaming via the

double 'starting' here.

> buf_queue() callback.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index 8f05987cdb4e..fdf41b3cf60e 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -408,13 +408,6 @@ static void buf_queue(struct vb2_buffer *vb)
>  	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
>  	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
>  
> -	if (!stream->streaming) {
> -		ret = ipu6_isys_stream_start(av, &bl, true);
> -		if (ret)
> -			dev_err(dev, "stream start failed.\n");
> -		goto out;
> -	}
> -
>  	/*
>  	 * We must queue the buffers in the buffer list to the
>  	 * appropriate video buffer queues BEFORE passing them to the
> 

-- 
Best regards,
Bingbu Cao


Return-Path: <linux-media+bounces-19297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFED995ED1
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 07:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD90F1F21DAD
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 05:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB16150997;
	Wed,  9 Oct 2024 05:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9VLR9xv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D55715099C
	for <linux-media@vger.kernel.org>; Wed,  9 Oct 2024 05:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728450597; cv=none; b=Kjcc0bRG0+hoYdgLkxyJhz2KbwwHYsP/knpXxkqsX6L898sw7n9DMgvb/Q0MxcUrU3PGPcnDaeQJr/oUFHqweA0sZ2Cf2R+V5ICSBaC1Be0L/19WeIqZPJDt3sj3Q/pI+MnCIh5sSMJhqimuVTWSCTazhkfPshAgWNHKh9YhpMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728450597; c=relaxed/simple;
	bh=F9MYCDdpbHAUIPwIjGc2PXRdahT/E/9OzMCGgRWLA8U=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=o84L+AfyE7WSGVkFFg88qqJct9O5lF9VO6//5X18jgZ87W+ghGLtVWQIX8No4+Svw4syXfWRCe5KZ5jbU8ILCHPELdCR7yoP+nQFRbbk8UYJCFHt/Hy+fUMB9QUajrfJY67/ZUmXCMrBJe1OLqC5EHkjRXRFbVJscn3e09gUISw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9VLR9xv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728450596; x=1759986596;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=F9MYCDdpbHAUIPwIjGc2PXRdahT/E/9OzMCGgRWLA8U=;
  b=U9VLR9xvOgkwlCnHhwhVpds4ZNfEQI2TkwtA/qaurwv71kS3WVAObsad
   0nYUKxUf/lXY7EGTV78Q4vw7oKPJy9r7ENAj2JIHhtMhEzp0zphRD1rUP
   TGoKony3Ck4rYkP6hi+RQfG57yTdxd5hxfljMNgqrjWnNecDGrXlVgRWb
   zHF0S42T/v+Mv5Migb0GEGreLUYm5ZpwQTP52VaqkYXem+F7sTjK5Qw2g
   Qipdksh4lk6DCEZh7/B+9Fo90ySZlMeSGue+ssQQiNIEOyMn0TQw+6Pgs
   CPsEc0ANAXW1PVY/LG8JuMcmmzqqj5YUtbZy+FOZTBJV0LK59WpFeQrtW
   w==;
X-CSE-ConnectionGUID: LGfwHG4BT26HORileCONlQ==
X-CSE-MsgGUID: l90vLZS6QDS069rOuvjY5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39080235"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="39080235"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 22:09:55 -0700
X-CSE-ConnectionGUID: Jrl+1ZjoQWmihTsTsWKzEQ==
X-CSE-MsgGUID: xw/b3nmuQSGF/NnMs+4k2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80630611"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 22:09:54 -0700
Subject: Re: [PATCH 1/2] media: ipu6: fix the wrong type cast and 64-bit
 division
To: Andy Shevchenko <andriy.shevchenko@intel.com>, bingbu.cao@intel.com,
 andriy.shevchenko@linux.intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
References: <20241008061916.313517-1-bingbu.cao@intel.com>
 <ZwVOiq0RCJu9ECcr@smile.fi.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <6a6e8137-97f0-0af8-51b3-73e4f45e73c2@linux.intel.com>
Date: Wed, 9 Oct 2024 13:06:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZwVOiq0RCJu9ECcr@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Andy,

Thanks for the comments.

On 10/8/24 11:23 PM, Andy Shevchenko wrote:
> On Tue, Oct 08, 2024 at 02:19:15PM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> This patch fixes the build errors with `i386-allmodconfig`, the
>> errors are caused by wrong type cast and 64-bit division.
> 
> Thanks for the change, my comments below.
> 
> ...
> 
>>  /* Shared structure between driver and FW - do not modify */
>>  struct ipu6_fw_sys_queue {
>> -	u64 host_address;
>> +	uintptr_t host_address;
> 
> Okay, in the given semantic this probably should be phys_addr_t.
> BUT, is this address somehow is going to be used by IPU6 hardware?
> If "yes", the type shall not be changed.
> 
> Looking at types used I hope the answer is "no", otherwise the types
> in the structures should be  properly choose WRT endianess (and what
> __packed is doing here? Is it part of the protocol?).

You are correct, the type here should not be changed.

> 
>>  	u32 vied_address;
>>  	u32 size;
>>  	u32 token_size;
>> @@ -40,7 +40,7 @@ struct ipu6_fw_sys_queue {
>>  } __packed;
>>  
>>  struct ipu6_fw_sys_queue_res {
>> -	u64 host_address;
>> +	uintptr_t host_address;
> 
> Ditto.
> 
>>  	u32 vied_address;
>>  	u32 reg;
>>  } __packed;
> 
> ...
> 
>> -	dev_dbg(dev, "write: reg 0x%lx = data 0x%x", base + addr - isys_base,
>> -		data);
>> +	dev_dbg(dev, "write: reg 0x%lx = data 0x%x",
>> +		(ulong)(base + addr - isys_base), data);
> 
> No, one should use proper specifiers for this. And what the heck 'ulong' is?
> Where is it being defined?
> 
> ...
> 
>> -	dev_dbg(dev, "read: reg 0x%lx = data 0x%x", base + addr - isys_base,
>> -		data);
>> +	dev_dbg(dev, "read: reg 0x%lx = data 0x%x",
>> +		(ulong)(base + addr - isys_base), data);
> 
> Ditto.
> 
> ...
> 
>>  	pg_offset = server_fw_addr - dma_addr;
>> -	prog = (struct ipu6_cell_program *)((u64)isp->cpd_fw->data + pg_offset);
>> +	prog = (struct ipu6_cell_program *)((uintptr_t)isp->cpd_fw->data +
>> +					    pg_offset);
> 
> Side Q: What are the alignment requirements for the prog pointer?

It should be 64 bytes alignment.

> 

-- 
Best regards,
Bingbu Cao


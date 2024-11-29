Return-Path: <linux-media+bounces-22284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B3F9DBF39
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 06:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BEDEB213E9
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 05:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC1B155C96;
	Fri, 29 Nov 2024 05:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmyy7wo4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD5BBA4B
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 05:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732859377; cv=none; b=BjHjwcytcItqWE100F74NE3anx5uu8hQZCf3GDxcdP6Bso8JL3fCE5YJ5VdH+ggt8FlTWvJ5Xwl33SfgE2LgSXlTNDNlLjgO3oMvOwQI85wYH5Mf5h6pJGypnmDaBYWHeqbufetC2wyRWtIu7HXHxZYJ4a0EBqIIR5trL6aNpT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732859377; c=relaxed/simple;
	bh=oK4W4tnwJmkrnNVOKI7vms3f4NOFxCkO4eQUmKwMWqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=abI5o6cKj/onvTTEqB3Su/XqFoSRMrhIFH44D5tAtUInBEPIvOF8sivbUNqQ+ZkuP/ypUjNjL58/UTJqMnMK7bDmm7QKgSgxiNjnxeLksrsNBU5OAqoXVnZBnkg/ciYE0APZu/nBxmXvnrXYgAOUCjX5QNtFKFNuUwCLLCrqhuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmyy7wo4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732859375; x=1764395375;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oK4W4tnwJmkrnNVOKI7vms3f4NOFxCkO4eQUmKwMWqw=;
  b=hmyy7wo4B+mH1mxoqvQXe0vFMc6MbSU+7mRklmwDW/uKRDEdzNVc09E7
   pf0BZRi2e3eB0dYI+kH7GFL/aoL/6sx7GXulniNjGFGK5Kcl4qHQ5sksW
   GaGaf7vXc8eOLPGp+nvYUzIRecfiSG1+ljrcL5soLWgpck0+GrAvCZqEG
   gkLK0rCUo6MAMOvaFm94AGxj6UMhNIFajM6qCn5S9SfBAQ5DLD8chX+am
   FAzhG1BUDNrOahOh+Y/1dwIpPcVFQTWO879W3AF/mfjxMGPh90IyYuFHt
   zyEAdFBZIKKmHu0ITySbCaX9QotKZq7BT+yPrQFSh4NTST5Qf2Xp+qPEe
   g==;
X-CSE-ConnectionGUID: 77huU+6vT4iF9YPk4Swc4A==
X-CSE-MsgGUID: 41jgWObzTHCerMqXHMXtBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="37024103"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="37024103"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 21:49:35 -0800
X-CSE-ConnectionGUID: sdqz94VTTfi7WK3L291O8A==
X-CSE-MsgGUID: om8mrY6STzOOOBQ0W7PZjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="97372224"
Received: from unknown (HELO [10.238.224.208]) ([10.238.224.208])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 21:49:32 -0800
Message-ID: <f72dc944-9a91-4691-bf45-4644058f0732@linux.intel.com>
Date: Fri, 29 Nov 2024 13:49:29 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: i2c: add lt6911uxe hdmi bridge driver
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 jacopo.mondi@ideasonboard.com, daxing.li@intel.com, hao.yao@intel.com
References: <20241017030831.3248879-1-dongcheng.yan@intel.com>
 <5b42e37a-810d-45e4-8552-c9299837a16a@xs4all.nl>
 <Zxs_hzuovpuitTYv@kekkonen.localdomain>
 <07ce5885-04af-4872-81cc-bff3d0dbcb60@xs4all.nl>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
In-Reply-To: <07ce5885-04af-4872-81cc-bff3d0dbcb60@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans,

On 10/25/2024 3:05 PM, Hans Verkuil wrote:
> On 25/10/2024 08:49, Sakari Ailus wrote:
>> Hi Hans,
>>
>> On Wed, Oct 23, 2024 at 02:28:02PM +0200, Hans Verkuil wrote:
>>> Hi Dongcheng,
>>>
>>> Since this is an HDMI receiver, you need to implement the DV Timings API.
>>
>> "Must"? Why?
> 
> The DV Timings API is used to deal with the HDMI interface part.
> 
>>
>> I don't know the tc358743 driver but it'd unlikely to work with current
>> CSI-2 RX drivers. They expect the LINK_FREQ control for instance, not the
>> DV timing API.
>> <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/tx-rx.html#transmitter-receiver>
>>
> 
> The tc358743 predates these controls. It just uses get_mbus_config. The CSI
> configuration is defined in the dts:
> 
> Documentation/devicetree/bindings/media/i2c/tc358743.txt
> 

the lt6911uxe driver gets mbus_config in lt6911uxe_fwnode_parse, however 
we still need to support v4l2_ctl link_freq and pixel_rate for the 
related sensor users who follow the CSI-2 rules, like Intel IPU.

Thanks,
Dongcheng

> It is fine to add support for these controls, but the DV Timings API to deal
> with the HDMI interface is required for HDMI receivers.
> 
> The CSI lanes/frequencies are typically fixed for HDMI receivers (i.e. they
> don't change if the resolution changes).
> 
> Regards,
> 
> 	Hans
> 



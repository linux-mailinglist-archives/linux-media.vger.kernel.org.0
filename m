Return-Path: <linux-media+bounces-9667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3E8A822E
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 13:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BFC7B25AEE
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 11:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5525913CA8B;
	Wed, 17 Apr 2024 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQsTEcTu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD8413342F
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713353608; cv=none; b=CYUjqdrTLdBIn2IuMZkOSw/48kkJ/WaxooR0RANopDNvJ0shibBOvmiAnsCHNRHPILZPrUMsW19H73lxxcfJXqhpfsmPX5vhmNrDsp0tSTP9YKZtBrcOKJQa31J3jhXDsknAIpUhHi/cXO9/pwWwJGoGdgyfD5vpJWOE4Zt4qwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713353608; c=relaxed/simple;
	bh=Gj7YW3T1UA9IY6TvaXPN0ddDtYsZ00SUtjNINcfOryA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=L1J54wNEmQ1w86uCVB3X/x1l7X4oAtMkDPmG6Ntr6SG592c9bz9Xx4Yw0HY/spczjlMyFGK5qyJ35BA1+irnGymnWeyDRLpb+xE8M/3l2B1TEuiN8vjIjo7hgCEPeEvz3KlwYvLzVOzFT1eQctZstCmhOEURbcerR09n+VPOlF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQsTEcTu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713353607; x=1744889607;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Gj7YW3T1UA9IY6TvaXPN0ddDtYsZ00SUtjNINcfOryA=;
  b=IQsTEcTu9dlJ8wCHxoVY2q57BLC4UjDu2/CfHf5KoyB37vJadkql+vjJ
   GsigIJbeOF+cAJaeLol7OBbMzUQrZAX/fY70OhQoM94HGHS0UjiWeCrNO
   cUGnl9rQKTrSSjDBwroDZxYGK74A2Dc8GDurl1savwZCtiULzaOCplpA3
   1+dPKGjlk+JeAFF3XljhXQIy9YJhQJNp4RoCxwmIU6iiCWp35SglPZnW2
   6FOUQR1BsFxOmkV8idhUOk3wvNMKETp5LjPai1r/mNVSmhG5tt6LrLtjr
   j5Uni45prSYTEI9bEVZSZLaI/sCVKWbiWEg/xwPhvdTXGh/EB1z8EuRcj
   Q==;
X-CSE-ConnectionGUID: rPr56acsSc6ZHGSlktJ04Q==
X-CSE-MsgGUID: sEx8E/pnTMOS6NyJuiknww==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19986415"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="19986415"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 04:33:26 -0700
X-CSE-ConnectionGUID: u33YAhtdRiW2HdIILJ+2gw==
X-CSE-MsgGUID: vpVYiiNDR2mHBfYuGWJz8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="23067830"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa007.jf.intel.com with ESMTP; 17 Apr 2024 04:33:22 -0700
Subject: Re: [PATCH v4 00/19] Intel IPU6 and IPU6 input system drivers
To: Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@iki.fi>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 bingbu.cao@intel.com, laurent.pinchart@ideasonboard.com,
 andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 claus.stovgaard@gmail.com, tomi.valkeinen@ideasonboard.com,
 tfiga@chromium.org, senozhatsky@chromium.org, andreaskleist@gmail.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
 <77c32f87-cdec-4dd0-85b8-c75ca7405438@hansg.org>
 <Zh-Jr2gfdoCeB5-4@valkosipuli.retiisi.eu>
 <0ce5cc60-da32-4e0a-89bb-fa481d4a15b1@redhat.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <98434031-1296-166b-4fcf-093f8b7c92d1@linux.intel.com>
Date: Wed, 17 Apr 2024 19:33:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <0ce5cc60-da32-4e0a-89bb-fa481d4a15b1@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for posting this new version.

On 4/17/24 4:59 PM, Hans de Goede wrote:
> Hi Sakari,
> 
> On 4/17/24 10:34 AM, Sakari Ailus wrote:
>> Hi Hans,
>>
>> On Wed, Apr 17, 2024 at 09:56:40AM +0200, Hans de Goede wrote:
>>> Hi Sakari,
>>> On 4/16/24 10:10 PM, Sakari Ailus wrote:
>>>> Hello everyone,
>>>>
>>>> This patch series adds a driver for Intel IPU6 input system.
>>>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>>>> device which can be found in some Intel Client Platforms. User can use
>>>> IPU6 to capture images from MIPI camera sensors.
>>>>
>>>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>>>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>>>> the driver sets up a page table to allow IPU6 DMA to access the system
>>>> memory.
>>>>
>>>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
>>>>
>>>> I can now capture images from ov01a10 and ov2740 sensors (including
>>>> metadata from the latter).
>>>>
>>>> The series applies on top of the metadata patchset
>>>> <URL:https://lore.kernel.org/linux-media/20240416193319.778192-1-sakari.ailus@linux.intel.com/T/#t>.
>>>
>>> Thank you for the new version!
>>>
>>> I assume that the posting of this new version means that you have solved
>>> the stability issues where the laptop would freeze after sttreaming from
>>> an ov2740 sensor with metadata once ?
>>>
>>> What about the unrelated ov2740 driver issue where the sensor would not
>>> always start streaming for which you temporarily disabled runtime pm
>>> for the sensor as a workaround any progress on that ?
>>
>> I'm afraid these issues remain.
> 
> You mean both issues remain? I'm not that worried about the runtime-pm ov2740
> issue, but if the lockup after streaming issue also remains that is a lot
> more worrying.

Hans,

We did not observe this issue on the X1 Carbon Gen7 even the metadata
is enabled. However, the 1st frame captured by IPU6 ISYS is randomly
blank.

> 
> I've been running an older version of this series without the metadata
> support and that is pretty rock solid, so this seems to be caused by
> enabling metadata support.
> 
> AFAIK the current out of tree solution with partly closed-source
> userspace stack does not use metadata right /
> 
> Do you know if the Windows stack uses metadata capture from the sensor?

AFAIK, Windows stack doesn't enable the metadata for ov2740.
Very rare camera sensors enabled metadata both on Windows, Linux and
Chrome so far. However, I am trying to find another sensor instead of
ov2740 to test.


> 
> If neither the existing out of tree Linux stack nor the Windows stack
> is using metadata capture then chances are we are actually hitting
> hw/firmware bugs here. This would not be the first time that the Linux
> community tries to enable a hw-feature not used by the factory installed
> OS for the hw and ends up failing miserably because the feature was
> never fully tested and turns out to be full of bugs.
> 
> IMHO if we cannot get the stability issue fixed real soon it would
> be best to move forward with this patch series without adding
> the metadata support. So basically drop patch 17/19 .
> 
>>> Do you have a git branch available with the metadata + this series
>>> somewhere for easy testing ?  I would like to give this a test run on
>>> my own IPU6 + ov2740 laptop.

Thanks!

>>
>> Both of the sets can be found here:
>>
>> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=ipu6>
> 
> Thank you.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 

-- 
Best regards,
Bingbu Cao


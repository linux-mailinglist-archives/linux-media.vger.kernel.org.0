Return-Path: <linux-media+bounces-210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C3E7E9A77
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DD461C208CC
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEA518625;
	Mon, 13 Nov 2023 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TW0ukwcs"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C79156FA
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:41:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CDD10CB
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 02:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699872116; x=1731408116;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=9WJVaORU5xaI5p8R/xPVvUAnn7UkKi/fGZnF54Du/5E=;
  b=TW0ukwcsjAnsWF/pViMD1hbctgrYBCNVsTX2S2B2Osit/R+BJ4k9i0xx
   hr0ur0YjIyhWPB3TZz1uwKEsieHeR2e/Q4AfwBaz7jVRAzb3om3sU/gTx
   KZ+XH2yazeOC9fkDsc/j3z2aWogu+ZWV+njHAJ/BPqyAYVZGUpGNJTH5D
   LX6FpewjtR+VMd5eHvUWXwuoHnmZtY+gwyDc1nwdTbAHta5w0r9ycAdl0
   hR8z28HpCUbuvy5fa3mU6oQMFY2ZzyZNUOCpo1RGKAm2QDfVWuUh5rxTb
   ihhMyBNzmDQofv4pFFA1bORLOPOODSh9yY4XyJh5Iq+M0scp2mv5kMnDf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="456905812"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="456905812"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 02:41:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12071592"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.165]) ([10.238.232.165])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2023 02:41:52 -0800
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
To: Hans de Goede <hdegoede@redhat.com>, bingbu.cao@intel.com,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com,
 "Martti Groenen (19174837)" <M.Groenen@student.hhs.nl>
Cc: andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 andreaskleist@gmail.com, claus.stovgaard@gmail.com, tfiga@chromium.org,
 senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
 <7a636512-91ab-4f97-8bd0-e24ebc528ecf@redhat.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <15e5202a-8887-ca95-280f-84a922372f08@linux.intel.com>
Date: Mon, 13 Nov 2023 18:37:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <7a636512-91ab-4f97-8bd0-e24ebc528ecf@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hans,

On 11/10/23 8:04 PM, Hans de Goede wrote:
> Hi,
> 
> On 11/8/23 12:59, Hans de Goede wrote:
>> Hi Bingbu,
>>
>> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> This patch series adds a driver for Intel IPU6 input system.
>>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>>> device which can be found in some Intel Client Platforms. User can use
>>> IPU6 to capture images from MIPI camera sensors.
>>>
>>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>>> the driver sets up a page table to allow IPU6 DMA to access the system
>>> memory.
>>>
>>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
>>
>> I have been testing this on a TigerLake system, a Dell Latitude 9420
>> with ov01a1s and the packed 10 bit bayer pixel fmt: V4L2_PIX_FMT_SGRBG10P,
>> which libcamera together with (WIP) software debayer support picks
>> by default does not work. There are many many CSI errors in dmesg
>> and only the first 10 or so lines of the image show.
>>
>> Disabling the packed format by removing it from ipu6_isys_pfmts[],
>> making libcamera pick the unpacked (every 10 bits per pixel data
>> stored in a 16 bit word in output buffer) fixes this.
>>
>> Are the packed bayer formats supposed to work on Tiger Lake, or
>> is this a known issue which Intel's own userspace stack avoids
>> by always picking the unpacked format ?
> 
> Bingbu, so we've been trying to get software debayering to work
> on the Dell Latitude 9420 with ov01a1s and I have just learned
> that this sensor has a non standard bayer grid.
> 
> https://github.com/intel/ipu6-camera-hal/blob/9fa05a90886d399ad3dda4c2ddc990642b3d20c9/config/linux/ipu6/gcss/graph_settings_ov01a1s.xml#L17
> 
> bayer_order="GRGB_IGIG_GBGR_IGIG"

The IR is not enabled in Linux camera stack yet if I remember correctly.
Current IPU6 processing system have a single hardware block extract the RGB
and IR separately - "rgb_ir_2_0" in xml.

> 
> I'm wondering how to interpret these 4 pixel orders? For the OV2740
> this just says:
> 
> bayer_order="GRBG"
> 
> and this single quartet of letters describes a 2x2 block like this:
> 
> GR
> BG
> 
> but now there are 4 quartets so how to interpret this,
> I guess this is the correct way to interpret this? :
> 
> GRGB
> IGIG
> GBGR
> IGIG

I have no idea how to interpret the output of ov01a1s. Maybe you can
try to zero(bypass) the IR data and interpret as SGRBG10.

> 
> Regards,
> 
> Hans
> 
> 
> 

-- 
Best regards,
Bingbu Cao


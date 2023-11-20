Return-Path: <linux-media+bounces-579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D498E7F0B2B
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 04:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83741C2085D
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 03:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6015920E6;
	Mon, 20 Nov 2023 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1IVszRf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D73BB5
	for <linux-media@vger.kernel.org>; Sun, 19 Nov 2023 19:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700452742; x=1731988742;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+SY5UpaJkOrLRccA3QQ8s7wjP22rLepgBaoqI6iHfBc=;
  b=L1IVszRf5WH+8VuUP0LxqtyNu2g4tE1/szSc5xaeX/UmaLG6Gl/mXBjv
   aAEeg/1Nlhei/c5rrCk9MOWFH6Y8leMU1T8MnF1RDdJKMUSV260dXXXtp
   A/RIhpxPEH0FOVa0cklVDY5mVpLGiai8ZCzgiUP3PsxoxceDsIRlTwyeb
   ecswUIiWb4CG9NaHbs02YiXL/kyyt696N3uSmFB4pkjjQtxITLcL6G2aI
   ggTOukmzPelRym9uwheb11AHAECTGYLAKMqen/nqKFH2j7Rx7N7eXCeVF
   WZkkdEgA78X2JsyQjGPvif4qdeuQYALofs60H1tzsbA/H9/6fuYDIAv/W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="371723859"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="371723859"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 19:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="7428935"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2023 19:58:57 -0800
Subject: Re: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Andreas Helbech Kleist <andreaskleist@gmail.com>,
 Hans de Goede <hans@hansg.org>, bingbu.cao@intel.com,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com,
 claus.stovgaard@gmail.com, tfiga@chromium.org, senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
 hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-2-bingbu.cao@intel.com>
 <a3184b70-e0b3-4227-94af-2412fd565724@hansg.org>
 <d9fa902626486899929202f56f3e924b4ba27a73.camel@gmail.com>
 <65475a54-5b97-4c60-a55b-dedb66a02cbb@redhat.com>
 <ZVfYltUAZmVRatMS@smile.fi.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <2c825ed5-25c7-4348-25d8-6a4f7ac30325@linux.intel.com>
Date: Mon, 20 Nov 2023 11:54:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZVfYltUAZmVRatMS@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Andy and Hans,

Thanks.

On 11/18/23 5:18 AM, Andy Shevchenko wrote:
> On Fri, Nov 17, 2023 at 07:43:04PM +0100, Hans de Goede wrote:
>> On 11/8/23 15:10, Andreas Helbech Kleist wrote:
>>> On Wed, 2023-11-08 at 12:25 +0100, Hans de Goede wrote:
>>>> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
> 
> ...
> 
>>  	ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
>> -	if (ret)
>> +	if (ret < 0) {
>>  		dev_err_probe(&dev->dev, ret, "Request msi failed");
>> +		return ret;
> 
> Even further:
> 
> 		return dev_err_probe(&dev->dev, ret, "Request msi failed");

Yes, I have updated the code locally and will send in v3.

> 
>> +	}
> 

-- 
Best regards,
Bingbu Cao


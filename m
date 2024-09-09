Return-Path: <linux-media+bounces-17896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F8970CE9
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 07:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED077B213E7
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 05:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CCB1AD3E0;
	Mon,  9 Sep 2024 05:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pIVqidD/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64FB658;
	Mon,  9 Sep 2024 05:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725859388; cv=none; b=IMPe1uugl+thlKh1k5VC/tZ6CjdJXlFSOHlTMhYRE8b+6BJ6ckSHH2QrI42cabNMzhKOrplOHWbL8W72pdVagXedIs7o3zEe+ptmLMmm1W7mTPq9vRErdlEtBcbntvrUYzXbIRs6A6CR7Aw71+HfUGGDTSzfJOH2S2dEPlOrHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725859388; c=relaxed/simple;
	bh=yptEiLaPg3d8jq9xeVRYa/hEVXcDgko9enYoa0dy0gw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=A/SQlul6PCBKxojNbGVKzNVRcFxi81WpPDC2kP9EXmXAycdPVRSa4u1wSY2dtn7Xf84VTJCDk2UfozKNeAZjaxWKOL6/8+2CvNbrJaDrgg21whT2ACUXQcBS1coB/NroMjlfLKoqwX16Iyr4TXLBSIEWbBQGDiI6j/XwH1rGXUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pIVqidD/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00E953EA;
	Mon,  9 Sep 2024 07:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725859307;
	bh=yptEiLaPg3d8jq9xeVRYa/hEVXcDgko9enYoa0dy0gw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=pIVqidD/tocHxtd0qCt8J7AaBrBkM+FLE4biEQuYEqprdo/KXYKPCZAsoASV2RIUJ
	 QvYaI1wurxZyDgEwn4+QfHyDZJ1rEVVKUPYXHTaaku6iFP/ztrwSSaIHMP81qnENU1
	 wzertAvCSewwXI/o9DJjjEACJnRYYgn0jLunIv+w=
Message-ID: <763b3147-d7cb-44a7-b73b-8f7f4fd622ab@ideasonboard.com>
Date: Mon, 9 Sep 2024 08:22:59 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Naushir Patuck
 <naush@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 kernel test robot <lkp@intel.com>
References: <20240904-rp1-cfe-v4-3-f1b5b3d69c81@ideasonboard.com>
 <202409051822.ZzUGw3XQ-lkp@intel.com>
 <20240905111120.GK16183@pendragon.ideasonboard.com>
 <40cc1e95-b9fc-4c27-9428-1698d0bf9d25@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <40cc1e95-b9fc-4c27-9428-1698d0bf9d25@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent, Jacopo,

On 09/09/2024 08:08, Tomi Valkeinen wrote:
> Hi,
> 
> On 05/09/2024 14:11, Laurent Pinchart wrote:
>> On Thu, Sep 05, 2024 at 06:50:48PM +0800, kernel test robot wrote:
>>> Hi Tomi,
>>>
>>> kernel test robot noticed the following build warnings:
>>>
>>> [auto build test WARNING on 431c1646e1f86b949fa3685efc50b660a364c2b6]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Tomi- 
>>> Valkeinen/media-uapi-Add-meta-formats-for-PiSP-FE-config-and- 
>>> stats/20240904-192729
>>> base:   431c1646e1f86b949fa3685efc50b660a364c2b6
>>> patch link:    https://lore.kernel.org/r/20240904-rp1-cfe-v4-3- 
>>> f1b5b3d69c81%40ideasonboard.com
>>> patch subject: [PATCH v4 3/4] media: raspberrypi: Add support for 
>>> RP1-CFE
>>> config: m68k-allmodconfig (https://download.01.org/0day-ci/ 
>>> archive/20240905/202409051822.ZzUGw3XQ-lkp@intel.com/config)
>>> compiler: m68k-linux-gcc (GCC) 14.1.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/ 
>>> archive/20240905/202409051822.ZzUGw3XQ-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>>> version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild- 
>>> all/202409051822.ZzUGw3XQ-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2445:12: warning: 
>>>>> 'cfe_runtime_resume' defined but not used [-Wunused-function]
>>>      2445 | static int cfe_runtime_resume(struct device *dev)
>>>           |            ^~~~~~~~~~~~~~~~~~
>>>>> drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2435:12: warning: 
>>>>> 'cfe_runtime_suspend' defined but not used [-Wunused-function]
>>>      2435 | static int cfe_runtime_suspend(struct device *dev)
>>>           |            ^~~~~~~~~~~~~~~~~~~
>>> vim +/cfe_runtime_resume +2445 drivers/media/platform/raspberrypi/ 
>>> rp1-cfe/cfe.c
>>
>> The recommended way to fix this is to switch from SET_RUNTIME_PM_OPS()
>> to RUNTIME_PM_OPS() and use pm_ptr() to set .driver.pm. This being said,
>> the driver won't work on a kernel with !CONFIG_PM given how you
>> implemented probe() and remove().
>>
>> The pisp-be driver suffered from the same issue and Jacopo fixed it in
>> the last version. You can have a look at implement something similar.
> 
> I can't right away think of any reason to not just depend on CONFIG_PM 
> and be done with it without any tricks. Do you know if there's a reason?

Also, I don't think pisp-be is correct. It just calls 
pispbe_runtime_resume() in probe() to wake the IP up (which only enables 
pisp clock), without telling the runtime PM about it. This means the 
parent device and the suppliers may not be powered up.

  Tomi



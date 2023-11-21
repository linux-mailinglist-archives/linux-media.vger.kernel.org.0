Return-Path: <linux-media+bounces-636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8BF7F247D
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 04:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5C241C218E0
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 03:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4721549C;
	Tue, 21 Nov 2023 03:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8sMkqfd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60318CB
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 19:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700536062; x=1732072062;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=C42Q9xWSUEQPTmYH6eI03OV9kdJ5AW/54C4y9+5+lxA=;
  b=K8sMkqfdiFLuYIbwQRPwoRSJxbcUAbZKsextEfo9YwcawkhV8Aq3GwTR
   ErGd+vspvF+N4QagFYmX22kYgd+wgs0q/FRsw5s6QKb1oUUODyWIUwLX9
   MLkPx4k7tPujcY8PoViTdpUl+Vrk9Ed3cpWmmJ+tF/CxDD/2BbweaI+JF
   6mEXdvQk46+T6crsN5W8cKMj84xFDeZoBZZJkkWqsmawPcXAR3X7hrASg
   9bkKsYDjL/ZpgIEFX/mzYJG+t+Vv+nyb6XPt72XXRqFT373HfjtHVTrWv
   pPrSGw1R35JNsxZWScuJuJ97pdYfwRZQkoC2wSsG/GsFzZjSedpjoJ3Uz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="456090356"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="456090356"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 19:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="742902485"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="742902485"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orsmga006.jf.intel.com with ESMTP; 20 Nov 2023 19:07:40 -0800
Subject: Re: [PATCH 0/4] Enable sensor's runtime PM before registering async
 sub-dev
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org, hdegoede@redhat.com
References: <20231106083516.763184-1-bingbu.cao@intel.com>
 <072fcb90-1888-39c4-1d19-200cf01b6289@linux.intel.com>
 <ZVr-I2m9P2w5LgyK@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8c9762eb-adb8-bb87-c270-6f3021cb7f01@linux.intel.com>
Date: Tue, 21 Nov 2023 11:03:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZVr-I2m9P2w5LgyK@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 11/20/23 2:35 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Mon, Nov 20, 2023 at 12:14:40PM +0800, Bingbu Cao wrote:
>>
>> Sakari and others,
>>
>> On 11/6/23 4:35 PM, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> Following Sakari's patch:
>>> <URL:https://lore.kernel.org/linux-media/20231102090752.1418132-1-sakari.ailus@linux.intel.com/>
>>>
>>> The sensor device maybe accessible right after its async sub-device is
>>> registered, so runtime PM should be ready before its async sub-device
>>> is registered.
>>>
>>>
>>> Bingbu Cao (4):
>>>   media: imx355: Enable runtime PM before registering async sub-device
>>>   media: ov01a10: Enable runtime PM before registering async sub-device
>>>   media: ov13b10: Enable runtime PM before registering async sub-device
>>>   media: ov9734: Enable runtime PM before registering async sub-device
>>>
>>>  drivers/media/i2c/imx355.c  | 13 ++++++++-----
>>>  drivers/media/i2c/ov01a10.c |  7 +++++--
>>>  drivers/media/i2c/ov13b10.c | 14 +++++++++-----
>>>  drivers/media/i2c/ov9734.c  | 19 +++++++++++--------
>>>  4 files changed, 33 insertions(+), 20 deletions(-)
>>>
>>
>> Do you have any comments on this series?
> 
> Oops. What's the reason for splitting pm_runtime_idle() call from the rest
> of the Runtime PM related setup?

Ah, no special reason actually. I just want to make the pm idle callback to
be the last ops as it was. I have no idea what the async callback does
before idle.

> 

-- 
Best regards,
Bingbu Cao


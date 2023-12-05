Return-Path: <linux-media+bounces-1650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5915804D74
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 10:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 717131F212B6
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C863E47D;
	Tue,  5 Dec 2023 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYo40hR2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A00D83
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 01:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701767997; x=1733303997;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=PvChDWs42OJfiWSQYAQ880lfO2Ori83NkSN/MX7Eivw=;
  b=RYo40hR2qfxZEM/cscg/W8T67APGL5eYcPKeNdfnR2u5x8+7vByOeI7K
   pjAHWGV+b6pH1H3f1ZzV7o1bbft+jNXOxKdrrsCb6+ObLF2ljH0gzGQ3b
   i5I7fYY1AOc9TExyeF2rasFZUHj9BN+vYqleYL9laSO1jMwxzN6a5te74
   xA80sSKfWEnwHI4QS5g9S/37H4hi4Hwdi2gwQ2I3qlT8G+Y+3k+6vWRNr
   JPPnXmfbvhPmCqHD12HUdrrF83sytvUYFmN6EtwoZL51sC2IulBLKPh6c
   yVzs1ts5dIW6Ylw3xXK0cLKJ01UF00NjMWfCru41iRBWOj87qKBtOYW7y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="425026700"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="425026700"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 01:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861681395"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="861681395"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 01:19:53 -0800
Subject: Re: [PATCH v2 11/15] media: intel/ipu6: input system video capture
 nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hans@hansg.org>, bingbu.cao@intel.com,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
 claus.stovgaard@gmail.com, tfiga@chromium.org, senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
 hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-12-bingbu.cao@intel.com>
 <855f69b8-dc33-225a-ebd3-134467d55cf1@hansg.org>
 <8df79f15-2054-d558-7b27-7362cdcde26b@linux.intel.com>
 <ZUjLZ_ev4Xy-Ey4y@smile.fi.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <4d476acd-0e9e-caf5-2d97-ce2b2a00e3f7@linux.intel.com>
Date: Tue, 5 Dec 2023 17:15:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZUjLZ_ev4Xy-Ey4y@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hans,
Thanks for your patch, I will squash them into v3.

Andy and Hans, thank you for your review and comments on v2.

Please give me some time to send v2, we have metadata capture support
change which depends on some v4l2 APIs update in kernel. I will send v3
ASAP.

On 11/6/23 7:17 PM, Andy Shevchenko wrote:
> On Mon, Nov 06, 2023 at 05:18:55PM +0800, Bingbu Cao wrote:
>> On 11/6/23 12:59 AM, Hans de Goede wrote:
> 
> ...
> 
>> Yes, sure.
> 
> It's likely that I meant this series (it's under development, right?) to be
> Cc'ed to me in its next version.
> 

-- 
Best regards,
Bingbu Cao


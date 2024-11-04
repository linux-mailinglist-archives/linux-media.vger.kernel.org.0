Return-Path: <linux-media+bounces-20781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C49BB091
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 484F7280E06
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 10:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC3E1B0F1F;
	Mon,  4 Nov 2024 10:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISMcrhwJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656011AF0D9;
	Mon,  4 Nov 2024 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714769; cv=none; b=BIMVrKJhboiALSJpBpqg8Tlj7oSBcQOZtXrwoCxGBrOoWeUQ1kh8Wx/b8uEMAv24KSjIqfoRmNXJ31sCIxzqfDXjcTszHnv4Cf4VDZKTNNXWwovnKU9JUDQR2bu8BjK3hB9H46RuEeTLG3OudSM5UDqiMc/svj2YTwFgjVgyNOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714769; c=relaxed/simple;
	bh=Xod1yEXAGdpYU4tYEd+Nah1kh/k99Q2zii1RjaEeOIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQpZGuPKZ9W5FO04RAAj7JcJHSRrBVb90KUwrs6dhV+U4eUphHIYJktkyOKRda/6Bc3IAAXud6WIxSBY+/k5lNZtqZga0yVvbs/1Z7LJVWH8o4hlHMp1pDEig65qCSVJjdOF3BUnrE9mfWDF+7FElL4cPJ4FUtt+d84rqWVwZqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISMcrhwJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730714768; x=1762250768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xod1yEXAGdpYU4tYEd+Nah1kh/k99Q2zii1RjaEeOIQ=;
  b=ISMcrhwJu1e3esMoe1RS15h3/CzfQj3he4SGsMz1GcMluulgO67BkchV
   rOVPzrt+JVLyVKy3XzQj/fDQxool6JNGGd2V/tJGghk7TcCMWZUUEqHti
   mUXET7AIAxYRH1dmC2WrVP94bzsdSl40dlVM7kaeJfbVB5xZc4rBCmxtW
   i3zagYBYehlBMdjyG9TKvsM/kcrzo+7Bbv8gC6PE+gbOUAdnp52gI/wFt
   r99E1qoo5+5/BxaVtwfFjQNv3BUWdYiAos7KQJq6Q7a8YLvzLrrEiqLhh
   +DrdIVuFeWzhd9R91Hc6frrzfDeCy8e1Sp1RWxfcAQvLZFhHU3Td48Ozb
   Q==;
X-CSE-ConnectionGUID: PwIR0Ey9TOGH9Cng2E1sXg==
X-CSE-MsgGUID: sT0+KnrpSly0UjRHWfsmeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="34331591"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="34331591"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 02:06:07 -0800
X-CSE-ConnectionGUID: TURrh7mMSN6g+F7LpMOr4Q==
X-CSE-MsgGUID: ibZPN91MRBGiAzTRPojnUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83953452"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2024 02:06:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7tyE-000kiz-20;
	Mon, 04 Nov 2024 10:06:02 +0000
Date: Mon, 4 Nov 2024 18:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	chenchangcheng <ccc194101@163.com>
Subject: Re: [PATCH] media: uvcvideo:Create input device for all uvc devices
 with status endpoints.
Message-ID: <202411041605.VSoO1uus-lkp@intel.com>
References: <20241104023947.826707-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104023947.826707-1-ccc194101@163.com>

Hi chenchangcheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-stage/master]
[also build test ERROR on linus/master v6.12-rc6 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chenchangcheng/media-uvcvideo-Create-input-device-for-all-uvc-devices-with-status-endpoints/20241104-104225
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/20241104023947.826707-1-ccc194101%40163.com
patch subject: [PATCH] media: uvcvideo:Create input device for all uvc devices with status endpoints.
config: x86_64-buildonly-randconfig-001-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041605.VSoO1uus-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041605.VSoO1uus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041605.VSoO1uus-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/usb/uvc/uvc_status.c: In function 'uvc_event_streaming':
>> drivers/media/usb/uvc/uvc_status.c:110:21: error: implicit declaration of function 'uvc_input_has_button' [-Werror=implicit-function-declaration]
     110 |                 if (uvc_input_has_button(dev)) {
         |                     ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/uvc_input_has_button +110 drivers/media/usb/uvc/uvc_status.c

    93	
    94	/* --------------------------------------------------------------------------
    95	 * Status interrupt endpoint
    96	 */
    97	static void uvc_event_streaming(struct uvc_device *dev,
    98					struct uvc_status *status, int len)
    99	{
   100		if (len <= offsetof(struct uvc_status, bEvent)) {
   101			uvc_dbg(dev, STATUS,
   102				"Invalid streaming status event received\n");
   103			return;
   104		}
   105	
   106		if (status->bEvent == 0) {
   107			if (len <= offsetof(struct uvc_status, streaming))
   108				return;
   109	
 > 110			if (uvc_input_has_button(dev)) {
   111				uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
   112					status->bOriginator,
   113					status->streaming.button ? "pressed" : "released", len);
   114				uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
   115			}
   116		} else {
   117			uvc_dbg(dev, STATUS, "Stream %u error event %02x len %d\n",
   118				status->bOriginator, status->bEvent, len);
   119		}
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


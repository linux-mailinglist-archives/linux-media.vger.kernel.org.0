Return-Path: <linux-media+bounces-49867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83148CF10BD
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 14:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BED0300B93C
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAFA2E1F02;
	Sun,  4 Jan 2026 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHZr5KU6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E6D27586E;
	Sun,  4 Jan 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767535112; cv=none; b=RH3eBSurLjjg4zzWitFOeJrac/NCMRWJKxW+/5vcwFM6Mqq/uMFJmjZO2mxM1cVBcGgeYiT4TGB2McGoQpvbTe5rYK17Eezbd53K9rcpOoXT3hiXl2/wpGEvtTzoXccLK9JtqYA6Y2hWD66KFwqFDRdBjEZlRchnCp1Ea1F13ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767535112; c=relaxed/simple;
	bh=BCYUocRThUrAG6LV3LVi4mMA/NwUhkutb8j/Hxb3ki0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLWmpPFbNBQ8Hhul/4aL9rwdE+JHP4hLXg4Ne4WHOyIVI7Szf1BCwnb9/yoFd9uWwjkGOJUfGtBNMp9H6adF7d8mvYpJjzTkzDysIMwH03glbfdBOjGQ45nwZyPLUXRR4pscl5WvSNnsM1MM4/6HgCycTh4AIHYt2/Ksv1uY91I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHZr5KU6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767535111; x=1799071111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BCYUocRThUrAG6LV3LVi4mMA/NwUhkutb8j/Hxb3ki0=;
  b=IHZr5KU6rZGDy1sUwmook0rlDUYO2A6PtCrrbkJ1Mhy8Fssmy0J66VW3
   yiq/C1xcHxRdzsq9uam4UyyRZyCtTii6vMRt2ERkpTgc7ZnZ/scqk7KtA
   u7Wboxro73CSH5y4Oo1isMBRohv9E9KsgPpb9BotFcpNn6py7AhmWOGi0
   AsxLNc9wFjokVtz5VlkhCcv0MoSms48GwDgtLLlCFlVEnIkstX3zFxjj4
   Fu2u7ooave5VPFoNeskO1bz75faE/w8Wu2tR+bXSxyhkORITRbPMshpFB
   rr0lf23aRtZPlMhnnpDntVlno5B0Kv/63I3npRmInezVeYBGj/3qpiIA9
   g==;
X-CSE-ConnectionGUID: 3KJCLvRiSK27iPr1XOufMw==
X-CSE-MsgGUID: aiBOYotuR+igx34d8F05Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68127414"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="68127414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 05:58:30 -0800
X-CSE-ConnectionGUID: snW/MXpaQfaMtksMAnqkcA==
X-CSE-MsgGUID: 2lSiCqPjTZCW0Pzexa8Y/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="202062976"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jan 2026 05:58:28 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcOck-000000000vR-0eKy;
	Sun, 04 Jan 2026 13:58:26 +0000
Date: Sun, 4 Jan 2026 14:57:47 +0100
From: kernel test robot <lkp@intel.com>
To: Chen Changcheng <chenchangcheng@kylinos.cn>,
	laurent.pinchart@ideasonboard.com, hansg@kernel.org,
	mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: Re: [PATCH] media: uvcvideo: Use scope-based cleanup helper
Message-ID: <202601041449.BwJ5RZ2a-lkp@intel.com>
References: <20260104064520.115462-1-chenchangcheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104064520.115462-1-chenchangcheng@kylinos.cn>

Hi Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on 805f9a061372164d43ddef771d7cd63e3ba6d845]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Changcheng/media-uvcvideo-Use-scope-based-cleanup-helper/20260104-144716
base:   805f9a061372164d43ddef771d7cd63e3ba6d845
patch link:    https://lore.kernel.org/r/20260104064520.115462-1-chenchangcheng%40kylinos.cn
patch subject: [PATCH] media: uvcvideo: Use scope-based cleanup helper
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260104/202601041449.BwJ5RZ2a-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601041449.BwJ5RZ2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601041449.BwJ5RZ2a-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/usb/uvc/uvc_video.c: In function 'uvc_get_video_ctrl':
>> drivers/media/usb/uvc/uvc_video.c:320:25: error: expected ';' before '}' token
     320 |                 return 0
         |                         ^
         |                         ;
     321 |         } else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
         |         ~                


vim +320 drivers/media/usb/uvc/uvc_video.c

   289	
   290	static int uvc_get_video_ctrl(struct uvc_streaming *stream,
   291		struct uvc_streaming_control *ctrl, int probe, u8 query)
   292	{
   293		u16 size = uvc_video_ctrl_size(stream);
   294		u8 *data __free(kfree) = NULL;
   295		int ret;
   296	
   297		if ((stream->dev->quirks & UVC_QUIRK_PROBE_DEF) &&
   298				query == UVC_GET_DEF)
   299			return -EIO;
   300	
   301		data = kmalloc(size, GFP_KERNEL);
   302		if (data == NULL)
   303			return -ENOMEM;
   304	
   305		ret = __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
   306			probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
   307			size, uvc_timeout_param);
   308	
   309		if ((query == UVC_GET_MIN || query == UVC_GET_MAX) && ret == 2) {
   310			/*
   311			 * Some cameras, mostly based on Bison Electronics chipsets,
   312			 * answer a GET_MIN or GET_MAX request with the wCompQuality
   313			 * field only.
   314			 */
   315			uvc_warn_once(stream->dev, UVC_WARN_MINMAX, "UVC non "
   316				"compliance - GET_MIN/MAX(PROBE) incorrectly "
   317				"supported. Enabling workaround.\n");
   318			memset(ctrl, 0, sizeof(*ctrl));
   319			ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
 > 320			return 0
   321		} else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
   322			/*
   323			 * Many cameras don't support the GET_DEF request on their
   324			 * video probe control. Warn once and return, the caller will
   325			 * fall back to GET_CUR.
   326			 */
   327			uvc_warn_once(stream->dev, UVC_WARN_PROBE_DEF, "UVC non "
   328				"compliance - GET_DEF(PROBE) not supported. "
   329				"Enabling workaround.\n");
   330			return -EIO;
   331		} else if (ret != size) {
   332			dev_err(&stream->intf->dev,
   333				"Failed to query (%s) UVC %s control : %d (exp. %u).\n",
   334				uvc_query_name(query), probe ? "probe" : "commit",
   335				ret, size);
   336			return (ret == -EPROTO) ? -EPROTO : -EIO;
   337		}
   338	
   339		ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
   340		ctrl->bFormatIndex = data[2];
   341		ctrl->bFrameIndex = data[3];
   342		ctrl->dwFrameInterval = le32_to_cpup((__le32 *)&data[4]);
   343		ctrl->wKeyFrameRate = le16_to_cpup((__le16 *)&data[8]);
   344		ctrl->wPFrameRate = le16_to_cpup((__le16 *)&data[10]);
   345		ctrl->wCompQuality = le16_to_cpup((__le16 *)&data[12]);
   346		ctrl->wCompWindowSize = le16_to_cpup((__le16 *)&data[14]);
   347		ctrl->wDelay = le16_to_cpup((__le16 *)&data[16]);
   348		ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
   349		ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
   350	
   351		if (size >= 34) {
   352			ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
   353			ctrl->bmFramingInfo = data[30];
   354			ctrl->bPreferedVersion = data[31];
   355			ctrl->bMinVersion = data[32];
   356			ctrl->bMaxVersion = data[33];
   357		} else {
   358			ctrl->dwClockFrequency = stream->dev->clock_frequency;
   359			ctrl->bmFramingInfo = 0;
   360			ctrl->bPreferedVersion = 0;
   361			ctrl->bMinVersion = 0;
   362			ctrl->bMaxVersion = 0;
   363		}
   364	
   365		/*
   366		 * Some broken devices return null or wrong dwMaxVideoFrameSize and
   367		 * dwMaxPayloadTransferSize fields. Try to get the value from the
   368		 * format and frame descriptors.
   369		 */
   370		uvc_fixup_video_ctrl(stream, ctrl);
   371	
   372		return 0;
   373	}
   374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


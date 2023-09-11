Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F8D79A585
	for <lists+linux-media@lfdr.de>; Mon, 11 Sep 2023 10:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233175AbjIKIHs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 04:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbjIKIHr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 04:07:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A7B170E;
        Mon, 11 Sep 2023 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694419635; x=1725955635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RtcrzKvQgWVJXzkVTU/sS1Qaz92emNFsoglMfEEOXws=;
  b=dSpYn93BrRwFOk40/52W2zq6OzQEb8qnMaU/PdhIPJhiqTRRhy3ui7o0
   07xGR/xbCXSQrjihm1d3dSUhfshN4JP6Kn0//m0H+Zf8lYjhZzSSAKQ/o
   jk+K+1Juojm7vyNAXgOOCaKuJN1Ug5TBPoA9kudSWaxhUtxIMYtKjTjr3
   iAhIUKRdHWlEtBRjj4KOqC5bVjx+K599RatmP/BVhZd8bhIS57PIvuS1m
   A/li9NwV++5gnbaUDsUVUpBDXIQcI31jJbOdly2wM+jNBtU9Pau2rOumj
   9SUbctRqYwBEdRN7xpqphSrkQumadkqMHzGW9wXt95GedCVdAeyz6F6gP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="363047272"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="363047272"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 01:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="866850648"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="866850648"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Sep 2023 01:06:47 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qfbwS-0005yf-35;
        Mon, 11 Sep 2023 08:06:44 +0000
Date:   Mon, 11 Sep 2023 16:05:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        laurent.pinchart@ideasonboard.com
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
        gregkh@linuxfoundation.org, nicolas@ndufresne.ca,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/3] usb: gadget: uvc: stop pump thread on video disable
Message-ID: <202309111506.64B9KHI7-lkp@intel.com>
References: <20230911002451.2860049-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911002451.2860049-2-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus westeri-thunderbolt/next media-tree/master linus/master v6.6-rc1 next-20230911]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Grzeschik/usb-gadget-uvc-stop-pump-thread-on-video-disable/20230911-082623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230911002451.2860049-2-m.grzeschik%40pengutronix.de
patch subject: [PATCH 1/3] usb: gadget: uvc: stop pump thread on video disable
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230911/202309111506.64B9KHI7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111506.64B9KHI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111506.64B9KHI7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/gadget/function/uvc_video.c: In function 'uvcg_video_enable':
>> drivers/usb/gadget/function/uvc_video.c:502:17: error: 'uvc' undeclared (first use in this function)
     502 |                 uvc->state = UVC_STATE_CONNECTED;
         |                 ^~~
   drivers/usb/gadget/function/uvc_video.c:502:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/uvc +502 drivers/usb/gadget/function/uvc_video.c

   486	
   487	/*
   488	 * Enable or disable the video stream.
   489	 */
   490	int uvcg_video_enable(struct uvc_video *video, int enable)
   491	{
   492		unsigned int i;
   493		int ret;
   494	
   495		if (video->ep == NULL) {
   496			uvcg_info(&video->uvc->func,
   497				  "Video enable failed, device is uninitialized.\n");
   498			return -ENODEV;
   499		}
   500	
   501		if (!enable) {
 > 502			uvc->state = UVC_STATE_CONNECTED;
   503	
   504			cancel_work_sync(&video->pump);
   505			uvcg_queue_cancel(&video->queue, 0);
   506	
   507			for (i = 0; i < video->uvc_num_requests; ++i)
   508				if (video->ureq && video->ureq[i].req)
   509					usb_ep_dequeue(video->ep, video->ureq[i].req);
   510	
   511			uvc_video_free_requests(video);
   512			uvcg_queue_enable(&video->queue, 0);
   513			return 0;
   514		}
   515	
   516		if ((ret = uvcg_queue_enable(&video->queue, 1)) < 0)
   517			return ret;
   518	
   519		if ((ret = uvc_video_alloc_requests(video)) < 0)
   520			return ret;
   521	
   522		if (video->max_payload_size) {
   523			video->encode = uvc_video_encode_bulk;
   524			video->payload_size = 0;
   525		} else
   526			video->encode = video->queue.use_sg ?
   527				uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
   528	
   529		uvc->state = UVC_STATE_STREAMING;
   530	
   531		video->req_int_count = 0;
   532	
   533		queue_work(video->async_wq, &video->pump);
   534	
   535		return ret;
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

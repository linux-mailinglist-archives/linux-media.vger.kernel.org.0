Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5131C5D04
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 18:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729289AbgEEQIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 12:08:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:15558 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728804AbgEEQIk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 12:08:40 -0400
IronPort-SDR: /KlQygJ35N16zWxdr3DP6dGaVCAfw9TTpebR/kpEWOSloa5dWhFLzxmLCGARKGNsLETk8RuDlI
 1QdGrrjM2UDQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2020 09:08:39 -0700
IronPort-SDR: tgbAVapRBB6JIOk0B2uOROiorBQLh4mv4ID14N42bIb5ifp85UIZdjREN4BLIyBSZ/znz8tAiB
 URoZXT0rNa2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,355,1583222400"; 
   d="scan'208";a="284302668"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 May 2020 09:08:37 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jW07Y-000CXf-Dg; Wed, 06 May 2020 00:08:36 +0800
Date:   Wed, 6 May 2020 00:07:37 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 15/34] staging: mmal-vchiq: Use vc-sm-cma to support
 zero copy
Message-ID: <202005060033.fVqn7hFL%lkp@intel.com>
References: <20200504092611.9798-16-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504092611.9798-16-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.7-rc4]
[cannot apply to linuxtv-media/master anholt/for-next next-20200505]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Laurent-Pinchart/Drivers-for-the-BCM283x-CSI-2-CCP2-receiver-and-ISP/20200505-054310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9851a0dee7c28514f149f7e4f60ec1b06286cc1b
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1796:36: sparse: sparse: Using plain integer as NULL pointer
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:472:48: sparse: sparse: non size-preserving integer to pointer cast

vim +1796 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c

  1779	
  1780	int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
  1781	{
  1782		struct mmal_msg_context *msg_context = buf->msg_context;
  1783	
  1784		if (msg_context)
  1785			release_msg_context(msg_context);
  1786		buf->msg_context = NULL;
  1787	
  1788		if (buf->vcsm_handle) {
  1789			int ret;
  1790	
  1791			pr_debug("%s: vc_sm_cma_free on handle %p\n", __func__,
  1792				 buf->vcsm_handle);
  1793			ret = vc_sm_cma_free(buf->vcsm_handle);
  1794			if (ret)
  1795				pr_err("%s: vcsm_free failed, ret %d\n", __func__, ret);
> 1796			buf->vcsm_handle = 0;
  1797		}
  1798		return 0;
  1799	}
  1800	EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
  1801	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

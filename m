Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B2F1C6616
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 04:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgEFCzR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 22:55:17 -0400
Received: from mga05.intel.com ([192.55.52.43]:20284 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgEFCzQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 22:55:16 -0400
IronPort-SDR: ZRmIWABGCMBtKxwVyw2P+Gy/zxKq8crzrNqCt7Ika1broQp5WRBeAQffZufJlkdUd84Lhvt8LV
 Kxai5RuSFLgA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2020 19:55:14 -0700
IronPort-SDR: FbyDQkqVD/EFys3GGNwE6nA95jiOjDTCP5sUiWITvMObf7dJwyfCKHno50b3ZkCNA2GzqOPoJK
 H9xxFaG/NtWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,357,1583222400"; 
   d="scan'208";a="338858176"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020) ([10.239.159.140])
  by orsmga001.jf.intel.com with ESMTP; 05 May 2020 19:55:12 -0700
Date:   Wed, 6 May 2020 11:05:20 +0800
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
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma driver
Message-ID: <20200506030520.GA25800@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504092611.9798-7-laurent.pinchart@ideasonboard.com>
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
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.h:60:21: sparse: sparse: dubious one-bit signed bitfield
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.h:61:23: sparse: sparse: dubious one-bit signed bitfield
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1265:24: sparse: sparse: undefined identifier 'dmac_flush_range'
--
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:474:55: sparse: sparse: Using plain integer as NULL pointer
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:503:59: sparse: sparse: Using plain integer as NULL pointer

# https://github.com/0day-ci/linux/commit/5f041a24bca6d9babfbb0e35b8e2f7cea4cf933b
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5f041a24bca6d9babfbb0e35b8e2f7cea4cf933b
vim +60 drivers/staging/vc04_services/vc-sm-cma/vc_sm.h

5f041a24bca6d9 Dave Stevenson 2020-05-04  43  
5f041a24bca6d9 Dave Stevenson 2020-05-04  44  struct vc_sm_buffer {
5f041a24bca6d9 Dave Stevenson 2020-05-04  45  	struct list_head global_buffer_list;	/* Global list of buffers. */
5f041a24bca6d9 Dave Stevenson 2020-05-04  46  
5f041a24bca6d9 Dave Stevenson 2020-05-04  47  	/* Index in the kernel_id idr so that we can find the
5f041a24bca6d9 Dave Stevenson 2020-05-04  48  	 * mmal_msg_context again when servicing the VCHI reply.
5f041a24bca6d9 Dave Stevenson 2020-05-04  49  	 */
5f041a24bca6d9 Dave Stevenson 2020-05-04  50  	int kernel_id;
5f041a24bca6d9 Dave Stevenson 2020-05-04  51  
5f041a24bca6d9 Dave Stevenson 2020-05-04  52  	size_t size;
5f041a24bca6d9 Dave Stevenson 2020-05-04  53  
5f041a24bca6d9 Dave Stevenson 2020-05-04  54  	/* Lock over all the following state for this buffer */
5f041a24bca6d9 Dave Stevenson 2020-05-04  55  	struct mutex lock;
5f041a24bca6d9 Dave Stevenson 2020-05-04  56  	struct list_head attachments;
5f041a24bca6d9 Dave Stevenson 2020-05-04  57  
5f041a24bca6d9 Dave Stevenson 2020-05-04  58  	char name[VC_SM_MAX_NAME_LEN];
5f041a24bca6d9 Dave Stevenson 2020-05-04  59  
5f041a24bca6d9 Dave Stevenson 2020-05-04 @60  	int in_use:1;	/* Kernel is still using this resource */
5f041a24bca6d9 Dave Stevenson 2020-05-04  61  	int imported:1;	/* Imported dmabuf */
5f041a24bca6d9 Dave Stevenson 2020-05-04  62  
5f041a24bca6d9 Dave Stevenson 2020-05-04  63  	enum vc_sm_vpu_mapping_state vpu_state;
5f041a24bca6d9 Dave Stevenson 2020-05-04  64  	u32 vc_handle;	/* VideoCore handle for this buffer */
5f041a24bca6d9 Dave Stevenson 2020-05-04  65  	int vpu_allocated;	/*
5f041a24bca6d9 Dave Stevenson 2020-05-04  66  				 * The VPU made this allocation. Release the
5f041a24bca6d9 Dave Stevenson 2020-05-04  67  				 * local dma_buf when the VPU releases the
5f041a24bca6d9 Dave Stevenson 2020-05-04  68  				 * resource.
5f041a24bca6d9 Dave Stevenson 2020-05-04  69  				 */
5f041a24bca6d9 Dave Stevenson 2020-05-04  70  
5f041a24bca6d9 Dave Stevenson 2020-05-04  71  	/* DMABUF related fields */
5f041a24bca6d9 Dave Stevenson 2020-05-04  72  	struct dma_buf *dma_buf;
5f041a24bca6d9 Dave Stevenson 2020-05-04  73  	dma_addr_t dma_addr;
5f041a24bca6d9 Dave Stevenson 2020-05-04  74  	void *cookie;
5f041a24bca6d9 Dave Stevenson 2020-05-04  75  
5f041a24bca6d9 Dave Stevenson 2020-05-04  76  	struct vc_sm_privdata_t *private;
5f041a24bca6d9 Dave Stevenson 2020-05-04  77  
5f041a24bca6d9 Dave Stevenson 2020-05-04  78  	union {
5f041a24bca6d9 Dave Stevenson 2020-05-04  79  		struct vc_sm_alloc_data alloc;
5f041a24bca6d9 Dave Stevenson 2020-05-04  80  		struct vc_sm_imported import;
5f041a24bca6d9 Dave Stevenson 2020-05-04  81  	};
5f041a24bca6d9 Dave Stevenson 2020-05-04  82  };
5f041a24bca6d9 Dave Stevenson 2020-05-04  83  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


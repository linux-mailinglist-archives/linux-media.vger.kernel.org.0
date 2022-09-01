Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2334D5AA0B4
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 22:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234846AbiIAULI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 16:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234856AbiIAUK6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 16:10:58 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882FA52DC4
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 13:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662063056; x=1693599056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j+ynEftF8w9TqUwtQOh56/Xlk2Y68ZgIoOpeQK9nxMg=;
  b=hLiTbSrquvNzKmQb6UFaDQH5EsRXyY3oZc79rK4VZOAu+ZLUIddRm1KY
   dpqv2f9zYrnHFBR9k7LR7gTvXKRvKZ6llXuRrJpUCJVot+w4YgLlhocXf
   pbrVEpaDmyM6lJh92w3xfaFHF/ZrZ+s6cfnIZcdXcspo233psCWuVkN9c
   LDAsvBoyZZL4fuaVMKx5k6aCiGq/Us8NDjeGGmFpho0kb5DL/hPzrwJfw
   Jm33q7zbOuPrLM6NGiM+/gl8br0oGDalUYCzb0yFdwgwHXhXgaQQ3eGSM
   vbwQQC25VOSHbmrlidqmqK1YGmWo7UqyJJoo8r/prJGgurXhv/SJGucWv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="321972381"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="321972381"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 13:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="940992607"
Received: from lkp-server02.sh.intel.com (HELO b138c9e8658c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2022 13:10:54 -0700
Received: from kbuild by b138c9e8658c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTqWb-0000jH-2j;
        Thu, 01 Sep 2022 20:10:53 +0000
Date:   Fri, 2 Sep 2022 04:10:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [linux-next:master 3176/4736]
 drivers/staging/media/deprecated/cpia2/cpia2_usb.c:80:13: warning: variable
 'frame_count' set but not used
Message-ID: <202209020437.eXEOdmfe-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
commit: be8cebc46d9d38166a1b3fda22a018ae52b0928e [3176/4736] media: cpia2: deprecate this driver
config: riscv-randconfig-r026-20220901 (https://download.01.org/0day-ci/archive/20220902/202209020437.eXEOdmfe-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=be8cebc46d9d38166a1b3fda22a018ae52b0928e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout be8cebc46d9d38166a1b3fda22a018ae52b0928e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/staging/media/deprecated/cpia2/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/staging/media/deprecated/cpia2/cpia2_usb.c:80:13: warning: variable 'frame_count' set but not used [-Wunused-but-set-variable]
           static int frame_count;
                      ^
   1 warning generated.


vim +/frame_count +80 drivers/staging/media/deprecated/cpia2/cpia2_usb.c

ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   71  
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   72  
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   73  /******************************************************************************
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   74   *
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   75   *  process_frame
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   76   *
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   77   *****************************************************************************/
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   78  static void process_frame(struct camera_data *cam)
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   79  {
ff699e6bd02eb1c drivers/media/video/cpia2/cpia2_usb.c Douglas Schilling Landgraf 2008-04-22  @80  	static int frame_count;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   81  
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   82  	unsigned char *inbuff = cam->workbuff->data;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   83  
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   84  	DBG("Processing frame #%d, current:%d\n",
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   85  	    cam->workbuff->num, cam->curbuff->num);
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   86  
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   87  	if(cam->workbuff->length > cam->workbuff->max_length)
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   88  		cam->workbuff->max_length = cam->workbuff->length;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   89  
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   90  	if ((inbuff[0] == 0xFF) && (inbuff[1] == 0xD8)) {
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   91  		frame_count++;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   92  	} else {
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   93  		cam->workbuff->status = FRAME_ERROR;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   94  		DBG("Start of frame not found\n");
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   95  		return;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   96  	}
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   97  
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   98  	/***
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27   99  	 * Now the output buffer should have a JPEG image in it.
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  100  	 ***/
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  101  	if(!cam->first_image_seen) {
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  102  		/* Always skip the first image after streaming
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  103  		 * starts. It is almost certainly corrupt. */
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  104  		cam->first_image_seen = 1;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  105  		cam->workbuff->status = FRAME_EMPTY;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  106  		return;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  107  	}
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  108  	if (cam->workbuff->length > 3) {
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  109  		if(cam->mmapped &&
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  110  		   cam->workbuff->length < cam->workbuff->max_length) {
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  111  			/* No junk in the buffers */
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  112  			memset(cam->workbuff->data+cam->workbuff->length,
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  113  			       0, cam->workbuff->max_length-
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  114  				  cam->workbuff->length);
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  115  		}
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  116  		cam->workbuff->max_length = cam->workbuff->length;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  117  		cam->workbuff->status = FRAME_READY;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  118  
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  119  		if(!cam->mmapped && cam->num_frames > 2) {
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  120  			/* During normal reading, the most recent
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  121  			 * frame will be read.  If the current frame
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  122  			 * hasn't started reading yet, it will never
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  123  			 * be read, so mark it empty.  If the buffer is
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  124  			 * mmapped, or we have few buffers, we need to
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  125  			 * wait for the user to free the buffer.
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  126  			 *
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  127  			 * NOTE: This is not entirely foolproof with 3
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  128  			 * buffers, but it would take an EXTREMELY
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  129  			 * overloaded system to cause problems (possible
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  130  			 * image data corruption).  Basically, it would
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  131  			 * need to take more time to execute cpia2_read
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  132  			 * than it would for the camera to send
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  133  			 * cam->num_frames-2 frames before problems
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  134  			 * could occur.
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  135  			 */
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  136  			cam->curbuff->status = FRAME_EMPTY;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  137  		}
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  138  		cam->curbuff = cam->workbuff;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  139  		cam->workbuff = cam->workbuff->next;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  140  		DBG("Changed buffers, work:%d, current:%d\n",
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  141  		    cam->workbuff->num, cam->curbuff->num);
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  142  		return;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  143  	} else {
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  144  		DBG("Not enough data for an image.\n");
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  145  	}
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  146  
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  147  	cam->workbuff->status = FRAME_ERROR;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  148  	return;
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  149  }
ab33d5071de7a33 drivers/media/video/cpia2/cpia2_usb.c Alan Cox                   2006-02-27  150  

:::::: The code at line 80 was first introduced by commit
:::::: ff699e6bd02eb1c6d02c7c2b576c2ee6caab201c V4L/DVB (7094):  static memory

:::::: TO: Douglas Schilling Landgraf <dougsland@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

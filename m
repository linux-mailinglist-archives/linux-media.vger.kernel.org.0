Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B392B52ADB6
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 23:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbiEQV7H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 17:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiEQV7G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 17:59:06 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABFD50E2D
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 14:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652824745; x=1684360745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bU7P64m3XU7JmtxUjymiBegLYYur7NYID41OGbEvWXw=;
  b=LcVHcbvNu/bRH+Hi9pkXNVIM0wVhhDmNo+AylkWv4tiQsRA3StFN+SkM
   S84XpAHkEWXe+3gAaZkoYz/72XxnqniRgd0dq7bIud1DnzSvRNhPuyfdT
   DA+nYNYGjUaNNHMhPgMP5q8gs+J2qTp+J839Up3hB2X2THIA+TvPc74kH
   gfDw/s6xEUhS4h+GCNgU6u4QyvujyICZsYiLR86C2KV/yDXkl4Sy+B+zW
   plR0IkpcOwF6gQZecxC5RDrB6Pi06hK+8eVa5itxv65IWYlHFXOkZ0bra
   oeWynDO/BNrFv+cKVyQmU0grGcHL49PEQA0BEpWEwQVtTBzIoUtfZ5Vac
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271041632"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="271041632"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 14:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="626692062"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 May 2022 14:59:03 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nr5Da-0001Tr-ED;
        Tue, 17 May 2022 21:59:02 +0000
Date:   Wed, 18 May 2022 05:58:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Oliver Neukum <oneukum@suse.com>, linux-media@vger.kernel.org,
        mchehab@kernel.org, crope@iki.fi
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] airspy: respect the DMA coherency rules
Message-ID: <202205180516.aJrehmYZ-lkp@intel.com>
References: <20220517110903.25491-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517110903.25491-1-oneukum@suse.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Oliver,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc7 next-20220517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/airspy-respect-the-DMA-coherency-rules/20220517-191203
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-a006-20220516 (https://download.01.org/0day-ci/archive/20220518/202205180516.aJrehmYZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1001f475c1972ae2ab2be36a64d723f12c56786d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oliver-Neukum/airspy-respect-the-DMA-coherency-rules/20220517-191203
        git checkout 1001f475c1972ae2ab2be36a64d723f12c56786d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/usb/airspy/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/usb/airspy/airspy.c:979:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!buf)
               ^~~~
   drivers/media/usb/airspy/airspy.c:1082:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/media/usb/airspy/airspy.c:979:2: note: remove the 'if' if its condition is always false
           if (!buf)
           ^~~~~~~~~
   drivers/media/usb/airspy/airspy.c:976:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!s->buf)
               ^~~~~~~
   drivers/media/usb/airspy/airspy.c:1082:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/media/usb/airspy/airspy.c:976:2: note: remove the 'if' if its condition is always false
           if (!s->buf)
           ^~~~~~~~~~~~
   drivers/media/usb/airspy/airspy.c:966:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   2 warnings generated.


vim +979 drivers/media/usb/airspy/airspy.c

   961	
   962	static int airspy_probe(struct usb_interface *intf,
   963			const struct usb_device_id *id)
   964	{
   965		struct airspy *s;
   966		int ret;
   967		u8 u8tmp, *buf = NULL;
   968	
   969		s = kzalloc(sizeof(struct airspy), GFP_KERNEL);
   970		if (s == NULL) {
   971			dev_err(&intf->dev, "Could not allocate memory for state\n");
   972			return -ENOMEM;
   973		}
   974	
   975		s->buf = kzalloc(BUF_SIZE, GFP_KERNEL);
   976		if (!s->buf)
   977			goto err_free_mem;
   978		buf = kzalloc(BUF_SIZE, GFP_KERNEL);
 > 979		if (!buf)
   980			goto err_free_mem;
   981	
   982		mutex_init(&s->v4l2_lock);
   983		mutex_init(&s->vb_queue_lock);
   984		spin_lock_init(&s->queued_bufs_lock);
   985		INIT_LIST_HEAD(&s->queued_bufs);
   986		s->dev = &intf->dev;
   987		s->udev = interface_to_usbdev(intf);
   988		s->f_adc = bands[0].rangelow;
   989		s->f_rf = bands_rf[0].rangelow;
   990		s->pixelformat = formats[0].pixelformat;
   991		s->buffersize = formats[0].buffersize;
   992	
   993		/* Detect device */
   994		ret = airspy_ctrl_msg(s, CMD_BOARD_ID_READ, 0, 0, &u8tmp, 1);
   995		if (ret == 0)
   996			ret = airspy_ctrl_msg(s, CMD_VERSION_STRING_READ, 0, 0,
   997					buf, BUF_SIZE);
   998		if (ret) {
   999			dev_err(s->dev, "Could not detect board\n");
  1000			goto err_free_mem;
  1001		}
  1002	
  1003		buf[BUF_SIZE - 1] = '\0';
  1004	
  1005		dev_info(s->dev, "Board ID: %02x\n", u8tmp);
  1006		dev_info(s->dev, "Firmware version: %s\n", buf);
  1007	
  1008		/* Init videobuf2 queue structure */
  1009		s->vb_queue.type = V4L2_BUF_TYPE_SDR_CAPTURE;
  1010		s->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
  1011		s->vb_queue.drv_priv = s;
  1012		s->vb_queue.buf_struct_size = sizeof(struct airspy_frame_buf);
  1013		s->vb_queue.ops = &airspy_vb2_ops;
  1014		s->vb_queue.mem_ops = &vb2_vmalloc_memops;
  1015		s->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
  1016		ret = vb2_queue_init(&s->vb_queue);
  1017		if (ret) {
  1018			dev_err(s->dev, "Could not initialize vb2 queue\n");
  1019			goto err_free_mem;
  1020		}
  1021	
  1022		/* Init video_device structure */
  1023		s->vdev = airspy_template;
  1024		s->vdev.queue = &s->vb_queue;
  1025		s->vdev.queue->lock = &s->vb_queue_lock;
  1026		video_set_drvdata(&s->vdev, s);
  1027	
  1028		/* Register the v4l2_device structure */
  1029		s->v4l2_dev.release = airspy_video_release;
  1030		ret = v4l2_device_register(&intf->dev, &s->v4l2_dev);
  1031		if (ret) {
  1032			dev_err(s->dev, "Failed to register v4l2-device (%d)\n", ret);
  1033			goto err_free_mem;
  1034		}
  1035	
  1036		/* Register controls */
  1037		v4l2_ctrl_handler_init(&s->hdl, 5);
  1038		s->lna_gain_auto = v4l2_ctrl_new_std(&s->hdl, &airspy_ctrl_ops,
  1039				V4L2_CID_RF_TUNER_LNA_GAIN_AUTO, 0, 1, 1, 0);
  1040		s->lna_gain = v4l2_ctrl_new_std(&s->hdl, &airspy_ctrl_ops,
  1041				V4L2_CID_RF_TUNER_LNA_GAIN, 0, 14, 1, 8);
  1042		v4l2_ctrl_auto_cluster(2, &s->lna_gain_auto, 0, false);
  1043		s->mixer_gain_auto = v4l2_ctrl_new_std(&s->hdl, &airspy_ctrl_ops,
  1044				V4L2_CID_RF_TUNER_MIXER_GAIN_AUTO, 0, 1, 1, 0);
  1045		s->mixer_gain = v4l2_ctrl_new_std(&s->hdl, &airspy_ctrl_ops,
  1046				V4L2_CID_RF_TUNER_MIXER_GAIN, 0, 15, 1, 8);
  1047		v4l2_ctrl_auto_cluster(2, &s->mixer_gain_auto, 0, false);
  1048		s->if_gain = v4l2_ctrl_new_std(&s->hdl, &airspy_ctrl_ops,
  1049				V4L2_CID_RF_TUNER_IF_GAIN, 0, 15, 1, 0);
  1050		if (s->hdl.error) {
  1051			ret = s->hdl.error;
  1052			dev_err(s->dev, "Could not initialize controls\n");
  1053			goto err_free_controls;
  1054		}
  1055	
  1056		v4l2_ctrl_handler_setup(&s->hdl);
  1057	
  1058		s->v4l2_dev.ctrl_handler = &s->hdl;
  1059		s->vdev.v4l2_dev = &s->v4l2_dev;
  1060		s->vdev.lock = &s->v4l2_lock;
  1061		s->vdev.device_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_STREAMING |
  1062				      V4L2_CAP_READWRITE | V4L2_CAP_TUNER;
  1063	
  1064		ret = video_register_device(&s->vdev, VFL_TYPE_SDR, -1);
  1065		if (ret) {
  1066			dev_err(s->dev, "Failed to register as video device (%d)\n",
  1067					ret);
  1068			goto err_free_controls;
  1069		}
  1070		dev_info(s->dev, "Registered as %s\n",
  1071				video_device_node_name(&s->vdev));
  1072		dev_notice(s->dev, "SDR API is still slightly experimental and functionality changes may follow\n");
  1073		return 0;
  1074	
  1075	err_free_controls:
  1076		v4l2_ctrl_handler_free(&s->hdl);
  1077		v4l2_device_unregister(&s->v4l2_dev);
  1078	err_free_mem:
  1079		kfree(buf);
  1080		kfree(s->buf);
  1081		kfree(s);
  1082		return ret;
  1083	}
  1084	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

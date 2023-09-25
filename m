Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF927AD6F5
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 13:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbjIYL0C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 07:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjIYL0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 07:26:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F16E9C6
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 04:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695641151; x=1727177151;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1JsaRB3eME+Z5ZAdfrcahe5WnRAgYoqfonarCQHIU4g=;
  b=fNeBshLBxf36b5TSQQSAcF6M1qJ8cMLUBEnM/PI9chC2qBYTmFb0LZIt
   wYY3EGwBaBsiEXVa1Z22k14Zaxa+CN6+99LgLYKyASSIr7oZ5UUcWU1dP
   FJ2L9WFHHqswqQbkSgLBOkfIoODr21xf9tJwxodT46HxvPOuMmddgpbYu
   LfgkSkhpVXq4eSCClZSYrKcnQyAVVYaLqI/XamU4PXAOuJ02b3luTZKVP
   wN/9PfkzNG9rOQqnKdFfC4Bv8fd/fx1zd6wIgX+Ship3JdyR0IF48TI8l
   6S8ypz808q1ODAWNkDZDJsL/XuN+hEIWsSxXoMKpDZZdsPvaufpoOmLoE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360608382"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="360608382"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 04:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079175116"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="1079175116"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2023 04:25:49 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qkjil-0001SP-0I;
        Mon, 25 Sep 2023 11:25:47 +0000
Date:   Mon, 25 Sep 2023 19:24:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 34/37]
 drivers/media/v4l2-core/v4l2-subdev.c:947:3: warning: '__fallthrough__'
 attribute ignored
Message-ID: <202309251952.7pfvmMSd-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   ebf82dae7b9f13add29d642c4b7c3d50fdc4fad8
commit: 7bd83fc59acad8c10bad2fa3c9433a4cb118ec5b [34/37] media: v4l: subdev: Add trivial set_routing support
config: i386-randconfig-002-20230925 (https://download.01.org/0day-ci/archive/20230925/202309251952.7pfvmMSd-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309251952.7pfvmMSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309251952.7pfvmMSd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-subdev.c: In function 'subdev_do_ioctl':
>> drivers/media/v4l2-core/v4l2-subdev.c:947:3: warning: '__fallthrough__' attribute ignored [-Wattributes]
      fallthrough;
      ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:890:32: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case VIDIOC_SUBDEV_S_ROUTING: {
                                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:946:1: note: here
    do_vidioc_subdev_g_routing:
    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__fallthrough__ +947 drivers/media/v4l2-core/v4l2-subdev.c

bcd158de94238d drivers/media/video/v4l2-subdev.c     Sylwester Nawrocki 2011-10-01   665  
42194e728f067c drivers/media/video/v4l2-subdev.c     Hans Verkuil       2012-02-02   666  	case VIDIOC_LOG_STATUS: {
42194e728f067c drivers/media/video/v4l2-subdev.c     Hans Verkuil       2012-02-02   667  		int ret;
42194e728f067c drivers/media/video/v4l2-subdev.c     Hans Verkuil       2012-02-02   668  
42194e728f067c drivers/media/video/v4l2-subdev.c     Hans Verkuil       2012-02-02   669  		pr_info("%s: =================  START STATUS  =================\n",
42194e728f067c drivers/media/video/v4l2-subdev.c     Hans Verkuil       2012-02-02   670  			sd->name);
42194e728f067c drivers/media/video/v4l2-subdev.c     Hans Verkuil       2012-02-02   671  		ret = v4l2_subdev_call(sd, core, log_status);
42194e728f067c drivers/media/video/v4l2-subdev.c     Hans Verkuil       2012-02-02   672  		pr_info("%s: ==================  END STATUS  ==================\n",
42194e728f067c drivers/media/video/v4l2-subdev.c     Hans Verkuil       2012-02-02   673  			sd->name);
42194e728f067c drivers/media/video/v4l2-subdev.c     Hans Verkuil       2012-02-02   674  		return ret;
42194e728f067c drivers/media/video/v4l2-subdev.c     Hans Verkuil       2012-02-02   675  	}
bcd158de94238d drivers/media/video/v4l2-subdev.c     Sylwester Nawrocki 2011-10-01   676  
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   677  	case VIDIOC_SUBDEV_G_FMT: {
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   678  		struct v4l2_subdev_format *format = arg;
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   679  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   680  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   681  			format->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   682  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   683  		memset(format->reserved, 0, sizeof(format->reserved));
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   684  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
3cc7a4bbc3817e drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2022-04-12   685  		return v4l2_subdev_call(sd, pad, get_fmt, state, format);
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   686  	}
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   687  
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   688  	case VIDIOC_SUBDEV_S_FMT: {
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   689  		struct v4l2_subdev_format *format = arg;
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   690  
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   691  		if (format->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   692  			return -EPERM;
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   693  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   694  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   695  			format->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   696  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   697  		memset(format->reserved, 0, sizeof(format->reserved));
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   698  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
3cc7a4bbc3817e drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2022-04-12   699  		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   700  	}
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   701  
f6a5cb1be89446 drivers/media/video/v4l2-subdev.c     Antti Koskipaa     2010-06-23   702  	case VIDIOC_SUBDEV_G_CROP: {
f6a5cb1be89446 drivers/media/video/v4l2-subdev.c     Antti Koskipaa     2010-06-23   703  		struct v4l2_subdev_crop *crop = arg;
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   704  		struct v4l2_subdev_selection sel;
f6a5cb1be89446 drivers/media/video/v4l2-subdev.c     Antti Koskipaa     2010-06-23   705  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   706  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   707  			crop->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   708  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   709  		memset(crop->reserved, 0, sizeof(crop->reserved));
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   710  		memset(&sel, 0, sizeof(sel));
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   711  		sel.which = crop->which;
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   712  		sel.pad = crop->pad;
5689b28890f4a7 drivers/media/video/v4l2-subdev.c     Sakari Ailus       2012-05-18   713  		sel.target = V4L2_SEL_TGT_CROP;
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   714  
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   715  		rval = v4l2_subdev_call(
3cc7a4bbc3817e drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2022-04-12   716  			sd, pad, get_selection, state, &sel);
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   717  
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   718  		crop->rect = sel.r;
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   719  
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   720  		return rval;
f6a5cb1be89446 drivers/media/video/v4l2-subdev.c     Antti Koskipaa     2010-06-23   721  	}
f6a5cb1be89446 drivers/media/video/v4l2-subdev.c     Antti Koskipaa     2010-06-23   722  
f6a5cb1be89446 drivers/media/video/v4l2-subdev.c     Antti Koskipaa     2010-06-23   723  	case VIDIOC_SUBDEV_S_CROP: {
f6a5cb1be89446 drivers/media/video/v4l2-subdev.c     Antti Koskipaa     2010-06-23   724  		struct v4l2_subdev_crop *crop = arg;
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   725  		struct v4l2_subdev_selection sel;
f6a5cb1be89446 drivers/media/video/v4l2-subdev.c     Antti Koskipaa     2010-06-23   726  
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   727  		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   728  			return -EPERM;
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   729  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   730  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   731  			crop->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   732  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   733  		memset(crop->reserved, 0, sizeof(crop->reserved));
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   734  		memset(&sel, 0, sizeof(sel));
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   735  		sel.which = crop->which;
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   736  		sel.pad = crop->pad;
5689b28890f4a7 drivers/media/video/v4l2-subdev.c     Sakari Ailus       2012-05-18   737  		sel.target = V4L2_SEL_TGT_CROP;
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   738  		sel.r = crop->rect;
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   739  
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   740  		rval = v4l2_subdev_call(
3cc7a4bbc3817e drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2022-04-12   741  			sd, pad, set_selection, state, &sel);
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   742  
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   743  		crop->rect = sel.r;
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   744  
5b9d770fa3f5cf drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-11-14   745  		return rval;
f6a5cb1be89446 drivers/media/video/v4l2-subdev.c     Antti Koskipaa     2010-06-23   746  	}
f6a5cb1be89446 drivers/media/video/v4l2-subdev.c     Antti Koskipaa     2010-06-23   747  
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   748  	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   749  		struct v4l2_subdev_mbus_code_enum *code = arg;
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   750  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   751  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   752  			code->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   753  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   754  		memset(code->reserved, 0, sizeof(code->reserved));
3cc7a4bbc3817e drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2022-04-12   755  		return v4l2_subdev_call(sd, pad, enum_mbus_code, state,
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   756  					code);
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   757  	}
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   758  
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   759  	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   760  		struct v4l2_subdev_frame_size_enum *fse = arg;
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   761  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   762  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   763  			fse->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   764  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   765  		memset(fse->reserved, 0, sizeof(fse->reserved));
3cc7a4bbc3817e drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2022-04-12   766  		return v4l2_subdev_call(sd, pad, enum_frame_size, state,
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   767  					fse);
333c8b97785d5a drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-03-15   768  	}
35c3017a29d278 drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-05-05   769  
743e18377cae64 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2013-04-22   770  	case VIDIOC_SUBDEV_G_FRAME_INTERVAL: {
743e18377cae64 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2013-04-22   771  		struct v4l2_subdev_frame_interval *fi = arg;
743e18377cae64 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2013-04-22   772  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   773  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   774  			fi->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   775  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   776  		memset(fi->reserved, 0, sizeof(fi->reserved));
35c3017a29d278 drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-05-05   777  		return v4l2_subdev_call(sd, video, g_frame_interval, arg);
743e18377cae64 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2013-04-22   778  	}
743e18377cae64 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2013-04-22   779  
743e18377cae64 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2013-04-22   780  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
743e18377cae64 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2013-04-22   781  		struct v4l2_subdev_frame_interval *fi = arg;
743e18377cae64 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2013-04-22   782  
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   783  		if (ro_subdev)
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   784  			return -EPERM;
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   785  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   786  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   787  			fi->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   788  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   789  		memset(fi->reserved, 0, sizeof(fi->reserved));
35c3017a29d278 drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-05-05   790  		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
743e18377cae64 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2013-04-22   791  	}
35c3017a29d278 drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-05-05   792  
35c3017a29d278 drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-05-05   793  	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
35c3017a29d278 drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-05-05   794  		struct v4l2_subdev_frame_interval_enum *fie = arg;
35c3017a29d278 drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-05-05   795  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   796  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   797  			fie->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   798  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   799  		memset(fie->reserved, 0, sizeof(fie->reserved));
3cc7a4bbc3817e drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2022-04-12   800  		return v4l2_subdev_call(sd, pad, enum_frame_interval, state,
35c3017a29d278 drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-05-05   801  					fie);
35c3017a29d278 drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-05-05   802  	}
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   803  
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   804  	case VIDIOC_SUBDEV_G_SELECTION: {
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   805  		struct v4l2_subdev_selection *sel = arg;
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   806  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   807  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   808  			sel->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   809  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   810  		memset(sel->reserved, 0, sizeof(sel->reserved));
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   811  		return v4l2_subdev_call(
3cc7a4bbc3817e drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2022-04-12   812  			sd, pad, get_selection, state, sel);
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   813  	}
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   814  
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   815  	case VIDIOC_SUBDEV_S_SELECTION: {
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   816  		struct v4l2_subdev_selection *sel = arg;
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   817  
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   818  		if (sel->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   819  			return -EPERM;
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   820  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   821  		if (!client_supports_streams)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   822  			sel->stream = 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   823  
7c8a940a5ea0b0 drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2018-02-03   824  		memset(sel->reserved, 0, sizeof(sel->reserved));
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   825  		return v4l2_subdev_call(
3cc7a4bbc3817e drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2022-04-12   826  			sd, pad, set_selection, state, sel);
ae184cda8d0eeb drivers/media/video/v4l2-subdev.c     Sakari Ailus       2011-10-14   827  	}
ed45ce2cc0b31c drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2012-08-10   828  
f2e9084779d3ad drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   829  	case VIDIOC_G_EDID: {
f2e9084779d3ad drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   830  		struct v4l2_subdev_edid *edid = arg;
ed45ce2cc0b31c drivers/media/v4l2-core/v4l2-subdev.c Hans Verkuil       2012-08-10   831  
f2e9084779d3ad drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   832  		return v4l2_subdev_call(sd, pad, get_edid, edid);
f2e9084779d3ad drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   833  	}
f2e9084779d3ad drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   834  
f2e9084779d3ad drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   835  	case VIDIOC_S_EDID: {
f2e9084779d3ad drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   836  		struct v4l2_subdev_edid *edid = arg;
f2e9084779d3ad drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   837  
f2e9084779d3ad drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   838  		return v4l2_subdev_call(sd, pad, set_edid, edid);
f2e9084779d3ad drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   839  	}
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   840  
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   841  	case VIDIOC_SUBDEV_DV_TIMINGS_CAP: {
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   842  		struct v4l2_dv_timings_cap *cap = arg;
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   843  
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   844  		return v4l2_subdev_call(sd, pad, dv_timings_cap, cap);
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   845  	}
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   846  
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   847  	case VIDIOC_SUBDEV_ENUM_DV_TIMINGS: {
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   848  		struct v4l2_enum_dv_timings *dvt = arg;
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   849  
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   850  		return v4l2_subdev_call(sd, pad, enum_dv_timings, dvt);
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   851  	}
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   852  
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   853  	case VIDIOC_SUBDEV_QUERY_DV_TIMINGS:
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   854  		return v4l2_subdev_call(sd, video, query_dv_timings, arg);
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   855  
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   856  	case VIDIOC_SUBDEV_G_DV_TIMINGS:
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   857  		return v4l2_subdev_call(sd, video, g_dv_timings, arg);
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   858  
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   859  	case VIDIOC_SUBDEV_S_DV_TIMINGS:
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   860  		if (ro_subdev)
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   861  			return -EPERM;
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   862  
9cfd65e8095983 drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2014-01-29   863  		return v4l2_subdev_call(sd, video, s_dv_timings, arg);
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   864  
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   865  	case VIDIOC_SUBDEV_G_STD:
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   866  		return v4l2_subdev_call(sd, video, g_std, arg);
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   867  
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   868  	case VIDIOC_SUBDEV_S_STD: {
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   869  		v4l2_std_id *std = arg;
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   870  
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   871  		if (ro_subdev)
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   872  			return -EPERM;
f75c431e54e2e4 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   873  
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   874  		return v4l2_subdev_call(sd, video, s_std, *std);
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   875  	}
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   876  
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   877  	case VIDIOC_SUBDEV_ENUMSTD: {
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   878  		struct v4l2_standard *p = arg;
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   879  		v4l2_std_id id;
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   880  
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   881  		if (v4l2_subdev_call(sd, video, g_tvnorms, &id))
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   882  			return -EINVAL;
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   883  
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   884  		return v4l_video_std_enumstd(p, id);
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   885  	}
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   886  
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   887  	case VIDIOC_SUBDEV_QUERYSTD:
56ab8cdbc14385 drivers/media/v4l2-core/v4l2-subdev.c Niklas Söderlund   2018-05-17   888  		return v4l2_subdev_call(sd, video, querystd, arg);
fb15db8c0060e7 drivers/media/v4l2-core/v4l2-subdev.c Jacopo Mondi       2020-05-07   889  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   890  	case VIDIOC_SUBDEV_S_ROUTING: {
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   891  		struct v4l2_subdev_routing *routing = arg;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   892  		struct v4l2_subdev_route *routes =
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   893  			(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   894  		struct v4l2_subdev_krouting krouting = {};
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   895  		unsigned int i;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   896  
7bd83fc59acad8 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   897  		if (!v4l2_subdev_has_op(sd, pad, set_routing))
7bd83fc59acad8 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   898  			goto do_vidioc_subdev_g_routing;
7bd83fc59acad8 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   899  
8a54644571fed4 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-01-15   900  		if (!v4l2_subdev_enable_streams_api)
8a54644571fed4 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-01-15   901  			return -ENOIOCTLCMD;
8a54644571fed4 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-01-15   902  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   903  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   904  			return -ENOIOCTLCMD;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   905  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   906  		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   907  			return -EPERM;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   908  
f91be432a91671 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   909  		if (routing->num_routes > routing->len_routes)
f91be432a91671 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   910  			return -EINVAL;
f91be432a91671 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   911  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   912  		memset(routing->reserved, 0, sizeof(routing->reserved));
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   913  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   914  		for (i = 0; i < routing->num_routes; ++i) {
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   915  			const struct v4l2_subdev_route *route = &routes[i];
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   916  			const struct media_pad *pads = sd->entity.pads;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   917  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   918  			if (route->sink_stream > V4L2_SUBDEV_MAX_STREAM_ID ||
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   919  			    route->source_stream > V4L2_SUBDEV_MAX_STREAM_ID)
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   920  				return -EINVAL;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   921  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   922  			if (route->sink_pad >= sd->entity.num_pads)
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   923  				return -EINVAL;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   924  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   925  			if (!(pads[route->sink_pad].flags &
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   926  			      MEDIA_PAD_FL_SINK))
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   927  				return -EINVAL;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   928  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   929  			if (route->source_pad >= sd->entity.num_pads)
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   930  				return -EINVAL;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   931  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   932  			if (!(pads[route->source_pad].flags &
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   933  			      MEDIA_PAD_FL_SOURCE))
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   934  				return -EINVAL;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   935  		}
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   936  
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   937  		krouting.num_routes = routing->num_routes;
f91be432a91671 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   938  		krouting.len_routes = routing->len_routes;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   939  		krouting.routes = routes;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   940  
a4a01db3d61467 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-09-06   941  		rval = v4l2_subdev_call(sd, pad, set_routing, state,
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   942  					routing->which, &krouting);
a4a01db3d61467 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-09-06   943  		if (rval < 0)
a4a01db3d61467 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-09-06   944  			return rval;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   945  	}
7bd83fc59acad8 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   946  do_vidioc_subdev_g_routing:
a4a01db3d61467 drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-09-06  @947  		fallthrough;
a418bb3f30d9ac drivers/media/v4l2-core/v4l2-subdev.c Laurent Pinchart   2021-04-23   948  
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   949  	case VIDIOC_SUBDEV_G_ROUTING: {
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   950  		struct v4l2_subdev_routing *routing = arg;
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   951  		struct v4l2_subdev_krouting *krouting;
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   952  
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   953  		if (!v4l2_subdev_enable_streams_api)
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   954  			return -ENOIOCTLCMD;
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   955  
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   956  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   957  			return -ENOIOCTLCMD;
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   958  
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   959  		memset(routing->reserved, 0, sizeof(routing->reserved));
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   960  
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   961  		krouting = &state->routing;
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   962  
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   963  		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   964  		       krouting->routes,
637380569caf1e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-09-22   965  		       min(krouting->num_routes, krouting->len_routes) *
637380569caf1e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-09-22   966  		       sizeof(*krouting->routes));
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   967  		routing->num_routes = krouting->num_routes;
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   968  
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   969  		return 0;
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   970  	}
7b9e3975398e7e drivers/media/v4l2-core/v4l2-subdev.c Sakari Ailus       2023-08-31   971  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   972  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   973  		struct v4l2_subdev_client_capability *client_cap = arg;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   974  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   975  		client_cap->capabilities = subdev_fh->client_caps;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   976  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   977  		return 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   978  	}
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   979  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   980  	case VIDIOC_SUBDEV_S_CLIENT_CAP: {
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   981  		struct v4l2_subdev_client_capability *client_cap = arg;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   982  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   983  		/*
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   984  		 * Clear V4L2_SUBDEV_CLIENT_CAP_STREAMS if streams API is not
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   985  		 * enabled. Remove this when streams API is no longer
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   986  		 * experimental.
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   987  		 */
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   988  		if (!v4l2_subdev_enable_streams_api)
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   989  			client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   990  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   991  		/* Filter out unsupported capabilities */
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   992  		client_cap->capabilities &= V4L2_SUBDEV_CLIENT_CAP_STREAMS;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   993  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   994  		subdev_fh->client_caps = client_cap->capabilities;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   995  
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   996  		return 0;
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   997  	}
f57fa295924402 drivers/media/v4l2-core/v4l2-subdev.c Tomi Valkeinen     2023-03-23   998  
2096a5dcf9704f drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2009-12-09   999  	default:
c30b46e58b31a0 drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2010-02-26  1000  		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
2096a5dcf9704f drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2009-12-09  1001  	}
2096a5dcf9704f drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2009-12-09  1002  
2096a5dcf9704f drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2009-12-09  1003  	return 0;
2096a5dcf9704f drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2009-12-09  1004  }
2096a5dcf9704f drivers/media/video/v4l2-subdev.c     Laurent Pinchart   2009-12-09  1005  

:::::: The code at line 947 was first introduced by commit
:::::: a4a01db3d61467f70f5fc424649af18816ad2842 media: v4l: subdev: Return routes set using S_ROUTING

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

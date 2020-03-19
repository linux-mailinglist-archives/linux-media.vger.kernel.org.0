Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79AD118AE48
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 09:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgCSIZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 04:25:29 -0400
Received: from mga01.intel.com ([192.55.52.88]:59668 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgCSIZ2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 04:25:28 -0400
IronPort-SDR: V3xDiXuuevIVLB7rkD/bAG0tUnQSRz+bzwLHpOotGZUh8/ttrUFROpDkRdIwfT//c8gO+B+4Yi
 ZkzOrdn2EYBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2020 01:25:27 -0700
IronPort-SDR: ezbv3nHIeBj2vCjcfUBDzlqMZOQMonkuN95wzIjc5khHr1d7LoLhYNYf1VjzwhtvPMe1an8B1n
 HtcDG62vKheA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,570,1574150400"; 
   d="scan'208";a="238857769"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Mar 2020 01:25:16 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jEqUL-0004jm-7R; Thu, 19 Mar 2020 16:25:13 +0800
Date:   Thu, 19 Mar 2020 16:24:40 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v6 2/5] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <202003191623.S2BkroWn%lkp@intel.com>
References: <20200319004701.30416-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319004701.30416-3-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v5.6-rc6]
[also build test WARNING on next-20200318]
[cannot apply to linuxtv-media/master]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Laurent-Pinchart/v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC/20200319-084846
base:    fb33c6510d5595144d585aa194d377cf74d31911
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-181-g83789bbc-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/media/pci/ivtv/ivtv-ioctl.c:925:17: sparse: sparse: bogus scalar initializer
   drivers/media/pci/ivtv/ivtv-ioctl.c:930:17: sparse: sparse: bogus scalar initializer
   drivers/media/pci/ivtv/ivtv-ioctl.c:951:17: sparse: sparse: bogus scalar initializer
   drivers/media/pci/ivtv/ivtv-ioctl.c:956:17: sparse: sparse: bogus scalar initializer
--
>> drivers/media/pci/cx18/cx18-ioctl.c:470:58: sparse: sparse: bogus scalar initializer
   drivers/media/pci/cx18/cx18-ioctl.c:473:46: sparse: sparse: bogus scalar initializer
   drivers/media/pci/cx18/cx18-ioctl.c:476:52: sparse: sparse: bogus scalar initializer

vim +925 drivers/media/pci/ivtv/ivtv-ioctl.c

1a0adaf37c30e89 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  919  
3f038d80039f60e drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2008-05-29  920  static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc *fmt)
3f038d80039f60e drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2008-05-29  921  {
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  922  	static const struct v4l2_fmtdesc hm12 = {
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  923  		0, V4L2_BUF_TYPE_VIDEO_CAPTURE, 0,
368f080b6870e65 drivers/media/video/ivtv/ivtv-ioctl.c Ian Armstrong 2007-11-05  924  		"HM12 (YUV 4:2:0)", V4L2_PIX_FMT_HM12,
1a0adaf37c30e89 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27 @925  		{ 0, 0, 0, 0 }
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  926  	};
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  927  	static const struct v4l2_fmtdesc mpeg = {
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  928  		0, V4L2_BUF_TYPE_VIDEO_CAPTURE, V4L2_FMT_FLAG_COMPRESSED,
1a0adaf37c30e89 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  929  		"MPEG", V4L2_PIX_FMT_MPEG,
1a0adaf37c30e89 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  930  		{ 0, 0, 0, 0 }
1a0adaf37c30e89 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  931  	};
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  932  	struct ivtv *itv = fh2id(fh)->itv;
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  933  	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
1a0adaf37c30e89 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  934  
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  935  	if (fmt->index)
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  936  		return -EINVAL;
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  937  	if (s->type == IVTV_ENC_STREAM_TYPE_MPG)
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  938  		*fmt = mpeg;
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  939  	else if (s->type == IVTV_ENC_STREAM_TYPE_YUV)
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  940  		*fmt = hm12;
bfd063cebb75d33 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  941  	else
1a0adaf37c30e89 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  942  		return -EINVAL;
3f038d80039f60e drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2008-05-29  943  	return 0;
1a0adaf37c30e89 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  944  }
3f038d80039f60e drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2008-05-29  945  

:::::: The code at line 925 was first introduced by commit
:::::: 1a0adaf37c30e89e44d1470ef604a930999a5826 V4L/DVB (5345): ivtv driver for Conexant cx23416/cx23415 MPEG encoder/decoder

:::::: TO: Hans Verkuil <hverkuil@xs4all.nl>
:::::: CC: Mauro Carvalho Chehab <mchehab@infradead.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

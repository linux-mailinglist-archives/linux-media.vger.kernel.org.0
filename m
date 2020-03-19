Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB8118AB39
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 04:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgCSDnU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 23:43:20 -0400
Received: from mga09.intel.com ([134.134.136.24]:46205 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgCSDnU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 23:43:20 -0400
IronPort-SDR: X2NAOlgNtzVaBFe71j/aCxVA8K2E4vuk7c6HlGjorXuvxSuCLMnVO9ibfpSz8dWvUuioPbW2Ak
 QTb3EDzHJjVA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2020 20:43:16 -0700
IronPort-SDR: zPvSNBENVC2WV4rVHDpQD/I5FTxy71njBluf6slVdnB+5lv91jqPGz+L5vBQhXPP+aE5sJi3oG
 oa4Wr0W9EOrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,570,1574150400"; 
   d="gz'50?scan'50,208,50";a="355905457"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2020 20:43:13 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jEm5R-0008tv-71; Thu, 19 Mar 2020 11:43:13 +0800
Date:   Thu, 19 Mar 2020 11:42:42 +0800
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
Message-ID: <202003191118.GHurU8Uv%lkp@intel.com>
References: <20200319004701.30416-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <20200319004701.30416-3-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
config: x86_64-randconfig-s1-20200319 (attached as .config)
compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/pci/ivtv/ivtv-ioctl.c: In function 'ivtv_enum_fmt_vid_cap':
>> drivers/media/pci/ivtv/ivtv-ioctl.c:925:3: warning: braces around scalar initializer
      { 0, 0, 0, 0 }
      ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:925:3: note: (near initialization for 'hm12.mbus_code')
>> drivers/media/pci/ivtv/ivtv-ioctl.c:925:8: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
           ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:925:8: note: (near initialization for 'hm12.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:925:11: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
              ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:925:11: note: (near initialization for 'hm12.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:925:14: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
                 ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:925:14: note: (near initialization for 'hm12.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:930:3: warning: braces around scalar initializer
      { 0, 0, 0, 0 }
      ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:930:3: note: (near initialization for 'mpeg.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:930:8: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
           ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:930:8: note: (near initialization for 'mpeg.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:930:11: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
              ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:930:11: note: (near initialization for 'mpeg.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:930:14: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
                 ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:930:14: note: (near initialization for 'mpeg.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c: In function 'ivtv_enum_fmt_vid_out':
   drivers/media/pci/ivtv/ivtv-ioctl.c:951:3: warning: braces around scalar initializer
      { 0, 0, 0, 0 }
      ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:951:3: note: (near initialization for 'hm12.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:951:8: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
           ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:951:8: note: (near initialization for 'hm12.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:951:11: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
              ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:951:11: note: (near initialization for 'hm12.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:951:14: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
                 ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:951:14: note: (near initialization for 'hm12.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:956:3: warning: braces around scalar initializer
      { 0, 0, 0, 0 }
      ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:956:3: note: (near initialization for 'mpeg.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:956:8: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
           ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:956:8: note: (near initialization for 'mpeg.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:956:11: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
              ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:956:11: note: (near initialization for 'mpeg.mbus_code')
   drivers/media/pci/ivtv/ivtv-ioctl.c:956:14: warning: excess elements in scalar initializer
      { 0, 0, 0, 0 }
                 ^
   drivers/media/pci/ivtv/ivtv-ioctl.c:956:14: note: (near initialization for 'mpeg.mbus_code')

vim +925 drivers/media/pci/ivtv/ivtv-ioctl.c

1a0adaf37c30e8 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  919  
3f038d80039f60 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2008-05-29  920  static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc *fmt)
3f038d80039f60 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2008-05-29  921  {
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  922  	static const struct v4l2_fmtdesc hm12 = {
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  923  		0, V4L2_BUF_TYPE_VIDEO_CAPTURE, 0,
368f080b6870e6 drivers/media/video/ivtv/ivtv-ioctl.c Ian Armstrong 2007-11-05  924  		"HM12 (YUV 4:2:0)", V4L2_PIX_FMT_HM12,
1a0adaf37c30e8 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27 @925  		{ 0, 0, 0, 0 }
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  926  	};
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  927  	static const struct v4l2_fmtdesc mpeg = {
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  928  		0, V4L2_BUF_TYPE_VIDEO_CAPTURE, V4L2_FMT_FLAG_COMPRESSED,
1a0adaf37c30e8 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  929  		"MPEG", V4L2_PIX_FMT_MPEG,
1a0adaf37c30e8 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  930  		{ 0, 0, 0, 0 }
1a0adaf37c30e8 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  931  	};
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  932  	struct ivtv *itv = fh2id(fh)->itv;
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  933  	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
1a0adaf37c30e8 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  934  
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  935  	if (fmt->index)
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  936  		return -EINVAL;
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  937  	if (s->type == IVTV_ENC_STREAM_TYPE_MPG)
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  938  		*fmt = mpeg;
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  939  	else if (s->type == IVTV_ENC_STREAM_TYPE_YUV)
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  940  		*fmt = hm12;
bfd063cebb75d3 drivers/media/pci/ivtv/ivtv-ioctl.c   Hans Verkuil  2012-10-01  941  	else
1a0adaf37c30e8 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  942  		return -EINVAL;
3f038d80039f60 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2008-05-29  943  	return 0;
1a0adaf37c30e8 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2007-04-27  944  }
3f038d80039f60 drivers/media/video/ivtv/ivtv-ioctl.c Hans Verkuil  2008-05-29  945  

:::::: The code at line 925 was first introduced by commit
:::::: 1a0adaf37c30e89e44d1470ef604a930999a5826 V4L/DVB (5345): ivtv driver for Conexant cx23416/cx23415 MPEG encoder/decoder

:::::: TO: Hans Verkuil <hverkuil@xs4all.nl>
:::::: CC: Mauro Carvalho Chehab <mchehab@infradead.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--TB36FDmn/VVEgNH/
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
k/g/8PVbm1kVAgA=

--TB36FDmn/VVEgNH/--

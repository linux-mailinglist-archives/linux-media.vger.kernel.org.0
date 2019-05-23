Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 906FA28CAA
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 23:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388232AbfEWVtg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 17:49:36 -0400
Received: from mga17.intel.com ([192.55.52.151]:61477 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388134AbfEWVtg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 17:49:36 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 May 2019 14:49:35 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 May 2019 14:49:34 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hTvaf-0004Yj-TB; Fri, 24 May 2019 05:49:33 +0800
Date:   Fri, 24 May 2019 05:49:06 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     kbuild-all@01.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [linuxtv-media:master 51/52] drivers/media/media-device.c:521:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <201905240504.XLNXJBMV%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/media_tree.git master
head:   3d3515312f97582136644a7327ed262c7bb7ea31
commit: f49308878d7202e07d8761238e01bd0e5fce2750 [51/52] media: media_device_enum_links32: clean a reserved field
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        git checkout f49308878d7202e07d8761238e01bd0e5fce2750
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/media/media-device.c:521:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *s @@    got unsigned int [noderef] <asvoid *s @@
>> drivers/media/media-device.c:521:9: sparse:    expected void *s
>> drivers/media/media-device.c:521:9: sparse:    got unsigned int [noderef] <asn:1> *

vim +521 drivers/media/media-device.c

   499	
   500	static long media_device_enum_links32(struct media_device *mdev,
   501					      struct media_links_enum32 __user *ulinks)
   502	{
   503		struct media_links_enum links;
   504		compat_uptr_t pads_ptr, links_ptr;
   505		int ret;
   506	
   507		memset(&links, 0, sizeof(links));
   508	
   509		if (get_user(links.entity, &ulinks->entity)
   510		    || get_user(pads_ptr, &ulinks->pads)
   511		    || get_user(links_ptr, &ulinks->links))
   512			return -EFAULT;
   513	
   514		links.pads = compat_ptr(pads_ptr);
   515		links.links = compat_ptr(links_ptr);
   516	
   517		ret = media_device_enum_links(mdev, &links);
   518		if (ret)
   519			return ret;
   520	
 > 521		memset(ulinks->reserved, 0, sizeof(ulinks->reserved));
   522	
   523		return 0;
   524	}
   525	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

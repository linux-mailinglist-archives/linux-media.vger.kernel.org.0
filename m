Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2DF250528
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 19:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgHXRMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 13:12:07 -0400
Received: from mga14.intel.com ([192.55.52.115]:31905 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728534AbgHXRMC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 13:12:02 -0400
IronPort-SDR: VnOfBNrtzF6GqyNdZWKc3Oxy6/J6PN8BTPCV9uJini2E5JNpAJxDIPaehtL9xnKPdj+duXDdFS
 mTPj6cZtNQ7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="155194617"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; 
   d="gz'50?scan'50,208,50";a="155194617"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 09:38:59 -0700
IronPort-SDR: rSVuRcSuH8iq97hO6CRAtzY1W+UJQVJHn5kSUSgTr5FjeoQI9AhERw4jdSv+db1LvQ58KpNtn0
 bmu+wFO5u+ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; 
   d="gz'50?scan'50,208,50";a="336230366"
Received: from lkp-server01.sh.intel.com (HELO c420d4f0765f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2020 09:38:57 -0700
Received: from kbuild by c420d4f0765f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kAFUm-0000Fz-RN; Mon, 24 Aug 2020 16:38:56 +0000
Date:   Tue, 25 Aug 2020 00:38:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-next:master 1732/2666]
 drivers/staging/hikey9xx/hisi-spmi-controller.c:148:4: warning: format '%ld'
 expects argument of type 'long int', but argument 4 has type 'size_t' {aka
 'unsigned int'}
Message-ID: <202008250024.J4C8YstL%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d8be0e12a522d53a45f85fb241ffd06108d40b03
commit: 1747938a37d1dfa9faa397507f88627158b3d806 [1732/2666] staging: spmi: hisi-spmi-controller: add it to the building system
config: arm-randconfig-r035-20200824 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 1747938a37d1dfa9faa397507f88627158b3d806
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/staging/hikey9xx/hisi-spmi-controller.c:7:
   drivers/staging/hikey9xx/hisi-spmi-controller.c: In function 'spmi_read_cmd':
>> drivers/staging/hikey9xx/hisi-spmi-controller.c:148:4: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     148 |    "spmi_controller supports 1..%d bytes per trans, but:%ld requested",
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/staging/hikey9xx/hisi-spmi-controller.c:147:3: note: in expansion of macro 'dev_err'
     147 |   dev_err(&ctrl->dev,
         |   ^~~~~~~
   drivers/staging/hikey9xx/hisi-spmi-controller.c:148:59: note: format string is defined here
     148 |    "spmi_controller supports 1..%d bytes per trans, but:%ld requested",
         |                                                         ~~^
         |                                                           |
         |                                                           long int
         |                                                         %d
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/staging/hikey9xx/hisi-spmi-controller.c:7:
   drivers/staging/hikey9xx/hisi-spmi-controller.c:198:4: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     198 |    "spmi read wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/staging/hikey9xx/hisi-spmi-controller.c:197:3: note: in expansion of macro 'dev_err'
     197 |   dev_err(&ctrl->dev,
         |   ^~~~~~~
   drivers/staging/hikey9xx/hisi-spmi-controller.c:198:58: note: format string is defined here
     198 |    "spmi read wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
         |                                                        ~~^
         |                                                          |
         |                                                          long int
         |                                                        %d
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/staging/hikey9xx/hisi-spmi-controller.c:7:
   drivers/staging/hikey9xx/hisi-spmi-controller.c: In function 'spmi_write_cmd':
   drivers/staging/hikey9xx/hisi-spmi-controller.c:220:4: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     220 |    "spmi_controller supports 1..%d bytes per trans, but:%ld requested",
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/staging/hikey9xx/hisi-spmi-controller.c:219:3: note: in expansion of macro 'dev_err'
     219 |   dev_err(&ctrl->dev,
         |   ^~~~~~~
   drivers/staging/hikey9xx/hisi-spmi-controller.c:220:59: note: format string is defined here
     220 |    "spmi_controller supports 1..%d bytes per trans, but:%ld requested",
         |                                                         ~~^
         |                                                           |
         |                                                           long int
         |                                                         %d
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/staging/hikey9xx/hisi-spmi-controller.c:7:
   drivers/staging/hikey9xx/hisi-spmi-controller.c:270:23: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     270 |   dev_err(&ctrl->dev, "spmi write wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/staging/hikey9xx/hisi-spmi-controller.c:270:3: note: in expansion of macro 'dev_err'
     270 |   dev_err(&ctrl->dev, "spmi write wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
         |   ^~~~~~~
   drivers/staging/hikey9xx/hisi-spmi-controller.c:270:78: note: format string is defined here
     270 |   dev_err(&ctrl->dev, "spmi write wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
         |                                                                            ~~^
         |                                                                              |
         |                                                                              long int
         |                                                                            %d

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1747938a37d1dfa9faa397507f88627158b3d806
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git fetch --no-tags linux-next master
git checkout 1747938a37d1dfa9faa397507f88627158b3d806
vim +148 drivers/staging/hikey9xx/hisi-spmi-controller.c

70f59c90c8199e8 Mayulong              2020-08-17  134  
70f59c90c8199e8 Mayulong              2020-08-17  135  static int spmi_read_cmd(struct spmi_controller *ctrl,
6af364501949d99 Mauro Carvalho Chehab 2020-08-17  136  			 u8 opc, u8 sid, u16 addr, u8 *__buf, size_t bc)
70f59c90c8199e8 Mayulong              2020-08-17  137  {
70f59c90c8199e8 Mayulong              2020-08-17  138  	struct spmi_controller_dev *spmi_controller = dev_get_drvdata(&ctrl->dev);
70f59c90c8199e8 Mayulong              2020-08-17  139  	unsigned long flags;
6af364501949d99 Mauro Carvalho Chehab 2020-08-17  140  	u8 *buf = __buf;
70f59c90c8199e8 Mayulong              2020-08-17  141  	u32 cmd, data;
70f59c90c8199e8 Mayulong              2020-08-17  142  	int rc;
70f59c90c8199e8 Mayulong              2020-08-17  143  	u32 chnl_ofst = SPMI_CHANNEL_OFFSET * spmi_controller->channel;
70f59c90c8199e8 Mayulong              2020-08-17  144  	u8 op_code, i;
70f59c90c8199e8 Mayulong              2020-08-17  145  
70f59c90c8199e8 Mayulong              2020-08-17  146  	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
4d914a8c480c312 Mauro Carvalho Chehab 2020-08-17  147  		dev_err(&ctrl->dev,
4d914a8c480c312 Mauro Carvalho Chehab 2020-08-17 @148  			"spmi_controller supports 1..%d bytes per trans, but:%ld requested",
4d914a8c480c312 Mauro Carvalho Chehab 2020-08-17  149  			SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
70f59c90c8199e8 Mayulong              2020-08-17  150  		return  -EINVAL;
70f59c90c8199e8 Mayulong              2020-08-17  151  	}
70f59c90c8199e8 Mayulong              2020-08-17  152  
70f59c90c8199e8 Mayulong              2020-08-17  153  	/* Check the opcode */
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  154  	if (opc == SPMI_CMD_READ) {
70f59c90c8199e8 Mayulong              2020-08-17  155  		op_code = SPMI_CMD_REG_READ;
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  156  	} else if (opc == SPMI_CMD_EXT_READ) {
70f59c90c8199e8 Mayulong              2020-08-17  157  		op_code = SPMI_CMD_EXT_REG_READ;
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  158  	} else if (opc == SPMI_CMD_EXT_READL) {
70f59c90c8199e8 Mayulong              2020-08-17  159  		op_code = SPMI_CMD_EXT_REG_READ_L;
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  160  	} else {
4d914a8c480c312 Mauro Carvalho Chehab 2020-08-17  161  		dev_err(&ctrl->dev, "invalid read cmd 0x%x", opc);
70f59c90c8199e8 Mayulong              2020-08-17  162  		return -EINVAL;
70f59c90c8199e8 Mayulong              2020-08-17  163  	}
70f59c90c8199e8 Mayulong              2020-08-17  164  
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  165  	cmd = SPMI_APB_SPMI_CMD_EN |
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  166  	     (op_code << SPMI_APB_SPMI_CMD_TYPE_OFFSET) |
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  167  	     ((bc - 1) << SPMI_APB_SPMI_CMD_LENGTH_OFFSET) |
70f59c90c8199e8 Mayulong              2020-08-17  168  	     ((sid & 0xf) << SPMI_APB_SPMI_CMD_SLAVEID_OFFSET) |  /* slvid */
70f59c90c8199e8 Mayulong              2020-08-17  169  	     ((addr & 0xffff)  << SPMI_APB_SPMI_CMD_ADDR_OFFSET); /* slave_addr */
70f59c90c8199e8 Mayulong              2020-08-17  170  
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  171  	spin_lock_irqsave(&spmi_controller->lock, flags);
70f59c90c8199e8 Mayulong              2020-08-17  172  
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  173  	writel(cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);
70f59c90c8199e8 Mayulong              2020-08-17  174  
4d914a8c480c312 Mauro Carvalho Chehab 2020-08-17  175  	rc = spmi_controller_wait_for_done(&ctrl->dev, spmi_controller,
8788a30c12c7884 Mauro Carvalho Chehab 2020-08-17  176  					   spmi_controller->base, sid, addr);
70f59c90c8199e8 Mayulong              2020-08-17  177  	if (rc)
70f59c90c8199e8 Mayulong              2020-08-17  178  		goto done;
70f59c90c8199e8 Mayulong              2020-08-17  179  
70f59c90c8199e8 Mayulong              2020-08-17  180  	i = 0;
70f59c90c8199e8 Mayulong              2020-08-17  181  	do {
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  182  		data = readl(spmi_controller->base + chnl_ofst + SPMI_SLAVE_OFFSET * sid + SPMI_APB_SPMI_RDATA0_BASE_ADDR + i * SPMI_PER_DATAREG_BYTE);
8788a30c12c7884 Mauro Carvalho Chehab 2020-08-17  183  		data = be32_to_cpu((__be32)data);
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  184  		if ((bc - i * SPMI_PER_DATAREG_BYTE) >> 2) {
70f59c90c8199e8 Mayulong              2020-08-17  185  			memcpy(buf, &data, sizeof(data));
70f59c90c8199e8 Mayulong              2020-08-17  186  			buf += sizeof(data);
70f59c90c8199e8 Mayulong              2020-08-17  187  		} else {
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  188  			memcpy(buf, &data, bc % SPMI_PER_DATAREG_BYTE);
70f59c90c8199e8 Mayulong              2020-08-17  189  			buf += (bc % SPMI_PER_DATAREG_BYTE);
70f59c90c8199e8 Mayulong              2020-08-17  190  		}
70f59c90c8199e8 Mayulong              2020-08-17  191  		i++;
70f59c90c8199e8 Mayulong              2020-08-17  192  	} while (bc > i * SPMI_PER_DATAREG_BYTE);
70f59c90c8199e8 Mayulong              2020-08-17  193  
70f59c90c8199e8 Mayulong              2020-08-17  194  done:
70f59c90c8199e8 Mayulong              2020-08-17  195  	spin_unlock_irqrestore(&spmi_controller->lock, flags);
70f59c90c8199e8 Mayulong              2020-08-17  196  	if (rc)
4d914a8c480c312 Mauro Carvalho Chehab 2020-08-17  197  		dev_err(&ctrl->dev,
4d914a8c480c312 Mauro Carvalho Chehab 2020-08-17  198  			"spmi read wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
70f59c90c8199e8 Mayulong              2020-08-17  199  			opc, sid, addr, bc + 1);
6af364501949d99 Mauro Carvalho Chehab 2020-08-17  200  	else
4d914a8c480c312 Mauro Carvalho Chehab 2020-08-17  201  		dev_dbg(&ctrl->dev, "%s: id:%d addr:0x%x, read value: %*ph\n",
6af364501949d99 Mauro Carvalho Chehab 2020-08-17  202  			__func__, sid, addr, (int)bc, __buf);
6af364501949d99 Mauro Carvalho Chehab 2020-08-17  203  
70f59c90c8199e8 Mayulong              2020-08-17  204  	return rc;
2ea3f6a03b155f4 Mauro Carvalho Chehab 2020-08-17  205  }
70f59c90c8199e8 Mayulong              2020-08-17  206  

:::::: The code at line 148 was first introduced by commit
:::::: 4d914a8c480c31280505304611030612fa5c2645 staging: spmi: hisi-spmi-controller: fix the dev_foo() logic

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--+HP7ph2BbKc20aGI
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--+HP7ph2BbKc20aGI--

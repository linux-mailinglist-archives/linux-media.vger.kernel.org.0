Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5BC2B675D
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 15:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbgKQO3c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 09:29:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:49159 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727473AbgKQO3b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 09:29:31 -0500
IronPort-SDR: sgBqjjz5qKNU3YUF87tLOD6abNzi9hxshHYzKOQr0aDvqbLrqVjmFPTioVFoGkJOHb1BImemjX
 Rrc78myvPuSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="232547870"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="gz'50?scan'50,208,50";a="232547870"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 06:29:27 -0800
IronPort-SDR: rw1lD9TCC4AfiXlqyUVVFA1x86Zv9lFVjHYdFZVzSnaDoeKDwqa0brn4ggaf2AZyEU0CoUIoPF
 4cqP37nZUxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="gz'50?scan'50,208,50";a="330095497"
Received: from lkp-server01.sh.intel.com (HELO d102174a0e0d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Nov 2020 06:29:22 -0800
Received: from kbuild by d102174a0e0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kf1yy-00000J-Rf; Tue, 17 Nov 2020 14:29:20 +0000
Date:   Tue, 17 Nov 2020 22:28:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mayulong <mayulong1@huawei.com>,
        YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH 2/8] spmi: hi6421-spmi-pmic: move driver from staging
Message-ID: <202011172204.sz98GuOL-lkp@intel.com>
References: <7e01d84b31d561fa4df1d42369e4222f4a41a8d3.1605530560.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <7e01d84b31d561fa4df1d42369e4222f4a41a8d3.1605530560.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.10-rc4 next-20201117]
[cannot apply to staging/staging-testing robh/for-next lee-mfd/for-mfd-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mauro-Carvalho-Chehab/Move-Hikey-970-USB-support-out-of-staging-and-add-DT/20201116-210334
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 09162bc32c880a791c6c0668ce0745cf7958f576
config: x86_64-randconfig-s022-20201115 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-107-gaf3512a6-dirty
        # https://github.com/0day-ci/linux/commit/b972250f20fc571defa4b23c9cc959df61eb0803
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mauro-Carvalho-Chehab/Move-Hikey-970-USB-support-out-of-staging-and-add-DT/20201116-210334
        git checkout b972250f20fc571defa4b23c9cc959df61eb0803
        # save the attached .config to linux build tree
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/spmi/hisi-spmi-controller.c:164:24: sparse: sparse: cast to restricted __be32
>> drivers/spmi/hisi-spmi-controller.c:164:24: sparse: sparse: cast to restricted __be32
>> drivers/spmi/hisi-spmi-controller.c:164:24: sparse: sparse: cast to restricted __be32
>> drivers/spmi/hisi-spmi-controller.c:164:24: sparse: sparse: cast to restricted __be32
>> drivers/spmi/hisi-spmi-controller.c:164:24: sparse: sparse: cast to restricted __be32
>> drivers/spmi/hisi-spmi-controller.c:164:24: sparse: sparse: cast to restricted __be32
>> drivers/spmi/hisi-spmi-controller.c:239:25: sparse: sparse: cast from restricted __be32

vim +164 drivers/spmi/hisi-spmi-controller.c

70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  110  
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  111  static int spmi_read_cmd(struct spmi_controller *ctrl,
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  112  			 u8 opc, u8 slave_id, u16 slave_addr, u8 *__buf, size_t bc)
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  113  {
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  114  	struct spmi_controller_dev *spmi_controller = dev_get_drvdata(&ctrl->dev);
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  115  	u32 chnl_ofst = SPMI_CHANNEL_OFFSET * spmi_controller->channel;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  116  	unsigned long flags;
6af364501949d99 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  117  	u8 *buf = __buf;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  118  	u32 cmd, data;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  119  	int rc;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  120  	u8 op_code, i;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  121  
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  122  	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
4d914a8c480c312 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  123  		dev_err(&ctrl->dev,
4c6491a343e91a5 drivers/staging/hikey9xx/hisi-spmi-controller.c YueHaibing            2020-09-01  124  			"spmi_controller supports 1..%d bytes per trans, but:%zu requested\n",
4d914a8c480c312 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  125  			SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  126  		return  -EINVAL;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  127  	}
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  128  
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  129  	switch (opc) {
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  130  	case SPMI_CMD_READ:
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  131  		op_code = SPMI_CMD_REG_READ;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  132  		break;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  133  	case SPMI_CMD_EXT_READ:
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  134  		op_code = SPMI_CMD_EXT_REG_READ;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  135  		break;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  136  	case SPMI_CMD_EXT_READL:
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  137  		op_code = SPMI_CMD_EXT_REG_READ_L;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  138  		break;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  139  	default:
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  140  		dev_err(&ctrl->dev, "invalid read cmd 0x%x\n", opc);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  141  		return -EINVAL;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  142  	}
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  143  
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  144  	cmd = SPMI_APB_SPMI_CMD_EN |
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  145  	     (op_code << SPMI_APB_SPMI_CMD_TYPE_OFFSET) |
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  146  	     ((bc - 1) << SPMI_APB_SPMI_CMD_LENGTH_OFFSET) |
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  147  	     ((slave_id & 0xf) << SPMI_APB_SPMI_CMD_SLAVEID_OFFSET) |  /* slvid */
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  148  	     ((slave_addr & 0xffff)  << SPMI_APB_SPMI_CMD_ADDR_OFFSET); /* slave_addr */
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  149  
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  150  	spin_lock_irqsave(&spmi_controller->lock, flags);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  151  
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  152  	writel(cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  153  
4d914a8c480c312 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  154  	rc = spmi_controller_wait_for_done(&ctrl->dev, spmi_controller,
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  155  					   spmi_controller->base, slave_id, slave_addr);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  156  	if (rc)
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  157  		goto done;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  158  
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  159  	for (i = 0; bc > i * SPMI_PER_DATAREG_BYTE; i++) {
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  160  		data = readl(spmi_controller->base + chnl_ofst +
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  161  			     SPMI_SLAVE_OFFSET * slave_id +
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  162  			     SPMI_APB_SPMI_RDATA0_BASE_ADDR +
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  163  			     i * SPMI_PER_DATAREG_BYTE);
8788a30c12c7884 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17 @164  		data = be32_to_cpu((__be32)data);
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  165  		if ((bc - i * SPMI_PER_DATAREG_BYTE) >> 2) {
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  166  			memcpy(buf, &data, sizeof(data));
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  167  			buf += sizeof(data);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  168  		} else {
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  169  			memcpy(buf, &data, bc % SPMI_PER_DATAREG_BYTE);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  170  			buf += (bc % SPMI_PER_DATAREG_BYTE);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  171  		}
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  172  	}
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  173  
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  174  done:
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  175  	spin_unlock_irqrestore(&spmi_controller->lock, flags);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  176  	if (rc)
4d914a8c480c312 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  177  		dev_err(&ctrl->dev,
4c6491a343e91a5 drivers/staging/hikey9xx/hisi-spmi-controller.c YueHaibing            2020-09-01  178  			"spmi read wait timeout op:0x%x slave_id:%d slave_addr:0x%x bc:%zu\n",
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  179  			opc, slave_id, slave_addr, bc + 1);
6af364501949d99 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  180  	else
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  181  		dev_dbg(&ctrl->dev, "%s: id:%d slave_addr:0x%x, read value: %*ph\n",
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  182  			__func__, slave_id, slave_addr, (int)bc, __buf);
6af364501949d99 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  183  
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  184  	return rc;
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  185  }
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  186  
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  187  static int spmi_write_cmd(struct spmi_controller *ctrl,
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  188  			  u8 opc, u8 slave_id, u16 slave_addr, const u8 *__buf, size_t bc)
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  189  {
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  190  	struct spmi_controller_dev *spmi_controller = dev_get_drvdata(&ctrl->dev);
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  191  	u32 chnl_ofst = SPMI_CHANNEL_OFFSET * spmi_controller->channel;
6af364501949d99 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  192  	const u8 *buf = __buf;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  193  	unsigned long flags;
8788a30c12c7884 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  194  	u32 cmd, data;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  195  	int rc;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  196  	u8 op_code, i;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  197  
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  198  	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
4d914a8c480c312 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  199  		dev_err(&ctrl->dev,
4c6491a343e91a5 drivers/staging/hikey9xx/hisi-spmi-controller.c YueHaibing            2020-09-01  200  			"spmi_controller supports 1..%d bytes per trans, but:%zu requested\n",
4d914a8c480c312 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  201  			SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  202  		return  -EINVAL;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  203  	}
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  204  
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  205  	switch (opc) {
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  206  	case SPMI_CMD_WRITE:
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  207  		op_code = SPMI_CMD_REG_WRITE;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  208  		break;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  209  	case SPMI_CMD_EXT_WRITE:
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  210  		op_code = SPMI_CMD_EXT_REG_WRITE;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  211  		break;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  212  	case SPMI_CMD_EXT_WRITEL:
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  213  		op_code = SPMI_CMD_EXT_REG_WRITE_L;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  214  		break;
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  215  	default:
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  216  		dev_err(&ctrl->dev, "invalid write cmd 0x%x\n", opc);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  217  		return -EINVAL;
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  218  	}
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  219  
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  220  	cmd = SPMI_APB_SPMI_CMD_EN |
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  221  	      (op_code << SPMI_APB_SPMI_CMD_TYPE_OFFSET) |
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  222  	      ((bc - 1) << SPMI_APB_SPMI_CMD_LENGTH_OFFSET) |
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  223  	      ((slave_id & 0xf) << SPMI_APB_SPMI_CMD_SLAVEID_OFFSET) |
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  224  	      ((slave_addr & 0xffff)  << SPMI_APB_SPMI_CMD_ADDR_OFFSET);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  225  
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  226  	/* Write data to FIFOs */
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  227  	spin_lock_irqsave(&spmi_controller->lock, flags);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  228  
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  229  	for (i = 0; bc > i * SPMI_PER_DATAREG_BYTE; i++) {
8788a30c12c7884 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  230  		data = 0;
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  231  		if ((bc - i * SPMI_PER_DATAREG_BYTE) >> 2) {
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  232  			memcpy(&data, buf, sizeof(data));
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  233  			buf += sizeof(data);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  234  		} else {
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  235  			memcpy(&data, buf, bc % SPMI_PER_DATAREG_BYTE);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  236  			buf += (bc % SPMI_PER_DATAREG_BYTE);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  237  		}
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  238  
8788a30c12c7884 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17 @239  		writel((u32)cpu_to_be32(data),
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  240  		       spmi_controller->base + chnl_ofst +
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  241  		       SPMI_APB_SPMI_WDATA0_BASE_ADDR +
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  242  		       SPMI_PER_DATAREG_BYTE * i);
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  243  	}
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  244  
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  245  	/* Start the transaction */
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  246  	writel(cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  247  
4d914a8c480c312 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  248  	rc = spmi_controller_wait_for_done(&ctrl->dev, spmi_controller,
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  249  					   spmi_controller->base, slave_id,
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  250  					   slave_addr);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  251  	spin_unlock_irqrestore(&spmi_controller->lock, flags);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  252  
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  253  	if (rc)
4c6491a343e91a5 drivers/staging/hikey9xx/hisi-spmi-controller.c YueHaibing            2020-09-01  254  		dev_err(&ctrl->dev, "spmi write wait timeout op:0x%x slave_id:%d slave_addr:0x%x bc:%zu\n",
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  255  			opc, slave_id, slave_addr, bc);
6af364501949d99 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  256  	else
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  257  		dev_dbg(&ctrl->dev, "%s: id:%d slave_addr:0x%x, wrote value: %*ph\n",
7f3ac6c502fd7ff drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  258  			__func__, slave_id, slave_addr, (int)bc, __buf);
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  259  
70f59c90c8199e8 drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  260  	return rc;
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  261  }
2ea3f6a03b155f4 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  262  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--tKW2IUtsqtDRztdT
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AoX+D+HHvbIPQgIA

--tKW2IUtsqtDRztdT--

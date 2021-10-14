Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C7E42D807
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 13:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhJNLVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 07:21:33 -0400
Received: from mga01.intel.com ([192.55.52.88]:61869 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230177AbhJNLVc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 07:21:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="251090405"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="gz'50?scan'50,208,50";a="251090405"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 04:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="gz'50?scan'50,208,50";a="626767804"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2021 04:19:24 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1maylf-0005yF-JI; Thu, 14 Oct 2021 11:19:23 +0000
Date:   Thu, 14 Oct 2021 19:18:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Corentin Labbe <clabbe@baylibre.com>, mchehab@kernel.org,
        hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH v2 04/10] staging: media: zoran: add debugfs
Message-ID: <202110141919.L3xLDIIE-lkp@intel.com>
References: <20211013185812.590931-5-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <20211013185812.590931-5-clabbe@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Corentin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Corentin-Labbe/staging-media-zoran-fusion-in-one-module/20211014-025945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 6ac113f741a7674e4268eea3eb13972732d83571
config: x86_64-randconfig-a016-20211014 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6c76d0101193aa4eb891a6954ff047eda2f9cf71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/74fc116256f23b2c65d0c813f1d90b617ce9c97d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Corentin-Labbe/staging-media-zoran-fusion-in-one-module/20211014-025945
        git checkout 74fc116256f23b2c65d0c813f1d90b617ce9c97d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/staging/media/zoran/zoran_card.c:948:31: error: no member named 'dbgfs_dir' in 'struct zoran'
           debugfs_remove_recursive(zr->dbgfs_dir);
                                    ~~  ^
>> drivers/staging/media/zoran/zoran_card.c:1141:46: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   1 warning and 1 error generated.


vim +1141 drivers/staging/media/zoran/zoran_card.c

74fc116256f23b Corentin Labbe 2021-10-13  1088  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1089  /*
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1090   *   Scan for a Buz card (actually for the PCI controller ZR36057),
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1091   *   request the irq and map the io memory
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1092   */
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1093  static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1094  {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1095  	unsigned char latency, need_latency;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1096  	struct zoran *zr;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1097  	int result;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1098  	struct videocodec_master *master_vfe = NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1099  	struct videocodec_master *master_codec = NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1100  	int card_num;
d61c7451fcb712 Corentin Labbe 2020-09-25  1101  	const char *codec_name, *vfe_name;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1102  	unsigned int nr;
d4ae3689226e56 Corentin Labbe 2020-09-25  1103  	int err;
d4ae3689226e56 Corentin Labbe 2020-09-25  1104  
26edeeecea59d6 Corentin Labbe 2021-10-13  1105  	pci_info(pdev, "Zoran MJPEG board driver version %s\n", ZORAN_VERSION);
26edeeecea59d6 Corentin Labbe 2021-10-13  1106  
26edeeecea59d6 Corentin Labbe 2021-10-13  1107  	/* check the parameters we have been given, adjust if necessary */
26edeeecea59d6 Corentin Labbe 2021-10-13  1108  	if (v4l_nbufs < 2)
26edeeecea59d6 Corentin Labbe 2021-10-13  1109  		v4l_nbufs = 2;
26edeeecea59d6 Corentin Labbe 2021-10-13  1110  	if (v4l_nbufs > VIDEO_MAX_FRAME)
26edeeecea59d6 Corentin Labbe 2021-10-13  1111  		v4l_nbufs = VIDEO_MAX_FRAME;
26edeeecea59d6 Corentin Labbe 2021-10-13  1112  	/* The user specifies the in KB, we want them in byte (and page aligned) */
26edeeecea59d6 Corentin Labbe 2021-10-13  1113  	v4l_bufsize = PAGE_ALIGN(v4l_bufsize * 1024);
26edeeecea59d6 Corentin Labbe 2021-10-13  1114  	if (v4l_bufsize < 32768)
26edeeecea59d6 Corentin Labbe 2021-10-13  1115  		v4l_bufsize = 32768;
26edeeecea59d6 Corentin Labbe 2021-10-13  1116  	/* 2 MB is arbitrary but sufficient for the maximum possible images */
26edeeecea59d6 Corentin Labbe 2021-10-13  1117  	if (v4l_bufsize > 2048 * 1024)
26edeeecea59d6 Corentin Labbe 2021-10-13  1118  		v4l_bufsize = 2048 * 1024;
26edeeecea59d6 Corentin Labbe 2021-10-13  1119  	if (jpg_nbufs < 4)
26edeeecea59d6 Corentin Labbe 2021-10-13  1120  		jpg_nbufs = 4;
26edeeecea59d6 Corentin Labbe 2021-10-13  1121  	if (jpg_nbufs > BUZ_MAX_FRAME)
26edeeecea59d6 Corentin Labbe 2021-10-13  1122  		jpg_nbufs = BUZ_MAX_FRAME;
26edeeecea59d6 Corentin Labbe 2021-10-13  1123  	jpg_bufsize = PAGE_ALIGN(jpg_bufsize * 1024);
26edeeecea59d6 Corentin Labbe 2021-10-13  1124  	if (jpg_bufsize < 8192)
26edeeecea59d6 Corentin Labbe 2021-10-13  1125  		jpg_bufsize = 8192;
26edeeecea59d6 Corentin Labbe 2021-10-13  1126  	if (jpg_bufsize > (512 * 1024))
26edeeecea59d6 Corentin Labbe 2021-10-13  1127  		jpg_bufsize = 512 * 1024;
26edeeecea59d6 Corentin Labbe 2021-10-13  1128  	/* Use parameter for vidmem or try to find a video card */
26edeeecea59d6 Corentin Labbe 2021-10-13  1129  	if (vidmem)
26edeeecea59d6 Corentin Labbe 2021-10-13  1130  		pci_info(pdev, "%s: Using supplied video memory base address @ 0x%lx\n",
26edeeecea59d6 Corentin Labbe 2021-10-13  1131  			 ZORAN_NAME, vidmem);
26edeeecea59d6 Corentin Labbe 2021-10-13  1132  
26edeeecea59d6 Corentin Labbe 2021-10-13  1133  	/* some mainboards might not do PCI-PCI data transfer well */
26edeeecea59d6 Corentin Labbe 2021-10-13  1134  	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
26edeeecea59d6 Corentin Labbe 2021-10-13  1135  		pci_warn(pdev, "%s: chipset does not support reliable PCI-PCI DMA\n",
26edeeecea59d6 Corentin Labbe 2021-10-13  1136  			 ZORAN_NAME);
26edeeecea59d6 Corentin Labbe 2021-10-13  1137  
d4ae3689226e56 Corentin Labbe 2020-09-25  1138  	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
d4ae3689226e56 Corentin Labbe 2020-09-25  1139  	if (err)
d4ae3689226e56 Corentin Labbe 2020-09-25  1140  		return -ENODEV;
d4ae3689226e56 Corentin Labbe 2020-09-25 @1141  	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1142  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1143  	nr = zoran_num++;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1144  	if (nr >= BUZ_MAX) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1145  		pci_err(pdev, "driver limited to %d card(s) maximum\n", BUZ_MAX);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1146  		return -ENOENT;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1147  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1148  
6d1d9ba2c4396f Corentin Labbe 2020-09-25  1149  	zr = devm_kzalloc(&pdev->dev, sizeof(*zr), GFP_KERNEL);
5e195bbddabdd9 Corentin Labbe 2020-09-25  1150  	if (!zr)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1151  		return -ENOMEM;
5e195bbddabdd9 Corentin Labbe 2020-09-25  1152  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1153  	zr->v4l2_dev.notify = zoran_subdev_notify;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1154  	if (v4l2_device_register(&pdev->dev, &zr->v4l2_dev))
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1155  		goto zr_free_mem;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1156  	zr->pci_dev = pdev;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1157  	zr->id = nr;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1158  	snprintf(ZR_DEVNAME(zr), sizeof(ZR_DEVNAME(zr)), "MJPEG[%u]", zr->id);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1159  	if (v4l2_ctrl_handler_init(&zr->hdl, 10))
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1160  		goto zr_unreg;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1161  	zr->v4l2_dev.ctrl_handler = &zr->hdl;
8cb356d4eaae11 Corentin Labbe 2020-09-25  1162  	v4l2_ctrl_new_std(&zr->hdl, &zoran_video_ctrl_ops,
8cb356d4eaae11 Corentin Labbe 2020-09-25  1163  			  V4L2_CID_JPEG_COMPRESSION_QUALITY, 0,
8cb356d4eaae11 Corentin Labbe 2020-09-25  1164  			  100, 1, 50);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1165  	spin_lock_init(&zr->spinlock);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1166  	mutex_init(&zr->lock);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1167  	if (pci_enable_device(pdev))
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1168  		goto zr_unreg;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1169  	zr->revision = zr->pci_dev->revision;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1170  
9bb2720293a04f Corentin Labbe 2020-09-25  1171  	pci_info(zr->pci_dev, "Zoran ZR360%c7 (rev %d), irq: %d, memory: 0x%08llx\n",
9bb2720293a04f Corentin Labbe 2020-09-25  1172  		 zr->revision < 2 ? '5' : '6', zr->revision,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1173  		 zr->pci_dev->irq, (uint64_t)pci_resource_start(zr->pci_dev, 0));
9bb2720293a04f Corentin Labbe 2020-09-25  1174  	if (zr->revision >= 2)
9bb2720293a04f Corentin Labbe 2020-09-25  1175  		pci_info(zr->pci_dev, "Subsystem vendor=0x%04x id=0x%04x\n",
9bb2720293a04f Corentin Labbe 2020-09-25  1176  			 zr->pci_dev->subsystem_vendor, zr->pci_dev->subsystem_device);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1177  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1178  	/* Use auto-detected card type? */
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1179  	if (card[nr] == -1) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1180  		if (zr->revision < 2) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1181  			pci_err(pdev, "No card type specified, please use the card=X module parameter\n");
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1182  			pci_err(pdev, "It is not possible to auto-detect ZR36057 based cards\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1183  			goto zr_unreg;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1184  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1185  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1186  		card_num = ent->driver_data;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1187  		if (card_num >= NUM_CARDS) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1188  			pci_err(pdev, "Unknown card, try specifying card=X module parameter\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1189  			goto zr_unreg;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1190  		}
daae1da762c1e3 Corentin Labbe 2020-09-25  1191  		pci_info(zr->pci_dev, "%s() - card %s detected\n", __func__, zoran_cards[card_num].name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1192  	} else {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1193  		card_num = card[nr];
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1194  		if (card_num >= NUM_CARDS || card_num < 0) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1195  			pci_err(pdev, "User specified card type %d out of range (0 .. %d)\n",
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1196  				card_num, NUM_CARDS - 1);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1197  			goto zr_unreg;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1198  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1199  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1200  
5e195bbddabdd9 Corentin Labbe 2020-09-25  1201  	/*
5e195bbddabdd9 Corentin Labbe 2020-09-25  1202  	 * even though we make this a non pointer and thus
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1203  	 * theoretically allow for making changes to this struct
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1204  	 * on a per-individual card basis at runtime, this is
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1205  	 * strongly discouraged. This structure is intended to
5e195bbddabdd9 Corentin Labbe 2020-09-25  1206  	 * keep general card information, no settings or anything
5e195bbddabdd9 Corentin Labbe 2020-09-25  1207  	 */
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1208  	zr->card = zoran_cards[card_num];
5e195bbddabdd9 Corentin Labbe 2020-09-25  1209  	snprintf(ZR_DEVNAME(zr), sizeof(ZR_DEVNAME(zr)), "%s[%u]",
5e195bbddabdd9 Corentin Labbe 2020-09-25  1210  		 zr->card.name, zr->id);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1211  
845556fd8027b8 Corentin Labbe 2020-09-25  1212  	err = pci_request_regions(pdev, ZR_DEVNAME(zr));
845556fd8027b8 Corentin Labbe 2020-09-25  1213  	if (err)
845556fd8027b8 Corentin Labbe 2020-09-25  1214  		goto zr_unreg;
845556fd8027b8 Corentin Labbe 2020-09-25  1215  
e83bf68b5827e0 Corentin Labbe 2020-09-25  1216  	zr->zr36057_mem = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1217  	if (!zr->zr36057_mem) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1218  		pci_err(pdev, "%s() - ioremap failed\n", __func__);
845556fd8027b8 Corentin Labbe 2020-09-25  1219  		goto zr_pci_release;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1220  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1221  
ce72671d5d2d93 Corentin Labbe 2020-09-25  1222  	result = pci_request_irq(pdev, 0, zoran_irq, NULL, zr, ZR_DEVNAME(zr));
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1223  	if (result < 0) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1224  		if (result == -EINVAL) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1225  			pci_err(pdev, "%s - bad IRQ number or handler\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1226  		} else if (result == -EBUSY) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1227  			pci_err(pdev, "%s - IRQ %d busy, change your PnP config in BIOS\n",
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1228  				__func__, zr->pci_dev->irq);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1229  		} else {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1230  			pci_err(pdev, "%s - cannot assign IRQ, error code %d\n", __func__, result);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1231  		}
e83bf68b5827e0 Corentin Labbe 2020-09-25  1232  		goto zr_pci_release;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1233  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1234  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1235  	/* set PCI latency timer */
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1236  	pci_read_config_byte(zr->pci_dev, PCI_LATENCY_TIMER,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1237  			     &latency);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1238  	need_latency = zr->revision > 1 ? 32 : 48;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1239  	if (latency != need_latency) {
9bb2720293a04f Corentin Labbe 2020-09-25  1240  		pci_info(zr->pci_dev, "Changing PCI latency from %d to %d\n", latency, need_latency);
5e195bbddabdd9 Corentin Labbe 2020-09-25  1241  		pci_write_config_byte(zr->pci_dev, PCI_LATENCY_TIMER, need_latency);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1242  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1243  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1244  	zr36057_restart(zr);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1245  	/* i2c */
9bb2720293a04f Corentin Labbe 2020-09-25  1246  	pci_info(zr->pci_dev, "Initializing i2c bus...\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1247  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1248  	if (zoran_register_i2c(zr) < 0) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1249  		pci_err(pdev, "%s - can't initialize i2c bus\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1250  		goto zr_free_irq;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1251  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1252  
5e195bbddabdd9 Corentin Labbe 2020-09-25  1253  	zr->decoder = v4l2_i2c_new_subdev(&zr->v4l2_dev, &zr->i2c_adapter,
5e195bbddabdd9 Corentin Labbe 2020-09-25  1254  					  zr->card.i2c_decoder, 0,
5e195bbddabdd9 Corentin Labbe 2020-09-25  1255  					  zr->card.addrs_decoder);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1256  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1257  	if (zr->card.i2c_encoder)
5e195bbddabdd9 Corentin Labbe 2020-09-25  1258  		zr->encoder = v4l2_i2c_new_subdev(&zr->v4l2_dev, &zr->i2c_adapter,
5e195bbddabdd9 Corentin Labbe 2020-09-25  1259  						  zr->card.i2c_encoder, 0,
5e195bbddabdd9 Corentin Labbe 2020-09-25  1260  						  zr->card.addrs_encoder);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1261  
9bb2720293a04f Corentin Labbe 2020-09-25  1262  	pci_info(zr->pci_dev, "Initializing videocodec bus...\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1263  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1264  	if (zr->card.video_codec) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1265  		codec_name = codecid_to_modulename(zr->card.video_codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1266  		if (codec_name) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1267  			result = request_module(codec_name);
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1268  			if (result)
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1269  				pci_err(pdev, "failed to load modules %s: %d\n", codec_name, result);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1270  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1271  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1272  	if (zr->card.video_vfe) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1273  		vfe_name = codecid_to_modulename(zr->card.video_vfe);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1274  		if (vfe_name) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1275  			result = request_module(vfe_name);
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1276  			if (result < 0)
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1277  				pci_err(pdev, "failed to load modules %s: %d\n", vfe_name, result);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1278  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1279  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1280  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1281  	/* reset JPEG codec */
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1282  	jpeg_codec_sleep(zr, 1);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1283  	jpeg_codec_reset(zr);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1284  	/* video bus enabled */
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1285  	/* display codec revision */
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1286  	if (zr->card.video_codec != 0) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1287  		master_codec = zoran_setup_videocodec(zr, zr->card.video_codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1288  		if (!master_codec)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1289  			goto zr_unreg_i2c;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1290  		zr->codec = videocodec_attach(master_codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1291  		if (!zr->codec) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1292  			pci_err(pdev, "%s - no codec found\n", __func__);
4bae5db2f28d64 Corentin Labbe 2020-09-25  1293  			goto zr_unreg_i2c;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1294  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1295  		if (zr->codec->type != zr->card.video_codec) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1296  			pci_err(pdev, "%s - wrong codec\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1297  			goto zr_detach_codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1298  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1299  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1300  	if (zr->card.video_vfe != 0) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1301  		master_vfe = zoran_setup_videocodec(zr, zr->card.video_vfe);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1302  		if (!master_vfe)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1303  			goto zr_detach_codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1304  		zr->vfe = videocodec_attach(master_vfe);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1305  		if (!zr->vfe) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1306  			pci_err(pdev, "%s - no VFE found\n", __func__);
4bae5db2f28d64 Corentin Labbe 2020-09-25  1307  			goto zr_detach_codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1308  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1309  		if (zr->vfe->type != zr->card.video_vfe) {
b7c3b2bb9db412 Corentin Labbe 2020-09-25  1310  			pci_err(pdev, "%s = wrong VFE\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1311  			goto zr_detach_vfe;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1312  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1313  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1314  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1315  	/* take care of Natoma chipset and a revision 1 zr36057 */
83f89a8bcbc3c5 Corentin Labbe 2020-09-25  1316  	if ((pci_pci_problems & PCIPCI_NATOMA) && zr->revision <= 1)
9bb2720293a04f Corentin Labbe 2020-09-25  1317  		pci_info(zr->pci_dev, "ZR36057/Natoma bug, max. buffer size is 128K\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1318  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1319  	if (zr36057_init(zr) < 0)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1320  		goto zr_detach_vfe;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  1321  
b564cb6e0bd587 Corentin Labbe 2020-09-25  1322  	zr->map_mode = ZORAN_MAP_MODE_RAW;
b564cb6e0bd587 Corentin Labbe 2020-09-25  1323  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--wac7ysb48OaltWcw
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICHMEaGEAAy5jb25maWcAnDzLdtu4kvv7FTrpTfeiE8lx3OmZ4wVEgiJaJMEAoB7e8Ci2
nOtp28qV5e7k76cK4AMAQaVnskjCqsK7UG/op3/9NCGvp8PT7vRwu3t8/D75sn/eH3en/d3k
/uFx/9+TmE8KriY0ZuotEGcPz6/f3n37eFVfXU4+vJ19eDv99Xj7frLcH5/3j5Po8Hz/8OUV
Ong4PP/rp39FvEjYoo6iekWFZLyoFd2o6ze3j7vnL5O/9scXoJvMLt9O304nP395OP3Xu3fw
99PD8Xg4vnt8/Oup/no8/M/+9jS5uv3t6m46m85mv7/f7S73nz/+Pttd/f7h8v5+evnb/m53
cf/77f1vs1/etKMu+mGvp9ZUmKyjjBSL6+8dED872tnlFP60OCKxQZat8p4eYGHiLB6OCDDd
Qdy3zyw6twOYXkSKOmPF0ppeD6ylIopFDi6F6RCZ1wuu+Cii5pUqK9XjFeeZrGVVllyoWtBM
BNuyAoalA1TB61LwhGW0ToqaKGW1ZuJTvebCWsC8YlmsWE5rRebQRMKQ1kxSQQlsUpFw+AtI
JDYF7vlpstDc+Dh52Z9ev/b8NBd8SYsa2EnmpTVwwVRNi1VNBOwxy5m6fn8BvbRT53mJE1ZU
qsnDy+T5cMKOe4I1FYILG9WeF49I1h7YmzchcE0qe/f1imtJMmXRp2RF6yUVBc3qxQ2zZm5j
5oC5CKOym5yEMZubsRZ8DHEZRtxIhZzabYo13+Cm2bM+R4BzP4ff3AQ23lnFsMfLcx3iQgJd
xjQhVaY0s1hn04JTLlVBcnr95ufnw/O+lyZyK1estG5eA8B/I5X18JJLtqnzTxWtaBg6aLIm
Kkprr0UkuJR1TnMutnjDSJTam1BJmrF5YIGkAlntnS0R0L9G4NAks8b2oPrawQ2evLx+fvn+
cto/9dduQQsqWKQvONz+uTVZGyVTvg5jWPEHjRReImt6IgYUSKI1CCFJizjcNErt+4KQmOeE
FSFYnTIqcMnbcF85UQIOAxYMF1hxEabC2YgVwenWOY+pO1LCRUTjRnYxW5nIkghJkSjcb0zn
1SKR+iz3z3eTw723371W4tFS8goGMhwSc2sYfaQ2iWbo76HGK5KxmChaZ0SqOtpGWeDktHhe
DdijRev+6IoWSp5FomwmcQQDnSfL4ZhI/EcVpMu5rKsSp+zxsblFUVnp6QqplUWrbLqroZey
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

--wac7ysb48OaltWcw--

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0B71EEEEC
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 03:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgFEBEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 21:04:34 -0400
Received: from mga11.intel.com ([192.55.52.93]:30540 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725863AbgFEBEe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 21:04:34 -0400
IronPort-SDR: 3MFA8KxFvzpFmFVy0Tt1j2Do25Bsc/Z0IMElzwvzbCbVX2ISNb7yixRss+I3fjprAFdM8+/11d
 3ldA8MDpxyyQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 17:25:32 -0700
IronPort-SDR: fOD98sZ+m30eITCnIePssCyP1pw0F3UqniIUvBn0YwC6ln/4u9Gs3DZVR2RxjrTYXJdvEl4gTs
 koIeYLn6T5JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,474,1583222400"; 
   d="gz'50?scan'50,208,50";a="471610527"
Received: from lkp-server02.sh.intel.com (HELO 6de3076d9aaa) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jun 2020 17:25:29 -0700
Received: from kbuild by 6de3076d9aaa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jh0Ar-00007B-1j; Fri, 05 Jun 2020 00:25:29 +0000
Date:   Fri, 5 Jun 2020 08:25:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: drivers/staging/media/usbvision/usbvision-core.c:1432: undefined
 reference to `usb_submit_urb'
Message-ID: <202006050850.ygXbXAHI%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   15a2bc4dbb9cfed1c661a657fcb10798150b7598
commit: 8fb12ce2ec9d569e1b3051f01cee13ff27e29466 media: usbvision: deprecate driver
date:   3 months ago
config: powerpc64-randconfig-r023-20200604 (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 8fb12ce2ec9d569e1b3051f01cee13ff27e29466
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

powerpc64le-linux-ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'
powerpc64le-linux-ld: warning: orphan section `__timer_of_table' from `drivers/clocksource/timer-microchip-pit64b.o' being placed in section `__timer_of_table'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_write_reg_irq':
>> drivers/staging/media/usbvision/usbvision-core.c:1432: undefined reference to `usb_submit_urb'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_isoc_irq':
drivers/staging/media/usbvision/usbvision-core.c:1323: undefined reference to `usb_submit_urb'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_read_reg':
>> drivers/staging/media/usbvision/usbvision-core.c:1353: undefined reference to `usb_control_msg'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_write_reg':
drivers/staging/media/usbvision/usbvision-core.c:1383: undefined reference to `usb_control_msg'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_set_output':
drivers/staging/media/usbvision/usbvision-core.c:1695: undefined reference to `usb_control_msg'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_set_input':
drivers/staging/media/usbvision/usbvision-core.c:2005: undefined reference to `usb_control_msg'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_set_video_format':
drivers/staging/media/usbvision/usbvision-core.c:1633: undefined reference to `usb_control_msg'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o:drivers/staging/media/usbvision/usbvision-core.c:2080: more undefined references to `usb_control_msg' follow
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_set_alternate':
>> drivers/staging/media/usbvision/usbvision-core.c:2233: undefined reference to `usb_set_interface'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_init_isoc':
>> drivers/staging/media/usbvision/usbvision-core.c:2286: undefined reference to `usb_alloc_urb'
>> powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.c:2291: undefined reference to `usb_alloc_coherent'
>> powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.c:2318: undefined reference to `usb_submit_urb'
>> powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.c:2318: undefined reference to `usb_submit_urb'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_stop_isoc':
>> drivers/staging/media/usbvision/usbvision-core.c:2351: undefined reference to `usb_kill_urb'
>> powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.c:2353: undefined reference to `usb_free_coherent'
>> powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.c:2358: undefined reference to `usb_free_urb'
>> powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-core.c:2368: undefined reference to `usb_set_interface'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_release':
>> drivers/staging/media/usbvision/usbvision-video.c:1360: undefined reference to `usb_free_urb'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_disconnect':
>> drivers/staging/media/usbvision/usbvision-video.c:1578: undefined reference to `usb_put_dev'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_radio_close':
>> drivers/staging/media/usbvision/usbvision-video.c:1118: undefined reference to `usb_set_interface'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_probe':
>> drivers/staging/media/usbvision/usbvision-video.c:1414: undefined reference to `usb_get_dev'
>> powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-video.c:1543: undefined reference to `usb_put_dev'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_alloc':
>> drivers/staging/media/usbvision/usbvision-video.c:1329: undefined reference to `usb_alloc_urb'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_exit':
>> drivers/staging/media/usbvision/usbvision-video.c:1638: undefined reference to `usb_deregister'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_init':
>> drivers/staging/media/usbvision/usbvision-video.c:1625: undefined reference to `usb_register_driver'
powerpc64le-linux-ld: drivers/staging/media/usbvision/usbvision-i2c.o: in function `usbvision_i2c_write_max4':
>> drivers/staging/media/usbvision/usbvision-i2c.c:348: undefined reference to `usb_control_msg'

vim +1432 drivers/staging/media/usbvision/usbvision-core.c

781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1337  
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1338  /*
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1339   * usbvision_read_reg()
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1340   *
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1341   * return  < 0 -> Error
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1342   *        >= 0 -> Data
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1343   */
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1344  
483dfdb64fd4a9 drivers/media/video/usbvision/usbvision-core.c Thierry MERLE         2006-12-04  1345  int usbvision_read_reg(struct usb_usbvision *usbvision, unsigned char reg)
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1346  {
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1347  	int err_code = 0;
8926e8453476ef drivers/media/usb/usbvision/usbvision-core.c   Hans Verkuil          2015-07-20  1348  	unsigned char *buffer = usbvision->ctrl_urb_buffer;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1349  
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1350  	if (!USBVISION_IS_OPERATIONAL(usbvision))
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1351  		return -1;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1352  
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19 @1353  	err_code = usb_control_msg(usbvision->dev, usb_rcvctrlpipe(usbvision->dev, 1),
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1354  				USBVISION_OP_CODE,
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1355  				USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_ENDPOINT,
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1356  				0, (__u16) reg, buffer, 1, HZ);
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1357  
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1358  	if (err_code < 0) {
be9ed5117d95cd drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2009-01-08  1359  		dev_err(&usbvision->dev->dev,
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1360  			"%s: failed: error %d\n", __func__, err_code);
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1361  		return err_code;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1362  	}
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1363  	return buffer[0];
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1364  }
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1365  
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1366  /*
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1367   * usbvision_write_reg()
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1368   *
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1369   * return 1 -> Reg written
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1370   *        0 -> usbvision is not yet ready
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1371   *       -1 -> Something went wrong
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1372   */
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1373  
483dfdb64fd4a9 drivers/media/video/usbvision/usbvision-core.c Thierry MERLE         2006-12-04  1374  int usbvision_write_reg(struct usb_usbvision *usbvision, unsigned char reg,
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1375  			    unsigned char value)
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1376  {
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1377  	int err_code = 0;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1378  
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1379  	if (!USBVISION_IS_OPERATIONAL(usbvision))
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1380  		return 0;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1381  
8926e8453476ef drivers/media/usb/usbvision/usbvision-core.c   Hans Verkuil          2015-07-20  1382  	usbvision->ctrl_urb_buffer[0] = value;
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1383  	err_code = usb_control_msg(usbvision->dev, usb_sndctrlpipe(usbvision->dev, 1),
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1384  				USBVISION_OP_CODE,
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1385  				USB_DIR_OUT | USB_TYPE_VENDOR |
8926e8453476ef drivers/media/usb/usbvision/usbvision-core.c   Hans Verkuil          2015-07-20  1386  				USB_RECIP_ENDPOINT, 0, (__u16) reg,
8926e8453476ef drivers/media/usb/usbvision/usbvision-core.c   Hans Verkuil          2015-07-20  1387  				usbvision->ctrl_urb_buffer, 1, HZ);
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1388  
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1389  	if (err_code < 0) {
be9ed5117d95cd drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2009-01-08  1390  		dev_err(&usbvision->dev->dev,
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1391  			"%s: failed: error %d\n", __func__, err_code);
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1392  	}
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1393  	return err_code;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1394  }
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1395  
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1396  
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1397  static void usbvision_ctrl_urb_complete(struct urb *urb)
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1398  {
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1399  	struct usb_usbvision *usbvision = (struct usb_usbvision *)urb->context;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1400  
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1401  	PDEBUG(DBG_IRQ, "");
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1402  	usbvision->ctrl_urb_busy = 0;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1403  }
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1404  
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1405  
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1406  static int usbvision_write_reg_irq(struct usb_usbvision *usbvision, int address,
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1407  				unsigned char *data, int len)
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1408  {
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1409  	int err_code = 0;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1410  
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1411  	PDEBUG(DBG_IRQ, "");
6d6a48e51fd3bc drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-29  1412  	if (len > 8)
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1413  		return -EFAULT;
6d6a48e51fd3bc drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-29  1414  	if (usbvision->ctrl_urb_busy)
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1415  		return -EBUSY;
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1416  	usbvision->ctrl_urb_busy = 1;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1417  
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1418  	usbvision->ctrl_urb_setup.bRequestType = USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_ENDPOINT;
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1419  	usbvision->ctrl_urb_setup.bRequest     = USBVISION_OP_CODE;
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1420  	usbvision->ctrl_urb_setup.wValue       = 0;
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1421  	usbvision->ctrl_urb_setup.wIndex       = cpu_to_le16(address);
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1422  	usbvision->ctrl_urb_setup.wLength      = cpu_to_le16(len);
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1423  	usb_fill_control_urb(usbvision->ctrl_urb, usbvision->dev,
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1424  							usb_sndctrlpipe(usbvision->dev, 1),
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1425  							(unsigned char *)&usbvision->ctrl_urb_setup,
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1426  							(void *)usbvision->ctrl_urb_buffer, len,
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1427  							usbvision_ctrl_urb_complete,
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1428  							(void *)usbvision);
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1429  
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1430  	memcpy(usbvision->ctrl_urb_buffer, data, len);
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1431  
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19 @1432  	err_code = usb_submit_urb(usbvision->ctrl_urb, GFP_ATOMIC);
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1433  	if (err_code < 0) {
52cb0bf275debe drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1434  		/* error in usb_submit_urb() */
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1435  		usbvision->ctrl_urb_busy = 0;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1436  	}
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1437  	PDEBUG(DBG_IRQ, "submit %d byte: error %d", len, err_code);
5490a7cbe65d63 drivers/media/video/usbvision/usbvision-core.c Hans Verkuil          2010-12-19  1438  	return err_code;
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1439  }
781aa1d1ab7ba1 drivers/media/video/usbvision/usbvision-core.c Mauro Carvalho Chehab 2006-12-04  1440  

:::::: The code at line 1432 was first introduced by commit
:::::: 5490a7cbe65d63c6ec45f1013287af1e390c95d7 [media] usbvision: get rid of camelCase

:::::: TO: Hans Verkuil <hverkuil@xs4all.nl>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--n8g4imXOkfNTN/H1
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICDCB2V4AAy5jb25maWcAlFzdc9y4kX/fv2LK+5JUajf6sBX7rvQAguAMdkiCBsgZjV5Q
WmnsqFaWHGm0Wf/31w2AJACCY1/qLrG6GyA+Gt2/bjTm559+XpDXw9OXm8P97c3Dw7fF5/3j
/vnmsL9bfLp/2P/vIheLWrQLlvP2VxAu7x9f//rn16f/7p+/3i7e/Xrx68kvz7eni/X++XH/
sKBPj5/uP79CB/dPjz/9/BP8389A/PIV+nr+n4Vrd/H2Yf/LA/b0y+fb28XflpT+ffHh1/Nf
T0CeirrgS02p5koD5/JbT4I/9IZJxUV9+eHk/ORkkC1JvRxYJ14XK6I0UZVeilaMHXkMXpe8
ZhPWlshaV2SXMd3VvOYtJyW/ZvkoyOVHvRVyPVKyjpd5yyumW5KVTCsh25HbriQjOXyvEPBf
IKKwqVmfpVnyh8XL/vD6dVwB/Kxm9UYTudQlr3h7eX6Gy+lGKqqGw2daptrF/cvi8emAPfSt
S0FJ2S/Jmzcpsiadvypm/FqRsvXkV2TD9JrJmpV6ec2bUdznXF2P9FB4GO4gmRhrzgrSla1e
CdXWpGKXb/72+PS4//ubsbnakibRUu3UhjeejjgC/i9tS38AjVD8SlcfO9axRE9UCqV0xSoh
d5q0LaErv3WnWMkzv93AIh2cjUSPZoGIpCsrgSMiZdlvOujP4uX195dvL4f9l3HTl6xmklOj
Xmoltp72Rxxdsg0r0/yKLyVpcee97ZI5sBSspJZMsTpPN6Urf5ORkouK8DpF0yvOJM5wN+2r
UhwlZxnJbgshKcvdWeH10tvXhkjF0j2a3ljWLQtltmz/eLd4+hStcNzIHNTNuCkRm8JBWcMC
160amWYz0Ty0nK51JgXJKVHt0dZHxSqhdNfkpGW9WrT3X/bPLynNMN8UNYO997qqhV5doy2o
zGYPSgnEBr4hck4Tqmlb8bxkfhtLLbqyTOq5YSc5K75coVKZRZUqlHG7MZmYdzIlY1XTwgdq
luy/F9iIsqtbIneJKTmZcWX6RlRAmwnZng3rnprun+3Nyx+LAwxxcQPDfTncHF4WN7e3T6+P
h/vHz9EmQANNqOnX6ugw0A2XbcTWNRzETXpeKXHQjcTsUMWNxgbf9Q2Nois4OWSzDM9IpnKY
sqAMjBu0bf3Rxjy9OU8OE32Vakmr0pujeHLDf2BZB9sLS8CVKIm/LZJ2C5U4BrB/GnjTjQ6I
8IdmV3AEvK1XgYTpKCLhRKf9wNzLcjxjHqdmsOaKLWlWcv+AI68gtejay4u3UyKYblJcnl6E
HNXaI+ZvEXIyIZIe3gxA0AyXz7d74cINGrS2//AM7npYQEF98gqMLxzjkVQKRAcFuB1etJdn
Jz4d964iVx7/9GzcGV63a4AUBYv6OD23m6xu/72/ewVsuPi0vzm8Pu9fxp3uANZVTY+UQmLW
gX0F42oP97tx8okOA+utuqYBXKZ03VVEZwSQIw0OkwOAMPDTs/ceeSlF1yh/bwAr0GXySGTl
2jVIsi3LnthjAg3P00fO8WVekWP8AjT8msm0SAOIZuZEu+Y523CaNlxOAjpBu3F0DkwWx/hZ
c5Rt3HraGwFOBFAAxivdfsXouhGwjeiYWiHTE3FWE3Dw/HYBRigUjATsDAVPnaeOIiuJh4Fw
/2H1DIKXfsyAf5MKelOiA6Tj4WyZTxAzkDIgnaW+l+vyuiKR9FXaOxthMdfLW2/YQqC7DK0E
nAcB7rKC6AfhmdlQISs4NgF2iMUU/GMOE0OUkWMsREXONIAfohmGN3Vv/odOjwqmowEL+oO/
wQ9QZjw+2HxCWeQ4G6qaNcwLvA9OzFuOphj/iH1JBfEKhyMk/fGqJWsrMFfawcr0EHH7Y9hZ
rEht0VgQrVg85bs6NKjx37quuB/GBZCElQWs34z6R3NPjDcjgLoREnpj7Vp2Ff0Jtspbq0b4
8oova1IW3jkw0/IJBir7BLUC6+pPg3CRnAEXuoNFWCaGTvINh8G7tfZWEbrOiJTcbJ6jrVFk
V6kpRQcbNVDNwuC5R3QXKI23u374KE2MW6TMxxBXjCPT2ENG6DpwORACfUy0h1Ysz/3shNVs
+KaOY5iGnp687TGWy9o0++dPT89fbh5v9wv25/4RUBoBd0oRpwFoH11y2OPgdH+wm76XTWX7
sN7bKvh4hsoum5r93sqIqiEthFTrsAnJUkcNegrFRFqMZLDwcsn6PISnhshDN4rwTks4o6Ka
42KADXFdoMRdUZSwDwT6hu0U4D6EnEwWERREt5himol+RMHLtI4bg2bcXLAhYUZp2L2GXgxb
3zw/3e5fXp6eIST7+vXp+eDtckPRF6zPlTby40h6BgNGYjRDXOsA6WDLtkz+C6np+SH7/XH2
h5g9Gaqn4UArGg/DkxLPKA0CNXU1dw5ZbbN3Tclb3VQQIrUYzYf9S5JjMqnqZshTVUK2TZl1
rAnJU4oTJE28+khLr5Jjzh4dFKgq0DjAdCrxtQYG7cBxyDVnnra+GzJpGq0qb9TBH7U0+BLT
lV5HuRAyY84uOkWdamEAUXWG1q3OOUm5exSATWpht6xMMPCLtxbQbCVpGt/UX7zNuO/J/U00
GlBVsI6yBvjFIVCA4Oby/PyYAK8vT9+nBXqD1Xd0+q8fkMP+TsPgnrUWS9tsgWTEW2yMQXuW
8QS64BIMEl119TrYFMz/Xb4b4zPADZr7nhu3aUtausqFn3trwQ8ZSzPVEEuGjouSLNWUj0cH
oPOU0dsKFMhgQuspa7VlfLkK1TEca+8sa6Ea5vEYkeVuipZI7RJ/GJifvh8vCszqB7jRJJEn
dBMtiAoMQwE4Hg4NWl5ft+yukl0PLXWRR0Pu8mypTy/evTvxWmF+2LSdLoKFcwFQ4BmTFgMj
TFQ884Gji3JhPUCtvsOuRQ3xoXD2OpRwYbIxJ8aDGQc2J9aBk8piu5KTrbc0zdJei5i0tbp8
60tiThh0vyKRHbziNOqT08Zl1Kb01SamKS1bouI+47ZIwQRzIwfn+HBzQCjj+cbA0hqfVG9m
QkpR9enoGTvcABrk8WqBwwEU4Bv8vE1FEK6xRv1Y7i6/+F8mdSlSxh9QskVcQW4Qv0eLIFow
A6mQkQreNilnwLNqw8Wkk00qmlgD9Ft2zE+VMVx3xD8Es6HhkqQ2WhTWrGMgDXFGcHlnlM5m
VIs2hJXm2KEyYICrRJkKTu3kG4jtruCYB4axajgN/wKdXcpI396fvfsQAYJA/cz3mZQQH8M+
LYO8Uy8Np4aFeUYkuhTdGAggEUyuWqXCAba6HHPbi+J5/5/X/ePtt8XL7c1DkM42KyWZpxM9
RS/FBq/BJPqeGfb01mFgY7p4Lu9kJfo7P+zIyyn8PxrhGVRkJrWebIJRmMkZ/XgTUecMBjaT
p0u1QP1icjPJ+h9rYxxL1/JyZqXnki6BzI+tx+w6pAT72c8qwDjVGRF/ZoNGfoo1cnH3fP+n
jTT9+4OE6vZ98LuHvWs1lBlAAySH6s2DtEpPMWMrCQTNMl7QgV2xOhVyBDItEzOdryDqcHkQ
61Jwexo6jHKRe1OOTDvOLy+jjewR82w//sLZdfAo/nqNHwSQAaaEpj8U+0A/Y/D0FQs8gsGv
rvXpyUn6fvBan72bZZ2HrYLuPJC0ur5EQuhmwAvUilDEQqTE9EmqEiLXeKMBNgmDbUS3viU3
wXVfyOB9TbRN2S0T0MiE64h2MPvDiIrBlYsfXSWB6+d7MhL+FXk6iF8GeOUEC8LLTnpia3YV
xrWGoHFG6Sw1piBIFl77euS5YhIqwdPovPODvIL0hDEZJz9qc1UGwV86ad+FNxYBloTVpG0/
1Urk/nYYCfB3LbDd6sVQ1BQI/AB7muTZqXGlV92StWVW+ACnLNkStMuBfb0hZccuT/56d7e/
uft9v/90Yv/je/K3a4OZAwiC9IueMYcMMVUUX6O50iFHHoAza9lVOxE2afKYaAN2vKa7FjUT
Es3e6Xl8DaKq1N4bUMVqdD8lV5McPa1yBGEIylJo1bG9mw4YtCS6JRIWWnl0F5R4++KiFHeN
NWWoNYfAclf7ERZmOFiQTnGUMEPhU9NhEEjgtdC0ty1Z44FZqzTVVWqdevrgc5fBYIMuTMwQ
KEyFOWx0+vl8WqefyKR1br5rY/lEw+1Hixg0KwpOOQYHk5NhQ4z4LCpGMTAOoSuerDXbpdLC
va8YzpMCy1ERTQzANi4ke33xXMronGx5j5X3LI8qdZlR/1N+B0N2A9AJwFDoITbu5pSJokBo
e/LX7Un4n9G4moo16EMeE2tWO8UpGQVjAWN/4tyxzfD1mXD/6gOJVcVFSNkUMSVOTgw9ohXO
dg1RKsHcmAQSHhoICoPLMgy/OqxyjArHoFX4YZcatjdWMskD33WMjQHfJDMRNA98WtBvk77P
RiHMFqTrbLCwUNcsHZJYrqJxHUvAtuWBNs2o0R/QVBGSvd4ENNw4mBHUd9483/77/rC/xbKE
X+72X0F394+HqeJbb4uXdpGnj2jma8IhmGDFbDYmOZ3fwGcD8s1YylqbHkeD0AGo4ssab8gp
VglFPhXCCFM02vJaZ1igGQ2Nw2gxwQmjmehpnC+yVMnaJEM0abrrBuIUDPind7tFVxts6IJu
Xv/GaFwWCWLB/elYtml6XIHmTbNy6DYM1Le+Oc7QYXAOcIIXu/6mP+peVWhVXR1uPCvJlkoT
dHCYeHVr78xlIKf8yN2QVlttkqkGq0Q87/IuMWPMBU9Tv7ZTInP0XqYeo4UVhKUMk5Vj/zj2
FB1DTjefEEaOyz1qpofPq04vSbuCxhagIhhIsrEa6jsiFlzx6xgbDvM3hUq0aq7oKkbsW1jU
HvDDjnzsuIy72RJMsBkQh6Wqfe11Qshl+39IVpS5J59aN+ePEfUHueg5ur1RwK3Ag2m204th
bflTyDaVmb6BCdlzhgT+bSAqnqP1tGIxUf34fQk8gbGZ+W5tZH+aa4wC0LAhykdtSMkhT2+q
iTWzay0KwEkwrF3EhdPcBxqM8iLIFoq8K8FIobnEagwsGkhMgV3xFg2Zqe/G9U0YFdPcIIlA
i8fxBTdTUQchb7yxSrT2rqPmOvFFotsqKppdH7S05dS6ldzesA7XSqmZ1BtJKjD8XnNaCgw0
oNUWLJLHwDOi+HISQbgxOjaJTL/jnp/BHIwCRVMVjUsrOCAot1eJLVEt+IM2lPHOScQ8VvyB
QFK3wmHdsQgKLK9fLxG4dYsvqNj88vvNy/5u8YeF3F+fnz7du1TvmOwBMTeUY8MwYn1ahITX
tce+NODhslvi0wBATZRevvn8j3+Ej0nwFY+V8XYwJHpD7sma7ux9XInnZJeENp50SVpcMPh/
CcqYKlUYZfFAwUZ1YXF0UmA+Ux0VXnwH6g0ZmVZXWD7lAxtTWKQqXPmTyIT447MkF9mXgqTq
ipxMVyN/trFlp5tPEcosdHF9wvEGAEtTY1WSDi+PZt4Y9JI8XfTp2KgHEjDRMRm8rtzqikOY
UXvVoppXJtGTmG5Xg4UGS7GrMlFOJqZswXgJcLDzXEMW1oZg5SdGErAMH8N7rr4mNFPLJLHk
2ZSOCael5G2yttSxdHt64i92L4CZntSumuJkl7Qx6EPGrbdZOlCyPeN9cJFeejN7vCFvwlIm
mwC/eT7co/ov2m9f92HeG6ufDE7v8x0pbVS5UKOol6UoeEAeM9jRF4M9m8TPOPjqo24on9AQ
h/jhN5JN8sa+5BJj1XkwLWjJhU2tYRkrrnhaY0e59S6bKdjuJbLiY9LyhKMYjPHwtAaCER7U
khJVn45/4StHoxKqAYuHJmECQIYcKWkBf1AtK+91mjFjtjFso9jWPuKUW8WqOabZjBneWBhZ
cbH1Dkj895gjNBvA/trfvh5ufn/Ym1esC1OWePBC7IzXRdUinprggRQL/ghDbyekqOT+myNH
BqtD/X4lGzLlbrfmBmhGX+2/PD1/W1Q3jzef91+SKYJ0snxQlj5TDo6qI8ky5CEdbkW8qKHn
xADXfqoxbwfbhLxJ7DIfRY2sDfwXAsc4NT+RmH7UHtYaK8CnfPNoZunbY6Mxa0yI9m09pbFT
8F8a+Y85vOua5IqZesDW2g6sbnsbKE4ELhMvMP2bn3bVpEQwYkLJsNTGAEOS5xADJ4rXhrMd
ZIBU6iasv3I2e1Hx2nR6+fbkw0X6oM9dO03o43XethGwvrVLtaQrVlNh2PjYLMGHBdmSXcpn
J6UrW/k9jjeWMpkASsCe+l+mENzXhpq+QZ95bHPdpG8+rrMu96tzrg2mE6nnmH1WyZatubTZ
OHzYNiYlQhMHQnGS+JbEH73JRhlOH24fjTVarHYOo1xb0raJEgJ9pk/ZV57QRJtSv4SRboYL
gF5xmcToffJ2sJ82vv9hNV1VxH9Hb+JGUZc7c0rwMUmR/FrLbLBNghBl3nj2PdSmoMVY2np/
+O/T8x9YgZC40YZDvWYpHQZn6YWC+Bd4guC5gqHlnKRhLATFSfpVISuTKUtfnjKMJNOhz1Xe
aCXMm7hU+Zed8qgrjX2/gq+S02CjGW+epADXnsrxgFBT+2/Fzd86X9Em+hiSsWgrXbrsBCSR
aT7Omzf8GHMpUZ2rLhVfWwnddnUdOkm1g6gS4DyfyZTbhps2fS2A3EKkS9Ydb/xs+gO4LZqs
5nkQsswzeYN+Z2a3x+n6RFTIiNTSpieH3Xd5M6/ARkKS7XckkAv7AmZLpNUWvw7/XB7D/YMM
7TI/rdY7s55/+eb29ff72zdh71X+LgomB63bXIRqurlwuo4gJ/0q0QjZd24KLxZzki4Mw9lf
HNvai6N7e5HY3HAMFW8u5rmRzvosFXkNR9MXMrX2hl3nAGcNAmt3DZu0tpp2ZKhoaZrS/SrK
zEkwgmb15/mKLS90uf3e94wYuBQ6dzQnl18jCGxAZeaa4Y+9YE4dndVRGYBrJp0Ibq9qIj/s
C9u8fDqQbo4wwarkdGacWBBBZ+ysnHlNDLuTXiuIIZL08mzmC5nk+XL22aexCCrIbTpS+t61
JLV+f3J2+jHJzhmdu9AtS3o2MyFSpvfu6uxduivSpH/0pVmJuc9flGLbhA9Wxv1hjOGc3r2d
04ojz8Jzmnq/ltcKnzgL/FUfH29msH3EZFSSnYmG1Ru15S1NW6lNAk4Ep4jX63nzXzUzPg9n
WKv0J1dqHvjYkQJknZUozwH4KzTfx6Tq6Jq/Pxv+PYMszO9h+O7zKnz6716nY4eNnHmZ6snQ
kijFUwbW+FH88QQFoXXwajb7GIAVfFf6W/JnhgzYwFynLTwKke3isH85RPcAZtTrNvqhkfBM
SgGuU0CIIaItcSh70n3E8BG1t8GkwhdyM+s1c2RmkpGkgIWTc5ar0GuaioC3HO9wVbiZxRKP
5OkkYzkwHvf7u5fF4Wnx+x7miVmbO8zYLMDJGIExL9NTMObBKGVliu7MnbNXubrlQE3b6GLN
k+/GcVc++E/szN99ZvJLuH0fjv1wAiV85icXWLPScz9yVRfplW4UwTuZeQBdpHkpP94bNCy3
ccF5HylidR6zj7jHJBfhpdgkQxPWrlqIyns7FWWNmDtM/VnJ93/e3/oF2b5wkA+2FyYBKf7D
/a6VComJJ+FAZphmyWZqZZFPVJPSYmRB/FuF36gUnxCSv7SFPCxgCN+Wm7HPao2ZRNulHBCy
SBtNmFFSxb1zsZlpDkY0Fm5I2mL2hdnBuntETWc5ahUUUHgc2ZBZhs7duyx7i0H54vbp8fD8
9IA/MnMX6ww2Klr471O/dh2ptows+hGhgeFSQLGC6Ct8+X01MU35/uX+8+P25nlvRkSf4B9q
8o4bO8i3wdeQoIOKVkfD34CYfN3RzRDn9LCXYU28hQCBRZ10H8eGb03v/3H2ZEtu40j+ip42
uiOmY0Tqoh76ASIhCS5eJiCJ8ovC7aodV6zLdlRVx3T//SIBHgCZKc7ug7tLmUmcCSCRFz4/
PkEaAY19csb7DQlWhzbELOG560fgQk3rCVTTawrVfuqPikfBS7SH0x3orFQ4R3Xcxr8//vzx
/N3vMngiDny8XGiTxWU/XJR631O86ZFTfVdFV+nbv5/fv3yd5HR5aQQzxWNzCDmF0kX0JcSs
Ah1p9zuLBXMPMwsx5u1bLIhMP7qMwR7adOO3L59fH2d/vD4//svNK3XluWJ9rebnrQjdabYw
vR4LLL7OYpWzyzSQQh7FztlJymS9Cbduh0QUzrdYRh87Fr3PstuaipViIDX1fqXPX5qDa1YM
jUQn6zVy5KkX/+6B9T6rjo4XvpadVVbuvZOhhWmJ8JTj0phudJ6w9E4CP1PnXlTZhVXWbTQZ
dWj//Pryb9gUvv3Qy+e178n+YnjA7UUHMkrvBHKLOfY6E2PQ1uZ0r//KOCR2Q9MLFRiBFjVs
Mha0c/0nmF9CT9QbHJpVMuyuI78a5wWw4rfGQ+IODMb4pBJnQlXQEPBzRSheLAHsCU0xNxuJ
hM9idvtYyNvDCRLTEpFCpijrX94UaFx03TVgv2+xZMyRk0zERGLYcv7G0OdTqn+wnT4rlRdX
XfGDZ+Kwv28ijEcw6brXdrBM9BtFA7wEIzrfXb+txA21hngHeWSVZdS9z3OA3JsTxXjDoecJ
sda76IlHI8M6iz8rasVV33opQE6HOdSbpcuF7tfOrlpo6Zxw7jzk+gLlTGimMEEtUc4gF3v3
bzCPKOW5x2ggGK2V57urgdYkhqIeit0HD5Bcc5YJr1Zj4fQ81zXMmxn9O+d+Q8DEXZ31VHlW
cIsANYsHgxuIl/wNGqIntFVP6yOEV57F3PpRQmaLLkuEFjAHiVcIgCb2zscGCnGjqJ2//0zv
hns/Sr9HyZPJFXv/++50HqBYHUWb7RorOggjLE1Qi84L05+ha5On9micmfJTmsIPXEPQEO1x
tZmuTiT4jtZ+CWKdlHrClSgXYY3fzVvi0yDMdESQFgWhH20IkmqHN7Xr7gRePkzg6+guvmJ4
D+KkKjJQDsXJGa8BoguB5eGKjesNjUZicq6mRqCS9fjWk58zPr7mAHQQGdON49n1RzGE1hwB
Qo+rhwbM8ZKhWQUNcs92lZeMxELjUSkDC4KHMjGP/QpygIZncMw+puDNN4P6LXZkyGj1c+4Q
Wm+j57cv4+ND8lwWFUQzykV6noeeKwNLVuGqvum7Bi4NaoElu8I2i+vAd9k5w9wgyiPLlRsk
p8Q+szP74oE2dR30ID0t20Uol3PnYNanaVrIUwWpk6qzSXnV0R/12Zw65zUrE7mN5iHz1UtC
puF2Pl8gDbWo0Lngt8OlNMZL7dMidsdgs5l72VoajKl+O8f3nGMWrxcr7MKQyGAdhX1FcELq
ft54XC7aJJ794V+xgbKouymaY7gjtOqGm0z2bjol8Ge7VUo6Tg/luYRsSj0gDpsDyzrgcS2u
ZVj6HIvR+0iIm0B6/ArpdYO1AXh9sxtwxup1tFmN4NtFXK8d5mihdb0cg0WibtH2WHLd3ZdR
uzgP5vMlurQGfXZ21d0mmI+ScNp0709/fX6bie9v769/vpiMiW9f9Y3gcfb++vn7G5Qz+/b8
/Wn2qBfp80/40x1LBTo5tC3/j3KxlW+k4hcUAzK0uyWAuZLBPbAcu/6K7+9P32ZaNJv91+z1
6Zt5XWSkyDkXpRFNXxyA88NoySDTp6tnuFewc1G4fPQvDvp3l/O0CQ2seAzH2vX3wJny+Iib
Ksx6YGkM6XBjzJzULZhGTel/aRAniSvaj2zHcnZjeFJ1b7P29NRaxPHdwcbMZkJc7cfj4Tde
61nhqGMqJhKTAsiZE6Dyf/mh2QYCyYqsz1ZfbVPf7P3vn0+zXzTb/c8/Zu+ffz79YxYnv+ll
86vjm9sKMU5b4mNlYcozcbaURI7r9iPCENKiCQuo6Ut3kCCzbAhio7Fp82+6mCbFE1025Ouy
d2V8qlS7Vt8G06RXZTcxfpH72CLoSoX574jIKx7exhnPu4GnYqf/N6oXUDaMmlBVWKqqxJrX
pm4f9Hk0nBeTOo5qdXIczUByvFUJw0SNFq1lAXkZ9UYjOCqhtFiWnpi7D2Ery5OZsT0iwS46
GRqyMTCH2d9dygcf2vCrHGeE6K4fmE2pkRsH0lasz0PrRe3BIDbMmB0dWNnsDf3pFFtnRkx6
AdEVFGq9TOzIXTDIFo4p0k5+pKz93RxUvU6ugTJUF2eRxjJ74L/rW+row1jhHkINGlna9qDj
nM+CxXY5+2X//Pp00f9+xYSgvag4mKKxxjUoyGl59c66e2U7JwyLtVhXQLoeo2HDBiDnyib3
d+8z7eS7DFPkCbWDGRkfxUDrDydW4Rc8/tEkmbjj40pYmo23IicurrrX4C+E3zdKEnWuKQyo
Fwk16IHwftJtkJxsezxOO9ivlBPeCA2/nc3EmOwTxNfnias45aeUp9nQPNduWNXQt8oaHZ+1
OPn8x58gZUlr3WFOnCOWxO0//aSTwSFQ39PHQffP+raiZa1FXAxsysY6tIhXG/wu0RNEW3yE
9JWF4zcvdS2PBa4P6FvEElYqPwNXAzLZYPb4EncLOHB/yXEVLALKjbn9KGVxJXQl/omXirhA
bQ/ep4r7gS8s5voeh7OBlemVnOpExj75hXItwbZTOfWtdwzqn1EQBKR2qQTGXODefc1s51mc
oumi3Vr1JpQrwVA209yPw6FDhSfnMZVSnoZpQCLwZQwYah6mGOKkrzCeY6WF3PJdFKHZ9ZyP
7ftk/sraLfEFtYsz2BiJ8NC8xgcjphhMiUOR429OQWH4wpRXqbgJ4qU+nGA53WGw4Hv9zTEJ
zflm5GDg4c7i5A2fOp5ysAdCumnifRuX5DxNsjsQu5RDUxE0tn23kji2UvHxNDQvj5CDNiKD
cOSp9NMAN6CbwldCh8YZoEPjnNijJ1umBcrC35wE+iae8wnk7sm9BXXgmcgFuqn1ItHkbpf4
Z4UN1EgFqjF2vmp82PqK0hDXrkvNDcPcBOPyeHZKuZenYsfDybbzT83TkP1AGsgtLyG3fa6P
sszmXJgqaX/6IJQ8IUf5Pjt/CKKJ3e5QFAc/39UBzbTrfHI8sQsX6OqFpM11jaN23qoGvTV1
LgFukq0gZN9zAeQBujnzJvGpRzcnIiMOuBpJw4ltRdTUJxpBVAIYqrgl1TKNoL4hMjDvs2CO
M7Y44CfIh2xi5jNWnbnveJmdM2q7kw8HvGXy4YpdY92KdC0sL7xllaX18ka4WWvcin6YSWPl
5S56f5loj4grn9seZBQt8RMaUCt8m7YoXSN+IX6Qn3SpNaEHHbSnGO0geRxGH9Z4amCNrMOl
xuJoPdqb5WJirzC1Sp7haz+7+n6n8DuYEyyw5yzNJ6rLmWoq6/d4C8JvYDJaROGEfKb/BOO8
J1/LkGDgc43G3/jFVUVeZP7Lr/uJIyj3+yRutYmz/j9s+tFiO0d2fFaT11MePgzZavh1Obyn
Ii0/a/nFO8rtI8ODnXz8YfHg9VnTo7Hbzhc2XliPxUHkfrKeo74iad5Hu3Ll4Oy1FxNXlpLn
EjJ/eSdSMXnmfEyLg+9N+DFli5pwcfiYkrK6LrPm+Y1Cf0RjN92GnMBgknkn6seYbfTJBso7
vFB4SoNToXxVNjn5VeI7Uq7ny4nVVnG49XrSVhQstkS4HaBUgS/FKgrW26nKNJ8wie5NFYRf
VShKskwLep5qV8IJPbw1I19yN2OkiyhSVu31Pz/NH6GK03BwiYyn1CNSpMzft+JtOF8EU1/5
thQht8QRoFHBdmJCZSZjZN+RWbwN4i1+HPJSxFQueyhvGwTE3RSQy6kdXRaxXrm8xrVcUplD
yxsClelF8B9M78l/A5yV5TXjxLNywEKEI1MM4Wo5cWYJ7FEEtxHXvCilnwgiucS3Oj1kqC3G
+Vbx40l5266FTHzlfwEhIFp4gjBcSQT6qkkN0dk/M/TPW3WkEjgB9gwJvgeZ6cbFXsSn3M/F
YCG3y4piuI4AfyfBKdw6b7iFN+4crBb0NtrQpKke68kJqkWFK2EBEZa43XGfJDgvaWmQ2PlB
Qr/3ALGeXCpSzQq+ILdutysiZ0uZEukkypIwXw4+MDru44+399/enh+fZmDMby3cQPX09NiE
CAKmDZZkj59/vj8hDy5qoibs0lhsXEMWoODNCrRVgHzQN1viUgrokh+YJCLMAF+pNAqItzl6
PL5NAh6k8IiQJgCv/1ECHqBFecR3tcvg5GgDN2+XBFNxA3mvlM/sCY7hfL8//fNOzJvGrkYi
KFpo5sYKuyhHuYpgW9UUgmp1BQSqksK724HtnXoZshIyW2F+uG6h/T0ZQ3ItQpNjWjE/xtLD
deIUhnQDFl2E6xjuwhVB/+mauFKUizKKfp77yrxmz6rYNR7HDXET4Du7PEOM7i/jeOZfIRD4
7elp9v61pXocP+VzoSyOGVx4cJWnNctKgR/KxjSKhLz2twGZEO6rntfqrdylD2NI5y7QeGz9
/POd9BUSeXny04gA4JZydG1a5H4P7vQm9vrFx0DcO7h9vwzLs9nhHjKCsS1RxlQl6iGR6cTp
7en12+fvj7NneH/4vz97Dq7N1wXk/DSVo3CIbz452sEBVuqjRl+K6t+Debi8T3P9fbOOho3/
UFwHyQo8ND8jTeNnmKcXd56oAGb7wQO/7gpWeXa2FqY3S/xocQjK1SrEDwifKMJ9zgdE2JWo
J1EPO7ydH1UwJ44pj2YzSRMGhL6po0ma3BbVOsKzgnSU6cMD4cfekRxKQlXjUZhFQKT96AhV
zNbLAM/74xJFy2BiKuyimehbFi1CfKPyaBYTNHqD3CxWuP29JyJe7ugJyioICQ1lS5PziyI8
GjoaSHsCatWJ6g5FmuyFPDbvJdwnlqq4sAvDvWF6qlM+ySyF3sZwe1c/v1l4U8UpPlKp4HrK
S7qcLyZ4vVaTjYpZqe+7E9ySKUiJSyiHnB3xDl5vhpBUizAAGBKTQgrT+TRoGBe73zpBBD0Q
PFNLXvkxgi6eJXITLdeOY5uH3ESbzR3c9h6ucZim8QMPNp8Cu5Z5FJU+gYI7dYCIestqRVbR
EtzUYjNV2UnvV6KORUWVtjuFwTzAQidGVH58tIsGYwEk/BdxHi38HQ2jvkaxyg5BMMdHIL4q
Jcuhf+OYYODXjlBQ2sox6ZK24LjECdvOF5iA7hFdc6bZF2/7kWWlPAqqa5wrQWAOLGU11WGL
paMLPdo6XoDZEq2mtfiiyENRJKImOiYSeH8NxYlUaP4hGy/X8rpZY7pGr/JT/okatQe1D4OQ
WPEcLqjUuKVYLKVLcWGg2r5E83mAF28JyPWsD9UgiKiP9Wm6Iuciy2QQLKmm611gD/m2RTnF
kJn5QUxNVq9P6U1Jovki57UgeDl72AQhjtJnt0lBQMxIom8ZalXPif3b/F2ZF+Vp/EXkRN13
N7xLoqJNXcOETS73ixaaUBc/l8jofYqsLKRQBH9mcbDYRAuqSVCCXcCTLTKKIpbj+cWGhIsM
PzuNOkfdQXJ1qnYFjbdL8W+6iUkWA0sFmBp01JLKsued4vTWYpQT/0FpJtkAS29tmRRZoYqS
Rn+A9HTxnQFK74wOD8W9zny6glkXtQaO5wHCQ5cr/TddnV2gdGuYvN4ZDPO30Fctkjv1PJpz
ZWqj1HThfF7fObctxfIecnUPubnTREDfxGQjSy0iU6VU2Y24P3iHlUg5+gaLTyTpE0GqIFwQ
+6ZU2V5J8qA8VahVdECzZzFf3JNSZR2tUT2jN6ilXK/mG+K4/8TVOgwXBNIY7gnhrUjFrhK3
835FHHtVccwaiZMoX3yU4Ak21AQJ335ooVFUZpFmyyIfXMM8Ki3ZB8tRiRbqz6SH8YIuG4wR
zzWbtYfuoD27jA20+B6aL+q57rzS1+NR/2R2O+uxY5D1fYhjdbQNV7aXI6Q9fm7lpSJKzli0
dKfDgg9lyMYwSBmgJT0+aoNBJTwuEj+9qYM1zb9za4xhffbtvEPJlDAJcBTHvL06dZrUh2VD
N27SQ60+4NqOVt154VXGFOanYymu3GrUR0XHWTC/VzTE3aQwkWD6Vehh0BKqEz1xrC5Dzdsl
R5rQKBXw0UQpzeygBYE3xnjyPKqTVTUPNcaxXubrhea97ITgotVmOQJfMoLBAEO0sXqI5ivo
KqVrcZiwKhSrruC0BpxKdgjueutFt6IGJVnR8HaXR4GZ7+w4dbrAthwDxvccixps7BYpMqnr
wwz+LUMy/9LngYd36aZMLXaV8Jx5qv/asTtDVZ3DteZDy8sjs4FBr1cOelCRJdi0BEg9VSaW
A8nCgAbtNrDBrd9DZbtBAfv5oheMWoiVdwaUYdKE1Q/pg8DzXLIwbFeyqMV8TL7AVYkWiZ7U
DWrVmoGOn18fTYYy8c9iNoxENr25l9VoQGF+3kQ0X4ZDoP5vkz2it7gbRMmqgX7SR8eilI7Q
Y6FaFADoqLCKXdABsdjGD6IuNctLbKAtWRMUhVSrQZBcZgjWA9NQDypk5e5eRdYs4FZzGjDQ
gWV8OGwt7JbL1Qq3AnQkKcYCHZZnp2D+ELjt7nB7LfwMlPFNwB/GMX22BsSoaI2mXz+/fv4C
vhGjRDTKPH7X20+p91i20a1UV0eva3OEkED7mObv4Wrtz4u+5dkkjHlChbDmxaeC8ui9HSRu
vjWp3bQIn+P67VKvF16yUh/d59vuCsF9hAXZpMJS1BOYrd1CoZ5IqXnKAbLpNS9CNnB4Coh7
bj0a8jDIc2UTEzy9Pn/+Ns4G2gydSdcWu/HZDSIK/aw4HVDXVFY81vJQ0ry4Kocrt6UM1qvV
nN3OTIMoo4xLvwdPCex67xLFNi6XaJuX28JBeDmGXQSvWUW1n7BxuSSZ0etgWZZdqry6nVil
nCfIXGwFbyBnvCNBK+K14nlCWBxdQiZLrqfmDKVNNGsvU6rrCb3zds1WYRQRbpWWrNh3WVtG
fJn/+P4bFKMhhkGNKxYSed8UpW82C9LD0yW52yAYk1SgknxD4aclc4AO3w1LFXGBbyEN/gOx
wzRoKfaCiFxvKeI4rwk/t5YiWAu5IYx+DVFzEn5Q7DBkDoJ0ikzs63VNWOcbkuaU1of0ZJ0V
4bxs0VWJO7U1aM3Lt7ScqsNQiXyf8nqKNAaPX3jQPREHPcPp8GGFAfOBviNYDNwP2mwj/h48
4K4sVlVqpAeEt8xjs4Q7oD4ywFksV9iWaRDu5SktMRYuS+rxjeM5bj8g8ZVieNMAeUp2uJte
k+bgXuFip29/En/ELBNaYM2T1LsZAtSk906Yco4AC4fEZ9YxwFMM9Th49ptIm2GorGOrdeTb
MzRc09D5+VQsSAos3tXgLgyeSCkOw36AwqHY7z3wbtSIvpfHS/PIvFt7BzRvG2k5dCAdjMi6
pylGmBKY0c3IZ95673+ysoRcBlnr5GTd9WZfECGx5+9rHhu3HfSiB7m14TGcpXdZ7aFLByrj
KlzW/sC33qfociSb51y54Kk0Ok2z5r9DfOSQDgfGFlOhxvpfmWGjqUrX5gJ0Qo7S+BjoCOBr
Gh3gLa5W3oWyxembsdVFUm1saPSeKHLuqpZcbH46F2qItF60L36dEFer0DcwAAso8Omor0gv
1GLxqQyXNGagSx9ivbHRi8XPx6vPofRqMykPICaZLAIu9m42n/GNx+UWO7HVCV6MKDH1i0cC
Tyt26dGtW2AYI16bbtZrmAbjuaNnyo8pC+PmJWR8/wL0UX+Huy1qbHaq24Wb/fnt/fnnt6e/
dDehSfHX55+YUGa4qtrZK68uPU15jsYxNuXb0+1lDLV1D8CpipcL1yjcIsqYbVfLgEL8hSBE
DqfrGFHxgw80r1HS9Flax2WauBxxd7D8sWqy0sM9jhgkmdlUih03sG//+vH6/P715c1jCC2Z
HYrd4E3ABlzG6EnTYa1LdXu39+vo6u30AZBmvJ/6Zl+f6XZq+Ncfb+9335qwlYpgtViNW6rB
a9wHscPXaBZXwGbJZjVgjSYHzbAiMVJ5uMhBEkEHVQpRL4eF5caWhRoZAGtiVjU/n/wFK4Vc
rbajIdDgNeHn16C3a1ySB/RZoOp3iylNIFq/p/z99v70MvsDUsbbOZr98qIn79vfs6eXP54e
Ierlnw3Vb/pG9kXz8K/+NMawFzbSqbdepDjk5m0I/840QLYXQJJApv/L2bU1N24j67/ix01V
9gwJ3h8pkpIZkxItUDI9LyrFVjKuY1tTtieb2V9/0ABI4tKQU+dhxnZ/DRB3dAON7nxfmS2k
ZoA+5wAme1Hh65Fw4y7iWavHtMBwU7UwizVa2xV6Lhtub6oJFDAsihzVZrWOaw3nUkB1RASq
/mabyStTCxjPFzGtjvK9ETqdynoDzyR2xCht2ayJThl90WvE7Wax6Ze7r18PGyaRmpXr8w1l
ErKrYn29vgczAj3Lfc0WNWGpLheuzcc3sRjKCinjTq/MUkrKymKELjxa6/Y7owDj0DFJ0vev
PaggdobTwm9mgeXyExZLJ1NqYhU+0G4nCggAyWgy+iH6ofLOwTHKvJ1mXAISoPUsSsFEPmYK
9Liwq6/a4zuMwmJe362HCtyhKT8jUA5LgDYIZ6fiSb2OsV1rka9XBnHXgzrT3Otky32TqOG4
KCjCP9Dv+PHei9EedzzMh6NF5KzRUqyH7gAnAy57UeAxXwcoUNMm3qFpOr3Q4sRhoZcYiMb9
HZA3YqY58u+GnKiOb4AGj865jw4te1r4KdtiPKuGl46aYEAMNepElUGDdAWgksTrVe3LX+/X
t213WN2KAToNqe7t/HF+OD/LsaVrgh0fM7iAyht28j1a6e6EAeybKiYDZknB89VXiInE9Taj
0ThdOCuDs4l+u2lUjlbrrms0KmnXadsG+9OelkKS6ujVw/OTcPRty9eQkGnH4KjjxtIwMS5+
T/AZk9wXPmMzh/hU4D8hpM3x4/xmC4Z9x6pzfvhftDJ9d/CjNAVHt/pjAfX5nnwgDK+/nHGZ
lXd8x8fHJ3jdx/ZP/uH3/1G9WNrlmXpICvhWWCIJHHgQWDUMW71u1QdlCj/oBcsdSybvQJRP
sN/wTwhAubWBzUR+GxtQslQ5DRKibPMTHSw/MoTeavEfRnJbdCSgHmaaP7JQ1tDGEeGIDH7k
OF6fWPp2eZmDW2hc5NgUVeMIUzGysHF0vc5XqCnCVFVQr3O9V4Be0DBp/MgBBC4gdQGGkxwJ
Vbe7mhu47TCRCmYY7Ak/DQITXWkPoU5kaODIJyPHZmnI4GOSensrnTRpQ8o8TuaSMVvclthp
GwfngJYqlT8G8+YDgtPL+e3n1cvx+3emOfCVAnlLy1Mm4TBYO7DOIiQIV4EsGUBYlt3l3UK7
4wYq3OK58ln28MPzPSOnaVqOGoqZ6WrrfAvI8evmDrN04Bj34rNXRHXRmos0pslgdUxbrb/6
BHvGI/otb/OoJGx0bRY7u1etTd3o80K93uVEc+sWvdGWh6W0wB6PONzdPamYnHr6+ztbubFh
gLw01eF1Zzc8RCh1Nq0Ykp7ZtEAlZp34wVBgU8HkbDAape/qgqS+Z56SGBUU82BZ2hW3qk3M
IZdv668bw08lt6QsEy8izkZisJ+SFEmWRYnf3mGCk5gshpTLib/l66+Hvse2G45LHVlvsqZL
k2Cw8gJyFGOBX2Sn6IuwMLwroj5KA6v1wc44ja1PcCCNsfcXM575xMxPWDNabSbNGF25CYM+
qxCMnGV4FBlkKExRWT+ZG4ve5YlDDtP6wH256k+IDZZK8KgH56KZyyIgsipKlFesqCChXxzN
bC33Y/MD/L49881pJKanbzIXQZCmdnd0Nd04ooGIlWqb+6GHnxaKjHnYRPza1a6WcDNAF5/1
zHy0geaM5GAVq7jZYWafPBol/57/7/88yeMORCu686XWzt9+b/BhMjOVlISoZy2dJVVkSBXx
71oM0E/YZjpd1eoqidRErSF9Pv6lWoixfKQSdl2pB4MTnWpxHCcyVMCLXIC2PBoQuDUpzXiw
GKv+/kXPBZuEGgcJXEUwZF4sceA5Khb4LsD5OQYdCoc1hc6HGxyqPIbIj3AkqaPoSeooelp5
obOpKj9B55w+mBSRG27LD/keN0QQKAQIReOhc5Tuuq7RjBZVuvNgTWPisQi1LMpccOBLl5Q9
87I4LHI4AsPNA8cHHVZOY8sJ+3MY2jvNUasE3CXgcX/dMFwZrqBdmRzjoY9yZbEPedGnWRhp
1vgjVjhs30ccBkmsSHIqPXXRtYseDcENhEaWploxRWHvcF8vmejCEbRctocLF65VLdzIfXFL
kmEYsKaSkPkg1cF1Xd4irQPP0pW5OD4LgU5WjDUYNU0Py13VHFb5blXZGcFj5QRsLJCGlhh2
E6axEFUwGJHxiQmTC/Ujcdm64zuRC5lvh0iRLcaENe2gVGqBR4hPITQq5MgxiopIgUC+RfWy
kUHukMhX+Xi4kLLpgxirCrReGKl+K0akrHp+pSVY4kgJhTiysPER+tHgADLPzhQAEiFfAyAJ
IqxyDIpSVNqYpkm7CMLELoaQ8jNkavOhCFf/JAt9e+SMdtI2su0jLwjsT217tipFNn1XUN/z
CFJhoYSpZlWtqjnzP5lkqKhGgiTvlcQpjDBuPX4wLRkzupYhRMsk0J/0K0joY2b+GkOqvlkY
6S14FHEBkQuI8VIAhHl+0jgC35XYTxJ0mVR4MoJqYTNHnwyqbxAVCFxA6OMhWzmE7WIaR0wc
uToCwXIIk+wmDho4ktIiiR3ukWYeMOS+zNIP3eVMShqj3m1n3I8J2o11dHPIW9yyXXAskyhI
IoolHt+a4o5wpgx6pk3s+ryv0ExWTeSnFDtAVTiIR1u711ZMrMhRMtLF0mpgbSPX9XXsB8hY
qxdtXiHfZfSuGhA6HBfy5cSCfitCgtWebdtbnzgcuc2RXddVjlpeTRzjWTn2DbHcXhrBgiOx
iy0B3SbPBPFotABm6LQAyy8/ujRPgYP4kSsxIfj7LIUjRJZCDsTOIhFUAJ7GOrh28ZGVF4DY
i5HvccTP0JkDUIwdBaocWeJIGzDJ61ITCBZsSEMs5hjbQDgQuAobx6gsqHFErs9lyMASJcyw
JEUXoFtcX8QRupu21XpJ/EVb2LHikdW8GDBVdxoIbRygA6RNLi2wDHYluzjv2gTtYka/NDaa
NsVHMVMHLyfDZkWbOsqAyn4KjCyyjOpohywijoevGk94cVngHEgd1n0hjplqKvwlWJmvi57p
mpfGMHBkqsOSCeiKNhmQ5Z5fMGTKSO2keae9yreGJREiTJEEqdiCqW/dsrIBeDpRLJcdRaA1
7XZMWeooim6DiGDTiwGpFyP1r7cdjUIPFx9oE6c+6ppu7jTCtL0YGSuwQySpc8dK0tlzwuXl
PkjxvUIuzZcEbcZCPNdKyZAIXyrZ2oXNJUDCMEQnJ2ioMXpFNo2SoWL7BVIUpk+FTBlH5htD
oiBWXRyOyK4oM+1ZhQoQDBjKrvIJKqV8bWI8JtZU9LtWylZWWnrd+5fWQIbjoikDgr8vJyyQ
3hmtcZEcKyawuq4ZFB7iowcJCkd8Rzzs0y0twqT1sZWR9j1FRxNt2xiTHthO5ZO0TH10hnCX
mOhdosaRYKoiK3/q0AbWOXG4MlFZnA8QJ5aAkEsLeV8k6E7eX7cF6i9nYmg730OHKEcudRtn
QFRqRg+xzgQ63koMifzLo2hf53Ea495vJp4+JWjQlZHhLg2SJFhhRQAo9S+rjcCT+biXBoWD
lHbdORA46OjUEgisAQ4bJ4WxYWtnj2xNAorXKwSyLmz5do+6v5ze2/00KYYN+0Reb+7y+82u
RyDxBpG/5YHwuYumKhEucF/MjdggE085nx8ZLJscfoB0d/x4+PZ4/vOqezt9PL2czj8+rlbn
v05vr2fTbb3Mp9tW8jOH1WbvztDlepxulr36IHE++BXHYhOGtKv0kWM/ZxR350ims2B+IVuw
ivHiDMlX3m7Y/SlfG9vA17rewg2TnZc0M0LSlHcIcbuO+thPkYzGw207Deg6wTAgabhfJ5uc
N3Wb+J4PbioV+/Y48LyKLiR1akxhsAFUvBEPORE5vSDjxnzCO9ou/Pv34/vpcR43xfHtURku
4MilQDqm7IUp9njR/kk2jAPLhoJ/yw2l9UJz9KD6P+QsRQ1xNFTWefmZcWzNAe+U/H2nYVa3
KNoc+TSQDSbx5aJ2cE84RqabwiDLwgj+ee4BRJdNTrHHSmpCCNV0KNo1ni1SRy16BH/K9seP
1wcwqR0dvlin1+2yNNZJoGD3f5xOgwQ9ch1BzZ615Zeho82UnlHekzTxLgTXBCbubw+s9w1n
DBbPdVOUhV4F1iBR5qmKHKeO1lVGffmtms4qb9q0szCgm/ZPM01/3KnQtSMz3uKmwepEDDBi
ihEzq1EFGdN6eVfwq8TBTATUiDj9aSssLre6EwtuAzzCMVawCQzMocaouDNFDmrvo3hLF34w
mL0tiXb7j4DhYwyg6zpmgqDlRl9yMCXk0OW0LpTLKaCxjMQbtCmvpmNU9D0iIFR12gyf5QZ8
RbspVeMcAMzXbUATji89s+iC7O4Fjseo7YcYrNMlpZYMjL+S2HFoPTM4AoPMDCkeNGNmyHAp
e2JIQ0zil3CaeYk5+bidhTngOTnDzjBmNDVy6uNAPdbktFHamcnV10F4odUnq3RMq5C0R3YK
HSQHnTJenqt9MjlexC9iJlg39OL5T+aDKtG4a+U005yTE29SVaPiJCE46URaFYbrA06twyQe
xr1G6xHaRp5rU6E39ykblcRO43gbky+GyPtkY6FMp8PuVzg22lZrKfqaKdJBEA3gkNgVrgcY
my7IQvc4BtsD9FRIfqRpd+anu7xpc+w4Ee7dfS/SVnRxF48757ac/vJvjia6P22qvcNwOvFd
kwcqMNoU2+QojsylRebnbBBpJowWI0NrqcAEqROjyl0ay9DaBnUWtuSqhnujbmCLTyOS70rN
f7f0torNgbvGJ0lgDVt16LRBFFjbZF8EUZrhJzQcv22HFLNy5OvQkEaR3lfz1aIuIE1G7jbR
FntGQDwYNCUUElqVbyMfPa0fQfWdh6DBEo7QUosWenbaQLVjmml2RSTdeJk7IpHnsOyaihMa
Kyh3fw2G/8OAI7qxip5Gfywg1jEQU3BjAbnOmU+3VD8XLuVgVmTlebyiKU/OjUddwwKW9QCu
6jZNn68qjAF8Eu2EMy66ays0d/CySTtw1qhwTXWb+ZhIs8LfEWg8UlqyINBz0jjCSqCoQDZW
RkGmHdQq2Jr9wOwjFZZRUcKSc63jYnJbs1EwcwhpkBxDOOTKcFSY0OJaxqAIj9A7/gGTw4GI
xkTQVd9g8dFxma+jIIrQztZFpZle0yYLPDQJ3IWRxM/xdmGLdRxc7kbUiEOBmSCRYFKRweIY
R9zI8ZMCGFu1jkQRPuPcr4MUHrErYc0GUJzEeN6jBnIxc2CKVIFFg9I4RL/LodhzQZryYEAk
wpuYg46ovAZXhkk4Co9URw0v2BpuBJnRwdQRQ13l6nwm0qG+q2emLk2jzPGZ7jbJULMzhYfp
SarRjI4QVwW4dnUxY12rUumTemRjy93XyvfQLu/2aerF6JbAIf1RkwFmuKKrcN3hvkFnjluI
KwXuBy7WetbCkCy4NnY5uamcKRATKrB2MXXBGaGk7XIP7VuAKN7tNGrTJE5QaFbsbKxZQSR2
Dx8vlCX0YuyJscaTkhBd3OAS3Y8Dx7o5KlUXcwcmEuCriVCdCDokFRXM8WlQxT79tNTMcMwP
0CYVmlZ46dOfyVG2WqVhQjvCaj2Z4tuioO63YQbsG0ANC1HzBI1FE74L60gCKOtNXy9rQ7Qs
nDoYxN/mT4OED8L5kP3l9Ph0vHo4v50wVxkiXZG3/CRYJHdmz6THZsM0xb3yISMncF3bQxis
PZabwbzN4R3p53y03P4DLmi0z2rA/gAvK40q15sI66nbHbxVylUFcV+XFUSZ2at1FsR92DDd
fLcAz7k5qqLPfGaGPK2m2Ql6Xu5NJUYAQoFp6zUPq75eqXFKBUe/W6vV419Y3q03ZWVwLnZL
eBY2D7uJWsIl0BRBuuUjyL6c4e0Gob6MYZe/Hp/Pf171e/5q1XLXL0rZ7bcMJcbHR7K4pLab
eoR509RLTL0VjNclYzUzp/2N78dwxNFqhtEaOtZa1OLL49OfTx/H509qUwyErQiT04q70+8P
x5dfIdG/jlo+vxi5GPWrWpKiNqGiseHyz5zjYnofv3/8eDt9OU5Nb/n2lO1SDfWuZd3ORpDm
XkiDN9vaYbsq2NphcQEt+8DXr1ucJf3y7efvb0+PeoGN7FjbRilqwiP7Lc8TPwjHBqEin9Pj
VdsWXyhbYUYvd2ivheqJs5xAe9ubW3HfbStK2fTbtuAPzFUaNnuIceY205EFgNPbqt105jwW
Kdq8aTbm6sAhOUd/Io2hhifWyIf9Xp/Ux9eHp+fn49vP2Vnjx49X9vNXVrPX9zP88kQe2F/f
n369+uPt/Ppxen18/8XeQmD92+65w1FaNVVxYRfp+5w7/ZgcelSvD+dH/tHH0/ib/Dx3z3Tm
Tv6+nZ6/sx/gMPJ9dAOV/3h8Oiupvr+d2byaEr48/W08ch97mB9+XhjDfZknYYApJBOepbpx
pQQqiMAeuVcmzkA8s4da2gXaaaAcojQIvNSmRoFqezxTm0ANnSa/2OwD4uV1QYKFXeBdmbPZ
464pk1aSJDJLANQgs3azjiS07Qb7K3Szvj8s+iXT1GzHlNuSTn1ozlE2cpnwl47DZf/0eDo7
mdmumfjqzZAgL/rUt8rKiFFsF5SRY0zIFegN9bRwv7LvmjTeJ3GcoLPRtzpVkJF1p4sgGKC5
nwM5sjJh5MTT7Q8lcEdSD7MzHuEs8wIsGaO7aw6wb43afTcEhEx7pugdmHlHbWLaM5A3QYLt
dMqiHxoZn16dYyQR3YJ9JcWOg5Txkli1EmRrfgE5CK3RxcmZTb5JUx+ZCf01TYmuIYjmOb6c
3o5y3VMkBA42jKpIYJy2fD6+fzMZRUM9vbCF8K/Ty+n1Y1ov9UnflTFTe3xrrRAAP82ZF9gv
IteHM8uWra5wKI/mCnM1icj15FaaCe5XfD/RV+326f3hxLad19MZXDvr67rZWEmAjdY2Ign6
JkTA4y2a4lTp/7HJTK5qjCJq/l7sFGJrBSyfBQ/Fw5WF6vvjKL+LUfHj/eP88vTfE4hIYms2
JXDOD56Au0a91VYwtln5enQlA02J+vrJArVrWSvfxHfmm6Vp4kha5VES+5dAR8qW1lpIdA3r
iW5UZWD6gzsLRQ04dCaivh4xMD9wtMRt73u+o4GHgnjarZqG6THadYxHqrAUcFmaoWFJI4fn
CIsxcUtrkq0IQ5qqIQs1NB+Ir15U2YNEfzmg4suCdafjltBkw8+RLTaHhYNdKPRWV2GrZBuj
H2IblKNv2jTd0pgl7R3je5dnzjFMa+JHiau16j7z0asblWnLNhjHp1l/B56/XeLobeuXPmvB
kFzAF54n/V6MgSqQNUpdvN5PV+V+cbUctYdxG+jP5+d3cLHK9rDT8/n71evpP7OOoa6Zrow4
z+rt+P3b08O7rfLmK83T336VQwwJzJx8q7ysZn8c2ho8Ni9qjEqVUyGglh3TeoYx5IU6IznK
XTUwlWgJ/m/wbx9uWiojNqjlnZOzT7S0P/SbbtNsVveHbbXEpzYkWfKDqKqF00aXGg98EA/k
wDq3RJVavRQdnK45Ct/3RuMxAtdOu3xVHbrNptHbCyL5zLU10mH0FbhHBkNmgf00W86FQTp6
zZRrFN23qgoqRcurs6Vnag0hYpswuRu3FhxZaN34Mf7CdGQB19+wQ2YpNpstrkjsXIo84yqx
ENu2rXbIJNOpZL1I25yJTe6xkrflSo8yIz5TdFf/Ejp4ce5G3fsXcOT+x9OfP96OYMChFeAf
JdC/vd7s9lW+c5Ztv0LDTHGIDQ99LO3KRifktDcm+SpfaW8SgVjU2+2OHm4rHk1ab7ki38LD
jesSvTCbWJp9Sc20twP2aAiQxaa4Nooug5hByA+N3uXrqhnHcvn0/v35+POqY8L1syIqToxs
BWRZVVvKFgdVXpwZFpvqcF3DzTATsUuMQ1bFok8yqFZJgS2r+j5frw7Ley/xSFjWJM4DD381
NqeqIXbiDfuRBQTf/BHemomdPm4EqXCv15sG4u94Sfa1wO7rZt7fyvrQ9KzcbeXpEtnMc1Ov
V2VNuya/P9yUXpaU6vttpe2qvIRiNv0Ny+q6ZGJIhrZl3tLdGuKxZlrsMSUnBi68ILrVDwF0
hlUYJZhYO3Ot4a6pSb0wvW7Ue1KFY7PPocjrPsg8P8Y/tmnqthoOTVHCr+vdUK+xsAVKgm1N
wb3U9WHTgwVUlmPf3tAS/jH5uWfyVnKIgt6aRYKT/f9/lD3ZcuM4kr+ip42eiO1tkRQpeTf6
ASIpCWVeJqirXxguF6vKUb7GdsV07ddvJkBKOJLy7EMdykwCiTsTyIOJEnPr7XYHb7qaBrOC
fIg7f1IzUS3Tuj5iVP9yCysurlP9QUQnPSZ4M17n0dy78mgWNCJbxXdpy/hatv7TZhrOgdMr
80VZpyyWZVsvYf4lweVCh0kjosSLEnLWnEnSYMNGZo5GFAWfpgfSmXWEPP+o2gVjNEnKr8t2
Fux3K29NEoCEVbXZDUyG2hOHKTlZeyIxDea7ebL/gGgWNF6WTkfGU/AGOp8fWtHM56QR+Ajt
4mpHVouXoCw+zPwZu64uUYRRyK5ziqKp8PIZVMYGZs8I3z3NLMhBk77MtiSt1p5HDklTb7Mj
rvswvJq3+5vDmlyksNarFAb3UFXTMIz93uyrP/OtI8k45Wqe6GaY2iE0YIxTjYPc//r19q6b
LF/vv3zrrANO5rlJzJSYUnzd5ksp/SdsTIjFI62NyySNzQbmmA18wyt0mk+qA9pBgVC7XITT
XdCu9nZNKK9VTRHMovGFiqJWW4lF5DurD+RG+MMXdAQtRcGvpv7B/ZBfWTFNdMF6wwuMfRtH
AbTTm/rWydSUYsOXTJlrz6PL2LmFha1zVc3s+QNgUUQhDMYiMjHKiAAWCisOkXrFMEVNDT+n
H0MNssRaSDI/W7Kbh/ZhdkLoNkTWF6jm6Krt+MQzmU6bgu04FRVd8lrH1dqS2ta5528D/R0I
E/EgZnNYBOE8cREo2fimvZ+OCsh4NQNFzmHPCG4at9gak8rrOteAgJ0sNMOja5h5EFKRUORa
wjVztBXhJhlJ1CF58Mj4Eb08bvac4I4EYCWoM5cG29HxygxRJC0aqS23N1teX58usFevt4/d
5PPPr18xJ5X99r9agu6ZZEbeKYBJy52jDtL7YlC2pepNsAUFJLq7KFYCf1Y8y+o0bhxEXFZH
KI45CBDh1+ky4+Yn4ijoshBBloUIvaxzS4Crsk75umjTIuGsoFsjazTet7GJ6QoErzRpdRcU
JIZt2khUArCcoethahaAAYgzvt6YjUC6Xts3yVHZQf5hBp98kI3B/T4kg3PsXLA7pfpntb3K
qetDpD6CUOlbFoI6HAeY/rRcGVwzOBCgX8028lw09jhAr5Eh+7FIOJqH9IJaP3uJckk1Jq5M
KkmATAulM3iwUNJZ6VGn8aG5qvmOGQwhwKlGAqlKJOKDKvjcjCcsZ5Id2F4rUt6AmDxJkO2S
dUZ81EZFRfHPmiO94ymcwQX8bq21iqAhoDdoXC7u4IDo9SIC66ez96jt05w7EkR0S49gcWxm
fzZoOOUtiPMmLWGT4bFR1fWxLg1AAKeIA1A1WsxIBO0BhQumLJOy9Iyidg0IXmaHNCCGWknc
sT9rKqy/3BLMz2NW5+p0MPYBBYUDiIHksCMDxxg08VY0pjkSdmQu4u1qZDIb11y4FpYgcRya
Wag/ZwDcDXKM/aBcoMyNNUX1pszttmB+obEYTHK08UZoFAuKfTCljOtl++aeoUeQZ7HcyJe3
dz8e7r99f5/8xwSWw+Ax5rwH4OVEnDEh+sz2elsQl81WUxCO/YbUdyVFLkCKWq90rxsJb3ZB
OL3RtD6EKoHtYJJKUU2X+xDYJKU/y03Ybr32Z4HPjOhUiLiQExbRoGkH0dVqreez7nkPp971
ahqYcCVvmkyWTR6AqKlt0af9w+5BBz+k9SI+PXmJOphqn1NlnaJCOBjC+eWMlB4M+yyl5Ksz
lWvGfcb1kUEufg80i4X5pGwhyTidWqMdBxGjq6JgSg6ARF1RnZJVizA8kP2L2eBrIw/UGTl4
O1xk1orocq5zB/0015OQnnHLJPKmc4ofUIkOcVHoutYHq3goA0QdgQGcLXsbWvLDS3ljlZd2
nt2+cucR8fyNKLeFMZHknrMB4d3ZYDbcSIIIP89pHpo6LdYNFXIDyGq2PzO9JYrpF5XDhnjp
7u5vHyQ7RF48/JTN8J6R3IMlOq631CkicZVhUyJBYissyBY0hsyELdPsmhcmLN7gVavdsHjD
4ReVgVZiy1owXlsFlVvlmKjBQEdgWXa0COXbtQVThrwmEPp/XRZ4Ia2rmgOsXWlSOZKnuUCY
UQTavJa5BfvrOrVYWqf5kuuRNSRwVVtfwnfyQtqCHlO7+/Ysox16Ebnj6V5eiVvVHWup69pl
cQxMNlIUb5yqP7FlTavdiG32vNiQKqFqX4FpP5vSmiNZbOUOkcA0sQFFuSttfvA6yJ7pxgwB
4TIvt8JpSA59WJdjrObsKMNhmSyA6irnh1MWj+sSI9uNlVYWsB2kzjLIt1nD5ZCP9mjRUO+L
iCnrJr02+YP9HqMSZqU+1zSgmtNG+VXasOxY0LKcJICVihvzKD5jhbwEjykRX1LU+K5ocgrr
W3FvlNW/F4zWJTMVZLygBHGJb1JmrSkApZmAXTS1Vj9UVGVmsGQ5xOR7rlxA+EoEurm2tZxA
zmYhclY3n8pjX8VwqGhQYiwavqOt0yWyrERKyjYSu4GFZTW92dSgQvQ52c/3fBqU4GGLp1Jb
CUoWllsP53nZWMfDgRd5aYL+SuvS7t8BBtWOlP7XMYGTyV1gKgpnu9lSdjzyOMr6lNiDjSZx
Qp6S8pmn+KkidGra8AsznbsCwVDc8hmgp+zjzm0SFn291BYlAs7bkpbu70JhNtlZaOnNWUjp
BO+5B9FCMyQxaAeEUarGabmJeYv3aFnaX/ppcovhCqYBbX8rhG2zirdLfUkoyqKw4h0gGKTF
Tbthot3olx2A0WfHVsVfJKaFLKIoQI6L07ZI973yIk4+VIY9Mnbq8wsaoljDlqQrBtt0iyIm
F1Ybk2PBMI6d9MwTJq5s1g6g3W9g38tUOUYbELnMpKQsmpGJPtCt9FQkspnof7OF3bEAqSbN
2PFP35xoxZ+P2nx9fntH25v31+eHB9SqqdkaR/PDdCq73urtA06GTUztRIhOe7TJoYTWGMMW
mtY2VjdKbNPgKAkQGBMCuxIZUeIGFeMqNm5QTeQ56bLeiYet7003FdU8TPHlRYcLLVzBGMDn
1Mcy/Lrv2R+bI325/7Ze4Lv9J7KF510AA9ulPaUUkjyWEV0vWBThC69TKpYnI5E6UCEXnwWU
Kf5y5Wl6mmR9/N/44fbtjdJR5LSNqdsMuaJrXhin1laGo83t/m5yVzkq4Hj674nsgAaU33UK
OuULGo5Onp8mIhZ88vnn+2SZXeOG0Ipk8nj7azBOvX14e5587iZPXfel+/I/UGhnlLTpHl4m
X59fJ4/oWX3/9PXZXDU9nc1mDx5N8ajToFplCHY9QC7yKrc23qFg1rAVs8ZmQK5ASjG0FB3J
RWLYvek4+D9raJRIknp6NdZOxIaUA45O9GmbV2JTjlTAMrZNGI0ri9TSk3TsNatzNsbZ4NEJ
/RWPbbEDLSjf7XYZ+aHVPVsm9O2UP95+u3/65joJyw0hiRd290ptwZJ+Ac6rMTd/uR8nhQjM
ciRIBvo1J0UuF2ZSx1a1EqyoVfTlh9t3mMuPk/XDz26S3f7qXk++OnIJ5wzm+ZdOcz2Ra5OX
MAJmIlN5Fu5jSmjsUb7JDEIMZta3X751738kP28ffodzqZM1T167f/68f+3U8axIBgEFTchh
pXZPt58fui/21iLLv7TcJEFTw4EL4yFEmmBkcmG3CY1AeJJShoLDWWEkFtWAjtRyRmBo5rrM
jP1SNomUG7dCzP2pM6FBpTHfEE5FmYINWWaa88gaEQD5kQliybbZHqxVlu5EujZhmPG06TV4
g8ls9JQb1mF8nMeRPa+PKmGz2avJIC7rJ3GT8BbkHUvKlBdYvVmmxT0HMWm5W1sbS+Yc5DAz
QGzc8WVtJ38xhYVyz+qak+lhZDGpsPa3dCPSRh2ZK35otrVzWHCBd6Wr/UiRR/jEGpP0L9kZ
B2tEUdLCuAmhd7BPbQEyK/wnCKcBjZlFuiGr7CNQu1voUOmpJRqb63jDSnGdHskZWX3/9XZ/
B+qY3GToKVltNOOJoqyUrBmnfGcvSpU53cpndLZWYZtdiXTjgwbrMJhazkeabjXCrcUES9Zk
rufmWKVGBGcJaJu4ooQdhdzGpvka/m7jmL4IUZ9skkCIwCcfK/oaZWycxUE/q5pfL93vsQoR
8/LQ/d29/pF02q+J+Nf9+913SjtWheZoPM0DnDvTMPBH+/D/W5HNIXt4716fbt+7SY7nACFA
Kn7QDSdrUPj8iJWREg2JGPbkVux5IwMVnD2x8pHYumkuGk4me0d1E7YgTSPEX+oRjYK16rLR
xCxr3AgK3CY3e1xgxVqqRso3OE3cdSQ/Y6zxfDPvoYIXwdQPr6izTOFFEBnBJRUTcR4Fuqvi
GRoawT9VY0YScStkPZ16M8+bWYWlmRf608AynZEo+XRITfEz1rcYtl8bB2Bkpr88ga/IkIQn
9FSPyyqhp7hxOhDafRUGbg09XO5Z5CSSVDbWYAKjN89c1gFMvt312DCUwftyI7XwCWemFTqD
yRfwARv5znjj0yNpIj1gF3pEsnOP6M+VOnR4b3Q7kQ5dKdFDRNyGNVt7dfVPyXZjExZ7/kxM
ySgBqs597vBxKRmcWhaJv5g6E7IJwqvAKYx4azYJ+giLY3U1McPAbVZlTRaHV97B7l5cFOHf
Dg+ngPFjlVw3iR9d2S3iIvBWWeBd2dX0CP8cE+m8TUm1+fPD/dOP3zwVD6leLyf9a/3PJ3Rq
Iy5tJ7+db7f/YW10SxRJcosFN1a6aml2gNEbayaG9rXLwYvKo/7grPpXxkMfWVi4m9gDgkB/
PrOHaYiTrnVT83r/7Zt1yCliOAfWaU2LO2gEhXlh0A/qSFJw+LvgS1ZQsngKKwGU4RIvMUVc
bzUbTIkiQr6ltD193cStsuE8USJIHm+UHS7mIRnuY8+muyeoq7wpnwDQSR2LXHQ7TYu1YZGL
sFNUZzg6izQTJla/M8Qblpq1uVgn+rVXsm/ZgSO1bh4nMugDnQzvqjLUUJhuRV9lh9Ygk/Yp
GyRr83XeUAijL/ayYtrEWeFGbr4B2zOof5BK79yYk1mcV22lvjj1cvxw3z29a73MxLEAqVI1
yhwz28l5KGS5XbmX6rKYFTcyLu0lVFOX1cdWNRikbvCpHplTSLJJWWWO9QmK20OT5oaxv8nm
qbXbw6BBanYls9ncTHyLoYHImKc8xx6LOe9NNc8vSY0XXQfUtl6xGtfaybXzBFaObhL559QC
16XsyvBcgUIocRF2eCFoQ3j0XEejr2UGK8HoaR1DOwdrFGNJo6xG9F9oI2y89oBCF/OVoQIB
qMLYYuu04PUNpQwDRYJ+3orCLI3pLj0IgB0+Lo0bNKwg5q7hGiKKtDmYELnqs2UMEkqc24wa
SPlx6I1EYZbV1ltB7+aIzVeRTwZyWgGSw8GzhcOJVaCG65Z4Eqvgabqx4LAR3qy0S34E6iMu
iYpSFj5Ws8q3ZkFAN9KjIJ/AsCMenApy2NqplVLfwElboRaUswImqx7GEnbwPrmYMKHcsATp
vaRBnnHd1fP7u9fnt+ev75MNaIKvv+8m3352b++GjjtE6fmAdGBgXafHpeka0IPaVJApnhu2
Vj4Iw3oo0Urp3KHqtx388wRVT5By/+N/pe318k9/OltcIMvZQaecWqQ5F7Hbrz1yWRaJw5l5
k9UDh01JG4kew8WQFI7aqIfPYaYMTLhFLPwwHDngegqWwF9EpkUNy7AOb2pqZi5BSPrtEnRe
dKmeUD//XXR0OFxkA5RgavK4dMaLjYMOPP8iOtTdY120kbLshM5wKCJfz7Zk4uaHgG6dxC48
Mgm2SXTleRRnA46qeoc4b+5Nyap7LHlJ5hAFF4u4yH1PFFHdvlPTXD/uBlxeZTFiYDj77dWp
X5JUsR9EHyyFgTAKzJ3awnPfn12oh/vkbUtPFaMZWzzanoSBQk3WnjTBlJiyaD0he25KLow1
7FGbKqGTAA4b2So60CFXho0orpSZ3XizEnYjE5/Zzls9+lMdXO77a8wIszXfq4cek8Yp0DHE
xnDCEXX2uIS2tDSI8oTRsoRFlVAXf0MvqpBXLh85Pi1TwlePL3gbhXpoTB1ODipi6Hx/GsF8
6m5BAM/YsorJCVbIwyQxhQIDl5M3bD1J3SQhsWeKyHe3+5zr1m+nkyyPOdMOM2cMYJS8qI2p
wVbrhrTTODcBhqGdYxI5qoQej1vJ7KOCVCeOFZOjJH5xPt1smYxgARVWF+vannLfko1urhZk
JLYzL1BARJ1VAE+27gRR4BUj5BSFEnytq+M9bpdfL6bEkQfih7tmUSYZE1XEhQV2rf7F+5FL
pwC9pY4uBZ2TuskW3pVPB0wCJFRNoxZzb/QrAati4QjUHJbS23tv9GBGJ2V3d91D9/r82L1b
N1kMtGkP5AdK8e1xMyPalVWUHmMeg8f1Adrvnp+gfrey+cKjg3UByiPz0QLCX5gcXKpN52dA
f77//cv9a6cSmBmcnepo5oEuQvYAMxvsABwywZrsfFRZH1b25fYOyJ7uutHe0jpEt3CB3/NZ
pFf8cWF9uA7kBv5RaPHr6f1793ZvDczVgpRxJWKm1zpanDLy6t7/9fz6Q3bKr//tXv9zwh9f
ui+Sx5hsZXjVZyrsy/83S+in9TtMc/iye/32ayJnJE5+HusVpPOFvmP0ADuf7wB2khufpv1Y
VSpodvf2/IC36R+Oqi883zPm80ffnsyDifV9uvyULprhKUSzeOluf/x8wXLe0Grn7aXr7r4b
0XJpCkszVgEnh8fNt+e79s6MjGw/dfaBi8VyxwWXV/H9ivzy+nxvmAMxGQ2Q3gyKpC7RZUaU
9D2rE0nxtBZVNdpNfZO26yQHRYGSbQaP2z795tmBQLSras2WZWkaVBRcHIUA9ZooCx2UV6ZD
N/xuGcYWiWbX7SpzcMskioKZ/grRI9ALdDZdGu8lOmo+EqtiIAiDZOTT8NKn6A3r6WY/Gtzw
kjXgxsmrY2b0K5pBQj1SagSzhUfWOtMD2fTwKk5gBc8Ibmq2WMypJ8UeL6Jk6jPPGR+M3AWr
1YWnFRzBVLvFxvPIuO0DXiSev7hyeFfO16Fbk4RHNDxw+0bCQ4JjFSPGpe/jY9n0GFsmM+2o
B0yGEdMptbsn2MZeJNMq2l8Cgo7bNeCrBL6cT2cON3vptlnq5ul5adrq4+82tm4yTWxB2gVJ
lNy1zp0jYQnPfbM+Jwc8wsYsmoaLR9xD6pKyMRoohhg058oGjPIPsYBD3AinpqykDZPO+LJC
n98LrCh/P4cPwyF2AA5GeBQrKmBYgsZjJEsVn5lPLb2t6duP7p0KlWphBlYOPMOHQOzClXFx
vuJpliAj9NX2dRX7RizpHuCkWx7gjlRg4a3IFg4eH+7GzN720kxvyVY0xZ6eXsP5nIJm1bQj
AYhvMvKJCRZCu0vRBb3dVMYbWOWRF65uYIrTwVnxynTh3ENfFVlpTjN17j883/2YiOefr3dE
YJ84uxZ13Oa57tguTbLR2BfqaaLZUn8gJIvTFifj2ZIML6Peaox8Yv3zjZnMaY3C3v3dRD2/
VLffune0aR5yGhnz8wNSsx75mrASdvUnjyYmRLOpy+1a6/Bypai0x9nhsemE6CXRx+f3DlPv
UNZ5dYpeglVty1UnUdT5WBX68vj2jSyvysXwzEOXaHypzV/0499z065eia7A22/i19t79zgp
nybx9/uXf6B0enf/FXo4sRTbR9C9ACyeY4O9QR4k0Oo7FHe/jH7mYlVok9fn2y93z49j35F4
pRcdqj9Wr133dncL0+Lm+ZXfOIUMi3bL47i3myC79KOyZGH3/5Ufxth0cBJ58/P2AXgfbRyJ
P03GMgaZYZiDh/uH+6e/xxoIuzYvDu0u3pLNoz4+KS3/1tzQzhmM2b5b1Sl1V5oemvisoaR/
v4MqNPhHOb53ihj0t7j9BGfo+VjuESvBQCg17mp7zIgRYY8d8hg7BaLLWhCGDrxqij4BkV1R
3Syu5gF129UTiDwMpz7x5WC9TYlHsGH8H2nP0tw4zuNfSc1pt2qmxpIlWz7MQZZkWx29WpId
JxdVOnF3XNN5bB71bc+vX4KUZIAE3T21lzgCwDdIgCQI1MjWIsXbJPEBt5orrDOcYEKocaTS
aHaI1E7wlyDGgYqCezsroU70ZRGs+nfVsGlotYZSG3g0OpK4aFsJd/XDg1ROcij8kNJSy2QH
TqoeLSdvwxa3P3dDKvwAWmDQPpvOXQOgH0wpoFJPe+AyDx3KjwLC26ULhIcPOdW3ru0u80jw
nelPrEfHoUuLi8OpJZKI0Ibq2Oa0X+IWvBVRHdMLRTkerapSNwVNkNfC9k28sGCiT5eOFqNk
4Pxo6uJQtHkezj08IXsA7fYBSAYIgLMZzSuAgMYYsPB9R4s820N1ANqg5zLyDNmJCtDMpa/8
TlI3CuHGj7WEuAymDqoRAJah//89+x1ZtJPH/PAMug0x684nC6f2CcRxyXndXIX5wUfF7oLb
R0qES5MuAvLtzckp73w2Mb67dBUKpQpcA2dZklnQ2gScz2cz7TvoHAoJtNPchYZfTMk3idYk
vhcuxS+8hdYriwXvLiTcV+5kD7LLig4CHT2o5fByAHCnsuOscCkkKXZJVlbwkLZNItgTjqhN
GnhTNLyb/RwbE6RF6O73NLesjVxv7miAwNcAC8IUCsR5rwMJO8F3oQBwHHqvqmAB2z+Am84s
YYzC/WLmcMyYR9XUxfelAPCol2kALfjUSdHdOGpUTlkU4XZODNmlheoOlBLdq8MYNr5LSRYn
+M4CF2CynjSx1HryMjaN7EeiVqabaJEeNCR+EzLAvGbiOjrYcZ1pYAAnQeNMjCwcN2gmvgme
OfSaWIJFBo6vw+YLfM+iYMHU8wzYLNAr1ajXCgTaZpHne7hNKqi54BXc4QI6A+i6IuDdauZM
6KjvxBa7lpYQFN7r0XsF/PfXYzJy00UyRHdCMrVOhKDQPUXS7FHifiP28l0o4dqiH0xn5MoK
UakyHw6P8klfo2L/kfuBNguFprbpncyweksyC4jeAt+6GiRhark+3Q9HTcDOuzT83IvgE/+D
dywIwdw162rKH2k3VcMa6OxugsWe3NnpDVbu6473PUBe8kRil0Uj9fAEWP3Mm76fmr79ai/d
VEO6MVOsOzXVmEotIJoafSLYbJe4HWbGJFmrVYbHERmq4fpR6G8wFR+/QzRTyX2262V/wpqz
CcSUuoYESMCNmEB49BUWQDzuSF8iiLLu+wu37pYhfg/dQ7Uc/cWUX0gBx56uC8TM9Wqdk4Xc
c2ZsfAOQiLMpUYf8WaBpUgDRTzcRcjGjAyhgc2ppISGcoT0gZg5NOvPo90LraIguymYVBCR0
SFWCM1KyO4kbz2ONAfOZO8W9ICS279CIfgLChzQX8tmbu1jlF4CFS4WNqMgkcOHNmg72/Tlp
oILObduiHj2zBFZUkiHWX56M1/Jn5shoHnL/8fg4RBfH64uB612yH/7n4/B092O85f8Hnn7F
cfNnlWXDEZw6h5UnoLfvz69/xse399fjl48x2tg4igvtIaN2lGvJQvnEeLh9O/yRCbLD/UX2
/Pxy8V+iCv998XWs4huqIi12JRRQfqoLTD9CfUX+bTEnb8hne4qsYt9+vD6/3T2/HPo7dONQ
YBJoSxUAHVa+DDiy95CnCPpyt68bz+eF1zJfOzPLVe0+bFyhKluuN/JqO5349uuPfk1fX9fl
me152q6nWoAmg63NTlOC83D7/f0BaQ8D9PX9olZvyp+O77SPV4nnYfcKCuCRFWI6cUioVwUh
DrDZQhAS10vV6uPxeH98/8EMe+5OsVoab1q8R9qA7ot3Epu2cbHSrL7pSt3DiIjdtFucrEnn
6ugAfbtkv29UWS0kYpq+w3vQx8Pt28erCmz9IbrA4GRyqtSDZiZIP6ZKBTtaeapH8zJrtS+b
YI5LHSC0d0aoJk0v8/2MVQuLHTD7TDI7OQHFCHpehlG2+8N+gmRNPoubPTsDzvQ2Vp2gKzti
x4ihp1Na9axVOnZ+Y3Tu+FPcNTYBFcZb2EqzC1EmhOyEPG0Mq7hZTNnDJolaYE5Ybpy5r31j
1T7Kp66DbUEAoL0eyUUVOPUhAncBPkk6m/lEMq8rN6xEy8LJhHOBOSqzTeYuJvjBA8W4CCMh
DlYePjWh2Ngi5aGu6olPZmSf2+grAal5teVB/04sTF6E9HaxWHneRFu+AIJU1aIMpbnJCCgr
eAqAqlKJukrnD2TBcBzswgG+PbyAtJfTKY49BeYRu7RxfQZEJ+QJTFasNmqmnuNpgDkZ96HT
WtHhPhs1XGICVHEAzGkuAuT5U66Ht43vBC5+pRcVGe1gBcHHXLskl9t7HTLHkGzmYB6/EYPg
uhOikNCZqt7N3X57OryrM1h2Dl8Gizm7gwAEPmm9nCwWWND0J/x5uC5YoOVGQKL49VigpiSa
XZ5HU9/FITT7JVBmInUEHgXuUs+gwS2Ahh74YpNHfuBNrQi9VTqab9lAVedToipQuC3vHmsz
NmWHWA3+yVXPG93L51ty0EAIe7F99/34xPDNKGgYvCQYPCBc/AH2p0/3YnvxdKClb+o2zdGl
mnZJI71G1tuqHQgsl2st2DaBnZIto+a6WTVcJmMz+MoSDfzl+V0I0SNrDe+7c84OOm7EVMX3
LmLP6FH5I0EBu42UGHwCLbaRRIwAwMHmfADwp0RGSRqx2PN7xyoDBfWsDq01m+0S0WVYjcvy
auEMT5As2akkapf2engDHYVRcZfVZDbJ13hdqVx6eAff+uGdhBGREGcbsY7iSMhVM6XXgpuK
PUbIq8zBarb6Noz6FNSmsQm0WNE4W9K88Wd4NVXf2u2ggmlaJ0Cn3NVFv8JpMRIwlD1fUxgq
SH2150F95E5mvIZ9U4VCtZqxvGSM8EmffAK7dHPgm+li6hsijRD3vPP8v8dH2GyISXtxf3xT
DxsYASc1K4s2lMYQ3Dttk26Hz3yWjqYsVmnBeZ2pV/DKgoZwburVhH/K2OwX/ANlSIJm9y7z
p9lkrz8c+UmLf+1dAVq63GbBLw7q0YFlh/2TEpQAODy+wNEMO7XhnHERTLWlMIVAp0mdl1G5
1YJODUTZfjGZOcReW8HYlyhtXk3wZa38RmtqK0QDVlblN1bbYBPvBD65j+AaNurILdpMiQ8x
TUn0GgClMWdSDBjlrq6lLgcBAZxXlSz3Aboty4wWWyX1Ss9EVKXTnbsQAvCT2YAxI3+UmCed
5qdxmBc48pP4UAIXNxuA4Fdj1XI2zYCVbsECX0/UXnFmIz1GhhXpd6fgVuTu4fjC+MyvP4Mx
KPYP1K1S5J8G3BTVIdBhS1EjQ7SWVOBplu8LsYomrXxcXZdZho2JFGZZR3kj+lrdlulY5Xxo
fUUcL0kMROOV3rAM00cwl24+vrxJA7dTs4fggsQVJwJ2eSrU35igl1HeXZZFKD2N9ilPwyHS
QHgZ8MAfc34BKQHOF2OaVCh1IcUBa6T5Psg/6xEBVEX3olPG6lpKrvZh5wZFLr2e6lmMSGiY
rerSaGGLnaLL0sOq2pRF0uVxPptNJnqXlFGSlXAFVccJOzkEjbwnVx5ZaeYIgb3WAGoItw41
1pvTCiA8COPN5AWB4qPEcHY5CBHCMigpWPLzTh/ziIxLHhmRGgguq0xf7tXhFTxUS3n1qE4/
Ob8t58jG2RKOkR9Oj8SG6a3egeFxGp6GLdNCTHUxf/luYR6CpctiF6c5t2rFIXImCd7nCaAQ
y2WufY7rIgWC/UQTy1g36sz36uL99fZOKjv6Yta0xF+R+ASvUW0J94cpr5mdaCCML7+2A028
zXNucgGuKbd1lEhbyBKHE0O4TRLW7TIJyds3xYfthu1upp1DvvCOjhwLKpduFYydzbE6pOny
dT0SN7rKrFNEO47TR6reVMKWSRolnv2QdiTLw2izL13b2TOQqYcv6IxFVQ9c/d8kBravluiL
OFF6En6hBfnVyVqLDVauMMZWj3iVGS0VsG6VW/sb0OFqq1UAoMSzw6qhH0MIl65QkSZOZQpc
H87I6mUV0fChVRBBKKNM0bIbEj9BQpaJfAxEgGWE92DgdUR09V52tn6qwhmsg3PlMF7PFy5n
XN1jG8fDOj9A+9A5JJ88tzyU4OqAZnVa8rZ9TZbmNpfb8tRF/F8kEb9W9O5R+FMDagivLoSP
8FBYihrs5jES8yLpriCQmXJ7SVyMhbApExuyVQM2lQ179iNwaUlcliX71u2o5tmDun3Ytlwm
Aj81k0xlwWWTQmBiTgMdaJok2tZpe03q4JkZer+QoXcmQ82XmIRdbotUeZ9HMuXTMnbpl55W
FJIvZe9j7TMVfSwwK+LeYwQLYvo2yySB50HgnpR7D4CyVwNB9dsT8lwPYTqzlz6pyqN8P9ny
IxRDTkyBgDYif8s0bdim4C2cn0F7WRUWtV41rg1XRmeQy7Y2ch20iDRTCdHy5Rq9IUFQcT6T
PoU5OgPi3MgMNGhUaHrJPramqdTyEVtafBKrjvFOXytGLN/ysMoiyRqqiOG64wkE+1ysjA2Q
bgnvELsSex0Fr5wdgInbv1yolWDbem3Bi7zEjqe+rtoUuxcmYCHr1w3B7RLK2COIiUI/opbb
VMinAszlixDiULBj3BRlm65Q3rEOSBVA+VDGJYUKwY7L523ZcjIOYhytmn4xJDACWm0hPit1
KyRA/BmEcg3JsnAp+iILr0neJxiE+0xrwV2d+MFN40jC7CoUuvJK7OBLLnQHSgM7ir0lv73o
Ttni81nkSRtGZXU97Gii27sH7BF51QyrNRp5JT5hQltmVU+xEQtVua5D3mfGQGX4ZzYoyiVM
zQ4C2nG35UADswA7oBxhJucinKWCo7sa2ReqX+I/6jL/M97FUqcwVIq0KRdih67x0qcyS9k3
/DdpHySo/97Gq2HNHArnC1R3IGXz5yps/yxavjLqgTU9sBdpeNbdjdQo9fCyNxIqcgVxyLzp
nMOnJfjjbZL2r9+Ob89B4C/+cH7jCLftCoV+KFpDRkiQnRUkur5ix8nSHWrf/3b4uH+++Mp1
k9QatLNCAF1aNnkSucv1J/cI3D/Eg+0se0gFlHCS1mKvzACEPoboiqnmnkAio02axXXCCZzL
pC4wH2mb/DavaPsk4CeaiaIxdNbTRcx2nbTZkmWmPMlXcRfVCYmwPsbfXKfrsGhT1V7sLhZ+
TiwxHMaYYzeWA25n5RyWbrhJG8saHFbbNJYwNjTNHmSw14Be2fJKpCTVchuBvcts/t5mM9Ti
9K0C2qLRWyYrBqBp1EuNJtEyjsTqZn4rRUNwK2Kdz9uw2VB2GWBKyZALJ3dIQ6iUGGNzgTOD
vOogdLf+VsNCanO4ydLBxUNUbdmi7ew8ktxonu10fHbjmb0loCVf4M1PSmtaPrLnSOHJuJIQ
XhIcMJ+nTfJlEsdsUOfT6NThOk+KtuvFt8j0rylSb85sHfK0EAsGr/nkOidXGuBzsfc0JhWg
mUk1M7m7NrJXEPAKA8+rrxUj6wmEbqvBK4jFmOjfIJ4y2OoPaj06BlcEYnjPIb0TUs9aIDcR
Tnta1BVB4LkjmhMWigr4xF4IQujZ600bRLG9KNzWgZrJGLeay5ShRx3xKylIm39eb6POv33/
5/k3I9dIHSDb8wHPIEYP1zgOvJA2O8LIW0OPUZDuSmyN2AicJo8ndWmIpAF2RiMaSaynSwPB
Db6AHKGREDdwSilVjyzN0/YvZ9TPkvaqrC81CTsgtckM3ztX+yZhihTEsoGXSHKnriAdb9Ir
Qz8XlnVKVc2QUwQPO74sWYeR2NQW7JlGTwS6VZIBEW1bnDbhUgi6bVxxUW0ECbcMi10GvNEW
W+YSBa+QUlj7hN4gBeoxgpptUVeR/t2t6SrTQ+0MFCXVhl/To1TbEqf9+Q0bkkBiQ9itig2p
PIYZOpjsuoDqKgkvu+oKdMENXyeg2laRyM6OtzG8RJrbvRHKv1I64aXaLob92uK2WBL+Qv3O
caDYUIU2KRvaBfCispy/4VhE4uO0BJrbMUAP+7lO7OfIlMO4OTXtshDNeYcNhChgnzFpJMjs
ScP41ioG/i9UMWBfGWokDu0/hHGtGLq4URxnx6yR+LYGz2bWIheWNAv8kopiqMsdLRU3kSmJ
ZysymHt6xmlTArN1vDsCktpxf84TgsahhcsASLRzhjIdW2X46Y4pOJtLjPd0/hsQnDUlxmtj
MoCNKTcgOO8xpI0Gx40YG7+NBD7ttssyDbqa1k/CtpQOgoIJZTosTHCUiM1WpNdIYYo22dbc
meNIUpdhm+JAyyPmuk6zjM94HSYCcybbdZ0kl1zKNIKwzvxWa6QptilrFof7IQ0LLv92W1+m
bOAqoOiPvcZUccZZc2yLNFJ30RTQFWWdh1l6E8rj+iFiGT4jIRec6gX94e7jFWw0jXhpINlw
ZeC7q5PPW4ghbRdZQmdpUqEDip2jSFGLzbvlmqjPkmlgW4OuGasajAPf30Sc4LhmXbzpSlG0
bDqX53DhA6G7Gmmp1tZphByucjdCA4wVpmOOvfrLJRTqcssN9ibcJeJPHSeFaM9WBgmrrqVa
FPU+R0dKjegMqluJDGCve44Glsymoty5Ekop3KUo+xiL2U3YyhDdYPMaJ5skq/SLdb3tTR5a
bmJHkrbMy2vedGKkCasqFGX+pLCsDOMq5W/jRqLr0OKn9FTncAU2jKnlsOVUmtC8y6sCXjYy
wwuGCWt6NzaCThdfeARO6LC5zvMEmNOuW6aWZiQ71vqrP1Q/TQEcVlK0QOyAn+/+vn/+z9Pv
P24fb3///nx7/3J8+v3t9utB5HO8//349H74BsvE719evv6mVo7Lw+vT4fvFw+3r/UGauxsr
yDqKuirbruG2T8zpqM2EQj9cHeWHx+fXHxfHpyO8/jz+c6u/p0/BZECwXXQpFjbdVeS5EiST
/gvy5XWdcK8iz1DDTMXDx5PuwK2N5XpQtk5eqgpeGofIcp08EIOZlZV2sLPh+3VA20dtdH2i
S4TTWbBYfsvx6u/1x8v788Xd8+vh4vn14uHw/UX6XCDEcGdMHNESsGvCkzBmgSZpcxml1QZb
LWsIM8mGxDpHQJO0JkHzRhhLiA6/tIpbaxLaKn9ZVSa1AJo5wDGWSWpEMqRw4hyzR+mzhU04
HmNoNjw91XrluEG+zfDFgUQU2ywzqAHI1aSSv/xGWFHIH+68ZOiVbbtJcEDXHt5HEVR3fB9f
vh/v/vj78OPiTvLwt9fbl4cfBuvWTWjkE5v8k0RmcUnEEtYxk6VYk3eJ6/vOYqhg+PH+AC/P
7m7fD/cXyZOsJURb+c/x/eEifHt7vjtKVHz7fmtUO4pyYxTWDCzaCBUudCdVmV3Tt9LjtFun
jYOffA8TLPmc7pjhS0R+YqUiDsmVW2Hp/uTx+R6bCgzVWEZMVtGKu1sZkG1ttoZhyiRaGrCs
vjLSlitiLz4y45L1F6iw+7Zhqi0E9lXN2qQPnL8Zu9uY0LHYMrTb3GxG04juHgyub98ebD1J
okUPqxsH3EOn672wy8PRrVZ8/HZ4ezdLqKOpa2anwN2uyhum+hJrVmEvF2O9EsssvEzcpQVu
DrHIvHUmcbqyY4Z6Ge2VYLkyJCY/rdnqWQcvjz2DOI85Or+rKrML81TMHflyxMTVeczNQgCT
wI8j2PVnHJgEOBmm8iZ0GD4GMNTTzsiCAooxZO8m9B1uaRcI1nVFj82nZlatUHaWpSmG23Xt
YC+oPfiq8qXvCaWcHF8eqPf9YU0zeUjAwLW3sfwV22XKTfKwjtignAOnllc0lICGMM7nB4YN
8yTLUkZAhLDfHhIZK6XAcudLCG0OU8x0w0r+Gt1wuQlvwthknDBrhPAwK9tLFY4FkoTfVY34
ukqKs+K/yc/0fJuYfSc25uxg9PBTtyqueX58gfe/R+xHcOwyeT9qdARc6OuwwDMXPGIOcIJt
zPkO15lDjerbp/vnx4vi4/HL4XVwIKbtk0Z+bdIuqmrWfmRoRL2Urle3JkcAhhUWCqM0Z71M
iYv425UThZHlpxTC3STw7rC6ZrIFjRTiV5y5+NEIB53/l4i1LrLSwb7D3jKomzQi1zZE349f
Xm/FBuz1+eP9+MTIaXBXxK1DEi7WFpPFwL+REoBj1HgusU1IAk7Ny7PJFQmPGnXU8zmcVFkO
za06AB+kqtC4wcjEOUdyrnirdD61Dqm7HNEo1XSe2FhsvchZTddeV2a4jwjcW32VyvzbxVd4
IHj89qReZN89HO7+FntwPJvV/TmMZXQJFqzDISpvcvoLeQ/NXKZFWF93lcisXf01OsoymPV0
kBtKI3FmBixTIZshvioO6dQ/1xViu4jgKLKWz0VJtCVEkiWFBQvBe7Ztim8qo/L/KjuW3bht
4D1fkWMLtIEdGG4uPmglraWuXtYju/ZFSJ1FYKR2DD/afH7nQUlDcqikBwNezogSh+Rw3mwT
Oeds5ZUpyXOycJy7iTYUTYgO+rhsDnHGXvM23ToYGG+Id7hO6VO5HVUO4iRoVsC3VIYQn1pn
bDz6Qmk85v0wWjYCRy6Gn7bN3oYUeZxurrVKpBbCmfJo1O6jPuBgJoyN6s8A2Ll1aMVu51pN
D9hHvp4Qi2heI/rLtJqoSupSDF/pVoY/LX1hK8f02e0YnIfMubACS2+YCzmteswWtmo960Fc
TvSWha1+nx6mRc0a/uEGm6WWyi3j4YNWudcAKUdaahumPY/OrZk0zVGrWY8XYJ8N5cbrDG+L
9F+xif9U3hCY22XE46UVfSQAxU0ZBQBnPh9QHCmgTSRjVxe1VUZetqKH6YP+AL5QgCjx8GNU
jKijiLFHbRtdMwcR7KXr6jgHlvUxHQlhASHTAXYls6+5CaOERouNYXsiSVDR59G1ISNw08s+
c2AIgC7Ic+NGVyMsSpJ27MfzM9j9grJ0h0VcRBQCl5GYtkC7fV73xUZOLXWF9Q7cyKHpkcuC
p0OQj64DYxeS4BLNAGqqHHNyJVl8UW/sXwu3FM5hkxQ29VncjH0knsvbK5QTRL9lQ9djL0MU
7pmFpW2T3vp92IjxYL4+pivDwSYmt8MiBXXhUB7nscFcesssPoMGTjAdt8XQZU7mo4dUxuiu
Em+EmWQCCrcdCg8qYxUFixwhwHbvTCIKtT4+3T28fOWCPvfHZ8XpQwLGbsRyafJDTDOGQunm
Zg63xEseC5Atitmo/kcQ42rI0/7ibJ5Iip9XejgTi/W6ispcCXObpa9yU8NBOqZtC5iCthzy
BX/GqXMhvOpBosxa5d3fx99f7u6NWPZMqLfc/uSTkN9ldAuvDXO/hji1qkYIaAeyi65EC6Rk
H7VbveiTwNr0+p2NlwnsvbjNm0BCV1qRq6Ac0HDhpuManG0L5B3hM6qL9ydnH96I9doAy8QC
FHaeRgvaGHUbqS7XLMXSOJjkBvxO7u+6gaUIegVAiryysh55qB3ncWKSSBn1sWCjLoQ+d6yr
4tqn/bbGyhIcsYhXgzX65W8/vRjeyBsazV5Mjn+9fqHrsfOH55enVyyVK5ZNGV3mlDBE1YH8
xtlzyPNzcfL9VMMCqTyXsrUZn5BGKHqBuNEOloKkBf5WJmfhXJsuqkAgrfIep8TxohJUC3ih
p6ICOHPJx5F3MeUqheyRcKCuP4OYJORpb8abOvdrK0jAbdJDj/dnBBy33DMi0hGoB8xgN/W+
UtkiAZs672p76drtY1UzUe0qSDbOTdrqkRbLR466I5wROK2y8wlnAIFDRkVFR/ZPoFHNTS32
xkZzo29saBsPxB1+2A3nA01FI9wNMGEZ5jYdLqfirC2GjZ/mKveMWYBw/JtICHth/qAd0+VI
pOBknNPzk5MTd9AzblDUtrDmWILt1ifgjIV5wXi1mrY3DQ+lMI2h4zy9hSLA/RMDTKtkpTYD
d6OGr8zMw+DkbT/4/CnQzNc7UgCFP0DDqFFK/sGU0RAwD3pb1Hu/IwusCTcxDWAXIR/zTFjc
TH3QcrIDORbW45A84ypw7LBDpLf1t8fn397i7Q6vj3ysZJ8evkjZDHhEjIEktVUzwGrGgiaD
sMKhuWRolpvP5PTW294Bq2Rsk5VO8P5wvIuulIj0RZrlKYhsPtvaEPiyMcPKZH3UaULI/gqv
Xo+zpL6Uh8o6NTlsEs7uz694YMujwVr2XmoBNStp8FPcjdKlPeXIDndp2vBJ4C5mYKmlHT3B
Jj70vS/n4i/Pj3cP6I+Hsd2/vhy/H+Gf48vtu3fvfhU1L7GuBPVLl3AveSuzNA+r3S8jQY/h
CN1tiNrs0KcHaQE2y9jcpu1tXB19v2cIMNt6j8GV3pv2nZV+xK30YY4WyimtjU9JAwgyu6iv
UYfoijRttBchxcgpYc7DziEQbADUL6eglPnty9hWtbX/MZ/Ta3vKJgJ+sS0iWcODeA4BJRVI
ygVijUOFPjtYymygW2HcOz4dvcXHO+krC2efP718eotS2S1aqD19B63dyrIOlHEwq8eT5qn4
Rw5SwwKg07sak6iP0JSMZbpz40u1NnzgM+3+Y9C+QAYFCXku6wcChsYFeI8A0N02KJCYwU7z
E1gRiInlUcO1UBFDPq1QClHwlCO9iHhIPfQX708l3FsD2JheqQmFU11da9TutAFnZY2oVXQh
W6WmPQFiNKYvB7y/8PUZMP6Cj1rKUqWipSo2Wner+LqvtR1cUel1GKwVYg2Tsh0qVvbWoZdt
1GQ6zmRb2E7EDAPHfd5naDJylSoDLkkGBQT0fDgoWBCCJhIxQbqvereT2DzIvYhVRn3HTgY0
civ3jmu64ZnwLfaOVMeJ4tq/HhXMCYQmNvXjvP5Mg5YWyYTQg7CjsinUqkFCUqRylblJNEwT
yfIw7N9gyDdSaXEB83jZ47d/j0+Pt+pWx8xJEyC5T9u2tqgCVDAyMJwqcGKdC4NURnMZUhqw
37TEa0lZjLaC3DDjo0HpRRr4FjhQcNzmh6FRYFhemW2FqscJX4uziPIdVifcBe1lByuS5cCW
cicYlluBOh2czBvbdiKfGNsaL2HV0qBZEpFrDQXBw4ir0f3wNGqL6+AHI0bTY+ammCFoI9cf
qCg5SuK0vC0Dnzf10kTaH59f8ChGETH+9s/x6dMXcXsElb4Twv5cCW+xWnNbeqCF7cCm82yk
ZbWUHROfX+pITlFN5AnhHvWEp7Tnwpc/+8BKaTR3i+7iWlQTMQoS6EHQbBiVdFzZ2Phr0sPR
DxS1aOOwk5UQBW2B7UBFLJwM3In5AX+E85BIjrvIhMYsR8ku6XWxB5+gQxw2SaAIOaEEoZtJ
8qIduHLAb9DHtAKXXqogluWwCqMZC0gQzpLv+dm6qYcGnqUHt6yRQxn2TLAXSM0CM1hd3FzL
tUztOwD0dslQCTZRDvdWo/GOuF1BM6zuQo9NI4xhCOQDEZS9fmG4ZhewMVp0iPe4nFfoGQqF
Imie6AlBvEx3K2v4Yxm2TPLgMRwKM8fCKJtG9xMwECNZsppMZh91rpFXWO8aUEFuy8qo1VR1
6mubtyVoJ5akysuEqmTp4gKBBN/VhUYKtVnHYXIkabE22yZPLpi6xasXzrkw1DJohdFARokj
WOrhrUMBPHnvrXh4EtvVrgEWVD1XzzsvwYj9hv8Bm9kXydH7AQA=

--n8g4imXOkfNTN/H1--

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A565E2E982
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 01:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfE2XlU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 19:41:20 -0400
Received: from mga02.intel.com ([134.134.136.20]:17779 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbfE2XlU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 19:41:20 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 16:41:19 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 May 2019 16:41:18 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hW8C5-000BDm-Tf; Thu, 30 May 2019 07:41:17 +0800
Date:   Thu, 30 May 2019 07:40:25 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc:     kbuild-all@01.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [linuxtv-media:master 105/166]
 drivers/media/usb/dvb-usb/cxusb-analog.c:1498:41-42: WARNING: Use ARRAY_SIZE
Message-ID: <201905300723.y0p0WH3o%lkp@intel.com>
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
head:   3b6471c7becd06325eb5e701cc2602b2edbbc7b6
commit: e478d40540544e229c843fe0c698ebc7d0ca07e6 [105/166] media: cxusb: add analog mode support for Medion MD95700

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/media/usb/dvb-usb/cxusb-analog.c:1498:41-42: WARNING: Use ARRAY_SIZE

vim +1498 drivers/media/usb/dvb-usb/cxusb-analog.c

  1457	
  1458	int cxusb_medion_analog_init(struct dvb_usb_device *dvbdev)
  1459	{
  1460		struct cxusb_medion_dev *cxdev = dvbdev->priv;
  1461		u8 tuner_analog_msg_data[] = { 0x9c, 0x60, 0x85, 0x54 };
  1462		struct i2c_msg tuner_analog_msg = { .addr = 0x61, .flags = 0,
  1463						    .buf = tuner_analog_msg_data,
  1464						    .len =
  1465						    sizeof(tuner_analog_msg_data) };
  1466		struct v4l2_subdev_format subfmt;
  1467		int ret;
  1468	
  1469		/* switch tuner to analog mode so IF demod will become accessible */
  1470		ret = i2c_transfer(&dvbdev->i2c_adap, &tuner_analog_msg, 1);
  1471		if (ret != 1)
  1472			dev_warn(&dvbdev->udev->dev,
  1473				 "tuner analog switch failed (%d)\n", ret);
  1474	
  1475		/*
  1476		 * cx25840 might have lost power during mode switching so we need
  1477		 * to set it again
  1478		 */
  1479		ret = v4l2_subdev_call(cxdev->cx25840, core, reset, 0);
  1480		if (ret != 0)
  1481			dev_warn(&dvbdev->udev->dev,
  1482				 "cx25840 reset failed (%d)\n", ret);
  1483	
  1484		ret = v4l2_subdev_call(cxdev->cx25840, video, s_routing,
  1485				       CX25840_COMPOSITE1, 0, 0);
  1486		if (ret != 0)
  1487			dev_warn(&dvbdev->udev->dev,
  1488				 "cx25840 initial input setting failed (%d)\n", ret);
  1489	
  1490		/* composite */
  1491		cxdev->input = 1;
  1492		cxdev->videodev->tvnorms = V4L2_STD_ALL;
  1493		cxdev->norm = V4L2_STD_PAL;
  1494	
  1495		/* TODO: setup audio samples insertion */
  1496	
  1497		ret = v4l2_subdev_call(cxdev->cx25840, core, s_io_pin_config,
> 1498				       sizeof(cxusub_medion_pin_config) /
  1499				       sizeof(cxusub_medion_pin_config[0]),
  1500				       cxusub_medion_pin_config);
  1501		if (ret != 0)
  1502			dev_warn(&dvbdev->udev->dev,
  1503				"cx25840 pin config failed (%d)\n", ret);
  1504	
  1505		/* make sure that we aren't in radio mode */
  1506		v4l2_subdev_call(cxdev->tda9887, video, s_std, cxdev->norm);
  1507		v4l2_subdev_call(cxdev->tuner, video, s_std, cxdev->norm);
  1508		v4l2_subdev_call(cxdev->cx25840, video, s_std, cxdev->norm);
  1509	
  1510		memset(&subfmt, 0, sizeof(subfmt));
  1511		subfmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
  1512		subfmt.format.width = cxdev->width;
  1513		subfmt.format.height = cxdev->height;
  1514		subfmt.format.code = MEDIA_BUS_FMT_FIXED;
  1515		subfmt.format.field = V4L2_FIELD_SEQ_TB;
  1516		subfmt.format.colorspace = V4L2_COLORSPACE_SMPTE170M;
  1517	
  1518		ret = v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, NULL, &subfmt);
  1519		if (ret != 0)
  1520			dev_warn(&dvbdev->udev->dev,
  1521				 "cx25840 format set failed (%d)\n", ret);
  1522	
  1523		if (ret == 0) {
  1524			cxdev->width = subfmt.format.width;
  1525			cxdev->height = subfmt.format.height;
  1526		}
  1527	
  1528		return 0;
  1529	}
  1530	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

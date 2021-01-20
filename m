Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1255E2FD03B
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 13:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389864AbhATMhw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 07:37:52 -0500
Received: from mga03.intel.com ([134.134.136.65]:28492 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727392AbhATLJI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 06:09:08 -0500
IronPort-SDR: YVZ5LchbnOE0lBuaVz0qsbkImQm9kb6NQAOP/Xxm1hesTv6aTWG9qulfK+f9kR/oLFeRUeFnoR
 nX32Bh6JG4BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="179172214"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="gz'50?scan'50,208,50";a="179172214"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 03:08:11 -0800
IronPort-SDR: qBIRzBbcZ6EKA29eMJvTXBtq6agrR7/v4WT+P2WHkLDkdyztZb8jX4ecw2qfivGIr4BQTP5x+L
 UJge0/BpUfgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="gz'50?scan'50,208,50";a="501567400"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Jan 2021 03:08:07 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l2BLK-0005lm-JU; Wed, 20 Jan 2021 11:08:06 +0000
Date:   Wed, 20 Jan 2021 19:07:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mirela Rabulea <mirela.rabulea@oss.nxp.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, shawnguo@kernel.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     kbuild-all@lists.01.org, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de
Subject: Re: [PATCH v7 3/9] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Message-ID: <202101201954.4bCk712q-lkp@intel.com>
References: <20210111192822.12178-4-mirela.rabulea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20210111192822.12178-4-mirela.rabulea@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mirela,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on shawnguo/for-next robh/for-next linus/master v5.11-rc4 next-20210120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mirela-Rabulea/Add-V4L2-driver-for-i-MX8-JPEG-Encoder-Decoder/20210112-033507
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-m021-20210120 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

smatch warnings:
drivers/media/platform/imx-jpeg/mxc-jpeg.c:1373 mxc_jpeg_parse() warn: inconsistent indenting

vim +1373 drivers/media/platform/imx-jpeg/mxc-jpeg.c

  1286	
  1287	static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
  1288				  u8 *src_addr, u32 size, bool *dht_needed)
  1289	{
  1290		struct device *dev = ctx->mxc_jpeg->dev;
  1291		struct mxc_jpeg_q_data *q_data_out, *q_data_cap;
  1292		enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
  1293		struct mxc_jpeg_stream stream;
  1294		bool notfound = true;
  1295		bool app14 = false;
  1296		bool src_chg = false;
  1297		u8 app14_transform = 0;
  1298		struct mxc_jpeg_sof sof, *psof = NULL;
  1299		struct mxc_jpeg_sos *psos = NULL;
  1300		int byte;
  1301		u8 *next = NULL;
  1302		enum mxc_jpeg_image_format img_fmt;
  1303		u32 fourcc;
  1304	
  1305		memset(&sof, 0, sizeof(struct mxc_jpeg_sof));
  1306		stream.addr = src_addr;
  1307		stream.end = size;
  1308		stream.loc = 0;
  1309		*dht_needed = true;
  1310	
  1311		/* check stream starts with SOI */
  1312		byte = get_byte(&stream);
  1313		if (byte == -1 || byte != 0xFF)
  1314			return -EINVAL;
  1315		byte = get_byte(&stream);
  1316		if (byte == -1 || byte != 0xD8)
  1317			return -EINVAL;
  1318	
  1319		while (notfound) {
  1320			byte = get_byte(&stream);
  1321			if (byte == -1)
  1322				return -EINVAL;
  1323			if (byte != 0xff)
  1324				continue;
  1325			do {
  1326				byte = get_byte(&stream);
  1327			} while (byte == 0xff);
  1328			if (byte == -1)
  1329				return false;
  1330			if (byte == 0)
  1331				continue;
  1332			switch (byte) {
  1333			case DHT:
  1334				/* DHT marker present, no need to inject default one */
  1335				*dht_needed = false;
  1336				break;
  1337			case SOF2: /* Progressive DCF frame definition */
  1338				dev_err(dev,
  1339					"Progressive JPEG not supported by hardware");
  1340				return -EINVAL;
  1341			case SOF1: /* Extended sequential DCF frame definition */
  1342			case SOF0: /* Baseline sequential DCF frame definition */
  1343				if (get_sof(dev, &stream, &sof) == -1)
  1344					break;
  1345				next = stream.addr + stream.loc;
  1346				psof = (struct mxc_jpeg_sof *)next;
  1347				break;
  1348			case SOS:
  1349				next = stream.addr + stream.loc;
  1350				psos = (struct mxc_jpeg_sos *)next;
  1351				notfound = false;
  1352				break;
  1353			case APP14:
  1354				app14 = true;
  1355				/*
  1356				 * Application Data Syntax is:
  1357				 * 2 bytes(APPn:0xFF,0xEE), 2 bytes(Lp), Ap1...ApLp-2
  1358				 * The transform flag is in Ap12
  1359				 * stream.loc is now on APPn-0xEE byte
  1360				 */
  1361				app14_transform = *(stream.addr + stream.loc + 12 + 1);
  1362				break;
  1363			default:
  1364				notfound = true;
  1365			}
  1366		}
  1367		q_data_out = mxc_jpeg_get_q_data(ctx,
  1368						 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
  1369		if (q_data_out->w == 0 && q_data_out->h == 0) {
  1370			dev_warn(dev, "Invalid user resolution 0x0");
  1371			dev_warn(dev, "Keeping resolution from JPEG: %dx%d",
  1372				 sof.width, sof.height);
> 1373			 q_data_out->w = sof.width;
  1374			 q_data_out->h = sof.height;
  1375		} else if (sof.width != q_data_out->w || sof.height != q_data_out->h) {
  1376			dev_err(dev,
  1377				"Resolution mismatch: %dx%d (JPEG) versus %dx%d(user)",
  1378				sof.width, sof.height, q_data_out->w, q_data_out->h);
  1379			return -EINVAL;
  1380		}
  1381		if (sof.width % 8 != 0 || sof.height % 8 != 0) {
  1382			dev_err(dev, "JPEG width or height not multiple of 8: %dx%d\n",
  1383				sof.width, sof.height);
  1384			return -EINVAL;
  1385		}
  1386		if (sof.width > MXC_JPEG_MAX_WIDTH ||
  1387		    sof.height > MXC_JPEG_MAX_HEIGHT) {
  1388			dev_err(dev, "JPEG width or height should be <= 8192: %dx%d\n",
  1389				sof.width, sof.height);
  1390			return -EINVAL;
  1391		}
  1392		if (sof.width < MXC_JPEG_MIN_WIDTH ||
  1393		    sof.height < MXC_JPEG_MIN_HEIGHT) {
  1394			dev_err(dev, "JPEG width or height should be > 64: %dx%d\n",
  1395				sof.width, sof.height);
  1396			return -EINVAL;
  1397		}
  1398		if (sof.components_no > MXC_JPEG_MAX_COMPONENTS) {
  1399			dev_err(dev, "JPEG number of components should be <=%d",
  1400				MXC_JPEG_MAX_COMPONENTS);
  1401			return -EINVAL;
  1402		}
  1403		/* check and, if necessary, patch component IDs*/
  1404		if (!mxc_jpeg_valid_comp_id(dev, psof, psos))
  1405			dev_warn(dev, "JPEG component ids should be 0-3 or 1-4");
  1406	
  1407		img_fmt = mxc_jpeg_get_image_format(dev, &sof);
  1408		if (img_fmt == MXC_JPEG_INVALID)
  1409			return -EINVAL;
  1410	
  1411		/*
  1412		 * If the transform flag from APP14 marker is 0, images that are
  1413		 * encoded with 3 components have RGB colorspace, see Recommendation
  1414		 * ITU-T T.872 chapter 6.5.3 APP14 marker segment for colour encoding
  1415		 */
  1416		if (img_fmt == MXC_JPEG_YUV444 && app14 && app14_transform == 0)
  1417			img_fmt = MXC_JPEG_RGB;
  1418	
  1419		if (mxc_jpeg_imgfmt_to_fourcc(img_fmt, &fourcc)) {
  1420			dev_err(dev, "Fourcc not found for %d", img_fmt);
  1421			return -EINVAL;
  1422		}
  1423	
  1424		/*
  1425		 * set-up the capture queue with the pixelformat and resolution
  1426		 * detected from the jpeg output stream
  1427		 */
  1428		q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
  1429		if (q_data_cap->w != sof.width || q_data_cap->h != sof.height)
  1430			src_chg = true;
  1431		q_data_cap->w = sof.width;
  1432		q_data_cap->h = sof.height;
  1433		q_data_cap->fmt = mxc_jpeg_find_format(ctx, fourcc);
  1434		q_data_cap->w_adjusted = q_data_cap->w;
  1435		q_data_cap->h_adjusted = q_data_cap->h;
  1436		/*
  1437		 * align up the resolution for CAST IP,
  1438		 * but leave the buffer resolution unchanged
  1439		 */
  1440		v4l_bound_align_image(&q_data_cap->w_adjusted,
  1441				      q_data_cap->w_adjusted,  /* adjust up */
  1442				      MXC_JPEG_MAX_WIDTH,
  1443				      q_data_cap->fmt->h_align,
  1444				      &q_data_cap->h_adjusted,
  1445				      q_data_cap->h_adjusted, /* adjust up */
  1446				      MXC_JPEG_MAX_HEIGHT,
  1447				      q_data_cap->fmt->v_align,
  1448				      0);
  1449		dev_dbg(dev, "Detected jpeg res=(%dx%d)->(%dx%d), pixfmt=%c%c%c%c\n",
  1450			q_data_cap->w, q_data_cap->h,
  1451			q_data_cap->w_adjusted, q_data_cap->h_adjusted,
  1452			(fourcc & 0xff),
  1453			(fourcc >>  8) & 0xff,
  1454			(fourcc >> 16) & 0xff,
  1455			(fourcc >> 24) & 0xff);
  1456	
  1457		/* setup bytesperline/sizeimage for capture queue */
  1458		mxc_jpeg_bytesperline(q_data_cap, sof.precision);
  1459		mxc_jpeg_sizeimage(q_data_cap);
  1460	
  1461		/*
  1462		 * if the CAPTURE format was updated with new values, regardless of
  1463		 * whether they match the values set by the client or not, signal
  1464		 * a source change event
  1465		 */
  1466		if (src_chg)
  1467			notify_src_chg(ctx);
  1468	
  1469		return 0;
  1470	}
  1471	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--EeQfGwPcQSOJBaQU
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICOsECGAAAy5jb25maWcAjFxLd9w2st7nV/RxNskiGT1sxTn3aIEmQTbSJMEAZKulDY8i
txOd2FJGj0n8729VgQ8ALLYzi4yFKjwI1OOrQqG//ebblXh9efx8+3J/d/vp05fV74eHw9Pt
y+HD6uP9p8P/rVK9qnSzkqlqfgTm4v7h9Z//3J+/v1i9+/H09MeTH57uTlfbw9PD4dMqeXz4
eP/7K3S/f3z45ttvEl1lKu+SpNtJY5Wuukbum8s3v9/d/fDz6rv08Nv97cPq5x/PYZjTd9+7
f73xuinb5Uly+WVoyqehLn8+OT85GQhFOrafnb87of+N4xSiykfy1MXrc+LNuRG2E7bsct3o
aWaPoKpCVXIiKfNrd6XNdmpZt6pIG1XKrhHrQnZWm2aiNhsjRQrDZBr+AywWu8J2fbvKafM/
rZ4PL69/TRuoKtV0stp1wsC6Vamay/MzYB/WpstawTSNtM3q/nn18PiCI4wfqhNRDF/65g3X
3InW/1haf2dF0Xj8G7GT3VaaShZdfqPqid2nrIFyxpOKm1LwlP3NUg+9RHjLE25skwJl3Bpv
vf7OxHRa9TEGXPsx+v6G2fjgK+Yjvj02IH4IM2QqM9EWDUmEdzZD80bbphKlvHzz3cPjw+H7
kcFe252qPU3qG/D/k6aY2mtt1b4rf21lK/nWqcu45ivRJJuOqMyaE6Ot7UpZanPdiaYRyWYa
ubWyUGt/MNGCqWGGoWMWBiYiDlyFKIpBc0AJV8+vvz1/eX45fJ40J5eVNCohHa2NXnvf5JPs
Rl/xFJllMmkUTp1lXel0NeKrZZWqigwBP0ipciMaVD9PaE0KJNvZq85ICyPwXZONr2nYkupS
qCpss6rkmLqNkga37HphXaIxcK6wjWALGm14Llye2dH6u1KnkeXLtElk2hs12AVPxGphrOx3
ZTxef+RUrts8s6EeHB4+rB4/Rgc62XKdbK1uYU4ndan2ZiTp8FlITb5wnXeiUKloZFcI23TJ
dVIwokEmfDdJWkSm8eROVo09SuzWRos0gYmOs5VwYiL9pWX5Sm27tsYlR5bP6WZSt7RcY8mh
DA6JdKO5/3x4eubUo1HJttOVBPn35qx0t7lBr1KSxI5HB401LEanKmH00/VSqb+R1OatV+Ub
FKd+pTR2f9yzNU7T1kbKsm5gsEqyJnNg2OmirRphrpnV9TyeSes7JRr6zJqdrtLuwc7+p7l9
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

--EeQfGwPcQSOJBaQU--

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5BB05FD67
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 21:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfGDTVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 15:21:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:13392 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbfGDTVG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jul 2019 15:21:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jul 2019 12:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,451,1557212400"; 
   d="gz'50?scan'50,208,50";a="363420111"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2019 12:20:57 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hj7Hs-000HHE-RD; Fri, 05 Jul 2019 03:20:56 +0800
Date:   Fri, 5 Jul 2019 03:20:05 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     kbuild-all@01.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, hverkuil@xs4all.nl,
        Dariusz Marcinkiewicz <darekm@google.com>
Subject: Re: [PATCH 5/5] drm: exynos: exynos_hdmi: use
 cec_notifier_conn_(un)register
Message-ID: <201907050352.WrwIIrrD%lkp@intel.com>
References: <20190701083545.74639-6-darekm@google.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sfcq2xd6cuexkjxc"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190701083545.74639-6-darekm@google.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sfcq2xd6cuexkjxc
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Dariusz,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.2-rc7 next-20190704]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Dariusz-Marcinkiewicz/cec-convert-remaining-drivers-to-the-new-notifier-API/20190702-213026
reproduce:
        # apt-get install sparse
        # sparse version: 
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i2c/tda998x_drv.c:1045:5: sparse: warning: symbol 'tda998x_audio_digital_mute' was not declared. Should it be static?
>> drivers/gpu/drm/i2c/tda998x_drv.c:1268:9: sparse: error: undefined identifier 'cec_fill_conn_info_from_drm'
>> drivers/gpu/drm/i2c/tda998x_drv.c:1270:20: sparse: error: undefined identifier 'cec_notifier_conn_register'
   drivers/gpu/drm/i2c/tda998x_drv.c:1596:50: sparse: warning: incorrect type in argument 1 (different base types)
   drivers/gpu/drm/i2c/tda998x_drv.c:1596:50: sparse:    expected restricted __be32 const [usertype] *p
   drivers/gpu/drm/i2c/tda998x_drv.c:1596:50: sparse:    got unsigned int const [usertype] *
   drivers/gpu/drm/i2c/tda998x_drv.c:1597:52: sparse: warning: incorrect type in argument 1 (different base types)
   drivers/gpu/drm/i2c/tda998x_drv.c:1597:52: sparse:    expected restricted __be32 const [usertype] *p
   drivers/gpu/drm/i2c/tda998x_drv.c:1597:52: sparse:    got unsigned int const [usertype] *
>> drivers/gpu/drm/i2c/tda998x_drv.c:1658:17: sparse: error: undefined identifier 'cec_notifier_conn_unregister'
--
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2129:9: sparse: error: undefined identifier 'cec_fill_conn_info_from_drm'
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2131:20: sparse: error: undefined identifier 'cec_notifier_conn_register'
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2722:17: sparse: error: undefined identifier 'cec_notifier_conn_unregister'
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2476:30: sparse: warning: cast truncates bits from constant value (ffffff0d becomes d)

vim +/cec_fill_conn_info_from_drm +1268 drivers/gpu/drm/i2c/tda998x_drv.c

25576733ec6e05 Russell King          2016-10-23  1245  
a2f75662b7c3db Russell King          2016-10-23  1246  static int tda998x_connector_init(struct tda998x_priv *priv,
a2f75662b7c3db Russell King          2016-10-23  1247  				  struct drm_device *drm)
a2f75662b7c3db Russell King          2016-10-23  1248  {
a2f75662b7c3db Russell King          2016-10-23  1249  	struct drm_connector *connector = &priv->connector;
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01  1250  	struct cec_connector_info conn_info;
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01  1251  	struct cec_notifier *notifier;
a2f75662b7c3db Russell King          2016-10-23  1252  	int ret;
a2f75662b7c3db Russell King          2016-10-23  1253  
a2f75662b7c3db Russell King          2016-10-23  1254  	connector->interlace_allowed = 1;
a2f75662b7c3db Russell King          2016-10-23  1255  
a2f75662b7c3db Russell King          2016-10-23  1256  	if (priv->hdmi->irq)
a2f75662b7c3db Russell King          2016-10-23  1257  		connector->polled = DRM_CONNECTOR_POLL_HPD;
a2f75662b7c3db Russell King          2016-10-23  1258  	else
a2f75662b7c3db Russell King          2016-10-23  1259  		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
a2f75662b7c3db Russell King          2016-10-23  1260  			DRM_CONNECTOR_POLL_DISCONNECT;
a2f75662b7c3db Russell King          2016-10-23  1261  
a2f75662b7c3db Russell King          2016-10-23  1262  	drm_connector_helper_add(connector, &tda998x_connector_helper_funcs);
a2f75662b7c3db Russell King          2016-10-23  1263  	ret = drm_connector_init(drm, connector, &tda998x_connector_funcs,
a2f75662b7c3db Russell King          2016-10-23  1264  				 DRM_MODE_CONNECTOR_HDMIA);
a2f75662b7c3db Russell King          2016-10-23  1265  	if (ret)
a2f75662b7c3db Russell King          2016-10-23  1266  		return ret;
a2f75662b7c3db Russell King          2016-10-23  1267  
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01 @1268  	cec_fill_conn_info_from_drm(&conn_info, connector);
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01  1269  
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01 @1270  	notifier = cec_notifier_conn_register(priv->cec_glue.parent,
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01  1271  					      NULL, &conn_info);
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01  1272  	if (!notifier)
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01  1273  		return -ENOMEM;
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01  1274  	WRITE_ONCE(priv->cec_notify, notifier);
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01  1275  
a7ccc5a43b829a Dave Airlie           2018-08-08  1276  	drm_connector_attach_encoder(&priv->connector,
30bd8b862f5466 Russell King          2018-08-02  1277  				     priv->bridge.encoder);
a2f75662b7c3db Russell King          2016-10-23  1278  
a2f75662b7c3db Russell King          2016-10-23  1279  	return 0;
a2f75662b7c3db Russell King          2016-10-23  1280  }
a2f75662b7c3db Russell King          2016-10-23  1281  
30bd8b862f5466 Russell King          2018-08-02  1282  /* DRM bridge functions */
e7792ce2da5ded Rob Clark             2013-01-08  1283  
30bd8b862f5466 Russell King          2018-08-02  1284  static int tda998x_bridge_attach(struct drm_bridge *bridge)
e7792ce2da5ded Rob Clark             2013-01-08  1285  {
30bd8b862f5466 Russell King          2018-08-02  1286  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
9525c4dd923f8f Russell King          2015-08-14  1287  
30bd8b862f5466 Russell King          2018-08-02  1288  	return tda998x_connector_init(priv, bridge->dev);
30bd8b862f5466 Russell King          2018-08-02  1289  }
e7792ce2da5ded Rob Clark             2013-01-08  1290  
30bd8b862f5466 Russell King          2018-08-02  1291  static void tda998x_bridge_detach(struct drm_bridge *bridge)
30bd8b862f5466 Russell King          2018-08-02  1292  {
30bd8b862f5466 Russell King          2018-08-02  1293  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
e7792ce2da5ded Rob Clark             2013-01-08  1294  
30bd8b862f5466 Russell King          2018-08-02  1295  	drm_connector_cleanup(&priv->connector);
30bd8b862f5466 Russell King          2018-08-02  1296  }
e7792ce2da5ded Rob Clark             2013-01-08  1297  
b073a70ecd37bc Russell King          2018-08-02  1298  static enum drm_mode_status tda998x_bridge_mode_valid(struct drm_bridge *bridge,
b073a70ecd37bc Russell King          2018-08-02  1299  				     const struct drm_display_mode *mode)
b073a70ecd37bc Russell King          2018-08-02  1300  {
b073a70ecd37bc Russell King          2018-08-02  1301  	/* TDA19988 dotclock can go up to 165MHz */
b073a70ecd37bc Russell King          2018-08-02  1302  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
b073a70ecd37bc Russell King          2018-08-02  1303  
b073a70ecd37bc Russell King          2018-08-02  1304  	if (mode->clock > ((priv->rev == TDA19988) ? 165000 : 150000))
b073a70ecd37bc Russell King          2018-08-02  1305  		return MODE_CLOCK_HIGH;
b073a70ecd37bc Russell King          2018-08-02  1306  	if (mode->htotal >= BIT(13))
b073a70ecd37bc Russell King          2018-08-02  1307  		return MODE_BAD_HVALUE;
b073a70ecd37bc Russell King          2018-08-02  1308  	if (mode->vtotal >= BIT(11))
b073a70ecd37bc Russell King          2018-08-02  1309  		return MODE_BAD_VVALUE;
b073a70ecd37bc Russell King          2018-08-02  1310  	return MODE_OK;
b073a70ecd37bc Russell King          2018-08-02  1311  }
b073a70ecd37bc Russell King          2018-08-02  1312  
30bd8b862f5466 Russell King          2018-08-02  1313  static void tda998x_bridge_enable(struct drm_bridge *bridge)
e7792ce2da5ded Rob Clark             2013-01-08  1314  {
30bd8b862f5466 Russell King          2018-08-02  1315  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
30bd8b862f5466 Russell King          2018-08-02  1316  
2c6e758332a4fd Peter Rosin           2018-08-02  1317  	if (!priv->is_on) {
c4c11dd160a8cc Russell King          2013-08-14  1318  		/* enable video ports, audio will be enabled later */
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1319  		reg_write(priv, REG_ENA_VP_0, 0xff);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1320  		reg_write(priv, REG_ENA_VP_1, 0xff);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1321  		reg_write(priv, REG_ENA_VP_2, 0xff);
e7792ce2da5ded Rob Clark             2013-01-08  1322  		/* set muxing after enabling ports: */
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1323  		reg_write(priv, REG_VIP_CNTRL_0, priv->vip_cntrl_0);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1324  		reg_write(priv, REG_VIP_CNTRL_1, priv->vip_cntrl_1);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1325  		reg_write(priv, REG_VIP_CNTRL_2, priv->vip_cntrl_2);
3cb43378d83e37 Russell King          2016-10-23  1326  
3cb43378d83e37 Russell King          2016-10-23  1327  		priv->is_on = true;
2c6e758332a4fd Peter Rosin           2018-08-02  1328  	}
2c6e758332a4fd Peter Rosin           2018-08-02  1329  }
2c6e758332a4fd Peter Rosin           2018-08-02  1330  
30bd8b862f5466 Russell King          2018-08-02  1331  static void tda998x_bridge_disable(struct drm_bridge *bridge)
2c6e758332a4fd Peter Rosin           2018-08-02  1332  {
30bd8b862f5466 Russell King          2018-08-02  1333  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
30bd8b862f5466 Russell King          2018-08-02  1334  
2c6e758332a4fd Peter Rosin           2018-08-02  1335  	if (priv->is_on) {
db6aaf4d55f95d Russell King          2013-09-24  1336  		/* disable video ports */
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1337  		reg_write(priv, REG_ENA_VP_0, 0x00);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1338  		reg_write(priv, REG_ENA_VP_1, 0x00);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1339  		reg_write(priv, REG_ENA_VP_2, 0x00);
e7792ce2da5ded Rob Clark             2013-01-08  1340  
3cb43378d83e37 Russell King          2016-10-23  1341  		priv->is_on = false;
3cb43378d83e37 Russell King          2016-10-23  1342  	}
e7792ce2da5ded Rob Clark             2013-01-08  1343  }
e7792ce2da5ded Rob Clark             2013-01-08  1344  
30bd8b862f5466 Russell King          2018-08-02  1345  static void tda998x_bridge_mode_set(struct drm_bridge *bridge,
63f8f3badf799c Laurent Pinchart      2018-04-06  1346  				    const struct drm_display_mode *mode,
63f8f3badf799c Laurent Pinchart      2018-04-06  1347  				    const struct drm_display_mode *adjusted_mode)
e7792ce2da5ded Rob Clark             2013-01-08  1348  {
30bd8b862f5466 Russell King          2018-08-02  1349  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
926a299c42e38b Russell King          2018-08-02  1350  	unsigned long tmds_clock;
e66e03abf80f70 Russell King          2015-06-06  1351  	u16 ref_pix, ref_line, n_pix, n_line;
e66e03abf80f70 Russell King          2015-06-06  1352  	u16 hs_pix_s, hs_pix_e;
e66e03abf80f70 Russell King          2015-06-06  1353  	u16 vs1_pix_s, vs1_pix_e, vs1_line_s, vs1_line_e;
e66e03abf80f70 Russell King          2015-06-06  1354  	u16 vs2_pix_s, vs2_pix_e, vs2_line_s, vs2_line_e;
e66e03abf80f70 Russell King          2015-06-06  1355  	u16 vwin1_line_s, vwin1_line_e;
e66e03abf80f70 Russell King          2015-06-06  1356  	u16 vwin2_line_s, vwin2_line_e;
e66e03abf80f70 Russell King          2015-06-06  1357  	u16 de_pix_s, de_pix_e;
e66e03abf80f70 Russell King          2015-06-06  1358  	u8 reg, div, rep;
e7792ce2da5ded Rob Clark             2013-01-08  1359  
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1360  	/*
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1361  	 * Internally TDA998x is using ITU-R BT.656 style sync but
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1362  	 * we get VESA style sync. TDA998x is using a reference pixel
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1363  	 * relative to ITU to sync to the input frame and for output
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1364  	 * sync generation. Currently, we are using reference detection
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1365  	 * from HS/VS, i.e. REFPIX/REFLINE denote frame start sync point
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1366  	 * which is position of rising VS with coincident rising HS.
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1367  	 *
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1368  	 * Now there is some issues to take care of:
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1369  	 * - HDMI data islands require sync-before-active
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1370  	 * - TDA998x register values must be > 0 to be enabled
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1371  	 * - REFLINE needs an additional offset of +1
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1372  	 * - REFPIX needs an addtional offset of +1 for UYUV and +3 for RGB
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1373  	 *
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1374  	 * So we add +1 to all horizontal and vertical register values,
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1375  	 * plus an additional +3 for REFPIX as we are using RGB input only.
e7792ce2da5ded Rob Clark             2013-01-08  1376  	 */
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1377  	n_pix        = mode->htotal;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1378  	n_line       = mode->vtotal;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1379  
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1380  	hs_pix_e     = mode->hsync_end - mode->hdisplay;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1381  	hs_pix_s     = mode->hsync_start - mode->hdisplay;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1382  	de_pix_e     = mode->htotal;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1383  	de_pix_s     = mode->htotal - mode->hdisplay;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1384  	ref_pix      = 3 + hs_pix_s;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1385  
179f1aa407b466 Sebastian Hesselbarth 2013-08-14  1386  	/*
179f1aa407b466 Sebastian Hesselbarth 2013-08-14  1387  	 * Attached LCD controllers may generate broken sync. Allow
179f1aa407b466 Sebastian Hesselbarth 2013-08-14  1388  	 * those to adjust the position of the rising VS edge by adding
179f1aa407b466 Sebastian Hesselbarth 2013-08-14  1389  	 * HSKEW to ref_pix.
179f1aa407b466 Sebastian Hesselbarth 2013-08-14  1390  	 */
179f1aa407b466 Sebastian Hesselbarth 2013-08-14  1391  	if (adjusted_mode->flags & DRM_MODE_FLAG_HSKEW)
179f1aa407b466 Sebastian Hesselbarth 2013-08-14  1392  		ref_pix += adjusted_mode->hskew;
179f1aa407b466 Sebastian Hesselbarth 2013-08-14  1393  
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1394  	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) == 0) {
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1395  		ref_line     = 1 + mode->vsync_start - mode->vdisplay;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1396  		vwin1_line_s = mode->vtotal - mode->vdisplay - 1;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1397  		vwin1_line_e = vwin1_line_s + mode->vdisplay;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1398  		vs1_pix_s    = vs1_pix_e = hs_pix_s;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1399  		vs1_line_s   = mode->vsync_start - mode->vdisplay;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1400  		vs1_line_e   = vs1_line_s +
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1401  			       mode->vsync_end - mode->vsync_start;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1402  		vwin2_line_s = vwin2_line_e = 0;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1403  		vs2_pix_s    = vs2_pix_e  = 0;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1404  		vs2_line_s   = vs2_line_e = 0;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1405  	} else {
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1406  		ref_line     = 1 + (mode->vsync_start - mode->vdisplay)/2;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1407  		vwin1_line_s = (mode->vtotal - mode->vdisplay)/2;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1408  		vwin1_line_e = vwin1_line_s + mode->vdisplay/2;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1409  		vs1_pix_s    = vs1_pix_e = hs_pix_s;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1410  		vs1_line_s   = (mode->vsync_start - mode->vdisplay)/2;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1411  		vs1_line_e   = vs1_line_s +
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1412  			       (mode->vsync_end - mode->vsync_start)/2;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1413  		vwin2_line_s = vwin1_line_s + mode->vtotal/2;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1414  		vwin2_line_e = vwin2_line_s + mode->vdisplay/2;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1415  		vs2_pix_s    = vs2_pix_e = hs_pix_s + mode->htotal/2;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1416  		vs2_line_s   = vs1_line_s + mode->vtotal/2 ;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1417  		vs2_line_e   = vs2_line_s +
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1418  			       (mode->vsync_end - mode->vsync_start)/2;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1419  	}
e7792ce2da5ded Rob Clark             2013-01-08  1420  
926a299c42e38b Russell King          2018-08-02  1421  	tmds_clock = mode->clock;
926a299c42e38b Russell King          2018-08-02  1422  
926a299c42e38b Russell King          2018-08-02  1423  	/*
926a299c42e38b Russell King          2018-08-02  1424  	 * The divisor is power-of-2. The TDA9983B datasheet gives
926a299c42e38b Russell King          2018-08-02  1425  	 * this as ranges of Msample/s, which is 10x the TMDS clock:
926a299c42e38b Russell King          2018-08-02  1426  	 *   0 - 800 to 1500 Msample/s
926a299c42e38b Russell King          2018-08-02  1427  	 *   1 - 400 to 800 Msample/s
926a299c42e38b Russell King          2018-08-02  1428  	 *   2 - 200 to 400 Msample/s
926a299c42e38b Russell King          2018-08-02  1429  	 *   3 - as 2 above
926a299c42e38b Russell King          2018-08-02  1430  	 */
926a299c42e38b Russell King          2018-08-02  1431  	for (div = 0; div < 3; div++)
926a299c42e38b Russell King          2018-08-02  1432  		if (80000 >> div <= tmds_clock)
926a299c42e38b Russell King          2018-08-02  1433  			break;
e7792ce2da5ded Rob Clark             2013-01-08  1434  
2cae8e028ecb44 Russell King          2016-11-02  1435  	mutex_lock(&priv->audio_mutex);
2cae8e028ecb44 Russell King          2016-11-02  1436  
e7792ce2da5ded Rob Clark             2013-01-08  1437  	/* mute the audio FIFO: */
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1438  	reg_set(priv, REG_AIP_CNTRL_0, AIP_CNTRL_0_RST_FIFO);
e7792ce2da5ded Rob Clark             2013-01-08  1439  
e7792ce2da5ded Rob Clark             2013-01-08  1440  	/* set HDMI HDCP mode off: */
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1441  	reg_write(priv, REG_TBG_CNTRL_1, TBG_CNTRL_1_DWIN_DIS);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1442  	reg_clear(priv, REG_TX33, TX33_HDMI);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1443  	reg_write(priv, REG_ENC_CNTRL, ENC_CNTRL_CTL_CODE(0));
e7792ce2da5ded Rob Clark             2013-01-08  1444  
e7792ce2da5ded Rob Clark             2013-01-08  1445  	/* no pre-filter or interpolator: */
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1446  	reg_write(priv, REG_HVF_CNTRL_0, HVF_CNTRL_0_PREFIL(0) |
e7792ce2da5ded Rob Clark             2013-01-08  1447  			HVF_CNTRL_0_INTPOL(0));
9476ed2e3883b1 Russell King          2016-11-03  1448  	reg_set(priv, REG_FEAT_POWERDOWN, FEAT_POWERDOWN_PREFILT);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1449  	reg_write(priv, REG_VIP_CNTRL_5, VIP_CNTRL_5_SP_CNT(0));
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1450  	reg_write(priv, REG_VIP_CNTRL_4, VIP_CNTRL_4_BLANKIT(0) |
e7792ce2da5ded Rob Clark             2013-01-08  1451  			VIP_CNTRL_4_BLC(0));
e7792ce2da5ded Rob Clark             2013-01-08  1452  
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1453  	reg_clear(priv, REG_PLL_SERIAL_1, PLL_SERIAL_1_SRL_MAN_IZ);
a8b517e5312124 Jean-Francois Moine   2014-01-25  1454  	reg_clear(priv, REG_PLL_SERIAL_3, PLL_SERIAL_3_SRL_CCIR |
a8b517e5312124 Jean-Francois Moine   2014-01-25  1455  					  PLL_SERIAL_3_SRL_DE);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1456  	reg_write(priv, REG_SERIALIZER, 0);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1457  	reg_write(priv, REG_HVF_CNTRL_1, HVF_CNTRL_1_VQR(0));
e7792ce2da5ded Rob Clark             2013-01-08  1458  
e7792ce2da5ded Rob Clark             2013-01-08  1459  	/* TODO enable pixel repeat for pixel rates less than 25Msamp/s */
e7792ce2da5ded Rob Clark             2013-01-08  1460  	rep = 0;
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1461  	reg_write(priv, REG_RPT_CNTRL, 0);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1462  	reg_write(priv, REG_SEL_CLK, SEL_CLK_SEL_VRF_CLK(0) |
e7792ce2da5ded Rob Clark             2013-01-08  1463  			SEL_CLK_SEL_CLK1 | SEL_CLK_ENA_SC_CLK);
e7792ce2da5ded Rob Clark             2013-01-08  1464  
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1465  	reg_write(priv, REG_PLL_SERIAL_2, PLL_SERIAL_2_SRL_NOSC(div) |
e7792ce2da5ded Rob Clark             2013-01-08  1466  			PLL_SERIAL_2_SRL_PR(rep));
e7792ce2da5ded Rob Clark             2013-01-08  1467  
e7792ce2da5ded Rob Clark             2013-01-08  1468  	/* set color matrix bypass flag: */
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1469  	reg_write(priv, REG_MAT_CONTRL, MAT_CONTRL_MAT_BP |
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1470  				MAT_CONTRL_MAT_SC(1));
9476ed2e3883b1 Russell King          2016-11-03  1471  	reg_set(priv, REG_FEAT_POWERDOWN, FEAT_POWERDOWN_CSC);
e7792ce2da5ded Rob Clark             2013-01-08  1472  
e7792ce2da5ded Rob Clark             2013-01-08  1473  	/* set BIAS tmds value: */
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1474  	reg_write(priv, REG_ANA_GENERAL, 0x09);
e7792ce2da5ded Rob Clark             2013-01-08  1475  
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1476  	/*
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1477  	 * Sync on rising HSYNC/VSYNC
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1478  	 */
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1479  	reg = VIP_CNTRL_3_SYNC_HS;
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1480  
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1481  	/*
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1482  	 * TDA19988 requires high-active sync at input stage,
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1483  	 * so invert low-active sync provided by master encoder here
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1484  	 */
088d61d1fdfde5 Sebastian Hesselbarth 2013-08-14  1485  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1486  		reg |= VIP_CNTRL_3_H_TGL;
e7792ce2da5ded Rob Clark             2013-01-08  1487  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1488  		reg |= VIP_CNTRL_3_V_TGL;
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1489  	reg_write(priv, REG_VIP_CNTRL_3, reg);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1490  
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1491  	reg_write(priv, REG_VIDFORMAT, 0x00);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1492  	reg_write16(priv, REG_REFPIX_MSB, ref_pix);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1493  	reg_write16(priv, REG_REFLINE_MSB, ref_line);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1494  	reg_write16(priv, REG_NPIX_MSB, n_pix);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1495  	reg_write16(priv, REG_NLINE_MSB, n_line);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1496  	reg_write16(priv, REG_VS_LINE_STRT_1_MSB, vs1_line_s);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1497  	reg_write16(priv, REG_VS_PIX_STRT_1_MSB, vs1_pix_s);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1498  	reg_write16(priv, REG_VS_LINE_END_1_MSB, vs1_line_e);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1499  	reg_write16(priv, REG_VS_PIX_END_1_MSB, vs1_pix_e);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1500  	reg_write16(priv, REG_VS_LINE_STRT_2_MSB, vs2_line_s);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1501  	reg_write16(priv, REG_VS_PIX_STRT_2_MSB, vs2_pix_s);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1502  	reg_write16(priv, REG_VS_LINE_END_2_MSB, vs2_line_e);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1503  	reg_write16(priv, REG_VS_PIX_END_2_MSB, vs2_pix_e);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1504  	reg_write16(priv, REG_HS_PIX_START_MSB, hs_pix_s);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1505  	reg_write16(priv, REG_HS_PIX_STOP_MSB, hs_pix_e);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1506  	reg_write16(priv, REG_VWIN_START_1_MSB, vwin1_line_s);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1507  	reg_write16(priv, REG_VWIN_END_1_MSB, vwin1_line_e);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1508  	reg_write16(priv, REG_VWIN_START_2_MSB, vwin2_line_s);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1509  	reg_write16(priv, REG_VWIN_END_2_MSB, vwin2_line_e);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1510  	reg_write16(priv, REG_DE_START_MSB, de_pix_s);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1511  	reg_write16(priv, REG_DE_STOP_MSB, de_pix_e);
e7792ce2da5ded Rob Clark             2013-01-08  1512  
e7792ce2da5ded Rob Clark             2013-01-08  1513  	if (priv->rev == TDA19988) {
e7792ce2da5ded Rob Clark             2013-01-08  1514  		/* let incoming pixels fill the active space (if any) */
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1515  		reg_write(priv, REG_ENABLE_SPACE, 0x00);
e7792ce2da5ded Rob Clark             2013-01-08  1516  	}
e7792ce2da5ded Rob Clark             2013-01-08  1517  
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1518  	/*
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1519  	 * Always generate sync polarity relative to input sync and
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1520  	 * revert input stage toggled sync at output stage
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1521  	 */
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1522  	reg = TBG_CNTRL_1_DWIN_DIS | TBG_CNTRL_1_TGL_EN;
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1523  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1524  		reg |= TBG_CNTRL_1_H_TGL;
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1525  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1526  		reg |= TBG_CNTRL_1_V_TGL;
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1527  	reg_write(priv, REG_TBG_CNTRL_1, reg);
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1528  
e7792ce2da5ded Rob Clark             2013-01-08  1529  	/* must be last register set: */
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1530  	reg_write(priv, REG_TBG_CNTRL_0, 0);
c4c11dd160a8cc Russell King          2013-08-14  1531  
319e658c78befa Russell King          2016-10-23  1532  	priv->tmds_clock = adjusted_mode->clock;
319e658c78befa Russell King          2016-10-23  1533  
896a4130b8e60c Russell King          2016-10-23  1534  	/* CEA-861B section 6 says that:
896a4130b8e60c Russell King          2016-10-23  1535  	 * CEA version 1 (CEA-861) has no support for infoframes.
896a4130b8e60c Russell King          2016-10-23  1536  	 * CEA version 2 (CEA-861A) supports version 1 AVI infoframes,
896a4130b8e60c Russell King          2016-10-23  1537  	 * and optional basic audio.
896a4130b8e60c Russell King          2016-10-23  1538  	 * CEA version 3 (CEA-861B) supports version 1 and 2 AVI infoframes,
896a4130b8e60c Russell King          2016-10-23  1539  	 * and optional digital audio, with audio infoframes.
896a4130b8e60c Russell King          2016-10-23  1540  	 *
896a4130b8e60c Russell King          2016-10-23  1541  	 * Since we only support generation of version 2 AVI infoframes,
896a4130b8e60c Russell King          2016-10-23  1542  	 * ignore CEA version 2 and below (iow, behave as if we're a
896a4130b8e60c Russell King          2016-10-23  1543  	 * CEA-861 source.)
896a4130b8e60c Russell King          2016-10-23  1544  	 */
896a4130b8e60c Russell King          2016-10-23  1545  	priv->supports_infoframes = priv->connector.display_info.cea_rev >= 3;
896a4130b8e60c Russell King          2016-10-23  1546  
896a4130b8e60c Russell King          2016-10-23  1547  	if (priv->supports_infoframes) {
c4c11dd160a8cc Russell King          2013-08-14  1548  		/* We need to turn HDMI HDCP stuff on to get audio through */
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1549  		reg &= ~TBG_CNTRL_1_DWIN_DIS;
81b53a166f5cdf Jean-Francois Moine   2014-01-25  1550  		reg_write(priv, REG_TBG_CNTRL_1, reg);
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1551  		reg_write(priv, REG_ENC_CNTRL, ENC_CNTRL_CTL_CODE(1));
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1552  		reg_set(priv, REG_TX33, TX33_HDMI);
c4c11dd160a8cc Russell King          2013-08-14  1553  
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1554  		tda998x_write_avi(priv, adjusted_mode);
c4c11dd160a8cc Russell King          2013-08-14  1555  
8f3f21f63c3625 Russell King          2016-11-02  1556  		if (priv->audio_params.format != AFMT_UNUSED &&
8f3f21f63c3625 Russell King          2016-11-02  1557  		    priv->sink_has_audio)
319e658c78befa Russell King          2016-10-23  1558  			tda998x_configure_audio(priv, &priv->audio_params);
95db3b255fde4e Jyri Sarha            2016-08-09  1559  	}
319e658c78befa Russell King          2016-10-23  1560  
319e658c78befa Russell King          2016-10-23  1561  	mutex_unlock(&priv->audio_mutex);
c4c11dd160a8cc Russell King          2013-08-14  1562  }
e7792ce2da5ded Rob Clark             2013-01-08  1563  
30bd8b862f5466 Russell King          2018-08-02  1564  static const struct drm_bridge_funcs tda998x_bridge_funcs = {
30bd8b862f5466 Russell King          2018-08-02  1565  	.attach = tda998x_bridge_attach,
30bd8b862f5466 Russell King          2018-08-02  1566  	.detach = tda998x_bridge_detach,
b073a70ecd37bc Russell King          2018-08-02  1567  	.mode_valid = tda998x_bridge_mode_valid,
30bd8b862f5466 Russell King          2018-08-02  1568  	.disable = tda998x_bridge_disable,
30bd8b862f5466 Russell King          2018-08-02  1569  	.mode_set = tda998x_bridge_mode_set,
30bd8b862f5466 Russell King          2018-08-02  1570  	.enable = tda998x_bridge_enable,
30bd8b862f5466 Russell King          2018-08-02  1571  };
a8f4d4d63739e4 Russell King          2014-02-07  1572  
e7792ce2da5ded Rob Clark             2013-01-08  1573  /* I2C driver functions */
e7792ce2da5ded Rob Clark             2013-01-08  1574  
7e567624dc5a44 Jyri Sarha            2016-08-09  1575  static int tda998x_get_audio_ports(struct tda998x_priv *priv,
7e567624dc5a44 Jyri Sarha            2016-08-09  1576  				   struct device_node *np)
7e567624dc5a44 Jyri Sarha            2016-08-09  1577  {
7e567624dc5a44 Jyri Sarha            2016-08-09  1578  	const u32 *port_data;
7e567624dc5a44 Jyri Sarha            2016-08-09  1579  	u32 size;
7e567624dc5a44 Jyri Sarha            2016-08-09  1580  	int i;
7e567624dc5a44 Jyri Sarha            2016-08-09  1581  
7e567624dc5a44 Jyri Sarha            2016-08-09  1582  	port_data = of_get_property(np, "audio-ports", &size);
7e567624dc5a44 Jyri Sarha            2016-08-09  1583  	if (!port_data)
7e567624dc5a44 Jyri Sarha            2016-08-09  1584  		return 0;
7e567624dc5a44 Jyri Sarha            2016-08-09  1585  
7e567624dc5a44 Jyri Sarha            2016-08-09  1586  	size /= sizeof(u32);
7e567624dc5a44 Jyri Sarha            2016-08-09  1587  	if (size > 2 * ARRAY_SIZE(priv->audio_port) || size % 2 != 0) {
7e567624dc5a44 Jyri Sarha            2016-08-09  1588  		dev_err(&priv->hdmi->dev,
7e567624dc5a44 Jyri Sarha            2016-08-09  1589  			"Bad number of elements in audio-ports dt-property\n");
7e567624dc5a44 Jyri Sarha            2016-08-09  1590  		return -EINVAL;
7e567624dc5a44 Jyri Sarha            2016-08-09  1591  	}
7e567624dc5a44 Jyri Sarha            2016-08-09  1592  
7e567624dc5a44 Jyri Sarha            2016-08-09  1593  	size /= 2;
7e567624dc5a44 Jyri Sarha            2016-08-09  1594  
7e567624dc5a44 Jyri Sarha            2016-08-09  1595  	for (i = 0; i < size; i++) {
7e567624dc5a44 Jyri Sarha            2016-08-09  1596  		u8 afmt = be32_to_cpup(&port_data[2*i]);
7e567624dc5a44 Jyri Sarha            2016-08-09  1597  		u8 ena_ap = be32_to_cpup(&port_data[2*i+1]);
7e567624dc5a44 Jyri Sarha            2016-08-09  1598  
7e567624dc5a44 Jyri Sarha            2016-08-09  1599  		if (afmt != AFMT_SPDIF && afmt != AFMT_I2S) {
7e567624dc5a44 Jyri Sarha            2016-08-09  1600  			dev_err(&priv->hdmi->dev,
7e567624dc5a44 Jyri Sarha            2016-08-09  1601  				"Bad audio format %u\n", afmt);
7e567624dc5a44 Jyri Sarha            2016-08-09  1602  			return -EINVAL;
7e567624dc5a44 Jyri Sarha            2016-08-09  1603  		}
7e567624dc5a44 Jyri Sarha            2016-08-09  1604  
7e567624dc5a44 Jyri Sarha            2016-08-09  1605  		priv->audio_port[i].format = afmt;
7e567624dc5a44 Jyri Sarha            2016-08-09  1606  		priv->audio_port[i].config = ena_ap;
7e567624dc5a44 Jyri Sarha            2016-08-09  1607  	}
7e567624dc5a44 Jyri Sarha            2016-08-09  1608  
7e567624dc5a44 Jyri Sarha            2016-08-09  1609  	if (priv->audio_port[0].format == priv->audio_port[1].format) {
7e567624dc5a44 Jyri Sarha            2016-08-09  1610  		dev_err(&priv->hdmi->dev,
7e567624dc5a44 Jyri Sarha            2016-08-09  1611  			"There can only be on I2S port and one SPDIF port\n");
7e567624dc5a44 Jyri Sarha            2016-08-09  1612  		return -EINVAL;
7e567624dc5a44 Jyri Sarha            2016-08-09  1613  	}
7e567624dc5a44 Jyri Sarha            2016-08-09  1614  	return 0;
7e567624dc5a44 Jyri Sarha            2016-08-09  1615  }
7e567624dc5a44 Jyri Sarha            2016-08-09  1616  
6c1187aaa2912f Russell King          2018-08-02  1617  static void tda998x_set_config(struct tda998x_priv *priv,
6c1187aaa2912f Russell King          2018-08-02  1618  			       const struct tda998x_encoder_params *p)
e7792ce2da5ded Rob Clark             2013-01-08  1619  {
6c1187aaa2912f Russell King          2018-08-02  1620  	priv->vip_cntrl_0 = VIP_CNTRL_0_SWAP_A(p->swap_a) |
6c1187aaa2912f Russell King          2018-08-02  1621  			    (p->mirr_a ? VIP_CNTRL_0_MIRR_A : 0) |
6c1187aaa2912f Russell King          2018-08-02  1622  			    VIP_CNTRL_0_SWAP_B(p->swap_b) |
6c1187aaa2912f Russell King          2018-08-02  1623  			    (p->mirr_b ? VIP_CNTRL_0_MIRR_B : 0);
6c1187aaa2912f Russell King          2018-08-02  1624  	priv->vip_cntrl_1 = VIP_CNTRL_1_SWAP_C(p->swap_c) |
6c1187aaa2912f Russell King          2018-08-02  1625  			    (p->mirr_c ? VIP_CNTRL_1_MIRR_C : 0) |
6c1187aaa2912f Russell King          2018-08-02  1626  			    VIP_CNTRL_1_SWAP_D(p->swap_d) |
6c1187aaa2912f Russell King          2018-08-02  1627  			    (p->mirr_d ? VIP_CNTRL_1_MIRR_D : 0);
6c1187aaa2912f Russell King          2018-08-02  1628  	priv->vip_cntrl_2 = VIP_CNTRL_2_SWAP_E(p->swap_e) |
6c1187aaa2912f Russell King          2018-08-02  1629  			    (p->mirr_e ? VIP_CNTRL_2_MIRR_E : 0) |
6c1187aaa2912f Russell King          2018-08-02  1630  			    VIP_CNTRL_2_SWAP_F(p->swap_f) |
6c1187aaa2912f Russell King          2018-08-02  1631  			    (p->mirr_f ? VIP_CNTRL_2_MIRR_F : 0);
6c1187aaa2912f Russell King          2018-08-02  1632  
6c1187aaa2912f Russell King          2018-08-02  1633  	priv->audio_params = p->audio_params;
6c1187aaa2912f Russell King          2018-08-02  1634  }
6c1187aaa2912f Russell King          2018-08-02  1635  
76767fdabadbea Russell King          2018-08-02  1636  static void tda998x_destroy(struct device *dev)
76767fdabadbea Russell King          2018-08-02  1637  {
76767fdabadbea Russell King          2018-08-02  1638  	struct tda998x_priv *priv = dev_get_drvdata(dev);
76767fdabadbea Russell King          2018-08-02  1639  
76767fdabadbea Russell King          2018-08-02  1640  	drm_bridge_remove(&priv->bridge);
76767fdabadbea Russell King          2018-08-02  1641  
76767fdabadbea Russell King          2018-08-02  1642  	/* disable all IRQs and free the IRQ handler */
76767fdabadbea Russell King          2018-08-02  1643  	cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
76767fdabadbea Russell King          2018-08-02  1644  	reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
76767fdabadbea Russell King          2018-08-02  1645  
76767fdabadbea Russell King          2018-08-02  1646  	if (priv->audio_pdev)
76767fdabadbea Russell King          2018-08-02  1647  		platform_device_unregister(priv->audio_pdev);
76767fdabadbea Russell King          2018-08-02  1648  
76767fdabadbea Russell King          2018-08-02  1649  	if (priv->hdmi->irq)
76767fdabadbea Russell King          2018-08-02  1650  		free_irq(priv->hdmi->irq, priv);
76767fdabadbea Russell King          2018-08-02  1651  
76767fdabadbea Russell King          2018-08-02  1652  	del_timer_sync(&priv->edid_delay_timer);
76767fdabadbea Russell King          2018-08-02  1653  	cancel_work_sync(&priv->detect_work);
76767fdabadbea Russell King          2018-08-02  1654  
76767fdabadbea Russell King          2018-08-02  1655  	i2c_unregister_device(priv->cec);
76767fdabadbea Russell King          2018-08-02  1656  
76767fdabadbea Russell King          2018-08-02  1657  	if (priv->cec_notify)
f070b4ca123f0c Dariusz Marcinkiewicz 2019-07-01  1658  		cec_notifier_conn_unregister(priv->cec_notify);
76767fdabadbea Russell King          2018-08-02  1659  }
76767fdabadbea Russell King          2018-08-02  1660  
2143adb04b357e Russell King          2018-08-02  1661  static int tda998x_create(struct device *dev)
e7792ce2da5ded Rob Clark             2013-01-08  1662  {
2143adb04b357e Russell King          2018-08-02  1663  	struct i2c_client *client = to_i2c_client(dev);
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1664  	struct device_node *np = client->dev.of_node;
7e8675f000bc7e Russell King          2016-10-05  1665  	struct i2c_board_info cec_info;
2143adb04b357e Russell King          2018-08-02  1666  	struct tda998x_priv *priv;
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1667  	u32 video;
fb7544d7732f78 Russell King          2014-02-02  1668  	int rev_lo, rev_hi, ret;
e7792ce2da5ded Rob Clark             2013-01-08  1669  
2143adb04b357e Russell King          2018-08-02  1670  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
2143adb04b357e Russell King          2018-08-02  1671  	if (!priv)
2143adb04b357e Russell King          2018-08-02  1672  		return -ENOMEM;
2143adb04b357e Russell King          2018-08-02  1673  
2143adb04b357e Russell King          2018-08-02  1674  	dev_set_drvdata(dev, priv);
2143adb04b357e Russell King          2018-08-02  1675  
d93ae190e2c952 Russell King          2016-11-17  1676  	mutex_init(&priv->mutex);	/* protect the page access */
d93ae190e2c952 Russell King          2016-11-17  1677  	mutex_init(&priv->audio_mutex); /* protect access from audio thread */
7e8675f000bc7e Russell King          2016-10-05  1678  	mutex_init(&priv->edid_mutex);
30bd8b862f5466 Russell King          2018-08-02  1679  	INIT_LIST_HEAD(&priv->bridge.list);
d93ae190e2c952 Russell King          2016-11-17  1680  	init_waitqueue_head(&priv->edid_delay_waitq);
d93ae190e2c952 Russell King          2016-11-17  1681  	timer_setup(&priv->edid_delay_timer, tda998x_edid_delay_done, 0);
d93ae190e2c952 Russell King          2016-11-17  1682  	INIT_WORK(&priv->detect_work, tda998x_detect_work);
ba300c1787f793 Russell King          2016-11-17  1683  
5e74c22cd1e0f9 Russell King          2013-08-14  1684  	priv->vip_cntrl_0 = VIP_CNTRL_0_SWAP_A(2) | VIP_CNTRL_0_SWAP_B(3);
5e74c22cd1e0f9 Russell King          2013-08-14  1685  	priv->vip_cntrl_1 = VIP_CNTRL_1_SWAP_C(0) | VIP_CNTRL_1_SWAP_D(1);
5e74c22cd1e0f9 Russell King          2013-08-14  1686  	priv->vip_cntrl_2 = VIP_CNTRL_2_SWAP_E(4) | VIP_CNTRL_2_SWAP_F(5);
5e74c22cd1e0f9 Russell King          2013-08-14  1687  
14e5b5889d7589 Russell King          2016-11-03  1688  	/* CEC I2C address bound to TDA998x I2C addr by configuration pins */
14e5b5889d7589 Russell King          2016-11-03  1689  	priv->cec_addr = 0x34 + (client->addr & 0x03);
2eb4c7b1e7f275 Jean-Francois Moine   2014-01-25  1690  	priv->current_page = 0xff;
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1691  	priv->hdmi = client;
ed9a84262a83ab Jean-Francois Moine   2014-11-29  1692  
e7792ce2da5ded Rob Clark             2013-01-08  1693  	/* wake up the device: */
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1694  	cec_write(priv, REG_CEC_ENAMODS,
e7792ce2da5ded Rob Clark             2013-01-08  1695  			CEC_ENAMODS_EN_RXSENS | CEC_ENAMODS_EN_HDMI);
e7792ce2da5ded Rob Clark             2013-01-08  1696  
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1697  	tda998x_reset(priv);
e7792ce2da5ded Rob Clark             2013-01-08  1698  
e7792ce2da5ded Rob Clark             2013-01-08  1699  	/* read version: */
fb7544d7732f78 Russell King          2014-02-02  1700  	rev_lo = reg_read(priv, REG_VERSION_LSB);
6a765c3fe54973 Russell King          2016-11-17  1701  	if (rev_lo < 0) {
76767fdabadbea Russell King          2018-08-02  1702  		dev_err(dev, "failed to read version: %d\n", rev_lo);
6a765c3fe54973 Russell King          2016-11-17  1703  		return rev_lo;
6a765c3fe54973 Russell King          2016-11-17  1704  	}
6a765c3fe54973 Russell King          2016-11-17  1705  
fb7544d7732f78 Russell King          2014-02-02  1706  	rev_hi = reg_read(priv, REG_VERSION_MSB);
6a765c3fe54973 Russell King          2016-11-17  1707  	if (rev_hi < 0) {
76767fdabadbea Russell King          2018-08-02  1708  		dev_err(dev, "failed to read version: %d\n", rev_hi);
6a765c3fe54973 Russell King          2016-11-17  1709  		return rev_hi;
fb7544d7732f78 Russell King          2014-02-02  1710  	}
fb7544d7732f78 Russell King          2014-02-02  1711  
fb7544d7732f78 Russell King          2014-02-02  1712  	priv->rev = rev_lo | rev_hi << 8;
e7792ce2da5ded Rob Clark             2013-01-08  1713  
e7792ce2da5ded Rob Clark             2013-01-08  1714  	/* mask off feature bits: */
e7792ce2da5ded Rob Clark             2013-01-08  1715  	priv->rev &= ~0x30; /* not-hdcp and not-scalar bit */
e7792ce2da5ded Rob Clark             2013-01-08  1716  
e7792ce2da5ded Rob Clark             2013-01-08  1717  	switch (priv->rev) {
b728fab7026b9d Jean-Francois Moine   2014-01-25  1718  	case TDA9989N2:
76767fdabadbea Russell King          2018-08-02  1719  		dev_info(dev, "found TDA9989 n2");
b728fab7026b9d Jean-Francois Moine   2014-01-25  1720  		break;
b728fab7026b9d Jean-Francois Moine   2014-01-25  1721  	case TDA19989:
76767fdabadbea Russell King          2018-08-02  1722  		dev_info(dev, "found TDA19989");
b728fab7026b9d Jean-Francois Moine   2014-01-25  1723  		break;
b728fab7026b9d Jean-Francois Moine   2014-01-25  1724  	case TDA19989N2:
76767fdabadbea Russell King          2018-08-02  1725  		dev_info(dev, "found TDA19989 n2");
b728fab7026b9d Jean-Francois Moine   2014-01-25  1726  		break;
b728fab7026b9d Jean-Francois Moine   2014-01-25  1727  	case TDA19988:
76767fdabadbea Russell King          2018-08-02  1728  		dev_info(dev, "found TDA19988");
b728fab7026b9d Jean-Francois Moine   2014-01-25  1729  		break;
e7792ce2da5ded Rob Clark             2013-01-08  1730  	default:
76767fdabadbea Russell King          2018-08-02  1731  		dev_err(dev, "found unsupported device: %04x\n", priv->rev);
6a765c3fe54973 Russell King          2016-11-17  1732  		return -ENXIO;
e7792ce2da5ded Rob Clark             2013-01-08  1733  	}
e7792ce2da5ded Rob Clark             2013-01-08  1734  
e7792ce2da5ded Rob Clark             2013-01-08  1735  	/* after reset, enable DDC: */
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1736  	reg_write(priv, REG_DDC_DISABLE, 0x00);
e7792ce2da5ded Rob Clark             2013-01-08  1737  
e7792ce2da5ded Rob Clark             2013-01-08  1738  	/* set clock on DDC channel: */
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1739  	reg_write(priv, REG_TX3, 39);
e7792ce2da5ded Rob Clark             2013-01-08  1740  
e7792ce2da5ded Rob Clark             2013-01-08  1741  	/* if necessary, disable multi-master: */
e7792ce2da5ded Rob Clark             2013-01-08  1742  	if (priv->rev == TDA19989)
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1743  		reg_set(priv, REG_I2C_MASTER, I2C_MASTER_DIS_MM);
e7792ce2da5ded Rob Clark             2013-01-08  1744  
2f7f730a4f0fd3 Jean-Francois Moine   2014-01-25  1745  	cec_write(priv, REG_CEC_FRO_IM_CLK_CTRL,
e7792ce2da5ded Rob Clark             2013-01-08  1746  			CEC_FRO_IM_CLK_CTRL_GHOST_DIS | CEC_FRO_IM_CLK_CTRL_IMCLK_SEL);
e7792ce2da5ded Rob Clark             2013-01-08  1747  
ba8975f15bb93d Russell King          2017-03-11  1748  	/* ensure interrupts are disabled */
ba8975f15bb93d Russell King          2017-03-11  1749  	cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
ba8975f15bb93d Russell King          2017-03-11  1750  
ba8975f15bb93d Russell King          2017-03-11  1751  	/* clear pending interrupts */
ba8975f15bb93d Russell King          2017-03-11  1752  	cec_read(priv, REG_CEC_RXSHPDINT);
ba8975f15bb93d Russell King          2017-03-11  1753  	reg_read(priv, REG_INT_FLAGS_0);
ba8975f15bb93d Russell King          2017-03-11  1754  	reg_read(priv, REG_INT_FLAGS_1);
ba8975f15bb93d Russell King          2017-03-11  1755  	reg_read(priv, REG_INT_FLAGS_2);
ba8975f15bb93d Russell King          2017-03-11  1756  
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1757  	/* initialize the optional IRQ */
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1758  	if (client->irq) {
ae81553c30ef86 Russell King          2016-11-03  1759  		unsigned long irq_flags;
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1760  
6833d26ef823b2 Jean-Francois Moine   2014-11-29  1761  		/* init read EDID waitqueue and HDP work */
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1762  		init_waitqueue_head(&priv->wq_edid);
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1763  
ae81553c30ef86 Russell King          2016-11-03  1764  		irq_flags =
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1765  			irqd_get_trigger_type(irq_get_irq_data(client->irq));
7e8675f000bc7e Russell King          2016-10-05  1766  
7e8675f000bc7e Russell King          2016-10-05  1767  		priv->cec_glue.irq_flags = irq_flags;
7e8675f000bc7e Russell King          2016-10-05  1768  
ae81553c30ef86 Russell King          2016-11-03  1769  		irq_flags |= IRQF_SHARED | IRQF_ONESHOT;
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1770  		ret = request_threaded_irq(client->irq, NULL,
ae81553c30ef86 Russell King          2016-11-03  1771  					   tda998x_irq_thread, irq_flags,
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1772  					   "tda998x", priv);
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1773  		if (ret) {
76767fdabadbea Russell King          2018-08-02  1774  			dev_err(dev, "failed to request IRQ#%u: %d\n",
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1775  				client->irq, ret);
6a765c3fe54973 Russell King          2016-11-17  1776  			goto err_irq;
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1777  		}
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1778  
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1779  		/* enable HPD irq */
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1780  		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1781  	}
12473b7d8e6074 Jean-Francois Moine   2014-01-25  1782  
76767fdabadbea Russell King          2018-08-02  1783  	priv->cec_glue.parent = dev;
7e8675f000bc7e Russell King          2016-10-05  1784  	priv->cec_glue.data = priv;
7e8675f000bc7e Russell King          2016-10-05  1785  	priv->cec_glue.init = tda998x_cec_hook_init;
7e8675f000bc7e Russell King          2016-10-05  1786  	priv->cec_glue.exit = tda998x_cec_hook_exit;
7e8675f000bc7e Russell King          2016-10-05  1787  	priv->cec_glue.open = tda998x_cec_hook_open;
7e8675f000bc7e Russell King          2016-10-05  1788  	priv->cec_glue.release = tda998x_cec_hook_release;
7e8675f000bc7e Russell King          2016-10-05  1789  
7e8675f000bc7e Russell King          2016-10-05  1790  	/*
7e8675f000bc7e Russell King          2016-10-05  1791  	 * Some TDA998x are actually two I2C devices merged onto one piece
7e8675f000bc7e Russell King          2016-10-05  1792  	 * of silicon: TDA9989 and TDA19989 combine the HDMI transmitter
7e8675f000bc7e Russell King          2016-10-05  1793  	 * with a slightly modified TDA9950 CEC device.  The CEC device
7e8675f000bc7e Russell King          2016-10-05  1794  	 * is at the TDA9950 address, with the address pins strapped across
7e8675f000bc7e Russell King          2016-10-05  1795  	 * to the TDA998x address pins.  Hence, it always has the same
7e8675f000bc7e Russell King          2016-10-05  1796  	 * offset.
7e8675f000bc7e Russell King          2016-10-05  1797  	 */
7e8675f000bc7e Russell King          2016-10-05  1798  	memset(&cec_info, 0, sizeof(cec_info));
7e8675f000bc7e Russell King          2016-10-05  1799  	strlcpy(cec_info.type, "tda9950", sizeof(cec_info.type));
7e8675f000bc7e Russell King          2016-10-05  1800  	cec_info.addr = priv->cec_addr;
7e8675f000bc7e Russell King          2016-10-05  1801  	cec_info.platform_data = &priv->cec_glue;
7e8675f000bc7e Russell King          2016-10-05  1802  	cec_info.irq = client->irq;
7e8675f000bc7e Russell King          2016-10-05  1803  
7e8675f000bc7e Russell King          2016-10-05  1804  	priv->cec = i2c_new_device(client->adapter, &cec_info);
101e996b8d3215 Russell King          2016-11-17  1805  	if (!priv->cec) {
101e996b8d3215 Russell King          2016-11-17  1806  		ret = -ENODEV;
101e996b8d3215 Russell King          2016-11-17  1807  		goto fail;
101e996b8d3215 Russell King          2016-11-17  1808  	}
101e996b8d3215 Russell King          2016-11-17  1809  
e47826274e8871 Jean-Francois Moine   2014-01-25  1810  	/* enable EDID read irq: */
e47826274e8871 Jean-Francois Moine   2014-01-25  1811  	reg_set(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
e47826274e8871 Jean-Francois Moine   2014-01-25  1812  
6c1187aaa2912f Russell King          2018-08-02  1813  	if (np) {
7e567624dc5a44 Jyri Sarha            2016-08-09  1814  		/* get the device tree parameters */
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1815  		ret = of_property_read_u32(np, "video-ports", &video);
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1816  		if (ret == 0) {
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1817  			priv->vip_cntrl_0 = video >> 16;
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1818  			priv->vip_cntrl_1 = video >> 8;
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1819  			priv->vip_cntrl_2 = video;
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1820  		}
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1821  
7e567624dc5a44 Jyri Sarha            2016-08-09  1822  		ret = tda998x_get_audio_ports(priv, np);
7e567624dc5a44 Jyri Sarha            2016-08-09  1823  		if (ret)
7e567624dc5a44 Jyri Sarha            2016-08-09  1824  			goto fail;
e7792ce2da5ded Rob Clark             2013-01-08  1825  
7e567624dc5a44 Jyri Sarha            2016-08-09  1826  		if (priv->audio_port[0].format != AFMT_UNUSED)
7e567624dc5a44 Jyri Sarha            2016-08-09  1827  			tda998x_audio_codec_init(priv, &client->dev);
76767fdabadbea Russell King          2018-08-02  1828  	} else if (dev->platform_data) {
76767fdabadbea Russell King          2018-08-02  1829  		tda998x_set_config(priv, dev->platform_data);
6c1187aaa2912f Russell King          2018-08-02  1830  	}
7e567624dc5a44 Jyri Sarha            2016-08-09  1831  
30bd8b862f5466 Russell King          2018-08-02  1832  	priv->bridge.funcs = &tda998x_bridge_funcs;
30bd8b862f5466 Russell King          2018-08-02  1833  #ifdef CONFIG_OF
30bd8b862f5466 Russell King          2018-08-02  1834  	priv->bridge.of_node = dev->of_node;
30bd8b862f5466 Russell King          2018-08-02  1835  #endif
30bd8b862f5466 Russell King          2018-08-02  1836  
30bd8b862f5466 Russell King          2018-08-02  1837  	drm_bridge_add(&priv->bridge);
7e567624dc5a44 Jyri Sarha            2016-08-09  1838  
7e567624dc5a44 Jyri Sarha            2016-08-09  1839  	return 0;
6a765c3fe54973 Russell King          2016-11-17  1840  
e7792ce2da5ded Rob Clark             2013-01-08  1841  fail:
2143adb04b357e Russell King          2018-08-02  1842  	tda998x_destroy(dev);
6a765c3fe54973 Russell King          2016-11-17  1843  err_irq:
6a765c3fe54973 Russell King          2016-11-17  1844  	return ret;
e7792ce2da5ded Rob Clark             2013-01-08  1845  }
e7792ce2da5ded Rob Clark             2013-01-08  1846  
30bd8b862f5466 Russell King          2018-08-02  1847  /* DRM encoder functions */
c707c3619ca81f Russell King          2014-02-07  1848  
c707c3619ca81f Russell King          2014-02-07  1849  static void tda998x_encoder_destroy(struct drm_encoder *encoder)
c707c3619ca81f Russell King          2014-02-07  1850  {
c707c3619ca81f Russell King          2014-02-07  1851  	drm_encoder_cleanup(encoder);
c707c3619ca81f Russell King          2014-02-07  1852  }
c707c3619ca81f Russell King          2014-02-07  1853  
c707c3619ca81f Russell King          2014-02-07  1854  static const struct drm_encoder_funcs tda998x_encoder_funcs = {
c707c3619ca81f Russell King          2014-02-07  1855  	.destroy = tda998x_encoder_destroy,
c707c3619ca81f Russell King          2014-02-07  1856  };
c707c3619ca81f Russell King          2014-02-07  1857  
30bd8b862f5466 Russell King          2018-08-02  1858  static int tda998x_encoder_init(struct device *dev, struct drm_device *drm)
c707c3619ca81f Russell King          2014-02-07  1859  {
30bd8b862f5466 Russell King          2018-08-02  1860  	struct tda998x_priv *priv = dev_get_drvdata(dev);
e66e03abf80f70 Russell King          2015-06-06  1861  	u32 crtcs = 0;
c707c3619ca81f Russell King          2014-02-07  1862  	int ret;
c707c3619ca81f Russell King          2014-02-07  1863  
5dbcf319b28327 Russell King          2014-06-15  1864  	if (dev->of_node)
5dbcf319b28327 Russell King          2014-06-15  1865  		crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
5dbcf319b28327 Russell King          2014-06-15  1866  
5dbcf319b28327 Russell King          2014-06-15  1867  	/* If no CRTCs were found, fall back to our old behaviour */
5dbcf319b28327 Russell King          2014-06-15  1868  	if (crtcs == 0) {
5dbcf319b28327 Russell King          2014-06-15  1869  		dev_warn(dev, "Falling back to first CRTC\n");
5dbcf319b28327 Russell King          2014-06-15  1870  		crtcs = 1 << 0;
5dbcf319b28327 Russell King          2014-06-15  1871  	}
5dbcf319b28327 Russell King          2014-06-15  1872  
a3584f60f4898c Russell King          2015-08-14  1873  	priv->encoder.possible_crtcs = crtcs;
c707c3619ca81f Russell King          2014-02-07  1874  
a3584f60f4898c Russell King          2015-08-14  1875  	ret = drm_encoder_init(drm, &priv->encoder, &tda998x_encoder_funcs,
13a3d91f17a5f7 Ville Syrjälä         2015-12-09  1876  			       DRM_MODE_ENCODER_TMDS, NULL);
c707c3619ca81f Russell King          2014-02-07  1877  	if (ret)
c707c3619ca81f Russell King          2014-02-07  1878  		goto err_encoder;
c707c3619ca81f Russell King          2014-02-07  1879  
30bd8b862f5466 Russell King          2018-08-02  1880  	ret = drm_bridge_attach(&priv->encoder, &priv->bridge, NULL);
c707c3619ca81f Russell King          2014-02-07  1881  	if (ret)
30bd8b862f5466 Russell King          2018-08-02  1882  		goto err_bridge;
c707c3619ca81f Russell King          2014-02-07  1883  
c707c3619ca81f Russell King          2014-02-07  1884  	return 0;
c707c3619ca81f Russell King          2014-02-07  1885  
30bd8b862f5466 Russell King          2018-08-02  1886  err_bridge:
a3584f60f4898c Russell King          2015-08-14  1887  	drm_encoder_cleanup(&priv->encoder);
c707c3619ca81f Russell King          2014-02-07  1888  err_encoder:
c707c3619ca81f Russell King          2014-02-07  1889  	return ret;
c707c3619ca81f Russell King          2014-02-07  1890  }
c707c3619ca81f Russell King          2014-02-07  1891  
30bd8b862f5466 Russell King          2018-08-02  1892  static int tda998x_bind(struct device *dev, struct device *master, void *data)
30bd8b862f5466 Russell King          2018-08-02  1893  {
30bd8b862f5466 Russell King          2018-08-02  1894  	struct drm_device *drm = data;
30bd8b862f5466 Russell King          2018-08-02  1895  
5a03f5346fedc8 Russell King          2018-08-02  1896  	return tda998x_encoder_init(dev, drm);
30bd8b862f5466 Russell King          2018-08-02  1897  }
c707c3619ca81f Russell King          2014-02-07  1898  
c707c3619ca81f Russell King          2014-02-07  1899  static void tda998x_unbind(struct device *dev, struct device *master,
c707c3619ca81f Russell King          2014-02-07  1900  			   void *data)
c707c3619ca81f Russell King          2014-02-07  1901  {
a3584f60f4898c Russell King          2015-08-14  1902  	struct tda998x_priv *priv = dev_get_drvdata(dev);
c707c3619ca81f Russell King          2014-02-07  1903  
a3584f60f4898c Russell King          2015-08-14  1904  	drm_encoder_cleanup(&priv->encoder);
c707c3619ca81f Russell King          2014-02-07  1905  }
c707c3619ca81f Russell King          2014-02-07  1906  
c707c3619ca81f Russell King          2014-02-07  1907  static const struct component_ops tda998x_ops = {
c707c3619ca81f Russell King          2014-02-07  1908  	.bind = tda998x_bind,
c707c3619ca81f Russell King          2014-02-07  1909  	.unbind = tda998x_unbind,
c707c3619ca81f Russell King          2014-02-07  1910  };
c707c3619ca81f Russell King          2014-02-07  1911  
c707c3619ca81f Russell King          2014-02-07  1912  static int
c707c3619ca81f Russell King          2014-02-07  1913  tda998x_probe(struct i2c_client *client, const struct i2c_device_id *id)
c707c3619ca81f Russell King          2014-02-07  1914  {
5a03f5346fedc8 Russell King          2018-08-02  1915  	int ret;
5a03f5346fedc8 Russell King          2018-08-02  1916  
14e5b5889d7589 Russell King          2016-11-03  1917  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
14e5b5889d7589 Russell King          2016-11-03  1918  		dev_warn(&client->dev, "adapter does not support I2C\n");
14e5b5889d7589 Russell King          2016-11-03  1919  		return -EIO;
14e5b5889d7589 Russell King          2016-11-03  1920  	}
5a03f5346fedc8 Russell King          2018-08-02  1921  
5a03f5346fedc8 Russell King          2018-08-02  1922  	ret = tda998x_create(&client->dev);
5a03f5346fedc8 Russell King          2018-08-02  1923  	if (ret)
5a03f5346fedc8 Russell King          2018-08-02  1924  		return ret;
5a03f5346fedc8 Russell King          2018-08-02  1925  
5a03f5346fedc8 Russell King          2018-08-02  1926  	ret = component_add(&client->dev, &tda998x_ops);
5a03f5346fedc8 Russell King          2018-08-02  1927  	if (ret)
5a03f5346fedc8 Russell King          2018-08-02  1928  		tda998x_destroy(&client->dev);
5a03f5346fedc8 Russell King          2018-08-02  1929  	return ret;
c707c3619ca81f Russell King          2014-02-07  1930  }
c707c3619ca81f Russell King          2014-02-07  1931  
c707c3619ca81f Russell King          2014-02-07  1932  static int tda998x_remove(struct i2c_client *client)
c707c3619ca81f Russell King          2014-02-07  1933  {
c707c3619ca81f Russell King          2014-02-07  1934  	component_del(&client->dev, &tda998x_ops);
5a03f5346fedc8 Russell King          2018-08-02  1935  	tda998x_destroy(&client->dev);
c707c3619ca81f Russell King          2014-02-07  1936  	return 0;
c707c3619ca81f Russell King          2014-02-07  1937  }
c707c3619ca81f Russell King          2014-02-07  1938  
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1939  #ifdef CONFIG_OF
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1940  static const struct of_device_id tda998x_dt_ids[] = {
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1941  	{ .compatible = "nxp,tda998x", },
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1942  	{ }
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1943  };
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1944  MODULE_DEVICE_TABLE(of, tda998x_dt_ids);
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1945  #endif
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1946  
b7f08c89a00ab9 Arvind Yadav          2017-08-19  1947  static const struct i2c_device_id tda998x_ids[] = {
e7792ce2da5ded Rob Clark             2013-01-08  1948  	{ "tda998x", 0 },
e7792ce2da5ded Rob Clark             2013-01-08  1949  	{ }
e7792ce2da5ded Rob Clark             2013-01-08  1950  };
e7792ce2da5ded Rob Clark             2013-01-08  1951  MODULE_DEVICE_TABLE(i2c, tda998x_ids);
e7792ce2da5ded Rob Clark             2013-01-08  1952  
3d58e31888318e Russell King          2015-08-14  1953  static struct i2c_driver tda998x_driver = {
e7792ce2da5ded Rob Clark             2013-01-08  1954  	.probe = tda998x_probe,
e7792ce2da5ded Rob Clark             2013-01-08  1955  	.remove = tda998x_remove,
e7792ce2da5ded Rob Clark             2013-01-08  1956  	.driver = {
e7792ce2da5ded Rob Clark             2013-01-08  1957  		.name = "tda998x",
0d44ea190387e2 Jean-Francois Moine   2014-01-25  1958  		.of_match_table = of_match_ptr(tda998x_dt_ids),
e7792ce2da5ded Rob Clark             2013-01-08  1959  	},
e7792ce2da5ded Rob Clark             2013-01-08  1960  	.id_table = tda998x_ids,
e7792ce2da5ded Rob Clark             2013-01-08  1961  };
e7792ce2da5ded Rob Clark             2013-01-08  1962  
3d58e31888318e Russell King          2015-08-14  1963  module_i2c_driver(tda998x_driver);
e7792ce2da5ded Rob Clark             2013-01-08  1964  
e7792ce2da5ded Rob Clark             2013-01-08  1965  MODULE_AUTHOR("Rob Clark <robdclark@gmail.com");
e7792ce2da5ded Rob Clark             2013-01-08  1966  MODULE_DESCRIPTION("NXP Semiconductors TDA998X HDMI Encoder");
e7792ce2da5ded Rob Clark             2013-01-08  1967  MODULE_LICENSE("GPL");

:::::: The code at line 1268 was first introduced by commit
:::::: f070b4ca123f0c4cedefc309ce2739131ca89750 drm: tda998x: use cec_notifier_conn_(un)register

:::::: TO: Dariusz Marcinkiewicz <darekm@google.com>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--sfcq2xd6cuexkjxc
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
WQQA

--sfcq2xd6cuexkjxc--

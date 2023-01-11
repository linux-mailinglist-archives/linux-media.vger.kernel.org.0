Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D01DB665A11
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 12:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbjAKL0C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 06:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232606AbjAKLYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 06:24:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E1017587
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 03:24:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32B8061BB9
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 11:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45178C433F1;
        Wed, 11 Jan 2023 11:24:39 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 16/16] dvb_demux.h: remove write_to_decoder
Date:   Wed, 11 Jan 2023 12:24:18 +0100
Message-Id: <20230111112418.687882-17-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111112418.687882-1-hverkuil-cisco@xs4all.nl>
References: <20230111112418.687882-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This callback was only used by av7110, and that driver has now been
removed, so remove this callback as well.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/b2c2/flexcop.c                        | 1 -
 drivers/media/dvb-core/dvb_demux.c                         | 4 ----
 drivers/media/firewire/firedtv-dvb.c                       | 1 -
 drivers/media/pci/bt8xx/dvb-bt8xx.c                        | 1 -
 drivers/media/pci/mantis/mantis_dvb.c                      | 1 -
 drivers/media/pci/ngene/ngene-dvb.c                        | 1 -
 drivers/media/pci/pt1/pt1.c                                | 1 -
 drivers/media/pci/smipcie/smipcie-main.c                   | 1 -
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.c | 1 -
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c                | 1 -
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c                    | 1 -
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c                    | 1 -
 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c          | 1 -
 drivers/media/usb/ttusb-dec/ttusb_dec.c                    | 1 -
 include/media/dvb_demux.h                                  | 6 ------
 15 files changed, 23 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop.c b/drivers/media/common/b2c2/flexcop.c
index e7a88a2d248c..18a13c4625da 100644
--- a/drivers/media/common/b2c2/flexcop.c
+++ b/drivers/media/common/b2c2/flexcop.c
@@ -71,7 +71,6 @@ static int flexcop_dvb_init(struct flexcop_device *fc)
 	fc->demux.filternum = fc->demux.feednum = FC_MAX_FEED;
 	fc->demux.start_feed = flexcop_dvb_start_feed;
 	fc->demux.stop_feed = flexcop_dvb_stop_feed;
-	fc->demux.write_to_decoder = NULL;
 
 	ret = dvb_dmx_init(&fc->demux);
 	if (ret < 0) {
diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index b380da460295..5c48dcc0f05d 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -379,10 +379,6 @@ static inline void dvb_dmx_swfilter_packet_type(struct dvb_demux_feed *feed,
 				feed->cb.ts(buf, 188, NULL, 0, &feed->feed.ts,
 					    &feed->buffer_flags);
 		}
-		/* Used only on full-featured devices */
-		if (feed->ts_type & TS_DECODER)
-			if (feed->demux->write_to_decoder)
-				feed->demux->write_to_decoder(feed, buf, 188);
 		break;
 
 	case DMX_TYPE_SEC:
diff --git a/drivers/media/firewire/firedtv-dvb.c b/drivers/media/firewire/firedtv-dvb.c
index 3b7e2f1ec98f..91f1345da116 100644
--- a/drivers/media/firewire/firedtv-dvb.c
+++ b/drivers/media/firewire/firedtv-dvb.c
@@ -174,7 +174,6 @@ int fdtv_dvb_register(struct firedtv *fdtv, const char *name)
 	fdtv->demux.feednum	= 16;
 	fdtv->demux.start_feed	= fdtv_start_feed;
 	fdtv->demux.stop_feed	= fdtv_stop_feed;
-	fdtv->demux.write_to_decoder = NULL;
 
 	err = dvb_dmx_init(&fdtv->demux);
 	if (err)
diff --git a/drivers/media/pci/bt8xx/dvb-bt8xx.c b/drivers/media/pci/bt8xx/dvb-bt8xx.c
index 4cb890b949c3..67db20c95aae 100644
--- a/drivers/media/pci/bt8xx/dvb-bt8xx.c
+++ b/drivers/media/pci/bt8xx/dvb-bt8xx.c
@@ -732,7 +732,6 @@ static int dvb_bt8xx_load_card(struct dvb_bt8xx_card *card, u32 type)
 	card->demux.feednum = 256;
 	card->demux.start_feed = dvb_bt8xx_start_feed;
 	card->demux.stop_feed = dvb_bt8xx_stop_feed;
-	card->demux.write_to_decoder = NULL;
 
 	result = dvb_dmx_init(&card->demux);
 	if (result < 0) {
diff --git a/drivers/media/pci/mantis/mantis_dvb.c b/drivers/media/pci/mantis/mantis_dvb.c
index c7ba4a76e608..a92f32ec5c2a 100644
--- a/drivers/media/pci/mantis/mantis_dvb.c
+++ b/drivers/media/pci/mantis/mantis_dvb.c
@@ -161,7 +161,6 @@ int mantis_dvb_init(struct mantis_pci *mantis)
 	mantis->demux.feednum		= 256;
 	mantis->demux.start_feed	= mantis_dvb_start_feed;
 	mantis->demux.stop_feed		= mantis_dvb_stop_feed;
-	mantis->demux.write_to_decoder	= NULL;
 
 	dprintk(MANTIS_DEBUG, 1, "dvb_dmx_init");
 	result = dvb_dmx_init(&mantis->demux);
diff --git a/drivers/media/pci/ngene/ngene-dvb.c b/drivers/media/pci/ngene/ngene-dvb.c
index fda24ba3dc3c..241b14f9684e 100644
--- a/drivers/media/pci/ngene/ngene-dvb.c
+++ b/drivers/media/pci/ngene/ngene-dvb.c
@@ -310,7 +310,6 @@ int my_dvb_dmx_ts_card_init(struct dvb_demux *dvbdemux, char *id,
 	dvbdemux->feednum = 256;
 	dvbdemux->start_feed = start_feed;
 	dvbdemux->stop_feed = stop_feed;
-	dvbdemux->write_to_decoder = NULL;
 	dvbdemux->dmx.capabilities = (DMX_TS_FILTERING |
 				      DMX_SECTION_FILTERING |
 				      DMX_MEMORY_BASED_FILTERING);
diff --git a/drivers/media/pci/pt1/pt1.c b/drivers/media/pci/pt1/pt1.c
index 121a4a92ea10..92d174fe4917 100644
--- a/drivers/media/pci/pt1/pt1.c
+++ b/drivers/media/pci/pt1/pt1.c
@@ -869,7 +869,6 @@ pt1_alloc_adapter(struct pt1 *pt1)
 	demux->filternum = 256;
 	demux->start_feed = pt1_start_feed;
 	demux->stop_feed = pt1_stop_feed;
-	demux->write_to_decoder = NULL;
 	ret = dvb_dmx_init(demux);
 	if (ret < 0)
 		goto err_unregister_adapter;
diff --git a/drivers/media/pci/smipcie/smipcie-main.c b/drivers/media/pci/smipcie/smipcie-main.c
index 0c300d019d9c..a0adec89d7cb 100644
--- a/drivers/media/pci/smipcie/smipcie-main.c
+++ b/drivers/media/pci/smipcie/smipcie-main.c
@@ -739,7 +739,6 @@ static int my_dvb_dmx_ts_card_init(struct dvb_demux *dvbdemux, char *id,
 	dvbdemux->feednum = 256;
 	dvbdemux->start_feed = start_feed;
 	dvbdemux->stop_feed = stop_feed;
-	dvbdemux->write_to_decoder = NULL;
 	dvbdemux->dmx.capabilities = (DMX_TS_FILTERING |
 				      DMX_SECTION_FILTERING |
 				      DMX_MEMORY_BASED_FILTERING);
diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.c
index 5df67da25525..03af243faeff 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.c
@@ -47,7 +47,6 @@ static int register_dvb(struct stdemux *demux, struct dvb_adapter *adap,
 
 	demux->dvb_demux.start_feed = start_feed;
 	demux->dvb_demux.stop_feed = stop_feed;
-	demux->dvb_demux.write_to_decoder = NULL;
 
 	result = dvb_dmx_init(&demux->dvb_demux);
 	if (result < 0) {
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index f1c79f351ec8..b21ff02a591c 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -470,7 +470,6 @@ static int dvb_usbv2_adapter_dvb_init(struct dvb_usb_adapter *adap)
 	adap->demux.feednum          = adap->demux.filternum;
 	adap->demux.start_feed       = dvb_usb_start_feed;
 	adap->demux.stop_feed        = dvb_usb_stop_feed;
-	adap->demux.write_to_decoder = NULL;
 	ret = dvb_dmx_init(&adap->demux);
 	if (ret < 0) {
 		dev_err(&d->udev->dev, "%s: dvb_dmx_init() failed=%d\n",
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
index 0a7f8ba90992..b17f4b06766d 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
@@ -180,7 +180,6 @@ int dvb_usb_adapter_dvb_init(struct dvb_usb_adapter *adap, short *adapter_nums)
 	adap->demux.feednum          = adap->demux.filternum;
 	adap->demux.start_feed       = dvb_usb_start_feed;
 	adap->demux.stop_feed        = dvb_usb_stop_feed;
-	adap->demux.write_to_decoder = NULL;
 	if ((ret = dvb_dmx_init(&adap->demux)) < 0) {
 		err("dvb_dmx_init failed: error %d", ret);
 		goto err_dmx;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
index 26811efe0fb5..930508685c7f 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
@@ -263,7 +263,6 @@ static int pvr2_dvb_adapter_init(struct pvr2_dvb_adapter *adap)
 	adap->demux.feednum          = 256;
 	adap->demux.start_feed       = pvr2_dvb_start_feed;
 	adap->demux.stop_feed        = pvr2_dvb_stop_feed;
-	adap->demux.write_to_decoder = NULL;
 
 	ret = dvb_dmx_init(&adap->demux);
 	if (ret < 0) {
diff --git a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
index 9e016b71aa91..18b483540c9f 100644
--- a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
@@ -1670,7 +1670,6 @@ static int ttusb_probe(struct usb_interface *intf, const struct usb_device_id *i
 	ttusb->dvb_demux.feednum = TTUSB_MAXCHANNEL;
 	ttusb->dvb_demux.start_feed = ttusb_start_feed;
 	ttusb->dvb_demux.stop_feed = ttusb_stop_feed;
-	ttusb->dvb_demux.write_to_decoder = NULL;
 
 	result = dvb_dmx_init(&ttusb->dvb_demux);
 	if (result < 0) {
diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 38822cedd93a..e9d6294ebcc5 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -1476,7 +1476,6 @@ static int ttusb_dec_init_dvb(struct ttusb_dec *dec)
 	dec->demux.feednum = 31;
 	dec->demux.start_feed = ttusb_dec_start_feed;
 	dec->demux.stop_feed = ttusb_dec_stop_feed;
-	dec->demux.write_to_decoder = NULL;
 
 	if ((result = dvb_dmx_init(&dec->demux)) < 0) {
 		printk("%s: dvb_dmx_init failed: error %d\n", __func__,
diff --git a/include/media/dvb_demux.h b/include/media/dvb_demux.h
index 1580de3dbc80..316b637b9f13 100644
--- a/include/media/dvb_demux.h
+++ b/include/media/dvb_demux.h
@@ -170,10 +170,6 @@ struct dvb_demux_feed {
  *			a DVB feed.
  * @stop_feed:		callback routine to be called in order to stop
  *			a DVB feed.
- * @write_to_decoder:	callback routine to be called if the feed is TS and
- *			it is routed to an A/V decoder, when a new TS packet
- *			is received.
- *			Used only on av7110-av.c.
  * @check_crc32:	callback routine to check CRC. If not initialized,
  *			dvb_demux will use an internal one.
  * @memcopy:		callback routine to memcopy received data.
@@ -203,8 +199,6 @@ struct dvb_demux {
 	int feednum;
 	int (*start_feed)(struct dvb_demux_feed *feed);
 	int (*stop_feed)(struct dvb_demux_feed *feed);
-	int (*write_to_decoder)(struct dvb_demux_feed *feed,
-				 const u8 *buf, size_t len);
 	u32 (*check_crc32)(struct dvb_demux_feed *feed,
 			    const u8 *buf, size_t len);
 	void (*memcopy)(struct dvb_demux_feed *feed, u8 *dst,
-- 
2.39.0


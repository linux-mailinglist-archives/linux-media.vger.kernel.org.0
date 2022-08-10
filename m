Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0487F58EB93
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 13:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbiHJLy6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 07:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbiHJLyz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 07:54:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A156F804B2
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 04:54:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1663DB81C0C
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 11:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B2BC433D7;
        Wed, 10 Aug 2022 11:54:48 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Corentin Labbe <clabbe@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/4] zoran: fix checkpatch --strict issues
Date:   Wed, 10 Aug 2022 13:54:42 +0200
Message-Id: <20220810115445.2302477-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810115445.2302477-1-hverkuil-cisco@xs4all.nl>
References: <20220810115445.2302477-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prepare for moving this driver to mainline by fixing the remaining
checkpatch issues.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/zoran/videocodec.c   |   7 +-
 drivers/staging/media/zoran/videocodec.h   | 190 ++++++++++-----------
 drivers/staging/media/zoran/zoran.h        |  30 ++--
 drivers/staging/media/zoran/zoran_card.c   |  49 +++---
 drivers/staging/media/zoran/zoran_card.h   |   9 +-
 drivers/staging/media/zoran/zoran_device.c |  37 ++--
 drivers/staging/media/zoran/zoran_device.h |  44 ++---
 drivers/staging/media/zoran/zoran_driver.c |  57 +------
 drivers/staging/media/zoran/zr36016.c      | 142 +++++++--------
 drivers/staging/media/zoran/zr36050.c      | 182 +++++++++-----------
 drivers/staging/media/zoran/zr36057.h      | 130 +++++++-------
 drivers/staging/media/zoran/zr36060.c      |   7 +-
 drivers/staging/media/zoran/zr36060.h      |  86 +++++-----
 13 files changed, 449 insertions(+), 521 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index a0c8bde5ec11..8efc5e06b0f7 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -92,9 +92,8 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 
 				h->attached += 1;
 				return codec;
-			} else {
-				kfree(codec);
 			}
+			kfree(codec);
 		}
 		h = h->next;
 	}
@@ -255,8 +254,8 @@ int videocodec_debugfs_show(struct seq_file *m)
 	struct codec_list *h = codeclist_top;
 	struct attached_list *a;
 
-	seq_printf(m, "<S>lave or attached <M>aster name  type flags    magic    ");
-	seq_printf(m, "(connected as)\n");
+	seq_puts(m, "<S>lave or attached <M>aster name  type flags    magic    ");
+	seq_puts(m, "(connected as)\n");
 
 	while (h) {
 		seq_printf(m, "S %32s %04x %08lx %08lx (TEMPLATE)\n",
diff --git a/drivers/staging/media/zoran/videocodec.h b/drivers/staging/media/zoran/videocodec.h
index 5e6057edd339..6b69f69667f9 100644
--- a/drivers/staging/media/zoran/videocodec.h
+++ b/drivers/staging/media/zoran/videocodec.h
@@ -12,109 +12,109 @@
 /* general description */
 /* =================== */
 
-/* Should ease the (re-)usage of drivers supporting cards with (different)
-   video codecs. The codecs register to this module their functionality,
-   and the processors (masters) can attach to them if they fit.
-
-   The codecs are typically have a "strong" binding to their master - so I
-   don't think it makes sense to have a full blown interfacing as with e.g.
-   i2c. If you have an other opinion, let's discuss & implement it :-)))
-
-   Usage:
-
-   The slave has just to setup the videocodec structure and use two functions:
-   videocodec_register(codecdata);
-   videocodec_unregister(codecdata);
-   The best is just calling them at module (de-)initialisation.
-
-   The master sets up the structure videocodec_master and calls:
-   codecdata=videocodec_attach(master_codecdata);
-   videocodec_detach(codecdata);
-
-   The slave is called during attach/detach via functions setup previously
-   during register. At that time, the master_data pointer is set up
-   and the slave can access any io registers of the master device (in the case
-   the slave is bound to it). Otherwise it doesn't need this functions and
-   therfor they may not be initialized.
-
-   The other functions are just for convenience, as they are for sure used by
-   most/all of the codecs. The last ones may be omitted, too.
-
-   See the structure declaration below for more information and which data has
-   to be set up for the master and the slave.
-
-   ----------------------------------------------------------------------------
-   The master should have "knowledge" of the slave and vice versa.  So the data
-   structures sent to/from slave via set_data/get_data set_image/get_image are
-   device dependent and vary between MJPEG/MPEG/WAVELET/... devices. (!!!!)
-   ----------------------------------------------------------------------------
-*/
+/*
+ * Should ease the (re-)usage of drivers supporting cards with (different)
+ * video codecs. The codecs register to this module their functionality,
+ * and the processors (masters) can attach to them if they fit.
+ *
+ * The codecs are typically have a "strong" binding to their master - so I
+ * don't think it makes sense to have a full blown interfacing as with e.g.
+ * i2c. If you have an other opinion, let's discuss & implement it :-)))
+ *
+ * Usage:
+ *
+ * The slave has just to setup the videocodec structure and use two functions:
+ * videocodec_register(codecdata);
+ * videocodec_unregister(codecdata);
+ * The best is just calling them at module (de-)initialisation.
+ *
+ * The master sets up the structure videocodec_master and calls:
+ * codecdata=videocodec_attach(master_codecdata);
+ * videocodec_detach(codecdata);
+ *
+ * The slave is called during attach/detach via functions setup previously
+ * during register. At that time, the master_data pointer is set up
+ * and the slave can access any io registers of the master device (in the case
+ * the slave is bound to it). Otherwise it doesn't need this functions and
+ * therefor they may not be initialized.
+ *
+ * The other functions are just for convenience, as they are for sure used by
+ * most/all of the codecs. The last ones may be omitted, too.
+ *
+ * See the structure declaration below for more information and which data has
+ * to be set up for the master and the slave.
+ *
+ * ----------------------------------------------------------------------------
+ * The master should have "knowledge" of the slave and vice versa.  So the data
+ * structures sent to/from slave via set_data/get_data set_image/get_image are
+ * device dependent and vary between MJPEG/MPEG/WAVELET/... devices. (!!!!)
+ * ----------------------------------------------------------------------------
+ */
 
 /* ========================================== */
 /* description of the videocodec_io structure */
 /* ========================================== */
 
 /*
-   ==== master setup ====
-   name -> name of the device structure for reference and debugging
-   master_data ->  data ref. for the master (e.g. the zr36055,57,67)
-   readreg -> ref. to read-fn from register (setup by master, used by slave)
-   writereg -> ref. to write-fn to register (setup by master, used by slave)
-	       this two functions do the lowlevel I/O job
-
-   ==== slave functionality setup ====
-   slave_data -> data ref. for the slave (e.g. the zr36050,60)
-   check -> fn-ref. checks availability of an device, returns -EIO on failure or
-	    the type on success
-	    this makes espcecially sense if a driver module supports more than
-	    one codec which may be quite similar to access, nevertheless it
-	    is good for a first functionality check
-
-   -- main functions you always need for compression/decompression --
-
-   set_mode -> this fn-ref. resets the entire codec, and sets up the mode
-	       with the last defined norm/size (or device default if not
-	       available) - it returns 0 if the mode is possible
-   set_size -> this fn-ref. sets the norm and image size for
-	       compression/decompression (returns 0 on success)
-	       the norm param is defined in videodev2.h (V4L2_STD_*)
-
-   additional setup may be available, too - but the codec should work with
-   some default values even without this
-
-   set_data -> sets device-specific data (tables, quality etc.)
-   get_data -> query device-specific data (tables, quality etc.)
-
-   if the device delivers interrupts, they may be setup/handled here
-   setup_interrupt -> codec irq setup (not needed for 36050/60)
-   handle_interrupt -> codec irq handling (not needed for 36050/60)
-
-   if the device delivers pictures, they may be handled here
-   put_image -> puts image data to the codec (not needed for 36050/60)
-   get_image -> gets image data from the codec (not needed for 36050/60)
-		the calls include frame numbers and flags (even/odd/...)
-		if needed and a flag which allows blocking until its ready
-*/
+ * ==== master setup ====
+ * name -> name of the device structure for reference and debugging
+ * master_data ->  data ref. for the master (e.g. the zr36055,57,67)
+ * readreg -> ref. to read-fn from register (setup by master, used by slave)
+ * writereg -> ref. to write-fn to register (setup by master, used by slave)
+ *	       this two functions do the lowlevel I/O job
+ *
+ * ==== slave functionality setup ====
+ * slave_data -> data ref. for the slave (e.g. the zr36050,60)
+ * check -> fn-ref. checks availability of an device, returns -EIO on failure or
+ *	    the type on success
+ *	    this makes espcecially sense if a driver module supports more than
+ *	    one codec which may be quite similar to access, nevertheless it
+ *	    is good for a first functionality check
+ *
+ * -- main functions you always need for compression/decompression --
+ *
+ * set_mode -> this fn-ref. resets the entire codec, and sets up the mode
+ *	       with the last defined norm/size (or device default if not
+ *	       available) - it returns 0 if the mode is possible
+ * set_size -> this fn-ref. sets the norm and image size for
+ *	       compression/decompression (returns 0 on success)
+ *	       the norm param is defined in videodev2.h (V4L2_STD_*)
+ *
+ * additional setup may be available, too - but the codec should work with
+ * some default values even without this
+ *
+ * set_data -> sets device-specific data (tables, quality etc.)
+ * get_data -> query device-specific data (tables, quality etc.)
+ *
+ * if the device delivers interrupts, they may be setup/handled here
+ * setup_interrupt -> codec irq setup (not needed for 36050/60)
+ * handle_interrupt -> codec irq handling (not needed for 36050/60)
+
+ * if the device delivers pictures, they may be handled here
+ * put_image -> puts image data to the codec (not needed for 36050/60)
+ * get_image -> gets image data from the codec (not needed for 36050/60)
+ *		the calls include frame numbers and flags (even/odd/...)
+ *		if needed and a flag which allows blocking until its ready
+ */
 
 /* ============== */
 /* user interface */
 /* ============== */
 
 /*
-   Currently there is only a information display planned, as the layer
-   is not visible for the user space at all.
-
-   Information is available via procfs. The current entry is "/proc/videocodecs"
-   but it makes sense to "hide" it in the /proc/video tree of v4l(2) --TODO--.
-
-A example for such an output is:
-
-<S>lave or attached <M>aster name  type flags    magic    (connected as)
-S                          zr36050 0002 0000d001 00000000 (TEMPLATE)
-M                       zr36055[0] 0001 0000c001 00000000 (zr36050[0])
-M                       zr36055[1] 0001 0000c001 00000000 (zr36050[1])
-
-*/
+ * Currently there is only a information display planned, as the layer
+ * is not visible for the user space at all.
+ *
+ * Information is available via procfs. The current entry is "/proc/videocodecs"
+ * but it makes sense to "hide" it in the /proc/video tree of v4l(2) --TODO--.
+ *
+ * A example for such an output is:
+ *
+ * <S>lave or attached <M>aster name  type flags    magic    (connected as)
+ * S                          zr36050 0002 0000d001 00000000 (TEMPLATE)
+ * M                       zr36055[0] 0001 0000c001 00000000 (zr36050[0])
+ * M                       zr36055[1] 0001 0000c001 00000000 (zr36050[1])
+ */
 
 /* =============================================== */
 /* special defines for the videocodec_io structure */
@@ -293,15 +293,15 @@ struct videocodec_master {
 // * master structure needs to be kmalloc'ed before calling attach
 //   and free'd after calling detach
 // * returns pointer on success, NULL on failure
-extern struct videocodec *videocodec_attach(struct videocodec_master *);
+struct videocodec *videocodec_attach(struct videocodec_master *master);
 // * 0 on success, <0 (errno) on failure
-extern int videocodec_detach(struct videocodec *);
+int videocodec_detach(struct videocodec *codec);
 
 /* register and unregister commands for the slaves */
 // * 0 on success, <0 (errno) on failure
-extern int videocodec_register(const struct videocodec *);
+int videocodec_register(const struct videocodec *codec);
 // * 0 on success, <0 (errno) on failure
-extern int videocodec_unregister(const struct videocodec *);
+int videocodec_unregister(const struct videocodec *codec);
 
 /* the other calls are directly done via the videocodec structure! */
 
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 05227e5298f6..56340553b282 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -140,11 +140,16 @@ struct zoran_v4l_settings {
 
 /* jpg-capture/-playback settings */
 struct zoran_jpg_settings {
-	int decimation;		/* this bit is used to set everything to default */
-	int hor_dcm, ver_dcm, tmp_dcm;	/* capture decimation settings (tmp_dcm=1 means both fields) */
-	int field_per_buff, odd_even;	/* field-settings (odd_even=1 (+tmp_dcm=1) means top-field-first) */
-	int img_x, img_y, img_width, img_height;	/* crop settings (subframe capture) */
-	struct v4l2_jpegcompression jpg_comp;	/* JPEG-specific capture settings */
+	/* this bit is used to set everything to default */
+	int decimation;
+	/* capture decimation settings (tmp_dcm=1 means both fields) */
+	int hor_dcm, ver_dcm, tmp_dcm;
+	/* field-settings (odd_even=1 (+tmp_dcm=1) means top-field-first) */
+	int field_per_buff, odd_even;
+	/* crop settings (subframe capture) */
+	int img_x, img_y, img_width, img_height;
+	/* JPEG-specific capture settings */
+	struct v4l2_jpegcompression jpg_comp;
 };
 
 struct zoran;
@@ -248,7 +253,8 @@ struct zoran {
 	unsigned long vbseq;
 
 	/* zr36057's code buffer table */
-	__le32 *stat_com;		/* stat_com[i] is indexed by dma_head/tail & BUZ_MASK_STAT_COM */
+	/* stat_com[i] is indexed by dma_head/tail & BUZ_MASK_STAT_COM */
+	__le32 *stat_com;
 
 	/* Additional stuff for testing */
 	unsigned int ghost_int;
@@ -292,14 +298,16 @@ static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
 	return container_of(v4l2_dev, struct zoran, v4l2_dev);
 }
 
-/* There was something called _ALPHA_BUZ that used the PCI address instead of
- * the kernel iomapped address for btread/btwrite.  */
+/*
+ * There was something called _ALPHA_BUZ that used the PCI address instead of
+ * the kernel iomapped address for btread/btwrite.
+ */
 #define btwrite(dat, adr)    writel((dat), zr->zr36057_mem + (adr))
 #define btread(adr)         readl(zr->zr36057_mem + (adr))
 
-#define btand(dat, adr)      btwrite((dat) & btread(adr), adr)
-#define btor(dat, adr)       btwrite((dat) | btread(adr), adr)
-#define btaor(dat, mask, adr) btwrite((dat) | ((mask) & btread(adr)), adr)
+#define btand(dat, adr)      btwrite((dat) & btread(adr), (adr))
+#define btor(dat, adr)       btwrite((dat) | btread(adr), (adr))
+#define btaor(dat, mask, adr) btwrite((dat) | ((mask) & btread(adr)), (adr))
 
 #endif
 
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 26f978a1cc72..869aabde3bef 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -172,8 +172,6 @@ void zr36016_write(struct videocodec *codec, u16 reg, u32 val)
 
 static void dc10_init(struct zoran *zr)
 {
-	pci_dbg(zr->pci_dev, "%s\n", __func__);
-
 	/* Pixel clock selection */
 	GPIO(zr, 4, 0);
 	GPIO(zr, 5, 1);
@@ -183,13 +181,10 @@ static void dc10_init(struct zoran *zr)
 
 static void dc10plus_init(struct zoran *zr)
 {
-	pci_dbg(zr->pci_dev, "%s\n", __func__);
 }
 
 static void buz_init(struct zoran *zr)
 {
-	pci_dbg(zr->pci_dev, "%s\n", __func__);
-
 	/* some stuff from Iomega */
 	pci_write_config_dword(zr->pci_dev, 0xfc, 0x90680f15);
 	pci_write_config_dword(zr->pci_dev, 0x0c, 0x00012020);
@@ -198,8 +193,6 @@ static void buz_init(struct zoran *zr)
 
 static void lml33_init(struct zoran *zr)
 {
-	pci_dbg(zr->pci_dev, "%s\n", __func__);
-
 	GPIO(zr, 2, 1);		// Set Composite input/output
 }
 
@@ -334,10 +327,6 @@ static void videocodec_exit(struct zoran *zr)
 		codec_exit(zr, zr->card.video_vfe);
 }
 
-// struct tvnorm {
-//      u16 wt, wa, h_start, h_sync_start, ht, ha, v_start;
-// };
-
 static const struct tvnorm f50sqpixel = { 944, 768, 83, 880, 625, 576, 16 };
 static const struct tvnorm f60sqpixel = { 780, 640, 51, 716, 525, 480, 12 };
 static const struct tvnorm f50ccir601 = { 864, 720, 75, 804, 625, 576, 18 };
@@ -619,7 +608,10 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 	}, {
 		.type = AVS6EYES,
 		.name = "6-Eyes",
-/* AverMedia chose not to brand the 6-Eyes. Thus it can't be autodetected, and requires card=x. */
+		/*
+		 * AverMedia chose not to brand the 6-Eyes. Thus it can't be
+		 * autodetected, and requires card=x.
+		 */
 		.i2c_decoder = "ks0127",
 		.addrs_decoder = ks0127_addrs,
 		.i2c_encoder = "bt866",
@@ -764,7 +756,9 @@ int zoran_check_jpg_settings(struct zoran *zr,
 	case 4:
 
 		if (zr->card.type == DC10_NEW) {
-			pci_dbg(zr->pci_dev, "%s - HDec by 4 is not supported on the DC10\n", __func__);
+			pci_dbg(zr->pci_dev,
+				"%s - HDec by 4 is not supported on the DC10\n",
+				__func__);
 			err0++;
 			break;
 		}
@@ -1019,7 +1013,9 @@ static int zr36057_init(struct zoran *zr)
 		zr->timing = zr->card.tvn[ZR_NORM_SECAM];
 	}
 	if (!zr->timing) {
-		pci_warn(zr->pci_dev, "%s - default TV standard not supported by hardware. PAL will be used.\n", __func__);
+		pci_warn(zr->pci_dev,
+			 "%s - default TV standard not supported by hardware. PAL will be used.\n",
+			 __func__);
 		zr->norm = V4L2_STD_PAL;
 		zr->timing = zr->card.tvn[ZR_NORM_PAL];
 	}
@@ -1038,9 +1034,9 @@ static int zr36057_init(struct zoran *zr)
 	zr->stat_com = dma_alloc_coherent(&zr->pci_dev->dev,
 					  BUZ_NUM_STAT_COM * sizeof(u32),
 					  &zr->p_sc, GFP_KERNEL);
-	if (!zr->stat_com) {
+	if (!zr->stat_com)
 		return -ENOMEM;
-	}
+
 	for (j = 0; j < BUZ_NUM_STAT_COM; j++)
 		zr->stat_com[j] = cpu_to_le32(1); /* mark as unavailable to zr36057 */
 
@@ -1066,9 +1062,11 @@ static int zr36057_init(struct zoran *zr)
 	return 0;
 
 exit_statcomb:
-	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2, zr->stat_comb, zr->p_scb);
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2,
+			  zr->stat_comb, zr->p_scb);
 exit_statcom:
-	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32),
+			  zr->stat_com, zr->p_sc);
 	return err;
 }
 
@@ -1099,8 +1097,10 @@ static void zoran_remove(struct pci_dev *pdev)
 	btwrite(0, ZR36057_SPGPPCR);
 	pci_free_irq(zr->pci_dev, 0, zr);
 	/* unmap and free memory */
-	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
-	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2, zr->stat_comb, zr->p_scb);
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32),
+			  zr->stat_com, zr->p_sc);
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2,
+			  zr->stat_comb, zr->p_scb);
 	pci_release_regions(pdev);
 	pci_disable_device(zr->pci_dev);
 	zoran_exit_video_devices(zr);
@@ -1299,7 +1299,8 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			pci_err(pdev, "Unknown card, try specifying card=X module parameter\n");
 			goto zr_unreg;
 		}
-		pci_info(zr->pci_dev, "%s() - card %s detected\n", __func__, zoran_cards[card_num].name);
+		pci_info(zr->pci_dev, "%s() - card %s detected\n", __func__,
+			 zoran_cards[card_num].name);
 	} else {
 		card_num = card[nr];
 		if (card_num >= NUM_CARDS || card_num < 0) {
@@ -1324,7 +1325,8 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto zr_unreg;
 
-	zr->zr36057_mem = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
+	zr->zr36057_mem = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0),
+				       pci_resource_len(pdev, 0));
 	if (!zr->zr36057_mem) {
 		pci_err(pdev, "%s() - ioremap failed\n", __func__);
 		goto zr_pci_release;
@@ -1348,7 +1350,8 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			     &latency);
 	need_latency = zr->revision > 1 ? 32 : 48;
 	if (latency != need_latency) {
-		pci_info(zr->pci_dev, "Changing PCI latency from %d to %d\n", latency, need_latency);
+		pci_info(zr->pci_dev, "Changing PCI latency from %d to %d\n",
+			 latency, need_latency);
 		pci_write_config_byte(zr->pci_dev, PCI_LATENCY_TIMER, need_latency);
 	}
 
diff --git a/drivers/staging/media/zoran/zoran_card.h b/drivers/staging/media/zoran/zoran_card.h
index 8e0d634cb30f..518cb426b446 100644
--- a/drivers/staging/media/zoran/zoran_card.h
+++ b/drivers/staging/media/zoran/zoran_card.h
@@ -19,11 +19,10 @@ extern int zr36067_debug;
 
 extern const struct video_device zoran_template;
 
-extern int zoran_check_jpg_settings(struct zoran *zr,
-				    struct zoran_jpg_settings *settings,
-				    int try);
-extern void zoran_open_init_params(struct zoran *zr);
-extern void zoran_vdev_release(struct video_device *vdev);
+int zoran_check_jpg_settings(struct zoran *zr,
+			     struct zoran_jpg_settings *settings, int try);
+void zoran_open_init_params(struct zoran *zr);
+void zoran_vdev_release(struct video_device *vdev);
 
 void zr36016_write(struct videocodec *codec, u16 reg, u32 val);
 
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 2470889a58fa..31f049b55529 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -50,7 +50,6 @@ static bool lml33dpath;		/* default = 0
 module_param(lml33dpath, bool, 0644);
 MODULE_PARM_DESC(lml33dpath, "Use digital path capture mode (on LML33 cards)");
 
-int zr_set_buf(struct zoran *zr);
 /*
  * initialize video front end
  */
@@ -108,7 +107,6 @@ int post_office_wait(struct zoran *zr)
 {
 	u32 por;
 
-//      while (((por = btread(ZR36057_POR)) & (ZR36057_POR_PO_PEN | ZR36057_POR_PO_TIME)) == ZR36057_POR_PO_PEN) {
 	while ((por = btread(ZR36057_POR)) & ZR36057_POR_PO_PEN) {
 		/* wait for something to happen */
 		/* TODO add timeout */
@@ -155,10 +153,12 @@ void jpeg_codec_sleep(struct zoran *zr, int sleep)
 {
 	GPIO(zr, zr->card.gpio[ZR_GPIO_JPEG_SLEEP], !sleep);
 	if (!sleep) {
-		pci_dbg(zr->pci_dev, "%s() - wake GPIO=0x%08x\n", __func__, btread(ZR36057_GPPGCR1));
-		udelay(500);
+		pci_dbg(zr->pci_dev, "%s() - wake GPIO=0x%08x\n",
+			__func__, btread(ZR36057_GPPGCR1));
+		usleep_range(500, 1000);
 	} else {
-		pci_dbg(zr->pci_dev, "%s() - sleep GPIO=0x%08x\n", __func__, btread(ZR36057_GPPGCR1));
+		pci_dbg(zr->pci_dev, "%s() - sleep GPIO=0x%08x\n",
+			__func__, btread(ZR36057_GPPGCR1));
 		udelay(2);
 	}
 }
@@ -284,7 +284,8 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	vcrop1 = (tvn->ha / 2 - he) / 2;
 	vcrop2 = tvn->ha / 2 - he - vcrop1;
 	v_start = tvn->v_start;
-	v_end = v_start + tvn->ha / 2;	// - 1; FIXME SnapShot times out with -1 in 768*576 on the DC10 - LP
+	// FIXME SnapShot times out with -1 in 768*576 on the DC10 - LP
+	v_end = v_start + tvn->ha / 2;	// - 1;
 	v_start += vcrop1;
 	v_end -= vcrop2;
 	reg = ((v_start & ZR36057_VFEVCR_VMASK) << ZR36057_VFEVCR_V_START)
@@ -298,10 +299,12 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	reg |= (hor_dcm << ZR36057_VFESPFR_HOR_DCM);
 	reg |= (ver_dcm << ZR36057_VFESPFR_VER_DCM);
 	reg |= (disp_mode << ZR36057_VFESPFR_DISP_MODE);
-	/* RJ: I don't know, why the following has to be the opposite
+	/*
+	 * RJ: I don't know, why the following has to be the opposite
 	 * of the corresponding ZR36060 setting, but only this way
-	 * we get the correct colors when uncompressing to the screen  */
-	//reg |= ZR36057_VFESPFR_VCLK_POL; /**/
+	 * we get the correct colors when uncompressing to the screen
+	 */
+	//reg |= ZR36057_VFESPFR_VCLK_POL;
 	/* RJ: Don't know if that is needed for NTSC also */
 	if (!(zr->norm & V4L2_STD_NTSC))
 		reg |= ZR36057_VFESPFR_EXT_FL;	// NEEDED!!!!!!! Wolfgang
@@ -342,7 +345,7 @@ void zr36057_set_memgrab(struct zoran *zr, int mode)
 		 * will be stuck at 1 until capturing is turned back on.
 		 */
 		if (btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_SNAP_SHOT)
-			pci_warn(zr->pci_dev, "zr36057_set_memgrab(1) with SnapShot on!?\n");
+			pci_warn(zr->pci_dev, "%s(1) with SnapShot on!?\n", __func__);
 
 		/* switch on VSync interrupts */
 		btwrite(IRQ_MASK, ZR36057_ISR);	// Clear Interrupts
@@ -595,11 +598,9 @@ void jpeg_start(struct zoran *zr)
 
 	/* enable the Go generation */
 	btor(ZR36057_JMC_GO_EN, ZR36057_JMC);
-	udelay(30);
+	usleep_range(30, 100);
 
 	set_frame(zr, 1);	// /FRAME
-
-	pci_dbg(zr->pci_dev, "jpeg_start\n");
 }
 
 void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
@@ -803,8 +804,10 @@ static void zoran_reap_stat_com(struct zoran *zr)
 	unsigned int size = 0;
 	u32 fcnt;
 
-	/* In motion decompress we don't have a hardware frame counter,
-	 * we just count the interrupts here */
+	/*
+	 * In motion decompress we don't have a hardware frame counter,
+	 * we just count the interrupts here
+	 */
 
 	if (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS)
 		zr->jpg_seq_num++;
@@ -938,9 +941,9 @@ void zoran_init_hardware(struct zoran *zr)
 void zr36057_restart(struct zoran *zr)
 {
 	btwrite(0, ZR36057_SPGPPCR);
-	udelay(1000);
+	usleep_range(1000, 2000);
 	btor(ZR36057_SPGPPCR_SOFT_RESET, ZR36057_SPGPPCR);
-	udelay(1000);
+	usleep_range(1000, 2000);
 
 	/* assert P_Reset */
 	btwrite(0, ZR36057_JPC);
diff --git a/drivers/staging/media/zoran/zoran_device.h b/drivers/staging/media/zoran/zoran_device.h
index 322b04c55d41..34fd5cc914eb 100644
--- a/drivers/staging/media/zoran/zoran_device.h
+++ b/drivers/staging/media/zoran/zoran_device.h
@@ -13,37 +13,37 @@
 #define __ZORAN_DEVICE_H__
 
 /* general purpose I/O */
-extern void GPIO(struct zoran *zr, int bit, unsigned int value);
+void GPIO(struct zoran *zr, int bit, unsigned int value);
 
 /* codec (or actually: guest bus) access */
-extern int post_office_wait(struct zoran *zr);
-extern int post_office_write(struct zoran *zr, unsigned int guest, unsigned int reg, unsigned int value);
-extern int post_office_read(struct zoran *zr, unsigned int guest, unsigned int reg);
+int post_office_wait(struct zoran *zr);
+int post_office_write(struct zoran *zr, unsigned int guest, unsigned int reg,
+		      unsigned int value);
+int post_office_read(struct zoran *zr, unsigned int guest, unsigned int reg);
 
-extern void jpeg_codec_sleep(struct zoran *zr, int sleep);
-extern int jpeg_codec_reset(struct zoran *zr);
+void jpeg_codec_sleep(struct zoran *zr, int sleep);
+int jpeg_codec_reset(struct zoran *zr);
 
 /* zr360x7 access to raw capture */
-extern void zr36057_overlay(struct zoran *zr, int on);
-extern void write_overlay_mask(struct zoran_fh *fh, struct v4l2_clip *vp, int count);
-extern void zr36057_set_memgrab(struct zoran *zr, int mode);
-extern int wait_grab_pending(struct zoran *zr);
+void zr36057_overlay(struct zoran *zr, int on);
+void write_overlay_mask(struct zoran_fh *fh, struct v4l2_clip *vp, int count);
+void zr36057_set_memgrab(struct zoran *zr, int mode);
+int wait_grab_pending(struct zoran *zr);
 
 /* interrupts */
-extern void print_interrupts(struct zoran *zr);
-extern void clear_interrupt_counters(struct zoran *zr);
-extern irqreturn_t zoran_irq(int irq, void *dev_id);
+void print_interrupts(struct zoran *zr);
+void clear_interrupt_counters(struct zoran *zr);
+irqreturn_t zoran_irq(int irq, void *dev_id);
 
 /* JPEG codec access */
-extern void jpeg_start(struct zoran *zr);
-extern void zr36057_enable_jpg(struct zoran *zr,
-			       enum zoran_codec_mode mode);
-extern void zoran_feed_stat_com(struct zoran *zr);
+void jpeg_start(struct zoran *zr);
+void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode);
+void zoran_feed_stat_com(struct zoran *zr);
 
 /* general */
-extern void zoran_set_pci_master(struct zoran *zr, int set_master);
-extern void zoran_init_hardware(struct zoran *zr);
-extern void zr36057_restart(struct zoran *zr);
+void zoran_set_pci_master(struct zoran *zr, int set_master);
+void zoran_init_hardware(struct zoran *zr);
+void zr36057_restart(struct zoran *zr);
 
 extern const struct zoran_format zoran_formats[];
 
@@ -53,8 +53,8 @@ extern int pass_through;
 
 /* i2c */
 #define decoder_call(zr, o, f, args...) \
-	v4l2_subdev_call(zr->decoder, o, f, ##args)
+	v4l2_subdev_call((zr)->decoder, o, f, ##args)
 #define encoder_call(zr, o, f, args...) \
-	v4l2_subdev_call(zr->encoder, o, f, ##args)
+	v4l2_subdev_call((zr)->encoder, o, f, ##args)
 
 #endif				/* __ZORAN_DEVICE_H__ */
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 4304b7e21709..212b6d1f16c9 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -203,7 +203,6 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 
 static int zoran_set_norm(struct zoran *zr, v4l2_std_id norm)
 {
-
 	if (!(norm & zr->card.norms)) {
 		pci_dbg(zr->pci_dev, "%s - unsupported norm %llx\n", __func__, norm);
 		return -EINVAL;
@@ -287,17 +286,6 @@ static int zoran_enum_fmt_vid_cap(struct file *file, void *__fh,
 	return zoran_enum_fmt(zr, f, ZORAN_FORMAT_CAPTURE);
 }
 
-#if 0
-/* TODO: output does not work yet */
-static int zoran_enum_fmt_vid_out(struct file *file, void *__fh,
-				  struct v4l2_fmtdesc *f)
-{
-	struct zoran *zr = video_drvdata(file);
-
-	return zoran_enum_fmt(zr, f, ZORAN_FORMAT_PLAYBACK);
-}
-#endif
-
 static int zoran_g_fmt_vid_out(struct file *file, void *__fh,
 			       struct v4l2_format *fmt)
 {
@@ -430,8 +418,10 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
 		fmt->fmt.pix.field = V4L2_FIELD_TOP;
 
 	bpp = DIV_ROUND_UP(zoran_formats[i].depth, 8);
-	v4l_bound_align_image(&fmt->fmt.pix.width, BUZ_MIN_WIDTH, BUZ_MAX_WIDTH, bpp == 2 ? 1 : 2,
-		&fmt->fmt.pix.height, BUZ_MIN_HEIGHT, BUZ_MAX_HEIGHT, 0, 0);
+	v4l_bound_align_image(&fmt->fmt.pix.width, BUZ_MIN_WIDTH, BUZ_MAX_WIDTH,
+			      bpp == 2 ? 1 : 2,
+			      &fmt->fmt.pix.height, BUZ_MIN_HEIGHT, BUZ_MAX_HEIGHT,
+			      0, 0);
 	fmt->fmt.pix.bytesperline = fmt->fmt.pix.width * bpp;
 	fmt->fmt.pix.sizeimage = fmt->fmt.pix.bytesperline * fmt->fmt.pix.height;
 	return 0;
@@ -627,38 +617,6 @@ static int zoran_s_input(struct file *file, void *__fh, unsigned int input)
 	return res;
 }
 
-#if 0
-/* TODO: output does not work yet */
-static int zoran_enum_output(struct file *file, void *__fh,
-			     struct v4l2_output *outp)
-{
-	if (outp->index != 0)
-		return -EINVAL;
-
-	outp->index = 0;
-	outp->type = V4L2_OUTPUT_TYPE_ANALOGVGAOVERLAY;
-	outp->std = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
-	outp->capabilities = V4L2_OUT_CAP_STD;
-	strscpy(outp->name, "Autodetect", sizeof(outp->name));
-
-	return 0;
-}
-static int zoran_g_output(struct file *file, void *__fh, unsigned int *output)
-{
-	*output = 0;
-
-	return 0;
-}
-
-static int zoran_s_output(struct file *file, void *__fh, unsigned int output)
-{
-	if (output != 0)
-		return -EINVAL;
-
-	return 0;
-}
-#endif
-
 /* cropping (sub-frame capture) */
 static int zoran_g_selection(struct file *file, void *__fh, struct v4l2_selection *sel)
 {
@@ -746,9 +704,6 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_enum_input		    = zoran_enum_input,
 	.vidioc_g_input			    = zoran_g_input,
 	.vidioc_s_input			    = zoran_s_input,
-/*	.vidioc_enum_output		    = zoran_enum_output,
-	.vidioc_g_output		    = zoran_g_output,
-	.vidioc_s_output		    = zoran_s_output,*/
 	.vidioc_g_std			    = zoran_g_std,
 	.vidioc_s_std			    = zoran_s_std,
 	.vidioc_create_bufs		    = vb2_ioctl_create_bufs,
@@ -760,13 +715,9 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_streamon		    = vb2_ioctl_streamon,
 	.vidioc_streamoff		    = vb2_ioctl_streamoff,
 	.vidioc_enum_fmt_vid_cap	    = zoran_enum_fmt_vid_cap,
-/*	.vidioc_enum_fmt_vid_out	    = zoran_enum_fmt_vid_out,*/
 	.vidioc_g_fmt_vid_cap		    = zoran_g_fmt_vid_cap,
-/*	.vidioc_g_fmt_vid_out               = zoran_g_fmt_vid_out,*/
 	.vidioc_s_fmt_vid_cap		    = zoran_s_fmt_vid_cap,
-/*	.vidioc_s_fmt_vid_out               = zoran_s_fmt_vid_out,*/
 	.vidioc_try_fmt_vid_cap		    = zoran_try_fmt_vid_cap,
-/*	.vidioc_try_fmt_vid_out		    = zoran_try_fmt_vid_out,*/
 	.vidioc_subscribe_event             = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event           = v4l2_event_unsubscribe,
 };
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 0e0532537a3e..4b328ad6083f 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -15,18 +15,19 @@
 /* codec io API */
 #include "videocodec.h"
 
-/* it doesn't make sense to have more than 20 or so,
-  just to prevent some unwanted loops */
+/*
+ * it doesn't make sense to have more than 20 or so,
+ * just to prevent some unwanted loops
+ */
 #define MAX_CODECS 20
 
 /* amount of chips attached via this driver */
 static int zr36016_codecs;
 
-/* =========================================================================
-   Local hardware I/O functions:
-
-   read/write via codec layer (registers are located in the master device)
-   ========================================================================= */
+/*
+ * Local hardware I/O functions: read/write via codec layer
+ * (registers are located in the master device)
+ */
 
 /* read and write functions */
 static u8 zr36016_read(struct zr36016 *ptr, u16 reg)
@@ -58,9 +59,12 @@ static void zr36016_write(struct zr36016 *ptr, u16 reg, u8 value)
 		zrdev_err(zr, "%s: invalid I/O setup, nothing written!\n", ptr->name);
 }
 
-/* indirect read and write functions */
-/* the 016 supports auto-addr-increment, but
- * writing it all time cost not much and is safer... */
+/*
+ * indirect read and write functions
+ *
+ * the 016 supports auto-addr-increment, but
+ * writing it all time cost not much and is safer...
+ */
 static u8 zr36016_readi(struct zr36016 *ptr, u16 reg)
 {
 	u8 value = 0;
@@ -68,8 +72,8 @@ static u8 zr36016_readi(struct zr36016 *ptr, u16 reg)
 
 	/* just in case something is wrong... */
 	if ((ptr->codec->master_data->writereg) && (ptr->codec->master_data->readreg)) {
-		ptr->codec->master_data->writereg(ptr->codec, ZR016_IADDR, reg & 0x0F);	// ADDR
-		value = (ptr->codec->master_data->readreg(ptr->codec, ZR016_IDATA)) & 0xFF;	// DATA
+		ptr->codec->master_data->writereg(ptr->codec, ZR016_IADDR, reg & 0x0F);
+		value = (ptr->codec->master_data->readreg(ptr->codec, ZR016_IDATA)) & 0xFF;
 	} else {
 		zrdev_err(zr, "%s: invalid I/O setup, nothing read (i)!\n", ptr->name);
 	}
@@ -88,18 +92,14 @@ static void zr36016_writei(struct zr36016 *ptr, u16 reg, u8 value)
 
 	/* just in case something is wrong... */
 	if (ptr->codec->master_data->writereg) {
-		ptr->codec->master_data->writereg(ptr->codec, ZR016_IADDR, reg & 0x0F);	// ADDR
-		ptr->codec->master_data->writereg(ptr->codec, ZR016_IDATA, value & 0x0FF);	// DATA
+		ptr->codec->master_data->writereg(ptr->codec, ZR016_IADDR, reg & 0x0F);
+		ptr->codec->master_data->writereg(ptr->codec, ZR016_IDATA, value & 0x0FF);
 	} else {
 		zrdev_err(zr, "%s: invalid I/O setup, nothing written (i)!\n", ptr->name);
 	}
 }
 
-/* =========================================================================
-   Local helper function:
-
-   version read
-   ========================================================================= */
+/* Local helper function: version read */
 
 /* version kept in datastructure */
 static u8 zr36016_read_version(struct zr36016 *ptr)
@@ -108,11 +108,10 @@ static u8 zr36016_read_version(struct zr36016 *ptr)
 	return ptr->version;
 }
 
-/* =========================================================================
-   Local helper function:
-
-   basic test of "connectivity", writes/reads to/from PAX-Lo register
-   ========================================================================= */
+/*
+ * Local helper function: basic test of "connectivity", writes/reads
+ * to/from PAX-Lo register
+ */
 
 static int zr36016_basic_test(struct zr36016 *ptr)
 {
@@ -150,36 +149,7 @@ static int zr36016_basic_test(struct zr36016 *ptr)
 	return 0;		/* looks good! */
 }
 
-/* =========================================================================
-   Local helper function:
-
-   simple loop for pushing the init datasets - NO USE --
-   ========================================================================= */
-
-#if 0
-static int zr36016_pushit(struct zr36016 *ptr,
-			  u16             startreg,
-			   u16             len,
-			   const char     *data)
-{
-	struct zoran *zr = videocodec_to_zoran(ptr->codec);
-	int i = 0;
-
-	zrdev_dbg(zr, "%s: write data block to 0x%04x (len=%d)\n",
-		  ptr->name, startreg, len);
-	while (i < len) {
-		zr36016_writei(ptr, startreg++,  data[i++]);
-	}
-
-	return i;
-}
-#endif
-
-/* =========================================================================
-   Basic datasets & init:
-
-   //TODO//
-   ========================================================================= */
+/* Basic datasets & init */
 
 static void zr36016_init(struct zr36016 *ptr)
 {
@@ -213,14 +183,16 @@ static void zr36016_init(struct zr36016 *ptr)
 	zr36016_write(ptr, ZR016_GOSTOP, 1);
 }
 
-/* =========================================================================
-   CODEC API FUNCTIONS
-
-   this functions are accessed by the master via the API structure
-   ========================================================================= */
+/*
+ * CODEC API FUNCTIONS
+ *
+ * These functions are accessed by the master via the API structure
+ */
 
-/* set compression/expansion mode and launches codec -
-   this should be the last call from the master before starting processing */
+/*
+ * set compression/expansion mode and launches codec -
+ * this should be the last call from the master before starting processing
+ */
 static int zr36016_set_mode(struct videocodec *codec, int mode)
 {
 	struct zr36016 *ptr = (struct zr36016 *)codec->data;
@@ -249,22 +221,28 @@ static int zr36016_set_video(struct videocodec *codec, const struct tvnorm *norm
 		  cap->x, cap->y, cap->width, cap->height,
 		  cap->decimation);
 
-	/* if () return -EINVAL;
+	/*
+	 * if () return -EINVAL;
 	 * trust the master driver that it knows what it does - so
-	 * we allow invalid startx/y for now ... */
+	 * we allow invalid startx/y for now ...
+	 */
 	ptr->width = cap->width;
 	ptr->height = cap->height;
-	/* (Ronald) This is ugly. zoran_device.c, line 387
+	/*
+	 * (Ronald) This is ugly. zoran_device.c, line 387
 	 * already mentions what happens if h_start is even
 	 * (blue faces, etc., cr/cb inversed). There's probably
 	 * some good reason why h_start is 0 instead of 1, so I'm
 	 * leaving it to this for now, but really... This can be
-	 * done a lot simpler */
+	 * done a lot simpler
+	 */
 	ptr->xoff = (norm->h_start ? norm->h_start : 1) + cap->x;
-	/* Something to note here (I don't understand it), setting
+	/*
+	 * Something to note here (I don't understand it), setting
 	 * v_start too high will cause the codec to 'not work'. I
 	 * really don't get it. values of 16 (v_start) already break
-	 * it here. Just '0' seems to work. More testing needed! */
+	 * it here. Just '0' seems to work. More testing needed!
+	 */
 	ptr->yoff = norm->v_start + cap->y;
 	/* (Ronald) dzjeeh, can't this thing do hor_decimation = 4? */
 	ptr->xdec = ((cap->decimation & 0xff) == 1) ? 0 : 1;
@@ -319,11 +297,11 @@ static int zr36016_control(struct videocodec *codec, int type, int size, void *d
 	return size;
 }
 
-/* =========================================================================
-   Exit and unregister function:
-
-   Deinitializes Zoran's JPEG processor
-   ========================================================================= */
+/*
+ * Exit and unregister function:
+ *
+ * Deinitializes Zoran's JPEG processor
+ */
 
 static int zr36016_unset(struct videocodec *codec)
 {
@@ -344,14 +322,14 @@ static int zr36016_unset(struct videocodec *codec)
 	return -EFAULT;
 }
 
-/* =========================================================================
-   Setup and registry function:
-
-   Initializes Zoran's JPEG processor
-
-   Also sets pixel size, average code size, mode (compr./decompr.)
-   (the given size is determined by the processor with the video interface)
-   ========================================================================= */
+/*
+ * Setup and registry function:
+ *
+ * Initializes Zoran's JPEG processor
+ *
+ * Also sets pixel size, average code size, mode (compr./decompr.)
+ * (the given size is determined by the processor with the video interface)
+ */
 
 static int zr36016_setup(struct videocodec *codec)
 {
@@ -410,9 +388,7 @@ static const struct videocodec zr36016_codec = {
 	/* others are not used */
 };
 
-/* =========================================================================
-   HOOK IN DRIVER AS KERNEL MODULE
-   ========================================================================= */
+/* HOOK IN DRIVER AS KERNEL MODULE */
 
 int zr36016_init_module(void)
 {
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 6a7ef28d996c..b07d7e5c1b4a 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -22,18 +22,20 @@
 /* codec io API */
 #include "videocodec.h"
 
-/* it doesn't make sense to have more than 20 or so,
-  just to prevent some unwanted loops */
+/*
+ * it doesn't make sense to have more than 20 or so,
+ * just to prevent some unwanted loops
+ */
 #define MAX_CODECS 20
 
 /* amount of chips attached via this driver */
 static int zr36050_codecs;
 
-/* =========================================================================
-   Local hardware I/O functions:
-
-   read/write via codec layer (registers are located in the master device)
-   ========================================================================= */
+/*
+ * Local hardware I/O functions:
+ *
+ * read/write via codec layer (registers are located in the master device)
+ */
 
 /* read and write functions */
 static u8 zr36050_read(struct zr36050 *ptr, u16 reg)
@@ -66,12 +68,6 @@ static void zr36050_write(struct zr36050 *ptr, u16 reg, u8 value)
 			  ptr->name);
 }
 
-/* =========================================================================
-   Local helper function:
-
-   status read
-   ========================================================================= */
-
 /* status is kept in datastructure */
 static u8 zr36050_read_status1(struct zr36050 *ptr)
 {
@@ -81,12 +77,6 @@ static u8 zr36050_read_status1(struct zr36050 *ptr)
 	return ptr->status1;
 }
 
-/* =========================================================================
-   Local helper function:
-
-   scale factor read
-   ========================================================================= */
-
 /* scale factor is kept in datastructure */
 static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
 {
@@ -98,11 +88,11 @@ static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
 	return ptr->scalefact;
 }
 
-/* =========================================================================
-   Local helper function:
-
-   wait if codec is ready to proceed (end of processing) or time is over
-   ========================================================================= */
+/*
+ * Local helper function:
+ *
+ * wait if codec is ready to proceed (end of processing) or time is over
+ */
 
 static void zr36050_wait_end(struct zr36050 *ptr)
 {
@@ -120,11 +110,10 @@ static void zr36050_wait_end(struct zr36050 *ptr)
 	}
 }
 
-/* =========================================================================
-   Local helper function:
-
-   basic test of "connectivity", writes/reads to/from memory the SOF marker
-   ========================================================================= */
+/*
+ * Local helper function: basic test of "connectivity", writes/reads
+ * to/from memory the SOF marker
+ */
 
 static int zr36050_basic_test(struct zr36050 *ptr)
 {
@@ -160,11 +149,7 @@ static int zr36050_basic_test(struct zr36050 *ptr)
 	return 0;		/* looks good! */
 }
 
-/* =========================================================================
-   Local helper function:
-
-   simple loop for pushing the init datasets
-   ========================================================================= */
+/* Local helper function: simple loop for pushing the init datasets */
 
 static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char *data)
 {
@@ -179,16 +164,16 @@ static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char
 	return i;
 }
 
-/* =========================================================================
-   Basic datasets:
-
-   jpeg baseline setup data (you find it on lots places in internet, or just
-   extract it from any regular .jpg image...)
-
-   Could be variable, but until it's not needed it they are just fixed to save
-   memory. Otherwise expand zr36050 structure with arrays, push the values to
-   it and initialize from there, as e.g. the linux zr36057/60 driver does it.
-   ========================================================================= */
+/*
+ * Basic datasets:
+ *
+ * jpeg baseline setup data (you find it on lots places in internet, or just
+ * extract it from any regular .jpg image...)
+ *
+ * Could be variable, but until it's not needed it they are just fixed to save
+ * memory. Otherwise expand zr36050 structure with arrays, push the values to
+ * it and initialize from there, as e.g. the linux zr36057/60 driver does it.
+ */
 
 static const char zr36050_dqt[0x86] = {
 	0xff, 0xdb,		//Marker: DQT
@@ -281,18 +266,19 @@ static const char zr36050_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
 static const char zr36050_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
-/* =========================================================================
-   Local helper functions:
-
-   calculation and setup of parameter-dependent JPEG baseline segments
-   (needed for compression only)
-   ========================================================================= */
+/*
+ * Local helper functions:
+ *
+ * calculation and setup of parameter-dependent JPEG baseline segments
+ * (needed for compression only)
+ */
 
 /* ------------------------------------------------------------------------- */
 
-/* SOF (start of frame) segment depends on width, height and sampling ratio
-			 of each color component */
-
+/*
+ * SOF (start of frame) segment depends on width, height and sampling ratio
+ * of each color component
+ */
 static int zr36050_set_sof(struct zr36050 *ptr)
 {
 	struct zoran *zr = videocodec_to_zoran(ptr->codec);
@@ -313,7 +299,8 @@ static int zr36050_set_sof(struct zr36050 *ptr)
 	sof_data[9] = NO_OF_COMPONENTS;
 	for (i = 0; i < NO_OF_COMPONENTS; i++) {
 		sof_data[10 + (i * 3)] = i;	// index identifier
-		sof_data[11 + (i * 3)] = (ptr->h_samp_ratio[i] << 4) | (ptr->v_samp_ratio[i]);	// sampling ratios
+		sof_data[11 + (i * 3)] = (ptr->h_samp_ratio[i] << 4) |
+					 (ptr->v_samp_ratio[i]);	// sampling ratios
 		sof_data[12 + (i * 3)] = zr36050_tq[i];	// Q table selection
 	}
 	return zr36050_pushit(ptr, ZR050_SOF_IDX,
@@ -322,8 +309,10 @@ static int zr36050_set_sof(struct zr36050 *ptr)
 
 /* ------------------------------------------------------------------------- */
 
-/* SOS (start of scan) segment depends on the used scan components
-			of each color component */
+/*
+ * SOS (start of scan) segment depends on the used scan components
+ * of each color component
+ */
 
 static int zr36050_set_sos(struct zr36050 *ptr)
 {
@@ -368,14 +357,14 @@ static int zr36050_set_dri(struct zr36050 *ptr)
 	return zr36050_pushit(ptr, ZR050_DRI_IDX, 6, dri_data);
 }
 
-/* =========================================================================
-   Setup function:
-
-   Setup compression/decompression of Zoran's JPEG processor
-   ( see also zoran 36050 manual )
-
-   ... sorry for the spaghetti code ...
-   ========================================================================= */
+/*
+ * Setup function:
+ *
+ * Setup compression/decompression of Zoran's JPEG processor
+ * ( see also zoran 36050 manual )
+ *
+ * ... sorry for the spaghetti code ...
+ */
 static void zr36050_init(struct zr36050 *ptr)
 {
 	int sum = 0;
@@ -411,8 +400,10 @@ static void zr36050_init(struct zr36050 *ptr)
 		sum += zr36050_set_sos(ptr);
 		sum += zr36050_set_dri(ptr);
 
-		/* setup the fixed jpeg tables - maybe variable, though -
-		 * (see table init section above) */
+		/*
+		 * setup the fixed jpeg tables - maybe variable, though -
+		 * (see table init section above)
+		 */
 		zrdev_dbg(zr, "%s: write DQT, DHT, APP\n", ptr->name);
 		sum += zr36050_pushit(ptr, ZR050_DQT_IDX,
 				      sizeof(zr36050_dqt), zr36050_dqt);
@@ -522,14 +513,16 @@ static void zr36050_init(struct zr36050 *ptr)
 	zr36050_read(ptr, 0);
 }
 
-/* =========================================================================
-   CODEC API FUNCTIONS
-
-   this functions are accessed by the master via the API structure
-   ========================================================================= */
+/*
+ * CODEC API FUNCTIONS
+ *
+ * this functions are accessed by the master via the API structure
+ */
 
-/* set compression/expansion mode and launches codec -
-   this should be the last call from the master before starting processing */
+/*
+ * set compression/expansion mode and launches codec -
+ * this should be the last call from the master before starting processing
+ */
 static int zr36050_set_mode(struct videocodec *codec, int mode)
 {
 	struct zr36050 *ptr = (struct zr36050 *)codec->data;
@@ -558,9 +551,10 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 		  ptr->name, norm->h_start, norm->v_start,
 		  cap->x, cap->y, cap->width, cap->height,
 		  cap->decimation, cap->quality);
-	/* if () return -EINVAL;
+	/*
 	 * trust the master driver that it knows what it does - so
-	 * we allow invalid startx/y and norm for now ... */
+	 * we allow invalid startx/y and norm for now ...
+	 */
 	ptr->width = cap->width / (cap->decimation & 0xff);
 	ptr->height = cap->height / ((cap->decimation >> 8) & 0xff);
 
@@ -579,8 +573,10 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 
 	ptr->real_code_vol = size >> 3; /* in bytes */
 
-	/* Set max_block_vol here (previously in zr36050_init, moved
- * here for consistency with zr36060 code */
+	/*
+	 * Set max_block_vol here (previously in zr36050_init, moved
+	 * here for consistency with zr36060 code
+	 */
 	zr36050_write(ptr, ZR050_MBCV, ptr->max_block_vol);
 
 	return 0;
@@ -637,8 +633,6 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
 		if (size != sizeof(int))
 			return -EFAULT;
 		ptr->total_code_vol = *ival;
-		/* (Kieran Morrissey)
-		 * code copied from zr36060.c to ensure proper bitrate */
 		ptr->real_code_vol = (ptr->total_code_vol * 6) >> 3;
 		break;
 
@@ -701,11 +695,7 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
 	return size;
 }
 
-/* =========================================================================
-   Exit and unregister function:
-
-   Deinitializes Zoran's JPEG processor
-   ========================================================================= */
+/* Exit and unregister function: Deinitializes Zoran's JPEG processor */
 
 static int zr36050_unset(struct videocodec *codec)
 {
@@ -727,14 +717,14 @@ static int zr36050_unset(struct videocodec *codec)
 	return -EFAULT;
 }
 
-/* =========================================================================
-   Setup and registry function:
-
-   Initializes Zoran's JPEG processor
-
-   Also sets pixel size, average code size, mode (compr./decompr.)
-   (the given size is determined by the processor with the video interface)
-   ========================================================================= */
+/*
+ * Setup and registry function:
+ *
+ * Initializes Zoran's JPEG processor
+ *
+ * Also sets pixel size, average code size, mode (compr./decompr.)
+ * (the given size is determined by the processor with the video interface)
+ */
 
 static int zr36050_setup(struct videocodec *codec)
 {
@@ -771,8 +761,8 @@ static int zr36050_setup(struct videocodec *codec)
 	memcpy(ptr->h_samp_ratio, zr36050_decimation_h, 8);
 	memcpy(ptr->v_samp_ratio, zr36050_decimation_v, 8);
 
-	ptr->bitrate_ctrl = 0;	/* 0 or 1 - fixed file size flag
-				 * (what is the difference?) */
+	/* 0 or 1 - fixed file size flag (what is the difference?) */
+	ptr->bitrate_ctrl = 0;
 	ptr->mode = CODEC_DO_COMPRESSION;
 	ptr->width = 384;
 	ptr->height = 288;
@@ -809,9 +799,7 @@ static const struct videocodec zr36050_codec = {
 	// others are not used
 };
 
-/* =========================================================================
-   HOOK IN DRIVER AS KERNEL MODULE
-   ========================================================================= */
+/* HOOK IN DRIVER AS KERNEL MODULE */
 
 int zr36050_init_module(void)
 {
diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index a2a75fd9f535..45d8afc62b37 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -11,117 +11,117 @@
 /* Zoran ZR36057 registers */
 
 #define ZR36057_VFEHCR          0x000	/* Video Front End, Horizontal Configuration Register */
-#define ZR36057_VFEHCR_HS_POL             BIT(30)
-#define ZR36057_VFEHCR_H_START           10
+#define ZR36057_VFEHCR_HS_POL           BIT(30)
+#define ZR36057_VFEHCR_H_START          10
 #define ZR36057_VFEHCR_H_END		0
 #define ZR36057_VFEHCR_HMASK		0x3ff
 
 #define ZR36057_VFEVCR          0x004	/* Video Front End, Vertical Configuration Register */
-#define ZR36057_VFEVCR_VS_POL             BIT(30)
-#define ZR36057_VFEVCR_V_START           10
+#define ZR36057_VFEVCR_VS_POL           BIT(30)
+#define ZR36057_VFEVCR_V_START          10
 #define ZR36057_VFEVCR_V_END		0
 #define ZR36057_VFEVCR_VMASK		0x3ff
 
 #define ZR36057_VFESPFR         0x008	/* Video Front End, Scaler and Pixel Format Register */
-#define ZR36057_VFESPFR_EXT_FL            BIT(26)
-#define ZR36057_VFESPFR_TOP_FIELD         BIT(25)
-#define ZR36057_VFESPFR_VCLK_POL          BIT(24)
-#define ZR36057_VFESPFR_H_FILTER         21
-#define ZR36057_VFESPFR_HOR_DCM          14
-#define ZR36057_VFESPFR_VER_DCM          8
-#define ZR36057_VFESPFR_DISP_MODE        6
+#define ZR36057_VFESPFR_EXT_FL          BIT(26)
+#define ZR36057_VFESPFR_TOP_FIELD       BIT(25)
+#define ZR36057_VFESPFR_VCLK_POL        BIT(24)
+#define ZR36057_VFESPFR_H_FILTER        21
+#define ZR36057_VFESPFR_HOR_DCM         14
+#define ZR36057_VFESPFR_VER_DCM         8
+#define ZR36057_VFESPFR_DISP_MODE       6
 #define ZR36057_VFESPFR_YUV422          (0 << 3)
 #define ZR36057_VFESPFR_RGB888          (1 << 3)
 #define ZR36057_VFESPFR_RGB565          (2 << 3)
 #define ZR36057_VFESPFR_RGB555          (3 << 3)
-#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
-#define ZR36057_VFESPFR_PACK24          (1 << 1)
-#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
+#define ZR36057_VFESPFR_ERR_DIF         BIT(2)
+#define ZR36057_VFESPFR_PACK24          BIT(1)
+#define ZR36057_VFESPFR_LITTLE_ENDIAN   BIT(0)
 
 #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
 
 #define ZR36057_VDBR            0x010	/* Video Display "Bottom" Register */
 
 #define ZR36057_VSSFGR          0x014	/* Video Stride, Status, and Frame Grab Register */
-#define ZR36057_VSSFGR_DISP_STRIDE       16
-#define ZR36057_VSSFGR_VID_OVF            BIT(8)
-#define ZR36057_VSSFGR_SNAP_SHOT          BIT(1)
-#define ZR36057_VSSFGR_FRAME_GRAB         BIT(0)
+#define ZR36057_VSSFGR_DISP_STRIDE      16
+#define ZR36057_VSSFGR_VID_OVF          BIT(8)
+#define ZR36057_VSSFGR_SNAP_SHOT        BIT(1)
+#define ZR36057_VSSFGR_FRAME_GRAB       BIT(0)
 
 #define ZR36057_VDCR            0x018	/* Video Display Configuration Register */
-#define ZR36057_VDCR_VID_EN               BIT(31)
-#define ZR36057_VDCR_MIN_PIX             24
-#define ZR36057_VDCR_TRITON              BIT(24)
-#define ZR36057_VDCR_VID_WIN_HT           12
-#define ZR36057_VDCR_VID_WIN_WID          0
+#define ZR36057_VDCR_VID_EN             BIT(31)
+#define ZR36057_VDCR_MIN_PIX            24
+#define ZR36057_VDCR_TRITON             BIT(24)
+#define ZR36057_VDCR_VID_WIN_HT         12
+#define ZR36057_VDCR_VID_WIN_WID        0
 
 #define ZR36057_MMTR            0x01c	/* Masking Map "Top" Register */
 
 #define ZR36057_MMBR            0x020	/* Masking Map "Bottom" Register */
 
 #define ZR36057_OCR             0x024	/* Overlay Control Register */
-#define ZR36057_OCR_OVL_ENABLE            BIT(15)
-#define ZR36057_OCR_MASK_STRIDE          0
+#define ZR36057_OCR_OVL_ENABLE          BIT(15)
+#define ZR36057_OCR_MASK_STRIDE         0
 
 #define ZR36057_SPGPPCR         0x028	/* System, PCI, and General Purpose Pins Control Register */
-#define ZR36057_SPGPPCR_SOFT_RESET	 BIT(24)
+#define ZR36057_SPGPPCR_SOFT_RESET	BIT(24)
 
 #define ZR36057_GPPGCR1         0x02c	/* General Purpose Pins and GuestBus Control Register (1) */
 
 #define ZR36057_MCSAR           0x030	/* MPEG Code Source Address Register */
 
 #define ZR36057_MCTCR           0x034	/* MPEG Code Transfer Control Register */
-#define ZR36057_MCTCR_COD_TIME            BIT(30)
-#define ZR36057_MCTCR_C_EMPTY             BIT(29)
-#define ZR36057_MCTCR_C_FLUSH             BIT(28)
+#define ZR36057_MCTCR_COD_TIME          BIT(30)
+#define ZR36057_MCTCR_C_EMPTY           BIT(29)
+#define ZR36057_MCTCR_C_FLUSH           BIT(28)
 #define ZR36057_MCTCR_COD_GUEST_ID	20
 #define ZR36057_MCTCR_COD_GUEST_REG	16
 
 #define ZR36057_MCMPR           0x038	/* MPEG Code Memory Pointer Register */
 
 #define ZR36057_ISR             0x03c	/* Interrupt Status Register */
-#define ZR36057_ISR_GIRQ1                BIT(30)
-#define ZR36057_ISR_GIRQ0                BIT(29)
-#define ZR36057_ISR_COD_REP_IRQ            BIT(28)
-#define ZR36057_ISR_JPEG_REP_IRQ           BIT(27)
+#define ZR36057_ISR_GIRQ1               BIT(30)
+#define ZR36057_ISR_GIRQ0               BIT(29)
+#define ZR36057_ISR_COD_REP_IRQ         BIT(28)
+#define ZR36057_ISR_JPEG_REP_IRQ        BIT(27)
 
 #define ZR36057_ICR             0x040	/* Interrupt Control Register */
-#define ZR36057_ICR_GIRQ1                BIT(30)
-#define ZR36057_ICR_GIRQ0                BIT(29)
-#define ZR36057_ICR_COD_REP_IRQ            BIT(28)
-#define ZR36057_ICR_JPEG_REP_IRQ           BIT(27)
-#define ZR36057_ICR_INT_PIN_EN             BIT(24)
+#define ZR36057_ICR_GIRQ1               BIT(30)
+#define ZR36057_ICR_GIRQ0               BIT(29)
+#define ZR36057_ICR_COD_REP_IRQ         BIT(28)
+#define ZR36057_ICR_JPEG_REP_IRQ        BIT(27)
+#define ZR36057_ICR_INT_PIN_EN          BIT(24)
 
 #define ZR36057_I2CBR           0x044	/* I2C Bus Register */
-#define ZR36057_I2CBR_SDA		 BIT(1)
-#define ZR36057_I2CBR_SCL		 BIT(0)
+#define ZR36057_I2CBR_SDA		BIT(1)
+#define ZR36057_I2CBR_SCL		BIT(0)
 
 #define ZR36057_JMC             0x100	/* JPEG Mode and Control */
-#define ZR36057_JMC_JPG                  BIT(31)
-#define ZR36057_JMC_JPG_EXP_MODE          (0 << 29)
-#define ZR36057_JMC_JPG_CMP_MODE           BIT(29)
-#define ZR36057_JMC_MJPG_EXP_MODE         (2 << 29)
-#define ZR36057_JMC_MJPG_CMP_MODE         (3 << 29)
-#define ZR36057_JMC_RTBUSY_FB            BIT(6)
-#define ZR36057_JMC_GO_EN                BIT(5)
-#define ZR36057_JMC_SYNC_MSTR             BIT(4)
-#define ZR36057_JMC_FLD_PER_BUFF         BIT(3)
-#define ZR36057_JMC_VFIFO_FB             BIT(2)
-#define ZR36057_JMC_CFIFO_FB             BIT(1)
-#define ZR36057_JMC_STLL_LIT_ENDIAN       BIT(0)
+#define ZR36057_JMC_JPG                 BIT(31)
+#define ZR36057_JMC_JPG_EXP_MODE        (0 << 29)
+#define ZR36057_JMC_JPG_CMP_MODE        BIT(29)
+#define ZR36057_JMC_MJPG_EXP_MODE       (2 << 29)
+#define ZR36057_JMC_MJPG_CMP_MODE       (3 << 29)
+#define ZR36057_JMC_RTBUSY_FB           BIT(6)
+#define ZR36057_JMC_GO_EN               BIT(5)
+#define ZR36057_JMC_SYNC_MSTR           BIT(4)
+#define ZR36057_JMC_FLD_PER_BUFF        BIT(3)
+#define ZR36057_JMC_VFIFO_FB            BIT(2)
+#define ZR36057_JMC_CFIFO_FB            BIT(1)
+#define ZR36057_JMC_STLL_LIT_ENDIAN     BIT(0)
 
 #define ZR36057_JPC             0x104	/* JPEG Process Control */
-#define ZR36057_JPC_P_RESET              BIT(7)
-#define ZR36057_JPC_COD_TRNS_EN            BIT(5)
-#define ZR36057_JPC_ACTIVE               BIT(0)
+#define ZR36057_JPC_P_RESET             BIT(7)
+#define ZR36057_JPC_COD_TRNS_EN         BIT(5)
+#define ZR36057_JPC_ACTIVE              BIT(0)
 
 #define ZR36057_VSP             0x108	/* Vertical Sync Parameters */
-#define ZR36057_VSP_VSYNC_SIZE           16
-#define ZR36057_VSP_FRM_TOT              0
+#define ZR36057_VSP_VSYNC_SIZE          16
+#define ZR36057_VSP_FRM_TOT             0
 
 #define ZR36057_HSP             0x10c	/* Horizontal Sync Parameters */
-#define ZR36057_HSP_HSYNC_START          16
-#define ZR36057_HSP_LINE_TOT             0
+#define ZR36057_HSP_HSYNC_START         16
+#define ZR36057_HSP_LINE_TOT            0
 
 #define ZR36057_FHAP            0x110	/* Field Horizontal Active Portion */
 #define ZR36057_FHAP_NAX                16
@@ -132,22 +132,22 @@
 #define ZR36057_FVAP_PAY                0
 
 #define ZR36057_FPP             0x118	/* Field Process Parameters */
-#define ZR36057_FPP_ODD_EVEN             BIT(0)
+#define ZR36057_FPP_ODD_EVEN            BIT(0)
 
 #define ZR36057_JCBA            0x11c	/* JPEG Code Base Address */
 
 #define ZR36057_JCFT            0x120	/* JPEG Code FIFO Threshold */
 
 #define ZR36057_JCGI            0x124	/* JPEG Codec Guest ID */
-#define ZR36057_JCGI_JPE_GUEST_ID         4
-#define ZR36057_JCGI_JPE_GUEST_REG        0
+#define ZR36057_JCGI_JPE_GUEST_ID       4
+#define ZR36057_JCGI_JPE_GUEST_REG      0
 
 #define ZR36057_GCR2            0x12c	/* GuestBus Control Register (2) */
 
 #define ZR36057_POR             0x200	/* Post Office Register */
-#define ZR36057_POR_PO_PEN                BIT(25)
-#define ZR36057_POR_PO_TIME               BIT(24)
-#define ZR36057_POR_PO_DIR                BIT(23)
+#define ZR36057_POR_PO_PEN              BIT(25)
+#define ZR36057_POR_PO_TIME             BIT(24)
+#define ZR36057_POR_PO_DIR              BIT(23)
 
 #define ZR36057_STR             0x300	/* "Still" Transfer Register */
 
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 7798016f1f96..75fd167603dc 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -243,7 +243,10 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
 static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
-/* SOF (start of frame) segment depends on width, height and sampling ratio of each color component */
+/*
+ * SOF (start of frame) segment depends on width, height and sampling ratio
+ * of each color component
+ */
 static int zr36060_set_sof(struct zr36060 *ptr)
 {
 	struct zoran *zr = videocodec_to_zoran(ptr->codec);
@@ -555,8 +558,6 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 	reg = 6 - 1;		/* VsyncSize */
 	zr36060_write(ptr, ZR060_SGR_VSYNC, reg);
 
-	//reg   = 30 - 1;               /* HsyncSize */
-///*CP*/        reg = (zr->params.norm == 1 ? 57 : 68);
 	reg = 68;
 	zr36060_write(ptr, ZR060_SGR_HSYNC, reg);
 
diff --git a/drivers/staging/media/zoran/zr36060.h b/drivers/staging/media/zoran/zr36060.h
index fbf5429534ac..75c88677a4bd 100644
--- a/drivers/staging/media/zoran/zr36060.h
+++ b/drivers/staging/media/zoran/zr36060.h
@@ -124,78 +124,78 @@ struct zr36060 {
 
 /* ZR36060 LOAD register bits */
 
-#define ZR060_LOAD_LOAD			 BIT(7)
-#define ZR060_LOAD_SYNC_RST		 BIT(0)
+#define ZR060_LOAD_LOAD			BIT(7)
+#define ZR060_LOAD_SYNC_RST		BIT(0)
 
 /* ZR36060 Code FIFO Status register bits */
 
-#define ZR060_CFSR_BUSY			 BIT(7)
-#define ZR060_CFSR_C_BUSY		 BIT(2)
+#define ZR060_CFSR_BUSY			BIT(7)
+#define ZR060_CFSR_C_BUSY		BIT(2)
 #define ZR060_CFSR_CFIFO		(3 << 0)
 
 /* ZR36060 Code Interface register */
 
-#define ZR060_CIR_CODE16		 BIT(7)
-#define ZR060_CIR_ENDIAN		 BIT(6)
-#define ZR060_CIR_CFIS			 BIT(2)
-#define ZR060_CIR_CODE_MSTR		 BIT(0)
+#define ZR060_CIR_CODE16		BIT(7)
+#define ZR060_CIR_ENDIAN		BIT(6)
+#define ZR060_CIR_CFIS			BIT(2)
+#define ZR060_CIR_CODE_MSTR		BIT(0)
 
 /* ZR36060 Codec Mode register */
 
-#define ZR060_CMR_COMP			 BIT(7)
-#define ZR060_CMR_ATP			 BIT(6)
-#define ZR060_CMR_PASS2			 BIT(5)
-#define ZR060_CMR_TLM			 BIT(4)
-#define ZR060_CMR_BRB			 BIT(2)
-#define ZR060_CMR_FSF			 BIT(1)
+#define ZR060_CMR_COMP			BIT(7)
+#define ZR060_CMR_ATP			BIT(6)
+#define ZR060_CMR_PASS2			BIT(5)
+#define ZR060_CMR_TLM			BIT(4)
+#define ZR060_CMR_BRB			BIT(2)
+#define ZR060_CMR_FSF			BIT(1)
 
 /* ZR36060 Markers Enable register */
 
-#define ZR060_MER_APP			 BIT(7)
-#define ZR060_MER_COM			 BIT(6)
-#define ZR060_MER_DRI			 BIT(5)
-#define ZR060_MER_DQT			 BIT(4)
-#define ZR060_MER_DHT			 BIT(3)
+#define ZR060_MER_APP			BIT(7)
+#define ZR060_MER_COM			BIT(6)
+#define ZR060_MER_DRI			BIT(5)
+#define ZR060_MER_DQT			BIT(4)
+#define ZR060_MER_DHT			BIT(3)
 
 /* ZR36060 Interrupt Mask register */
 
-#define ZR060_IMR_EOAV			 BIT(3)
-#define ZR060_IMR_EOI			 BIT(2)
-#define ZR060_IMR_END			 BIT(1)
-#define ZR060_IMR_DATA_ERR		 BIT(0)
+#define ZR060_IMR_EOAV			BIT(3)
+#define ZR060_IMR_EOI			BIT(2)
+#define ZR060_IMR_END			BIT(1)
+#define ZR060_IMR_DATA_ERR		BIT(0)
 
 /* ZR36060 Interrupt Status register */
 
 #define ZR060_ISR_PRO_CNT		(3 << 6)
-#define ZR060_ISR_EOAV			 BIT(3)
-#define ZR060_ISR_EOI			 BIT(2)
-#define ZR060_ISR_END			 BIT(1)
-#define ZR060_ISR_DATA_ERR		 BIT(0)
+#define ZR060_ISR_EOAV			BIT(3)
+#define ZR060_ISR_EOI			BIT(2)
+#define ZR060_ISR_END			BIT(1)
+#define ZR060_ISR_DATA_ERR		BIT(0)
 
 /* ZR36060 Video Control register */
 
-#define ZR060_VCR_VIDEO8		 BIT(7)
-#define ZR060_VCR_RANGE			 BIT(6)
-#define ZR060_VCR_FI_DET			 BIT(3)
-#define ZR060_VCR_FI_VEDGE		 BIT(2)
-#define ZR060_VCR_FI_EXT			 BIT(1)
-#define ZR060_VCR_SYNC_MSTR		 BIT(0)
+#define ZR060_VCR_VIDEO8		BIT(7)
+#define ZR060_VCR_RANGE			BIT(6)
+#define ZR060_VCR_FI_DET		BIT(3)
+#define ZR060_VCR_FI_VEDGE		BIT(2)
+#define ZR060_VCR_FI_EXT		BIT(1)
+#define ZR060_VCR_SYNC_MSTR		BIT(0)
 
 /* ZR36060 Video Polarity register */
 
-#define ZR060_VPR_VCLK_POL		 BIT(7)
-#define ZR060_VPR_P_VAL_POL		 BIT(6)
-#define ZR060_VPR_POE_POL		 BIT(5)
-#define ZR060_VPR_S_IMG_POL		 BIT(4)
-#define ZR060_VPR_BL_POL			 BIT(3)
-#define ZR060_VPR_FI_POL			 BIT(2)
-#define ZR060_VPR_HS_POL			 BIT(1)
-#define ZR060_VPR_VS_POL			 BIT(0)
+#define ZR060_VPR_VCLK_POL		BIT(7)
+#define ZR060_VPR_P_VAL_POL		BIT(6)
+#define ZR060_VPR_POE_POL		BIT(5)
+#define ZR060_VPR_S_IMG_POL		BIT(4)
+#define ZR060_VPR_BL_POL		BIT(3)
+#define ZR060_VPR_FI_POL		BIT(2)
+#define ZR060_VPR_HS_POL		BIT(1)
+#define ZR060_VPR_VS_POL		BIT(0)
 
 /* ZR36060 Scaling register */
 
-#define ZR060_SR_V_SCALE			 BIT(2)
-#define ZR060_SR_H_SCALE2		 BIT(0)
+#define ZR060_SR_V_SCALE		BIT(2)
+#define ZR060_SR_H_SCALE2		BIT(0)
 #define ZR060_SR_H_SCALE4		(2 << 0)
 
 int zr36060_init_module(void);
-- 
2.35.1


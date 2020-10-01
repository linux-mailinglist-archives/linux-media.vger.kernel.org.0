Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5185D27FC72
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 11:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731828AbgJAJ2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 05:28:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726992AbgJAJ2W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 05:28:22 -0400
Received: from mail.kernel.org (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A92F82176B;
        Thu,  1 Oct 2020 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601544499;
        bh=rLooed2zCKgCihMNZleIe+V0WQPVKotaA2C2uXm6G2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C2UMN9Q6CqaH/vBHHfSDw8kvl+FVC2so35jF5C3utCK5CafAGXOvVhTZ6s8feghmt
         f68r59gb1yePv04IH4kaG0MYBBxGZE44yO2LnhubQQ40R8sJJKMB1Zvg861kGLTRxy
         j8uVTeKqiUWN3e2tYM4Q+3s7PFrsYxmHn4tsqLYM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNusp-005Xak-TL; Thu, 01 Oct 2020 11:28:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        mjpeg-users@lists.sourceforge.net
Subject: [PATCH 3/3] media: zoran: fix mixed case on vars
Date:   Thu,  1 Oct 2020 11:28:15 +0200
Message-Id: <5e09ed2cc5cacfac0653089fc976be3409f0fa9d.1601544491.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <21fd8f12edb27d269eefdbea172aa3a80e2aa6ce.1601544491.git.mchehab+huawei@kernel.org>
References: <21fd8f12edb27d269eefdbea172aa3a80e2aa6ce.1601544491.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use this small script to replace CamelCase and wrong case
on vars:

<script>
FILES=$(find "$1" -type f|grep -e '.c$' -e '.h$')
CAMEL_VARS=$(cat tags|perl -ne 'print "$1\n" if (m/^(\w*[A-Z]\w*[a-z]\w*)\s/)')
for i in $CAMEL_VARS; do
        new=$(perl -e '
                my $s = $ARGV[0];
                $s =~ s{([^a-zA-Z]?)([A-Z]*)([A-Z])([a-z]?)}{
                        my $fc = pos($s)==0;
                        my ($p0,$p1,$p2,$p3) = ($1,lc$2,lc$3,$4);
                        my $t = $p0 || $fc ? $p0 : '_';
                        $t .= $p3 ? $p1 ? "${p1}_$p2$p3" : "$p2$p3" : "$p1$p2";
                        $t;
                }ge;
                print $s;' "$i")
        for j in $FILES; do
                sed -E "s,\b$i\b,$new,g" -i $j
        done
done
for i in $(git grep "#define zr" drivers/staging/media/zoran/*.[ch]|perl -ne 'print "$1\n" if (m/#define\s+(zr\S+)/)'); do j=$(echo $i|tr [a-z] [A-Z]); sed "s,\b$i\b,$j,g" -i drivers/staging/media/zoran/*.[ch]; done
</script>

This should solve almost all warnings reported by checkpatch.pl
in strict mode.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/zoran/videocodec.h   |   2 +-
 drivers/staging/media/zoran/zoran.h        |  30 +--
 drivers/staging/media/zoran/zoran_card.c   |  52 ++---
 drivers/staging/media/zoran/zoran_device.c | 242 ++++++++++-----------
 drivers/staging/media/zoran/zoran_driver.c |  94 ++++----
 drivers/staging/media/zoran/zr36016.c      |  14 +-
 drivers/staging/media/zoran/zr36050.c      |   2 +-
 drivers/staging/media/zoran/zr36057.h      | 122 +++++------
 drivers/staging/media/zoran/zr36060.c      |  76 +++----
 drivers/staging/media/zoran/zr36060.h      |  66 +++---
 10 files changed, 350 insertions(+), 350 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.h b/drivers/staging/media/zoran/videocodec.h
index a049f3c2c68a..8a5003dda9f4 100644
--- a/drivers/staging/media/zoran/videocodec.h
+++ b/drivers/staging/media/zoran/videocodec.h
@@ -218,7 +218,7 @@ struct vfe_settings {
 };
 
 struct tvnorm {
-	u16 Wt, Wa, HStart, HSyncStart, Ht, Ha, VStart;
+	u16 wt, wa, h_start, h_sync_start, ht, ha, v_start;
 };
 
 struct jpeg_com_marker {
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 945502becd60..e7fe8da7732c 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -45,8 +45,8 @@ static inline struct zr_buffer *vb2_to_zr_buffer(struct vb2_buffer *vb)
 
 #define ZR_DEVNAME(zr) ((zr)->name)
 
-#define   BUZ_MAX_WIDTH   (zr->timing->Wa)
-#define   BUZ_MAX_HEIGHT  (zr->timing->Ha)
+#define   BUZ_MAX_WIDTH   (zr->timing->wa)
+#define   BUZ_MAX_HEIGHT  (zr->timing->ha)
 #define   BUZ_MIN_WIDTH    32	/* never display less than 32 pixels */
 #define   BUZ_MIN_HEIGHT   24	/* never display less than 24 rows */
 
@@ -152,8 +152,8 @@ struct zoran_v4l_settings {
 /* jpg-capture/-playback settings */
 struct zoran_jpg_settings {
 	int decimation;		/* this bit is used to set everything to default */
-	int HorDcm, VerDcm, TmpDcm;	/* capture decimation settings (TmpDcm=1 means both fields) */
-	int field_per_buff, odd_even;	/* field-settings (odd_even=1 (+TmpDcm=1) means top-field-first) */
+	int hor_dcm, ver_dcm, tmp_dcm;	/* capture decimation settings (tmp_dcm=1 means both fields) */
+	int field_per_buff, odd_even;	/* field-settings (odd_even=1 (+tmp_dcm=1) means top-field-first) */
 	int img_x, img_y, img_width, img_height;	/* crop settings (subframe capture) */
 	struct v4l2_jpegcompression jpg_comp;	/* JPEG-specific capture settings */
 };
@@ -266,21 +266,21 @@ struct zoran {
 	unsigned int ghost_int;
 	int intr_counter_GIRQ1;
 	int intr_counter_GIRQ0;
-	int intr_counter_CodRepIRQ;
-	int intr_counter_JPEGRepIRQ;
+	int intr_counter_cod_rep_irq;
+	int intr_counter_jpeg_rep_irq;
 	int field_counter;
-	int IRQ1_in;
-	int IRQ1_out;
-	int JPEG_in;
-	int JPEG_out;
+	int irq1_in;
+	int irq1_out;
+	int jpeg_in;
+	int jpeg_out;
 	int JPEG_0;
 	int JPEG_1;
-	int END_event_missed;
-	int JPEG_missed;
-	int JPEG_error;
+	int end_event_missed;
+	int jpeg_missed;
+	int jpeg_error;
 	int num_errors;
-	int JPEG_max_missed;
-	int JPEG_min_missed;
+	int jpeg_max_missed;
+	int jpeg_min_missed;
 	unsigned int prepared;
 	unsigned int queued;
 
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 8d56d039a686..dfc60e2e9dd7 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -266,7 +266,7 @@ static const char *codecid_to_modulename(u16 codecid)
 }
 
 // struct tvnorm {
-//      u16 Wt, Wa, HStart, HSyncStart, Ht, Ha, VStart;
+//      u16 wt, wa, h_start, h_sync_start, ht, ha, v_start;
 // };
 
 static const struct tvnorm f50sqpixel = { 944, 768, 83, 880, 625, 576, 16 };
@@ -277,7 +277,7 @@ static const struct tvnorm f60ccir601 = { 858, 720, 57, 788, 525, 480, 16 };
 static const struct tvnorm f50ccir601_lml33 = { 864, 720, 75 + 34, 804, 625, 576, 18 };
 static const struct tvnorm f60ccir601_lml33 = { 858, 720, 57 + 34, 788, 525, 480, 16 };
 
-/* The DC10 (57/16/50) uses VActive as HSync, so HStart must be 0 */
+/* The DC10 (57/16/50) uses VActive as HSync, so h_start must be 0 */
 static const struct tvnorm f50sqpixel_dc10 = { 944, 768, 0, 880, 625, 576, 0 };
 static const struct tvnorm f60sqpixel_dc10 = { 780, 640, 0, 716, 525, 480, 12 };
 
@@ -662,8 +662,8 @@ int zoran_check_jpg_settings(struct zoran *zr,
 	int err = 0, err0 = 0;
 
 	pci_dbg(zr->pci_dev, "%s - dec: %d, Hdcm: %d, Vdcm: %d, Tdcm: %d\n",
-		__func__, settings->decimation, settings->HorDcm,
-		settings->VerDcm, settings->TmpDcm);
+		__func__, settings->decimation, settings->hor_dcm,
+		settings->ver_dcm, settings->tmp_dcm);
 	pci_dbg(zr->pci_dev, "%s - x: %d, y: %d, w: %d, y: %d\n", __func__,
 		settings->img_x, settings->img_y,
 		settings->img_width, settings->img_height);
@@ -671,9 +671,9 @@ int zoran_check_jpg_settings(struct zoran *zr,
 	switch (settings->decimation) {
 	case 1:
 
-		settings->HorDcm = 1;
-		settings->VerDcm = 1;
-		settings->TmpDcm = 1;
+		settings->hor_dcm = 1;
+		settings->ver_dcm = 1;
+		settings->tmp_dcm = 1;
 		settings->field_per_buff = 2;
 		settings->img_x = 0;
 		settings->img_y = 0;
@@ -682,9 +682,9 @@ int zoran_check_jpg_settings(struct zoran *zr,
 		break;
 	case 2:
 
-		settings->HorDcm = 2;
-		settings->VerDcm = 1;
-		settings->TmpDcm = 2;
+		settings->hor_dcm = 2;
+		settings->ver_dcm = 1;
+		settings->tmp_dcm = 2;
 		settings->field_per_buff = 1;
 		settings->img_x = (BUZ_MAX_WIDTH == 720) ? 8 : 0;
 		settings->img_y = 0;
@@ -700,9 +700,9 @@ int zoran_check_jpg_settings(struct zoran *zr,
 			break;
 		}
 
-		settings->HorDcm = 4;
-		settings->VerDcm = 2;
-		settings->TmpDcm = 2;
+		settings->hor_dcm = 4;
+		settings->ver_dcm = 2;
+		settings->tmp_dcm = 2;
 		settings->field_per_buff = 1;
 		settings->img_x = (BUZ_MAX_WIDTH == 720) ? 8 : 0;
 		settings->img_y = 0;
@@ -714,17 +714,17 @@ int zoran_check_jpg_settings(struct zoran *zr,
 
 		/* We have to check the data the user has set */
 
-		if (settings->HorDcm != 1 && settings->HorDcm != 2 &&
-		    (zr->card.type == DC10_NEW || settings->HorDcm != 4)) {
-			settings->HorDcm = clamp(settings->HorDcm, 1, 2);
+		if (settings->hor_dcm != 1 && settings->hor_dcm != 2 &&
+		    (zr->card.type == DC10_NEW || settings->hor_dcm != 4)) {
+			settings->hor_dcm = clamp(settings->hor_dcm, 1, 2);
 			err0++;
 		}
-		if (settings->VerDcm != 1 && settings->VerDcm != 2) {
-			settings->VerDcm = clamp(settings->VerDcm, 1, 2);
+		if (settings->ver_dcm != 1 && settings->ver_dcm != 2) {
+			settings->ver_dcm = clamp(settings->ver_dcm, 1, 2);
 			err0++;
 		}
-		if (settings->TmpDcm != 1 && settings->TmpDcm != 2) {
-			settings->TmpDcm = clamp(settings->TmpDcm, 1, 2);
+		if (settings->tmp_dcm != 1 && settings->tmp_dcm != 2) {
+			settings->tmp_dcm = clamp(settings->tmp_dcm, 1, 2);
 			err0++;
 		}
 		if (settings->field_per_buff != 1 &&
@@ -756,16 +756,16 @@ int zoran_check_jpg_settings(struct zoran *zr,
 			settings->img_y = BUZ_MAX_HEIGHT / 2 - settings->img_height;
 			err0++;
 		}
-		if (settings->img_width % (16 * settings->HorDcm) != 0) {
-			settings->img_width -= settings->img_width % (16 * settings->HorDcm);
+		if (settings->img_width % (16 * settings->hor_dcm) != 0) {
+			settings->img_width -= settings->img_width % (16 * settings->hor_dcm);
 			if (settings->img_width == 0)
-				settings->img_width = 16 * settings->HorDcm;
+				settings->img_width = 16 * settings->hor_dcm;
 			err0++;
 		}
-		if (settings->img_height % (8 * settings->VerDcm) != 0) {
-			settings->img_height -= settings->img_height % (8 * settings->VerDcm);
+		if (settings->img_height % (8 * settings->ver_dcm) != 0) {
+			settings->img_height -= settings->img_height % (8 * settings->ver_dcm);
 			if (settings->img_height == 0)
-				settings->img_height = 8 * settings->VerDcm;
+				settings->img_height = 8 * settings->ver_dcm;
 			err0++;
 		}
 
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index ecd6c5293a87..e569a1341d01 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -34,7 +34,7 @@
 
 #define IRQ_MASK (ZR36057_ISR_GIRQ0 | \
 		  ZR36057_ISR_GIRQ1 | \
-		  ZR36057_ISR_JPEGRepIRQ)
+		  ZR36057_ISR_JPEG_REP_IRQ)
 
 static bool lml33dpath;		/* default = 0
 				 * 1 will use digital path in capture
@@ -59,17 +59,17 @@ static void zr36057_init_vfe(struct zoran *zr)
 	u32 reg;
 
 	reg = btread(ZR36057_VFESPFR);
-	reg |= ZR36057_VFESPFR_LittleEndian;
-	reg &= ~ZR36057_VFESPFR_VCLKPol;
-	reg |= ZR36057_VFESPFR_ExtFl;
-	reg |= ZR36057_VFESPFR_TopField;
+	reg |= ZR36057_VFESPFR_LITTLE_ENDIAN;
+	reg &= ~ZR36057_VFESPFR_VCLK_POL;
+	reg |= ZR36057_VFESPFR_EXT_FL;
+	reg |= ZR36057_VFESPFR_TOP_FIELD;
 	btwrite(reg, ZR36057_VFESPFR);
 	reg = btread(ZR36057_VDCR);
 	if (pci_pci_problems & PCIPCI_TRITON)
 		// || zr->revision < 1) // Revision 1 has also Triton support
-		reg &= ~ZR36057_VDCR_Triton;
+		reg &= ~ZR36057_VDCR_TRITON;
 	else
-		reg |= ZR36057_VDCR_Triton;
+		reg |= ZR36057_VDCR_TRITON;
 	btwrite(reg, ZR36057_VDCR);
 }
 
@@ -108,12 +108,12 @@ int post_office_wait(struct zoran *zr)
 {
 	u32 por;
 
-//      while (((por = btread(ZR36057_POR)) & (ZR36057_POR_POPen | ZR36057_POR_POTime)) == ZR36057_POR_POPen) {
-	while ((por = btread(ZR36057_POR)) & ZR36057_POR_POPen) {
+//      while (((por = btread(ZR36057_POR)) & (ZR36057_POR_PO_PEN | ZR36057_POR_PO_TIME)) == ZR36057_POR_PO_PEN) {
+	while ((por = btread(ZR36057_POR)) & ZR36057_POR_PO_PEN) {
 		/* wait for something to happen */
 		/* TODO add timeout */
 	}
-	if ((por & ZR36057_POR_POTime) && !zr->card.gws_not_connected) {
+	if ((por & ZR36057_POR_PO_TIME) && !zr->card.gws_not_connected) {
 		/* In LML33/BUZ \GWS line is not connected, so it has always timeout set */
 		pci_info(zr->pci_dev, "pop timeout %08x\n", por);
 		return -1;
@@ -128,7 +128,7 @@ int post_office_write(struct zoran *zr, unsigned int guest,
 	u32 por;
 
 	por =
-	    ZR36057_POR_PODir | ZR36057_POR_POTime | ((guest & 7) << 20) |
+	    ZR36057_POR_PO_DIR | ZR36057_POR_PO_TIME | ((guest & 7) << 20) |
 	    ((reg & 7) << 16) | (value & 0xFF);
 	btwrite(por, ZR36057_POR);
 
@@ -139,7 +139,7 @@ int post_office_read(struct zoran *zr, unsigned int guest, unsigned int reg)
 {
 	u32 por;
 
-	por = ZR36057_POR_POTime | ((guest & 7) << 20) | ((reg & 7) << 16);
+	por = ZR36057_POR_PO_TIME | ((guest & 7) << 20) | ((reg & 7) << 16);
 	btwrite(por, ZR36057_POR);
 	if (post_office_wait(zr) < 0)
 		return -1;
@@ -258,7 +258,7 @@ static void zr36057_adjust_vfe(struct zoran *zr, enum zoran_codec_mode mode)
 
 	switch (mode) {
 	case BUZ_MODE_MOTION_DECOMPRESS:
-		btand(~ZR36057_VFESPFR_ExtFl, ZR36057_VFESPFR);
+		btand(~ZR36057_VFESPFR_EXT_FL, ZR36057_VFESPFR);
 		reg = btread(ZR36057_VFEHCR);
 		if ((reg & (1 << 10)) && zr->card.type != LML33R10)
 			reg += ((1 << 10) | 1);
@@ -271,9 +271,9 @@ static void zr36057_adjust_vfe(struct zoran *zr, enum zoran_codec_mode mode)
 		if ((zr->norm & V4L2_STD_NTSC) ||
 		    (zr->card.type == LML33R10 &&
 		     (zr->norm & V4L2_STD_PAL)))
-			btand(~ZR36057_VFESPFR_ExtFl, ZR36057_VFESPFR);
+			btand(~ZR36057_VFESPFR_EXT_FL, ZR36057_VFESPFR);
 		else
-			btor(ZR36057_VFESPFR_ExtFl, ZR36057_VFESPFR);
+			btor(ZR36057_VFESPFR_EXT_FL, ZR36057_VFESPFR);
 		reg = btread(ZR36057_VFEHCR);
 		if (!(reg & (1 << 10)) && zr->card.type != LML33R10)
 			reg -= ((1 << 10) | 1);
@@ -291,24 +291,24 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 			    const struct zoran_format *format)
 {
 	const struct tvnorm *tvn;
-	unsigned int HStart, HEnd, VStart, VEnd;
+	unsigned int h_start, HEnd, v_start, VEnd;
 	unsigned int DispMode;
 	unsigned int VidWinWid, VidWinHt;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
-	unsigned int Wa, We, Ha, He;
-	unsigned int X, Y, HorDcm, VerDcm;
+	unsigned int wa, We, ha, He;
+	unsigned int X, Y, hor_dcm, ver_dcm;
 	u32 reg;
 
 	tvn = zr->timing;
 
-	Wa = tvn->Wa;
-	Ha = tvn->Ha;
+	wa = tvn->wa;
+	ha = tvn->ha;
 
 	pci_info(zr->pci_dev, "set_vfe() - width = %d, height = %d\n", video_width, video_height);
 
 	if (video_width < BUZ_MIN_WIDTH ||
 	    video_height < BUZ_MIN_HEIGHT ||
-	    video_width > Wa || video_height > Ha) {
+	    video_width > wa || video_height > ha) {
 		pci_err(zr->pci_dev, "set_vfe: w=%d h=%d not valid\n", video_width, video_height);
 		return;
 	}
@@ -317,79 +317,79 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 
 	/* horizontal */
 	VidWinWid = video_width;
-	X = DIV_ROUND_UP(VidWinWid * 64, tvn->Wa);
+	X = DIV_ROUND_UP(VidWinWid * 64, tvn->wa);
 	We = (VidWinWid * 64) / X;
-	HorDcm = 64 - X;
-	hcrop1 = 2 * ((tvn->Wa - We) / 4);
-	hcrop2 = tvn->Wa - We - hcrop1;
-	HStart = tvn->HStart ? tvn->HStart : 1;
+	hor_dcm = 64 - X;
+	hcrop1 = 2 * ((tvn->wa - We) / 4);
+	hcrop2 = tvn->wa - We - hcrop1;
+	h_start = tvn->h_start ? tvn->h_start : 1;
 	/* (Ronald) Original comment:
 	 * "| 1 Doesn't have any effect, tested on both a DC10 and a DC10+"
 	 * this is false. It inverses chroma values on the LML33R10 (so Cr
 	 * suddenly is shown as Cb and reverse, really cool effect if you
 	 * want to see blue faces, not useful otherwise). So don't use |1.
-	 * However, the DC10 has '0' as HStart, but does need |1, so we
+	 * However, the DC10 has '0' as h_start, but does need |1, so we
 	 * use a dirty check...
 	 */
-	HEnd = HStart + tvn->Wa - 1;
-	HStart += hcrop1;
+	HEnd = h_start + tvn->wa - 1;
+	h_start += hcrop1;
 	HEnd -= hcrop2;
-	reg = ((HStart & ZR36057_VFEHCR_Hmask) << ZR36057_VFEHCR_HStart)
-	    | ((HEnd & ZR36057_VFEHCR_Hmask) << ZR36057_VFEHCR_HEnd);
+	reg = ((h_start & ZR36057_VFEHCR_HMASK) << ZR36057_VFEHCR_H_START)
+	    | ((HEnd & ZR36057_VFEHCR_HMASK) << ZR36057_VFEHCR_H_END);
 	if (zr->card.vfe_pol.hsync_pol)
-		reg |= ZR36057_VFEHCR_HSPol;
+		reg |= ZR36057_VFEHCR_HS_POL;
 	btwrite(reg, ZR36057_VFEHCR);
 
 	/* Vertical */
 	DispMode = !(video_height > BUZ_MAX_HEIGHT / 2);
 	VidWinHt = DispMode ? video_height : video_height / 2;
-	Y = DIV_ROUND_UP(VidWinHt * 64 * 2, tvn->Ha);
+	Y = DIV_ROUND_UP(VidWinHt * 64 * 2, tvn->ha);
 	He = (VidWinHt * 64) / Y;
-	VerDcm = 64 - Y;
-	vcrop1 = (tvn->Ha / 2 - He) / 2;
-	vcrop2 = tvn->Ha / 2 - He - vcrop1;
-	VStart = tvn->VStart;
-	VEnd = VStart + tvn->Ha / 2;	// - 1; FIXME SnapShot times out with -1 in 768*576 on the DC10 - LP
-	VStart += vcrop1;
+	ver_dcm = 64 - Y;
+	vcrop1 = (tvn->ha / 2 - He) / 2;
+	vcrop2 = tvn->ha / 2 - He - vcrop1;
+	v_start = tvn->v_start;
+	VEnd = v_start + tvn->ha / 2;	// - 1; FIXME SnapShot times out with -1 in 768*576 on the DC10 - LP
+	v_start += vcrop1;
 	VEnd -= vcrop2;
-	reg = ((VStart & ZR36057_VFEVCR_Vmask) << ZR36057_VFEVCR_VStart)
-	    | ((VEnd & ZR36057_VFEVCR_Vmask) << ZR36057_VFEVCR_VEnd);
+	reg = ((v_start & ZR36057_VFEVCR_VMASK) << ZR36057_VFEVCR_V_START)
+	    | ((VEnd & ZR36057_VFEVCR_VMASK) << ZR36057_VFEVCR_V_END);
 	if (zr->card.vfe_pol.vsync_pol)
-		reg |= ZR36057_VFEVCR_VSPol;
+		reg |= ZR36057_VFEVCR_VS_POL;
 	btwrite(reg, ZR36057_VFEVCR);
 
 	/* scaler and pixel format */
 	reg = 0;
-	reg |= (HorDcm << ZR36057_VFESPFR_HorDcm);
-	reg |= (VerDcm << ZR36057_VFESPFR_VerDcm);
-	reg |= (DispMode << ZR36057_VFESPFR_DispMode);
+	reg |= (hor_dcm << ZR36057_VFESPFR_HOR_DCM);
+	reg |= (ver_dcm << ZR36057_VFESPFR_VER_DCM);
+	reg |= (DispMode << ZR36057_VFESPFR_DISP_MODE);
 	/* RJ: I don't know, why the following has to be the opposite
 	 * of the corresponding ZR36060 setting, but only this way
 	 * we get the correct colors when uncompressing to the screen  */
-	//reg |= ZR36057_VFESPFR_VCLKPol; /**/
+	//reg |= ZR36057_VFESPFR_VCLK_POL; /**/
 	/* RJ: Don't know if that is needed for NTSC also */
 	if (!(zr->norm & V4L2_STD_NTSC))
-		reg |= ZR36057_VFESPFR_ExtFl;	// NEEDED!!!!!!! Wolfgang
-	reg |= ZR36057_VFESPFR_TopField;
-	if (HorDcm >= 48)
-		reg |= 3 << ZR36057_VFESPFR_HFilter;	/* 5 tap filter */
-	else if (HorDcm >= 32)
-		reg |= 2 << ZR36057_VFESPFR_HFilter;	/* 4 tap filter */
-	else if (HorDcm >= 16)
-		reg |= 1 << ZR36057_VFESPFR_HFilter;	/* 3 tap filter */
+		reg |= ZR36057_VFESPFR_EXT_FL;	// NEEDED!!!!!!! Wolfgang
+	reg |= ZR36057_VFESPFR_TOP_FIELD;
+	if (hor_dcm >= 48)
+		reg |= 3 << ZR36057_VFESPFR_H_FILTER;	/* 5 tap filter */
+	else if (hor_dcm >= 32)
+		reg |= 2 << ZR36057_VFESPFR_H_FILTER;	/* 4 tap filter */
+	else if (hor_dcm >= 16)
+		reg |= 1 << ZR36057_VFESPFR_H_FILTER;	/* 3 tap filter */
 
 	reg |= format->vfespfr;
 	btwrite(reg, ZR36057_VFESPFR);
 
 	/* display configuration */
-	reg = (16 << ZR36057_VDCR_MinPix)
-	    | (VidWinHt << ZR36057_VDCR_VidWinHt)
-	    | (VidWinWid << ZR36057_VDCR_VidWinWid);
+	reg = (16 << ZR36057_VDCR_MIN_PIX)
+	    | (VidWinHt << ZR36057_VDCR_VID_WIN_HT)
+	    | (VidWinWid << ZR36057_VDCR_VID_WIN_WID);
 	if (pci_pci_problems & PCIPCI_TRITON)
 		// || zr->revision < 1) // Revision 1 has also Triton support
-		reg &= ~ZR36057_VDCR_Triton;
+		reg &= ~ZR36057_VDCR_TRITON;
 	else
-		reg |= ZR36057_VDCR_Triton;
+		reg |= ZR36057_VDCR_TRITON;
 	btwrite(reg, ZR36057_VDCR);
 
 	zr36057_adjust_vfe(zr, zr->codec_mode);
@@ -406,7 +406,7 @@ void zr36057_set_memgrab(struct zoran *zr, int mode)
 		 * capture is pending when capturing is tuned off, FrameGrab
 		 * will be stuck at 1 until capturing is turned back on.
 		 */
-		if (btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_SnapShot)
+		if (btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_SNAP_SHOT)
 			pci_warn(zr->pci_dev, "zr36057_set_memgrab(1) with SnapShot on!?\n");
 
 		/* switch on VSync interrupts */
@@ -414,7 +414,7 @@ void zr36057_set_memgrab(struct zoran *zr, int mode)
 		btor(zr->card.vsync_int, ZR36057_ICR);	// SW
 
 		/* enable SnapShot */
-		btor(ZR36057_VSSFGR_SnapShot, ZR36057_VSSFGR);
+		btor(ZR36057_VSSFGR_SNAP_SHOT, ZR36057_VSSFGR);
 
 		/* Set zr36057 video front end  and enable video */
 		zr36057_set_vfe(zr, zr->v4l_settings.width,
@@ -425,8 +425,8 @@ void zr36057_set_memgrab(struct zoran *zr, int mode)
 		btand(~zr->card.vsync_int, ZR36057_ICR);	// SW
 
 		/* re-enable grabbing to screen if it was running */
-		btand(~ZR36057_VDCR_VidEn, ZR36057_VDCR);
-		btand(~ZR36057_VSSFGR_SnapShot, ZR36057_VSSFGR);
+		btand(~ZR36057_VDCR_VID_EN, ZR36057_VDCR);
+		btand(~ZR36057_VSSFGR_SNAP_SHOT, ZR36057_VSSFGR);
 	}
 }
 
@@ -468,7 +468,7 @@ static void init_jpeg_queue(struct zoran *zr)
 	zr->jpg_dma_tail = 0;
 	zr->jpg_que_tail = 0;
 	zr->jpg_seq_num = 0;
-	zr->JPEG_error = 0;
+	zr->jpeg_error = 0;
 	zr->num_errors = 0;
 	zr->jpg_err_seq = 0;
 	zr->jpg_err_shift = 0;
@@ -491,61 +491,61 @@ static void zr36057_set_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 	switch (mode) {
 	case BUZ_MODE_MOTION_COMPRESS:
 	default:
-		reg = ZR36057_JMC_MJPGCmpMode;
+		reg = ZR36057_JMC_MJPG_CMP_MODE;
 		break;
 
 	case BUZ_MODE_MOTION_DECOMPRESS:
-		reg = ZR36057_JMC_MJPGExpMode;
-		reg |= ZR36057_JMC_SyncMstr;
+		reg = ZR36057_JMC_MJPG_EXP_MODE;
+		reg |= ZR36057_JMC_SYNC_MSTR;
 		/* RJ: The following is experimental - improves the output to screen */
 		//if(zr->jpg_settings.VFIFO_FB) reg |= ZR36057_JMC_VFIFO_FB; // No, it doesn't. SM
 		break;
 
 	case BUZ_MODE_STILL_COMPRESS:
-		reg = ZR36057_JMC_JPGCmpMode;
+		reg = ZR36057_JMC_JPG_CMP_MODE;
 		break;
 
 	case BUZ_MODE_STILL_DECOMPRESS:
-		reg = ZR36057_JMC_JPGExpMode;
+		reg = ZR36057_JMC_JPG_EXP_MODE;
 		break;
 	}
 	reg |= ZR36057_JMC_JPG;
 	if (zr->jpg_settings.field_per_buff == 1)
-		reg |= ZR36057_JMC_Fld_per_buff;
+		reg |= ZR36057_JMC_FLD_PER_BUFF;
 	btwrite(reg, ZR36057_JMC);
 
 	/* vertical */
-	btor(ZR36057_VFEVCR_VSPol, ZR36057_VFEVCR);
-	reg = (6 << ZR36057_VSP_VsyncSize) |
-	      (tvn->Ht << ZR36057_VSP_FrmTot);
+	btor(ZR36057_VFEVCR_VS_POL, ZR36057_VFEVCR);
+	reg = (6 << ZR36057_VSP_VSYNC_SIZE) |
+	      (tvn->ht << ZR36057_VSP_FRM_TOT);
 	btwrite(reg, ZR36057_VSP);
-	reg = ((zr->jpg_settings.img_y + tvn->VStart) << ZR36057_FVAP_NAY) |
+	reg = ((zr->jpg_settings.img_y + tvn->v_start) << ZR36057_FVAP_NAY) |
 	      (zr->jpg_settings.img_height << ZR36057_FVAP_PAY);
 	btwrite(reg, ZR36057_FVAP);
 
 	/* horizontal */
 	if (zr->card.vfe_pol.hsync_pol)
-		btor(ZR36057_VFEHCR_HSPol, ZR36057_VFEHCR);
+		btor(ZR36057_VFEHCR_HS_POL, ZR36057_VFEHCR);
 	else
-		btand(~ZR36057_VFEHCR_HSPol, ZR36057_VFEHCR);
-	reg = ((tvn->HSyncStart) << ZR36057_HSP_HsyncStart) |
-	      (tvn->Wt << ZR36057_HSP_LineTot);
+		btand(~ZR36057_VFEHCR_HS_POL, ZR36057_VFEHCR);
+	reg = ((tvn->h_sync_start) << ZR36057_HSP_HSYNC_START) |
+	      (tvn->wt << ZR36057_HSP_LINE_TOT);
 	btwrite(reg, ZR36057_HSP);
 	reg = ((zr->jpg_settings.img_x +
-		tvn->HStart + 4) << ZR36057_FHAP_NAX) |
+		tvn->h_start + 4) << ZR36057_FHAP_NAX) |
 	      (zr->jpg_settings.img_width << ZR36057_FHAP_PAX);
 	btwrite(reg, ZR36057_FHAP);
 
 	/* field process parameters */
 	if (zr->jpg_settings.odd_even)
-		reg = ZR36057_FPP_Odd_Even;
+		reg = ZR36057_FPP_ODD_EVEN;
 	else
 		reg = 0;
 
 	btwrite(reg, ZR36057_FPP);
 
 	/* Set proper VCLK Polarity, else colors will be wrong during playback */
-	//btor(ZR36057_VFESPFR_VCLKPol, ZR36057_VFESPFR);
+	//btor(ZR36057_VFESPFR_VCLK_POL, ZR36057_VFESPFR);
 
 	/* code base address */
 	btwrite(zr->p_sc, ZR36057_JCBA);
@@ -578,19 +578,19 @@ void clear_interrupt_counters(struct zoran *zr)
 {
 	zr->intr_counter_GIRQ1 = 0;
 	zr->intr_counter_GIRQ0 = 0;
-	zr->intr_counter_CodRepIRQ = 0;
-	zr->intr_counter_JPEGRepIRQ = 0;
+	zr->intr_counter_cod_rep_irq = 0;
+	zr->intr_counter_jpeg_rep_irq = 0;
 	zr->field_counter = 0;
-	zr->IRQ1_in = 0;
-	zr->IRQ1_out = 0;
-	zr->JPEG_in = 0;
-	zr->JPEG_out = 0;
+	zr->irq1_in = 0;
+	zr->irq1_out = 0;
+	zr->jpeg_in = 0;
+	zr->jpeg_out = 0;
 	zr->JPEG_0 = 0;
 	zr->JPEG_1 = 0;
-	zr->END_event_missed = 0;
-	zr->JPEG_missed = 0;
-	zr->JPEG_max_missed = 0;
-	zr->JPEG_min_missed = 0x7fffffff;
+	zr->end_event_missed = 0;
+	zr->jpeg_missed = 0;
+	zr->jpeg_max_missed = 0;
+	zr->jpeg_min_missed = 0x7fffffff;
 }
 
 static u32 count_reset_interrupt(struct zoran *zr)
@@ -607,13 +607,13 @@ static u32 count_reset_interrupt(struct zoran *zr)
 			btwrite(ZR36057_ISR_GIRQ0, ZR36057_ISR);
 			zr->intr_counter_GIRQ0++;
 		}
-		if (isr & ZR36057_ISR_CodRepIRQ) {
-			btwrite(ZR36057_ISR_CodRepIRQ, ZR36057_ISR);
-			zr->intr_counter_CodRepIRQ++;
+		if (isr & ZR36057_ISR_COD_REP_IRQ) {
+			btwrite(ZR36057_ISR_COD_REP_IRQ, ZR36057_ISR);
+			zr->intr_counter_cod_rep_irq++;
 		}
-		if (isr & ZR36057_ISR_JPEGRepIRQ) {
-			btwrite(ZR36057_ISR_JPEGRepIRQ, ZR36057_ISR);
-			zr->intr_counter_JPEGRepIRQ++;
+		if (isr & ZR36057_ISR_JPEG_REP_IRQ) {
+			btwrite(ZR36057_ISR_JPEG_REP_IRQ, ZR36057_ISR);
+			zr->intr_counter_jpeg_rep_irq++;
 		}
 	}
 	return isr;
@@ -626,23 +626,23 @@ void jpeg_start(struct zoran *zr)
 	zr->frame_num = 0;
 
 	/* deassert P_reset, disable code transfer, deassert Active */
-	btwrite(ZR36057_JPC_P_Reset, ZR36057_JPC);
+	btwrite(ZR36057_JPC_P_RESET, ZR36057_JPC);
 	/* stop flushing the internal code buffer */
-	btand(~ZR36057_MCTCR_CFlush, ZR36057_MCTCR);
+	btand(~ZR36057_MCTCR_C_FLUSH, ZR36057_MCTCR);
 	/* enable code transfer */
-	btor(ZR36057_JPC_CodTrnsEn, ZR36057_JPC);
+	btor(ZR36057_JPC_COD_TRNS_EN, ZR36057_JPC);
 
 	/* clear IRQs */
 	btwrite(IRQ_MASK, ZR36057_ISR);
 	/* enable the JPEG IRQs */
-	btwrite(zr->card.jpeg_int | ZR36057_ICR_JPEGRepIRQ | ZR36057_ICR_IntPinEn,
+	btwrite(zr->card.jpeg_int | ZR36057_ICR_JPEG_REP_IRQ | ZR36057_ICR_INT_PIN_EN,
 		ZR36057_ICR);
 
 	set_frame(zr, 0);	// \FRAME
 
 	/* set the JPEG codec guest ID */
-	reg = (zr->card.gpcs[1] << ZR36057_JCGI_JPEGuestID) |
-	       (0 << ZR36057_JCGI_JPEGuestReg);
+	reg = (zr->card.gpcs[1] << ZR36057_JCGI_JPE_GUEST_ID) |
+	       (0 << ZR36057_JCGI_JPE_GUEST_REG);
 	btwrite(reg, ZR36057_JCGI);
 
 	if (zr->card.video_vfe == CODEC_TYPE_ZR36016 &&
@@ -656,10 +656,10 @@ void jpeg_start(struct zoran *zr)
 	}
 
 	/* assert Active */
-	btor(ZR36057_JPC_Active, ZR36057_JPC);
+	btor(ZR36057_JPC_ACTIVE, ZR36057_JPC);
 
 	/* enable the Go generation */
-	btor(ZR36057_JMC_Go_en, ZR36057_JMC);
+	btor(ZR36057_JMC_GO_EN, ZR36057_JMC);
 	udelay(30);
 
 	set_frame(zr, 1);	// /FRAME
@@ -679,7 +679,7 @@ void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 	cap.width = zr->jpg_settings.img_width;
 	cap.height = zr->jpg_settings.img_height;
 	cap.decimation =
-	    zr->jpg_settings.HorDcm | (zr->jpg_settings.VerDcm << 8);
+	    zr->jpg_settings.hor_dcm | (zr->jpg_settings.ver_dcm << 8);
 	cap.quality = zr->jpg_settings.jpg_comp.quality;
 
 	switch (mode) {
@@ -764,20 +764,20 @@ void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 	case BUZ_MODE_IDLE:
 	default:
 		/* shut down processing */
-		btand(~(zr->card.jpeg_int | ZR36057_ICR_JPEGRepIRQ),
+		btand(~(zr->card.jpeg_int | ZR36057_ICR_JPEG_REP_IRQ),
 		      ZR36057_ICR);
-		btwrite(zr->card.jpeg_int | ZR36057_ICR_JPEGRepIRQ,
+		btwrite(zr->card.jpeg_int | ZR36057_ICR_JPEG_REP_IRQ,
 			ZR36057_ISR);
-		btand(~ZR36057_JMC_Go_en, ZR36057_JMC);	// \Go_en
+		btand(~ZR36057_JMC_GO_EN, ZR36057_JMC);	// \Go_en
 
 		msleep(50);
 
 		set_videobus_dir(zr, 0);
 		set_frame(zr, 1);	// /FRAME
-		btor(ZR36057_MCTCR_CFlush, ZR36057_MCTCR);	// /CFlush
+		btor(ZR36057_MCTCR_C_FLUSH, ZR36057_MCTCR);	// /CFlush
 		btwrite(0, ZR36057_JPC);	// \P_Reset,\CodTrnsEn,\Active
 		btand(~ZR36057_JMC_VFIFO_FB, ZR36057_JMC);
-		btand(~ZR36057_JMC_SyncMstr, ZR36057_JMC);
+		btand(~ZR36057_JMC_SYNC_MSTR, ZR36057_JMC);
 		jpeg_codec_reset(zr);
 		jpeg_codec_sleep(zr, 1);
 		zr36057_adjust_vfe(zr, mode);
@@ -803,7 +803,7 @@ void zoran_feed_stat_com(struct zoran *zr)
 	unsigned long payload;
 
 	max_stat_com =
-	    (zr->jpg_settings.TmpDcm ==
+	    (zr->jpg_settings.tmp_dcm ==
 	     1) ? BUZ_NUM_STAT_COM : (BUZ_NUM_STAT_COM >> 1);
 
 	spin_lock_irqsave(&zr->queued_bufs_lock, flags);
@@ -822,7 +822,7 @@ void zoran_feed_stat_com(struct zoran *zr)
 		payload = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
 		if (payload == 0)
 			payload = zr->buffer_size;
-		if (zr->jpg_settings.TmpDcm == 1) {
+		if (zr->jpg_settings.tmp_dcm == 1) {
 			/* fill 1 stat_com entry */
 			i = (zr->jpg_dma_head -
 			     zr->jpg_err_shift) & BUZ_MASK_STAT_COM;
@@ -876,7 +876,7 @@ static void zoran_reap_stat_com(struct zoran *zr)
 
 	spin_lock_irqsave(&zr->queued_bufs_lock, flags);
 	while (zr->jpg_dma_tail < zr->jpg_dma_head) {
-		if (zr->jpg_settings.TmpDcm == 1)
+		if (zr->jpg_settings.tmp_dcm == 1)
 			i = (zr->jpg_dma_tail - zr->jpg_err_shift) & BUZ_MASK_STAT_COM;
 		else
 			i = ((zr->jpg_dma_tail - zr->jpg_err_shift) & 1) * 2 + 1;
@@ -901,10 +901,10 @@ static void zoran_reap_stat_com(struct zoran *zr)
 			dif = (seq - zr->jpg_seq_num) & 0xff;
 			zr->jpg_seq_num += dif;
 		}
-		buf->vbuf.sequence = zr->jpg_settings.TmpDcm ==
+		buf->vbuf.sequence = zr->jpg_settings.tmp_dcm ==
 		    2 ? (zr->jpg_seq_num >> 1) : zr->jpg_seq_num;
 		zr->inuse[i] = NULL;
-		if (zr->jpg_settings.TmpDcm != 1)
+		if (zr->jpg_settings.tmp_dcm != 1)
 			buf->vbuf.field = zr->jpg_settings.odd_even ?
 				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM;
 		else
@@ -926,13 +926,13 @@ irqreturn_t zoran_irq(int irq, void *dev_id)
 	astat = stat & IRQ_MASK;
 	if (astat & zr->card.vsync_int) {
 		if (zr->running == ZORAN_MAP_MODE_RAW) {
-			if ((btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_SnapShot) == 0)
+			if ((btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_SNAP_SHOT) == 0)
 				pci_warn(zr->pci_dev, "BuzIRQ with SnapShot off ???\n");
-			if ((btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_FrameGrab) == 0)
+			if ((btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_FRAME_GRAB) == 0)
 				zr_set_buf(zr);
 			return IRQ_HANDLED;
 		}
-		if (astat & ZR36057_ISR_JPEGRepIRQ) {
+		if (astat & ZR36057_ISR_JPEG_REP_IRQ) {
 			if (zr->codec_mode != BUZ_MODE_MOTION_DECOMPRESS &&
 			    zr->codec_mode != BUZ_MODE_MOTION_COMPRESS) {
 				pci_err(zr->pci_dev, "JPG IRQ when not in good mode\n");
@@ -999,13 +999,13 @@ void zr36057_restart(struct zoran *zr)
 {
 	btwrite(0, ZR36057_SPGPPCR);
 	udelay(1000);
-	btor(ZR36057_SPGPPCR_SoftReset, ZR36057_SPGPPCR);
+	btor(ZR36057_SPGPPCR_SOFT_RESET, ZR36057_SPGPPCR);
 	udelay(1000);
 
 	/* assert P_Reset */
 	btwrite(0, ZR36057_JPC);
 	/* set up GPIO direction - all output */
-	btwrite(ZR36057_SPGPPCR_SoftReset | 0, ZR36057_SPGPPCR);
+	btwrite(ZR36057_SPGPPCR_SOFT_RESET | 0, ZR36057_SPGPPCR);
 
 	/* set up GPIO pins and guest bus timing */
 	btwrite((0x81 << 24) | 0x8888, ZR36057_GPPGCR1);
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 9ea8ec3ef289..808196ea5b81 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -64,44 +64,44 @@ const struct zoran_format zoran_formats[] = {
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.depth = 15,
 		.flags = ZORAN_FORMAT_CAPTURE,
-		.vfespfr = ZR36057_VFESPFR_RGB555 | ZR36057_VFESPFR_ErrDif |
-			   ZR36057_VFESPFR_LittleEndian,
+		.vfespfr = ZR36057_VFESPFR_RGB555 | ZR36057_VFESPFR_ERR_DIF |
+			   ZR36057_VFESPFR_LITTLE_ENDIAN,
 	}, {
 		.name = "15-bit RGB BE",
 		.fourcc = V4L2_PIX_FMT_RGB555X,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.depth = 15,
 		.flags = ZORAN_FORMAT_CAPTURE,
-		.vfespfr = ZR36057_VFESPFR_RGB555 | ZR36057_VFESPFR_ErrDif,
+		.vfespfr = ZR36057_VFESPFR_RGB555 | ZR36057_VFESPFR_ERR_DIF,
 	}, {
 		.name = "16-bit RGB LE",
 		.fourcc = V4L2_PIX_FMT_RGB565,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.depth = 16,
 		.flags = ZORAN_FORMAT_CAPTURE,
-		.vfespfr = ZR36057_VFESPFR_RGB565 | ZR36057_VFESPFR_ErrDif |
-			   ZR36057_VFESPFR_LittleEndian,
+		.vfespfr = ZR36057_VFESPFR_RGB565 | ZR36057_VFESPFR_ERR_DIF |
+			   ZR36057_VFESPFR_LITTLE_ENDIAN,
 	}, {
 		.name = "16-bit RGB BE",
 		.fourcc = V4L2_PIX_FMT_RGB565X,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.depth = 16,
 		.flags = ZORAN_FORMAT_CAPTURE,
-		.vfespfr = ZR36057_VFESPFR_RGB565 | ZR36057_VFESPFR_ErrDif,
+		.vfespfr = ZR36057_VFESPFR_RGB565 | ZR36057_VFESPFR_ERR_DIF,
 	}, {
 		.name = "24-bit RGB",
 		.fourcc = V4L2_PIX_FMT_BGR24,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.depth = 24,
 		.flags = ZORAN_FORMAT_CAPTURE,
-		.vfespfr = ZR36057_VFESPFR_RGB888 | ZR36057_VFESPFR_Pack24,
+		.vfespfr = ZR36057_VFESPFR_RGB888 | ZR36057_VFESPFR_PACK24,
 	}, {
 		.name = "32-bit RGB LE",
 		.fourcc = V4L2_PIX_FMT_BGR32,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.depth = 32,
 		.flags = ZORAN_FORMAT_CAPTURE,
-		.vfespfr = ZR36057_VFESPFR_RGB888 | ZR36057_VFESPFR_LittleEndian,
+		.vfespfr = ZR36057_VFESPFR_RGB888 | ZR36057_VFESPFR_LITTLE_ENDIAN,
 	}, {
 		.name = "32-bit RGB BE",
 		.fourcc = V4L2_PIX_FMT_RGB32,
@@ -122,7 +122,7 @@ const struct zoran_format zoran_formats[] = {
 		.colorspace = V4L2_COLORSPACE_SMPTE170M,
 		.depth = 16,
 		.flags = ZORAN_FORMAT_CAPTURE,
-		.vfespfr = ZR36057_VFESPFR_YUV422 | ZR36057_VFESPFR_LittleEndian,
+		.vfespfr = ZR36057_VFESPFR_YUV422 | ZR36057_VFESPFR_LITTLE_ENDIAN,
 	}, {
 		.name = "Hardware-encoded Motion-JPEG",
 		.fourcc = V4L2_PIX_FMT_MJPEG,
@@ -143,7 +143,7 @@ const struct zoran_format zoran_formats[] = {
 	 */
 static __u32 zoran_v4l2_calc_bufsize(struct zoran_jpg_settings *settings)
 {
-	__u8 div = settings->VerDcm * settings->HorDcm * settings->TmpDcm;
+	__u8 div = settings->ver_dcm * settings->hor_dcm * settings->tmp_dcm;
 	__u32 num = (1024 * 512) / (div);
 	__u32 result = 2;
 
@@ -307,12 +307,12 @@ static int zoran_g_fmt_vid_out(struct file *file, void *__fh,
 {
 	struct zoran *zr = video_drvdata(file);
 
-	fmt->fmt.pix.width = zr->jpg_settings.img_width / zr->jpg_settings.HorDcm;
+	fmt->fmt.pix.width = zr->jpg_settings.img_width / zr->jpg_settings.hor_dcm;
 	fmt->fmt.pix.height = zr->jpg_settings.img_height * 2 /
-		(zr->jpg_settings.VerDcm * zr->jpg_settings.TmpDcm);
+		(zr->jpg_settings.ver_dcm * zr->jpg_settings.tmp_dcm);
 	fmt->fmt.pix.sizeimage = zr->buffer_size;
 	fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_MJPEG;
-	if (zr->jpg_settings.TmpDcm == 1)
+	if (zr->jpg_settings.tmp_dcm == 1)
 		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
 				V4L2_FIELD_SEQ_TB : V4L2_FIELD_SEQ_BT);
 	else
@@ -358,26 +358,26 @@ static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 
 	/* we actually need to set 'real' parameters now */
 	if ((fmt->fmt.pix.height * 2) > BUZ_MAX_HEIGHT)
-		settings.TmpDcm = 1;
+		settings.tmp_dcm = 1;
 	else
-		settings.TmpDcm = 2;
+		settings.tmp_dcm = 2;
 	settings.decimation = 0;
 	if (fmt->fmt.pix.height <= zr->jpg_settings.img_height / 2)
-		settings.VerDcm = 2;
+		settings.ver_dcm = 2;
 	else
-		settings.VerDcm = 1;
+		settings.ver_dcm = 1;
 	if (fmt->fmt.pix.width <= zr->jpg_settings.img_width / 4)
-		settings.HorDcm = 4;
+		settings.hor_dcm = 4;
 	else if (fmt->fmt.pix.width <= zr->jpg_settings.img_width / 2)
-		settings.HorDcm = 2;
+		settings.hor_dcm = 2;
 	else
-		settings.HorDcm = 1;
-	if (settings.TmpDcm == 1)
+		settings.hor_dcm = 1;
+	if (settings.tmp_dcm == 1)
 		settings.field_per_buff = 2;
 	else
 		settings.field_per_buff = 1;
 
-	if (settings.HorDcm > 1) {
+	if (settings.hor_dcm > 1) {
 		settings.img_x = (BUZ_MAX_WIDTH == 720) ? 8 : 0;
 		settings.img_width = (BUZ_MAX_WIDTH == 720) ? 704 : BUZ_MAX_WIDTH;
 	} else {
@@ -391,10 +391,10 @@ static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 		return res;
 
 	/* tell the user what we actually did */
-	fmt->fmt.pix.width = settings.img_width / settings.HorDcm;
+	fmt->fmt.pix.width = settings.img_width / settings.hor_dcm;
 	fmt->fmt.pix.height = settings.img_height * 2 /
-		(settings.TmpDcm * settings.VerDcm);
-	if (settings.TmpDcm == 1)
+		(settings.tmp_dcm * settings.ver_dcm);
+	if (settings.tmp_dcm == 1)
 		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
 				V4L2_FIELD_SEQ_TB : V4L2_FIELD_SEQ_BT);
 	else
@@ -462,26 +462,26 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 
 	/* we actually need to set 'real' parameters now */
 	if (fmt->fmt.pix.height * 2 > BUZ_MAX_HEIGHT)
-		settings.TmpDcm = 1;
+		settings.tmp_dcm = 1;
 	else
-		settings.TmpDcm = 2;
+		settings.tmp_dcm = 2;
 	settings.decimation = 0;
 	if (fmt->fmt.pix.height <= zr->jpg_settings.img_height / 2)
-		settings.VerDcm = 2;
+		settings.ver_dcm = 2;
 	else
-		settings.VerDcm = 1;
+		settings.ver_dcm = 1;
 	if (fmt->fmt.pix.width <= zr->jpg_settings.img_width / 4)
-		settings.HorDcm = 4;
+		settings.hor_dcm = 4;
 	else if (fmt->fmt.pix.width <= zr->jpg_settings.img_width / 2)
-		settings.HorDcm = 2;
+		settings.hor_dcm = 2;
 	else
-		settings.HorDcm = 1;
-	if (settings.TmpDcm == 1)
+		settings.hor_dcm = 1;
+	if (settings.tmp_dcm == 1)
 		settings.field_per_buff = 2;
 	else
 		settings.field_per_buff = 1;
 
-	if (settings.HorDcm > 1) {
+	if (settings.hor_dcm > 1) {
 		settings.img_x = (BUZ_MAX_WIDTH == 720) ? 8 : 0;
 		settings.img_width = (BUZ_MAX_WIDTH == 720) ? 704 : BUZ_MAX_WIDTH;
 	} else {
@@ -505,10 +505,10 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 	zr->buffer_size = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
 
 	/* tell the user what we actually did */
-	fmt->fmt.pix.width = settings.img_width / settings.HorDcm;
+	fmt->fmt.pix.width = settings.img_width / settings.hor_dcm;
 	fmt->fmt.pix.height = settings.img_height * 2 /
-		(settings.TmpDcm * settings.VerDcm);
-	if (settings.TmpDcm == 1)
+		(settings.tmp_dcm * settings.ver_dcm);
+	if (settings.tmp_dcm == 1)
 		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
 				V4L2_FIELD_SEQ_TB : V4L2_FIELD_SEQ_BT);
 	else
@@ -874,14 +874,14 @@ int zr_set_buf(struct zoran *zr)
 
 	spin_lock_irqsave(&zr->queued_bufs_lock, flags);
 	if (list_empty(&zr->queued_bufs)) {
-		btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
+		btand(~ZR36057_ICR_INT_PIN_EN, ZR36057_ICR);
 		vb2_queue_error(zr->video_dev->queue);
 		spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
 		return -EINVAL;
 	}
 	buf = list_first_entry_or_null(&zr->queued_bufs, struct zr_buffer, queue);
 	if (!buf) {
-		btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
+		btand(~ZR36057_ICR_INT_PIN_EN, ZR36057_ICR);
 		vb2_queue_error(zr->video_dev->queue);
 		spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
 		return -EINVAL;
@@ -907,13 +907,13 @@ int zr_set_buf(struct zoran *zr)
 	reg = 0;
 	if (zr->v4l_settings.height > BUZ_MAX_HEIGHT / 2)
 		reg += zr->v4l_settings.bytesperline;
-	reg = (reg << ZR36057_VSSFGR_DispStride);
-	reg |= ZR36057_VSSFGR_VidOvf;
-	reg |= ZR36057_VSSFGR_SnapShot;
-	reg |= ZR36057_VSSFGR_FrameGrab;
+	reg = (reg << ZR36057_VSSFGR_DISP_STRIDE);
+	reg |= ZR36057_VSSFGR_VID_OVF;
+	reg |= ZR36057_VSSFGR_SNAP_SHOT;
+	reg |= ZR36057_VSSFGR_FRAME_GRAB;
 	btwrite(reg, ZR36057_VSSFGR);
 
-	btor(ZR36057_VDCR_VidEn, ZR36057_VDCR);
+	btor(ZR36057_VDCR_VID_EN, ZR36057_VDCR);
 	return 0;
 }
 
@@ -938,7 +938,7 @@ static int zr_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 		zoran_feed_stat_com(zr);
 		jpeg_start(zr);
 		zr->running = zr->map_mode;
-		btor(ZR36057_ICR_IntPinEn, ZR36057_ICR);
+		btor(ZR36057_ICR_INT_PIN_EN, ZR36057_ICR);
 		return 0;
 	}
 
@@ -949,7 +949,7 @@ static int zr_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	zr36057_enable_jpg(zr, BUZ_MODE_IDLE);
 	zr36057_set_memgrab(zr, 1);
 	zr->running = zr->map_mode;
-	btor(ZR36057_ICR_IntPinEn, ZR36057_ICR);
+	btor(ZR36057_ICR_INT_PIN_EN, ZR36057_ICR);
 	return 0;
 }
 
@@ -960,7 +960,7 @@ static void zr_vb2_stop_streaming(struct vb2_queue *vq)
 	unsigned long flags;
 	int j;
 
-	btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
+	btand(~ZR36057_ICR_INT_PIN_EN, ZR36057_ICR);
 	if (zr->map_mode != ZORAN_MAP_MODE_RAW)
 		zr36057_enable_jpg(zr, BUZ_MODE_IDLE);
 	zr36057_set_memgrab(zr, 0);
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 046cffb92f5f..2d7dc7abde79 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -244,7 +244,7 @@ static int zr36016_set_video(struct videocodec *codec, const struct tvnorm *norm
 	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 
 	dprintk(2, "%s: set_video %d.%d, %d/%d-%dx%d (0x%x) call\n",
-		ptr->name, norm->HStart, norm->VStart,
+		ptr->name, norm->h_start, norm->v_start,
 		cap->x, cap->y, cap->width, cap->height,
 		cap->decimation);
 
@@ -254,17 +254,17 @@ static int zr36016_set_video(struct videocodec *codec, const struct tvnorm *norm
 	ptr->width = cap->width;
 	ptr->height = cap->height;
 	/* (Ronald) This is ugly. zoran_device.c, line 387
-	 * already mentions what happens if HStart is even
+	 * already mentions what happens if h_start is even
 	 * (blue faces, etc., cr/cb inversed). There's probably
-	 * some good reason why HStart is 0 instead of 1, so I'm
+	 * some good reason why h_start is 0 instead of 1, so I'm
 	 * leaving it to this for now, but really... This can be
 	 * done a lot simpler */
-	ptr->xoff = (norm->HStart ? norm->HStart : 1) + cap->x;
+	ptr->xoff = (norm->h_start ? norm->h_start : 1) + cap->x;
 	/* Something to note here (I don't understand it), setting
-	 * VStart too high will cause the codec to 'not work'. I
-	 * really don't get it. values of 16 (VStart) already break
+	 * v_start too high will cause the codec to 'not work'. I
+	 * really don't get it. values of 16 (v_start) already break
 	 * it here. Just '0' seems to work. More testing needed! */
-	ptr->yoff = norm->VStart + cap->y;
+	ptr->yoff = norm->v_start + cap->y;
 	/* (Ronald) dzjeeh, can't this thing do hor_decimation = 4? */
 	ptr->xdec = ((cap->decimation & 0xff) == 1) ? 0 : 1;
 	ptr->ydec = (((cap->decimation >> 8) & 0xff) == 1) ? 0 : 1;
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 348b9f0ab74c..2826f4e5d37b 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -561,7 +561,7 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 	int size;
 
 	dprintk(2, "%s: set_video %d.%d, %d/%d-%dx%d (0x%x) q%d call\n",
-		ptr->name, norm->HStart, norm->VStart,
+		ptr->name, norm->h_start, norm->v_start,
 		cap->x, cap->y, cap->width, cap->height,
 		cap->decimation, cap->quality);
 	/* if () return -EINVAL;
diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index b0ec4a7ffda2..71b651add35a 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -11,86 +11,86 @@
 /* Zoran ZR36057 registers */
 
 #define ZR36057_VFEHCR          0x000	/* Video Front End, Horizontal Configuration Register */
-#define ZR36057_VFEHCR_HSPol             BIT(30)
-#define ZR36057_VFEHCR_HStart           10
-#define ZR36057_VFEHCR_HEnd		0
-#define ZR36057_VFEHCR_Hmask		0x3ff
+#define ZR36057_VFEHCR_HS_POL             BIT(30)
+#define ZR36057_VFEHCR_H_START           10
+#define ZR36057_VFEHCR_H_END		0
+#define ZR36057_VFEHCR_HMASK		0x3ff
 
 #define ZR36057_VFEVCR          0x004	/* Video Front End, Vertical Configuration Register */
-#define ZR36057_VFEVCR_VSPol             BIT(30)
-#define ZR36057_VFEVCR_VStart           10
-#define ZR36057_VFEVCR_VEnd		0
-#define ZR36057_VFEVCR_Vmask		0x3ff
+#define ZR36057_VFEVCR_VS_POL             BIT(30)
+#define ZR36057_VFEVCR_V_START           10
+#define ZR36057_VFEVCR_V_END		0
+#define ZR36057_VFEVCR_VMASK		0x3ff
 
 #define ZR36057_VFESPFR         0x008	/* Video Front End, Scaler and Pixel Format Register */
-#define ZR36057_VFESPFR_ExtFl            BIT(26)
-#define ZR36057_VFESPFR_TopField         BIT(25)
-#define ZR36057_VFESPFR_VCLKPol          BIT(24)
-#define ZR36057_VFESPFR_HFilter         21
-#define ZR36057_VFESPFR_HorDcm          14
-#define ZR36057_VFESPFR_VerDcm          8
-#define ZR36057_VFESPFR_DispMode        6
+#define ZR36057_VFESPFR_EXT_FL            BIT(26)
+#define ZR36057_VFESPFR_TOP_FIELD         BIT(25)
+#define ZR36057_VFESPFR_VCLK_POL          BIT(24)
+#define ZR36057_VFESPFR_H_FILTER         21
+#define ZR36057_VFESPFR_HOR_DCM          14
+#define ZR36057_VFESPFR_VER_DCM          8
+#define ZR36057_VFESPFR_DISP_MODE        6
 #define ZR36057_VFESPFR_YUV422          (0<<3)
 #define ZR36057_VFESPFR_RGB888          (1<<3)
 #define ZR36057_VFESPFR_RGB565          (2<<3)
 #define ZR36057_VFESPFR_RGB555          (3<<3)
-#define ZR36057_VFESPFR_ErrDif          (1<<2)
-#define ZR36057_VFESPFR_Pack24          (1<<1)
-#define ZR36057_VFESPFR_LittleEndian    (1<<0)
+#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
+#define ZR36057_VFESPFR_PACK24          (1<<1)
+#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
 
 #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
 
 #define ZR36057_VDBR            0x010	/* Video Display "Bottom" Register */
 
 #define ZR36057_VSSFGR          0x014	/* Video Stride, Status, and Frame Grab Register */
-#define ZR36057_VSSFGR_DispStride       16
-#define ZR36057_VSSFGR_VidOvf            BIT(8)
-#define ZR36057_VSSFGR_SnapShot          BIT(1)
-#define ZR36057_VSSFGR_FrameGrab         BIT(0)
+#define ZR36057_VSSFGR_DISP_STRIDE       16
+#define ZR36057_VSSFGR_VID_OVF            BIT(8)
+#define ZR36057_VSSFGR_SNAP_SHOT          BIT(1)
+#define ZR36057_VSSFGR_FRAME_GRAB         BIT(0)
 
 #define ZR36057_VDCR            0x018	/* Video Display Configuration Register */
-#define ZR36057_VDCR_VidEn               BIT(31)
-#define ZR36057_VDCR_MinPix             24
-#define ZR36057_VDCR_Triton              BIT(24)
-#define ZR36057_VDCR_VidWinHt           12
-#define ZR36057_VDCR_VidWinWid          0
+#define ZR36057_VDCR_VID_EN               BIT(31)
+#define ZR36057_VDCR_MIN_PIX             24
+#define ZR36057_VDCR_TRITON              BIT(24)
+#define ZR36057_VDCR_VID_WIN_HT           12
+#define ZR36057_VDCR_VID_WIN_WID          0
 
 #define ZR36057_MMTR            0x01c	/* Masking Map "Top" Register */
 
 #define ZR36057_MMBR            0x020	/* Masking Map "Bottom" Register */
 
 #define ZR36057_OCR             0x024	/* Overlay Control Register */
-#define ZR36057_OCR_OvlEnable            BIT(15)
-#define ZR36057_OCR_MaskStride          0
+#define ZR36057_OCR_OVL_ENABLE            BIT(15)
+#define ZR36057_OCR_MASK_STRIDE          0
 
 #define ZR36057_SPGPPCR         0x028	/* System, PCI, and General Purpose Pins Control Register */
-#define ZR36057_SPGPPCR_SoftReset	 BIT(24)
+#define ZR36057_SPGPPCR_SOFT_RESET	 BIT(24)
 
 #define ZR36057_GPPGCR1         0x02c	/* General Purpose Pins and GuestBus Control Register (1) */
 
 #define ZR36057_MCSAR           0x030	/* MPEG Code Source Address Register */
 
 #define ZR36057_MCTCR           0x034	/* MPEG Code Transfer Control Register */
-#define ZR36057_MCTCR_CodTime            BIT(30)
-#define ZR36057_MCTCR_CEmpty             BIT(29)
-#define ZR36057_MCTCR_CFlush             BIT(28)
-#define ZR36057_MCTCR_CodGuestID	20
-#define ZR36057_MCTCR_CodGuestReg	16
+#define ZR36057_MCTCR_COD_TIME            BIT(30)
+#define ZR36057_MCTCR_C_EMPTY             BIT(29)
+#define ZR36057_MCTCR_C_FLUSH             BIT(28)
+#define ZR36057_MCTCR_COD_GUEST_ID	20
+#define ZR36057_MCTCR_COD_GUEST_REG	16
 
 #define ZR36057_MCMPR           0x038	/* MPEG Code Memory Pointer Register */
 
 #define ZR36057_ISR             0x03c	/* Interrupt Status Register */
 #define ZR36057_ISR_GIRQ1                BIT(30)
 #define ZR36057_ISR_GIRQ0                BIT(29)
-#define ZR36057_ISR_CodRepIRQ            BIT(28)
-#define ZR36057_ISR_JPEGRepIRQ           BIT(27)
+#define ZR36057_ISR_COD_REP_IRQ            BIT(28)
+#define ZR36057_ISR_JPEG_REP_IRQ           BIT(27)
 
 #define ZR36057_ICR             0x040	/* Interrupt Control Register */
 #define ZR36057_ICR_GIRQ1                BIT(30)
 #define ZR36057_ICR_GIRQ0                BIT(29)
-#define ZR36057_ICR_CodRepIRQ            BIT(28)
-#define ZR36057_ICR_JPEGRepIRQ           BIT(27)
-#define ZR36057_ICR_IntPinEn             BIT(24)
+#define ZR36057_ICR_COD_REP_IRQ            BIT(28)
+#define ZR36057_ICR_JPEG_REP_IRQ           BIT(27)
+#define ZR36057_ICR_INT_PIN_EN             BIT(24)
 
 #define ZR36057_I2CBR           0x044	/* I2C Bus Register */
 #define ZR36057_I2CBR_SDA		 BIT(1)
@@ -98,30 +98,30 @@
 
 #define ZR36057_JMC             0x100	/* JPEG Mode and Control */
 #define ZR36057_JMC_JPG                  BIT(31)
-#define ZR36057_JMC_JPGExpMode          (0 << 29)
-#define ZR36057_JMC_JPGCmpMode           BIT(29)
-#define ZR36057_JMC_MJPGExpMode         (2 << 29)
-#define ZR36057_JMC_MJPGCmpMode         (3 << 29)
+#define ZR36057_JMC_JPG_EXP_MODE          (0 << 29)
+#define ZR36057_JMC_JPG_CMP_MODE           BIT(29)
+#define ZR36057_JMC_MJPG_EXP_MODE         (2 << 29)
+#define ZR36057_JMC_MJPG_CMP_MODE         (3 << 29)
 #define ZR36057_JMC_RTBUSY_FB            BIT(6)
-#define ZR36057_JMC_Go_en                BIT(5)
-#define ZR36057_JMC_SyncMstr             BIT(4)
-#define ZR36057_JMC_Fld_per_buff         BIT(3)
+#define ZR36057_JMC_GO_EN                BIT(5)
+#define ZR36057_JMC_SYNC_MSTR             BIT(4)
+#define ZR36057_JMC_FLD_PER_BUFF         BIT(3)
 #define ZR36057_JMC_VFIFO_FB             BIT(2)
 #define ZR36057_JMC_CFIFO_FB             BIT(1)
-#define ZR36057_JMC_Stll_LitEndian       BIT(0)
+#define ZR36057_JMC_STLL_LIT_ENDIAN       BIT(0)
 
 #define ZR36057_JPC             0x104	/* JPEG Process Control */
-#define ZR36057_JPC_P_Reset              BIT(7)
-#define ZR36057_JPC_CodTrnsEn            BIT(5)
-#define ZR36057_JPC_Active               BIT(0)
+#define ZR36057_JPC_P_RESET              BIT(7)
+#define ZR36057_JPC_COD_TRNS_EN            BIT(5)
+#define ZR36057_JPC_ACTIVE               BIT(0)
 
 #define ZR36057_VSP             0x108	/* Vertical Sync Parameters */
-#define ZR36057_VSP_VsyncSize           16
-#define ZR36057_VSP_FrmTot              0
+#define ZR36057_VSP_VSYNC_SIZE           16
+#define ZR36057_VSP_FRM_TOT              0
 
 #define ZR36057_HSP             0x10c	/* Horizontal Sync Parameters */
-#define ZR36057_HSP_HsyncStart          16
-#define ZR36057_HSP_LineTot             0
+#define ZR36057_HSP_HSYNC_START          16
+#define ZR36057_HSP_LINE_TOT             0
 
 #define ZR36057_FHAP            0x110	/* Field Horizontal Active Portion */
 #define ZR36057_FHAP_NAX                16
@@ -132,22 +132,22 @@
 #define ZR36057_FVAP_PAY                0
 
 #define ZR36057_FPP             0x118	/* Field Process Parameters */
-#define ZR36057_FPP_Odd_Even             BIT(0)
+#define ZR36057_FPP_ODD_EVEN             BIT(0)
 
 #define ZR36057_JCBA            0x11c	/* JPEG Code Base Address */
 
 #define ZR36057_JCFT            0x120	/* JPEG Code FIFO Threshold */
 
 #define ZR36057_JCGI            0x124	/* JPEG Codec Guest ID */
-#define ZR36057_JCGI_JPEGuestID         4
-#define ZR36057_JCGI_JPEGuestReg        0
+#define ZR36057_JCGI_JPE_GUEST_ID         4
+#define ZR36057_JCGI_JPE_GUEST_REG        0
 
 #define ZR36057_GCR2            0x12c	/* GuestBus Control Register (2) */
 
 #define ZR36057_POR             0x200	/* Post Office Register */
-#define ZR36057_POR_POPen                BIT(25)
-#define ZR36057_POR_POTime               BIT(24)
-#define ZR36057_POR_PODir                BIT(23)
+#define ZR36057_POR_PO_PEN                BIT(25)
+#define ZR36057_POR_PO_TIME               BIT(24)
+#define ZR36057_POR_PO_DIR                BIT(23)
 
 #define ZR36057_STR             0x300	/* "Still" Transfer Register */
 
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 773de0e64daf..4f9eb9ff2c42 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -106,7 +106,7 @@ static void zr36060_wait_end(struct zr36060 *ptr)
 {
 	int i = 0;
 
-	while (zr36060_read_status(ptr) & ZR060_CFSR_Busy) {
+	while (zr36060_read_status(ptr) & ZR060_CFSR_BUSY) {
 		udelay(1);
 		if (i++ > 200000) {	// 200ms, there is for sure something wrong!!!
 			dprintk(1,
@@ -127,7 +127,7 @@ static int zr36060_basic_test(struct zr36060 *ptr)
 	}
 
 	zr36060_wait_end(ptr);
-	if (ptr->status & ZR060_CFSR_Busy) {
+	if (ptr->status & ZR060_CFSR_BUSY) {
 		pr_err("%s: attach failed, jpeg processor failed (end flag)!\n", ptr->name);
 		return -EBUSY;
 	}
@@ -328,14 +328,14 @@ static void zr36060_init(struct zr36060 *ptr)
 	if (ptr->mode == CODEC_DO_COMPRESSION) {
 		dprintk(2, "%s: COMPRESSION SETUP\n", ptr->name);
 
-		zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SyncRst);
+		zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SYNC_RST);
 
 		/* 060 communicates with 067 in master mode */
-		zr36060_write(ptr, ZR060_CIR, ZR060_CIR_CodeMstr);
+		zr36060_write(ptr, ZR060_CIR, ZR060_CIR_CODE_MSTR);
 
 		/* Compression with or without variable scale factor */
 		/*FIXME: What about ptr->bitrate_ctrl? */
-		zr36060_write(ptr, ZR060_CMR, ZR060_CMR_Comp | ZR060_CMR_Pass2 | ZR060_CMR_BRB);
+		zr36060_write(ptr, ZR060_CMR, ZR060_CMR_COMP | ZR060_CMR_PASS2 | ZR060_CMR_BRB);
 
 		/* Must be zero */
 		zr36060_write(ptr, ZR060_MBZ, 0x00);
@@ -403,20 +403,20 @@ static void zr36060_init(struct zr36060 *ptr)
 		/* JPEG markers to be included in the compressed stream */
 		zr36060_write(ptr, ZR060_MER,
 			      ZR060_MER_DQT | ZR060_MER_DHT |
-			      ((ptr->com.len > 0) ? ZR060_MER_Com : 0) |
-			      ((ptr->app.len > 0) ? ZR060_MER_App : 0));
+			      ((ptr->com.len > 0) ? ZR060_MER_COM : 0) |
+			      ((ptr->app.len > 0) ? ZR060_MER_APP : 0));
 
 		/* Setup the Video Frontend */
 		/* Limit pixel range to 16..235 as per CCIR-601 */
-		zr36060_write(ptr, ZR060_VCR, ZR060_VCR_Range);
+		zr36060_write(ptr, ZR060_VCR, ZR060_VCR_RANGE);
 
 	} else {
 		dprintk(2, "%s: EXPANSION SETUP\n", ptr->name);
 
-		zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SyncRst);
+		zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SYNC_RST);
 
 		/* 060 communicates with 067 in master mode */
-		zr36060_write(ptr, ZR060_CIR, ZR060_CIR_CodeMstr);
+		zr36060_write(ptr, ZR060_CIR, ZR060_CIR_CODE_MSTR);
 
 		/* Decompression */
 		zr36060_write(ptr, ZR060_CMR, 0);
@@ -436,17 +436,17 @@ static void zr36060_init(struct zr36060 *ptr)
 		zr36060_pushit(ptr, ZR060_DHT_IDX, sizeof(zr36060_dht), zr36060_dht);
 
 		/* Setup the Video Frontend */
-		//zr36060_write(ptr, ZR060_VCR, ZR060_VCR_FIExt);
+		//zr36060_write(ptr, ZR060_VCR, ZR060_VCR_FI_EXT);
 		//this doesn't seem right and doesn't work...
-		zr36060_write(ptr, ZR060_VCR, ZR060_VCR_Range);
+		zr36060_write(ptr, ZR060_VCR, ZR060_VCR_RANGE);
 	}
 
 	/* Load the tables */
-	zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SyncRst | ZR060_LOAD_Load);
+	zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SYNC_RST | ZR060_LOAD_LOAD);
 	zr36060_wait_end(ptr);
 	dprintk(2, "%s: Status after table preload: 0x%02x\n", ptr->name, ptr->status);
 
-	if (ptr->status & ZR060_CFSR_Busy) {
+	if (ptr->status & ZR060_CFSR_BUSY) {
 		pr_err("%s: init aborted!\n", ptr->name);
 		return;		// something is wrong, its timed out!!!!
 	}
@@ -494,21 +494,21 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 	ptr->width = cap->width / (cap->decimation & 0xff);
 	ptr->height = cap->height / (cap->decimation >> 8);
 
-	zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SyncRst);
+	zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SYNC_RST);
 
 	/* Note that VSPol/HSPol bits in zr36060 have the opposite
 	 * meaning of their zr360x7 counterparts with the same names
 	 * N.b. for VSPol this is only true if FIVEdge = 0 (default,
 	 * left unchanged here - in accordance with datasheet).
 	 */
-	reg = (!pol->vsync_pol ? ZR060_VPR_VSPol : 0)
-	    | (!pol->hsync_pol ? ZR060_VPR_HSPol : 0)
-	    | (pol->field_pol ? ZR060_VPR_FIPol : 0)
-	    | (pol->blank_pol ? ZR060_VPR_BLPol : 0)
-	    | (pol->subimg_pol ? ZR060_VPR_SImgPol : 0)
-	    | (pol->poe_pol ? ZR060_VPR_PoePol : 0)
-	    | (pol->pvalid_pol ? ZR060_VPR_PValPol : 0)
-	    | (pol->vclk_pol ? ZR060_VPR_VCLKPol : 0);
+	reg = (!pol->vsync_pol ? ZR060_VPR_VS_POL : 0)
+	    | (!pol->hsync_pol ? ZR060_VPR_HS_POL : 0)
+	    | (pol->field_pol ? ZR060_VPR_FI_POL : 0)
+	    | (pol->blank_pol ? ZR060_VPR_BL_POL : 0)
+	    | (pol->subimg_pol ? ZR060_VPR_S_IMG_POL : 0)
+	    | (pol->poe_pol ? ZR060_VPR_POE_POL : 0)
+	    | (pol->pvalid_pol ? ZR060_VPR_P_VAL_POL : 0)
+	    | (pol->vclk_pol ? ZR060_VPR_VCLK_POL : 0);
 	zr36060_write(ptr, ZR060_VPR, reg);
 
 	reg = 0;
@@ -518,11 +518,11 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 		break;
 
 	case 2:
-		reg |= ZR060_SR_HScale2;
+		reg |= ZR060_SR_H_SCALE2;
 		break;
 
 	case 4:
-		reg |= ZR060_SR_HScale4;
+		reg |= ZR060_SR_H_SCALE4;
 		break;
 	}
 
@@ -532,7 +532,7 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 		break;
 
 	case 2:
-		reg |= ZR060_SR_VScale;
+		reg |= ZR060_SR_V_SCALE;
 		break;
 	}
 	zr36060_write(ptr, ZR060_SR, reg);
@@ -543,11 +543,11 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 
 	/* sync generator */
 
-	reg = norm->Ht - 1;	/* Vtotal */
+	reg = norm->ht - 1;	/* Vtotal */
 	zr36060_write(ptr, ZR060_SGR_VTOTAL_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_SGR_VTOTAL_LO, (reg >> 0) & 0xff);
 
-	reg = norm->Wt - 1;	/* Htotal */
+	reg = norm->wt - 1;	/* Htotal */
 	zr36060_write(ptr, ZR060_SGR_HTOTAL_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_SGR_HTOTAL_LO, (reg >> 0) & 0xff);
 
@@ -559,22 +559,22 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 	reg = 68;
 	zr36060_write(ptr, ZR060_SGR_HSYNC, reg);
 
-	reg = norm->VStart - 1;	/* BVstart */
+	reg = norm->v_start - 1;	/* BVstart */
 	zr36060_write(ptr, ZR060_SGR_BVSTART, reg);
 
-	reg += norm->Ha / 2;	/* BVend */
+	reg += norm->ha / 2;	/* BVend */
 	zr36060_write(ptr, ZR060_SGR_BVEND_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_SGR_BVEND_LO, (reg >> 0) & 0xff);
 
-	reg = norm->HStart - 1;	/* BHstart */
+	reg = norm->h_start - 1;	/* BHstart */
 	zr36060_write(ptr, ZR060_SGR_BHSTART, reg);
 
-	reg += norm->Wa;	/* BHend */
+	reg += norm->wa;	/* BHend */
 	zr36060_write(ptr, ZR060_SGR_BHEND_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_SGR_BHEND_LO, (reg >> 0) & 0xff);
 
 	/* active area */
-	reg = cap->y + norm->VStart;	/* Vstart */
+	reg = cap->y + norm->v_start;	/* Vstart */
 	zr36060_write(ptr, ZR060_AAR_VSTART_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_AAR_VSTART_LO, (reg >> 0) & 0xff);
 
@@ -582,7 +582,7 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 	zr36060_write(ptr, ZR060_AAR_VEND_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_AAR_VEND_LO, (reg >> 0) & 0xff);
 
-	reg = cap->x + norm->HStart;	/* Hstart */
+	reg = cap->x + norm->h_start;	/* Hstart */
 	zr36060_write(ptr, ZR060_AAR_HSTART_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_AAR_HSTART_LO, (reg >> 0) & 0xff);
 
@@ -591,19 +591,19 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 	zr36060_write(ptr, ZR060_AAR_HEND_LO, (reg >> 0) & 0xff);
 
 	/* subimage area */
-	reg = norm->VStart - 4;	/* SVstart */
+	reg = norm->v_start - 4;	/* SVstart */
 	zr36060_write(ptr, ZR060_SWR_VSTART_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_SWR_VSTART_LO, (reg >> 0) & 0xff);
 
-	reg += norm->Ha / 2 + 8;	/* SVend */
+	reg += norm->ha / 2 + 8;	/* SVend */
 	zr36060_write(ptr, ZR060_SWR_VEND_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_SWR_VEND_LO, (reg >> 0) & 0xff);
 
-	reg = norm->HStart /*+ 64 */  - 4;	/* SHstart */
+	reg = norm->h_start /*+ 64 */  - 4;	/* SHstart */
 	zr36060_write(ptr, ZR060_SWR_HSTART_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_SWR_HSTART_LO, (reg >> 0) & 0xff);
 
-	reg += norm->Wa + 8;	/* SHend */
+	reg += norm->wa + 8;	/* SHend */
 	zr36060_write(ptr, ZR060_SWR_HEND_HI, (reg >> 8) & 0xff);
 	zr36060_write(ptr, ZR060_SWR_HEND_LO, (reg >> 0) & 0xff);
 
diff --git a/drivers/staging/media/zoran/zr36060.h b/drivers/staging/media/zoran/zr36060.h
index 9289a9921c03..d2cdc26bf625 100644
--- a/drivers/staging/media/zoran/zr36060.h
+++ b/drivers/staging/media/zoran/zr36060.h
@@ -124,35 +124,35 @@ struct zr36060 {
 
 /* ZR36060 LOAD register bits */
 
-#define ZR060_LOAD_Load			 BIT(7)
-#define ZR060_LOAD_SyncRst		 BIT(0)
+#define ZR060_LOAD_LOAD			 BIT(7)
+#define ZR060_LOAD_SYNC_RST		 BIT(0)
 
 /* ZR36060 Code FIFO Status register bits */
 
-#define ZR060_CFSR_Busy			 BIT(7)
-#define ZR060_CFSR_CBusy		 BIT(2)
+#define ZR060_CFSR_BUSY			 BIT(7)
+#define ZR060_CFSR_C_BUSY		 BIT(2)
 #define ZR060_CFSR_CFIFO		(3 << 0)
 
 /* ZR36060 Code Interface register */
 
-#define ZR060_CIR_Code16		 BIT(7)
-#define ZR060_CIR_Endian		 BIT(6)
+#define ZR060_CIR_CODE16		 BIT(7)
+#define ZR060_CIR_ENDIAN		 BIT(6)
 #define ZR060_CIR_CFIS			 BIT(2)
-#define ZR060_CIR_CodeMstr		 BIT(0)
+#define ZR060_CIR_CODE_MSTR		 BIT(0)
 
 /* ZR36060 Codec Mode register */
 
-#define ZR060_CMR_Comp			 BIT(7)
+#define ZR060_CMR_COMP			 BIT(7)
 #define ZR060_CMR_ATP			 BIT(6)
-#define ZR060_CMR_Pass2			 BIT(5)
+#define ZR060_CMR_PASS2			 BIT(5)
 #define ZR060_CMR_TLM			 BIT(4)
 #define ZR060_CMR_BRB			 BIT(2)
 #define ZR060_CMR_FSF			 BIT(1)
 
 /* ZR36060 Markers Enable register */
 
-#define ZR060_MER_App			 BIT(7)
-#define ZR060_MER_Com			 BIT(6)
+#define ZR060_MER_APP			 BIT(7)
+#define ZR060_MER_COM			 BIT(6)
 #define ZR060_MER_DRI			 BIT(5)
 #define ZR060_MER_DQT			 BIT(4)
 #define ZR060_MER_DHT			 BIT(3)
@@ -161,41 +161,41 @@ struct zr36060 {
 
 #define ZR060_IMR_EOAV			 BIT(3)
 #define ZR060_IMR_EOI			 BIT(2)
-#define ZR060_IMR_End			 BIT(1)
-#define ZR060_IMR_DataErr		 BIT(0)
+#define ZR060_IMR_END			 BIT(1)
+#define ZR060_IMR_DATA_ERR		 BIT(0)
 
 /* ZR36060 Interrupt Status register */
 
-#define ZR060_ISR_ProCnt		(3 << 6)
+#define ZR060_ISR_PRO_CNT		(3 << 6)
 #define ZR060_ISR_EOAV			 BIT(3)
 #define ZR060_ISR_EOI			 BIT(2)
-#define ZR060_ISR_End			 BIT(1)
-#define ZR060_ISR_DataErr		 BIT(0)
+#define ZR060_ISR_END			 BIT(1)
+#define ZR060_ISR_DATA_ERR		 BIT(0)
 
 /* ZR36060 Video Control register */
 
-#define ZR060_VCR_Video8		 BIT(7)
-#define ZR060_VCR_Range			 BIT(6)
-#define ZR060_VCR_FIDet			 BIT(3)
-#define ZR060_VCR_FIVedge		 BIT(2)
-#define ZR060_VCR_FIExt			 BIT(1)
-#define ZR060_VCR_SyncMstr		 BIT(0)
+#define ZR060_VCR_VIDEO8		 BIT(7)
+#define ZR060_VCR_RANGE			 BIT(6)
+#define ZR060_VCR_FI_DET			 BIT(3)
+#define ZR060_VCR_FI_VEDGE		 BIT(2)
+#define ZR060_VCR_FI_EXT			 BIT(1)
+#define ZR060_VCR_SYNC_MSTR		 BIT(0)
 
 /* ZR36060 Video Polarity register */
 
-#define ZR060_VPR_VCLKPol		 BIT(7)
-#define ZR060_VPR_PValPol		 BIT(6)
-#define ZR060_VPR_PoePol		 BIT(5)
-#define ZR060_VPR_SImgPol		 BIT(4)
-#define ZR060_VPR_BLPol			 BIT(3)
-#define ZR060_VPR_FIPol			 BIT(2)
-#define ZR060_VPR_HSPol			 BIT(1)
-#define ZR060_VPR_VSPol			 BIT(0)
+#define ZR060_VPR_VCLK_POL		 BIT(7)
+#define ZR060_VPR_P_VAL_POL		 BIT(6)
+#define ZR060_VPR_POE_POL		 BIT(5)
+#define ZR060_VPR_S_IMG_POL		 BIT(4)
+#define ZR060_VPR_BL_POL			 BIT(3)
+#define ZR060_VPR_FI_POL			 BIT(2)
+#define ZR060_VPR_HS_POL			 BIT(1)
+#define ZR060_VPR_VS_POL			 BIT(0)
 
 /* ZR36060 Scaling register */
 
-#define ZR060_SR_VScale			 BIT(2)
-#define ZR060_SR_HScale2		 BIT(0)
-#define ZR060_SR_HScale4		(2 << 0)
+#define ZR060_SR_V_SCALE			 BIT(2)
+#define ZR060_SR_H_SCALE2		 BIT(0)
+#define ZR060_SR_H_SCALE4		(2 << 0)
 
 #endif				/*fndef ZR36060_H */
-- 
2.26.2


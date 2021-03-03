Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0AB32C703
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346316AbhCDAar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:30:47 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:36457 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240710AbhCCM4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 07:56:22 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HR1ylTVCoOruFHR21lClPk; Wed, 03 Mar 2021 13:55:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614776113; bh=qxe7wI6Vu5yYgxBN/K4xqmsCYsz4hGVmURmFN9tXqIY=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lnGi1Jos49pnentcsCKh/zE3FZXXGyiIRHp+pDHFp2JlIMktUtpEfWG0Pd2/A4w8c
         I05UECFlrbc06EQWyevtlgDF3n1ZGBRWqtwHZPMUr/9pyGO5KXqYKmKha6ZTPMnE2Z
         XrHLU+xzyi9FGp+UGfNelFl5w6/bQJO1JYYqmywvTzES6a8CqgGQzco6Xowv6dernO
         PAWKcggLYmIRyRbhrMv94qZxXMHCREgkRjWoTwTWg3+qMrYYTL2fxys05DqWxDheDr
         pD5wk018jSLzvgOH1n841bWn6fBFV+B3f2s9q8NzNBua1RPNa4VLv2/loB7AfWFOaF
         RAUUWJSSaIbYQ==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: fix incorrect kernel doc usages
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <ab62fabc-a56e-3213-d523-4a07e13c8e45@xs4all.nl>
Date:   Wed, 3 Mar 2021 13:55:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEZjdhWcH5CTk2t2F5t7s4oBR/YTkrORn/HfN8xMgQNtT9lN05vVl6BmZojH7kFVVNNGkoVB0KtDGfup2Tjh7/v4UoqhjUsB5qDd7EuCIxWz9ONIyKiz
 +68JCU0ZhmLfL/iCE5KTd/KSCKpIG0OEUJ4yhmkJduMqPUg+A4EiboQCgEgSOifTC7T1s4i8xsUINDudirq+wQotQmIavduqtfU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the following trivial warnings w.r.t. kernel-doc usage:

drivers/media/common/videobuf2/frame_vector.c:38: warning: Excess function parameter 'gup_flags' description in 'get_vaddr_frames'
drivers/media/dvb-core/dvb_ca_en50221.c:193: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1014: warning: expecting prototype for Wake up the DVB CA thread(). Prototype was for
dvb_ca_en50221_thread_wakeup() instead
drivers/media/dvb-core/dvb_ca_en50221.c:1023: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1081: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1112: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1327: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1411: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1426: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1582: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1693: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1743: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1772: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1830: warning: wrong kernel-doc identifier on line:
drivers/media/dvb-core/dvb_ca_en50221.c:1922: warning: wrong kernel-doc identifier on line:
drivers/media/rc/img-ir/img-ir-hw.c:628: warning: expecting prototype for img_ir_decoder_compatable(). Prototype was for
img_ir_decoder_compatible() instead
drivers/media/v4l2-core/v4l2-jpeg.c:461: warning: expecting prototype for jpeg_parse_header(). Prototype was for v4l2_jpeg_parse_header()
instead
drivers/media/platform/vsp1/vsp1_dl.c:166: warning: expecting prototype for struct vsp1_cmd_pool. Prototype was for struct vsp1_dl_cmd_pool
instead
drivers/media/platform/mtk-vpu/mtk_vpu.c:28: warning: expecting prototype for is a tiny processor controlling video hardware(). Prototype
was for INIT_TIMEOUT_MS() instead
drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c:73: warning: expecting prototype for struct vp9_fb_info. Prototype was for struct
vp9_ref_buf instead
drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c:85: warning: expecting prototype for struct vp9_fb_info. Prototype was for struct
vp9_sf_ref_fb instead
drivers/media/tuners/mt2063.c:1404: warning: expecting prototype for fLO_FractionalTerm(). Prototype was for MT2063_fLO_FractionalTerm() instead
drivers/media/tuners/mt2063.c:1465: warning: expecting prototype for CalcLO2Mult(). Prototype was for MT2063_CalcLO2Mult() instead
drivers/media/usb/pwc/pwc-dec23.c:640: warning: wrong kernel-doc identifier on line:
drivers/media/platform/exynos4-is/media-dev.c:820: warning: expecting prototype for __fimc_md_create_fimc_links(). Prototype was for
__fimc_md_create_fimc_sink_links() instead
drivers/media/i2c/s5k6aa.c:426: warning: expecting prototype for s5k6aa_configure_pixel_clock(). Prototype was for
s5k6aa_configure_pixel_clocks() instead
drivers/media/i2c/imx274.c:700: warning: wrong kernel-doc identifier on line:
drivers/media/i2c/imx274.c:735: warning: wrong kernel-doc identifier on line:
drivers/media/i2c/imx274.c:983: warning: wrong kernel-doc identifier on line:

Most are missing or mistyped function names.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/videobuf2/frame_vector.c |  1 -
 drivers/media/dvb-core/dvb_ca_en50221.c       | 32 ++++++++++---------
 drivers/media/i2c/imx274.c                    |  7 ++--
 drivers/media/i2c/s5k6aa.c                    |  2 +-
 drivers/media/platform/exynos4-is/media-dev.c |  2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |  4 +--
 drivers/media/platform/mtk-vpu/mtk_vpu.c      |  4 +--
 drivers/media/platform/vsp1/vsp1_dl.c         |  2 +-
 drivers/media/rc/img-ir/img-ir-hw.c           |  2 +-
 drivers/media/tuners/mt2063.c                 |  6 ++--
 drivers/media/usb/pwc/pwc-dec23.c             |  2 +-
 drivers/media/v4l2-core/v4l2-jpeg.c           |  2 +-
 12 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index a0e65481a201..381158320a90 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -14,7 +14,6 @@
  * get_vaddr_frames() - map virtual addresses to pfns
  * @start:	starting user address
  * @nr_frames:	number of pages / pfns from start to map
- * @gup_flags:	flags modifying lookup behaviour
  * @vec:	structure which receives pages / pfns of the addresses mapped.
  *		It should have space for at least nr_frames entries.
  *
diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index cfc27629444f..b7e4a3371176 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -190,7 +190,7 @@ static int dvb_ca_en50221_write_data(struct dvb_ca_private *ca, int slot,
 				     u8 *ebuf, int ecount);

 /**
- * Safely find needle in haystack.
+ * findstr - Safely find needle in haystack.
  *
  * @haystack: Buffer to look in.
  * @hlen: Number of bytes in haystack.
@@ -1006,7 +1006,7 @@ EXPORT_SYMBOL(dvb_ca_en50221_frda_irq);
 /* EN50221 thread functions */

 /**
- * Wake up the DVB CA thread
+ * dvb_ca_en50221_thread_wakeup - Wake up the DVB CA thread
  *
  * @ca: CA instance.
  */
@@ -1020,7 +1020,7 @@ static void dvb_ca_en50221_thread_wakeup(struct dvb_ca_private *ca)
 }

 /**
- * Update the delay used by the thread.
+ * dvb_ca_en50221_thread_update_delay - Update the delay used by the thread.
  *
  * @ca: CA instance.
  */
@@ -1078,7 +1078,7 @@ static void dvb_ca_en50221_thread_update_delay(struct dvb_ca_private *ca)
 }

 /**
- * Poll if the CAM is gone.
+ * dvb_ca_en50221_poll_cam_gone - Poll if the CAM is gone.
  *
  * @ca: CA instance.
  * @slot: Slot to process.
@@ -1109,7 +1109,8 @@ static int dvb_ca_en50221_poll_cam_gone(struct dvb_ca_private *ca, int slot)
 }

 /**
- * Thread state machine for one CA slot to perform the data transfer.
+ * dvb_ca_en50221_thread_state_machine - Thread state machine for one CA slot
+ *	to perform the data transfer.
  *
  * @ca: CA instance.
  * @slot: Slot to process.
@@ -1324,13 +1325,14 @@ static int dvb_ca_en50221_thread(void *data)
 /* EN50221 IO interface functions */

 /**
- * Real ioctl implementation.
- * NOTE: CA_SEND_MSG/CA_GET_MSG ioctls have userspace buffers passed to them.
+ * dvb_ca_en50221_io_do_ioctl - Real ioctl implementation.
  *
  * @file: File concerned.
  * @cmd: IOCTL command.
  * @parg: Associated argument.
  *
+ * NOTE: CA_SEND_MSG/CA_GET_MSG ioctls have userspace buffers passed to them.
+ *
  * return: 0 on success, <0 on error.
  */
 static int dvb_ca_en50221_io_do_ioctl(struct file *file,
@@ -1408,7 +1410,7 @@ static int dvb_ca_en50221_io_do_ioctl(struct file *file,
 }

 /**
- * Wrapper for ioctl implementation.
+ * dvb_ca_en50221_io_ioctl - Wrapper for ioctl implementation.
  *
  * @file: File concerned.
  * @cmd: IOCTL command.
@@ -1423,7 +1425,7 @@ static long dvb_ca_en50221_io_ioctl(struct file *file,
 }

 /**
- * Implementation of write() syscall.
+ * dvb_ca_en50221_io_write - Implementation of write() syscall.
  *
  * @file: File structure.
  * @buf: Source buffer.
@@ -1579,7 +1581,7 @@ static int dvb_ca_en50221_io_read_condition(struct dvb_ca_private *ca,
 }

 /**
- * Implementation of read() syscall.
+ * dvb_ca_en50221_io_read - Implementation of read() syscall.
  *
  * @file: File structure.
  * @buf: Destination buffer.
@@ -1690,7 +1692,7 @@ static ssize_t dvb_ca_en50221_io_read(struct file *file, char __user *buf,
 }

 /**
- * Implementation of file open syscall.
+ * dvb_ca_en50221_io_open - Implementation of file open syscall.
  *
  * @inode: Inode concerned.
  * @file: File concerned.
@@ -1740,7 +1742,7 @@ static int dvb_ca_en50221_io_open(struct inode *inode, struct file *file)
 }

 /**
- * Implementation of file close syscall.
+ * dvb_ca_en50221_io_release - Implementation of file close syscall.
  *
  * @inode: Inode concerned.
  * @file: File concerned.
@@ -1769,7 +1771,7 @@ static int dvb_ca_en50221_io_release(struct inode *inode, struct file *file)
 }

 /**
- * Implementation of poll() syscall.
+ * dvb_ca_en50221_io_poll - Implementation of poll() syscall.
  *
  * @file: File concerned.
  * @wait: poll wait table.
@@ -1827,7 +1829,7 @@ static const struct dvb_device dvbdev_ca = {
 /* Initialisation/shutdown functions */

 /**
- * Initialise a new DVB CA EN50221 interface device.
+ * dvb_ca_en50221_init - Initialise a new DVB CA EN50221 interface device.
  *
  * @dvb_adapter: DVB adapter to attach the new CA device to.
  * @pubca: The dvb_ca instance.
@@ -1919,7 +1921,7 @@ int dvb_ca_en50221_init(struct dvb_adapter *dvb_adapter,
 EXPORT_SYMBOL(dvb_ca_en50221_init);

 /**
- * Release a DVB CA EN50221 interface device.
+ * dvb_ca_en50221_release - Release a DVB CA EN50221 interface device.
  *
  * @pubca: The associated dvb_ca instance.
  */
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 54642d5f2d5b..a9305077be45 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -697,7 +697,7 @@ static inline int imx274_write_reg(struct stimx274 *priv, u16 addr, u8 val)
 }

 /**
- * Read a multibyte register.
+ * imx274_read_mbreg - Read a multibyte register.
  *
  * Uses a bulk read where possible.
  *
@@ -732,7 +732,7 @@ static int imx274_read_mbreg(struct stimx274 *priv, u16 addr, u32 *val,
 }

 /**
- * Write a multibyte register.
+ * imx274_write_mbreg - Write a multibyte register.
  *
  * Uses a bulk write where possible.
  *
@@ -980,7 +980,8 @@ static int imx274_binning_goodness(struct stimx274 *imx274,
 }

 /**
- * Helper function to change binning and set both compose and format.
+ * __imx274_change_compose - Helper function to change binning and set both
+ *	compose and format.
  *
  * We have two entry points to change binning: set_fmt and
  * set_selection(COMPOSE). Both have to compute the new output size
diff --git a/drivers/media/i2c/s5k6aa.c b/drivers/media/i2c/s5k6aa.c
index 72439fae7968..038e38500760 100644
--- a/drivers/media/i2c/s5k6aa.c
+++ b/drivers/media/i2c/s5k6aa.c
@@ -416,7 +416,7 @@ static int s5k6aa_set_ahb_address(struct i2c_client *client)
 }

 /**
- * s5k6aa_configure_pixel_clock - apply ISP main clock/PLL configuration
+ * s5k6aa_configure_pixel_clocks - apply ISP main clock/PLL configuration
  * @s5k6aa: pointer to &struct s5k6aa describing the device
  *
  * Configure the internal ISP PLL for the required output frequency.
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 8e1e892085ec..1e5a28f32195 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -806,7 +806,7 @@ static void fimc_md_unregister_entities(struct fimc_md *fmd)
 }

 /**
- * __fimc_md_create_fimc_links - create links to all FIMC entities
+ * __fimc_md_create_fimc_sink_links - create links to all FIMC entities
  * @fmd: fimc media device
  * @source: the source entity to create links to all fimc entities from
  * @sensor: sensor subdev linked to FIMC[fimc_id] entity, may be null
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index d9880210b2ab..71cdc3ddafcb 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -61,7 +61,7 @@ struct vp9_ref_cnt_buf {
 };

 /**
- * struct vp9_fb_info - contains current frame's reference buffer information
+ * struct vp9_ref_buf - contains current frame's reference buffer information
  * @buf : reference buffer
  * @idx : reference buffer index to frm_bufs
  * @reserved : reserved field used by vpu
@@ -73,7 +73,7 @@ struct vp9_ref_buf {
 };

 /**
- * struct vp9_fb_info - contains frame buffer info
+ * struct vp9_sf_ref_fb - contains frame buffer info
  * @fb : super frame reference frame buffer
  * @used : this reference frame info entry is used
  * @padding : for 64 bytes size align
diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 043894f7188c..c8a56271b259 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -19,11 +19,11 @@

 #include "mtk_vpu.h"

-/**
+/*
  * VPU (video processor unit) is a tiny processor controlling video hardware
  * related to video codec, scaling and color format converting.
  * VPU interfaces with other blocks by share memory and interrupt.
- **/
+ */

 #define INIT_TIMEOUT_MS		2000U
 #define IPI_TIMEOUT_MS		2000U
diff --git a/drivers/media/platform/vsp1/vsp1_dl.c b/drivers/media/platform/vsp1/vsp1_dl.c
index e07b135613eb..ad3fa1c9cc73 100644
--- a/drivers/media/platform/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/vsp1/vsp1_dl.c
@@ -142,7 +142,7 @@ struct vsp1_dl_body_pool {
 };

 /**
- * struct vsp1_cmd_pool - Display List commands pool
+ * struct vsp1_dl_cmd_pool - Display List commands pool
  * @dma: DMA address of the entries
  * @size: size of the full DMA memory pool in bytes
  * @mem: CPU memory pointer for the pool
diff --git a/drivers/media/rc/img-ir/img-ir-hw.c b/drivers/media/rc/img-ir/img-ir-hw.c
index d3af7bca26f5..5da7479c1793 100644
--- a/drivers/media/rc/img-ir/img-ir-hw.c
+++ b/drivers/media/rc/img-ir/img-ir-hw.c
@@ -617,7 +617,7 @@ static void img_ir_set_decoder(struct img_ir_priv *priv,
 }

 /**
- * img_ir_decoder_compatable() - Find whether a decoder will work with a device.
+ * img_ir_decoder_compatible() - Find whether a decoder will work with a device.
  * @priv:	IR private data.
  * @dec:	Decoder to check.
  *
diff --git a/drivers/media/tuners/mt2063.c b/drivers/media/tuners/mt2063.c
index d105431a2e2d..6afef11a49cb 100644
--- a/drivers/media/tuners/mt2063.c
+++ b/drivers/media/tuners/mt2063.c
@@ -1383,7 +1383,7 @@ static u32 MT2063_Round_fLO(u32 f_LO, u32 f_LO_Step, u32 f_ref)
 }

 /**
- * fLO_FractionalTerm() - Calculates the portion contributed by FracN / denom.
+ * MT2063_fLO_FractionalTerm - Calculates the portion contributed by FracN / denom.
  *                        This function preserves maximum precision without
  *                        risk of overflow.  It accurately calculates
  *                        f_ref * num / denom to within 1 HZ with fixed math.
@@ -1411,7 +1411,7 @@ static u32 MT2063_fLO_FractionalTerm(u32 f_ref, u32 num, u32 denom)
 }

 /*
- * CalcLO1Mult()- Calculates Integer divider value and the numerator
+ * MT2063_CalcLO1Mult - Calculates Integer divider value and the numerator
  *                value for a FracN PLL.
  *
  *                This function assumes that the f_LO and f_Ref are
@@ -1444,7 +1444,7 @@ static u32 MT2063_CalcLO1Mult(u32 *Div,
 }

 /**
- * CalcLO2Mult() - Calculates Integer divider value and the numerator
+ * MT2063_CalcLO2Mult - Calculates Integer divider value and the numerator
  *                 value for a FracN PLL.
  *
  *                  This function assumes that the f_LO and f_Ref are
diff --git a/drivers/media/usb/pwc/pwc-dec23.c b/drivers/media/usb/pwc/pwc-dec23.c
index 4e26ada87f7b..a3aa8c7174b9 100644
--- a/drivers/media/usb/pwc/pwc-dec23.c
+++ b/drivers/media/usb/pwc/pwc-dec23.c
@@ -637,7 +637,7 @@ static void DecompressBand23(struct pwc_dec23_private *pdec,
 }

 /**
- * Uncompress a pwc23 buffer.
+ * pwc_dec23_decompress - Uncompress a pwc23 buffer.
  * @pdev: pointer to pwc device's internal struct
  * @src: raw data
  * @dst: image output
diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 8947fd95c6f1..9071b6cc6d0e 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -445,7 +445,7 @@ static int jpeg_skip_segment(struct jpeg_stream *stream)
 }

 /**
- * jpeg_parse_header - locate marker segments and optionally parse headers
+ * v4l2_jpeg_parse_header - locate marker segments and optionally parse headers
  * @buf: address of the JPEG buffer, should start with a SOI marker
  * @len: length of the JPEG buffer
  * @out: returns marker segment positions and optionally parsed headers
-- 
2.30.1


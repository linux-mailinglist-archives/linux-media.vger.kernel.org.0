Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF5612D6A
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 14:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfECMUQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 08:20:16 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58535 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfECMUP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 08:20:15 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hMXAi-00025x-Il; Fri, 03 May 2019 14:20:12 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hMXAh-0008VD-Rt; Fri, 03 May 2019 14:20:11 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v5 4/5] [media] allegro: add Allegro DVT video IP core driver
Date:   Fri,  3 May 2019 14:20:09 +0200
Message-Id: <20190503122010.16663-5-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503122010.16663-1-m.tretter@pengutronix.de>
References: <20190503122010.16663-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2 mem-to-mem driver for Allegro DVT video IP cores as found in
the EV family of the Xilinx ZynqMP SoC. The Zynq UltraScale+ Device
Technical Reference Manual uses the term VCU (Video Codec Unit) for the
encoder, decoder and system integration block.

This driver takes care of interacting with the MicroBlaze MCU that
controls the actual IP cores. The IP cores and MCU are integrated in the
FPGA. The xlnx_vcu driver is responsible for configuring the clocks and
providing information about the codec configuration.

The driver currently only supports the H.264 video encoder.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v4 -> v5:
- move out of staging
- select VIDEOBUF2_DMA_CONTIG
- implement enum_framesizes
- drop check in queue_setup
- rework busy handling of ctrl handler
- add ctrl V4L2_CID_MIN_BUFFERS_FOR_OUTPUT
- use ctrl names in logging
- implement g_selection
- use unsigned types in estimate_stream_size
- fix estimate of stream size
- print sequence number of encoded frame
- fix printing of firmware address
- queue destination buffer in run_device
- add helper for EOS signaling
- rename finish frame
- implement CMD_START and helpers
- add state machine to track output queue
- consistently use TYPE_IS_OUTPUT

v3 -> v4:
- fix checkpatch warnings
- fix compiler warnings regarding printing size_t
- use v4l2_m2m_buf_copy_metadata to copy buffer metadata
- resolve FIXME regarding channel creation and streamon
- resolve various TODOs
- add mailbox format to firmware info
- add suballocator_size to firmware info
- use struct_size to allocate mcu_msg_push_buffers_internal
- handle *_response messages in a union
- cleanup mcu_send_msg functions
- set capture bytesperline to 0
- increase maximum video resolution to 4k
- handle errors when creating a channel
- do not update ctrls after channel is created
- add missing newline in debug output

v2 -> v3:
- drop poison_capture_buffers
- cleanup allegro_queue_setup
- add missing allegro_queue_ops
- set device caps on video device
- cleanup allegro_ioctl_ops
- add missing allegro_ioctl_ops
- drop unnecessary v4l2_disable_ioctl
- drop unnecessary allegro_job_abort and allegro_job_ready
- rename allegro_firmware_request
- implement allegro_buf_prepare
- implement v4l2_buffer sequence numbers
- implement v4l2_buffer flags
- rework error handling in fw_callback
- check codec firmware size
- do not print queuing source buffer
- remove channel from list after releasing context
- add event_subscribe for V4L2_EVENT_EOS

v1 -> v2:
- clean up debug log levels
- fix unused variable in allegro_mbox_init
- fix uninitialized variable in allegro_mbox_write
- fix global module parameters
- fix Kconfig dependencies
- return h264 as default codec for mcu
- implement device reset as documented
- document why irq does not wait for clear
- rename ENCODE_ONE_FRM to ENCODE_FRAME
- allow error codes for mcu_channel_id
- move control handler to channel
- add fw version check
- add support for colorspaces
- enable configuration of H.264 levels
- enable configuration of frame size
- enable configuration of bit rate and CPB size
- enable configuration of GOP size
- rework response handling
---
 MAINTAINERS                                   |    7 +
 drivers/media/platform/Kconfig                |   16 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/allegro-dvt/Makefile   |    4 +
 .../media/platform/allegro-dvt/allegro-core.c | 2890 +++++++++++++++++
 5 files changed, 2919 insertions(+)
 create mode 100644 drivers/media/platform/allegro-dvt/Makefile
 create mode 100644 drivers/media/platform/allegro-dvt/allegro-core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 878588cfb453..2930f8e2be44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -667,6 +667,13 @@ S:	Maintained
 F:	Documentation/i2c/busses/i2c-ali1563
 F:	drivers/i2c/busses/i2c-ali1563.c
 
+ALLEGRO DVT VIDEO IP CORE DRIVER
+M:	Michael Tretter <m.tretter@pengutronix.de>
+R:	Pengutronix Kernel Team <kernel@pengutronix.de>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/platform/allegro-dvt/
+
 ALLWINNER SECURITY SYSTEM
 M:	Corentin Labbe <clabbe.montjoie@gmail.com>
 L:	linux-crypto@vger.kernel.org
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 011c1c2fcf19..8c90ab509bc3 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -501,6 +501,22 @@ config VIDEO_QCOM_VENUS
 	  on various Qualcomm SoCs.
 	  To compile this driver as a module choose m here.
 
+config VIDEO_ALLEGRO_DVT
+	tristate "Allegro DVT Video IP Cores"
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_ZYNQMP || COMPILE_TEST
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select REGMAP
+	select REGMAP_MMIO
+	help
+	  Support for the encoder and decoder video IP cores by Allegro DVT.
+	  These cores are found for example on the Xilinx ZynqMP SoC in the EV
+	  family and are called VCU in the reference manual.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called allegro.
+
 endif # V4L_MEM2MEM_DRIVERS
 
 # TI VIDEO PORT Helper Modules
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 7cbbd925124c..93e7f452a455 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -101,3 +101,5 @@ obj-y					+= meson/
 obj-y					+= cros-ec-cec/
 
 obj-$(CONFIG_VIDEO_SUN6I_CSI)		+= sunxi/sun6i-csi/
+
+obj-$(CONFIG_VIDEO_ALLEGRO_DVT)		+= allegro-dvt/
diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
new file mode 100644
index 000000000000..bc30addee47f
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+allegro-objs := allegro-core.o
+
+obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
new file mode 100644
index 000000000000..5ed8553dee4a
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -0,0 +1,2890 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Pengutronix, Michael Tretter <kernel@pengutronix.de>
+ *
+ * Allegro DVT encoder and decoder driver
+ */
+
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/log2.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+
+/*
+ * Support up to 4k video streams. The hardware actually supports higher
+ * resolutions, which are specified in PG252 June 6, 2018 (H.264/H.265 Video
+ * Codec Unit v1.1) Chapter 3.
+ */
+#define ALLEGRO_WIDTH_MIN 128
+#define ALLEGRO_WIDTH_DEFAULT 1920
+#define ALLEGRO_WIDTH_MAX 3840
+#define ALLEGRO_HEIGHT_MIN 64
+#define ALLEGRO_HEIGHT_DEFAULT 1080
+#define ALLEGRO_HEIGHT_MAX 2160
+
+#define ALLEGRO_GOP_SIZE_DEFAULT 25
+#define ALLEGRO_GOP_SIZE_MAX 1000
+
+/*
+ * MCU Control Registers
+ *
+ * The Zynq UltraScale+ Devices Register Reference documents the registers
+ * with an offset of 0x9000, which equals the size of the SRAM and one page
+ * gap. The driver handles SRAM and registers separately and, therefore, is
+ * oblivious of the offset.
+ */
+#define AL5_MCU_RESET                   0x0000
+#define AL5_MCU_RESET_SOFT              BIT(0)
+#define AL5_MCU_RESET_REGS              BIT(1)
+#define AL5_MCU_RESET_MODE              0x0004
+#define AL5_MCU_RESET_MODE_SLEEP        BIT(0)
+#define AL5_MCU_RESET_MODE_HALT         BIT(1)
+#define AL5_MCU_STA                     0x0008
+#define AL5_MCU_STA_SLEEP               BIT(0)
+#define AL5_MCU_WAKEUP                  0x000c
+
+#define AL5_ICACHE_ADDR_OFFSET_MSB      0x0010
+#define AL5_ICACHE_ADDR_OFFSET_LSB      0x0014
+#define AL5_DCACHE_ADDR_OFFSET_MSB      0x0018
+#define AL5_DCACHE_ADDR_OFFSET_LSB      0x001c
+
+#define AL5_MCU_INTERRUPT               0x0100
+#define AL5_ITC_CPU_IRQ_MSK             0x0104
+#define AL5_ITC_CPU_IRQ_CLR             0x0108
+#define AL5_ITC_CPU_IRQ_STA             0x010C
+#define AL5_ITC_CPU_IRQ_STA_TRIGGERED   BIT(0)
+
+#define AXI_ADDR_OFFSET_IP              0x0208
+
+/*
+ * The MCU accesses the system memory with a 2G offset compared to CPU
+ * physical addresses.
+ */
+#define MCU_CACHE_OFFSET SZ_2G
+
+/*
+ * The driver needs to reserve some space at the beginning of capture buffers,
+ * because it needs to write SPS/PPS NAL units. The encoder writes the actual
+ * frame data after the offset.
+ */
+#define ENCODER_STREAM_OFFSET SZ_64
+
+#define SIZE_MACROBLOCK 16
+
+static int debug;
+module_param(debug, int, 0644);
+MODULE_PARM_DESC(debug, "Debug level (0-2)");
+
+struct allegro_buffer {
+	void *vaddr;
+	dma_addr_t paddr;
+	size_t size;
+	struct list_head head;
+};
+
+struct allegro_channel;
+
+struct allegro_mbox {
+	unsigned int head;
+	unsigned int tail;
+	unsigned int data;
+	size_t size;
+	/* protect mailbox from simultaneous accesses */
+	struct mutex lock;
+};
+
+struct allegro_dev {
+	struct v4l2_device v4l2_dev;
+	struct video_device video_dev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct platform_device *plat_dev;
+
+	/* mutex protecting vb2_queue structure */
+	struct mutex lock;
+
+	struct regmap *regmap;
+	struct regmap *sram;
+
+	struct allegro_buffer firmware;
+	struct allegro_buffer suballocator;
+
+	struct completion init_complete;
+
+	/* The mailbox interface */
+	struct allegro_mbox mbox_command;
+	struct allegro_mbox mbox_status;
+
+	/*
+	 * The downstream driver limits the users to 64 users, thus I can use
+	 * a bitfield for the user_ids that are in use. See also user_id in
+	 * struct allegro_channel.
+	 */
+	unsigned long channel_user_ids;
+	struct list_head channels;
+};
+
+static struct regmap_config allegro_regmap_config = {
+	.name = "regmap",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0xfff,
+	.cache_type = REGCACHE_NONE,
+};
+
+static struct regmap_config allegro_sram_config = {
+	.name = "sram",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x7fff,
+	.cache_type = REGCACHE_NONE,
+};
+
+enum allegro_state {
+	ALLEGRO_STATE_ENCODING,
+	ALLEGRO_STATE_DRAIN,
+	ALLEGRO_STATE_WAIT_FOR_BUFFER,
+	ALLEGRO_STATE_STOPPED,
+};
+
+static const char *allegro_state_get_name(enum allegro_state state)
+{
+	switch (state) {
+	case ALLEGRO_STATE_ENCODING:		return "ENCODING";
+	case ALLEGRO_STATE_DRAIN:		return "DRAIN";
+	case ALLEGRO_STATE_WAIT_FOR_BUFFER:	return "WAIT_FOR_BUFFER";
+	case ALLEGRO_STATE_STOPPED:		return "STOPPED";
+	default:
+		return NULL;
+	}
+}
+
+#define fh_to_channel(__fh) container_of(__fh, struct allegro_channel, fh)
+
+struct allegro_channel {
+	struct allegro_dev *dev;
+	struct v4l2_fh fh;
+	struct v4l2_ctrl_handler ctrl_handler;
+
+	unsigned int width;
+	unsigned int height;
+	unsigned int stride;
+
+	enum v4l2_colorspace colorspace;
+	enum v4l2_ycbcr_encoding ycbcr_enc;
+	enum v4l2_quantization quantization;
+	enum v4l2_xfer_func xfer_func;
+
+	u32 pixelformat;
+	unsigned int sizeimage_raw;
+	unsigned int osequence;
+
+	u32 codec;
+	enum v4l2_mpeg_video_h264_profile profile;
+	enum v4l2_mpeg_video_h264_level level;
+	unsigned int sizeimage_encoded;
+	unsigned int csequence;
+
+	enum v4l2_mpeg_video_bitrate_mode bitrate_mode;
+	unsigned int bitrate;
+	unsigned int bitrate_peak;
+	unsigned int cpb_size;
+	unsigned int gop_size;
+
+	struct v4l2_ctrl *mpeg_video_h264_profile;
+	struct v4l2_ctrl *mpeg_video_h264_level;
+	struct v4l2_ctrl *mpeg_video_bitrate_mode;
+	struct v4l2_ctrl *mpeg_video_bitrate;
+	struct v4l2_ctrl *mpeg_video_bitrate_peak;
+	struct v4l2_ctrl *mpeg_video_cpb_size;
+	struct v4l2_ctrl *mpeg_video_gop_size;
+
+	/* user_id is used to identify the channel during CREATE_CHANNEL */
+	/* not sure, what to set here and if this is actually required */
+	int user_id;
+	/* channel_id is set by the mcu and used by all later commands */
+	int mcu_channel_id;
+
+	struct list_head buffers_reference;
+	struct list_head buffers_intermediate;
+
+	struct list_head list;
+	struct completion completion;
+
+	unsigned int error;
+	enum allegro_state state;
+};
+
+static inline int
+allegro_set_state(struct allegro_channel *channel, enum allegro_state state)
+{
+	channel->state = state;
+
+	return 0;
+}
+
+static inline enum allegro_state
+allegro_get_state(struct allegro_channel *channel)
+{
+	return channel->state;
+}
+
+struct fw_info {
+	unsigned int id;
+	unsigned int id_codec;
+	char *version;
+	unsigned int mailbox_cmd;
+	unsigned int mailbox_status;
+	size_t mailbox_size;
+	size_t suballocator_size;
+};
+
+static const struct fw_info supported_firmware[] = {
+	{
+		.id = 18296,
+		.id_codec = 96272,
+		.version = "v2018.2",
+		.mailbox_cmd = 0x7800,
+		.mailbox_status = 0x7c00,
+		.mailbox_size = 0x400 - 0x8,
+		.suballocator_size = SZ_16M,
+	},
+};
+
+enum mcu_msg_type {
+	MCU_MSG_TYPE_INIT = 0x0000,
+	MCU_MSG_TYPE_CREATE_CHANNEL = 0x0005,
+	MCU_MSG_TYPE_DESTROY_CHANNEL = 0x0006,
+	MCU_MSG_TYPE_ENCODE_FRAME = 0x0007,
+	MCU_MSG_TYPE_PUT_STREAM_BUFFER = 0x0012,
+	MCU_MSG_TYPE_PUSH_BUFFER_INTERMEDIATE = 0x000e,
+	MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE = 0x000f,
+};
+
+static const char *msg_type_name(enum mcu_msg_type type)
+{
+	static char buf[9];
+
+	switch (type) {
+	case MCU_MSG_TYPE_INIT:
+		return "INIT";
+	case MCU_MSG_TYPE_CREATE_CHANNEL:
+		return "CREATE_CHANNEL";
+	case MCU_MSG_TYPE_DESTROY_CHANNEL:
+		return "DESTROY_CHANNEL";
+	case MCU_MSG_TYPE_ENCODE_FRAME:
+		return "ENCODE_FRAME";
+	case MCU_MSG_TYPE_PUT_STREAM_BUFFER:
+		return "PUT_STREAM_BUFFER";
+	case MCU_MSG_TYPE_PUSH_BUFFER_INTERMEDIATE:
+		return "PUSH_BUFFER_INTERMEDIATE";
+	case MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE:
+		return "PUSH_BUFFER_REFERENCE";
+	default:
+		snprintf(buf, sizeof(buf), "(0x%04x)", type);
+		return buf;
+	}
+}
+
+struct mcu_msg_header {
+	u16 length;		/* length of the body in bytes */
+	u16 type;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_init_request {
+	struct mcu_msg_header header;
+	u32 reserved0;		/* maybe a unused channel id */
+	u32 suballoc_dma;
+	u32 suballoc_size;
+	s32 l2_cache[3];
+} __attribute__ ((__packed__));
+
+struct mcu_msg_init_response {
+	struct mcu_msg_header header;
+	u32 reserved0;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_create_channel {
+	struct mcu_msg_header header;
+	u32 user_id;
+	u16 width;
+	u16 height;
+	u32 format;
+	u32 colorspace;
+	u32 src_mode;
+	u8 profile;
+	u16 constraint_set_flags;
+	s8 codec;
+	u16 level;
+	u16 tier;
+	u32 sps_param;
+	u32 pps_param;
+
+	u32 enc_option;
+#define AL_OPT_WPP			BIT(0)
+#define AL_OPT_TILE			BIT(1)
+#define AL_OPT_LF			BIT(2)
+#define AL_OPT_LF_X_SLICE		BIT(3)
+#define AL_OPT_LF_X_TILE		BIT(4)
+#define AL_OPT_SCL_LST			BIT(5)
+#define AL_OPT_CONST_INTRA_PRED		BIT(6)
+#define AL_OPT_QP_TAB_RELATIVE		BIT(7)
+#define AL_OPT_FIX_PREDICTOR		BIT(8)
+#define AL_OPT_CUSTOM_LDA		BIT(9)
+#define AL_OPT_ENABLE_AUTO_QP		BIT(10)
+#define AL_OPT_ADAPT_AUTO_QP		BIT(11)
+#define AL_OPT_TRANSFO_SKIP		BIT(13)
+#define AL_OPT_FORCE_REC		BIT(15)
+#define AL_OPT_FORCE_MV_OUT		BIT(16)
+#define AL_OPT_FORCE_MV_CLIP		BIT(17)
+#define AL_OPT_LOWLAT_SYNC		BIT(18)
+#define AL_OPT_LOWLAT_INT		BIT(19)
+#define AL_OPT_RDO_COST_MODE		BIT(20)
+
+	s8 beta_offset;
+	s8 tc_offset;
+	u16 reserved10;
+	u32 unknown11;
+	u32 unknown12;
+	u16 num_slices;
+	u16 prefetch_auto;
+	u32 prefetch_mem_offset;
+	u32 prefetch_mem_size;
+	u16 clip_hrz_range;
+	u16 clip_vrt_range;
+	u16 me_range[4];
+	u8 max_cu_size;
+	u8 min_cu_size;
+	u8 max_tu_size;
+	u8 min_tu_size;
+	u8 max_transfo_depth_inter;
+	u8 max_transfo_depth_intra;
+	u16 reserved20;
+	u32 entropy_mode;
+	u32 wp_mode;
+
+	/* rate control param */
+	u32 rate_control_mode;
+	u32 initial_rem_delay;
+	u32 cpb_size;
+	u16 framerate;
+	u16 clk_ratio;
+	u32 target_bitrate;
+	u32 max_bitrate;
+	u16 initial_qp;
+	u16 min_qp;
+	u16 max_qp;
+	s16 ip_delta;
+	s16 pb_delta;
+	u16 golden_ref;
+	u16 golden_delta;
+	u16 golden_ref_frequency;
+	u32 rate_control_option;
+
+	/* gop param */
+	u32 gop_ctrl_mode;
+	u32 freq_ird;
+	u32 freq_lt;
+	u32 gdr_mode;
+	u32 gop_length;
+	u32 unknown39;
+
+	u32 subframe_latency;
+	u32 lda_control_mode;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_create_channel_response {
+	struct mcu_msg_header header;
+	u32 channel_id;
+	u32 user_id;
+	u32 options;
+	u32 num_core;
+	u32 pps_param;
+	u32 int_buffers_count;
+	u32 int_buffers_size;
+	u32 rec_buffers_count;
+	u32 rec_buffers_size;
+	u32 reserved;
+	u32 error_code;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_destroy_channel {
+	struct mcu_msg_header header;
+	u32 channel_id;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_destroy_channel_response {
+	struct mcu_msg_header header;
+	u32 channel_id;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_push_buffers_internal_buffer {
+	u32 dma_addr;
+	u32 mcu_addr;
+	u32 size;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_push_buffers_internal {
+	struct mcu_msg_header header;
+	u32 channel_id;
+	struct mcu_msg_push_buffers_internal_buffer buffer[0];
+} __attribute__ ((__packed__));
+
+struct mcu_msg_put_stream_buffer {
+	struct mcu_msg_header header;
+	u32 channel_id;
+	u32 dma_addr;
+	u32 mcu_addr;
+	u32 size;
+	u32 offset;
+	u64 stream_id;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_encode_frame {
+	struct mcu_msg_header header;
+	u32 channel_id;
+	u32 reserved;
+
+	u32 encoding_options;
+#define AL_OPT_USE_QP_TABLE		BIT(0)
+#define AL_OPT_FORCE_LOAD		BIT(1)
+#define AL_OPT_USE_L2			BIT(2)
+#define AL_OPT_DISABLE_INTRA		BIT(3)
+#define AL_OPT_DEPENDENT_SLICES		BIT(4)
+
+	s16 pps_qp;
+	u16 padding;
+	u64 user_param;
+	u64 src_handle;
+
+	u32 request_options;
+#define AL_OPT_SCENE_CHANGE		BIT(0)
+#define AL_OPT_RESTART_GOP		BIT(1)
+#define AL_OPT_USE_LONG_TERM		BIT(2)
+#define AL_OPT_UPDATE_PARAMS		BIT(3)
+
+	/* u32 scene_change_delay (optional) */
+	/* rate control param (optional) */
+	/* gop param (optional) */
+	u32 src_y;
+	u32 src_uv;
+	u32 stride;
+	u32 ep2;
+	u64 ep2_v;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_encode_frame_response {
+	struct mcu_msg_header header;
+	u32 channel_id;
+	u64 stream_id;		/* see mcu_msg_put_stream_buffer */
+	u64 user_param;		/* see mcu_msg_encode_frame */
+	u64 src_handle;		/* see mcu_msg_encode_frame */
+	u16 skip;
+	u16 is_ref;
+	u32 initial_removal_delay;
+	u32 dpb_output_delay;
+	u32 size;
+	u32 frame_tag_size;
+	s32 stuffing;
+	s32 filler;
+	u16 num_column;
+	u16 num_row;
+	u16 qp;
+	u8 num_ref_idx_l0;
+	u8 num_ref_idx_l1;
+	u32 partition_table_offset;
+	s32 partition_table_size;
+	u32 sum_complex;
+	s32 tile_width[4];
+	s32 tile_height[22];
+	u32 error_code;
+
+	u32 slice_type;
+#define AL_ENC_SLICE_TYPE_B             0
+#define AL_ENC_SLICE_TYPE_P             1
+#define AL_ENC_SLICE_TYPE_I             2
+
+	u32 pic_struct;
+	u8 is_idr;
+	u8 is_first_slice;
+	u8 is_last_slice;
+	u8 reserved;
+	u16 pps_qp;
+	u16 reserved1;
+	u32 reserved2;
+} __attribute__ ((__packed__));
+
+union mcu_msg_response {
+	struct mcu_msg_header header;
+	struct mcu_msg_init_response init;
+	struct mcu_msg_create_channel_response create_channel;
+	struct mcu_msg_destroy_channel_response destroy_channel;
+	struct mcu_msg_encode_frame_response encode_frame;
+};
+
+/* Helper functions for channel and user operations */
+
+static unsigned long allegro_next_user_id(struct allegro_dev *dev)
+{
+	if (dev->channel_user_ids == ~0UL)
+		return -EBUSY;
+
+	return ffz(dev->channel_user_ids);
+}
+
+static struct allegro_channel *
+allegro_find_channel_by_user_id(struct allegro_dev *dev,
+				unsigned int user_id)
+{
+	struct allegro_channel *channel;
+
+	list_for_each_entry(channel, &dev->channels, list) {
+		if (channel->user_id == user_id)
+			return channel;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static struct allegro_channel *
+allegro_find_channel_by_channel_id(struct allegro_dev *dev,
+				   unsigned int channel_id)
+{
+	struct allegro_channel *channel;
+
+	list_for_each_entry(channel, &dev->channels, list) {
+		if (channel->mcu_channel_id == channel_id)
+			return channel;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static inline bool channel_exists(struct allegro_channel *channel)
+{
+	return channel->mcu_channel_id != -1;
+}
+
+static unsigned int estimate_stream_size(unsigned int width,
+					 unsigned int height)
+{
+	unsigned int offset = ENCODER_STREAM_OFFSET;
+	unsigned int num_blocks = DIV_ROUND_UP(width, SIZE_MACROBLOCK) *
+					DIV_ROUND_UP(height, SIZE_MACROBLOCK);
+	unsigned int pcm_size = SZ_256;
+	unsigned int partition_table = SZ_256;
+
+	return round_up(offset + num_blocks * pcm_size + partition_table, 32);
+}
+
+static enum v4l2_mpeg_video_h264_level
+select_minimum_h264_level(unsigned int width, unsigned int height)
+{
+	unsigned int pic_width_in_mb = DIV_ROUND_UP(width, SIZE_MACROBLOCK);
+	unsigned int frame_height_in_mb = DIV_ROUND_UP(height, SIZE_MACROBLOCK);
+	unsigned int frame_size_in_mb = pic_width_in_mb * frame_height_in_mb;
+	enum v4l2_mpeg_video_h264_level level = V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
+
+	/*
+	 * The level limits are specified in Rec. ITU-T H.264 Annex A.3.1 and
+	 * also specify limits regarding bit rate and CBP size. Only approximate
+	 * the levels using the frame size.
+	 *
+	 * Level 5.1 allows up to 4k video resolution.
+	 */
+	if (frame_size_in_mb <= 99)
+		level = V4L2_MPEG_VIDEO_H264_LEVEL_1_0;
+	else if (frame_size_in_mb <= 396)
+		level = V4L2_MPEG_VIDEO_H264_LEVEL_1_1;
+	else if (frame_size_in_mb <= 792)
+		level = V4L2_MPEG_VIDEO_H264_LEVEL_2_1;
+	else if (frame_size_in_mb <= 1620)
+		level = V4L2_MPEG_VIDEO_H264_LEVEL_2_2;
+	else if (frame_size_in_mb <= 3600)
+		level = V4L2_MPEG_VIDEO_H264_LEVEL_3_1;
+	else if (frame_size_in_mb <= 5120)
+		level = V4L2_MPEG_VIDEO_H264_LEVEL_3_2;
+	else if (frame_size_in_mb <= 8192)
+		level = V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
+	else if (frame_size_in_mb <= 8704)
+		level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
+	else if (frame_size_in_mb <= 22080)
+		level = V4L2_MPEG_VIDEO_H264_LEVEL_5_0;
+	else
+		level = V4L2_MPEG_VIDEO_H264_LEVEL_5_1;
+
+	return level;
+}
+
+static unsigned int maximum_bitrate(enum v4l2_mpeg_video_h264_level level)
+{
+	switch (level) {
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+		return 64000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+		return 128000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+		return 192000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+		return 384000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+		return 768000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+		return 2000000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+		return 4000000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+		return 4000000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+		return 10000000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+		return 14000000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+		return 20000000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		return 20000000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+		return 50000000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+		return 50000000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		return 135000000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+	default:
+		return 240000000;
+	}
+}
+
+static unsigned int maximum_cpb_size(enum v4l2_mpeg_video_h264_level level)
+{
+	switch (level) {
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+		return 175;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+		return 350;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+		return 500;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+		return 1000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+		return 2000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+		return 2000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+		return 4000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+		return 4000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+		return 10000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+		return 14000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+		return 20000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		return 25000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+		return 62500;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+		return 62500;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		return 135000;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+	default:
+		return 240000;
+	}
+}
+
+static const struct fw_info *
+allegro_get_firmware_info(struct allegro_dev *dev,
+			  const struct firmware *fw,
+			  const struct firmware *fw_codec)
+{
+	int i;
+	unsigned int id = fw->size;
+	unsigned int id_codec = fw_codec->size;
+
+	for (i = 0; i < ARRAY_SIZE(supported_firmware); i++)
+		if (supported_firmware[i].id == id &&
+		    supported_firmware[i].id_codec == id_codec)
+			return &supported_firmware[i];
+
+	return NULL;
+}
+
+/*
+ * Buffers that are used internally by the MCU.
+ */
+
+int allegro_alloc_buffer(struct allegro_dev *dev,
+			 struct allegro_buffer *buffer, size_t size)
+{
+	buffer->vaddr = dma_alloc_coherent(&dev->plat_dev->dev, size,
+					   &buffer->paddr, GFP_KERNEL);
+	if (!buffer->vaddr)
+		return -ENOMEM;
+	buffer->size = size;
+
+	return 0;
+}
+
+void allegro_free_buffer(struct allegro_dev *dev, struct allegro_buffer *buffer)
+{
+	if (buffer->vaddr) {
+		dma_free_coherent(&dev->plat_dev->dev, buffer->size,
+				  buffer->vaddr, buffer->paddr);
+		buffer->vaddr = NULL;
+		buffer->size = 0;
+	}
+}
+
+/*
+ * Mailbox interface to send messages to the MCU.
+ */
+
+static int allegro_mbox_init(struct allegro_dev *dev,
+			     struct allegro_mbox *mbox,
+			     unsigned int base, size_t size)
+{
+	if (!mbox)
+		return -EINVAL;
+
+	mbox->head = base;
+	mbox->tail = base + 0x4;
+	mbox->data = base + 0x8;
+	mbox->size = size;
+	mutex_init(&mbox->lock);
+
+	regmap_write(dev->sram, mbox->head, 0);
+	regmap_write(dev->sram, mbox->tail, 0);
+
+	return 0;
+}
+
+static int allegro_mbox_write(struct allegro_dev *dev,
+			      struct allegro_mbox *mbox, void *src, size_t size)
+{
+	struct mcu_msg_header *header = src;
+	unsigned int tail;
+	size_t size_no_wrap;
+	int err = 0;
+
+	if (!src)
+		return -EINVAL;
+
+	if (size > mbox->size) {
+		v4l2_err(&dev->v4l2_dev,
+			 "message (%zu bytes) to large for mailbox (%zu bytes)\n",
+			 size, mbox->size);
+		return -EINVAL;
+	}
+
+	if (header->length != size - sizeof(*header)) {
+		v4l2_err(&dev->v4l2_dev,
+			 "invalid message length: %u bytes (expected %zu bytes)\n",
+			 header->length, size - sizeof(*header));
+		return -EINVAL;
+	}
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "write command message: type %s, body length %d\n",
+		 msg_type_name(header->type), header->length);
+
+	mutex_lock(&mbox->lock);
+	regmap_read(dev->sram, mbox->tail, &tail);
+	if (tail > mbox->size) {
+		v4l2_err(&dev->v4l2_dev,
+			 "invalid tail (0x%x): must be smaller than mailbox size (0x%zx)\n",
+			 tail, mbox->size);
+		err = -EIO;
+		goto out;
+	}
+	size_no_wrap = min(size, mbox->size - (size_t)tail);
+	regmap_bulk_write(dev->sram, mbox->data + tail, src, size_no_wrap / 4);
+	regmap_bulk_write(dev->sram, mbox->data,
+			  src + size_no_wrap, (size - size_no_wrap) / 4);
+	regmap_write(dev->sram, mbox->tail, (tail + size) % mbox->size);
+
+out:
+	mutex_unlock(&mbox->lock);
+
+	return err;
+}
+
+static ssize_t allegro_mbox_read(struct allegro_dev *dev,
+				 struct allegro_mbox *mbox,
+				 void *dst, size_t nbyte)
+{
+	struct mcu_msg_header *header;
+	unsigned int head;
+	ssize_t size;
+	size_t body_no_wrap;
+
+	regmap_read(dev->sram, mbox->head, &head);
+	if (head > mbox->size) {
+		v4l2_err(&dev->v4l2_dev,
+			 "invalid head (0x%x): must be smaller than mailbox size (0x%zx)\n",
+			 head, mbox->size);
+		return -EIO;
+	}
+
+	/* Assume that the header does not wrap. */
+	regmap_bulk_read(dev->sram, mbox->data + head,
+			 dst, sizeof(*header) / 4);
+	header = dst;
+	size = header->length + sizeof(*header);
+	if (size > mbox->size || size & 0x3) {
+		v4l2_err(&dev->v4l2_dev,
+			 "invalid message length: %zu bytes (maximum %zu bytes)\n",
+			 header->length + sizeof(*header), mbox->size);
+		return -EIO;
+	}
+	if (size > nbyte) {
+		v4l2_err(&dev->v4l2_dev,
+			 "destination buffer too small: %zu bytes (need %zu bytes)\n",
+			 nbyte, size);
+		return -EINVAL;
+	}
+
+	/*
+	 * The message might wrap within the mailbox. If the message does not
+	 * wrap, the first read will read the entire message, otherwise the
+	 * first read will read message until the end of the mailbox and the
+	 * second read will read the remaining bytes from the beginning of the
+	 * mailbox.
+	 *
+	 * Skip the header, as was already read to get the size of the body.
+	 */
+	body_no_wrap = min((size_t)header->length,
+			   (mbox->size - (head + sizeof(*header))));
+	regmap_bulk_read(dev->sram, mbox->data + head + sizeof(*header),
+			 dst + sizeof(*header), body_no_wrap / 4);
+	regmap_bulk_read(dev->sram, mbox->data,
+			 dst + sizeof(*header) + body_no_wrap,
+			 (header->length - body_no_wrap) / 4);
+
+	regmap_write(dev->sram, mbox->head, (head + size) % mbox->size);
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "read status message: type %s, body length %d\n",
+		 msg_type_name(header->type), header->length);
+
+	return size;
+}
+
+static void allegro_mcu_interrupt(struct allegro_dev *dev)
+{
+	regmap_write(dev->regmap, AL5_MCU_INTERRUPT, BIT(0));
+}
+
+static void allegro_mcu_send_init(struct allegro_dev *dev,
+				  dma_addr_t suballoc_dma, size_t suballoc_size)
+{
+	struct mcu_msg_init_request msg;
+
+	memset(&msg, 0, sizeof(msg));
+
+	msg.header.type = MCU_MSG_TYPE_INIT;
+	msg.header.length = sizeof(msg) - sizeof(msg.header);
+
+	msg.suballoc_dma = lower_32_bits(suballoc_dma) | MCU_CACHE_OFFSET;
+	msg.suballoc_size = suballoc_size;
+
+	/* disable L2 cache */
+	msg.l2_cache[0] = -1;
+	msg.l2_cache[1] = -1;
+	msg.l2_cache[2] = -1;
+
+	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
+	allegro_mcu_interrupt(dev);
+}
+
+static u32 v4l2_pixelformat_to_mcu_format(u32 pixelformat)
+{
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		/* AL_420_8BITS: 0x100 -> NV12, 0x88 -> 8 bit */
+		return 0x100 | 0x88;
+	default:
+		return -EINVAL;
+	}
+}
+
+static u32 v4l2_colorspace_to_mcu_colorspace(enum v4l2_colorspace colorspace)
+{
+	switch (colorspace) {
+	case V4L2_COLORSPACE_REC709:
+		return 2;
+	case V4L2_COLORSPACE_SMPTE170M:
+		return 3;
+	case V4L2_COLORSPACE_SMPTE240M:
+		return 4;
+	case V4L2_COLORSPACE_SRGB:
+		return 7;
+	default:
+		/* UNKNOWN */
+		return 0;
+	}
+}
+
+static s8 v4l2_pixelformat_to_mcu_codec(u32 pixelformat)
+{
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_H264:
+	default:
+		return 1;
+	}
+}
+
+static u8 v4l2_profile_to_mcu_profile(enum v4l2_mpeg_video_h264_profile profile)
+{
+	switch (profile) {
+	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+	default:
+		return 66;
+	}
+}
+
+static u16 v4l2_level_to_mcu_level(enum v4l2_mpeg_video_h264_level level)
+{
+	switch (level) {
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+		return 10;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+		return 11;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+		return 12;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+		return 13;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+		return 20;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+		return 21;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+		return 22;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+		return 30;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+		return 31;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+		return 32;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		return 40;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+		return 41;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+		return 42;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		return 50;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+	default:
+		return 51;
+	}
+}
+
+static u32
+v4l2_bitrate_mode_to_mcu_mode(enum v4l2_mpeg_video_bitrate_mode mode)
+{
+	switch (mode) {
+	case V4L2_MPEG_VIDEO_BITRATE_MODE_VBR:
+		return 2;
+	case V4L2_MPEG_VIDEO_BITRATE_MODE_CBR:
+	default:
+		return 1;
+	}
+}
+
+static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
+					   struct allegro_channel *channel)
+{
+	struct mcu_msg_create_channel msg;
+
+	memset(&msg, 0, sizeof(msg));
+
+	msg.header.type = MCU_MSG_TYPE_CREATE_CHANNEL;
+	msg.header.length = sizeof(msg) - sizeof(msg.header);
+
+	msg.user_id = channel->user_id;
+	msg.width = channel->width;
+	msg.height = channel->height;
+	msg.format = v4l2_pixelformat_to_mcu_format(channel->pixelformat);
+	msg.colorspace = v4l2_colorspace_to_mcu_colorspace(channel->colorspace);
+	msg.src_mode = 0x0;
+	msg.profile = v4l2_profile_to_mcu_profile(channel->profile);
+	msg.constraint_set_flags = BIT(1);
+	msg.codec = v4l2_pixelformat_to_mcu_codec(channel->codec);
+	msg.level = v4l2_level_to_mcu_level(channel->level);
+	msg.tier = 0;
+	msg.sps_param = BIT(20) | 0x4a;
+	msg.pps_param = BIT(2);
+	msg.enc_option = AL_OPT_RDO_COST_MODE | AL_OPT_LF_X_TILE |
+			 AL_OPT_LF_X_SLICE | AL_OPT_LF;
+	msg.beta_offset = -1;
+	msg.tc_offset = -1;
+	msg.num_slices = 1;
+	msg.me_range[0] = 8;
+	msg.me_range[1] = 8;
+	msg.me_range[2] = 16;
+	msg.me_range[3] = 16;
+	msg.max_cu_size = ilog2(SIZE_MACROBLOCK);
+	msg.min_cu_size = ilog2(8);
+	msg.max_tu_size = 2;
+	msg.min_tu_size = 2;
+	msg.max_transfo_depth_intra = 1;
+	msg.max_transfo_depth_inter = 1;
+
+	msg.rate_control_mode =
+		v4l2_bitrate_mode_to_mcu_mode(channel->bitrate_mode);
+	/* Shall be ]0;cpb_size in 90 kHz units]. Use maximum value. */
+	msg.initial_rem_delay =
+		((channel->cpb_size * 1000) / channel->bitrate_peak) * 90000;
+	/* Encoder expects cpb_size in units of a 90 kHz clock. */
+	msg.cpb_size =
+		((channel->cpb_size * 1000) / channel->bitrate_peak) * 90000;
+	msg.framerate = 25;
+	msg.clk_ratio = 1000;
+	msg.target_bitrate = channel->bitrate;
+	msg.max_bitrate = channel->bitrate_peak;
+	msg.initial_qp = 25;
+	msg.min_qp = 10;
+	msg.max_qp = 51;
+	msg.ip_delta = -1;
+	msg.pb_delta = -1;
+	msg.golden_ref = 0;
+	msg.golden_delta = 2;
+	msg.golden_ref_frequency = 10;
+	msg.rate_control_option = 0x00000000;
+
+	msg.gop_ctrl_mode = 0x00000000;
+	msg.freq_ird = 0x7fffffff;
+	msg.freq_lt = 0;
+	msg.gdr_mode = 0x00000000;
+	msg.gop_length = channel->gop_size;
+	msg.subframe_latency = 0x00000000;
+	msg.lda_control_mode = 0x700d0000;
+
+	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
+	allegro_mcu_interrupt(dev);
+
+	return 0;
+}
+
+static int allegro_mcu_send_destroy_channel(struct allegro_dev *dev,
+					    struct allegro_channel *channel)
+{
+	struct mcu_msg_destroy_channel msg;
+
+	memset(&msg, 0, sizeof(msg));
+
+	msg.header.type = MCU_MSG_TYPE_DESTROY_CHANNEL;
+	msg.header.length = sizeof(msg) - sizeof(msg.header);
+
+	msg.channel_id = channel->mcu_channel_id;
+
+	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
+	allegro_mcu_interrupt(dev);
+
+	return 0;
+}
+
+static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
+					      struct allegro_channel *channel,
+					      dma_addr_t paddr,
+					      unsigned long size)
+{
+	struct mcu_msg_put_stream_buffer msg;
+
+	memset(&msg, 0, sizeof(msg));
+
+	msg.header.type = MCU_MSG_TYPE_PUT_STREAM_BUFFER;
+	msg.header.length = sizeof(msg) - sizeof(msg.header);
+
+	msg.channel_id = channel->mcu_channel_id;
+	msg.dma_addr = paddr;
+	msg.mcu_addr = paddr | MCU_CACHE_OFFSET;
+	msg.size = size;
+	msg.offset = ENCODER_STREAM_OFFSET;
+	msg.stream_id = 0; /* copied to mcu_msg_encode_frame_response */
+
+	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
+	allegro_mcu_interrupt(dev);
+
+	return 0;
+}
+
+static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
+					 struct allegro_channel *channel,
+					 dma_addr_t src_y, dma_addr_t src_uv)
+{
+	struct mcu_msg_encode_frame msg;
+
+	memset(&msg, 0, sizeof(msg));
+
+	msg.header.type = MCU_MSG_TYPE_ENCODE_FRAME;
+	msg.header.length = sizeof(msg) - sizeof(msg.header);
+
+	msg.channel_id = channel->mcu_channel_id;
+	msg.encoding_options = AL_OPT_FORCE_LOAD;
+	msg.pps_qp = 26; /* qp are relative to 26 */
+	msg.user_param = 0; /* copied to mcu_msg_encode_frame_response */
+	msg.src_handle = 0; /* copied to mcu_msg_encode_frame_response */
+	msg.src_y = src_y;
+	msg.src_uv = src_uv;
+	msg.stride = channel->stride;
+	msg.ep2 = 0x0;
+	msg.ep2_v = msg.ep2 | MCU_CACHE_OFFSET;
+
+	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
+	allegro_mcu_interrupt(dev);
+
+	return 0;
+}
+
+static int allegro_mcu_wait_for_init_timeout(struct allegro_dev *dev,
+					     unsigned long timeout_ms)
+{
+	unsigned long tmo;
+
+	tmo = wait_for_completion_timeout(&dev->init_complete,
+					  msecs_to_jiffies(timeout_ms));
+	if (tmo == 0)
+		return -ETIMEDOUT;
+
+	reinit_completion(&dev->init_complete);
+	return 0;
+}
+
+static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
+					    enum mcu_msg_type type)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct mcu_msg_push_buffers_internal *msg;
+	struct mcu_msg_push_buffers_internal_buffer *buffer;
+	unsigned int num_buffers = 0;
+	size_t size;
+	struct allegro_buffer *al_buffer;
+	struct list_head *list;
+	int err;
+
+	switch (type) {
+	case MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE:
+		list = &channel->buffers_reference;
+		break;
+	case MCU_MSG_TYPE_PUSH_BUFFER_INTERMEDIATE:
+		list = &channel->buffers_intermediate;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	list_for_each_entry(al_buffer, list, head)
+		num_buffers++;
+	size = struct_size(msg, buffer, num_buffers);
+
+	msg = kmalloc(size, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->header.length = size - sizeof(msg->header);
+	msg->header.type = type;
+	msg->channel_id = channel->mcu_channel_id;
+
+	buffer = msg->buffer;
+	list_for_each_entry(al_buffer, list, head) {
+		buffer->dma_addr = lower_32_bits(al_buffer->paddr);
+		buffer->mcu_addr =
+		    lower_32_bits(al_buffer->paddr) | MCU_CACHE_OFFSET;
+		buffer->size = al_buffer->size;
+		buffer++;
+	}
+
+	err = allegro_mbox_write(dev, &dev->mbox_command, msg, size);
+	if (err)
+		goto out;
+	allegro_mcu_interrupt(dev);
+
+out:
+	kfree(msg);
+	return err;
+}
+
+static int allegro_mcu_push_buffer_intermediate(struct allegro_channel *channel)
+{
+	enum mcu_msg_type type = MCU_MSG_TYPE_PUSH_BUFFER_INTERMEDIATE;
+
+	return allegro_mcu_push_buffer_internal(channel, type);
+}
+
+static int allegro_mcu_push_buffer_reference(struct allegro_channel *channel)
+{
+	enum mcu_msg_type type = MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE;
+
+	return allegro_mcu_push_buffer_internal(channel, type);
+}
+
+static int allocate_buffers_internal(struct allegro_channel *channel,
+				     struct list_head *list,
+				     size_t n, size_t size)
+{
+	struct allegro_dev *dev = channel->dev;
+	unsigned int i;
+	int err;
+	struct allegro_buffer *buffer, *tmp;
+
+	for (i = 0; i < n; i++) {
+		buffer = kmalloc(sizeof(*buffer), GFP_KERNEL);
+		if (!buffer) {
+			err = -ENOMEM;
+			goto err;
+		}
+		INIT_LIST_HEAD(&buffer->head);
+
+		err = allegro_alloc_buffer(dev, buffer, size);
+		if (err)
+			goto err;
+		list_add(&buffer->head, list);
+	}
+
+	return 0;
+
+err:
+	list_for_each_entry_safe(buffer, tmp, list, head) {
+		list_del(&buffer->head);
+		allegro_free_buffer(dev, buffer);
+		kfree(buffer);
+	}
+	return err;
+}
+
+static void destroy_buffers_internal(struct allegro_channel *channel,
+				     struct list_head *list)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct allegro_buffer *buffer, *tmp;
+
+	list_for_each_entry_safe(buffer, tmp, list, head) {
+		list_del(&buffer->head);
+		allegro_free_buffer(dev, buffer);
+		kfree(buffer);
+	}
+}
+
+static void destroy_reference_buffers(struct allegro_channel *channel)
+{
+	return destroy_buffers_internal(channel, &channel->buffers_reference);
+}
+
+static void destroy_intermediate_buffers(struct allegro_channel *channel)
+{
+	return destroy_buffers_internal(channel,
+					&channel->buffers_intermediate);
+}
+
+static int allocate_intermediate_buffers(struct allegro_channel *channel,
+					 size_t n, size_t size)
+{
+	return allocate_buffers_internal(channel,
+					 &channel->buffers_intermediate,
+					 n, size);
+}
+
+static int allocate_reference_buffers(struct allegro_channel *channel,
+				      size_t n, size_t size)
+{
+	return allocate_buffers_internal(channel,
+					 &channel->buffers_reference,
+					 n, PAGE_ALIGN(size));
+}
+
+static bool allegro_channel_is_at_eos(struct allegro_channel *channel)
+{
+	bool is_at_eos = false;
+
+	switch (allegro_get_state(channel)) {
+	case ALLEGRO_STATE_STOPPED:
+		is_at_eos = true;
+		break;
+	case ALLEGRO_STATE_DRAIN:
+	case ALLEGRO_STATE_WAIT_FOR_BUFFER:
+		if (v4l2_m2m_num_src_bufs_ready(channel->fh.m2m_ctx) == 0)
+			is_at_eos = true;
+		break;
+	default:
+		break;
+	}
+
+	return is_at_eos;
+}
+
+static void allegro_channel_buf_done(struct allegro_channel *channel,
+				     struct vb2_v4l2_buffer *buf,
+				     enum vb2_buffer_state state)
+{
+	const struct v4l2_event eos_event = {
+		.type = V4L2_EVENT_EOS
+	};
+
+	if (allegro_channel_is_at_eos(channel)) {
+		buf->flags |= V4L2_BUF_FLAG_LAST;
+		v4l2_event_queue_fh(&channel->fh, &eos_event);
+
+		allegro_set_state(channel, ALLEGRO_STATE_STOPPED);
+	}
+
+	v4l2_m2m_buf_done(buf, state);
+}
+
+static void allegro_channel_finish_frame(struct allegro_channel *channel,
+		struct mcu_msg_encode_frame_response *msg)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct vb2_v4l2_buffer *src_buf;
+	struct vb2_v4l2_buffer *dst_buf;
+	struct {
+		u32 offset;
+		u32 size;
+	} *partition;
+	enum vb2_buffer_state state = VB2_BUF_STATE_ERROR;
+
+	src_buf = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx);
+
+	dst_buf = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx);
+	dst_buf->sequence = channel->csequence++;
+
+	if (msg->error_code) {
+		v4l2_err(&dev->v4l2_dev,
+			 "channel %d: error while encoding frame: %x\n",
+			 channel->mcu_channel_id, msg->error_code);
+		goto err;
+	}
+
+	if (msg->partition_table_size != 1) {
+		v4l2_warn(&dev->v4l2_dev,
+			  "channel %d: only handling first partition table entry (%d entries)\n",
+			  channel->mcu_channel_id, msg->partition_table_size);
+	}
+
+	if (msg->partition_table_offset +
+	    msg->partition_table_size * sizeof(*partition) >
+	    vb2_plane_size(&dst_buf->vb2_buf, 0)) {
+		v4l2_err(&dev->v4l2_dev,
+			 "channel %d: partition table outside of dst_buf\n",
+			 channel->mcu_channel_id);
+		goto err;
+	}
+
+	partition =
+	    vb2_plane_vaddr(&dst_buf->vb2_buf, 0) + msg->partition_table_offset;
+	if (partition->offset + partition->size >
+	    vb2_plane_size(&dst_buf->vb2_buf, 0)) {
+		v4l2_err(&dev->v4l2_dev,
+			 "channel %d: encoded frame is outside of dst_buf (offset 0x%x, size 0x%x)\n",
+			 channel->mcu_channel_id, partition->offset,
+			 partition->size);
+		goto err;
+	}
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "channel %d: encoded frame of size %d is at offset 0x%x\n",
+		 channel->mcu_channel_id, partition->size, partition->offset);
+
+	/*
+	 * The payload must include the data before the partition offset,
+	 * because we will put the sps and pps data there.
+	 */
+
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+			      partition->offset + partition->size);
+
+	state = VB2_BUF_STATE_DONE;
+
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
+	if (msg->is_idr)
+		dst_buf->flags |= V4L2_BUF_FLAG_KEYFRAME;
+	else
+		dst_buf->flags |= V4L2_BUF_FLAG_PFRAME;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "channel %d: encoded frame #%03d (%s%s, %d bytes)\n",
+		 channel->mcu_channel_id,
+		 dst_buf->sequence,
+		 msg->is_idr ? "IDR, " : "",
+		 msg->slice_type == AL_ENC_SLICE_TYPE_I ? "I slice" :
+		 msg->slice_type == AL_ENC_SLICE_TYPE_P ? "P slice" : "unknown",
+		 partition->size);
+
+err:
+	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+
+	allegro_channel_buf_done(channel, dst_buf, state);
+
+	v4l2_m2m_job_finish(dev->m2m_dev, channel->fh.m2m_ctx);
+}
+
+static int allegro_handle_init(struct allegro_dev *dev,
+			       struct mcu_msg_init_response *msg)
+{
+	complete(&dev->init_complete);
+
+	return 0;
+}
+
+static int
+allegro_handle_create_channel(struct allegro_dev *dev,
+			      struct mcu_msg_create_channel_response *msg)
+{
+	struct allegro_channel *channel;
+	int err = 0;
+
+	channel = allegro_find_channel_by_user_id(dev, msg->user_id);
+	if (IS_ERR(channel)) {
+		v4l2_warn(&dev->v4l2_dev,
+			  "received %s for unknown user %d\n",
+			  msg_type_name(msg->header.type),
+			  msg->user_id);
+		return -EINVAL;
+	}
+
+	if (msg->error_code) {
+		v4l2_err(&dev->v4l2_dev,
+			 "user %d: mcu failed to create channel: error %x\n",
+			 channel->user_id, msg->error_code);
+		err = -EIO;
+		goto out;
+	}
+
+	channel->mcu_channel_id = msg->channel_id;
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "user %d: channel has channel id %d\n",
+		 channel->user_id, channel->mcu_channel_id);
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "channel %d: intermediate buffers: %d x %d bytes\n",
+		 channel->mcu_channel_id,
+		 msg->int_buffers_count, msg->int_buffers_size);
+	err = allocate_intermediate_buffers(channel, msg->int_buffers_count,
+					    msg->int_buffers_size);
+	if (err) {
+		v4l2_err(&dev->v4l2_dev,
+			 "channel %d: failed to allocate intermediate buffers\n",
+			 channel->mcu_channel_id);
+		goto out;
+	}
+	err = allegro_mcu_push_buffer_intermediate(channel);
+	if (err)
+		goto out;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "channel %d: reference buffers: %d x %d bytes\n",
+		 channel->mcu_channel_id,
+		 msg->rec_buffers_count, msg->rec_buffers_size);
+	err = allocate_reference_buffers(channel, msg->rec_buffers_count,
+					 msg->rec_buffers_size);
+	if (err) {
+		v4l2_err(&dev->v4l2_dev,
+			 "channel %d: failed to allocate reference buffers\n",
+			 channel->mcu_channel_id);
+		goto out;
+	}
+	err = allegro_mcu_push_buffer_reference(channel);
+	if (err)
+		goto out;
+
+out:
+	channel->error = err;
+	complete(&channel->completion);
+
+	/* Handled successfully, error is passed via channel->error */
+	return 0;
+}
+
+static int
+allegro_handle_destroy_channel(struct allegro_dev *dev,
+			       struct mcu_msg_destroy_channel_response *msg)
+{
+	struct allegro_channel *channel;
+
+	channel = allegro_find_channel_by_channel_id(dev, msg->channel_id);
+	if (IS_ERR(channel)) {
+		v4l2_err(&dev->v4l2_dev,
+			 "received %s for unknown channel %d\n",
+			 msg_type_name(msg->header.type),
+			 msg->channel_id);
+		return -EINVAL;
+	}
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "user %d: vcu destroyed channel %d\n",
+		 channel->user_id, channel->mcu_channel_id);
+	complete(&channel->completion);
+
+	return 0;
+}
+
+static int
+allegro_handle_encode_frame(struct allegro_dev *dev,
+			    struct mcu_msg_encode_frame_response *msg)
+{
+	struct allegro_channel *channel;
+
+	channel = allegro_find_channel_by_channel_id(dev, msg->channel_id);
+	if (IS_ERR(channel)) {
+		v4l2_err(&dev->v4l2_dev,
+			 "received %s for unknown channel %d\n",
+			 msg_type_name(msg->header.type),
+			 msg->channel_id);
+		return -EINVAL;
+	}
+
+	allegro_channel_finish_frame(channel, msg);
+
+	return 0;
+}
+
+static int allegro_receive_message(struct allegro_dev *dev)
+{
+	union mcu_msg_response *msg;
+	ssize_t size;
+	int err = 0;
+
+	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	size = allegro_mbox_read(dev, &dev->mbox_status, msg, sizeof(*msg));
+	if (size < sizeof(msg->header)) {
+		v4l2_err(&dev->v4l2_dev,
+			 "invalid mbox message (%zd): must be at least %zu\n",
+			 size, sizeof(msg->header));
+		err = -EINVAL;
+		goto out;
+	}
+
+	switch (msg->header.type) {
+	case MCU_MSG_TYPE_INIT:
+		err = allegro_handle_init(dev, &msg->init);
+		break;
+	case MCU_MSG_TYPE_CREATE_CHANNEL:
+		err = allegro_handle_create_channel(dev, &msg->create_channel);
+		break;
+	case MCU_MSG_TYPE_DESTROY_CHANNEL:
+		err = allegro_handle_destroy_channel(dev,
+						     &msg->destroy_channel);
+		break;
+	case MCU_MSG_TYPE_ENCODE_FRAME:
+		err = allegro_handle_encode_frame(dev, &msg->encode_frame);
+		break;
+	default:
+		v4l2_warn(&dev->v4l2_dev,
+			  "%s: unknown message %s\n",
+			  __func__, msg_type_name(msg->header.type));
+		err = -EINVAL;
+		break;
+	}
+
+out:
+	kfree(msg);
+
+	return err;
+}
+
+irqreturn_t allegro_hardirq(int irq, void *data)
+{
+	struct allegro_dev *dev = data;
+	unsigned int status;
+
+	regmap_read(dev->regmap, AL5_ITC_CPU_IRQ_STA, &status);
+	if (!(status & AL5_ITC_CPU_IRQ_STA_TRIGGERED))
+		return IRQ_NONE;
+
+	regmap_write(dev->regmap, AL5_ITC_CPU_IRQ_CLR, status);
+
+	return IRQ_WAKE_THREAD;
+}
+
+irqreturn_t allegro_irq_thread(int irq, void *data)
+{
+	struct allegro_dev *dev = data;
+
+	allegro_receive_message(dev);
+
+	return IRQ_HANDLED;
+}
+
+static void allegro_copy_firmware(struct allegro_dev *dev,
+				  const u8 * const buf, size_t size)
+{
+	int err = 0;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "copy mcu firmware (%zu B) to SRAM\n", size);
+	err = regmap_bulk_write(dev->sram, 0x0, buf, size / 4);
+	if (err)
+		v4l2_err(&dev->v4l2_dev,
+			 "failed to copy firmware: %d\n", err);
+}
+
+static void allegro_copy_fw_codec(struct allegro_dev *dev,
+				  const u8 * const buf, size_t size)
+{
+	int err;
+	dma_addr_t icache_offset, dcache_offset;
+
+	/*
+	 * The downstream allocates 600 KB for the codec firmware to have some
+	 * extra space for "possible extensions." My tests were fine with
+	 * allocating just enough memory for the actual firmware, but I am not
+	 * sure that the firmware really does not use the remaining space.
+	 */
+	err = allegro_alloc_buffer(dev, &dev->firmware, size);
+	if (err) {
+		v4l2_err(&dev->v4l2_dev,
+			 "failed to allocate %zu bytes for firmware\n", size);
+		return;
+	}
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "copy codec firmware (%zd B) to phys %pad\n",
+		 size, &dev->firmware.paddr);
+	memcpy(dev->firmware.vaddr, buf, size);
+
+	regmap_write(dev->regmap, AXI_ADDR_OFFSET_IP,
+		     upper_32_bits(dev->firmware.paddr));
+
+	icache_offset = dev->firmware.paddr - MCU_CACHE_OFFSET;
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "icache_offset: msb = 0x%x, lsb = 0x%x\n",
+		 upper_32_bits(icache_offset), lower_32_bits(icache_offset));
+	regmap_write(dev->regmap, AL5_ICACHE_ADDR_OFFSET_MSB,
+		     upper_32_bits(icache_offset));
+	regmap_write(dev->regmap, AL5_ICACHE_ADDR_OFFSET_LSB,
+		     lower_32_bits(icache_offset));
+
+	dcache_offset =
+	    (dev->firmware.paddr & 0xffffffff00000000) - MCU_CACHE_OFFSET;
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "dcache_offset: msb = 0x%x, lsb = 0x%x\n",
+		 upper_32_bits(dcache_offset), lower_32_bits(dcache_offset));
+	regmap_write(dev->regmap, AL5_DCACHE_ADDR_OFFSET_MSB,
+		     upper_32_bits(dcache_offset));
+	regmap_write(dev->regmap, AL5_DCACHE_ADDR_OFFSET_LSB,
+		     lower_32_bits(dcache_offset));
+}
+
+static void allegro_free_fw_codec(struct allegro_dev *dev)
+{
+	allegro_free_buffer(dev, &dev->firmware);
+}
+
+/*
+ * Control functions for the MCU
+ */
+
+static int allegro_mcu_enable_interrupts(struct allegro_dev *dev)
+{
+	return regmap_write(dev->regmap, AL5_ITC_CPU_IRQ_MSK, BIT(0));
+}
+
+static int allegro_mcu_disable_interrupts(struct allegro_dev *dev)
+{
+	return regmap_write(dev->regmap, AL5_ITC_CPU_IRQ_MSK, 0);
+}
+
+static int allegro_mcu_wait_for_sleep(struct allegro_dev *dev)
+{
+	unsigned long timeout;
+	unsigned int status;
+
+	timeout = jiffies + msecs_to_jiffies(100);
+	while (regmap_read(dev->regmap, AL5_MCU_STA, &status) == 0 &&
+	       status != AL5_MCU_STA_SLEEP) {
+		if (time_after(jiffies, timeout))
+			return -ETIMEDOUT;
+		cpu_relax();
+	}
+
+	return 0;
+}
+
+static int allegro_mcu_start(struct allegro_dev *dev)
+{
+	unsigned long timeout;
+	unsigned int status;
+	int err;
+
+	err = regmap_write(dev->regmap, AL5_MCU_WAKEUP, BIT(0));
+	if (err)
+		return err;
+
+	timeout = jiffies + msecs_to_jiffies(100);
+	while (regmap_read(dev->regmap, AL5_MCU_STA, &status) == 0 &&
+	       status == AL5_MCU_STA_SLEEP) {
+		if (time_after(jiffies, timeout))
+			return -ETIMEDOUT;
+		cpu_relax();
+	}
+
+	err = regmap_write(dev->regmap, AL5_MCU_WAKEUP, 0);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int allegro_mcu_reset(struct allegro_dev *dev)
+{
+	int err;
+
+	err = regmap_write(dev->regmap,
+			   AL5_MCU_RESET_MODE, AL5_MCU_RESET_MODE_SLEEP);
+	if (err < 0)
+		return err;
+
+	err = regmap_write(dev->regmap, AL5_MCU_RESET, AL5_MCU_RESET_SOFT);
+	if (err < 0)
+		return err;
+
+	return allegro_mcu_wait_for_sleep(dev);
+}
+
+static void allegro_destroy_channel(struct allegro_channel *channel)
+{
+	struct allegro_dev *dev = channel->dev;
+	unsigned long timeout;
+
+	if (channel_exists(channel)) {
+		reinit_completion(&channel->completion);
+		allegro_mcu_send_destroy_channel(dev, channel);
+		timeout = wait_for_completion_timeout(&channel->completion,
+						      msecs_to_jiffies(5000));
+		if (timeout == 0)
+			v4l2_warn(&dev->v4l2_dev,
+				  "channel %d: timeout while destroying\n",
+				  channel->mcu_channel_id);
+
+		channel->mcu_channel_id = -1;
+	}
+
+	destroy_intermediate_buffers(channel);
+	destroy_reference_buffers(channel);
+
+	v4l2_ctrl_grab(channel->mpeg_video_h264_profile, false);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_level, false);
+	v4l2_ctrl_grab(channel->mpeg_video_bitrate_mode, false);
+	v4l2_ctrl_grab(channel->mpeg_video_bitrate, false);
+	v4l2_ctrl_grab(channel->mpeg_video_bitrate_peak, false);
+	v4l2_ctrl_grab(channel->mpeg_video_cpb_size, false);
+	v4l2_ctrl_grab(channel->mpeg_video_gop_size, false);
+
+	if (channel->user_id != -1) {
+		clear_bit(channel->user_id, &dev->channel_user_ids);
+		channel->user_id = -1;
+	}
+}
+
+/*
+ * Create the MCU channel
+ *
+ * After the channel has been created, the picture size, format, colorspace
+ * and framerate are fixed. Also the codec, profile, bitrate, etc. cannot be
+ * changed anymore.
+ *
+ * The channel can be created only once. The MCU will accept source buffers
+ * and stream buffers only after a channel has been created.
+ */
+static int allegro_create_channel(struct allegro_channel *channel)
+{
+	struct allegro_dev *dev = channel->dev;
+	unsigned long timeout;
+	enum v4l2_mpeg_video_h264_level min_level;
+
+	if (channel_exists(channel)) {
+		v4l2_warn(&dev->v4l2_dev,
+			  "channel already exists\n");
+		return 0;
+	}
+
+	channel->user_id = allegro_next_user_id(dev);
+	if (channel->user_id < 0) {
+		v4l2_err(&dev->v4l2_dev,
+			 "no free channels available\n");
+		return -EBUSY;
+	}
+	set_bit(channel->user_id, &dev->channel_user_ids);
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "user %d: creating channel (%4.4s, %dx%d@%d)\n",
+		 channel->user_id,
+		 (char *)&channel->codec, channel->width, channel->height, 25);
+
+	min_level = select_minimum_h264_level(channel->width, channel->height);
+	if (channel->level < min_level) {
+		v4l2_warn(&dev->v4l2_dev,
+			  "user %d: selected Level %s too low: increasing to Level %s\n",
+			  channel->user_id,
+			  v4l2_ctrl_get_menu(V4L2_CID_MPEG_VIDEO_H264_LEVEL)[channel->level],
+			  v4l2_ctrl_get_menu(V4L2_CID_MPEG_VIDEO_H264_LEVEL)[min_level]);
+		channel->level = min_level;
+	}
+
+	v4l2_ctrl_grab(channel->mpeg_video_h264_profile, true);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_level, true);
+	v4l2_ctrl_grab(channel->mpeg_video_bitrate_mode, true);
+	v4l2_ctrl_grab(channel->mpeg_video_bitrate, true);
+	v4l2_ctrl_grab(channel->mpeg_video_bitrate_peak, true);
+	v4l2_ctrl_grab(channel->mpeg_video_cpb_size, true);
+	v4l2_ctrl_grab(channel->mpeg_video_gop_size, true);
+
+	reinit_completion(&channel->completion);
+	allegro_mcu_send_create_channel(dev, channel);
+	timeout = wait_for_completion_timeout(&channel->completion,
+					      msecs_to_jiffies(5000));
+	if (timeout == 0)
+		channel->error = -ETIMEDOUT;
+	if (channel->error)
+		goto err;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "channel %d: accepting buffers\n",
+		 channel->mcu_channel_id);
+
+	return 0;
+
+err:
+	allegro_destroy_channel(channel);
+
+	return channel->error;
+}
+
+static void allegro_set_default_params(struct allegro_channel *channel)
+{
+	channel->width = ALLEGRO_WIDTH_DEFAULT;
+	channel->height = ALLEGRO_HEIGHT_DEFAULT;
+	channel->stride = round_up(channel->width, 32);
+
+	channel->colorspace = V4L2_COLORSPACE_REC709;
+	channel->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	channel->quantization = V4L2_QUANTIZATION_DEFAULT;
+	channel->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	channel->pixelformat = V4L2_PIX_FMT_NV12;
+	channel->sizeimage_raw = channel->stride * channel->height * 3 / 2;
+
+	channel->codec = V4L2_PIX_FMT_H264;
+	channel->profile = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
+	channel->level =
+		select_minimum_h264_level(channel->width, channel->height);
+	channel->sizeimage_encoded =
+		estimate_stream_size(channel->width, channel->height);
+
+	channel->bitrate_mode = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR;
+	channel->bitrate = maximum_bitrate(channel->level);
+	channel->bitrate_peak = maximum_bitrate(channel->level);
+	channel->cpb_size = maximum_cpb_size(channel->level);
+	channel->gop_size = ALLEGRO_GOP_SIZE_DEFAULT;
+}
+
+static int allegro_queue_setup(struct vb2_queue *vq,
+			       unsigned int *nbuffers, unsigned int *nplanes,
+			       unsigned int sizes[],
+			       struct device *alloc_devs[])
+{
+	struct allegro_channel *channel = vb2_get_drv_priv(vq);
+	struct allegro_dev *dev = channel->dev;
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "%s: queue setup[%s]: nplanes = %d\n",
+		 V4L2_TYPE_IS_OUTPUT(vq->type) ? "output" : "capture",
+		 *nplanes == 0 ? "REQBUFS" : "CREATE_BUFS", *nplanes);
+
+	if (*nplanes != 0) {
+		if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
+			if (sizes[0] < channel->sizeimage_raw)
+				return -EINVAL;
+		} else {
+			if (sizes[0] < channel->sizeimage_encoded)
+				return -EINVAL;
+		}
+	} else {
+		*nplanes = 1;
+		if (V4L2_TYPE_IS_OUTPUT(vq->type))
+			sizes[0] = channel->sizeimage_raw;
+		else
+			sizes[0] = channel->sizeimage_encoded;
+	}
+
+	return 0;
+}
+
+static int allegro_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct allegro_channel *channel = vb2_get_drv_priv(vb->vb2_queue);
+	struct allegro_dev *dev = channel->dev;
+
+	if (allegro_get_state(channel) == ALLEGRO_STATE_DRAIN &&
+	    V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
+		return -EBUSY;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+		if (vbuf->field == V4L2_FIELD_ANY)
+			vbuf->field = V4L2_FIELD_NONE;
+		if (vbuf->field != V4L2_FIELD_NONE) {
+			v4l2_err(&dev->v4l2_dev,
+				 "channel %d: unsupported field\n",
+				 channel->mcu_channel_id);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void allegro_buf_queue(struct vb2_buffer *vb)
+{
+	struct allegro_channel *channel = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (allegro_get_state(channel) == ALLEGRO_STATE_WAIT_FOR_BUFFER &&
+	    vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		allegro_channel_buf_done(channel, vbuf, VB2_BUF_STATE_DONE);
+		return;
+	}
+
+	v4l2_m2m_buf_queue(channel->fh.m2m_ctx, vbuf);
+}
+
+static int allegro_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct allegro_channel *channel = vb2_get_drv_priv(q);
+	struct allegro_dev *dev = channel->dev;
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "%s: start streaming\n",
+		 V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture");
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		channel->osequence = 0;
+		allegro_set_state(channel, ALLEGRO_STATE_ENCODING);
+	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		channel->csequence = 0;
+	}
+
+	return 0;
+}
+
+static void allegro_stop_streaming(struct vb2_queue *q)
+{
+	struct allegro_channel *channel = vb2_get_drv_priv(q);
+	struct allegro_dev *dev = channel->dev;
+	struct vb2_v4l2_buffer *buffer;
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "%s: stop streaming\n",
+		 V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture");
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		allegro_set_state(channel, ALLEGRO_STATE_STOPPED);
+		while ((buffer = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx)))
+			v4l2_m2m_buf_done(buffer, VB2_BUF_STATE_ERROR);
+	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		allegro_destroy_channel(channel);
+		while ((buffer = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx)))
+			v4l2_m2m_buf_done(buffer, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct vb2_ops allegro_queue_ops = {
+	.queue_setup = allegro_queue_setup,
+	.buf_prepare = allegro_buf_prepare,
+	.buf_queue = allegro_buf_queue,
+	.start_streaming = allegro_start_streaming,
+	.stop_streaming = allegro_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+static int allegro_queue_init(void *priv,
+			      struct vb2_queue *src_vq,
+			      struct vb2_queue *dst_vq)
+{
+	int err;
+	struct allegro_channel *channel = priv;
+
+	src_vq->dev = &channel->dev->plat_dev->dev;
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	src_vq->io_modes = VB2_DMABUF | VB2_MMAP;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->drv_priv = channel;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->ops = &allegro_queue_ops;
+	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->lock = &channel->dev->lock;
+	err = vb2_queue_init(src_vq);
+	if (err)
+		return err;
+
+	dst_vq->dev = &channel->dev->plat_dev->dev;
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->drv_priv = channel;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->ops = &allegro_queue_ops;
+	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->lock = &channel->dev->lock;
+	err = vb2_queue_init(dst_vq);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct allegro_channel *channel = container_of(ctrl->handler,
+						       struct allegro_channel,
+						       ctrl_handler);
+	struct allegro_dev *dev = channel->dev;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "s_ctrl: %s = %d\n", v4l2_ctrl_get_name(ctrl->id), ctrl->val);
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		channel->level = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+		channel->bitrate_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE:
+		channel->bitrate = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
+		channel->bitrate_peak = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:
+		channel->cpb_size = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+		channel->gop_size = ctrl->val;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops allegro_ctrl_ops = {
+	.s_ctrl = allegro_s_ctrl,
+};
+
+static int allegro_open(struct file *file)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct allegro_dev *dev = video_get_drvdata(vdev);
+	struct allegro_channel *channel = NULL;
+	struct v4l2_ctrl_handler *handler;
+	u64 mask;
+
+	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
+	if (!channel)
+		return -ENOMEM;
+
+	v4l2_fh_init(&channel->fh, vdev);
+	file->private_data = &channel->fh;
+	v4l2_fh_add(&channel->fh);
+
+	init_completion(&channel->completion);
+
+	channel->dev = dev;
+
+	allegro_set_default_params(channel);
+
+	handler = &channel->ctrl_handler;
+	v4l2_ctrl_handler_init(handler, 0);
+	channel->mpeg_video_h264_profile = v4l2_ctrl_new_std_menu(handler,
+			&allegro_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE, 0x0,
+			V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
+	mask = 1 << V4L2_MPEG_VIDEO_H264_LEVEL_1B;
+	channel->mpeg_video_h264_level = v4l2_ctrl_new_std_menu(handler,
+			&allegro_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+			V4L2_MPEG_VIDEO_H264_LEVEL_5_1, mask,
+			V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	channel->mpeg_video_bitrate_mode = v4l2_ctrl_new_std_menu(handler,
+			&allegro_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
+			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
+			channel->bitrate_mode);
+	channel->mpeg_video_bitrate = v4l2_ctrl_new_std(handler,
+			&allegro_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_BITRATE,
+			0, maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
+			1, channel->bitrate);
+	channel->mpeg_video_bitrate_peak = v4l2_ctrl_new_std(handler,
+			&allegro_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
+			0, maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
+			1, channel->bitrate_peak);
+	channel->mpeg_video_cpb_size = v4l2_ctrl_new_std(handler,
+			&allegro_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE,
+			0, maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
+			1, channel->cpb_size);
+	channel->mpeg_video_gop_size = v4l2_ctrl_new_std(handler,
+			&allegro_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+			0, ALLEGRO_GOP_SIZE_MAX,
+			1, channel->gop_size);
+	v4l2_ctrl_new_std(handler,
+			&allegro_ctrl_ops,
+			V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
+			1, 32,
+			1, 1);
+	channel->fh.ctrl_handler = handler;
+
+	channel->mcu_channel_id = -1;
+	channel->user_id = -1;
+
+	INIT_LIST_HEAD(&channel->buffers_reference);
+	INIT_LIST_HEAD(&channel->buffers_intermediate);
+
+	list_add(&channel->list, &dev->channels);
+
+	channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
+						allegro_queue_init);
+
+	return 0;
+}
+
+static int allegro_release(struct file *file)
+{
+	struct allegro_channel *channel = fh_to_channel(file->private_data);
+
+	v4l2_m2m_ctx_release(channel->fh.m2m_ctx);
+
+	list_del(&channel->list);
+
+	v4l2_ctrl_handler_free(&channel->ctrl_handler);
+
+	v4l2_fh_del(&channel->fh);
+	v4l2_fh_exit(&channel->fh);
+
+	kfree(channel);
+
+	return 0;
+}
+
+static int allegro_querycap(struct file *file, void *fh,
+			    struct v4l2_capability *cap)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct allegro_dev *dev = video_get_drvdata(vdev);
+
+	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
+	strscpy(cap->card, "Allegro DVT Video Encoder", sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(&dev->plat_dev->dev));
+
+	return 0;
+}
+
+static int allegro_enum_fmt_vid(struct file *file, void *fh,
+				struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		f->pixelformat = V4L2_PIX_FMT_NV12;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+		f->pixelformat = V4L2_PIX_FMT_H264;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int allegro_g_fmt_vid_cap(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct allegro_channel *channel = fh_to_channel(fh);
+
+	f->fmt.pix.field = V4L2_FIELD_NONE;
+	f->fmt.pix.width = channel->width;
+	f->fmt.pix.height = channel->height;
+
+	f->fmt.pix.colorspace = channel->colorspace;
+	f->fmt.pix.ycbcr_enc = channel->ycbcr_enc;
+	f->fmt.pix.quantization = channel->quantization;
+	f->fmt.pix.xfer_func = channel->xfer_func;
+
+	f->fmt.pix.pixelformat = channel->codec;
+	f->fmt.pix.bytesperline = 0;
+	f->fmt.pix.sizeimage = channel->sizeimage_encoded;
+
+	return 0;
+}
+
+static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	f->fmt.pix.field = V4L2_FIELD_NONE;
+
+	f->fmt.pix.width = clamp_t(__u32, f->fmt.pix.width,
+				   ALLEGRO_WIDTH_MIN, ALLEGRO_WIDTH_MAX);
+	f->fmt.pix.height = clamp_t(__u32, f->fmt.pix.height,
+				    ALLEGRO_HEIGHT_MIN, ALLEGRO_HEIGHT_MAX);
+
+	f->fmt.pix.pixelformat = V4L2_PIX_FMT_H264;
+	f->fmt.pix.bytesperline = 0;
+	f->fmt.pix.sizeimage =
+		estimate_stream_size(f->fmt.pix.width, f->fmt.pix.height);
+
+	return 0;
+}
+
+static int allegro_g_fmt_vid_out(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct allegro_channel *channel = fh_to_channel(fh);
+
+	f->fmt.pix.field = V4L2_FIELD_NONE;
+
+	f->fmt.pix.width = channel->width;
+	f->fmt.pix.height = channel->height;
+
+	f->fmt.pix.colorspace = channel->colorspace;
+	f->fmt.pix.ycbcr_enc = channel->ycbcr_enc;
+	f->fmt.pix.quantization = channel->quantization;
+	f->fmt.pix.xfer_func = channel->xfer_func;
+
+	f->fmt.pix.pixelformat = channel->pixelformat;
+	f->fmt.pix.bytesperline = channel->stride;
+	f->fmt.pix.sizeimage = channel->sizeimage_raw;
+
+	return 0;
+}
+
+static int allegro_try_fmt_vid_out(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	f->fmt.pix.field = V4L2_FIELD_NONE;
+
+	f->fmt.pix.width = clamp_t(__u32, f->fmt.pix.width,
+				   ALLEGRO_WIDTH_MIN, ALLEGRO_WIDTH_MAX);
+	f->fmt.pix.height = clamp_t(__u32, f->fmt.pix.height,
+				    ALLEGRO_HEIGHT_MIN, ALLEGRO_HEIGHT_MAX);
+
+	f->fmt.pix.pixelformat = V4L2_PIX_FMT_NV12;
+	f->fmt.pix.bytesperline = round_up(f->fmt.pix.width, 32);
+	f->fmt.pix.sizeimage =
+		f->fmt.pix.bytesperline * f->fmt.pix.height * 3 / 2;
+
+	return 0;
+}
+
+static int allegro_s_fmt_vid_out(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct allegro_channel *channel = fh_to_channel(fh);
+	int err;
+
+	err = allegro_try_fmt_vid_out(file, fh, f);
+	if (err)
+		return err;
+
+	channel->width = f->fmt.pix.width;
+	channel->height = f->fmt.pix.height;
+	channel->stride = f->fmt.pix.bytesperline;
+	channel->sizeimage_raw = f->fmt.pix.sizeimage;
+
+	channel->colorspace = f->fmt.pix.colorspace;
+	channel->ycbcr_enc = f->fmt.pix.ycbcr_enc;
+	channel->quantization = f->fmt.pix.quantization;
+	channel->xfer_func = f->fmt.pix.xfer_func;
+
+	channel->level =
+		select_minimum_h264_level(channel->width, channel->height);
+	channel->sizeimage_encoded =
+		estimate_stream_size(channel->width, channel->height);
+
+	return 0;
+}
+
+static int allegro_g_selection(struct file *file, void *priv,
+			       struct v4l2_selection *s)
+{
+	struct v4l2_fh *fh = file->private_data;
+	struct allegro_channel *channel = fh_to_channel(fh);
+
+	if (!V4L2_TYPE_IS_OUTPUT(s->type))
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = channel->width;
+		s->r.height = channel->height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int allegro_s_selection(struct file *file, void *priv,
+			       struct v4l2_selection *s)
+{
+	return -EINVAL;
+}
+
+static int allegro_try_encoder_cmd(struct file *file, void *fh,
+				   struct v4l2_encoder_cmd *cmd)
+{
+	switch (cmd->cmd) {
+	case V4L2_ENC_CMD_START:
+		cmd->flags = 0;
+		break;
+	case V4L2_ENC_CMD_STOP:
+		if (cmd->flags)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int allegro_channel_cmd_stop(struct allegro_channel *channel)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct vb2_v4l2_buffer *dst_buf;
+
+	switch (allegro_get_state(channel)) {
+	case ALLEGRO_STATE_DRAIN:
+	case ALLEGRO_STATE_WAIT_FOR_BUFFER:
+		return -EBUSY;
+	case ALLEGRO_STATE_ENCODING:
+		allegro_set_state(channel, ALLEGRO_STATE_DRAIN);
+		break;
+	default:
+		return 0;
+	}
+
+	/* If there are output buffers, they must be encoded */
+	if (v4l2_m2m_num_src_bufs_ready(channel->fh.m2m_ctx) != 0) {
+		v4l2_dbg(1, debug,  &dev->v4l2_dev,
+			 "channel %d: CMD_STOP: continue encoding src buffers\n",
+			 channel->mcu_channel_id);
+		return 0;
+	}
+
+	/* If there are capture buffers, use it to signal EOS */
+	dst_buf = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx);
+	if (dst_buf) {
+		v4l2_dbg(1, debug,  &dev->v4l2_dev,
+			 "channel %d: CMD_STOP: signaling EOS\n",
+			 channel->mcu_channel_id);
+		allegro_channel_buf_done(channel, dst_buf, VB2_BUF_STATE_DONE);
+		return 0;
+	}
+
+	/*
+	 * If there are no capture buffers, we need to wait for the next
+	 * buffer to signal EOS.
+	 */
+	v4l2_dbg(1, debug,  &dev->v4l2_dev,
+		 "channel %d: CMD_STOP: wait for CAPTURE buffer to signal EOS\n",
+		 channel->mcu_channel_id);
+	allegro_set_state(channel, ALLEGRO_STATE_WAIT_FOR_BUFFER);
+
+	return 0;
+}
+
+static int allegro_channel_cmd_start(struct allegro_channel *channel)
+{
+	switch (allegro_get_state(channel)) {
+	case ALLEGRO_STATE_DRAIN:
+	case ALLEGRO_STATE_WAIT_FOR_BUFFER:
+		return -EBUSY;
+	case ALLEGRO_STATE_STOPPED:
+		allegro_set_state(channel, ALLEGRO_STATE_ENCODING);
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static int allegro_encoder_cmd(struct file *file, void *fh,
+			       struct v4l2_encoder_cmd *cmd)
+{
+	struct allegro_channel *channel = fh_to_channel(fh);
+	int err;
+
+	err = allegro_try_encoder_cmd(file, fh, cmd);
+	if (err)
+		return err;
+
+	switch (cmd->cmd) {
+	case V4L2_ENC_CMD_STOP:
+		err = allegro_channel_cmd_stop(channel);
+		break;
+	case V4L2_ENC_CMD_START:
+		err = allegro_channel_cmd_start(channel);
+		break;
+	default:
+		err = -EINVAL;
+		break;
+	}
+
+	return err;
+}
+
+static int allegro_enum_framesizes(struct file *file, void *fh,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	switch (fsize->pixel_format) {
+	case V4L2_PIX_FMT_H264:
+	case V4L2_PIX_FMT_NV12:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (fsize->index)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = ALLEGRO_WIDTH_MIN;
+	fsize->stepwise.max_width = ALLEGRO_WIDTH_MAX;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.min_height = ALLEGRO_HEIGHT_MIN;
+	fsize->stepwise.max_height = ALLEGRO_HEIGHT_MAX;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
+static int allegro_ioctl_streamon(struct file *file, void *priv,
+				  enum v4l2_buf_type type)
+{
+	struct v4l2_fh *fh = file->private_data;
+	struct allegro_channel *channel = fh_to_channel(fh);
+	int err;
+
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		err = allegro_create_channel(channel);
+		if (err)
+			return err;
+	}
+
+	return v4l2_m2m_streamon(file, fh->m2m_ctx, type);
+}
+
+static int allegro_subscribe_event(struct v4l2_fh *fh,
+				   const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	default:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	}
+}
+
+static const struct v4l2_ioctl_ops allegro_ioctl_ops = {
+	.vidioc_querycap = allegro_querycap,
+	.vidioc_enum_fmt_vid_cap = allegro_enum_fmt_vid,
+	.vidioc_enum_fmt_vid_out = allegro_enum_fmt_vid,
+	.vidioc_g_fmt_vid_cap = allegro_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = allegro_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = allegro_try_fmt_vid_cap,
+	.vidioc_g_fmt_vid_out = allegro_g_fmt_vid_out,
+	.vidioc_try_fmt_vid_out = allegro_try_fmt_vid_out,
+	.vidioc_s_fmt_vid_out = allegro_s_fmt_vid_out,
+
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+
+	.vidioc_streamon = allegro_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_g_selection = allegro_g_selection,
+	.vidioc_s_selection = allegro_s_selection,
+
+	.vidioc_try_encoder_cmd = allegro_try_encoder_cmd,
+	.vidioc_encoder_cmd = allegro_encoder_cmd,
+	.vidioc_enum_framesizes = allegro_enum_framesizes,
+
+	.vidioc_subscribe_event = allegro_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations allegro_fops = {
+	.owner = THIS_MODULE,
+	.open = allegro_open,
+	.release = allegro_release,
+	.poll = v4l2_m2m_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+static int allegro_register_device(struct allegro_dev *dev)
+{
+	struct video_device *video_dev = &dev->video_dev;
+
+	strscpy(video_dev->name, "allegro", sizeof(video_dev->name));
+	video_dev->fops = &allegro_fops;
+	video_dev->ioctl_ops = &allegro_ioctl_ops;
+	video_dev->release = video_device_release_empty;
+	video_dev->lock = &dev->lock;
+	video_dev->v4l2_dev = &dev->v4l2_dev;
+	video_dev->vfl_dir = VFL_DIR_M2M;
+	video_dev->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
+	video_set_drvdata(video_dev, dev);
+
+	return video_register_device(video_dev, VFL_TYPE_GRABBER, 0);
+}
+
+static void allegro_device_run(void *priv)
+{
+	struct allegro_channel *channel = priv;
+	struct allegro_dev *dev = channel->dev;
+	struct vb2_v4l2_buffer *src_buf;
+	struct vb2_v4l2_buffer *dst_buf;
+	dma_addr_t src_y;
+	dma_addr_t src_uv;
+	dma_addr_t dst_addr;
+	unsigned long dst_size;
+
+	dst_buf = v4l2_m2m_next_dst_buf(channel->fh.m2m_ctx);
+	dst_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	dst_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
+	allegro_mcu_send_put_stream_buffer(dev, channel, dst_addr, dst_size);
+
+	src_buf = v4l2_m2m_next_src_buf(channel->fh.m2m_ctx);
+	src_buf->sequence = channel->osequence++;
+
+	src_y = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+	src_uv = src_y + (channel->stride * channel->height);
+	allegro_mcu_send_encode_frame(dev, channel, src_y, src_uv);
+}
+
+static const struct v4l2_m2m_ops allegro_m2m_ops = {
+	.device_run = allegro_device_run,
+};
+
+static int allegro_mcu_hw_init(struct allegro_dev *dev,
+			       const struct fw_info *info)
+{
+	int err;
+
+	allegro_mbox_init(dev, &dev->mbox_command,
+			  info->mailbox_cmd, info->mailbox_size);
+	allegro_mbox_init(dev, &dev->mbox_status,
+			  info->mailbox_status, info->mailbox_size);
+
+	allegro_mcu_enable_interrupts(dev);
+
+	/* The mcu sends INIT after reset. */
+	allegro_mcu_start(dev);
+	err = allegro_mcu_wait_for_init_timeout(dev, 5000);
+	if (err < 0) {
+		v4l2_err(&dev->v4l2_dev,
+			 "mcu did not send INIT after reset\n");
+		err = -EIO;
+		goto err_disable_interrupts;
+	}
+
+	err = allegro_alloc_buffer(dev, &dev->suballocator,
+				   info->suballocator_size);
+	if (err) {
+		v4l2_err(&dev->v4l2_dev,
+			 "failed to allocate %zu bytes for suballocator\n",
+			 info->suballocator_size);
+		goto err_reset_mcu;
+	}
+
+	allegro_mcu_send_init(dev, dev->suballocator.paddr,
+			      dev->suballocator.size);
+	err = allegro_mcu_wait_for_init_timeout(dev, 5000);
+	if (err < 0) {
+		v4l2_err(&dev->v4l2_dev,
+			 "mcu failed to configure sub-allocator\n");
+		err = -EIO;
+		goto err_free_suballocator;
+	}
+
+	return 0;
+
+err_free_suballocator:
+	allegro_free_buffer(dev, &dev->suballocator);
+err_reset_mcu:
+	allegro_mcu_reset(dev);
+err_disable_interrupts:
+	allegro_mcu_disable_interrupts(dev);
+
+	return err;
+}
+
+static int allegro_mcu_hw_deinit(struct allegro_dev *dev)
+{
+	int err;
+
+	err = allegro_mcu_reset(dev);
+	if (err)
+		v4l2_warn(&dev->v4l2_dev,
+			  "mcu failed to enter sleep state\n");
+
+	err = allegro_mcu_disable_interrupts(dev);
+	if (err)
+		v4l2_warn(&dev->v4l2_dev,
+			  "failed to disable interrupts\n");
+
+	allegro_free_buffer(dev, &dev->suballocator);
+
+	return 0;
+}
+
+static void allegro_fw_callback(const struct firmware *fw, void *context)
+{
+	struct allegro_dev *dev = context;
+	const char *fw_codec_name = "al5e.fw";
+	const struct firmware *fw_codec;
+	int err;
+	const struct fw_info *info;
+
+	if (!fw)
+		return;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "requesting codec firmware '%s'\n", fw_codec_name);
+	err = request_firmware(&fw_codec, fw_codec_name, &dev->plat_dev->dev);
+	if (err)
+		goto err_release_firmware;
+
+	info = allegro_get_firmware_info(dev, fw, fw_codec);
+	if (!info) {
+		v4l2_err(&dev->v4l2_dev, "firmware is not supported\n");
+		goto err_release_firmware_codec;
+	}
+
+	v4l2_info(&dev->v4l2_dev,
+		  "using mcu firmware version '%s'\n", info->version);
+
+	/* Ensure that the mcu is sleeping at the reset vector */
+	err = allegro_mcu_reset(dev);
+	if (err) {
+		v4l2_err(&dev->v4l2_dev, "failed to reset mcu\n");
+		goto err_release_firmware_codec;
+	}
+
+	allegro_copy_firmware(dev, fw->data, fw->size);
+	allegro_copy_fw_codec(dev, fw_codec->data, fw_codec->size);
+
+	err = allegro_mcu_hw_init(dev, info);
+	if (err) {
+		v4l2_err(&dev->v4l2_dev, "failed to initialize mcu\n");
+		goto err_free_fw_codec;
+	}
+
+	dev->m2m_dev = v4l2_m2m_init(&allegro_m2m_ops);
+	if (IS_ERR(dev->m2m_dev)) {
+		v4l2_err(&dev->v4l2_dev, "failed to init mem2mem device\n");
+		goto err_mcu_hw_deinit;
+	}
+
+	err = allegro_register_device(dev);
+	if (err) {
+		v4l2_err(&dev->v4l2_dev, "failed to register video device\n");
+		goto err_m2m_release;
+	}
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "allegro codec registered as /dev/video%d\n",
+		 dev->video_dev.num);
+
+	release_firmware(fw_codec);
+	release_firmware(fw);
+
+	return;
+
+err_m2m_release:
+	v4l2_m2m_release(dev->m2m_dev);
+	dev->m2m_dev = NULL;
+err_mcu_hw_deinit:
+	allegro_mcu_hw_deinit(dev);
+err_free_fw_codec:
+	allegro_free_fw_codec(dev);
+err_release_firmware_codec:
+	release_firmware(fw_codec);
+err_release_firmware:
+	release_firmware(fw);
+}
+
+static int allegro_firmware_request_nowait(struct allegro_dev *dev)
+{
+	const char *fw = "al5e_b.fw";
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "requesting firmware '%s'\n", fw);
+	return request_firmware_nowait(THIS_MODULE, true, fw,
+				       &dev->plat_dev->dev, GFP_KERNEL, dev,
+				       allegro_fw_callback);
+}
+
+static int allegro_probe(struct platform_device *pdev)
+{
+	struct allegro_dev *dev;
+	struct resource *res, *sram_res;
+	int ret;
+	int irq;
+	void __iomem *regs, *sram_regs;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+	dev->plat_dev = pdev;
+	init_completion(&dev->init_complete);
+	INIT_LIST_HEAD(&dev->channels);
+
+	mutex_init(&dev->lock);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
+	if (!res) {
+		dev_err(&pdev->dev,
+			"regs resource missing from device tree\n");
+		return -EINVAL;
+	}
+	regs = devm_ioremap_nocache(&pdev->dev, res->start, resource_size(res));
+	if (IS_ERR(regs)) {
+		dev_err(&pdev->dev, "failed to map registers\n");
+		return PTR_ERR(regs);
+	}
+	dev->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
+					    &allegro_regmap_config);
+	if (IS_ERR(dev->regmap)) {
+		dev_err(&pdev->dev, "failed to init regmap\n");
+		return PTR_ERR(dev->regmap);
+	}
+
+	sram_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
+	if (!sram_res) {
+		dev_err(&pdev->dev,
+			"sram resource missing from device tree\n");
+		return -EINVAL;
+	}
+	sram_regs = devm_ioremap_nocache(&pdev->dev,
+					 sram_res->start,
+					 resource_size(sram_res));
+	if (IS_ERR(sram_regs)) {
+		dev_err(&pdev->dev, "failed to map sram\n");
+		return PTR_ERR(sram_regs);
+	}
+	dev->sram = devm_regmap_init_mmio(&pdev->dev, sram_regs,
+					  &allegro_sram_config);
+	if (IS_ERR(dev->sram)) {
+		dev_err(&pdev->dev, "failed to init sram\n");
+		return PTR_ERR(dev->sram);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "failed to get irq resource\n");
+		return irq;
+	}
+	ret = devm_request_threaded_irq(&pdev->dev, irq,
+					allegro_hardirq,
+					allegro_irq_thread,
+					IRQF_SHARED, dev_name(&pdev->dev), dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, dev);
+
+	ret = allegro_firmware_request_nowait(dev);
+	if (ret < 0) {
+		v4l2_err(&dev->v4l2_dev,
+			 "failed to request firmware: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int allegro_remove(struct platform_device *pdev)
+{
+	struct allegro_dev *dev = platform_get_drvdata(pdev);
+
+	video_unregister_device(&dev->video_dev);
+	if (dev->m2m_dev)
+		v4l2_m2m_release(dev->m2m_dev);
+	allegro_mcu_hw_deinit(dev);
+	allegro_free_fw_codec(dev);
+
+	v4l2_device_unregister(&dev->v4l2_dev);
+
+	return 0;
+}
+
+static const struct of_device_id allegro_dt_ids[] = {
+	{ .compatible = "allegro,al5e-1.1" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, allegro_dt_ids);
+
+static struct platform_driver allegro_driver = {
+	.probe = allegro_probe,
+	.remove = allegro_remove,
+	.driver = {
+		.name = "allegro",
+		.of_match_table = of_match_ptr(allegro_dt_ids),
+	},
+};
+
+module_platform_driver(allegro_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Michael Tretter <kernel@pengutronix.de>");
+MODULE_DESCRIPTION("Allegro DVT encoder and decoder driver");
-- 
2.20.1


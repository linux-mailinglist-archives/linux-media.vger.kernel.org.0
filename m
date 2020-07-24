Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02E522D19A
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 00:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgGXWEk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 18:04:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:54448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726552AbgGXWEj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 18:04:39 -0400
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C358206F0;
        Fri, 24 Jul 2020 22:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595628276;
        bh=jH86cKMGC66RMNO3wbZ3XpvTJuE7uFzJ91f7vNPaVAs=;
        h=Date:From:To:Cc:Subject:From;
        b=1k2JS6oOoSWzNbHskRrYKQfC4RvEa3RgeT4pM/60vsATQC2bM4EuagT78SnpMCgmo
         NyxtuRM+fQBHforCVzYliBjUr1XA91YURZyf7wnbGuNUepHBGMPxA4IMVKAQXGWOCq
         bxkgwBxmjoAjxTpZAPyM9Vou7TnZw5obvztNAog8=
Date:   Fri, 24 Jul 2020 17:10:14 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Antti Palosaari <crope@iki.fi>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sean Young <sean@mess.org>, Michael Buesch <m@bues.ch>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Brian Johnson <brijohn@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH][next] media: Use fallthrough pseudo-keyword
Message-ID: <20200724221014.GA24349@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

[1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/media/cec/core/cec-adap.c                 |  2 +-
 drivers/media/cec/core/cec-pin.c                  |  6 +++---
 drivers/media/cec/usb/pulse8/pulse8-cec.c         |  2 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c   |  2 +-
 drivers/media/dvb-frontends/af9013.c              |  2 +-
 drivers/media/dvb-frontends/lg2160.c              |  2 +-
 drivers/media/dvb-frontends/m88ds3103.c           |  2 +-
 drivers/media/i2c/adv7180.c                       |  2 +-
 drivers/media/i2c/adv7511-v4l2.c                  |  4 ++--
 drivers/media/i2c/msp3400-kthreads.c              |  2 +-
 drivers/media/i2c/ov5640.c                        |  2 +-
 drivers/media/i2c/ov6650.c                        |  4 ++--
 drivers/media/i2c/ov9640.c                        |  2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c         |  2 +-
 drivers/media/i2c/smiapp/smiapp-core.c            |  6 +++---
 drivers/media/i2c/tda1997x.c                      | 10 +++++-----
 drivers/media/i2c/tvp5150.c                       |  2 +-
 drivers/media/pci/bt8xx/bttv-driver.c             |  2 +-
 drivers/media/pci/cx88/cx88-cards.c               |  2 +-
 drivers/media/pci/cx88/cx88-video.c               |  2 +-
 drivers/media/pci/saa7134/saa7134-cards.c         |  4 ++--
 drivers/media/pci/solo6x10/solo6x10-core.c        |  2 +-
 drivers/media/pci/solo6x10/solo6x10-i2c.c         |  2 +-
 drivers/media/platform/coda/coda-bit.c            |  4 ++--
 drivers/media/platform/coda/coda-common.c         | 10 +++++-----
 drivers/media/platform/exynos4-is/fimc-capture.c  |  6 +++---
 drivers/media/platform/exynos4-is/fimc-reg.c      |  2 +-
 drivers/media/platform/exynos4-is/media-dev.c     |  2 +-
 drivers/media/platform/marvell-ccic/mcam-core.c   |  2 +-
 drivers/media/platform/omap3isp/ispvideo.c        |  2 +-
 drivers/media/platform/qcom/venus/vdec.c          |  2 +-
 drivers/media/platform/renesas-ceu.c              |  4 ++--
 drivers/media/radio/si4713/si4713.c               |  2 +-
 drivers/media/rc/iguanair.c                       |  2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c |  2 +-
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c  |  2 +-
 drivers/media/tuners/fc0011.c                     |  2 +-
 drivers/media/tuners/tda18271-fe.c                |  2 +-
 drivers/media/usb/dvb-usb-v2/af9015.c             |  2 +-
 drivers/media/usb/dvb-usb-v2/gl861.c              |  2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c            |  8 ++++----
 drivers/media/usb/dvb-usb-v2/mxl111sf-gpio.c      |  4 ++--
 drivers/media/usb/em28xx/em28xx-audio.c           |  8 ++++----
 drivers/media/usb/go7007/go7007-driver.c          |  2 +-
 drivers/media/usb/gspca/mr97310a.c                | 10 +++++-----
 drivers/media/usb/gspca/nw80x.c                   |  2 +-
 drivers/media/usb/gspca/ov519.c                   |  6 +++---
 drivers/media/usb/gspca/sn9c20x.c                 |  2 +-
 drivers/media/usb/gspca/sunplus.c                 |  4 ++--
 drivers/media/usb/gspca/xirlink_cit.c             |  4 ++--
 drivers/media/usb/gspca/zc3xx.c                   |  4 ++--
 drivers/media/usb/pwc/pwc-v4l.c                   |  2 +-
 drivers/media/usb/siano/smsusb.c                  |  2 +-
 drivers/media/usb/tm6000/tm6000-alsa.c            |  8 ++++----
 drivers/media/usb/uvc/uvc_video.c                 |  4 ++--
 55 files changed, 94 insertions(+), 94 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 4efe8014445e..80fd5165f658 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1928,7 +1928,7 @@ static int cec_receive_notify(struct cec_adapter *adap, struct cec_msg *msg,
 		 */
 		if (!adap->passthrough && from_unregistered)
 			return 0;
-		/* Fall through */
+		fallthrough;
 	case CEC_MSG_GIVE_DEVICE_VENDOR_ID:
 	case CEC_MSG_GIVE_FEATURES:
 	case CEC_MSG_GIVE_PHYSICAL_ADDR:
diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 660fe111f540..f006bd8eec63 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -417,7 +417,7 @@ static void cec_pin_tx_states(struct cec_pin *pin, ktime_t ts)
 			wake_up_interruptible(&pin->kthread_waitq);
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	case CEC_ST_TX_DATA_BIT_0_HIGH:
 	case CEC_ST_TX_DATA_BIT_0_HIGH_SHORT:
 	case CEC_ST_TX_DATA_BIT_0_HIGH_LONG:
@@ -445,7 +445,7 @@ static void cec_pin_tx_states(struct cec_pin *pin, ktime_t ts)
 			wake_up_interruptible(&pin->kthread_waitq);
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	case CEC_ST_TX_DATA_BIT_HIGH_CUSTOM:
 		if (tx_last_bit(pin)) {
 			/* Error Injection: just stop sending after this bit */
@@ -459,7 +459,7 @@ static void cec_pin_tx_states(struct cec_pin *pin, ktime_t ts)
 			break;
 		}
 		pin->tx_bit++;
-		/* fall through */
+		fallthrough;
 	case CEC_ST_TX_START_BIT_HIGH:
 	case CEC_ST_TX_START_BIT_HIGH_SHORT:
 	case CEC_ST_TX_START_BIT_HIGH_LONG:
diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index beae6aa12638..e4d8446b87da 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -389,7 +389,7 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 				pulse8->new_rx_msg[0] = pulse8->buf[1];
 				break;
 			}
-			/* fall through */
+			fallthrough;
 		case MSGCODE_FRAME_DATA:
 			if (pulse8->new_rx_msg_len < CEC_MAX_MSG_SIZE)
 				pulse8->new_rx_msg[pulse8->new_rx_msg_len++] =
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 30caad27281e..0b1a0a1d246b 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -600,7 +600,7 @@ static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
 		break;
 	case VB2_BUF_STATE_ERROR:
 		b->flags |= V4L2_BUF_FLAG_ERROR;
-		/* fall through */
+		fallthrough;
 	case VB2_BUF_STATE_DONE:
 		b->flags |= V4L2_BUF_FLAG_DONE;
 		break;
diff --git a/drivers/media/dvb-frontends/af9013.c b/drivers/media/dvb-frontends/af9013.c
index 7281899bd7ae..7d7c341b2bd8 100644
--- a/drivers/media/dvb-frontends/af9013.c
+++ b/drivers/media/dvb-frontends/af9013.c
@@ -597,7 +597,7 @@ static int af9013_read_status(struct dvb_frontend *fe, enum fe_status *status)
 			state->strength_en = 2;
 			break;
 		}
-		/* Fall through */
+		fallthrough;
 	case 1:
 		if (time_is_after_jiffies(state->strength_jiffies + msecs_to_jiffies(2000)))
 			break;
diff --git a/drivers/media/dvb-frontends/lg2160.c b/drivers/media/dvb-frontends/lg2160.c
index 10c152f461dd..f343066c297e 100644
--- a/drivers/media/dvb-frontends/lg2160.c
+++ b/drivers/media/dvb-frontends/lg2160.c
@@ -1408,7 +1408,7 @@ struct dvb_frontend *lg2160_attach(const struct lg2160_config *config,
 	switch (config->lg_chip) {
 	default:
 		lg_warn("invalid chip requested, defaulting to LG2160");
-		/* fall-thru */
+		fallthrough;
 	case LG2160:
 		memcpy(&state->frontend.ops, &lg2160_ops,
 		       sizeof(struct dvb_frontend_ops));
diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index f204e715bc59..ad6d9d564a87 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -906,7 +906,7 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 			if (ret)
 				goto err;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		u16tmp = DIV_ROUND_UP(target_mclk, dev->cfg->ts_clk);
 		u8tmp1 = u16tmp / 2 - 1;
diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 00159daa6fcd..0bc7fccca87b 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -726,7 +726,7 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 	case V4L2_FIELD_NONE:
 		if (state->chip_info->flags & ADV7180_FLAG_I2P)
 			break;
-		/* fall through */
+		fallthrough;
 	default:
 		format->format.field = V4L2_FIELD_ALTERNATE;
 		break;
diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 62763ec4cd07..a3161d709015 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -470,7 +470,7 @@ static int adv7511_g_register(struct v4l2_subdev *sd, struct v4l2_dbg_register *
 			reg->val = adv7511_cec_read(sd, reg->reg & 0xff);
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		v4l2_info(sd, "Register %03llx not supported\n", reg->reg);
 		adv7511_inv_register(sd);
@@ -492,7 +492,7 @@ static int adv7511_s_register(struct v4l2_subdev *sd, const struct v4l2_dbg_regi
 			adv7511_cec_write(sd, reg->reg & 0xff, reg->val & 0xff);
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		v4l2_info(sd, "Register %03llx not supported\n", reg->reg);
 		adv7511_inv_register(sd);
diff --git a/drivers/media/i2c/msp3400-kthreads.c b/drivers/media/i2c/msp3400-kthreads.c
index d3b0d1c18efd..52e506f86de5 100644
--- a/drivers/media/i2c/msp3400-kthreads.c
+++ b/drivers/media/i2c/msp3400-kthreads.c
@@ -646,7 +646,7 @@ int msp3400c_thread(void *data)
 			break;
 		case 0: /* 4.5 */
 			state->detected_std = V4L2_STD_MN;
-			/* fall-through */
+			fallthrough;
 		default:
 no_second:
 			state->second = msp3400c_carrier_detect_main[max1].cdo;
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 2fe4a7ac0592..ccdabc7948a7 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3010,7 +3010,7 @@ static int ov5640_probe(struct i2c_client *client)
 		switch (rotation) {
 		case 180:
 			sensor->upside_down = true;
-			/* fall through */
+			fallthrough;
 		case 0:
 			break;
 		default:
diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 91906b94f978..601c4f2e5205 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -685,7 +685,7 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 	switch (mf->code) {
 	case MEDIA_BUS_FMT_Y10_1X10:
 		mf->code = MEDIA_BUS_FMT_Y8_1X8;
-		/* fall through */
+		fallthrough;
 	case MEDIA_BUS_FMT_Y8_1X8:
 	case MEDIA_BUS_FMT_YVYU8_2X8:
 	case MEDIA_BUS_FMT_YUYV8_2X8:
@@ -694,7 +694,7 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 		break;
 	default:
 		mf->code = MEDIA_BUS_FMT_SBGGR8_1X8;
-		/* fall through */
+		fallthrough;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 		break;
 	}
diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index 3a21f51d9325..66614e0ee988 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -538,7 +538,7 @@ static int ov9640_set_fmt(struct v4l2_subdev *sd,
 		break;
 	default:
 		mf->code = MEDIA_BUS_FMT_UYVY8_2X8;
-		/* fall through */
+		fallthrough;
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 		mf->colorspace = V4L2_COLORSPACE_JPEG;
 		break;
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c b/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c
index 71cf68a95bb2..141ad0ba7f5a 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c
@@ -46,7 +46,7 @@ static int s5c73m3_get_af_status(struct s5c73m3 *state, struct v4l2_ctrl *ctrl)
 		break;
 	default:
 		v4l2_info(&state->sensor_sd, "Unknown AF status %#x\n", reg);
-		/* Fall through */
+		fallthrough;
 	case REG_CAF_STATUS_UNFOCUSED:
 	case REG_AF_STATUS_UNFOCUSED:
 	case REG_AF_STATUS_INVALID:
diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 8a9c7de0c056..6fc0680a93d0 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -1721,7 +1721,7 @@ static void smiapp_propagate(struct v4l2_subdev *subdev,
 				sensor->binning_vertical = 1;
 			}
 		}
-		/* Fall through */
+		fallthrough;
 	case V4L2_SEL_TGT_COMPOSE:
 		*crops[SMIAPP_PAD_SRC] = *comp;
 		break;
@@ -2120,7 +2120,7 @@ static int __smiapp_sel_supported(struct v4l2_subdev *subdev,
 		    && SMIA_LIM(sensor, SCALING_CAPABILITY)
 		    != SMIAPP_SCALING_CAPABILITY_NONE)
 			return 0;
-		/* Fall through */
+		fallthrough;
 	default:
 		return -EINVAL;
 	}
@@ -2795,7 +2795,7 @@ static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
 		case 180:
 			hwcfg->module_board_orient =
 				SMIAPP_MODULE_BOARD_ORIENT_180;
-			/* Fall through */
+			fallthrough;
 		case 0:
 			break;
 		default:
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 5e68182001ec..f6b57f1220ae 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2588,7 +2588,7 @@ static int tda1997x_probe(struct i2c_client *client,
 			case 36:
 				mbus_codes[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
 				mbus_codes[i++] = MEDIA_BUS_FMT_YUV12_1X36;
-				/* fall-through */
+				fallthrough;
 			case 24:
 				mbus_codes[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
 				break;
@@ -2617,10 +2617,10 @@ static int tda1997x_probe(struct i2c_client *client,
 				mbus_codes[i++] = MEDIA_BUS_FMT_RGB888_1X24;
 				mbus_codes[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 				mbus_codes[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
-				/* fall through */
+				fallthrough;
 			case 20:
 				mbus_codes[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
-				/* fall through */
+				fallthrough;
 			case 16:
 				mbus_codes[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
 				break;
@@ -2633,10 +2633,10 @@ static int tda1997x_probe(struct i2c_client *client,
 			case 16:
 			case 12:
 				mbus_codes[i++] = MEDIA_BUS_FMT_UYVY12_2X12;
-				/* fall through */
+				fallthrough;
 			case 10:
 				mbus_codes[i++] = MEDIA_BUS_FMT_UYVY10_2X10;
-				/* fall through */
+				fallthrough;
 			case 8:
 				mbus_codes[i++] = MEDIA_BUS_FMT_UYVY8_2X8;
 				break;
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 9df575238952..09ecb61e8d03 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -293,7 +293,7 @@ static void tvp5150_selmux(struct v4l2_subdev *sd)
 	switch (decoder->input) {
 	case TVP5150_COMPOSITE1:
 		input |= 2;
-		/* fall through */
+		fallthrough;
 	case TVP5150_COMPOSITE0:
 		break;
 	case TVP5150_SVIDEO:
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 9144f795fb93..8c61d292dec1 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2332,7 +2332,7 @@ static int bttv_try_fmt_vid_cap(struct file *file, void *priv,
 			field = V4L2_FIELD_SEQ_TB;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	default: /* FIELD_ANY case */
 		height2 = btv->crop[!!fh->do_crop].rect.height >> 1;
 		field = (f->fmt.pix.height > height2)
diff --git a/drivers/media/pci/cx88/cx88-cards.c b/drivers/media/pci/cx88/cx88-cards.c
index 9fa388626bae..8e224fc0474d 100644
--- a/drivers/media/pci/cx88/cx88-cards.c
+++ b/drivers/media/pci/cx88/cx88-cards.c
@@ -3499,7 +3499,7 @@ static void cx88_card_setup(struct cx88_core *core)
 		cx_clear(MO_GP0_IO, 0x00000040);
 		msleep(1000);
 		cx_set(MO_GP0_IO, 0x00004040);
-		/* FALLTHROUGH */
+		fallthrough;
 	case CX88_BOARD_DVICO_FUSIONHDTV_DVB_T1:
 	case CX88_BOARD_DVICO_FUSIONHDTV_DVB_T_PLUS:
 	case CX88_BOARD_DVICO_FUSIONHDTV_DVB_T_HYBRID:
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index e7fd7516787c..8cffdacf6007 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1385,7 +1385,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 		request_module("rtc-isl1208");
 		core->i2c_rtc = i2c_new_client_device(&core->i2c_adap, &rtc_info);
 	}
-		/* fall-through */
+		fallthrough;
 	case CX88_BOARD_DVICO_FUSIONHDTV_5_PCI_NANO:
 		request_module("ir-kbd-i2c");
 	}
diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
index c1937c33c33d..ce449c941171 100644
--- a/drivers/media/pci/saa7134/saa7134-cards.c
+++ b/drivers/media/pci/saa7134/saa7134-cards.c
@@ -7812,7 +7812,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
 				dev->name, saa7134_boards[dev->board].name);
 			break;
 		}
-		/* fall-through */
+		fallthrough;
 	case SAA7134_BOARD_VIDEOMATE_DVBT_300:
 	case SAA7134_BOARD_ASUS_EUROPA2_HYBRID:
 	case SAA7134_BOARD_ASUS_EUROPA_HYBRID:
@@ -7870,7 +7870,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
 		break;
 	case SAA7134_BOARD_HAUPPAUGE_HVR1110:
 		hauppauge_eeprom(dev, dev->eedata+0x80);
-		/* fall-through */
+		fallthrough;
 	case SAA7134_BOARD_PINNACLE_PCTV_310i:
 	case SAA7134_BOARD_KWORLD_DVBT_210:
 	case SAA7134_BOARD_TEVION_DVBT_220RF:
diff --git a/drivers/media/pci/solo6x10/solo6x10-core.c b/drivers/media/pci/solo6x10/solo6x10-core.c
index c6e0090f27e8..d497afc7e7b7 100644
--- a/drivers/media/pci/solo6x10/solo6x10-core.c
+++ b/drivers/media/pci/solo6x10/solo6x10-core.c
@@ -503,7 +503,7 @@ static int solo_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	default:
 		dev_warn(&pdev->dev, "Invalid chip_id 0x%02x, assuming 4 ch\n",
 			 chip_id);
-		/* fall through */
+		fallthrough;
 	case 5:
 		solo_dev->nr_chans = 4;
 		solo_dev->nr_ext = 1;
diff --git a/drivers/media/pci/solo6x10/solo6x10-i2c.c b/drivers/media/pci/solo6x10/solo6x10-i2c.c
index f86f12fa6350..7db785e9c997 100644
--- a/drivers/media/pci/solo6x10/solo6x10-i2c.c
+++ b/drivers/media/pci/solo6x10/solo6x10-i2c.c
@@ -183,7 +183,7 @@ int solo_i2c_isr(struct solo_dev *solo_dev)
 		}
 
 		solo_dev->i2c_state = IIC_STATE_WRITE;
-		/* fall through */
+		fallthrough;
 	case IIC_STATE_WRITE:
 		ret = solo_i2c_handle_write(solo_dev);
 		break;
diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index b021604eceaa..bf75927bac4e 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -1101,7 +1101,7 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 		break;
 	case CODA_960:
 		coda_write(dev, 0, CODA9_GDI_WPROT_RGN_EN);
-		/* fallthrough */
+		fallthrough;
 	case CODA_HX4:
 	case CODA_7541:
 		coda_write(dev, CODA7_STREAM_BUF_DYNALLOC_EN |
@@ -1141,7 +1141,7 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 				 CODA7_PICHEIGHT_MASK) << CODA_PICHEIGHT_OFFSET;
 			break;
 		}
-		/* fallthrough */
+		fallthrough;
 	case CODA_960:
 		value = (q_data_src->rect.width & CODA7_PICWIDTH_MASK)
 			<< CODA7_PICWIDTH_OFFSET;
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 3ab3d976d8ca..823a4d7578d6 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -808,7 +808,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 			ctx->tiled_map_type = GDI_TILED_FRAME_MB_RASTER_MAP;
 			break;
 		}
-		/* else fall through */
+		fallthrough;
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
 	case V4L2_PIX_FMT_YUV422P:
@@ -1015,7 +1015,7 @@ static int coda_g_selection(struct file *file, void *fh,
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		rsel = &r;
-		/* fallthrough */
+		fallthrough;
 	case V4L2_SEL_TGT_CROP:
 		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT ||
 		    ctx->inst_type == CODA_INST_DECODER)
@@ -1024,7 +1024,7 @@ static int coda_g_selection(struct file *file, void *fh,
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 	case V4L2_SEL_TGT_COMPOSE_PADDED:
 		rsel = &r;
-		/* fallthrough */
+		fallthrough;
 	case V4L2_SEL_TGT_COMPOSE:
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
 		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
@@ -1074,7 +1074,7 @@ static int coda_s_selection(struct file *file, void *fh,
 
 			return 0;
 		}
-		/* else fall through */
+		fallthrough;
 	case V4L2_SEL_TGT_NATIVE_SIZE:
 	case V4L2_SEL_TGT_COMPOSE:
 		return coda_g_selection(file, fh, s);
@@ -2628,7 +2628,7 @@ static int coda_open(struct file *file)
 		 */
 		if (enable_bwb || ctx->inst_type == CODA_INST_ENCODER)
 			ctx->frame_mem_ctrl = CODA9_FRAME_ENABLE_BWB;
-		/* fallthrough */
+		fallthrough;
 	case CODA_HX4:
 	case CODA_7541:
 		ctx->reg_idx = 0;
diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index e7a4b06e6dfe..4fbf5506da97 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -1279,7 +1279,7 @@ static int fimc_cap_g_selection(struct file *file, void *fh,
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 		f = &ctx->d_frame;
-		/* fall through */
+		fallthrough;
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 		s->r.left = 0;
@@ -1290,7 +1290,7 @@ static int fimc_cap_g_selection(struct file *file, void *fh,
 
 	case V4L2_SEL_TGT_COMPOSE:
 		f = &ctx->d_frame;
-		/* fall through */
+		fallthrough;
 	case V4L2_SEL_TGT_CROP:
 		s->r.left = f->offs_h;
 		s->r.top = f->offs_v;
@@ -1601,7 +1601,7 @@ static int fimc_subdev_get_selection(struct v4l2_subdev *sd,
 	switch (sel->target) {
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 		f = &ctx->d_frame;
-		/* fall through */
+		fallthrough;
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		r->width = f->o_width;
 		r->height = f->o_height;
diff --git a/drivers/media/platform/exynos4-is/fimc-reg.c b/drivers/media/platform/exynos4-is/fimc-reg.c
index 5ce2bdebd424..c9e9ed7eb143 100644
--- a/drivers/media/platform/exynos4-is/fimc-reg.c
+++ b/drivers/media/platform/exynos4-is/fimc-reg.c
@@ -710,7 +710,7 @@ int fimc_hw_set_camera_type(struct fimc_dev *fimc,
 		break;
 	case FIMC_BUS_TYPE_LCD_WRITEBACK_A:
 		cfg |= FIMC_REG_CIGCTRL_CAMIF_SELWB;
-		/* fall through */
+		fallthrough;
 	case FIMC_BUS_TYPE_ISP_WRITEBACK:
 		if (fimc->variant->has_isp_wb)
 			cfg |= FIMC_REG_CIGCTRL_CAMIF_SELWB;
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 16dd660137a8..085b69b458e9 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -92,7 +92,7 @@ static void fimc_pipeline_prepare(struct fimc_pipeline *p,
 		switch (sd->grp_id) {
 		case GRP_ID_SENSOR:
 			sensor = sd;
-			/* fall through */
+			fallthrough;
 		case GRP_ID_FIMC_IS_SENSOR:
 			p->subdevs[IDX_SENSOR] = sd;
 			break;
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 326e79b8531c..25fd7863f019 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -388,7 +388,7 @@ static int mcam_alloc_dma_bufs(struct mcam_camera *cam, int loadtime)
 		dma_free_coherent(cam->dev, cam->dma_buf_size,
 				cam->dma_bufs[0], cam->dma_handles[0]);
 		cam->nbufs = 0;
-		/* fall-through */
+		fallthrough;
 	case 0:
 		cam_err(cam, "Insufficient DMA buffers, cannot operate\n");
 		return -ENOMEM;
diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
index 1ac9aef70dff..8811d6dd4ee7 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -703,7 +703,7 @@ isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
 		 * requested.
 		 */
 		format->fmt.pix.field = V4L2_FIELD_INTERLACED_TB;
-		/* Fall-through */
+		fallthrough;
 	case V4L2_FIELD_INTERLACED_TB:
 	case V4L2_FIELD_INTERLACED_BT:
 		/* Interlaced orders are only supported at the CCDC output. */
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7c4c483d5438..a9a74b141904 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1072,7 +1072,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
 	switch (inst->codec_state) {
 	case VENUS_DEC_STATE_DECODING:
 		ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
-		/* fallthrough */
+		fallthrough;
 	case VENUS_DEC_STATE_DRAIN:
 		vdec_cancel_dst_buffers(inst);
 		inst->codec_state = VENUS_DEC_STATE_STOPPED;
diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index f7d71a6a7970..4a633ad0e8fa 100644
--- a/drivers/media/platform/renesas-ceu.c
+++ b/drivers/media/platform/renesas-ceu.c
@@ -405,7 +405,7 @@ static int ceu_hw_config(struct ceu_device *ceudev)
 	/* Non-swapped planar image capture mode. */
 	case V4L2_PIX_FMT_NV16:
 		cdocr	|= CEU_CDOCR_NO_DOWSAMPLE;
-		/* fall-through */
+		fallthrough;
 	case V4L2_PIX_FMT_NV12:
 		if (mbus_fmt->swapped)
 			camcr = mbus_fmt->fmt_order_swap;
@@ -419,7 +419,7 @@ static int ceu_hw_config(struct ceu_device *ceudev)
 	/* Swapped planar image capture mode. */
 	case V4L2_PIX_FMT_NV61:
 		cdocr	|= CEU_CDOCR_NO_DOWSAMPLE;
-		/* fall-through */
+		fallthrough;
 	case V4L2_PIX_FMT_NV21:
 		if (mbus_fmt->swapped)
 			camcr = mbus_fmt->fmt_order;
diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si4713/si4713.c
index 7f3aee495ed3..6afa7c3464ab 100644
--- a/drivers/media/radio/si4713/si4713.c
+++ b/drivers/media/radio/si4713/si4713.c
@@ -1157,7 +1157,7 @@ static int si4713_s_ctrl(struct v4l2_ctrl *ctrl)
 			 * V4L2_CID_TUNE_POWER_LEVEL. */
 			if (force)
 				break;
-			/* fall through */
+			fallthrough;
 		case V4L2_CID_TUNE_POWER_LEVEL:
 			ret = si4713_tx_tune_power(sdev,
 				sdev->tune_pwr_level->val, sdev->tune_ant_cap->val);
diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index 566c2816d5be..b5b993b33b80 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -101,7 +101,7 @@ static void process_ir_data(struct iguanair *ir, unsigned len)
 			break;
 		case CMD_TX_OVERFLOW:
 			ir->tx_overflow = true;
-			/* fall through */
+			fallthrough;
 		case CMD_RECEIVER_OFF:
 		case CMD_RECEIVER_ON:
 		case CMD_SEND:
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 8941d73f6611..70d2a6edf3f3 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1310,7 +1310,7 @@ static int vicodec_subscribe_event(struct v4l2_fh *fh,
 	case V4L2_EVENT_SOURCE_CHANGE:
 		if (ctx->is_enc)
 			return -EINVAL;
-		/* fall through */
+		fallthrough;
 	case V4L2_EVENT_EOS:
 		if (ctx->is_stateless)
 			return -EINVAL;
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
index acc98445a1fa..a141369a7a63 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
@@ -298,7 +298,7 @@ void vivid_vbi_gen_sliced(struct vivid_vbi_gen_data *vbi,
 	switch (frame) {
 	case 0:
 		vivid_vbi_gen_set_time_of_day(vbi->time_of_day_packet);
-		/* fall through */
+		fallthrough;
 	case 1 ... 7:
 		data1->data[0] = vbi->time_of_day_packet[frame * 2];
 		data1->data[1] = vbi->time_of_day_packet[frame * 2 + 1];
diff --git a/drivers/media/tuners/fc0011.c b/drivers/media/tuners/fc0011.c
index b7b5b33b11f4..eaa3bbc903d7 100644
--- a/drivers/media/tuners/fc0011.c
+++ b/drivers/media/tuners/fc0011.c
@@ -250,7 +250,7 @@ static int fc0011_set_params(struct dvb_frontend *fe)
 		dev_warn(&priv->i2c->dev, "Unsupported bandwidth %u kHz. Using 6000 kHz.\n",
 			 bandwidth);
 		bandwidth = 6000;
-		/* fallthrough */
+		fallthrough;
 	case 6000:
 		regs[FC11_REG_VCOSEL] |= FC11_VCOSEL_BW6M;
 		break;
diff --git a/drivers/media/tuners/tda18271-fe.c b/drivers/media/tuners/tda18271-fe.c
index 471aaf71fdef..f0371d004b36 100644
--- a/drivers/media/tuners/tda18271-fe.c
+++ b/drivers/media/tuners/tda18271-fe.c
@@ -948,7 +948,7 @@ static int tda18271_set_params(struct dvb_frontend *fe)
 		break;
 	case SYS_DVBC_ANNEX_B:
 		bw = 6000000;
-		/* fall through */
+		fallthrough;
 	case SYS_DVBC_ANNEX_A:
 	case SYS_DVBC_ANNEX_C:
 		if (bw <= 6000000) {
diff --git a/drivers/media/usb/dvb-usb-v2/af9015.c b/drivers/media/usb/dvb-usb-v2/af9015.c
index c427b9031e42..c70b3cef3176 100644
--- a/drivers/media/usb/dvb-usb-v2/af9015.c
+++ b/drivers/media/usb/dvb-usb-v2/af9015.c
@@ -43,7 +43,7 @@ static int af9015_ctrl_msg(struct dvb_usb_device *d, struct req_t *req)
 	case READ_I2C:
 		write = 0;
 		state->buf[2] |= 0x01; /* set I2C direction */
-		/* fall through */
+		fallthrough;
 	case WRITE_I2C:
 		state->buf[0] = READ_WRITE_I2C;
 		break;
diff --git a/drivers/media/usb/dvb-usb-v2/gl861.c b/drivers/media/usb/dvb-usb-v2/gl861.c
index b7ca236174f3..0c434259c36f 100644
--- a/drivers/media/usb/dvb-usb-v2/gl861.c
+++ b/drivers/media/usb/dvb-usb-v2/gl861.c
@@ -41,7 +41,7 @@ static int gl861_ctrl_msg(struct dvb_usb_device *d, u8 request, u16 value,
 	switch (request) {
 	case CMD_WRITE:
 		memcpy(ctx->buf, data, size);
-		/* Fall through */
+		fallthrough;
 	case CMD_WRITE_SHORT:
 		pipe = usb_sndctrlpipe(d->udev, 0);
 		requesttype = USB_TYPE_VENDOR | USB_DIR_OUT;
diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 8a3c0eeed959..5a7a9522d46d 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -687,7 +687,7 @@ static const char *lme_firmware_switch(struct dvb_usb_device *d, int cold)
 				cold = 0;
 				break;
 			}
-			/* fall through */
+			fallthrough;
 		case TUNER_LG:
 			fw_lme = fw_lg;
 			ret = request_firmware(&fw, fw_lme, &udev->dev);
@@ -710,7 +710,7 @@ static const char *lme_firmware_switch(struct dvb_usb_device *d, int cold)
 				cold = 0;
 				break;
 			}
-			/* fall through */
+			fallthrough;
 		case TUNER_LG:
 			fw_lme = fw_c_lg;
 			ret = request_firmware(&fw, fw_lme, &udev->dev);
@@ -718,7 +718,7 @@ static const char *lme_firmware_switch(struct dvb_usb_device *d, int cold)
 				st->dvb_usb_lme2510_firmware = TUNER_LG;
 				break;
 			}
-			/* fall through */
+			fallthrough;
 		case TUNER_S0194:
 			fw_lme = fw_c_s0194;
 			ret = request_firmware(&fw, fw_lme, &udev->dev);
@@ -1018,7 +1018,7 @@ static int dm04_lme2510_frontend_attach(struct dvb_usb_adapter *adap)
 			}
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	case 0x22f0:
 		st->i2c_gate = 5;
 		adap->fe[0] = dvb_attach(m88rs2000_attach,
diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf-gpio.c b/drivers/media/usb/dvb-usb-v2/mxl111sf-gpio.c
index 0b7dda99e410..ef489c566b75 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf-gpio.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf-gpio.c
@@ -632,7 +632,7 @@ int mxl111sf_set_gpio(struct mxl111sf_state *state, int gpio, int val)
 	default:
 		mxl_printk(KERN_ERR,
 			   "gpio_port_expander undefined, assuming PCA9534");
-		/* fall-thru */
+		fallthrough;
 	case mxl111sf_PCA9534:
 		return pca9534_set_gpio(state, gpio, val);
 	case mxl111sf_gpio_hw:
@@ -693,7 +693,7 @@ int mxl111sf_init_port_expander(struct mxl111sf_state *state)
 	default:
 		mxl_printk(KERN_ERR,
 			   "gpio_port_expander undefined, assuming PCA9534");
-		/* fall-thru */
+		fallthrough;
 	case mxl111sf_PCA9534:
 		return pca9534_init_port_expander(state);
 	case mxl111sf_gpio_hw:
diff --git a/drivers/media/usb/em28xx/em28xx-audio.c b/drivers/media/usb/em28xx/em28xx-audio.c
index 6833b5bfe293..dc968fd5ace9 100644
--- a/drivers/media/usb/em28xx/em28xx-audio.c
+++ b/drivers/media/usb/em28xx/em28xx-audio.c
@@ -362,13 +362,13 @@ static int snd_em28xx_capture_trigger(struct snd_pcm_substream *substream,
 		return -ENODEV;
 
 	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE: /* fall through */
-	case SNDRV_PCM_TRIGGER_RESUME: /* fall through */
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
 		atomic_set(&dev->adev.stream_started, 1);
 		break;
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH: /* fall through */
-	case SNDRV_PCM_TRIGGER_SUSPEND: /* fall through */
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 		atomic_set(&dev->adev.stream_started, 0);
 		break;
diff --git a/drivers/media/usb/go7007/go7007-driver.c b/drivers/media/usb/go7007/go7007-driver.c
index 153a0c3e3da6..f1767be9d868 100644
--- a/drivers/media/usb/go7007/go7007-driver.c
+++ b/drivers/media/usb/go7007/go7007-driver.c
@@ -643,7 +643,7 @@ void go7007_parse_video_stream(struct go7007 *go, u8 *buf, int length)
 			case 0xD8:
 				if (go->format == V4L2_PIX_FMT_MJPEG)
 					vb = frame_boundary(go, vb);
-				/* fall through */
+				fallthrough;
 			default:
 				store_byte(vb, 0xFF);
 				store_byte(vb, buf[i]);
diff --git a/drivers/media/usb/gspca/mr97310a.c b/drivers/media/usb/gspca/mr97310a.c
index 464aa61cd914..3553788e8542 100644
--- a/drivers/media/usb/gspca/mr97310a.c
+++ b/drivers/media/usb/gspca/mr97310a.c
@@ -510,7 +510,7 @@ static int start_cif_cam(struct gspca_dev *gspca_dev)
 	switch (gspca_dev->pixfmt.width) {
 	case 160:
 		data[9] |= 0x04;  /* reg 8, 2:1 scale down from 320 */
-		/* fall through */
+		fallthrough;
 	case 320:
 	default:
 		data[3] = 0x28;			   /* reg 2, H size/8 */
@@ -520,7 +520,7 @@ static int start_cif_cam(struct gspca_dev *gspca_dev)
 		break;
 	case 176:
 		data[9] |= 0x04;  /* reg 8, 2:1 scale down from 352 */
-		/* fall through */
+		fallthrough;
 	case 352:
 		data[3] = 0x2c;			   /* reg 2, H size/8 */
 		data[4] = 0x48;			   /* reg 3, V size/4 */
@@ -607,10 +607,10 @@ static int start_vga_cam(struct gspca_dev *gspca_dev)
 	switch (gspca_dev->pixfmt.width) {
 	case 160:
 		data[9] |= 0x0c;  /* reg 8, 4:1 scale down */
-		/* fall through */
+		fallthrough;
 	case 320:
 		data[9] |= 0x04;  /* reg 8, 2:1 scale down */
-		/* fall through */
+		fallthrough;
 	case 640:
 	default:
 		data[3] = 0x50;  /* reg 2, H size/8 */
@@ -627,7 +627,7 @@ static int start_vga_cam(struct gspca_dev *gspca_dev)
 
 	case 176:
 		data[9] |= 0x04;  /* reg 8, 2:1 scale down */
-		/* fall through */
+		fallthrough;
 	case 352:
 		data[3] = 0x2c;  /* reg 2, H size */
 		data[4] = 0x48;  /* reg 3, V size */
diff --git a/drivers/media/usb/gspca/nw80x.c b/drivers/media/usb/gspca/nw80x.c
index 880f569bda30..0f5f2464ac7a 100644
--- a/drivers/media/usb/gspca/nw80x.c
+++ b/drivers/media/usb/gspca/nw80x.c
@@ -2019,7 +2019,7 @@ static int sd_init_controls(struct gspca_dev *gspca_dev)
 			V4L2_CID_AUTOGAIN, 0, 1, 1, 1);
 		gspca_dev->gain = v4l2_ctrl_new_std(hdl, &sd_ctrl_ops,
 			V4L2_CID_GAIN, 0, 253, 1, 128);
-		/* fall through */
+		fallthrough;
 	case Cvideopro:
 	case DvcV6:
 	case Kritter:
diff --git a/drivers/media/usb/gspca/ov519.c b/drivers/media/usb/gspca/ov519.c
index 0afe70a3f9a2..cd6776c3163b 100644
--- a/drivers/media/usb/gspca/ov519.c
+++ b/drivers/media/usb/gspca/ov519.c
@@ -2004,7 +2004,7 @@ static void reg_w(struct sd *sd, u16 index, u16 value)
 		break;
 	case BRIDGE_OVFX2:
 		req = 0x0a;
-		/* fall through */
+		fallthrough;
 	case BRIDGE_W9968CF:
 		gspca_dbg(gspca_dev, D_USBO, "SET %02x %04x %04x\n",
 			  req, value, index);
@@ -3528,7 +3528,7 @@ static void ov511_mode_init_regs(struct sd *sd)
 	case SEN_OV76BE:
 		if (sd->gspca_dev.pixfmt.width == 320)
 			interlaced = 1;
-		/* Fall through */
+		fallthrough;
 	case SEN_OV6630:
 	case SEN_OV7610:
 	case SEN_OV7670:
@@ -3541,7 +3541,7 @@ static void ov511_mode_init_regs(struct sd *sd)
 				break;
 			}
 			/* For 640x480 case */
-			/* fall through */
+			fallthrough;
 		default:
 /*		case 20: */
 /*		case 15: */
diff --git a/drivers/media/usb/gspca/sn9c20x.c b/drivers/media/usb/gspca/sn9c20x.c
index 2a6d0a1265a7..bfd194c61819 100644
--- a/drivers/media/usb/gspca/sn9c20x.c
+++ b/drivers/media/usb/gspca/sn9c20x.c
@@ -1637,7 +1637,7 @@ static int sd_config(struct gspca_dev *gspca_dev,
 		break;
 	case SENSOR_HV7131R:
 		sd->i2c_intf = 0x81;			/* i2c 400 Kb/s */
-		/* fall through */
+		fallthrough;
 	default:
 		cam->cam_mode = vga_mode;
 		cam->nmodes = ARRAY_SIZE(vga_mode);
diff --git a/drivers/media/usb/gspca/sunplus.c b/drivers/media/usb/gspca/sunplus.c
index f4a4222f0d2e..ace3da40006e 100644
--- a/drivers/media/usb/gspca/sunplus.c
+++ b/drivers/media/usb/gspca/sunplus.c
@@ -551,7 +551,7 @@ static void init_ctl_reg(struct gspca_dev *gspca_dev)
 	case BRIDGE_SPCA504:
 	case BRIDGE_SPCA504C:
 		pollreg = 0;
-		/* fall through */
+		fallthrough;
 	default:
 /*	case BRIDGE_SPCA533: */
 /*	case BRIDGE_SPCA504B: */
@@ -634,7 +634,7 @@ static int sd_init(struct gspca_dev *gspca_dev)
 		reg_w_riv(gspca_dev, 0x00, 0x2000, 0x00);
 		reg_w_riv(gspca_dev, 0x00, 0x2301, 0x13);
 		reg_w_riv(gspca_dev, 0x00, 0x2306, 0x00);
-		/* fall through */
+		fallthrough;
 	case BRIDGE_SPCA533:
 		spca504B_PollingDataReady(gspca_dev);
 		spca50x_GetFirmware(gspca_dev);
diff --git a/drivers/media/usb/gspca/xirlink_cit.c b/drivers/media/usb/gspca/xirlink_cit.c
index c579b100f066..cc87c24dd24c 100644
--- a/drivers/media/usb/gspca/xirlink_cit.c
+++ b/drivers/media/usb/gspca/xirlink_cit.c
@@ -1409,7 +1409,7 @@ static int cit_restart_stream(struct gspca_dev *gspca_dev)
 	case CIT_MODEL0:
 	case CIT_MODEL1:
 		cit_write_reg(gspca_dev, 0x0001, 0x0114);
-		/* Fall through */
+		fallthrough;
 	case CIT_MODEL2:
 	case CIT_MODEL4:
 		cit_write_reg(gspca_dev, 0x00c0, 0x010c); /* Go! */
@@ -2725,7 +2725,7 @@ static void sd_stop0(struct gspca_dev *gspca_dev)
 		break;
 	case CIT_MODEL2:
 		v4l2_ctrl_grab(sd->lighting, false);
-		/* Fall through! */
+		fallthrough;
 	case CIT_MODEL4:
 		cit_model2_Packet1(gspca_dev, 0x0030, 0x0004);
 
diff --git a/drivers/media/usb/gspca/zc3xx.c b/drivers/media/usb/gspca/zc3xx.c
index 15a2449d536f..aa285d5d6c0d 100644
--- a/drivers/media/usb/gspca/zc3xx.c
+++ b/drivers/media/usb/gspca/zc3xx.c
@@ -6766,7 +6766,7 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	case SENSOR_HV7131R:
 	case SENSOR_TAS5130C:
 		reg_r(gspca_dev, 0x0008);
-		/* fall through */
+		fallthrough;
 	case SENSOR_PO2030:
 		reg_w(gspca_dev, 0x03, 0x0008);
 		break;
@@ -6815,7 +6815,7 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	case SENSOR_TAS5130C:
 		reg_w(gspca_dev, 0x09, 0x01ad);	/* (from win traces) */
 		reg_w(gspca_dev, 0x15, 0x01ae);
-		/* fall through */
+		fallthrough;
 	case SENSOR_PAS202B:
 	case SENSOR_PO2030:
 /*		reg_w(gspca_dev, 0x40, ZC3XX_R117_GGAIN); in win traces */
diff --git a/drivers/media/usb/pwc/pwc-v4l.c b/drivers/media/usb/pwc/pwc-v4l.c
index 2f135d533af6..71b719d363a5 100644
--- a/drivers/media/usb/pwc/pwc-v4l.c
+++ b/drivers/media/usb/pwc/pwc-v4l.c
@@ -554,7 +554,7 @@ static int pwc_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 		if (!DEVICE_USE_CODEC3(pdev->type))
 			break;
 		/* For CODEC3 where autogain also controls expo */
-		/* fall through */
+		fallthrough;
 	case V4L2_CID_EXPOSURE_AUTO:
 		if (pdev->exposure_valid && time_before(jiffies,
 				pdev->last_exposure_update + HZ / 4)) {
diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 9ba3a2ae36e5..df4c5dcba39c 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -430,7 +430,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 		break;
 	case SMS_UNKNOWN_TYPE:
 		pr_err("Unspecified sms device type!\n");
-		/* fall-thru */
+		fallthrough;
 	default:
 		dev->buffer_size = USB2_BUFFER_SIZE;
 		dev->response_alignment = align;
diff --git a/drivers/media/usb/tm6000/tm6000-alsa.c b/drivers/media/usb/tm6000/tm6000-alsa.c
index c26a0ff60a64..3a2df36ef1db 100644
--- a/drivers/media/usb/tm6000/tm6000-alsa.c
+++ b/drivers/media/usb/tm6000/tm6000-alsa.c
@@ -272,13 +272,13 @@ static int snd_tm6000_card_trigger(struct snd_pcm_substream *substream, int cmd)
 	int err = 0;
 
 	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE: /* fall through */
-	case SNDRV_PCM_TRIGGER_RESUME: /* fall through */
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
 		atomic_set(&core->stream_started, 1);
 		break;
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH: /* fall through */
-	case SNDRV_PCM_TRIGGER_SUSPEND: /* fall through */
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 		atomic_set(&core->stream_started, 0);
 		break;
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a65d5353a441..6249e26e8788 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1509,11 +1509,11 @@ static void uvc_video_complete(struct urb *urb)
 	default:
 		uvc_printk(KERN_WARNING, "Non-zero status (%d) in video "
 			"completion handler.\n", urb->status);
-		/* fall through */
+		fallthrough;
 	case -ENOENT:		/* usb_poison_urb() called. */
 		if (stream->frozen)
 			return;
-		/* fall through */
+		fallthrough;
 	case -ECONNRESET:	/* usb_unlink_urb() called. */
 	case -ESHUTDOWN:	/* The endpoint is being disabled. */
 		uvc_queue_cancel(queue, urb->status == -ESHUTDOWN);
-- 
2.27.0


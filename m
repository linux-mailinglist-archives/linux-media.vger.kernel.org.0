Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B1A292B81
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 18:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730562AbgJSQ31 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 12:29:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37491 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730475AbgJSQ31 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 12:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603124965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=NoMSoywi178SqtjBMVuoXz6K+qKZ00/dgR9GXhO2qCU=;
        b=gNQtU9YbzL5cXxcDMq8npq9I9WBB3uL1qllUbhJvktn14lTEEsLCqQ7SP5ODV1JBR+X2j+
        gi1V8AES1o0UhdAa5wUgOH/wYyLznDKPlqkDV/xJeCAX+GaHCbIaVfiwKC9ujyNnbfQ8fh
        q0VK3VfL1COvM0V719VdfjTc4v4g9SU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-xjytIql9P4G4Tdp3QQtGWQ-1; Mon, 19 Oct 2020 12:29:23 -0400
X-MC-Unique: xjytIql9P4G4Tdp3QQtGWQ-1
Received: by mail-qk1-f198.google.com with SMTP id x5so43310qkn.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2020 09:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NoMSoywi178SqtjBMVuoXz6K+qKZ00/dgR9GXhO2qCU=;
        b=j3VbNo1STQm4wC7AB8dvzif/vlA+zqDz4lwVMF2wqxKOdtwbpEfyq6dppIm+xJwxEf
         U2oD1l5N0UJeMDF/+IXyLhejs4Rf8jglugsFkemZH2JfWWzKrL7RJlvIK/a6MXnL/8nM
         +3/jjBHop0MztYqYa8DvQ8VjfOv5xR+ecu2bwnrpZm/yLBOwppYdPoFGwAuX1I0Q9Y6R
         K2///7bie8lwKlwRcJEauD/acgrtK3cGa2iYdU+HjB6Mr5kFvSZwbNwtNv4OEoanvx7Q
         V6U+U/KMn8erNegYVvxfe4YGILLV5eMOSrJ2Ug+27TDc51vDWn6QWRVZYH+o3sikrtys
         qYVg==
X-Gm-Message-State: AOAM5329iJ1frHI5Y+yOxFXhYnnPawi9yWTckZCsT9GnLaARGhCtqyeK
        IhgOGV/L7ROc6Lu6UqV6cuvhmt5xgLCvdqRH121a0yw/3KTjMBKzrI+UOXuDjTv186KkRyOxIMX
        iF0hg1trqqUvKOgHETs4a8/Y=
X-Received: by 2002:a0c:edce:: with SMTP id i14mr452796qvr.38.1603124962019;
        Mon, 19 Oct 2020 09:29:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuePe1Z7eJNxHpKWNRMFygmkEx2GBPq4Rn6XfqyJCzsMQ+o7O1TdNtyhhvPIAJkoTse8Toyg==
X-Received: by 2002:a0c:edce:: with SMTP id i14mr452761qvr.38.1603124961730;
        Mon, 19 Oct 2020 09:29:21 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id s16sm226251qks.18.2020.10.19.09.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 09:29:21 -0700 (PDT)
From:   trix@redhat.com
To:     mchehab@kernel.org, colin.king@canonical.com, sean@mess.org,
        gustavoars@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] tv: remove unneeded break
Date:   Mon, 19 Oct 2020 09:29:17 -0700
Message-Id: <20201019162917.25254-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c |  7 -------
 drivers/media/dvb-frontends/drxd_hard.c     |  1 -
 drivers/media/dvb-frontends/nxt200x.c       | 16 ----------------
 drivers/media/dvb-frontends/si21xx.c        |  2 --
 drivers/media/tuners/mt2063.c               |  1 -
 5 files changed, 27 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 237b9d04c076..37b32d9b398d 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -2325,7 +2325,6 @@ hi_command(struct i2c_device_addr *dev_addr, const struct drxj_hi_cmd *cmd, u16
 
 	default:
 		return -EINVAL;
-		break;
 	}
 
 	/* Write command */
@@ -3594,7 +3593,6 @@ static int ctrl_set_uio_cfg(struct drx_demod_instance *demod, struct drxuio_cfg
 			break;
 		default:
 			return -EINVAL;
-			break;
 		}		/* switch ( uio_cfg->mode ) */
 		break;
       /*====================================================================*/
@@ -3618,7 +3616,6 @@ static int ctrl_set_uio_cfg(struct drx_demod_instance *demod, struct drxuio_cfg
 			break;
 		default:
 			return -EINVAL;
-			break;
 		}		/* switch ( uio_cfg->mode ) */
 		break;
       /*====================================================================*/
@@ -3642,7 +3639,6 @@ static int ctrl_set_uio_cfg(struct drx_demod_instance *demod, struct drxuio_cfg
 		case DRX_UIO_MODE_FIRMWARE0:
 		default:
 			return -EINVAL;
-			break;
 		}		/* switch ( uio_cfg->mode ) */
 		break;
       /*====================================================================*/
@@ -10953,7 +10949,6 @@ ctrl_set_standard(struct drx_demod_instance *demod, enum drx_standard *standard)
 	default:
 		ext_attr->standard = DRX_STANDARD_UNKNOWN;
 		return -EINVAL;
-		break;
 	}
 
 	return 0;
@@ -11074,7 +11069,6 @@ ctrl_power_mode(struct drx_demod_instance *demod, enum drx_power_mode *mode)
 	default:
 		/* Unknow sleep mode */
 		return -EINVAL;
-		break;
 	}
 
 	/* Check if device needs to be powered up */
@@ -11896,7 +11890,6 @@ static int drx_ctrl_u_code(struct drx_demod_instance *demod,
 		}
 		default:
 			return -EINVAL;
-			break;
 
 		}
 		mc_data += mc_block_nr_bytes;
diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
index 45f982863904..a7eb81df88c2 100644
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -1622,7 +1622,6 @@ static int CorrectSysClockDeviation(struct drxd_state *state)
 			break;
 		default:
 			return -1;
-			break;
 		}
 
 		/* Compute new sysclock value
diff --git a/drivers/media/dvb-frontends/nxt200x.c b/drivers/media/dvb-frontends/nxt200x.c
index 35b83b1dd82c..200b6dbc75f8 100644
--- a/drivers/media/dvb-frontends/nxt200x.c
+++ b/drivers/media/dvb-frontends/nxt200x.c
@@ -168,7 +168,6 @@ static int nxt200x_writereg_multibyte (struct nxt200x_state* state, u8 reg, u8*
 			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 
 	/* set multi register length */
@@ -190,7 +189,6 @@ static int nxt200x_writereg_multibyte (struct nxt200x_state* state, u8 reg, u8*
 			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 
 	pr_warn("Error writing multireg register 0x%02X\n", reg);
@@ -216,7 +214,6 @@ static int nxt200x_readreg_multibyte (struct nxt200x_state* state, u8 reg, u8* d
 			/* read the actual data */
 			nxt200x_readbytes(state, reg, data, len);
 			return 0;
-			break;
 		case NXT2004:
 			/* probably not right, but gives correct values */
 			attr = 0x02;
@@ -239,10 +236,8 @@ static int nxt200x_readreg_multibyte (struct nxt200x_state* state, u8 reg, u8* d
 				nxt200x_readbytes(state, 0x36 + i, &data[i], 1);
 			}
 			return 0;
-			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 }
 
@@ -374,7 +369,6 @@ static int nxt200x_writetuner (struct nxt200x_state* state, u8* data)
 			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 	return 0;
 }
@@ -555,7 +549,6 @@ static int nxt200x_setup_frontend_parameters(struct dvb_frontend *fe)
 			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 
 	if (fe->ops.tuner_ops.calc_regs) {
@@ -580,7 +573,6 @@ static int nxt200x_setup_frontend_parameters(struct dvb_frontend *fe)
 			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 	nxt200x_writebytes(state, 0x42, buf, 1);
 
@@ -594,7 +586,6 @@ static int nxt200x_setup_frontend_parameters(struct dvb_frontend *fe)
 			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 	nxt200x_writebytes(state, 0x57, buf, 1);
 
@@ -610,7 +601,6 @@ static int nxt200x_setup_frontend_parameters(struct dvb_frontend *fe)
 			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 
 	/* write sdmx input */
@@ -626,7 +616,6 @@ static int nxt200x_setup_frontend_parameters(struct dvb_frontend *fe)
 				break;
 		default:
 				return -EINVAL;
-				break;
 	}
 	buf[1] = 0x00;
 	switch (state->demod_chip) {
@@ -638,7 +627,6 @@ static int nxt200x_setup_frontend_parameters(struct dvb_frontend *fe)
 			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 
 	/* write adc power lpf fc */
@@ -664,7 +652,6 @@ static int nxt200x_setup_frontend_parameters(struct dvb_frontend *fe)
 			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 
 	/* write kg1 */
@@ -720,7 +707,6 @@ static int nxt200x_setup_frontend_parameters(struct dvb_frontend *fe)
 				break;
 		default:
 				return -EINVAL;
-				break;
 	}
 	nxt200x_writebytes(state, 0x30, buf, 1);
 
@@ -742,7 +728,6 @@ static int nxt200x_setup_frontend_parameters(struct dvb_frontend *fe)
 			break;
 		default:
 			return -EINVAL;
-			break;
 	}
 
 	/* write agc control reg */
@@ -1114,7 +1099,6 @@ static int nxt200x_init(struct dvb_frontend* fe)
 				break;
 			default:
 				return -EINVAL;
-				break;
 		}
 		state->initialised = 1;
 	}
diff --git a/drivers/media/dvb-frontends/si21xx.c b/drivers/media/dvb-frontends/si21xx.c
index a116eff417f2..e31eb2c5cc4c 100644
--- a/drivers/media/dvb-frontends/si21xx.c
+++ b/drivers/media/dvb-frontends/si21xx.c
@@ -464,10 +464,8 @@ static int si21xx_set_voltage(struct dvb_frontend *fe, enum fe_sec_voltage volt)
 	switch (volt) {
 	case SEC_VOLTAGE_18:
 		return si21_writereg(state, LNB_CTRL_REG_1, val | 0x40);
-		break;
 	case SEC_VOLTAGE_13:
 		return si21_writereg(state, LNB_CTRL_REG_1, (val & ~0x40));
-		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/tuners/mt2063.c b/drivers/media/tuners/mt2063.c
index 2240d214dfac..d105431a2e2d 100644
--- a/drivers/media/tuners/mt2063.c
+++ b/drivers/media/tuners/mt2063.c
@@ -1849,7 +1849,6 @@ static int mt2063_init(struct dvb_frontend *fe)
 
 	default:
 		return -ENODEV;
-		break;
 	}
 
 	while (status >= 0 && *def) {
-- 
2.18.1


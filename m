Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DF53771A7
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 14:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhEHMW6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 08:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbhEHMW5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 08:22:57 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BCCC061574;
        Sat,  8 May 2021 05:21:56 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b7so14971289ljr.4;
        Sat, 08 May 2021 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iFc03Rz0fO9UPNojfAfihtEJ62tAiwVsTwIn7JmK2Gw=;
        b=XeoFsy0qEZr3o8oJi5kAdQCLw9DkpkdS0Wb+BDCL8Ukt2SebSEAnHLsrI8ab3vbxwn
         Rq9X0lyedPBr+uRvLfeHU/QtiZ8sFcriXIYLLgFYn0KRUAZXK5yy7B69xNzdFInYDw8Z
         XzAbYCsm1uz0c4foNDtev9M+Ad2K7gToeOlonWbCrjQ3EMjDLm6XkXSvp1Upyz83/XHK
         gZJn81tac+EItxwYJOA99h8nVAKhCiIC35DITosZG4itAevjOz8TerGWhgVuRa0CdsZv
         YO+P2HCbC6Vf9pNjba8Yl2F6km8zLAfRsIxa7dThN030Vd8xck8kvTbGTWoIYCwrTypt
         mAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iFc03Rz0fO9UPNojfAfihtEJ62tAiwVsTwIn7JmK2Gw=;
        b=cVepdC/MZ9R4YqHUOghRVCxZ/rMF/TiBtZMyrrQXBm/9r/KzLYAj3/FibdeAGcMsed
         0fFs0wKL8Jsjpod1OSMOUgMfJYQDBhY/VDAvg9B25Ams6hPh20arBjFPnkKkQa6e9TA4
         4vL5fO93/ZST8WTmz2+0fKhH8wmsEVLHjvO82rKLr13jYLH8h1UXjWNx/VDyT1ZN3EY6
         I4rAG3cXsUO6LN7Kz6cZavuE1D5Clnsx2dVvuEfW1Ong9YvStgY6WVCoOd9PoAicEnQj
         suVP3MdWxWcA/kAYARO5BSdHf4QEQM1ASDoG0Eqh1aBxEeVAQPZa1bZnGEW9eNWU4N1h
         34Jg==
X-Gm-Message-State: AOAM532/YTnt70JkS/Rm0gM1pgoZiS/DebyKO+sdC+J8c1AhSDXB1bp8
        dbvc9QsAEWnYam4HCsKmx+g=
X-Google-Smtp-Source: ABdhPJyU1r+LUShx2Zr4TM4LBbAu4bDi2ue14Rdrf/bCsbCMZK78+h/PATuzsaXThYmfBmJT3dJGyQ==
X-Received: by 2002:a2e:5713:: with SMTP id l19mr11780202ljb.297.1620476514807;
        Sat, 08 May 2021 05:21:54 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id w16sm1631741lfu.160.2021.05.08.05.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:21:54 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 3/3] staging: media: atomisp: remove useless returns
Date:   Sat,  8 May 2021 15:21:52 +0300
Message-Id: <f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620475909.git.paskripkin@gmail.com>
References: <cover.1620475909.git.paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Breaks are not useful at the end of void function,
they can simply be removed.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 .../hive_isp_css_common/host/input_system.c   | 38 -------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 76414b6b43c9..8e085dda0c18 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -174,8 +174,6 @@ void input_system_get_state(
 		ctrl_unit_get_state(ID, sub_id,
 				    &state->ctrl_unit_state[sub_id - CTRL_UNIT0_ID]);
 	}
-
-	return;
 }
 
 void receiver_get_state(
@@ -246,8 +244,6 @@ void receiver_get_state(
 			       _HRT_CSS_RECEIVER_BE_IRQ_STATUS_REG_IDX);
 	state->be_irq_clear = receiver_reg_load(ID,
 						_HRT_CSS_RECEIVER_BE_IRQ_CLEAR_REG_IDX);
-
-	return;
 }
 
 bool is_mipi_format_yuv420(
@@ -310,8 +306,6 @@ void receiver_set_compression(
 	reg = ((field_id < 6) ? (val << (field_id * 5)) : (val << ((
 		    field_id - 6) * 5)));
 	receiver_reg_store(ID, addr, reg);
-
-	return;
 }
 
 void receiver_port_enable(
@@ -330,7 +324,6 @@ void receiver_port_enable(
 
 	receiver_port_reg_store(ID, port_ID,
 				_HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX, reg);
-	return;
 }
 
 bool is_receiver_port_enabled(
@@ -349,7 +342,6 @@ void receiver_irq_enable(
 {
 	receiver_port_reg_store(ID,
 				port_ID, _HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX, irq_info);
-	return;
 }
 
 rx_irq_info_t receiver_get_irq_info(
@@ -367,7 +359,6 @@ void receiver_irq_clear(
 {
 	receiver_port_reg_store(ID,
 				port_ID, _HRT_CSS_RECEIVER_IRQ_STATUS_REG_IDX, irq_info);
-	return;
 }
 
 static inline void capture_unit_get_state(
@@ -428,8 +419,6 @@ static inline void capture_unit_get_state(
 	state->FSM_State_Info = input_system_sub_system_reg_load(ID,
 				sub_id,
 				CAPT_FSM_STATE_INFO_REG_ID);
-
-	return;
 }
 
 static inline void acquisition_unit_get_state(
@@ -478,8 +467,6 @@ static inline void acquisition_unit_get_state(
 	state->Int_Cntr_Info = input_system_sub_system_reg_load(ID,
 			       sub_id,
 			       ACQ_INT_CNTR_INFO_REG_ID);
-
-	return;
 }
 
 static inline void ctrl_unit_get_state(
@@ -561,8 +548,6 @@ static inline void ctrl_unit_get_state(
 	state->capt_reserve_one_mem_region = input_system_sub_system_reg_load(ID,
 					     sub_id,
 					     ISYS_CTRL_CAPT_RESERVE_ONE_MEM_REGION_REG_ID);
-
-	return;
 }
 
 static inline void mipi_port_get_state(
@@ -597,8 +582,6 @@ static inline void mipi_port_get_state(
 		state->lane_sync_count[i] = (uint8_t)((state->sync_count) >> (i * 8));
 		state->lane_rx_count[i] = (uint8_t)((state->rx_count) >> (i * 8));
 	}
-
-	return;
 }
 
 static inline void rx_channel_get_state(
@@ -652,8 +635,6 @@ static inline void rx_channel_get_state(
 		state->comp[i] = (mipi_compressor_t)(val & 0x07);
 		state->pred[i] = (mipi_predictor_t)((val & 0x18) >> 3);
 	}
-
-	return;
 }
 
 // MW: "2400" in the name is not good, but this is to avoid a naming conflict
@@ -672,8 +653,6 @@ static void receiver_rst(
 	}
 
 	// AM: Additional actions for stopping receiver?
-
-	return;
 }
 
 //Single function to reset all the devices mapped via GP_DEVICE.
@@ -722,8 +701,6 @@ static void gp_device_rst(const gp_device_ID_t		ID)
 	//	gp_device_reg_store(ID, _REG_GP_SYNCGEN_FRAME_CNT_ADDR, ZERO);
 	gp_device_reg_store(ID, _REG_GP_SOFT_RESET_ADDR,
 			    ZERO); // AM: Maybe this soft reset is not safe.
-
-	return;
 }
 
 static void input_selector_cfg_for_sensor(const gp_device_ID_t ID)
@@ -740,8 +717,6 @@ static void input_selector_cfg_for_sensor(const gp_device_ID_t ID)
 	gp_device_reg_store(ID, _REG_GP_ISEL_SBAND_SEL_ADDR, ZERO);
 	gp_device_reg_store(ID, _REG_GP_ISEL_SYNC_SEL_ADDR, ZERO);
 	gp_device_reg_store(ID, _REG_GP_SOFT_RESET_ADDR, ZERO);
-
-	return;
 }
 
 static void input_switch_rst(const gp_device_ID_t ID)
@@ -760,8 +735,6 @@ static void input_switch_rst(const gp_device_ID_t ID)
 	gp_device_reg_store(ID,
 			    _REG_GP_IFMT_input_switch_fsync_lut,
 			    ZERO);
-
-	return;
 }
 
 static void input_switch_cfg(
@@ -786,8 +759,6 @@ static void input_switch_cfg(
 	gp_device_reg_store(ID,
 			    _REG_GP_IFMT_input_switch_fsync_lut,
 			    cfg->vsync_data_reg);
-
-	return;
 }
 
 static void input_system_network_rst(const input_system_ID_t ID)
@@ -843,8 +814,6 @@ static void input_system_network_rst(const input_system_ID_t ID)
 						  ISYS_CTRL_INIT_REG_ID,
 						  1U); //AM: Is there any named constant?
 	}
-
-	return;
 }
 
 // Function that resets current configuration.
@@ -1072,8 +1041,6 @@ static void capture_unit_configure(
 					  sub_id,
 					  CAPT_NUM_MEM_REGIONS_REG_ID,
 					  cfg->nof_mem_regs);
-
-	return;
 }
 
 static void acquisition_unit_configure(
@@ -1097,8 +1064,6 @@ static void acquisition_unit_configure(
 					  sub_id,
 					  ACQ_MEM_REGION_SIZE_REG_ID,
 					  cfg->mem_reg_size);
-
-	return;
 }
 
 static void ctrl_unit_configure(
@@ -1165,7 +1130,6 @@ static void ctrl_unit_configure(
 					  sub_id,
 					  ISYS_CTRL_CAPT_RESERVE_ONE_MEM_REGION_REG_ID,
 					  0);
-	return;
 }
 
 static void input_system_network_configure(
@@ -1223,8 +1187,6 @@ static void input_system_network_configure(
 				    sub_id,
 				    &cfg->ctrl_unit_cfg[sub_id - CTRL_UNIT0_ID]);
 	}
-
-	return;
 }
 
 static input_system_err_t configuration_to_registers(void)
-- 
2.31.1


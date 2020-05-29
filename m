Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFFE1E8858
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 22:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgE2UAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 16:00:50 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:35305 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgE2UAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 16:00:49 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N3sZy-1iwnQf3ybI-00zltS; Fri, 29 May 2020 22:00:42 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 7/9] staging: media: atomisp: fix enum type mixups
Date:   Fri, 29 May 2020 22:00:29 +0200
Message-Id: <20200529200031.4117841-7-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529200031.4117841-1-arnd@arndb.de>
References: <20200529200031.4117841-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Oi9GZuwYCtVW0YQN+bXyI0AbOsWHne7iHij3kFt4OBTdybYPLLc
 H1tbAKJGDVUZ/HsQa0IsK0ChzDn9x9fU4h3sHE2M5zUavENXzgppLZMmVaXJw8OgyvWf8JI
 6WLxv0LO1XndxyGT2+tNMSzcBc5pudM+yARQsUzCWMNXsbqpLy5LFNUd51iYNWH5M1XMuyd
 x4l1SpV6NWqnyboGlSK2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Iey8Rc3idrk=:R17CteIWPzHogAGPk1oHj2
 Ef9fDUzN7RcPNaW6sLJmU2Xs+zMyOjV0Yi2Rm6e9hOJsxxSwz6p3nF0I1uqsJphWUNwjZ5VFq
 cGBRzn9WDHR4MSsXIyVXGbPM5VHX7gRM8FeUxu81KrIwXXEuiD5JHweTfRLdlm/a+8XO1f9pX
 IHrvVNBArScrA2uLz6vrjnJzdPI6bM1eACaJnn/LjxuRiinFSalnndz0ed39CLMJX5iKHlzsd
 dGA2cupAXce2lpCk7UQB5r2RJtVprgpO3JYpUGppuuHLwr0ClY2F+UH+mS5zdub7M+MEJhBU4
 ubSfRC+2iR2pXRFD4DxvMp+mVZrUH3X8+3YluC4oCC7orAFJZmArPNOIa5wjhufII/+BHgR/7
 gKW4RUhD1AquC5HQ4QQWq+uGyqDyjCG6G809Z7LmGYrzuaYmw/cKs5RZQnc4nkl8RO6IoTA1p
 dlzfyWYWzYYKBsrRyZZ/3Oq7Xkxj0brEtxLfpZmM6m4rhKx24bRkKrt0iAf9uNfMPnoyG8jSQ
 pcE8IBgbsu//iK333FfoLHYzqsRVpBqems8d90rwo1wRUKHk6Dziw2EZ3cm6K26OZcWQCDZ8T
 8C3c5a9jV7LDkWUSFBfAHenQKFl0tnPbPcDtNqYxhYYthptPMcnNxRxscHftceodQhl3bC6L9
 HcnxTel/SZ+jZs4Qt2XdlV9gZrGUJtMXXeEtYRMQ1h9p73p4/+a4XSlSh4alXgbnHDzbJ3yjb
 w67r9wWYFhXQYPwO9+nn3zEMuMnGYyNjYqMaJrzi93icSQhIYIRAjQb0VutuIsPYC8OUwACDc
 nAIbKVkBQ8scTOAeuXWvnyk94XHy1BVHXzrodpMYzYwVNvLrKk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some function calls pass an incorrect enum type:

drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:858:16: error: implicit conversion from enumeration type 'input_system_ID_t' to different enumeration type 'gp_device_ID_t' [-Werror,-Wenum-conversion]
        gp_device_rst(INPUT_SYSTEM0_ID);
        ~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:860:19: error: implicit conversion from enumeration type 'input_system_ID_t' to different enumeration type 'gp_device_ID_t' [-Werror,-Wenum-conversion]
        input_switch_rst(INPUT_SYSTEM0_ID);
        ~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:876:27: error: implicit conversion from enumeration type 'input_system_cfg_flag_t' to different enumeration type 'input_system_connection_t' [-Werror,-Wenum-conversion]
                config.multicast[i]              = INPUT_SYSTEM_CFG_FLAG_RESET;
                                                 ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1326:32: error: implicit conversion from enumeration type 'input_system_ID_t' to different enumeration type 'gp_device_ID_t' [-Werror,-Wenum-conversion]
        input_selector_cfg_for_sensor(INPUT_SYSTEM0_ID);
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1329:19: error: implicit conversion from enumeration type 'input_system_ID_t' to different enumeration type 'gp_device_ID_t' [-Werror,-Wenum-conversion]
        input_switch_cfg(INPUT_SYSTEM0_ID, &config.input_switch_cfg);
        ~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~

INPUT_SYSTEM0_ID is zero, so use the corresponding zero-value
of the expected types instead.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../pci/hive_isp_css_common/host/input_system.c        | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 2114cf4f3fda..aa0f0fca9346 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -855,9 +855,9 @@ input_system_error_t input_system_configuration_reset(void)
 
 	input_system_network_rst(INPUT_SYSTEM0_ID);
 
-	gp_device_rst(INPUT_SYSTEM0_ID);
+	gp_device_rst(GP_DEVICE0_ID);
 
-	input_switch_rst(INPUT_SYSTEM0_ID);
+	input_switch_rst(GP_DEVICE0_ID);
 
 	//target_rst();
 
@@ -873,7 +873,7 @@ input_system_error_t input_system_configuration_reset(void)
 
 	for (i = 0; i < N_CSI_PORTS; i++) {
 		config.csi_buffer_flags[i]	 = INPUT_SYSTEM_CFG_FLAG_RESET;
-		config.multicast[i]		 = INPUT_SYSTEM_CFG_FLAG_RESET;
+		config.multicast[i]		 = INPUT_SYSTEM_DISCARD_ALL;
 	}
 
 	config.source_type_flags				 = INPUT_SYSTEM_CFG_FLAG_RESET;
@@ -1323,10 +1323,10 @@ static input_system_error_t configuration_to_registers(void)
 	} // end of switch (source_type)
 
 	// Set input selector.
-	input_selector_cfg_for_sensor(INPUT_SYSTEM0_ID);
+	input_selector_cfg_for_sensor(GP_DEVICE0_ID);
 
 	// Set input switch.
-	input_switch_cfg(INPUT_SYSTEM0_ID, &config.input_switch_cfg);
+	input_switch_cfg(GP_DEVICE0_ID, &config.input_switch_cfg);
 
 	// Set input formatters.
 	// AM: IF are set dynamically.
-- 
2.26.2


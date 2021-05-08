Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06D03771A4
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 14:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhEHMWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 08:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhEHMWn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 08:22:43 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF09C061574;
        Sat,  8 May 2021 05:21:41 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z9so16553610lfu.8;
        Sat, 08 May 2021 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Y3teniSGRQ0VOrXvsmVmKBJjGDITdl3HQv9AqHHKVM=;
        b=qUhZ/yb9OCq6Irbkz738dLNIaV0VmA6sCNzwEoZSqFtOrugaCuckpFV4qAoTx8iBs5
         gwsgagjHgJ0TwQQeIZzOwr8Z9noGMt2QuRrnUPIi+Fn0Z7B8WQ8Ltu9QibLQUCDILlOz
         L5YD580dq5o6/gJ4DouDDSut90OaqD58yebStNTQcrufNBmPeacDLg0KsylV89vwp5st
         WSRYyBT7Ml0tbV6xACLt9l4/Eozq798OR0z0pnLfcOtkP52uX79ElMMzZ/UA3ZTykcWP
         TutfN5cFE8Y41xv0WQb+W/1R0IgBz4AoiGt6IBsT3XRPewdpeaRmVXQtU4c2eBy5yCh5
         nEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Y3teniSGRQ0VOrXvsmVmKBJjGDITdl3HQv9AqHHKVM=;
        b=JOrV161Q+Bopekwo0UAiKL/n+oSx+iV5apeDDPdtEe9yNPZ1q7tUH/ea15PhKWfvQP
         9ciMJOWliG8kr8BLUnZcKnAX8uifkcb71I4nHXi9J8VsA7z7n+eW8jxQGvZ1Cduz5Kam
         bmtvEWhxiz2vVOfGaznseKEGFL3fqj/4YMYp9NM3sVrncv2gtLKkSyYxLG/4abr4S0u7
         cwhA3qfWcmGPlGUcW23iRi/vkgeYqWHPYmi5n+CRY1c38f88cuMtl/kI9GwvgiZ6zIM3
         6qVMdut1Jg+9x3VrYyr5lMYVy2uPfgfeXFJUf34V6/e+HkW+7zjhoANJIknyIfCXVeI7
         WxwA==
X-Gm-Message-State: AOAM533JPf8qHm1fxLxpTMaK1/kunC8/MIjAbJOfXp+/1YYeopn9zrx7
        27gy5Cl+Aa9esngbkAzEtXY=
X-Google-Smtp-Source: ABdhPJyBr1q2ZOINPkqz8zKEjwYi0oogwmYRR2+QE2fm5uaihpdeQaplE1KkCL76rx88R5Y8R1/SNQ==
X-Received: by 2002:ac2:428e:: with SMTP id m14mr9790318lfh.478.1620476500102;
        Sat, 08 May 2021 05:21:40 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id h14sm2283586lji.57.2021.05.08.05.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:21:39 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 1/3] staging: media: atomisp: remove useless breaks
Date:   Sat,  8 May 2021 15:21:34 +0300
Message-Id: <4b4a6ad1bc8fc1fd6aafc3e6cd7a4969890340c1.1620475909.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620475909.git.paskripkin@gmail.com>
References: <cover.1620475909.git.paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Breaks are not useful after a return, they can
simply be removed.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 .../pci/hive_isp_css_common/host/input_system.c       | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 0f5a231672a8..fd82997b11cc 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -904,16 +904,12 @@ static input_system_err_t input_system_configure_channel(
 			break;
 		case INPUT_SYSTEM_SOURCE_TPG:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		case INPUT_SYSTEM_SOURCE_PRBS:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		case INPUT_SYSTEM_SOURCE_FIFO:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		default:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		}
 
 		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return error;
@@ -995,7 +991,6 @@ static input_system_err_t input_buffer_configuration(void)
 			default:
 				config.csi_buffer_flags[port] |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
 				return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-				break;
 			}
 
 			// Check acquisition buffer specified but set it later since it has to be unique.
@@ -1032,7 +1027,6 @@ static input_system_err_t input_buffer_configuration(void)
 
 			default:
 				return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-				break;
 			}
 		} else {
 			config.csi_buffer_flags[port] = INPUT_SYSTEM_CFG_FLAG_BLOCKED;
@@ -1319,7 +1313,6 @@ static input_system_err_t configuration_to_registers(void)
 
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 
 	} // end of switch (source_type)
 
@@ -1696,16 +1689,12 @@ static input_system_err_t input_system_configure_channel_sensor(
 		break;
 	case INPUT_SYSTEM_FIFO_CAPTURE_WITH_COUNTING:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	case INPUT_SYSTEM_XMEM_CAPTURE:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	case INPUT_SYSTEM_XMEM_ACQUIRE:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	}
 	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
-- 
2.31.1


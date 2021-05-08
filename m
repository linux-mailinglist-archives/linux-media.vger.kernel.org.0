Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069CE377148
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 12:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhEHKxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 06:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhEHKxE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 06:53:04 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC39C061574;
        Sat,  8 May 2021 03:52:02 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id c3so16376021lfs.7;
        Sat, 08 May 2021 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=epHj2Vy2VG6M1RxgYQQjVnOCKuKHQEQgyxsjJaLhn3o=;
        b=jOKgMZNNcqHPGyfHVskdeg3YdEWcsurJkwLbZEXRCwPot61v4xytMk9oOccXrQq587
         JRMAAGAs39kk7JAgUIqgadluT+2y5l+blRzs7GW46fFkp1S9hsrPH+x5nfUB/xTN6mch
         iPi8bSx5LE5y6GNUZRtUcrgdHCaFlTUOy0DkEBKUDNZcYEJdoWejVPran+7wKNjmu286
         ENLlQTMBBdlfv8oLBogRM2KoiJNYs5GeX/chPHgQ3l6mCJuM82pm3xxD6NqyWDEskcAe
         KfLJwKqV/TF3AVI5yZny3agwmsKxL+7ynDD8PO3WzUJ2yYoLB8ItmLWjkQHdwmry0N4j
         kbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=epHj2Vy2VG6M1RxgYQQjVnOCKuKHQEQgyxsjJaLhn3o=;
        b=ceM0B8rjf2OOi+jO3qvWZ+SwQqc3QNRJ8vR3COtGpxqM7QxBc2QVbYt6WLbR8YE9HY
         Z37uFBfHmCfAhovsZZqjiHpJUiIQSNSXQ38KZtrl0750i8HvOXj5SbNpER8sHSdtKOke
         pXi3PGNIvyqAg+/vS3P2nBSO2GGgR4hunx5xQfY8j3Xs9NU+D7lSCmFhzNtxu/UiqggP
         dEbHU+PYnuRGgLxoNtbq3JYGJ1vKGovlpA9QUcBazkKquqds1zSuG+Zia+K6ekPfPq94
         3rVRjeGt/yopowe5bpHpBld5YaGcJdEyQIAxnhWYD5q6dWPsPE7EXK6RpalSXeKHaula
         GBvQ==
X-Gm-Message-State: AOAM532vULu72OSmlZ2LmUStmw9IC1y+WzAhc6c2jYN1nJiVWz/oHa3N
        2ELVnqgcHFRfnF3VyC08TgU=
X-Google-Smtp-Source: ABdhPJytsdxqc3V4oxOo3qtJmc5umaIJJGSlUZKGqzBs2NYt3UcFIIr7Zxcpm2+KkO/LISPR4EJoGA==
X-Received: by 2002:a05:6512:c1a:: with SMTP id z26mr9804138lfu.378.1620471121314;
        Sat, 08 May 2021 03:52:01 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id i20sm1593738lfv.71.2021.05.08.03.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 03:52:00 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: code cleanup
Date:   Sat,  8 May 2021 13:51:29 +0300
Message-Id: <20210508105129.2698-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507075458.GB3@paasikivi.fi.intel.com>
References: <20210507075458.GB3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Breaks are not useful after a return, they can
simply be removed.

Also, dropped the individual return statements
after or inside switch cases

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
Changes in v2:
  dropped the individual return statements
---
 .../hive_isp_css_common/host/input_system.c    | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 0f5a231672a8..cbaaec620581 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -903,17 +903,10 @@ static input_system_err_t input_system_configure_channel(
 			error = input_system_configure_channel_sensor(channel);
 			break;
 		case INPUT_SYSTEM_SOURCE_TPG:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		case INPUT_SYSTEM_SOURCE_PRBS:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		case INPUT_SYSTEM_SOURCE_FIFO:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		default:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		}
 
 		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return error;
@@ -995,7 +988,6 @@ static input_system_err_t input_buffer_configuration(void)
 			default:
 				config.csi_buffer_flags[port] |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
 				return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-				break;
 			}
 
 			// Check acquisition buffer specified but set it later since it has to be unique.
@@ -1032,7 +1024,6 @@ static input_system_err_t input_buffer_configuration(void)
 
 			default:
 				return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-				break;
 			}
 		} else {
 			config.csi_buffer_flags[port] = INPUT_SYSTEM_CFG_FLAG_BLOCKED;
@@ -1319,7 +1310,6 @@ static input_system_err_t configuration_to_registers(void)
 
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 
 	} // end of switch (source_type)
 
@@ -1695,19 +1685,11 @@ static input_system_err_t input_system_configure_channel_sensor(
 
 		break;
 	case INPUT_SYSTEM_FIFO_CAPTURE_WITH_COUNTING:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	case INPUT_SYSTEM_XMEM_CAPTURE:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	case INPUT_SYSTEM_XMEM_ACQUIRE:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	}
-	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
 
 // Test flags and set structure.
-- 
2.31.1


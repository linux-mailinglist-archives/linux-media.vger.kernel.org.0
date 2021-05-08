Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F77377207
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 15:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhEHNSY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 09:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhEHNSU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 09:18:20 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CA8C061574;
        Sat,  8 May 2021 06:17:16 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w15so15054259ljo.10;
        Sat, 08 May 2021 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Y3teniSGRQ0VOrXvsmVmKBJjGDITdl3HQv9AqHHKVM=;
        b=uiydmKVhHj4fc2Ul7DZWPG69vVbH7I5EBSw8mpeOLCH+uTfBJ0WC4NHAqr5+Fi9YHL
         +QkvyXT3E5mgBGFpQOu9dsYT1VHnEwGX7LnBG1ZBXtXpB2Oy2I7ng+ZTrXqN3+6wPjvU
         DnMICAhLurTzeHqppDfUdlGK+fcYP524QX3SfWhqIW/MdUER7aMchZAhM099WO2D9xWn
         UPz0y0/SUC4frt5zrdz4Y6Zgsb5AhEA/9U9eFIMbjpXhhgzwcxp99mUmjhLBxLcdEmtj
         iWWZoaZz/qS+N5GPPpLt+w3tQM4VzX25JFBTs0sqWm0rqCPPU4tvArU0wh/AE5+X0RC5
         Ly1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Y3teniSGRQ0VOrXvsmVmKBJjGDITdl3HQv9AqHHKVM=;
        b=mGALh0DhRaY3RpAy6yPoY8vzFnVll0JVpst5hGU82NIvw0JxzPEOCTEOZLxLnOSj2X
         +1MbbTruF8dh2y+fZWVgxRLwEDpNeWkEnc6EOg/5xhjOx9ky/+EK57wQ8O4Iu5OnCAqO
         cOU+AquCdq6rCBZeLoSnorv1NA4q8/lG6HZeYGUBWbqVBKozljjv5xEtaju3pPYtSkRi
         mboS0N8VRo0PDcjIzykuXVVkpU2y0ee/24jKwJ34O1X8zDSAdulSSwZ1ZZiUCKj/jOBK
         B7aCvU02zInoFTB6fpEpYKMAc/uCQrpLN7Rtr5utCV8dL4oYvcLcp4PXezuxwXsL45Q7
         koWA==
X-Gm-Message-State: AOAM531tcfPzC1PoPLwsM71Kc3Di7Bd021C7d3K4/tNh0dzWKJUE/VzS
        t4E3Mzgl/BnnJxb9MlHJzHN5BSYDuBPhIg==
X-Google-Smtp-Source: ABdhPJwCrUuouKX7ZTNOggSFm6MybDemlvemuHTfoseX9ntL8SPfprKbrGyITBS/vfg8YmM3F/Fjcw==
X-Received: by 2002:a2e:b5d6:: with SMTP id g22mr12108585ljn.423.1620479835253;
        Sat, 08 May 2021 06:17:15 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id j10sm1636022lfb.176.2021.05.08.06.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 06:17:14 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v4 1/3] staging: media: atomisp: remove useless breaks
Date:   Sat,  8 May 2021 16:17:12 +0300
Message-Id: <4b4a6ad1bc8fc1fd6aafc3e6cd7a4969890340c1.1620479607.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620479607.git.paskripkin@gmail.com>
References: <cover.1620479607.git.paskripkin@gmail.com>
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


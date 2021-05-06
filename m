Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6D4375C16
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 22:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbhEFULY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 16:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhEFULX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 16:11:23 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7724DC061574;
        Thu,  6 May 2021 13:10:22 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id v6so8673209ljj.5;
        Thu, 06 May 2021 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Y3teniSGRQ0VOrXvsmVmKBJjGDITdl3HQv9AqHHKVM=;
        b=NIQ32j57TAAgIyZgpVYmU0tkONnXNd82pp6sk55/HTpN4m9d9FrsKz3Ru4B8oE+vBy
         aaQjGS1i6Ttx15LSUhwbNq1RzKZnS8QDsZTaIYOnzeJVPPhxZPJCdRNOsYhGoDL6feA7
         piYwvVVABrxPIzRQ2JddGwTqUp9FEN/d7nQYzyc8DwJEOFd0adyuQoUVsASsiRgARs7D
         OR2MZ7/mKn+xPAqp+PwxHJbpg0iKMxhguuRlqtFkgaUjF1x+xQNttET1gmOiG67XMoWY
         YKLA6TcBfbZc3rdcQ83LPtRIu0L4MdYnEj2/bO03RcRHJoXZx/KU2SlhfcIC8qPPs3jO
         IEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Y3teniSGRQ0VOrXvsmVmKBJjGDITdl3HQv9AqHHKVM=;
        b=qIZ/qwEHvbmkgI1ilOh/jVo2u887akxz11XyQaUHvAvnrWACfb3b2nInj1pE50VVTy
         +thvx4ApuvLi5OWhwP/4Yb420D4V/7DSzco4WimDdl8yxpXinJilh0XNFClkuMbkA/dM
         j/Ysb8cu4rXKVlTsH+Vjb+1wO6oOzZ0jYBQBJTrWNPaav0n6MqNotwuHnUp9cl/qTWkP
         sylVwgrZ0su69SY6DVnZafOUxKw+VprHs+BQQ6s2+s7vgUf/J+TQjxQ/ClvULyfa0rh2
         ncxy5ZfUPnmADBOSkVBUtssluvO79M5nUBlYvkVjn0jWzGuXLy3Y/3efWG3ShGVVveyO
         Dppw==
X-Gm-Message-State: AOAM532xxMIvQvZzBKASHJtPBVsZFS0E0qUk5OFISIOU3p6gViAnP/bm
        Chwkr59AHoEFcT8hIr13+d9VaGYQyrlOJCUE
X-Google-Smtp-Source: ABdhPJyqFyrOJScrddF2MX+6nCuHCmry6An/qw8LYEm8UBrmrh5Lfn4WXzEEB02aFHjcg7WZRGhdbg==
X-Received: by 2002:a2e:5819:: with SMTP id m25mr4878840ljb.144.1620331821016;
        Thu, 06 May 2021 13:10:21 -0700 (PDT)
Received: from localhost.localdomain ([94.103.226.84])
        by smtp.gmail.com with ESMTPSA id q24sm924032lfc.261.2021.05.06.13.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:10:20 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove useless breaks
Date:   Thu,  6 May 2021 23:09:56 +0300
Message-Id: <20210506200956.16593-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
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


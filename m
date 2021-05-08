Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5863B3771A5
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 14:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhEHMWv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 08:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhEHMWv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 08:22:51 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700D3C061574;
        Sat,  8 May 2021 05:21:49 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id f12so2402662ljp.2;
        Sat, 08 May 2021 05:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IqIPJJa374NLUqCHGDm7/7oqA7WluXXWMUnsKHbUjRk=;
        b=WYDKYxHicDffBaip1TyN/ZJx+xbz+MQdC5sI3kmliq6kRkch0tK9Haocg5oNod1jWT
         7bGN2LzEYYFGt2jM84YtkZe6TPTl5IhHgOJb0WNIw48bD13oIozTCNkyLMObPe0pYDVc
         /Kp1h4mRfKaYB4nYABcdongGBh6xkfXNKg1UBFwbP3Cq6JcVvbEj9BrD2jGpc+zyFJD3
         2F3fs4MnJiw+pP/1ZmOQ4LZnaRz2yYOtzsh8DoRgxRexTB6El28hWDgfb02rSsJL+gx8
         lBBKbHsGFdRnZ1nmuZ+mZdP7qfZqxPFZeh9lj5S4TNXoJ5bhmmJAIDkqz9OjQXKafa5j
         gzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IqIPJJa374NLUqCHGDm7/7oqA7WluXXWMUnsKHbUjRk=;
        b=GaXRr0l/ZAFsfcb/1sSBmDDSP67toy3XX8xEs3CLYuqtSQfB02GRPT4fSMkwu4k49D
         wQq0you0PaiFEaomXbMgDVeGoeAc3LhdKBUg8rwMbq76FySFRdT8q9hAlKf27a0/2r+d
         ugKZxTB01fgN7dkenjREyUpcHGmSIMvAs9gJP451F5EDro/KUbEquYZkag2i6UJiSqdx
         CS9Cgt1ATdTgNbuH2R1RKnAGSsHiUt5POGOOq/k07BAwa+MwNSmKyDqtoE206Zm6SkVv
         2p3q2m7ULfyBRDB0SErGKFIltPCu5kSfKnvtfgGff7CUMQ2KahLo+vFjy+je/DGf7ipB
         SVJw==
X-Gm-Message-State: AOAM530o2WjRu1S9CO2FumRb3zZB65RvBCNS9xQkmriW+uORnS5t0v3J
        CaHWLsjQ6zG5DwJsEYEiTWI=
X-Google-Smtp-Source: ABdhPJz4+Qg28+GuALq9DVmJOKQMbLxJVRcrkqxACl+vhpypuTy1ImL7lf0MZbmjx2OEKYw7vE2/Dg==
X-Received: by 2002:a2e:390a:: with SMTP id g10mr12209311lja.64.1620476507988;
        Sat, 08 May 2021 05:21:47 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id v8sm2304437ljn.17.2021.05.08.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:21:47 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 2/3] staging: media: atomisp: remove dublicate code
Date:   Sat,  8 May 2021 15:21:46 +0300
Message-Id: <3944cd10bb5a64157781b1e0ef044c62c05f07c7.1620475909.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620475909.git.paskripkin@gmail.com>
References: <cover.1620475909.git.paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed dublicate returns and breaks inside switch
statements and useless return after switch.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 .../pci/hive_isp_css_common/host/input_system.c     | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index fd82997b11cc..76414b6b43c9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -903,11 +903,8 @@ static input_system_err_t input_system_configure_channel(
 			error = input_system_configure_channel_sensor(channel);
 			break;
 		case INPUT_SYSTEM_SOURCE_TPG:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		case INPUT_SYSTEM_SOURCE_PRBS:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		case INPUT_SYSTEM_SOURCE_FIFO:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		default:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		}
@@ -1301,13 +1298,7 @@ static input_system_err_t configuration_to_registers(void)
 		break;
 
 	case INPUT_SYSTEM_SOURCE_TPG:
-
-		break;
-
 	case INPUT_SYSTEM_SOURCE_PRBS:
-
-		break;
-
 	case INPUT_SYSTEM_SOURCE_FIFO:
 		break;
 
@@ -1688,15 +1679,11 @@ static input_system_err_t input_system_configure_channel_sensor(
 
 		break;
 	case INPUT_SYSTEM_FIFO_CAPTURE_WITH_COUNTING:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	case INPUT_SYSTEM_XMEM_CAPTURE:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	case INPUT_SYSTEM_XMEM_ACQUIRE:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
-	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
 
 // Test flags and set structure.
-- 
2.31.1


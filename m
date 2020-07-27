Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E292622E735
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 10:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgG0ICE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 04:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgG0ICE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 04:02:04 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED8DC0619D2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 01:02:04 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k4so7587223pld.12
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 01:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=students-iitmandi-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aKrJE9Py1tsJLs5WZM0aY5vQOQN0nZ3c2moryg/s6o=;
        b=KKqLZ5nwx7nxpoPwMu9qwSR1JM5EddcoP1pbxCt7v3rbmO55ujS/kCvtb6LFy0pXOt
         1N8ISZQ8RPBeYIS6BLNxRucrOVz1Ixy4va6HxddeXzoN3OLxLmR5Z2iStw5nPR9k+8by
         F8aWzDLSdvNQ0YT56u3WCrMZ5MkwhiXTAyDxMfKpSsFlD+lyrfSKIxHGTyVXSPnryIaN
         nf/SSw0LsQNMMSMed5JIr/m/0CDjrRn5LGOvBbOo5DwMVPSIp3+Mz9O8mdp0hOhnbKOp
         u/EMI8h5+BJmBut7v4UQFg544FzC1RpmJtOKdhU762u5NMuOlLLEhvtW7RKParzmyP3x
         AtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aKrJE9Py1tsJLs5WZM0aY5vQOQN0nZ3c2moryg/s6o=;
        b=KA6rPveNYOOw6xkvxmM9p8P6ZbosNRPX9K8XdtnPf3hkx5JxaxY4Xy34+1Xxe4AUOL
         hj4hEUcPdEK7zISSQqvKO4uGr3O1su6S1mpYZ+kQtPWyDTkKNoiAzSLZqdfClBDNrBrK
         KthSw6znEkFXnRuv0puLRUggJBmprGi7TDqNy8558Y4FzukFd8rBNqpVPKWzSEvSUmRX
         QDS1mGIpRhZ9Pyca62L7OVxXyt+5R2R0VO65EqH7oq8xsgDVsNr0MMwA8/ZnDEDz4XzQ
         aM00BHmWwqboLqGlPY+Hod3ZIwAWlEcyP/QA7oZEXildRqqJdMOk0pWGGuqquY/p/X8B
         HVMg==
X-Gm-Message-State: AOAM532JnHJaffQlflcpUQv4KLroEFAFWDS5urxDfiFw2csHKO2IxiVf
        byK648r+e8oesTpqPn10VWoMJw==
X-Google-Smtp-Source: ABdhPJxziIblCT8HYAbJj1Tahx3ppMGS4qWuh83g0+lwwyyTBn4XTjVDzrY+1PhUQvEXSnOUioUrLw==
X-Received: by 2002:a17:90a:1109:: with SMTP id d9mr17853767pja.201.1595836923781;
        Mon, 27 Jul 2020 01:02:03 -0700 (PDT)
Received: from devil-VirtualBox.www.tendawifi.com ([103.198.174.215])
        by smtp.gmail.com with ESMTPSA id bv17sm1164494pjb.0.2020.07.27.01.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 01:02:03 -0700 (PDT)
From:   Ankit <b18007@students.iitmandi.ac.in>
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, b18007@students.iitmandi.ac.in
Subject: [PATCH] Staging : media : atomisp : pci : fixed a brace coding sytle issue
Date:   Mon, 27 Jul 2020 13:31:50 +0530
Message-Id: <20200727080150.10659-1-b18007@students.iitmandi.ac.in>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ankit Baluni<b18007@students.iitmandi.ac.in>

Fixed a coding style issue.

Signed-off-by: Ankit Baluni<b18007@students.iitmandi.ac.in>

---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 8ea65bef35d2..28b96b66f4f3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4981,9 +4981,8 @@ enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
 	case ATOMISP_CAMERA_PORT_SECONDARY:
 		return MIPI_PORT1_ID;
 	case ATOMISP_CAMERA_PORT_TERTIARY:
-		if (MIPI_PORT1_ID + 1 != N_MIPI_PORT_ID) {
+		if (MIPI_PORT1_ID + 1 != N_MIPI_PORT_ID)
 			return MIPI_PORT1_ID + 1;
-		}
 	/* fall through */
 	default:
 		dev_err(isp->dev, "unsupported port: %d\n", port);
-- 
2.25.1


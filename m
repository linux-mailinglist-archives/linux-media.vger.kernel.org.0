Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7145922E709
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 09:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgG0H4g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 03:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgG0H4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 03:56:36 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27001C0619D2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 00:56:36 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so1395122pjb.4
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=students-iitmandi-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aKrJE9Py1tsJLs5WZM0aY5vQOQN0nZ3c2moryg/s6o=;
        b=nJNa9uz6VP84cme/Py+7ka0vfYx0GHGjSdy+npdBPeWmYgPEbYcuQSwKl70c6tQznU
         nZWXmTV5IlZSxcu+V65H3m39JrNlWZYJa9U+P5BQ3e9i2sm3aPXlBg3gYw/OxoL0uH0K
         AKf/FDJg+r7S9Ct4qiQbvMQTrzLzD7XsUI5P2LBVT7mRzoH8OfEgJFLMMd2A7xkJ7I8X
         14jGy3dttcfKGt0fMIKAmPkglAUQ9NHV84Zx/NWxR+Ymw1kzmsgPYHQn2CfM+CdTyXId
         oF0CCY5j2SfxRJYvWZKhWjju9bXKPeaibtjN36DZAgQke7tdg/Eqe1d3QrWo2I6oEqc7
         dluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aKrJE9Py1tsJLs5WZM0aY5vQOQN0nZ3c2moryg/s6o=;
        b=frgreH9Z6voJAXQhEpUNktn4T1Hdr+x5j9kJ/NVQkAb6/is+urrP9ieZHe7qvIvCsU
         9gLxCFE3zh8k8DpWevOubw//QirJJ8A2Pz0mY9x00mo8ZpBqvIfcflD0mH0uyET0wy18
         PKdLgsAxlfxmsWUwtYDTBt1RBBHdeHeMMURUS27hVggAdE/eDMAnW20AtOqziLRtsh1G
         ou6VCYdAsibkn7qxPpH3Gbhxdaqh3bxYsq49BIeCopAIJc6h3eC8dqv01DrJkBpFo52y
         1F8PFVjFu7d/+zIhjxWBthBi4kmJeNyfg87w7ZBr380cALGSYUN1RedPILvERhrjbGJb
         s6ug==
X-Gm-Message-State: AOAM531Rsu2sBVIDqJUXMLHYKfgpUbIoLYYEoZrYilCiRTn8/QSfMKvu
        ha1VGXEQW9cPay2i1C7LdzrQmQ==
X-Google-Smtp-Source: ABdhPJyLqbVZbqonRnh1UxubYv7PTVMPqTP/SSuLKnbNXZqLsYVNeIWLdbuKO4BlbLBehkSJoGEcLA==
X-Received: by 2002:a17:90a:e96:: with SMTP id 22mr6389287pjx.135.1595836595721;
        Mon, 27 Jul 2020 00:56:35 -0700 (PDT)
Received: from devil-VirtualBox.www.tendawifi.com ([103.198.174.215])
        by smtp.gmail.com with ESMTPSA id u21sm1312338pjn.27.2020.07.27.00.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 00:56:35 -0700 (PDT)
From:   Ankit <b18007@students.iitmandi.ac.in>
To:     mchehab@kernel.org
Cc:     gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        b18007@students.iitmandi.ac.in
Subject: [PATCH] Staging : media : atomisp : pci : fixed a brace coding sytle issue
Date:   Mon, 27 Jul 2020 13:25:28 +0530
Message-Id: <20200727075528.10418-1-b18007@students.iitmandi.ac.in>
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


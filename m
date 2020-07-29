Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0617A231A6B
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 09:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgG2HjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 03:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgG2HjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 03:39:14 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1173C0619D2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 00:39:14 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id l12so2736685pgt.13
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 00:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=students-iitmandi-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zMRvTgAMRZWNdLWhRQAFPO8+G0B9J9srTu2Fp7kXf3M=;
        b=MhQLprU+zfumI0Msb8Sixe8JB0MV/W4eiDpEHKivnFRbY8aL9QeXqyRmnViWb7gOp5
         nkoIGdOUWLWHQKitYjmabDUeW04u+WgogyNIuSCi9jH/FmVFpM6KcfmaUNUfEXshZbhv
         ilraWxNFBfNIa0z732o6XMA/TIYB/UR0wAz1ildcGyYKrw+Fru+qIZsROWbs3VMX3o0t
         B1yJPZR9xzo0YAW18KINNWlB7xLihcIw+1UG9Fd3ejO1wYMlcXIyZ1FKpZcEtGmy0bj2
         yJqq11CpEebpfFOmExwZrNXO7EY7HNbx7Y1tveWOWlGjR4v7x1QlIqUgGYu6N1jZC9Hv
         r12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMRvTgAMRZWNdLWhRQAFPO8+G0B9J9srTu2Fp7kXf3M=;
        b=Pxh2aUBwFyt5vX4f3HyrFDUp5u2YZkyioyOgw3l+qNtrceskWGndE8I4ck5epeQCak
         AF9P/7kVUHFVyhZ7ir5sZmUJoxvpAPyy0tEFx7u4vkOYXstlNd4bZ4SSkzutUcZuPkh5
         MWjHBm8cXQ+neAohoO858THZY6W9QCjNhD55BTSwq9VKQ+4hxQ+pf4+kFDI7rl8OWXqF
         Xjm+xkUSI45ZQBPkw9MOJpn+Os9LWXfE30g9b/0Do36G2ltgEnoaVwR3mT8sPfvFXKe1
         GnQ0HP5/mRXkbJclkk8o5i5aWNibZN9MLaQEKjTSmTqQNJgHo0by3ml6VpZ4oZx2E93V
         39hg==
X-Gm-Message-State: AOAM532AQ+nLeUKQTZOL25oXP0Ih5m4blZU/RII3qTmFq1e5vd1FfYaI
        Ch46QeX91R4xywx2xhmaY8zILQ==
X-Google-Smtp-Source: ABdhPJz2y+b3KMCeMF9l2PfAURxiLwo90lBqvKvvMpApyd7bhUoIzx4c9gUaLiu08ofQdhu9c2ootg==
X-Received: by 2002:a63:5d1:: with SMTP id 200mr28603061pgf.59.1596008354163;
        Wed, 29 Jul 2020 00:39:14 -0700 (PDT)
Received: from devil-VirtualBox.www.tendawifi.com ([103.198.174.215])
        by smtp.gmail.com with ESMTPSA id f24sm1214206pjq.48.2020.07.29.00.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 00:39:13 -0700 (PDT)
From:   Ankit Baluni <b18007@students.iitmandi.ac.in>
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, b18007@students.iitmandi.ac.in
Subject: [PATCH v3] Staging : media : atomisp : fixed a brace coding sytle issue
Date:   Wed, 29 Jul 2020 13:09:02 +0530
Message-Id: <20200729073902.1704-1-b18007@students.iitmandi.ac.in>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728225935.28880-1-b18007@students.iitmandi.ac.in>
References: <20200728225935.28880-1-b18007@students.iitmandi.ac.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed braces for a 'if' condition as it contain only single line & 
there is no need for braces for such case according to coding style
rules.

Signed-off-by: Ankit Baluni <b18007@students.iitmandi.ac.in>

---
Changes in v2:
	-Added more description about the patch.
	-Added space before the symobol '<' in 'From'
	 and 'Signed-off-by' line.
Changes in v3:
	-Removed space before ':' in subject line.

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


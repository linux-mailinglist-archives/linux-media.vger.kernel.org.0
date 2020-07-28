Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B156230545
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 10:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgG1IXq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 04:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728127AbgG1IXq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 04:23:46 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468B4C0619D2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 01:23:46 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b186so232905pfb.9
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 01:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=students-iitmandi-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Krf3mHPaRhONZrJUP4kLL+SpT/1O8y5l8m6Ya1wdpkE=;
        b=nhCjMNdGpcIOWYXchr2X67Jx0xqPObEdVXUjSjcpgdiYIruWbcrLrjOSjJzGqAIjd7
         vrlt8Jb75Qf+wTP9BNzXwrM0QEtfMyFaj3F8eAHdCZnvakhHkGu3s0VoUuJWRBv8oe9a
         lyzFkTycR02L1IJfPhmBwvu6/GhoRYxO07BNT8B1jJ8komhzqC80ueEL+jHk8n89+1CU
         qqil3Ip7r/q+8uL6iFxdTsrIk46pLcuaXVt5C/6ibrhdHcTItJI5CRZOtXL1apqR5xdz
         J7MSYQgRLxz8hrXMiABWD1IOkuc7T62hWlfuzqn0GiBerGiq4FJOBDuwZ5cGU5J5L38h
         C0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Krf3mHPaRhONZrJUP4kLL+SpT/1O8y5l8m6Ya1wdpkE=;
        b=e02rKe5mdDx13rPgYNnXo252RFezyfVurARzmFcYt3gknT642/5VPpQVtRVn11jx5F
         GIABvRbU5oSYquCMPPz1ChBuxopWEYkK6QMVriFWD+NJAs94lLB1iyhczAVzE7tw9HTi
         oPMOWnoSMOmYCuPlOv+0W9tskXeXpJiIE49NMF7BXQxa3hSJ77KaQ1KkZ1LxquAO0g8g
         VMTt0ezqcWxW7Lab5rSt2gWgYX5h/fzGQV7bfUJEX5rJ+nzd+C9efLMkcHzW3GFC0wyP
         o9d5DD6kjDFUWrvYvK8rD3vV7Fll6d1KmT+8ScohqKUMsTJxXE/U2HzxPujAVAkT2jXm
         AFXw==
X-Gm-Message-State: AOAM533agWXr5YXyw2aR7e3s2ie8viz+gvS8H9f1Yb3HCCO7fv+YZTPC
        wHYApLikYtqEscwcRk5DhLzetg==
X-Google-Smtp-Source: ABdhPJwxUnxFK756k0a5/cKYYYuNHSDaVSvQ6w8JriFYCnKNk602Aut098WOzwQLFtdyZlJjBPowUQ==
X-Received: by 2002:a63:4e51:: with SMTP id o17mr24411320pgl.315.1595924625553;
        Tue, 28 Jul 2020 01:23:45 -0700 (PDT)
Received: from devil-VirtualBox.www.tendawifi.com ([103.198.174.215])
        by smtp.gmail.com with ESMTPSA id o10sm2033014pjo.55.2020.07.28.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 01:23:44 -0700 (PDT)
From:   Ankit <b18007@students.iitmandi.ac.in>
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, b18007@students.iitmandi.ac.in
Subject: [PATCH v2] Staging : media : atomisp : fixed a brace coding sytle issue
Date:   Tue, 28 Jul 2020 13:53:30 +0530
Message-Id: <20200728082330.24948-1-b18007@students.iitmandi.ac.in>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728073715.GA351768@kroah.com>
References: <20200728073715.GA351768@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ankit Baluni <b18007@students.iitmandi.ac.in>

Removed braces for a 'if' condition as it contain only single line & 
there is no need for braces for such case according to coding style
rules.

Signed-off-by: Ankit Baluni <b18007@students.iitmandi.ac.in>

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


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40CE023E90D
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgHGIgk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727870AbgHGIgg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:36 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A447AC061574;
        Fri,  7 Aug 2020 01:36:36 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id e5so733758qth.5;
        Fri, 07 Aug 2020 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HM+pB+gegJETUTC8BtYwm1pgwV6KHTLqQbgt5bu8Qq8=;
        b=bZdXLbTYVurwEC6xi+YPZ4+960RF0X6/+S2xTN/Tf0zaHBVW17eWe5ecjpaP16lWsN
         xvded1AZrbUdEJ3hHs0s3kubWc/ImbJpNTNz4bUoWoXmepblKlM/STHcNn77pmKKBZh0
         vpWQALpZIxUjSOmm988R599fx0pEK/xQDupMf4razT4VZHc3pO3sbGCsKQ87HZmn9JjO
         IJ4pmFS8NXU/EoV1YJhL/8BhJ7tJvvfEOvpy1WxfyG5xC2so4YfJVc0eUKGSl/VrsnSp
         q7IYaIVNy6krnJd73mbXGlSJ5Rw0obOILdqr3EaauWUO3CnT5CivHVxNUEbBkHiy0nij
         /ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HM+pB+gegJETUTC8BtYwm1pgwV6KHTLqQbgt5bu8Qq8=;
        b=BmDL1sxFAVrMAX3mPeZrAlwsS8lEbXqp1teFxx6SWoiwHlYP2Hg91g6ozeuCKZuQu4
         pzTK6uArjw2XDr/eqRQectaxN0EZZyh+Eis72D1oxlcH2ZhqGELd/06zR+EHsApitJOq
         F8S08wYvO+pmHI3h8oVxsTT9TBW8XP4t4M/y6dQb7IPEiAkWzwDs1VsYaJ2qCZEwWIq/
         wSib13edYwhjhSZEdoKiMJbA6TbPcP5T5XR+KVYzoMoCVOtgDurDmUPSmZdF5KpaNS4e
         AevNo71BrqpVWOD9+wyJ9DYRG++etKUberrEr6tdMkvKXxZLPRyFaBVC9yppBE8UaKPH
         EYuQ==
X-Gm-Message-State: AOAM532uLS2Cwwj0X2vZvtuaWBO4O0cs55751wAdlOi+foggjmWBPUGE
        CyS37hF//j1lCtz21FVMM3RuynIkPzy7+w==
X-Google-Smtp-Source: ABdhPJx84MtNtBOV38eDB3Rn3JvX/G2SrLdHXnRjL0jGLfNMWNPZWEsG8T6oQf6oSctneVPkUKilIg==
X-Received: by 2002:ac8:7188:: with SMTP id w8mr12952874qto.223.1596789395676;
        Fri, 07 Aug 2020 01:36:35 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:35 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 08/20] media: pci: saa7164.c: Replace if(cond) BUG with BUG_ON
Date:   Fri,  7 Aug 2020 05:35:35 -0300
Message-Id: <20200807083548.204360-8-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle reports:

drivers/media/pci/saa7164/saa7164-buffer.c:254:3-6: WARNING: Use BUG_ON
instead of if condition followed by BUG.

drivers/media/pci/saa7164/saa7164-buffer.c:261:3-6: WARNING: Use BUG_ON
instead of if condition followed by BUG.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-buffer.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-buffer.c b/drivers/media/pci/saa7164/saa7164-buffer.c
index 289cb901985b..245d9db280aa 100644
--- a/drivers/media/pci/saa7164/saa7164-buffer.c
+++ b/drivers/media/pci/saa7164/saa7164-buffer.c
@@ -250,15 +250,14 @@ int saa7164_buffer_cfg_port(struct saa7164_port *port)
 	list_for_each_safe(c, n, &port->dmaqueue.list) {
 		buf = list_entry(c, struct saa7164_buffer, list);
 
-		if (buf->flags != SAA7164_BUFFER_FREE)
-			BUG();
+		BUG_ON(buf->flags != SAA7164_BUFFER_FREE);
 
 		/* Place the buffer in the h/w queue */
 		saa7164_buffer_activate(buf, i);
 
 		/* Don't exceed the device maximum # bufs */
-		if (i++ > port->hwcfg.buffercount)
-			BUG();
+		BUG_ON(i > port->hwcfg.buffercount);
+		i++;
 
 	}
 	mutex_unlock(&port->dmaqueue_lock);
@@ -302,4 +301,3 @@ void saa7164_buffer_dealloc_user(struct saa7164_user_buffer *buf)
 
 	kfree(buf);
 }
-
-- 
2.28.0


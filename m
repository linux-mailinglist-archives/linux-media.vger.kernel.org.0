Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19F0C98E7
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 09:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbfJCHTQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 03:19:16 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34604 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727368AbfJCHTQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 03:19:16 -0400
Received: by mail-pg1-f194.google.com with SMTP id y35so1211566pgl.1
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yHhsXxK0PdjvrEP2oyButSCFP7rZMOADjklF42mJfCk=;
        b=q0xYk/81qkd7rofEbzelbcHKkJQMxh31uZUjhV/rVYDav9XpuvgetTKUcNnCjkl4jz
         QcPZVK4YgZzSl6tnJvYZ+4GgEAYgRgEiA2cse/RbQx2NdcRFZRbyfrKDt4bCXPxz+6td
         fUf8mvQHEoH8dYnJm1u5aCPdOnyGqI7QlstzEnyUUxYQPkTXRPuF3OlgG4XAPS3TBpAN
         J21M2rzQ+c3vKH/FCrmcTsMquon/dB3/Mi1pebNKeribIS6dudXjb7vB2900seXeBpH+
         5iJFn1bljdMDQxzld4qN29a4cwUdTWejh3Nn069FkPifB5MbkElIvEumCtLEdOiP66C3
         eYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yHhsXxK0PdjvrEP2oyButSCFP7rZMOADjklF42mJfCk=;
        b=JcJgTRYGnE7UUm3ml0U52onAUFr5hIY+WpCT//zxBJbSGEAnCshq16O85pcV+uaRkQ
         vlwbJZ/iBXYJEEaIrIyP5gkXUUAabZWkhF/jLd4dtV6yWvnjVft5/XzrFHQET80umOOZ
         nmzyVeqo1xKwSB6CNSJzA6KIPyUwe+0y/RMioj6YlAOqqsQKzVhm1nKRBy19qVDnoBPS
         NrqvIfEhot6fO5IwdobFNO9jJv/XsF0o41oC6q3Cvca2ik2F6YnTaST6StyfPpLMIZtn
         NScTXI0SeaUfZaozkejNx/2k/6Jlhu38hbo3NHfJBOKXQ8jpW6FeSC9Ev9VDDPlc9/Dz
         tk6g==
X-Gm-Message-State: APjAAAXlHKUFq4y3iGms9l4cF291WLArYBuitEj1vmrceD8yvG09rXY4
        t4/BDi5WACIfwKBFSCwUCEQFwt61
X-Google-Smtp-Source: APXvYqy0NpnpbL5guzII+0rjs8+YaOD5jIVZg3fHzhFpDpzhwXXMPyOzaHka4BjosZOi4Lm29bDmXA==
X-Received: by 2002:a63:121c:: with SMTP id h28mr7975257pgl.336.1570087154851;
        Thu, 03 Oct 2019 00:19:14 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.207.214])
        by smtp.gmail.com with ESMTPSA id y17sm2645109pfo.171.2019.10.03.00.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 00:19:14 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH 1/2] v4l2-core: Add new metadata format
Date:   Thu,  3 Oct 2019 12:48:55 +0530
Message-Id: <20191003071856.23664-2-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003071856.23664-1-bnvandana@gmail.com>
References: <20191003071856.23664-1-bnvandana@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new metadata format to support metadata output in vivid.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 20b3107dd4e8..34c1a2bd7f28 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1340,6 +1340,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
+	case V4L2_META_FMT_VIVID:       descr = "Vivid Output Metadata"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 530638dffd93..a32335fcd064 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -755,6 +755,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
 #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
+#define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Output Metadata */
 
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
-- 
2.17.1


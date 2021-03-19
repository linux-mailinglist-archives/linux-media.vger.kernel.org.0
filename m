Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA0A34151C
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 06:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbhCSFyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 01:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbhCSFxv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 01:53:51 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FBCC06175F
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:53:51 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ha17so4123888pjb.2
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M8yI9pONKYY0sMtxSPqYhJCaoBpRMHpHxuKzPkbcKnw=;
        b=a/Q+9zFOi/z88f5a29IjqDzLSR/ARlMu9Daw7AVTBSPe2vtRyniWR0+tbU1cc6Npnp
         1YOrqlNzlf3ruak326Hvc3ywll+VpvFmMpqrxQ+/yCfMXaEirsJ9D8Ko2qBotoJFtIX2
         sbyrDTRApMht6MyaMza4ebQVAtBaLfWoC3fp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M8yI9pONKYY0sMtxSPqYhJCaoBpRMHpHxuKzPkbcKnw=;
        b=oN3FwEZQ8IkP05c+P0kef6P8OVQzd8MkzKH2YwlOflwz5M7AKtqPHhRwUoFbiTCGDW
         j2QuLg+KlJMf3VkpjpAlmKYdZlFTlSrHvD/o3mN2GDSCGdcmMOitIw7r5kIYbvBtjNFl
         1k9gkZDU1QcTXlpxExT3wlR0FbXQqj/6s5StVBZKmfcMOOQ5KeklR3kiKTgiSttG7Owp
         qsuKKjypQCy/6B3Mm2azCDFz5c0qX8E+HnAGXjs7yJdSbo8TX6pBOF7Fewf8YIo4KjWV
         lrDcGkoYIrwUaZNJ+sxZCbQJn9nR7W5qX9tcxfrjKyiPV/O2yoAU6SDFGak0kMDHC3g6
         RzdQ==
X-Gm-Message-State: AOAM533VafZ4rj0dMNGixgBhBi19DuR6FMmBac2yIsLxjUd7N40mG/pH
        2nJxM/a3O5Bw40pkXFjV2yqjeA==
X-Google-Smtp-Source: ABdhPJxLbOpxIyVOyEuInGFY94ZDdn7+DAxWKQOvTw3ngM5mq7Jp8WsvaEaU1LEU5QGO/xyViA5FSQ==
X-Received: by 2002:a17:90b:1987:: with SMTP id mv7mr7819501pjb.152.1616133231281;
        Thu, 18 Mar 2021 22:53:51 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:6577:f83d:5865:dfac])
        by smtp.gmail.com with ESMTPSA id o13sm4043704pgv.40.2021.03.18.22.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 22:53:50 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 1/6] media: v4l UAPI: add ROI selection targets
Date:   Fri, 19 Mar 2021 14:53:37 +0900
Message-Id: <20210319055342.127308-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319055342.127308-1-senozhatsky@chromium.org>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UVC 1.5 requires Region Of Interest control to implement
GET_CUR, GET_DEF, GET_MIN and GET_MAX requests. This patch
adds new V4L2 selection API targets that will implement
those ROI requests.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/uapi/linux/v4l2-common.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/linux/v4l2-common.h b/include/uapi/linux/v4l2-common.h
index 7d21c1634b4d..3651ebb8cb23 100644
--- a/include/uapi/linux/v4l2-common.h
+++ b/include/uapi/linux/v4l2-common.h
@@ -78,6 +78,14 @@
 #define V4L2_SEL_TGT_COMPOSE_BOUNDS	0x0102
 /* Current composing area plus all padding pixels */
 #define V4L2_SEL_TGT_COMPOSE_PADDED	0x0103
+/* Current Region of Interest area */
+#define V4L2_SEL_TGT_ROI		0x0200
+/* Default Region of Interest area */
+#define V4L2_SEL_TGT_ROI_DEFAULT	0x0201
+/* Region of Interest minimum values */
+#define V4L2_SEL_TGT_ROI_BOUNDS_MIN	0x0202
+/* Region of Interest maximum values */
+#define V4L2_SEL_TGT_ROI_BOUNDS_MAX	0x0203
 
 /* Selection flags */
 #define V4L2_SEL_FLAG_GE		(1 << 0)
-- 
2.31.0.rc2.261.g7f71774620-goog


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E32354CD2B
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355504AbiFOPi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355270AbiFOPiw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:38:52 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC021F61A
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:38:51 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id g15so7612802qke.4
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5qqjNJMyLII6v/DbBvYKbCoz/lhIdYVDoJuH/p3v6Vk=;
        b=PYsLDhLzK0k2YdfWjBT3rlax7S1dx0lqisT8W1qoNhuhH4I5atoSlwl0ubrwwed/Z+
         GmsGCfQHt2OJ1O+InJRogDQ54mAqxWl606SeolG8hy4zFHVRKvYeJZ8cOyJgazJNLYSI
         byHb2NjBYBQaNKe64Sr6TKwg/bezOq7AT17YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5qqjNJMyLII6v/DbBvYKbCoz/lhIdYVDoJuH/p3v6Vk=;
        b=e1sraEcx+XBoFprA3BO+g1HiYRYCgUIeFKxLE1WzJaY6szROx6DpZhNSNDMoBXfWd+
         hXS3Yb0vTsGBleA6Pkg871+ZHAJn2Tw1ETZR6j2pxRjRBGrRS9j4Ant0R24nNK5DJ0yF
         HhJh+riWnZKWxmZsuftddHZEFsrYklgdAzsoqLEZOAV3+/tMHKRPTjAvyTDebWYLmgId
         zlBrntWnepR5m/WWiNzb2bBCHM/XMWk78Pq8gPTMw1mQg4lKAyZUIxd/2Wa3m8VyUnOO
         yqksa3qME5Zc+CU6qpUxRgNmENcJuhZF+Xm/VDJPeV4qqzJR109dfSPjpIkANTBv8AKD
         CK8A==
X-Gm-Message-State: AJIora+rpZdYRSvYC3z3NF/2jgW6niVClE76UmFQ09rSnp9oHC34dzwx
        Kkmm3HSkg6A9VQT8sNitkCMRUE03mxSGmw==
X-Google-Smtp-Source: AGRyM1v1E4FiIFv7YWQ2TVsdhPSgF3o2zM4tWV3FPiM/vqBJUzxBB5+ZdnNaxNzK10SdF1ncMlXaqA==
X-Received: by 2002:a05:620a:12a7:b0:6a6:b847:f62b with SMTP id x7-20020a05620a12a700b006a6b847f62bmr191033qki.345.1655307530961;
        Wed, 15 Jun 2022 08:38:50 -0700 (PDT)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:f812:8546:48c3:148])
        by smtp.gmail.com with ESMTPSA id u12-20020a05622a010c00b00304e47b9602sm10221201qtw.9.2022.06.15.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 08:38:50 -0700 (PDT)
From:   Justin Green <greenjustin@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com,
        nicolas.dufresne@collabora.com, andrescj@chromium.org,
        yunfei.dong@mediatek.com, Justin Green <greenjustin@chromium.org>
Subject: [PATCH] mediatek: vcodec: return EINVAL if plane is too small
Date:   Wed, 15 Jun 2022 11:38:27 -0400
Message-Id: <20220615153827.4137366-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Modify vb2ops_vdec_buf_prepare to return EINVAL if the size of the plane
is less than the size of the image. Currently we just log an error and
return 0 anyway, which may cause a buffer overrun bug.

Signed-off-by: Justin Green <greenjustin@chromium.org>
Suggested-by: Andres Calderon Jaramillo <andrescj@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 52e5d36aa912..191e13344c53 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -735,6 +735,7 @@ int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 			mtk_v4l2_err("data will not fit into plane %d (%lu < %d)",
 				i, vb2_plane_size(vb, i),
 				q_data->sizeimage[i]);
+			return -EINVAL;
 		}
 		if (!V4L2_TYPE_IS_OUTPUT(vb->type))
 			vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
-- 
2.36.1.476.g0c4daa206d-goog


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF4F33725D
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbhCKMVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbhCKMUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:20:49 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D06CC061761
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:48 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id mj10so45783017ejb.5
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cE8xpTSbvUqI5nMjBJ0pvMuuGdMpnM78Fy8IxgS4l98=;
        b=Huv9Y19kXhagaersIpHNejGQQOhYKU8EPfaSKkSGnmJK6OH368SVORPAMZexJMni3F
         uOK8bttwwrQoLzikNExxy8mj/XgIll7RzNrNOiREIOrSnHXont3I5d59WV/IoPkxLuF2
         jNB6REsBgQmOPLPbJ4fFkhKju9q77gYmdyd68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cE8xpTSbvUqI5nMjBJ0pvMuuGdMpnM78Fy8IxgS4l98=;
        b=Q2BO+zCXDGRPjxwuxINmbPzdAAlm67R5QzmU2mX4iNpunpa05X6AzDFsAyowGJMTD6
         FX7rTlXTwq2x/4+lcek+qFbKbC6PVOojHVQoDQTfsiDqwflX6sH70mFw0ujEeKwAwcoD
         vkfQH2kmAtSBeGXnKWUppEHr5bJTpAqUDjh+uKPK+N3Umk5cbfzanx8LWAOfTJDT0tS6
         1hKkWzNIDAzQ+oSxsJgd048XtTiarXshc49oW1g8/Yxs85RDUNFnx2qePR4aEyEfK8nG
         9/TiCrcrzLoRKQT1IFjuoxgxZ+4GUBl8zRFiGC6pUVXsNxOM5Qvzj7EbfMGZT1DEMuAM
         fS9w==
X-Gm-Message-State: AOAM531eu2MQx5hnZTedK6fNPUfi0JKsB8eD1MKn5spnR1CsGdLSu1cQ
        wdYNHSR5BolNJbf+hSd/4vPPxg==
X-Google-Smtp-Source: ABdhPJyW0ijjsV3LshE2bLYCySkQerKGhiL8c9J/ooYtPjSHfFvct+Mi6sk46GtfADhuEaY6vcJs8Q==
X-Received: by 2002:a17:907:10c1:: with SMTP id rv1mr2917878ejb.5.1615465247379;
        Thu, 11 Mar 2021 04:20:47 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id u13sm1264126ejy.31.2021.03.11.04.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:20:46 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 07/10] media: uvcvideo: set error_idx to count on EACCESS
Date:   Thu, 11 Mar 2021 13:20:37 +0100
Message-Id: <20210311122040.1264410-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311122040.1264410-1-ribalda@chromium.org>
References: <20210311122040.1264410-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the doc:
The, in hindsight quite poor, solution for that is to set error_idx to
count if the validation failed.

Fixes v4l2-compliance:
Control ioctls (Input 0):
                fail: v4l2-test-controls.cpp(645): invalid error index write only control
        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 625c216c46b5..9b6454bb2f28 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1076,7 +1076,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 		ret = uvc_ctrl_get(chain, ctrl);
 		if (ret < 0) {
 			uvc_ctrl_rollback(handle);
-			ctrls->error_idx = i;
+			ctrls->error_idx = (ret == -EACCES) ?
+						ctrls->count : i;
 			return ret;
 		}
 	}
-- 
2.31.0.rc2.261.g7f71774620-goog


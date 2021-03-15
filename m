Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E0333C461
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbhCORgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbhCORgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:36:15 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDD8C06174A
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:14 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id jt13so67735674ejb.0
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7BfbRkZgKvyDVm8Db9Jrgj8gcrrUGA9hBYKQf9MVsw=;
        b=HB2rH7KYWc4GsuOr6kxXutXDTsRCb/BilDokuuyTS0h47VLCATbclVjABf9VT6oNKA
         /IMwjyy9GZnNSDmAUbClt8nlqOsFWb4GBMMUaWrkguNxPAQp+cYFlleeG6LtFGZ+mt/f
         La7BotmmMZHnKuIeToQ4JX4G2ywj72eDtY8lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7BfbRkZgKvyDVm8Db9Jrgj8gcrrUGA9hBYKQf9MVsw=;
        b=nG8x2GpZeLosSRvMNmYIeHUFeQfj3VEYhV20bx6/9hOvqcayVjkoLZA2HuBL4V/1PI
         lHbz01mU37sqL9dwCxwm/49tMK1Xgc1pIhSG7jgjemLBNZkmstiCXle+bBxH4YR5Y6ri
         enMJlKPnBR50wjVguVhwHa5/pq00Zz9X6rZH7m8J5JhNBojQYBF4HT/icEQIgXr15UTj
         PacU/OKTmK365wSE4XqCnWaW9IeoBoVNIqtv72WZWxHRste++MNCq/bXtLYAzcSXp9o3
         ltljlTLtZFacAXXOG20aP+ortVOL58GFrwpdQ5rbfITOJ8gL0GqqPoVWhZrqPPHsi0rg
         W24Q==
X-Gm-Message-State: AOAM532JZrwC8Pkk08dFNM5WHJqfq1+W9yiH+cF/cwfC9X/ibPlaGEjw
        yXnTjNheCA83qsFDsmtk13h7jw==
X-Google-Smtp-Source: ABdhPJz9g6fwYgfu9k2NR5In4ZZK+GOkevCNtJHaZ8g3QNTC4j0sgqKTNSTFilAMmPPq1rFZqLhfvQ==
X-Received: by 2002:a17:906:1dc2:: with SMTP id v2mr25191961ejh.350.1615829773512;
        Mon, 15 Mar 2021 10:36:13 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a3sm8109239ejv.40.2021.03.15.10.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:36:13 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 03/11] media: uvcvideo: Return -EIO for control errors
Date:   Mon, 15 Mar 2021 18:36:01 +0100
Message-Id: <20210315173609.1547857-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210315173609.1547857-1-ribalda@chromium.org>
References: <20210315173609.1547857-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The device is doing something unspected with the control. Either because
the protocol is not properly implemented or there has been a HW error.

Fixes v4l2-compliance:

Control ioctls (Input 0):
                fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
        test VIDIOC_G/S_CTRL: FAIL
                fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f2f565281e63..25fd8aa23529 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -112,6 +112,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	case 5: /* Invalid unit */
 	case 6: /* Invalid control */
 	case 7: /* Invalid Request */
+		/*
+		 * The firmware has not properly implemented
+		 * the control or there has been a HW error.
+		 */
+		return -EIO;
 	case 8: /* Invalid value within range */
 		return -EINVAL;
 	default: /* reserved or unknown */
-- 
2.31.0.rc2.261.g7f71774620-goog


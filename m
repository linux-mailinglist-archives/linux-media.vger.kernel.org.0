Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F22338020
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 23:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhCKWT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 17:19:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhCKWT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 17:19:57 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16638C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 14:19:57 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id lr13so49516589ejb.8
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 14:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9MAhQGcdWHGej8nvNouxnVkw1hFpTssfKidukRMSibE=;
        b=oda80GXNQDxBorQrdX7puxCFtDzT+2HbYVzvq/Rln5noc56PiiN85bZ2vdOBp2rVOu
         KnkV4ii0dS5kMzUSzgAv0albtlu7MC2EwwI5n8shkCumQy2WQlFbaprRzosNr+XFeP66
         PD1nDdsONibLTXEN9VXlCs+D33BYF4rM9O1lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9MAhQGcdWHGej8nvNouxnVkw1hFpTssfKidukRMSibE=;
        b=lXK0gRo1C1JrotfzlhvBezm9wZK17r3lWHESq/j0wn6L0e2IkWGDTsArAcj0QfAX59
         3AXcUyJLy0ccWXuEZkE1GUNCwsetOv8NjyH/AuOjQ5CoW56cdxA1oCUoEI5lI48s7d/K
         kf/D5+/AB4paQ1yoYwWt0JL9VaT63DjnJUUXNjVySRyvICBIyZOT2XTS3foimBlwU5Je
         oCXKrzUi0TEszMR0zpDtLtqFbD7tEo6m/fAWyZjPqpV/XUjbF7PCiWXuyVrKJVph9AzO
         aT/9KVdOLJ/Ms2qTux/6djrZpvY/NNkuan4vJ0ay23MuIqckwGu1JXH/E6YWjbAa7Erg
         UZqw==
X-Gm-Message-State: AOAM530Qyb6YJFgcKMfGL82G9a/w+ZwFWer4LpWnPkcbhj82T+BN/snp
        SHbduEz+VJ6wDxQCz42s4+gaLw==
X-Google-Smtp-Source: ABdhPJzAg/r21Oua221yFsmPRiRa9eRsaUiCuQRlIHfqjZQkF2fHas4zcRZjM7Q0skFvgZe3WuuF1A==
X-Received: by 2002:a17:906:c1ca:: with SMTP id bw10mr5324161ejb.510.1615501195833;
        Thu, 11 Mar 2021 14:19:55 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b18sm1942174ejb.77.2021.03.11.14.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 14:19:55 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 3/6] media: uvcvideo: Return -EIO for control errors
Date:   Thu, 11 Mar 2021 23:19:43 +0100
Message-Id: <20210311221946.1319924-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311221946.1319924-1-ribalda@chromium.org>
References: <20210311221946.1319924-1-ribalda@chromium.org>
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


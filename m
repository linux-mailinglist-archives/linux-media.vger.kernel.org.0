Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5903233F5DE
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 17:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbhCQQpg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 12:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbhCQQpU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 12:45:20 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6F8C061760
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:20 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bm21so3700157ejb.4
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7BfbRkZgKvyDVm8Db9Jrgj8gcrrUGA9hBYKQf9MVsw=;
        b=AX65wNOoec086wfSe4poCGNVBOMmtrxUvp4lnsBJtWvPfIBdxMs8nmdWM8TZFMTJ+Y
         xEFco9JGe4jam6eQIdqCKyorT/8kOjyjvD0lyes7Jo23y10W6jF4N70bxCKNLY1WE0Mr
         j7taWweCbRqpmBUzjY7kIa8kMLZL90d8APBCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7BfbRkZgKvyDVm8Db9Jrgj8gcrrUGA9hBYKQf9MVsw=;
        b=RsHaZKpFk3mgIYJkGIldO9fNGRQ8EX3nCoUSDEzQr4uf9bbeYU7Ug5Bkb1Wd3+9p8M
         j/nHeAvNr6v+IxDoMtrPNQGVIwlGBK3As1XsqzBcv1x2RojjRbvTX9CCLsifQ4OP/Ll0
         sOJII3++SAZLVoltHkrfLndhPkhEdIyMUM0LJirRcUS78fBs09ZcPjlEixnO7oBFVcmd
         /+aO6tN6ahbTNz3aLBwoJhkzkBtyHDGiaCTyMR85fjI7XN9jNVV40itNh4MVBfiGx+UT
         0T8mQFXgLIPIBi7gEnfq9KQOssj/exqv6UBOXKAL+edIXCCGx1bAFpfaD4pfGR+gkkjk
         FL7w==
X-Gm-Message-State: AOAM531S9IgzS4IMuCc8sptmFea4ZSWXF93DDdYd2N3tpFA6usaM4jVX
        Fo9+gIw6gQ9CY+2Gfg9MVAq5yg==
X-Google-Smtp-Source: ABdhPJxesE2LHKVrupx9CIvpViyNOdb0zgvX8mHwILjtMovcaKqgx3KxlomYYP4sLsLddb/F1CFe9Q==
X-Received: by 2002:a17:906:75a:: with SMTP id z26mr36257622ejb.22.1615999518922;
        Wed, 17 Mar 2021 09:45:18 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hy25sm12088128ejc.119.2021.03.17.09.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:45:18 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 08/17] media: uvcvideo: Return -EIO for control errors
Date:   Wed, 17 Mar 2021 17:45:02 +0100
Message-Id: <20210317164511.39967-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210317164511.39967-1-ribalda@chromium.org>
References: <20210317164511.39967-1-ribalda@chromium.org>
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


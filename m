Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295C74059F4
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 17:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240984AbhIIPCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 11:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239522AbhIIPCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 11:02:11 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CD7C06178C
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 08:00:54 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id dc3so4188189ejb.10
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kOEKM8apY23QO5WjPDqYiCPgXqusPQ0AQaPDWhCWqiw=;
        b=as6MCx/BHR+GaFFl9RE98WlTodY7u6iUbmNsJXbFqCar0yqK3yX0sQYGaRaQ84HzTh
         kG64T1hcv1ntPFF0PyKft/hkB3XSTzPhp+sPh3ecyjp027RsWWn0Yg8nJe1++odzZPXo
         z1SLarngeJi61KYtrEYKoXI/ccPmeCJ2imrNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kOEKM8apY23QO5WjPDqYiCPgXqusPQ0AQaPDWhCWqiw=;
        b=O7AklvS9U/fHW4B7E9eaHSWsivDImaaw+gF4WuakZi+jkn9QNmZ1MO7VmReOmaKquu
         MUH2cyaEUrZKpx4khFhsxMVaUYVEovpTX/OJVDpUvBuLm+6MOgndo9WFohZQf29QB8+w
         NAYmyJ63T0/woXnzBAziGrs5RnMz+JJ2SXqfLV+raGwSEOk3AJO/+qiLcddreU2qNiIs
         SMSeBdrIxCUkQc+ghVwAp7gvBUnRfKSlVVO+3tT0YZTrnVPDmgO6mldaUz8tiwSGZUJG
         CtNmiDk/My7WD/7w7jDBZd1q4zLVLLPcMPVVTs5SqitNrYYqHYG5J6bIaOm7kZ65ZQDy
         u/Hg==
X-Gm-Message-State: AOAM532vezBsTifP0FaPu0z0nyllWUw/RvRCMu9xYykDMcBGUnQaLCgt
        P8Gg1R4dXFMyoAsWZ+brTkKEAg==
X-Google-Smtp-Source: ABdhPJyEOipWECkGOxAB2/lIs59cDsRsl+cpDxrGrDLWlf00K0Zfhhr4Fh492s4VAKIMU2CgY1JJ7w==
X-Received: by 2002:a17:906:b1d5:: with SMTP id bv21mr3931294ejb.346.1631199652378;
        Thu, 09 Sep 2021 08:00:52 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h8sm1139644ejj.22.2021.09.09.08.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:00:51 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 4/4] media: uvcvideo: Do not return positive errors in uvc_query_ctrl()
Date:   Thu,  9 Sep 2021 17:00:46 +0200
Message-Id: <20210909150046.57615-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909150046.57615-1-ribalda@chromium.org>
References: <20210909150046.57615-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the returned size of the query does not match the expected size or it
is zero, return -EPIPE instead of 0 or a positive value.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 8423941cfc95..01b99da5e191 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -83,7 +83,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 		dev_err(&dev->udev->dev,
 			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
 			uvc_query_name(query), cs, unit, ret, size);
-		return ret;
+		return ret < 0 ? ret : -EPIPE;
 	}
 
 	/* reuse data[0] to request the error code. */
-- 
2.33.0.153.gba50c8fa24-goog


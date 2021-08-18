Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF243F061E
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239842AbhHROPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239900AbhHROOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:14:46 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BB2C061148
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:13:18 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso8999126pjb.2
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GGhTinRMD5FJR5wiodAv4hSIwCbxAKQqtwlMpzVtKqQ=;
        b=Lfqtb6IN6Ib19r/iUcf2SQg9N1/g2TAfC3nlRZhvrWt6RcwGa2BKOItn86A+eyYPCq
         2itKSJf6IeYnIYTLxTGVKR76AhL6GvGJwO/cvjPCiKK8Ad4Z6kWYdQyilzWAraVzVjWg
         yhNXKWvNssWewoGwa0ZhH1FgSzI8qA/ppaQLnrg4HLW1oVM+7FrU5I6N+mG2Veam20xx
         YH17pMajTzjuCk0ZdYjs99mZdO3/zT0t0H9UXbJja+ddIkILDiOs3l1q23CG+rsDZtJB
         gDnu0NbPCU3Q4VR8j+b/acz6vtgOZanDzlUjbD0MtBRqg9l8SODEKVcnHSNwjCTRgNjj
         LBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=GGhTinRMD5FJR5wiodAv4hSIwCbxAKQqtwlMpzVtKqQ=;
        b=AFzV4uJUMp/Re9cwV5XSxtWKCNdWgl2XWLwRBdN712/kOFVHk73tUIE9wqstndewz/
         FEvB3gfbHuH/caxe9GhSpPhYJHIzVSkEL0Hd/XcqRmm07rBBH8dklNvuBle9B9xmjQ0U
         0S8QRdz9ZMb6lOsOe7DGN1cXkfe/zw12D5DZavVmtYFlUcaWygBwM+VFQ8odRgjBR4xD
         5EYNIJHIshLxXPoKC/yHMlJ33IFPuAsq6hnQA9BvJqqlge9tyvzVBqDaQ57qXKU/S8P6
         rxP+KMGgKCSfDml9GEgcScmEcJWsIehKgCj3oFcBl2IyiKsCyIV/1uZMOP64YTf6dbz9
         UOSw==
MIME-Version: 1.0
X-Gm-Message-State: AOAM5318FwLQc1/gnyFD5W+CgDeD3vuw6azPn55eTts8Gp/bv8prqqzm
        AfyUV7ykinY7wISi3fsph2vLRSTtHZQftmA5jbVNFdc7VMKE/6hRYcWEccZ5J62TBiaCMc9odfP
        tEFf/isHtg7YlVvMu
X-Google-Smtp-Source: ABdhPJwqxRn4tzJwMf/gwXRuUcFPVz9IqUj4POIrXL3XViJfKIlZ5A87nhkIi+5p8XG3RuHPEMNLbw==
X-Received: by 2002:a17:902:8f90:b029:12d:1b48:efd8 with SMTP id z16-20020a1709028f90b029012d1b48efd8mr7664129plo.23.1629295997638;
        Wed, 18 Aug 2021 07:13:17 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:13:16 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 25/30] v4l: videodev2: Add 10bit definitions for NV12 and NV16 color formats
Date:   Wed, 18 Aug 2021 19:40:32 +0530
Message-Id: <20210818141037.19990-26-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

The default color formats support only 8bit color depth. This patch
adds 10bit definitions for NV12 and NV16.

Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 05d5db3d85e5..445458c15168 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1367,6 +1367,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
+	case V4L2_PIX_FMT_TI1210:       descr = "10-bit YUV 4:2:0 (NV12)"; break;
+	case V4L2_PIX_FMT_TI1610:       descr = "10-bit YUV 4:2:2 (NV16)"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9260791b8438..a71ffd686050 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -737,6 +737,8 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
 #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
+#define V4L2_PIX_FMT_TI1210   v4l2_fourcc('T', 'I', '1', '2') /* TI NV12 10-bit, two bytes per channel */
+#define V4L2_PIX_FMT_TI1610   v4l2_fourcc('T', 'I', '1', '6') /* TI NV16 10-bit, two bytes per channel */
 
 /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.

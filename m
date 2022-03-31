Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F8F4ED62B
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 10:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233262AbiCaIvH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 04:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233242AbiCaIvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 04:51:03 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75395344C5
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 01:49:14 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id j8so12595014pll.11
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W056jK4JO9Wem+3qlNSvwaayL2PwMR77g5EtZS2gUYw=;
        b=WmCBHXFFuScgmmMGMP/VH609AxnAySmVJWaJZ62cOndAUFjHiwuhvCMbqdzYxL0PqJ
         O8RwQn+EO5U1GQpLfh2uEeY3psnAoZeQKIzE53AC53docGkPbTd37tJD5jjYxV5T0jcV
         17l9p2c+I1LPqJo4fyJQjnK3ZbZE0HKbzk748=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W056jK4JO9Wem+3qlNSvwaayL2PwMR77g5EtZS2gUYw=;
        b=zecQVzPeie/nzaGdAP9V+LJk5jcpkamUy0Y/JiO0QFBRZc/BqH7VXHjzrEC03n5Bb0
         IocWLcy7cA3KzkOUwK+wc0yi8kDXLSw79i3NH9+U1HObKYPyn34J54JwNnqAuNYzBCXb
         cEBn5hydH4xkojOui5l6tbkSEIDjE7WpbzwMjK+HzUdVowk537ta3l6xXPyX4uspjrkT
         gXZLA3sPkM21DDNFYhslYlZbyeuYrlw6uqPQSHziFu/vLc3t8ys8fgFPe1sEl0DC6wCy
         B4CQWME1bGKqzLb4aq/Pgi7I8kEoAWPyV61Crs09hM7pOtDAhgo50mjOhyuNFd82ks6w
         MZ1Q==
X-Gm-Message-State: AOAM532E3memJyqGPuE4uoiXrMJbVNP19R3cx6urqAJdMKIe8wQKIgDu
        GOXeL6LNh+d6ftxxfnh6g85l/A==
X-Google-Smtp-Source: ABdhPJyIyUj9Alp436tInM7YNihHEEDUYPNgqt+AGVoPl3O5jctUXjLSQUMXrAN+OoCit0uHawL0gQ==
X-Received: by 2002:a17:902:ea03:b0:154:4af3:bb5e with SMTP id s3-20020a170902ea0300b001544af3bb5emr4124775plg.95.1648716553888;
        Thu, 31 Mar 2022 01:49:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:deb3:b2d3:c33d:e877])
        by smtp.gmail.com with ESMTPSA id mw10-20020a17090b4d0a00b001c7cc82daabsm10408026pjb.1.2022.03.31.01.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 01:49:13 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] media: hantro: Empty encoder capture buffers by default
Date:   Thu, 31 Mar 2022 16:49:06 +0800
Message-Id: <20220331084907.628349-1-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The payload size for encoder capture buffers is set by the driver upon
finishing encoding each frame, based on the encoded length returned from
hardware, and whatever header and padding length used. Setting a
non-zero default serves no real purpose, and also causes issues if the
capture buffer is returned to userspace unused, confusing the
application.

Instead, always set the payload size to 0 for encoder capture buffers
when preparing them.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Fixes: 082aaecff35f ("media: hantro: Fix .buf_prepare")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

This was previously incorrectly squashed into my Hantro encoder cmd
patch [1].

[1] https://lore.kernel.org/linux-media/20220301042225.1540019-1-wenst@chromium.org/

 drivers/staging/media/hantro/hantro_v4l2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 67148ba346f5..261beb0c40f6 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -733,8 +733,12 @@ static int hantro_buf_prepare(struct vb2_buffer *vb)
 	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
 	 * it to buffer length).
 	 */
-	if (V4L2_TYPE_IS_CAPTURE(vq->type))
-		vb2_set_plane_payload(vb, 0, pix_fmt->plane_fmt[0].sizeimage);
+	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
+		if (ctx->is_encoder)
+			vb2_set_plane_payload(vb, 0, 0);
+		else
+			vb2_set_plane_payload(vb, 0, pix_fmt->plane_fmt[0].sizeimage);
+	}
 
 	return 0;
 }
-- 
2.35.1.1021.g381101b075-goog


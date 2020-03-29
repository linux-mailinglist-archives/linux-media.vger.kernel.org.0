Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC1719706C
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 22:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbgC2U7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 16:59:41 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46379 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728877AbgC2U7k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 16:59:40 -0400
Received: by mail-pl1-f193.google.com with SMTP id s23so5870797plq.13
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 13:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5sJD5xIjNlxz/g0J87s1sg6I98WfwUaCUZi8fa8tcFs=;
        b=sB/yOpeRPcy6vg7NIuQ+qKvH3JSJOmJuvcEhPgk2kQucVyh1UW8dzRK3FxNHHs77dn
         /YKGkjfRiOXpECX9gY2ps3/GI02Bd5MI3HHsa1hxNSipqEy3TADjc3xoW1UlveXp9PKe
         fPHfxMG1JQsuwgfus0XswewILrp+w8jQFhCQxeQjXNY79qrXBnq7uYufbytpJduE16BK
         l2I8XjAAUvf5aprSqq5vDJJhTMDZNTwnJyBTNjmJfz3pOp7Rebsd39L1g2wdi4G2HRBi
         jVNhh61xiKVFUxLGBgcH1XoPTGwjaONNNkCLlV+RLluuRoJUml8BHk0xiuxsx6MdjVFN
         Mziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5sJD5xIjNlxz/g0J87s1sg6I98WfwUaCUZi8fa8tcFs=;
        b=UWUUQ9k75M65ytZBPUft7mVysDC1K5hzYaobUxkzG6se88Ir8YUi5tDcwnDxPe3n9x
         Tmbs7sWI0MO/CJBsAxoXQYwVgYfbcjcQ2UwTr8n9WVoqSTOXIJ1m7OfPCEdL0t8gCTaU
         7TQMqTk7wfP5NmiUmYhcUNZkThV0ZHbo9ShQQZCCUo4YKYBxqm3MnEhJApJmVJhaEg/w
         UaqDzZvnU9cmfVj76wVlxVB6lD9jbW5uTIBYzCSiHWhApvs4lQvtrdBZO82WEF4LPCNa
         i3KfJyVNGy+/sJNhaJtEtpkumHxTl25HrChLvDMAOmc1BOSrSIXZxhEpSAhTBN7QMzUD
         sK7w==
X-Gm-Message-State: ANhLgQ2zjOlo6Qf5adyyFqO2UNBI+KZP0Bz/TsSWRCwiBkpPYwLiPIpU
        1Zm+IhQ3/b6iwfVbhazK1/h1oETI2d0=
X-Google-Smtp-Source: ADFU+vt/1HZeykf4BNm3djkoyBApfWyBm92c2rbxKRCJuSxCyuHK2/Tv8QmumiBp8zeevFdbxSSW6Q==
X-Received: by 2002:a17:90a:25c8:: with SMTP id k66mr12228220pje.90.1585515579226;
        Sun, 29 Mar 2020 13:59:39 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id 15sm8606049pfu.186.2020.03.29.13.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 13:59:38 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 10/11] media: imx: utils: Constify ipu_image argument to imx_media_ipu_image_to_mbus_fmt()
Date:   Sun, 29 Mar 2020 13:59:19 -0700
Message-Id: <20200329205920.20118-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329205920.20118-1-slongerbeam@gmail.com>
References: <20200329205920.20118-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx_media_ipu_image_to_mbus_fmt() function doesn't need to modify its
ipu_image argument. Make it const.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 drivers/staging/media/imx/imx-media.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index b30045221841..1b0cadb601cd 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -571,7 +571,7 @@ int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_ipu_image);
 
 int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
-				    struct ipu_image *image)
+				    const struct ipu_image *image)
 {
 	const struct imx_media_pixfmt *fmt;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f4b0fe508553..a8985966568a 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -183,7 +183,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
 				    const struct v4l2_mbus_framefmt *mbus);
 int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
-				    struct ipu_image *image);
+				    const struct ipu_image *image);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
 				 u32 grp_id, int ipu_id);
 struct v4l2_subdev *
-- 
2.17.1


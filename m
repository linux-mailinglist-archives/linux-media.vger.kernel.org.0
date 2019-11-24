Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93DED108495
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfKXTHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:20 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41856 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbfKXTHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:20 -0500
Received: by mail-pg1-f196.google.com with SMTP id 207so5927835pge.8
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0YKGrpYeoAEn9gUSXzC9FX/K5C81TuWUa0ZyQnxQgg4=;
        b=rFeu0exdwpuiru+s1mrJspFxEw8QnuQUMtxviibGWDpyd5goH27IHvF5Mpn8MnbEA2
         PA0LB08spwQbmZuJocrlIz4lrsbMLcbSC5dZLRgHQ1UFXeR3DPwlVUzMm8Z82OrL8oGb
         EPWrZ/dKdrmrrSzZ9GZpKTiu3zKzWRZ/pyBqCWjGfEofp24SPCMtWj1+8yRX1FExkB6C
         FtFJpDLbi44ZyrtKg3/5P7xAjvyoYKC1W+ThxBNg4Jsv+Y2Rmcsd5SB7b6+hxe8FQKue
         koSqjJOK+sUkDSE0Xt71mIDBaqLxJZiuQ+hccFJsPWcRLi3t308EltNrzm34O+1K3Uvy
         CUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0YKGrpYeoAEn9gUSXzC9FX/K5C81TuWUa0ZyQnxQgg4=;
        b=hL2VhwnYgvlCto+sT97HXsG63+geoFMkGZhLhsOAwqyBOPkaib1/x8e5BmipBA4wrV
         d02oMaCjeG9BCgIHAUkofRtYOi8SRtl/fM16gXe5JvCwD4G4gXyLfYImErNkPHvB3in+
         5iPLcb7pC2pcCoMtOhYJcROklFebeQAC9ub9np710QrXpTkKfSj9XKJD3YHm+l46dlkO
         cGdUFih9d3iYXCM43vShoyhtHlR2bz+6DQLnjb2h4K3NgY7Ou4vLKdMqbbibAvtKqT9r
         2vZEDeeZ2W2Rm/UBqnj25CDf7/QoyrYJaxmSHVFOWVuywCS8vZmtN5W1tLO4jRUcl+pK
         1d7Q==
X-Gm-Message-State: APjAAAVgh0iqb2tPyhFMbOcOAPVtaPibXVt3HGJMdeKH0wpKCUZS7+tM
        nqA3eENjy7PV1qu7ITg2K/pZbXqhgbc=
X-Google-Smtp-Source: APXvYqxWn8OjPS3zykCnZKKUfg3P+4aBtSEkxUXY24A1dpGY/vfHFoWEQQLbBLPjFKzHhbqk1xtbmQ==
X-Received: by 2002:a62:14d0:: with SMTP id 199mr30116729pfu.147.1574622439053;
        Sun, 24 Nov 2019 11:07:19 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:18 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 06/23] media: adv748x: csi2: Implement get_fwnode_pad
Date:   Sun, 24 Nov 2019 11:06:46 -0800
Message-Id: <20191124190703.12138-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the given endpoint fwnode passed to the .get_fwnode_pad() op is
the adv748x-csi2 TXA/TXB source endpoint, return the associated media
pad index ADV748X_CSI2_SOURCE. The adv748x-csi2 has no other media pads
that are associated with fwnode endpoints.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 2091cda50935..810085a1f2f0 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -228,6 +228,24 @@ static const struct v4l2_subdev_ops adv748x_csi2_ops = {
 	.pad = &adv748x_csi2_pad_ops,
 };
 
+/* -----------------------------------------------------------------------------
+ * media_entity_operations
+ */
+
+static int adv748x_csi2_get_fwnode_pad(struct media_entity *entity,
+				       struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
+
+	return endpoint->local_fwnode == tx->sd.fwnode ?
+		ADV748X_CSI2_SOURCE : -ENXIO;
+}
+
+static const struct media_entity_operations adv748x_csi2_entity_ops = {
+	.get_fwnode_pad = adv748x_csi2_get_fwnode_pad,
+};
+
 /* -----------------------------------------------------------------------------
  * Subdev module and controls
  */
@@ -295,6 +313,9 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 	/* Register internal ops for incremental subdev registration */
 	tx->sd.internal_ops = &adv748x_csi2_internal_ops;
 
+	/* Register media_entity ops */
+	tx->sd.entity.ops = &adv748x_csi2_entity_ops;
+
 	tx->pads[ADV748X_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
 	tx->pads[ADV748X_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
-- 
2.17.1


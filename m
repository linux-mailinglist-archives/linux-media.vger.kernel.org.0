Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 758CE57107
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 20:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfFZSwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 14:52:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43206 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfFZSwe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 14:52:34 -0400
Received: by mail-pl1-f195.google.com with SMTP id cl9so1909559plb.10;
        Wed, 26 Jun 2019 11:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=jFUQd1a4KGSPHNAxPDeMNjxKEsd1P+Yd6RvsJx/5uQc=;
        b=HOxVhJOTySx9Jybho1j8q1uMX5VGq6y0o6AXMcSjfoJ4/KBSXdAUO16s5x0IuDodcO
         grpU9pElitmixZ3CWDWnBW34hExdqbMGOIBmLULt8SxkdS7SHtwoeMrvIIsirzIJQL+M
         MVjzeShwpTCRnidbpUMiW37SwtuG3qMzyJTVzVBvdyLnMAzoox8jwmGyhUYkU0iLci5f
         f9bOC2N6QrgG+yce5wqxaj9+uFqgB5PgfkKSkWlgHFNuunEPchYWVrNOdNoiK+43MdJQ
         McYZFt03ftsZVRUmw9XVX2hQrWE+GZdrkeKSVoXr693OkHZAo/VQdoau2YyfuPBgtseg
         2fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jFUQd1a4KGSPHNAxPDeMNjxKEsd1P+Yd6RvsJx/5uQc=;
        b=PlO7+TvxBP39oLhTzQDGeyj5oV8PM3uERRlX8is2/lYHR0xCkaUyae7tmukVe+dtP8
         ra9EvU2cYhMA5Rt2piA9nzZNUL6FjkcolKLw2DS+yXu+xLrc3XqgJpSwVzHip6DhxzOb
         jFSchmPU+gEV/v94L9w1QILYXVYolx2IIQJw+bcuaxeLgQMIOSmF9RzaNyWFDfmqO4LF
         NSLAHM7J2HGQ2cqjkXDMf/z0Bce7Hs3vDeeLDkUAjGrc/nu+DJmsZeTw7E4pVNc865+M
         lxVvv61a+x3tto4eymCSTuN2RG0vkSMj1nZqKMvyaDqPLcXDBG4rgLgZ9i56TIn5gANC
         +X6w==
X-Gm-Message-State: APjAAAUXv7tUVoSH1B+drIxw8Mm9n/XeIA43yhx3owt8JcP4Dm36pShP
        L4P80ltwFDr8elTzLknBaBTFWXhg
X-Google-Smtp-Source: APXvYqx8xcuzPF+3Q1H4Ucd6o7WTHj8KA2X/LjdtxpnaqkwN20/DS8zjhdwPiDFcZDkNITcE2JX/jg==
X-Received: by 2002:a17:902:934a:: with SMTP id g10mr7349836plp.18.1561575153144;
        Wed, 26 Jun 2019 11:52:33 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id y16sm24891832pff.89.2019.06.26.11.52.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 11:52:32 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: staging/imx: Fix NULL deref in find_pipeline_entity()
Date:   Wed, 26 Jun 2019 11:52:25 -0700
Message-Id: <20190626185225.11992-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a cut&paste error in find_pipeline_entity(). The start entity must be
passed to media_entity_to_video_device() in find_pipeline_entity(), not
pad->entity. The pad is only put to use later, after determining the start
entity is not the entity being searched for.

Fixes: 3ef46bc97ca2 ("media: staging/imx: Improve pipeline searching")

Reported-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index b5b8a3b7730a..6fb88c22ee27 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -842,7 +842,7 @@ find_pipeline_entity(struct media_entity *start, u32 grp_id,
 		if (sd->grp_id & grp_id)
 			return &sd->entity;
 	} else if (buftype && is_media_entity_v4l2_video_device(start)) {
-		vfd = media_entity_to_video_device(pad->entity);
+		vfd = media_entity_to_video_device(start);
 		if (buftype == vfd->queue->type)
 			return &vfd->entity;
 	}
-- 
2.17.1


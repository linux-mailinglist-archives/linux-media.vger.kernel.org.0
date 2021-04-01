Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0493519A6
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbhDARzw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236616AbhDARt0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:49:26 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D53C00F7D9;
        Thu,  1 Apr 2021 08:07:44 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id z2so2168309wrl.5;
        Thu, 01 Apr 2021 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MbKLAGz4OO4bkaK2mn5gJbhDW+pmNyk19HFcUZTJdJg=;
        b=GRr7eS+aFYlubvf1mPOYcVQQgMHnfQ0NegZX00k4kHoMYsIKZ4BVrmlZlAzofy5DWv
         R95KUIOcwiQhJZXStFdhS6EGKVRwm0AYzLWs8C89sMpKtNfHNgts2zl68Mq3jekWTY21
         3eORmfMoCBoLlha/R4Hcec0dxt6jUWvkHMFiKgMM5i/TJcGZP73R1SrM6m9Cu9Ahfgj4
         J/qgd94AonllohzFWegDtH3E4+6geuEY7eZgVNSwvUsvdrwXTMUB9ZqcMMAbLYxGinnG
         tVof+nifxAlS28roJ6tKUY1BQi+5nhjDaLWeqtpmo6oNgYTsV6WsRsRibSXCxOINXm6Y
         Jl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbKLAGz4OO4bkaK2mn5gJbhDW+pmNyk19HFcUZTJdJg=;
        b=NuRiNjLFyCqaG5Tj0kT/S+v1YtVLDa606YvhGZkVRpa/EW6tn90Wu5EMHNI8nmpmRf
         7paudvIAgYICI/zcb0pZkSBsghlu0uXl9IzZljaumA4L+9Z4zZ3yQbIG+pRd2XNGSjig
         wOkVxNxHnOJMtrCqF70rnKETJlPANGxlnv+tEPLQGZitX+lqq35YP6t3iztwvc9ezGVO
         s6M328pXi1/28/kaMAWsPPiMFQN+O8HAm46xNCwnKeqC7mET9i61uv4bI7+SmR9Ivcp2
         FljHdwOkFvm2Wanu6C+yOIdX9+UToQd8hzMQR43BcRw8Y5ptj/bHcGocRFAJCIDaGYpV
         6LHg==
X-Gm-Message-State: AOAM531axYhR8fc8A6dDXiVPGKm+Oxa7vHRGHoepq18MjRfPdz9mXG5A
        R9NA8RLoktwZZ+Od4fjLjd0=
X-Google-Smtp-Source: ABdhPJxQciKxKjLxekC/0FTunb06t06BDPKTfdhNYB9ydwv7ENmiHDDN+Ryg92CSwjPJcqAh3IswWg==
X-Received: by 2002:a5d:5492:: with SMTP id h18mr10435295wrv.340.1617289663089;
        Thu, 01 Apr 2021 08:07:43 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:a182:b5f0:9f7c:c891])
        by smtp.gmail.com with ESMTPSA id n8sm9710108wrm.70.2021.04.01.08.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:07:42 -0700 (PDT)
From:   Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com
Subject: [PATCH 2/2] staging: media: omap4iss: align arguments with open parenthesis
Date:   Thu,  1 Apr 2021 16:07:39 +0100
Message-Id: <475dbbe5774cbfed2d924807d8a3cfeb84b3d845.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cleans up checks of "Alignment should match open parenthesis"
in iss.c:96.

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/media/omap4iss/iss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index e8f724dbf810..472f1837632e 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -963,7 +963,7 @@ iss_register_subdev_group(struct iss_device *iss,
 		}
 
 		subdev = v4l2_i2c_new_subdev_board(&iss->v4l2_dev, adapter,
-				board_info->board_info, NULL);
+						   board_info->board_info, NULL);
 		if (!subdev) {
 			dev_err(iss->dev, "Unable to register subdev %s\n",
 				board_info->board_info->type);
-- 
2.25.1


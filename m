Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 165E76F94C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 08:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfGVGHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 02:07:06 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44102 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbfGVGHG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 02:07:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id t14so18657876plr.11
        for <linux-media@vger.kernel.org>; Sun, 21 Jul 2019 23:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJXrgrSN2Tlu02tkqLNuQE/VhMtIboN1RIqkDuAB2P8=;
        b=rv3mTh5ZiJppYaMjbz2Kd983X1vNPC07xgeWpCrm3uLSWI4w43fHI9rEHIx+fXNnhh
         Gp6FUgfPY1t+co4YQPixNOVgTgjUZ2QbthzWmGRYjMKcKysQioE0LCZ1eQWfMbgzekdr
         wwGHWIMgB/uDgHVNZy4dteV/sM26uIAS2iZqjd7+tTeENLooPnhaPtv8UE/1AMajbI9B
         9Lh+Epd7kxdEC0bwJhS9dv4D37wL2A4hVz4rbW/EBHIpHErrpl4cBVfTbEHu8R2HSQxl
         ElKqY7z12d/6qnk6eG9M6e/p9NQqBQ9ZclUDjZ3DmcfFT0C2SM9vgED271a8UmS7VY/M
         7jPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJXrgrSN2Tlu02tkqLNuQE/VhMtIboN1RIqkDuAB2P8=;
        b=j0Gi6nybFg7mG89UH40J2kzn9DmI0ii30VjTwu5YmpEzsFRZ1XbJ3odMd9xPRYTlsu
         zAOgwkjUCtlhjoxmeaullVXkA/uva2ADZhDfDBGQPHS6Bqe2AWluzxYm1lOTpo+R8U1R
         0oqwUjXc0NM/sD6Qr8wqoNqBAhviIK2kd43b9L9vS76TPO9pmx9KlXiyCM8o5jZjCUu6
         PvBLFz/4Evlc8IUAX8RWUiLly2lBgnkT5h3dSqNT2vKcDQjSkHk97bzQvSPCOZex37BW
         /AnZ6hejAeNa0S9Vos5yDie+1i5tZFVMIhVn/fPV05bOtTKrowuJ09QiD4qe0S+J34M/
         VmHg==
X-Gm-Message-State: APjAAAW9s+7QX/TytC+o9Y61Hrd4wT0HOBGlNx+ljZe81x9dg0zr+hY6
        1QsrmbMCL6veZkRCwQwH+f4=
X-Google-Smtp-Source: APXvYqzk6v7tQvu2fTaY2Q2UszOnOuD4ns4eYEIDZ0p4SxWS/dsaD+LXL1DVIAQFRdWnk9tAHO6JCg==
X-Received: by 2002:a17:902:2f84:: with SMTP id t4mr68932398plb.57.1563775625815;
        Sun, 21 Jul 2019 23:07:05 -0700 (PDT)
Received: from localhost.localdomain ([122.163.0.39])
        by smtp.gmail.com with ESMTPSA id j13sm35935646pfh.13.2019.07.21.23.07.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 21 Jul 2019 23:07:05 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     maxime.ripard@bootlin.com, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH v2] staging: media: sunxi: Add bool cast to value
Date:   Mon, 22 Jul 2019 11:36:51 +0530
Message-Id: <20190722060651.6538-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Typecast as bool the return value of cedrus_find_format in
cedrus_check_format as the return value of cedrus_check_format is always
treated like a boolean value.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
Changes in v2:
- Add !! to the returned pointer to ensure that the return value is
  always either true or false, and never a non-zero value other than
  true.

 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index e2b530b1a956..b731745f21f8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -86,7 +86,7 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
 static bool cedrus_check_format(u32 pixelformat, u32 directions,
 				unsigned int capabilities)
 {
-	return cedrus_find_format(pixelformat, directions, capabilities);
+	return !!(bool)cedrus_find_format(pixelformat, directions, capabilities);
 }
 
 static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
-- 
2.19.1


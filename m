Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6000523E917
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgHGIhA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgHGIg7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:59 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF5FC061574;
        Fri,  7 Aug 2020 01:36:59 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id s23so710882qtq.12;
        Fri, 07 Aug 2020 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hQh9vJ8qL7le/6UsFdBNNlZw71ZngpGJl8n3+9IJZGM=;
        b=HDgkuECLCWdP831R9shd1Dd4qBzLAP3roMHtzLmA+Tz3Q8BlRrmQ7YzLbQZeNFiwUo
         dWMB/QScPgYAkiqiW0Tt01rFcqymYC8fFc+5a2f5dS/OkyPZKKJMHCzH1xCljnPFWVgq
         i5RORXVr2fNU2EdqBMuf4+qgzbgxU7dAtwhnhbpV2tL5iSS42i2FA9nSKBZqr0r5hFq9
         p5z+yFpvitqwwGkTCOWPGVnuNlGqyGPxlXNiZI4j79YeUKoNmWNnlQSmGuNl3FmhF5uY
         MA5PC+i9PFIBtkCRn9hmLrW1fNykiANjWRJiCBYxrkqN0YO6siC/gcJNipJMfFUf6tAL
         wnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hQh9vJ8qL7le/6UsFdBNNlZw71ZngpGJl8n3+9IJZGM=;
        b=J0LfnsWv38c0Sa1QwE6iwlgOWp9vTAuXlA88Nbkq+gpBMXmx2F2KTIwXGTqLfrP62f
         8djJRzDFZdd7RwBIguXQUdgdfDRkitAUYsKDzn1ciD7srIQX8CoPjVzGbNZtx0gVYypt
         hDQCPzRYHfmhtxHv9JpZarze3Jjp8OG1RHaHKGCKJPWSSk5Hh/KGrpKbeaKdwU/OtVmw
         fCKUn1OXsLQXLZfjJt7K8YjbYqbhDHi1mKz6NJZOtM9DUA3sIRsNsSMkYQ52XkPZSyjN
         JIJbnnmIXGDpp/vBZXf2kBRbT2VSEIJ8NBv4+epbc2M2cmll2823S399OoMC1by/yIvr
         zXXQ==
X-Gm-Message-State: AOAM532rH+yAKba+MtJks/3DdUohjJIjqDr7vTFlRwgdaZrJXlh+Rb2x
        ODj7XDM66lWIdp5qdp/K04UjnVmRqXk=
X-Google-Smtp-Source: ABdhPJxKV6/gqTIu2lJakDUq+jGgkp210KlhpKKuuiTVI9CdEfS7fgxQu1rQSdi7wXYCbG076Ilq0A==
X-Received: by 2002:aed:3aa5:: with SMTP id o34mr13559045qte.359.1596789417960;
        Fri, 07 Aug 2020 01:36:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:57 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 15/20] media: pci: cx23855-video.c: remove duplicate argument in 'or'
Date:   Fri,  7 Aug 2020 05:35:42 -0300
Message-Id: <20200807083548.204360-15-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle report:

drivers/media/pci/cx23885/cx23885-video.c:639:24-44:
duplicated argument to & or |

V4L2_CAP_VBI_CAPTURE appears twice, remove it.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/pci/cx23885/cx23885-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index 440d108b7ddd..a380e0920a21 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -637,7 +637,7 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	sprintf(cap->bus_info, "PCIe:%s", pci_name(dev->pci));
 	cap->capabilities = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_AUDIO | V4L2_CAP_VBI_CAPTURE |
-			    V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
+			    V4L2_CAP_VIDEO_CAPTURE |
 			    V4L2_CAP_DEVICE_CAPS;
 	switch (dev->board) { /* i2c device tuners */
 	case CX23885_BOARD_HAUPPAUGE_HVR1265_K4:
-- 
2.28.0


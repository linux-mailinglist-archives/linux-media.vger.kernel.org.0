Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0430713AB1
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 16:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfEDOk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 10:40:56 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36261 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDOk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 May 2019 10:40:56 -0400
Received: by mail-qk1-f193.google.com with SMTP id c14so1644429qke.3;
        Sat, 04 May 2019 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xu38cRaLtpnqYuurbo6CWspS+gIr3m1joWBLVxT3VQA=;
        b=nkzXoV4AxU3SGKXtSy42c6ZXNaBHglADNYXaXokmwRgmqZp0zaWpXM579zcxFQhQKj
         vlgmWJTxf2O4ZILm4VpZlyrxkNSFoeA8oPkAJiocRx+BY8tOUzzmAnmnfF/tl4TnPC9X
         mvbuAj9kseO7oeqtnPXKzB+nXA2KBeQpjI2s0XyTxBTecC82qggq+arV6OwoVn7UOx+I
         9l6sxoyG8I/1JQY/qyxqlXUqkC3PfQgeTXARgs3DXKgTfbTDKJiXewwth4MKMENHy3hA
         ASUG1wRmtzwRnMt31I5KPUV5EtVhN6FPQxxyowpEKpqvmb7+aMKHT80Bn1cYpSjCvVaT
         +cvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xu38cRaLtpnqYuurbo6CWspS+gIr3m1joWBLVxT3VQA=;
        b=YM1tb34BK8DJ0UfZ+gu3D+6pSxPzs9iERZ8l4JeY7Bu3/lmnbUp35EsFOONBKNa3GA
         /JkzTaOg+fcMZl4MvFpXr5ZFpAn3LKw802UgwhZYEv+OWMsagu+n3Ia7ueHwkJ1M2IGh
         rnNY4//aK3oBVQ4ORLlk7rSEF118QNOSgWeOCk0HK0g4qZqEvissIF+hOxO/cyx5D8w1
         dlnAoGY9qjYIRc1PxAM02YvbQe+fHj6F1WAX2gxsU8h9Lkr7/ky+f3/gz27OeMHwIQZf
         rhVf3UIvNeliCR/JdPvVQS4RdlVpPfIynoMZemPJg9dx3lLYTSrKaZ5KhXMu1l90YPc2
         meJg==
X-Gm-Message-State: APjAAAVvRcveeHJOZKxOGVU/mlnOsN2uN++jRz4MUvkxjsyAcpkcOKZT
        kr1ty+eBCF+50tNF4OqsSsI=
X-Google-Smtp-Source: APXvYqyWAYwH5Ber7i35gLcncyKZIE9FdNcmSHuccNVyBNZ+HZ7xNCikYoQoQw0NpsnmSG5fGriwGg==
X-Received: by 2002:a05:620a:141a:: with SMTP id d26mr12478633qkj.238.1556980855673;
        Sat, 04 May 2019 07:40:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id 67sm2536815qtc.29.2019.05.04.07.40.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 07:40:55 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rui.silva@linaro.org, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, otavio@ossystems.com.br,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 8/8] media: imx7-media-csi: Change imx7_csi_enable() to void
Date:   Sat,  4 May 2019 11:40:27 -0300
Message-Id: <20190504144027.31920-8-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

imx7_csi_enable() always return 0 and its return value is never checked,
so convert it to void.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index dcc6027fe32b..0f51791f788a 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -799,7 +799,7 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 	return 0;
 }
 
-static int imx7_csi_enable(struct imx7_csi *csi)
+static void imx7_csi_enable(struct imx7_csi *csi)
 {
 	imx7_csi_sw_reset(csi);
 
@@ -807,10 +807,7 @@ static int imx7_csi_enable(struct imx7_csi *csi)
 		imx7_csi_dmareq_rff_enable(csi);
 		imx7_csi_hw_enable_irq(csi);
 		imx7_csi_hw_enable(csi);
-		return 0;
 	}
-
-	return 0;
 }
 
 static void imx7_csi_disable(struct imx7_csi *csi)
-- 
2.17.1


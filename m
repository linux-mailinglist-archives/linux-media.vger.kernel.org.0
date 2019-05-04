Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF38A13AAB
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 16:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfEDOko (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 10:40:44 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:45623 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDOko (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 May 2019 10:40:44 -0400
Received: by mail-qk1-f195.google.com with SMTP id d5so243856qko.12;
        Sat, 04 May 2019 07:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SrbMTnJl3HCplwHOOFkZixgCnFnnvAU6jaUDQIXmhpQ=;
        b=ZxKkU9CvTswkNappRJA5MWu5roKbvuxcsiGJC4dNNMfUPQGxhih86il2xDSL2lXN1Q
         9HGlBKAIooorTs9G6B3qsLTTDvPCcdoWkRsjvzf5YKibJC66ePemywjmcvXub+4bh8Kg
         P22qDDqgmW2tuYo2/K07uIW83LSj4Em25uJ/CLj2kHQ+XM6rjC4BeeblP2AWIP7DH9T2
         +vuqAkiFHX0wewzLPVBMD9cUe5wVZ+uhPeF+X0GK60mJkCzprAl0ZNW7QIdzPUCQQRdB
         njLYUr50LDCBEPjgDk4FhKM3gnkmKziX6djJ+cS/HH0HZSscmuNc9FQeSmc1iINaNLuq
         8WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SrbMTnJl3HCplwHOOFkZixgCnFnnvAU6jaUDQIXmhpQ=;
        b=EH64jjh/XRni1SVjHZZZltpO15JiKi0FxIZoKjh4rgJDW9K5TT/hI12/75vfkbwOq8
         OTeaaGtUKFFH/yi9WOpuh+lHo91ECd6o8vI3+JeCl+JCyUd66jdJ58Jy1avsWqvkTZ5z
         s0vuyALYT0MHXnsbstSzPnyRuAo8oSxbXYgveceJZUi2NJV99J0f/I2xGNXJKEjNAw50
         4K7nuShv/bCAE0ak/bskin3gOUhHi+wK2DtRhW2Ime9grebuZc0XIE4845eBvAFnOrMU
         bpz4D0+A9YfnBnrYeD711fGMHpUb6vXjiUJQeL6CKKaj181AOdPmTUYkE3QqmGfV8OEt
         PylQ==
X-Gm-Message-State: APjAAAUXA/E6EG9m4TMHZILCZLzHE44bA0+Ih+zvB98Box/O4Qup7fRR
        mvwvB5qp4ZvsmRSkLN1p19M=
X-Google-Smtp-Source: APXvYqzswW/uQ1pR+oDDlJzMrVpT5W7LCGRSI6GHEHmKZK/mWnogKeEKK1V3B7ccxFAzFIOewVEelg==
X-Received: by 2002:ae9:ec04:: with SMTP id h4mr12335616qkg.1.1556980842994;
        Sat, 04 May 2019 07:40:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id 67sm2536815qtc.29.2019.05.04.07.40.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 07:40:42 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rui.silva@linaro.org, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, otavio@ossystems.com.br,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 6/8] media: imx7-media-csi: Remove unneeded break
Date:   Sat,  4 May 2019 11:40:24 -0300
Message-Id: <20190504144027.31920-5-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove unneeded 'break' right after the 'return' statement as
pointed out by checkpatch.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 88265cd133ab..d1ecdcfc792e 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1003,7 +1003,6 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		break;
 	default:
 		return -EINVAL;
-		break;
 	}
 	return 0;
 }
-- 
2.17.1


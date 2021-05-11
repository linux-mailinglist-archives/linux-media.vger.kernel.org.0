Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512AC37ADEC
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbhEKSJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbhEKSJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:23 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB7CC061345
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:15 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id q6so10668416qvb.2
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UJPCudzb/Ou4GJ6RU5NgC6ZAZYELLNF2PjvvnraTbLs=;
        b=jOnMJrqZdmWyP0o57NUCpDxilR4xUtkwq7WWOW6jkBIyJpKJXpzcdDSHVUram4Fw2l
         R1tS10lyDQmNrTXBf0Ef+so2J9GOUYMuLI7TtWn+gCC/YPr8pjlWw+vaZu230sWpy5sM
         okitfqjHivB2xFoRsRZKQ4C4eXRXsuPzskeu1+VIVfPfnLZ8xqv9Yl5tWbdYa8eYOwlA
         cYOYFubxxgTbc6oIGZb3j6344nwr0L+lLXRp0oS401XIKDCKk3c+/mY0gONhzVc+JZm7
         4vS7hNDGqDy2iXnR7RSUdSBsAkC3GyYIw5uGsgbMAh+4+zGTsJnqBXybMn/1eye0kzfs
         ZnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UJPCudzb/Ou4GJ6RU5NgC6ZAZYELLNF2PjvvnraTbLs=;
        b=OFWj0FW/2QwLOpLJWx0Ip6+x/KT4lInOTzD3n2KmUYV8orCxVIYk15qOPwPG37i9bR
         ExUdkw8x/XY1+cuL5EYqqFFqSgWU1EP1B3I6JtVo95F+3TJyu6/XcUCe6567EAeDAtpV
         qYn2JvlGMJjMtdhsSs+CIxdKce2PYfFi66oewE60aNudgIr2OR6ACpMYGodl+hWU2MM9
         Railu+T7EZU+EjXDeV/4lPUn4M2ZZX/lWMk644KsIhBZd1snK3sWWSn4Bf/aAbjbV7vI
         337Oxvy8xCG+9RMsNfu7BaQj9Zm38zny2hf8Ell/aZS0O9YA6Hp/F8NcVyRUds8LI5xX
         2XbQ==
X-Gm-Message-State: AOAM531h/pnwdAeFMUGBeuWRt/0iCxKOpMFuz19j7E8I1Q2TJCDgsC1K
        ezTqKrxtL4AzElpFGNnNGX1zMg==
X-Google-Smtp-Source: ABdhPJyt6UKeePHWiG6MVDsBLdK4vH8HRXo1wZJkRcNm+uOQADMV2j5NAOIHOn15+yCV/riECKHTYw==
X-Received: by 2002:a0c:8521:: with SMTP id n30mr30551676qva.53.1620756495291;
        Tue, 11 May 2021 11:08:15 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:14 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 07/17] media: camss: csid-170: support more than one lite vfe
Date:   Tue, 11 May 2021 14:07:14 -0400
Message-Id: <20210511180728.23781-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change the IS_LITE condition so that it returns true for the second lite
vfe found on titan 480 hardware (8250), which will have id == 3.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index 3958bacd7b97..af134ded241d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -21,7 +21,7 @@
  * interface support. As a result of that it has an
  * alternate register layout.
  */
-#define IS_LITE		(csid->id == 2 ? 1 : 0)
+#define IS_LITE		(csid->id >= 2 ? 1 : 0)
 
 #define CSID_HW_VERSION		0x0
 #define		HW_VERSION_STEPPING	0
-- 
2.26.1


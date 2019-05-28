Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F23882CBB1
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfE1QTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:19:54 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37591 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfE1QTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:19:53 -0400
Received: by mail-ed1-f68.google.com with SMTP id w37so32595018edw.4
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 09:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kBnnOV0n1eF26qJTc+2ZHyecfNMEUMBuYzZtZO5zxMs=;
        b=rub0FTwe6jm+OwOzhaRwjajHwROSKAjn8zelTnqQkZdJQv/kuASBybVcJ+LzfRQiR7
         bIybdb3LjX7PNbJNYx9tKRHvYyhI80O40p+RCA+26TRiRckzK2fAnODEJl/YRaHM26Jp
         fSoDyIfWjHJYAMeNLDYUF55Jtc2aftmuJxu0DCfCsYNa7LbIrDLYHr1k12NUsM8zIA3q
         YnStQgjraeaMgteD9BW/HG1NKYYG4/1+54AwZ6oozMJeHAArYZ1IidvmfnChEunW9t05
         kHZRyrHz5vN5mv9rBfyTV7OR+nNtZNIXbmQF+lRXEnuOlofQHjGDkE/i9eIWQisV1vOQ
         lgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kBnnOV0n1eF26qJTc+2ZHyecfNMEUMBuYzZtZO5zxMs=;
        b=IYkwlpbL6oXBKd3Bvgfp8TY+DYc6P+UQI7I1N7MrD9xBD5k/N1YA1LU0Z9RtU/KCj7
         mgY9DB3jCOuSku5Zgnm+gdWNlqlGGR2djKeyai+aGoCy3igLieqTpVztT7EAcO4rHOnz
         vkUG7BXYpjDWSnwWnBGktMeuy0ZRAaD8jSa7DzOAJ1BviV2J35+njghnqiX3lGruFy+w
         SPv6Qhpyj5dVVWTJjwScWQrSNOGiK3JPl1P2Eca/7XWJP41aROK+mcqu+zRBroKy16aV
         sEPXBqQ6+g3qfspHkcZHD+qL0PYLTsa4pXscfLzT+qFA8oTQWIhcrXsb2GPqfE/lkmT6
         GOFA==
X-Gm-Message-State: APjAAAUE0g8kKmdLqa0nYELYuvPjdFWDWViWhQchKiQKBW2R9MNSuHaf
        QdEkRmXMStlO/y3G56YbiMfG2ePDnCI=
X-Google-Smtp-Source: APXvYqzjN/bFvI2z7rB9ekww5AgF4PvTsnwQ96LhWgYcv9wxFaFaTx5R+khYunWAoH5Mh3UawCOKoA==
X-Received: by 2002:aa7:d28e:: with SMTP id w14mr131300938edq.119.1559060391900;
        Tue, 28 May 2019 09:19:51 -0700 (PDT)
Received: from ubuntu.localdomain ([173.38.220.62])
        by smtp.gmail.com with ESMTPSA id c38sm4313002edc.22.2019.05.28.09.19.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:19:51 -0700 (PDT)
From:   johan.korsnes@gmail.com
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH 8/8] media: vivid.rst: describe display present control
Date:   Tue, 28 May 2019 10:19:12 -0700
Message-Id: <20190528171912.3688-9-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528171912.3688-1-johan.korsnes@gmail.com>
References: <20190528171912.3688-1-johan.korsnes@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Johan Korsnes <johan.korsnes@gmail.com>

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 Documentation/media/v4l-drivers/vivid.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/media/v4l-drivers/vivid.rst b/Documentation/media/v4l-drivers/vivid.rst
index edb6f33e029c..7082fec4075d 100644
--- a/Documentation/media/v4l-drivers/vivid.rst
+++ b/Documentation/media/v4l-drivers/vivid.rst
@@ -941,6 +941,11 @@ Digital Video Controls
 	affects the reported colorspace since DVI_D outputs will always use
 	sRGB.
 
+- Display Present:
+
+	sets the presence of a "display" on the HDMI output. This affects
+	the tx_edid_present, tx_hotplug and tx_rxsense controls.
+
 
 FM Radio Receiver Controls
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.17.1


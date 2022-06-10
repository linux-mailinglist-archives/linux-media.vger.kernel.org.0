Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F38546765
	for <lists+linux-media@lfdr.de>; Fri, 10 Jun 2022 15:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243794AbiFJNeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jun 2022 09:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234666AbiFJNd7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jun 2022 09:33:59 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8511169
        for <linux-media@vger.kernel.org>; Fri, 10 Jun 2022 06:33:58 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id mh16-20020a17090b4ad000b001e8313301f1so3410448pjb.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jun 2022 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=um0IS2eKOXRyYR/yA6NtlR2RuwKLd8iOPkZZFVQUfaM=;
        b=FQbpSrMJTWpI8nqmrsO+Sec+vPS5Efs8FtRadI64A+uAMDrpDW+pbqzN9H1tNyFs2D
         wOPnX+Ci643o95mNRMfDFTxoGly/EJ+jbgXT6N4wY5HA96D4ihfIihdub7W+rxRwdtRP
         eOBvG2ku6Uql7GZJqLzUHGbcnNR4ZZFVOPDudec4RWf5XjC295Cu0MLAA6UtOZ7d86xd
         DW7zPpCPkPz+BwdEnqWos/P78ifD4UDp+oI45U+N8YNYUhiVEQAv6D9aNynbNNUJGecm
         QG/KKNxHRqS1C1slpMtdWc7Fb2XR94357epPIq7eLgypsraHTg+uhTh82GcPgUig8K+p
         NI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=um0IS2eKOXRyYR/yA6NtlR2RuwKLd8iOPkZZFVQUfaM=;
        b=zZTmM6+/6Ql46ihtbwLR6hAO5VzJi89Mh8MIzDNFSqkoYNTfj2WFXKmEa58geluXwh
         3R8MyA2MtfrrvagDooXcC0YPQsMUC+04zBblzadxHnuGhEJQOTepRXZ43Vm9c4j/uE3n
         4bLpmYZbOHNwC6okjbF5BSKS5fr0O2KsgfPIPVhLtpfk6g3ylUS1XMXcQVrCX350BtQy
         ZUVU4azKALp4GhJefeYb3GFlmxo6MBbxdddmCYut5KlbWjgdDKuTBWeievg0F9sqUalg
         kV+B+7SyDkrI0mBI0SEdUbpzpVDar6y/KYqefoXEz+nve6Lj0Ww9LEl7HOslQuBrAjNN
         YJuQ==
X-Gm-Message-State: AOAM530GIFEFFyDXx31njpsAJhx25X0WzociMqPD+bACBDPDBVXA1tKK
        6pU5SrtVkQqiCgETmdoAkxiqNA==
X-Google-Smtp-Source: ABdhPJzlRIs8tVPUUVg1B3zLmotdyQPA6QoXYMdybgW5NXwJjFAaFPUifeAtxvCQb/WyAsOMYmTvgA==
X-Received: by 2002:a17:902:ec92:b0:166:3502:ecb1 with SMTP id x18-20020a170902ec9200b001663502ecb1mr45048576plg.62.1654868038099;
        Fri, 10 Jun 2022 06:33:58 -0700 (PDT)
Received: from localhost.localdomain (118-167-232-112.dynamic-ip.hinet.net. [118.167.232.112])
        by smtp.gmail.com with ESMTPSA id y192-20020a638ac9000000b003fd696ea0c8sm13121103pgd.67.2022.06.10.06.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 06:33:56 -0700 (PDT)
From:   Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        Zhuohao Lee <zhuohao@chromium.org>,
        linux-media@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: [PATCH v1] media: platform: cros-ec: Add kinox to the match table
Date:   Fri, 10 Jun 2022 21:33:42 +0800
Message-Id: <20220610133342.3735012-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Google Kinox device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 8c8d8fc5e63e..093aa4fc6692 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -217,6 +217,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Fizz", "0000:00:02.0", "Port B" },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", "Port B" },
+	/* Google Kinox */
+	{ "Google", "Kinox", "0000:00:02.0", "Port B" },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1


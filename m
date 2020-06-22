Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB892044E7
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 02:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731396AbgFWAAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 20:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730227AbgFWAAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 20:00:31 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0624DC061795
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 17:00:30 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id u26so14416090qtj.21
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 17:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=5zTsNUOuWpxVQwqHyA81KsGM2YNeS5DPukrNNpPb13M=;
        b=M1WXzOjjwSSfmdXJyrDzw7m8OND5MaAnFF8VN//vPg5cCgawoble5uRcZkUBeUOJJU
         HG3LmP53IMR+Q1ugUKF6KeIX+giRSSnJ9lh+zXibW5vkAH8PLfr4gjP7iMyUkNEU8KjA
         yTLRa82PFinpCZn2gab4Zcu3GRxf9gh0sgijRQNM8BFUVjY1R190he2sB/XzaTbptoPg
         ibPszbD2g5xl2RkyzJGFEqXVt3D5Fx2ecdgl/PpPY4IVsBsR8B8tp/4rptfCbgH0+qcF
         VmQpOu6IfsZ4fWvSyLI6omVUsK8/74szoBahPwb9Ww7xr0Xx92sTmtdXUiauPS4yT+Xy
         chgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=5zTsNUOuWpxVQwqHyA81KsGM2YNeS5DPukrNNpPb13M=;
        b=BY359B6rMv3d6RF1WpcWZdFgD1p3iCeUTSQ7c0r1YtdMqcmyxXKea4qI7LnFv3Qhx6
         sR1WGZ0gNfvsGrwOYC44L+Yr11yZOTDApWwHcrN3w9030kG2+ky0eGbxppRPgh9YlR8n
         68jOjg30iuANcKABUdMYktY6V8LD8K1rADC5AIizY6gqOLuKkp9TcZtsvkZdszkX8KtZ
         Qhf5lS/48z4qJkyfKDleXBPjLOK4hD1V+g3KnmMDNMJlJhl9As4+OL4cnxw+EfSIfhJB
         Bedh9G3ZQ6Sahhda2D97a5VwPYq6mIyTNew58EOV/ggrnnHHC0lgAQ5aSZakG4YyUIlW
         rBZg==
X-Gm-Message-State: AOAM530Nmj9o+0nNcnlIKKE1S9lJp6J39UG+SHzXcWbzy5QJMMnj6acQ
        xJBAqZfcZTj3PKjNdcy5vyZVTQqcNvQ3s47rrVFmzeUKvqIkaPme5l82+mO0JRvjph8cUR7efP8
        AaCFyaehogMaQsvzppD315Mbyl8COEfrSXGFeSerrk0R6dMnrMxaSNEJF362csXkPEPH0fQw=
X-Google-Smtp-Source: ABdhPJz1DB2VVCqnZsMRidGWCQLIf5KPXc6QT1FvyTz15HvgqxhYW5wOeIgatgZS1ZxxT02qnvwEKFSepQqf
X-Received: by 2002:a0c:f78b:: with SMTP id s11mr24268161qvn.33.1592870429157;
 Mon, 22 Jun 2020 17:00:29 -0700 (PDT)
Date:   Mon, 22 Jun 2020 19:59:49 -0400
In-Reply-To: <20200622235950.169001-1-jnchase@google.com>
Message-Id: <20200622235950.169001-3-jnchase@google.com>
Mime-Version: 1.0
References: <20200622235950.169001-1-jnchase@google.com>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH v6 2/3] media: cec: add adap_controls_phys_addr option
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use of the cec notifier framework is required to support
CEC_CAP_CONNECTOR_INFO but some devices do not want physical address
updates from the notifier. This adds an option to allow registering
with a cec notifier without getting address updates.

Signed-off-by: Jeff Chase <jnchase@google.com>
---
 drivers/media/cec/core/cec-notifier.c | 11 +++++++----
 include/media/cec.h                   |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
index 517e0035fc99..95f363bb1d19 100644
--- a/drivers/media/cec/core/cec-notifier.c
+++ b/drivers/media/cec/core/cec-notifier.c
@@ -116,7 +116,8 @@ cec_notifier_conn_register(struct device *hdmi_dev, const char *port_name,
 	else
 		memset(&n->conn_info, 0, sizeof(n->conn_info));
 	if (n->cec_adap) {
-		cec_phys_addr_invalidate(n->cec_adap);
+		if (!n->cec_adap->adap_controls_phys_addr)
+			cec_phys_addr_invalidate(n->cec_adap);
 		cec_s_conn_info(n->cec_adap, conn_info);
 	}
 	mutex_unlock(&n->lock);
@@ -133,7 +134,8 @@ void cec_notifier_conn_unregister(struct cec_notifier *n)
 	memset(&n->conn_info, 0, sizeof(n->conn_info));
 	n->phys_addr = CEC_PHYS_ADDR_INVALID;
 	if (n->cec_adap) {
-		cec_phys_addr_invalidate(n->cec_adap);
+		if (!n->cec_adap->adap_controls_phys_addr)
+			cec_phys_addr_invalidate(n->cec_adap);
 		cec_s_conn_info(n->cec_adap, NULL);
 	}
 	mutex_unlock(&n->lock);
@@ -158,7 +160,8 @@ cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *port_name,
 	n->cec_adap = adap;
 	adap->conn_info = n->conn_info;
 	adap->notifier = n;
-	cec_s_phys_addr(adap, n->phys_addr, false);
+	if (!adap->adap_controls_phys_addr)
+		cec_s_phys_addr(adap, n->phys_addr, false);
 	mutex_unlock(&n->lock);
 	return n;
 }
@@ -185,7 +188,7 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 
 	mutex_lock(&n->lock);
 	n->phys_addr = pa;
-	if (n->cec_adap)
+	if (n->cec_adap && !n->cec_adap->adap_controls_phys_addr)
 		cec_s_phys_addr(n->cec_adap, n->phys_addr, false);
 	mutex_unlock(&n->lock);
 }
diff --git a/include/media/cec.h b/include/media/cec.h
index 972bc8cd4384..50482b6c4b66 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -174,6 +174,7 @@ struct cec_adapter {
 	bool is_configuring;
 	bool is_configured;
 	bool cec_pin_is_high;
+	bool adap_controls_phys_addr;
 	u8 last_initiator;
 	u32 monitor_all_cnt;
 	u32 monitor_pin_cnt;
-- 
2.27.0.111.gc72c7da667-goog


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72EF437ADF5
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhEKSJf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbhEKSJ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:27 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB631C061348
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:19 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id a22so19100179qkl.10
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZPyfLXfAuFVtdULxwP4Td4sMymsB5106H47fAEp+QH8=;
        b=zWqwgWpJCjw7WKmZ3oqortSwz3uz133jwoi5Cuk2zdcaxJU2LH/Cv4WB3OdImE6rpt
         knHRbRwCcFlacyCr117pB2bq9R/IGtvQiaeDjlU/GfrjrczWc4jXe1FdlnDygTAsKpZ5
         b4bEuggLKHnY8bbMgtZ6cZJgqmw05kj9LBAx1PzwoVuhgQt/rb0Uwd6UaDyoqYwRT9ml
         sTbFOZZZ9lwL6aQWo3Be0DxXVd3STEFAieWYzIWTF63oro4WtMVVvUNtK3kxRg+Uxpfb
         Fwbcq8eSdzpVYl4Qvn35oFz2OVg0kLeR7uO8eIlZXTiz7aKqahCOqmWe8B8nuOfpPhVa
         cUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPyfLXfAuFVtdULxwP4Td4sMymsB5106H47fAEp+QH8=;
        b=IiVGsAnXKh2GWTURec3rZRxW0+RXYEfYCbnpAwCHxTHR2QqQt7+isHl/mbIGiZzGJm
         wyuevyWnWTq5XoXDNiEGxQmPWSi8YaBESdvts/Fa8K6CJEHQgvyFoS8UY7H1rgx7wNRw
         sELlAjYH5T8iF1X8+k5jpAPAsd4YqqdHLDb3bMOaBUajb1AevdzjWZrPQedqfOZo025m
         TohkPLwBIDn4TUxIg8WS3Thd138NjyqC46lEmBcMvvgG9RS0YgxQtn64LI8Ne+o7mtX1
         qeq9QNao25uIBZzyVXJmqNUa+vBvZ0YASddujOe2r+m5tbpSO5wsdNkOFFKsGVxn1HyS
         Ao6w==
X-Gm-Message-State: AOAM531mq7nnsoE6l+T0pJxrCyVkXOMHPEAvuy3t3OT30nVEL1SZ/gR6
        pElptASfp1sJ+MM4Ep4SjaO50A==
X-Google-Smtp-Source: ABdhPJyUYlQ1lNhxL3Whnu1SGV39Fue1yyCO+w66YFqJ29+5d5GET9aFjejSuvRp/FJxQTu9i4Y2JQ==
X-Received: by 2002:a37:8403:: with SMTP id g3mr19476744qkd.469.1620756499128;
        Tue, 11 May 2021 11:08:19 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:18 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/17] media: camss: remove vdda-csiN from sdm845 resources
Date:   Tue, 11 May 2021 14:07:17 -0400
Message-Id: <20210511180728.23781-11-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This isn't used and only works because devm_regulator_get() returns a dummy
regulator.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ef100d5f7763..c08d6d6f6f90 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -542,7 +542,7 @@ static const struct resources csiphy_res_845[] = {
 static const struct resources csid_res_845[] = {
 	/* CSID0 */
 	{
-		.regulator = { "vdda-csi0" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_src",
 				"vfe0_cphy_rx", "csi0",
@@ -562,7 +562,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID1 */
 	{
-		.regulator = { "vdda-csi1" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_src",
 				"vfe1_cphy_rx", "csi1",
@@ -582,7 +582,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID2 */
 	{
-		.regulator = { "vdda-csi2" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe_lite", "vfe_lite_src",
 				"vfe_lite_cphy_rx", "csi2",
-- 
2.26.1


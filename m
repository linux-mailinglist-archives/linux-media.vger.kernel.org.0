Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D64037ADEF
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbhEKSJd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbhEKSJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:25 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986E4C06138C
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:18 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id i67so19670392qkc.4
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1nauncHVfZ4iPve0AJPZMC4lIF+t0IxJHgwWKTrYrMM=;
        b=siDMUfadrZaiaKu+hssFdQTApaZbrseL2plfnZpnozqTzddVQ0OL7lyd+qcMGgnROq
         B+MFGmoqsmqlcApUk2QtnGTB0+I1vFzsW8jgQ0Jod9rpi5LlcL2NklGI31W0FGyCdHxx
         Touew0CWnkk6xO26J897akHpzh52YFfZnhJQytJ/G81mXTrRHgQmg4LRPsk95pxrJsx9
         1u3FFU8NyvYp8Ylkclmu5H+GHAEXlaLWDka5tdzt7hT1oR6MxSHpOyOQ0ZjC4BIXWJk1
         VGQMsjUiLUkfaM3q8Gl8TknK9tA6kdYzvU+sLaJtQLniOpKZeEUe62RQ+fXx9uS00iSQ
         ywlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1nauncHVfZ4iPve0AJPZMC4lIF+t0IxJHgwWKTrYrMM=;
        b=oNigwaKXgMOx1VqnWo3I/kb70SAo4z521yQ9uesfn9AcqaMekghe/XqAiXZLJfro0o
         Y4luTbRDgyUWvidXPWOzBEpGVyX5u3XzBMFZRBjHjMAOReE2weMlYDH9CK8bYPi0iN+K
         JUsmU3FeY9x7ihkzOHtBxqeXpM2Q7SfzTIzehP69S2uKPQSxNGdNThVHTQLlLWW+Qk4x
         lXx19WGSWlxKTtxzsax+OE8CuuWaVoRTOKPwXQ2kZami9WVP0jRirZ6qOORvZkAcxthJ
         mhjvmQMY+ts7B+Kocq8jk1L1foRXpLju8UdmxfoQcLF7T3G62CnH19nTY6ExGYnusXF1
         A9NQ==
X-Gm-Message-State: AOAM530z/30XMhlrn89vZ6jhEYeb+oHB5DcP8eNwiC0WfCzNhEFUlM8B
        jgtKfSNlUrKXrdEp36kislu6OQ==
X-Google-Smtp-Source: ABdhPJwOoMAE6+xdicickpMIH7oEhGovTMHZd8fZPkoF4HVwmnu0FvsWl4dtr5iaHjl8tM6cDWvCiw==
X-Received: by 2002:a37:9206:: with SMTP id u6mr29852994qkd.7.1620756497888;
        Tue, 11 May 2021 11:08:17 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:17 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 09/17] media: camss: csid: allow csid to work without a regulator
Date:   Tue, 11 May 2021 14:07:16 -0400
Message-Id: <20210511180728.23781-10-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At least for titan HW, CSID don't have an associated regulator. This change
is necessary to be able to model this in the CSID resources.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index cc11fbfdae13..528674dea06c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -162,7 +162,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		ret = regulator_enable(csid->vdda);
+		ret = csid->vdda ? regulator_enable(csid->vdda) : 0;
 		if (ret < 0) {
 			pm_runtime_put_sync(dev);
 			return ret;
@@ -170,14 +170,16 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = csid_set_clock_rates(csid);
 		if (ret < 0) {
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
 
 		ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
 		if (ret < 0) {
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -188,7 +190,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0) {
 			disable_irq(csid->irq);
 			camss_disable_clocks(csid->nclocks, csid->clock);
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -197,7 +200,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
-		ret = regulator_disable(csid->vdda);
+		ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
 		pm_runtime_put_sync(dev);
 	}
 
@@ -634,7 +637,9 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	/* Regulator */
 
-	csid->vdda = devm_regulator_get(dev, res->regulator[0]);
+	csid->vdda = NULL;
+	if (res->regulator[0])
+		csid->vdda = devm_regulator_get(dev, res->regulator[0]);
 	if (IS_ERR(csid->vdda)) {
 		dev_err(dev, "could not get regulator\n");
 		return PTR_ERR(csid->vdda);
-- 
2.26.1


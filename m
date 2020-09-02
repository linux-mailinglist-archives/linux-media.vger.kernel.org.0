Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567F025B145
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgIBQRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:17:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:53922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728152AbgIBQKv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:51 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E355221527;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=+2RR6roDnn65j3iO36CYLbDLclz+0rrWulMZeG9XTOk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=y4CnJRus8XbEmh08o5k7WLby+AoyTlP/estB+zYDEA8ccRF3QXheYEh094E8DV+oD
         bhyXKWq1gnCqgoieLbaTEjMlSLl1StG435UgWv8JT1y1mDhyYMRvJY0nGXouLtiEH7
         HGxkbVHeoqZR6rVHIdjZ6uzjJmqTYNiqoCkXUTKE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAL-1s; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/38] media: vivid: fix error path
Date:   Wed,  2 Sep 2020 18:10:18 +0200
Message-Id: <276afb2977c68e7d9e8d8d90237abff8ed2cd21c.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If something fails after calling v4l2_device_register(),
it should call v4l2_device_put().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 54df7e0c13fc..48809991f037 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1698,10 +1698,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 				       &has_tuner, &has_modulator,
 				       &ccs_cap, &ccs_out,
 				       in_type_counter, out_type_counter);
-	if (ret) {
-		kfree(dev);
-		return ret;
-	}
+	if (ret)
+		goto free_dev;
 
 	vivid_set_capabilities(dev);
 
-- 
2.26.2


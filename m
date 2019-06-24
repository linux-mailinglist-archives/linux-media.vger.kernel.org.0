Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD609517EA
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 18:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731487AbfFXQDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 12:03:42 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35507 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731476AbfFXQDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 12:03:41 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fRRKhHRxHF85OfRRThZabg; Mon, 24 Jun 2019 18:03:39 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv8 08/13] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
Date:   Mon, 24 Jun 2019 18:03:25 +0200
Message-Id: <20190624160330.38048-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHHansUyGVXBysIw83Mx+bRjZGJT/Z8Zf6NsbpPtkX3RRqVmBXKFM6o+UHfbRcYyh+qucjbgPKjQu+b6PY7Q8ggJzLbvXhQixSiVRtNg+sEXzfaKMnhE
 5Odn//YSx8h1UhGB5hrMEbmwXveFfKHQ3stgENRQujroOMukNbwqdXxU9oEdtVD7uNn2Zbrg5jSo0kzqyU2tTk7yc0nCRenmqFiX4TpJUiKn1Ge6v+rmTfQj
 KEDgTbqGa4k/NugARg5b5+ofFOfwc08YSQu1hGcJXzBzv+Cv50gcrh/hJ0uVGfQGjP8myMa4czNvTLN5ZEtutekV4iIoa6xOPw/o6Favdak=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dariusz Marcinkiewicz <darekm@google.com>

Use the new cec_notifier_cec_adap_(un)register() functions to
(un)register the notifier for the CEC adapter.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 6c323510f128..6f7ecacb7d1f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -281,13 +281,14 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	cec->notify = cec_notifier_get(pdev->dev.parent);
+	cec->notify = cec_notifier_cec_adap_register(pdev->dev.parent,
+						     NULL, cec->adap);
 	if (!cec->notify)
 		return -ENOMEM;
 
 	ret = cec_register_adapter(cec->adap, pdev->dev.parent);
 	if (ret < 0) {
-		cec_notifier_put(cec->notify);
+		cec_notifier_cec_adap_unregister(cec->notify);
 		return ret;
 	}
 
@@ -297,8 +298,6 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	 */
 	devm_remove_action(&pdev->dev, dw_hdmi_cec_del, cec);
 
-	cec_register_cec_notifier(cec->adap, cec->notify);
-
 	return 0;
 }
 
@@ -306,8 +305,8 @@ static int dw_hdmi_cec_remove(struct platform_device *pdev)
 {
 	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
 
+	cec_notifier_cec_adap_unregister(cec->notify);
 	cec_unregister_adapter(cec->adap);
-	cec_notifier_put(cec->notify);
 
 	return 0;
 }
-- 
2.20.1


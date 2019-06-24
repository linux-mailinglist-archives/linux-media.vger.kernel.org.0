Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0876517EE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 18:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731499AbfFXQDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 12:03:45 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35507 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729496AbfFXQDm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 12:03:42 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fRRKhHRxHF85OfRRVhZacp; Mon, 24 Jun 2019 18:03:41 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv8 13/13] drm/vc4/vc4_hdmi: fill in connector info
Date:   Mon, 24 Jun 2019 18:03:30 +0200
Message-Id: <20190624160330.38048-14-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOIEYMngRDIwgK74lnlvOXIt+9xy5ZfdkyY50fEwdUfHLW3a6HQUX9qOjaoewFZqmrrw97CMmILYvYcruHFXffRTdMS8h1EKdAXjyCM+KJiPP3i3kA/l
 qbLIqY3uC0qPtLV/o7kL0awPNFc9OKys1ntf6O23b4W7fj04WjYHw2DGvGepT6Wik/vmWq4BwiW315yaB2gGUOKXRc8N0MHw9k57P8wa91Rnj6J8J37y2RfB
 SONLuSvtwaGLT4XJDRjRQQmP0X9/oh3fYjonz8QEg5cTYANXwxJc9mU2sj2fXQYYNde+ac6na/uTLAwU7nBVKiVT2g5DREcVczC7BpIllgQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dariusz Marcinkiewicz <darekm@google.com>

Fill in the connector info, allowing userspace to associate
the CEC device with the drm connector.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 99fc8569e0f5..a998bb35b375 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1279,6 +1279,9 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
 
 static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
+#ifdef CONFIG_DRM_VC4_HDMI_CEC
+	struct cec_connector_info conn_info;
+#endif
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
@@ -1397,13 +1400,15 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 	hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 					      vc4, "vc4",
-					      CEC_CAP_TRANSMIT |
-					      CEC_CAP_LOG_ADDRS |
-					      CEC_CAP_PASSTHROUGH |
-					      CEC_CAP_RC, 1);
+					      CEC_CAP_DEFAULTS |
+					      CEC_CAP_CONNECTOR_INFO, 1);
 	ret = PTR_ERR_OR_ZERO(hdmi->cec_adap);
 	if (ret < 0)
 		goto err_destroy_conn;
+
+	cec_fill_conn_info_from_drm(&conn_info, hdmi->connector);
+	cec_s_conn_info(hdmi->cec_adap, &conn_info);
+
 	HDMI_WRITE(VC4_HDMI_CPU_MASK_SET, 0xffffffff);
 	value = HDMI_READ(VC4_HDMI_CEC_CNTRL_1);
 	value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
-- 
2.20.1


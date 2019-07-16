Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3F96A362
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 09:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbfGPH6p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 03:58:45 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:39512 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfGPH6p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 03:58:45 -0400
Received: by mail-qk1-f202.google.com with SMTP id x1so16133226qkn.6
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 00:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/bOkXYUTo+ONsBE31JFge3XwJortkoB3vocu6FHYM2A=;
        b=pWOkLw3pLWVdNKTcexFuJNwO1Rs6vMwtGdzk7YOnhDuLZc2JazmcTvDk92hL6RLkso
         XZM1+xgPX+uxyd8iV2EUBQ2SwGZvsB/T5cDo6ebLmvMCDM1fauYCnkjSVzdEfgphhTcW
         PgOYhpNL+GiSO89u/p0gR63U+t6XT6uLz5BOWuQsY49aLznqqY3k77odsEN60rYFBI4i
         80nlJwW1TtFqgmdw10jJeXLvBaTr9XQdgfnIs4TQlcqsfzBd/df98Ttly5ppDcahP3Ws
         +FbkiyVWGMLmAPamvUXf0nYbyHIp7/MajEIbRld5x1N8r1uETaVbejUW6oBRKai4OSt8
         dTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/bOkXYUTo+ONsBE31JFge3XwJortkoB3vocu6FHYM2A=;
        b=aKc34YYbpL/fxggGQkqWSIq6DIxMtGVqrp7deDEpjNiY0vt7gpX54FH5PcC1n+ioic
         iO6f4CMfd9Xq4Tft2B0K/NqWlkYH1MGKBQBGfGdje0V3MUJ0w44fq9E735HJjDXRhU1s
         riDGaBFd78mRnVFkIwA6j66wfHarMNGgYqrNE1iJu6Hhp9mQpL4PIaxwdPrAaE2EM7Yq
         cMXrTVN9UxkAn7fRQwEaso0XYXRxwkhKyfFjfywtCAERr7sGoZ3k3HshhIAS91JPvaqd
         WbZ5zoDq1fMT74RrzQT0Ds5taIhcjpo32ennv97GfO6rFM46pJBiiYle5A2cHNptBnWh
         13kg==
X-Gm-Message-State: APjAAAVj6lLGophi1HYwExa7KBRg5O+cftMJdODA/IzjYy2Yz+HnAf85
        q1Oy23/7ggfFifyP6oBKYoGPCEOyQS/t+RlWaUUmN5ny89y/dprTmEgNa8bIIAc5RHBEVG3i0MO
        KV9aUWNJOXEBQDSsPommyMgc08XRBplQ/TR6OjRH/9ssKGlYehSgS+LIzXw53AlpzRXsU
X-Google-Smtp-Source: APXvYqwI/zGOTFbOLF6aPcaL4GYSjFXsi7OP6C1Dbq7ncIg62uYB0TNyatzhmdLofwbGYukVP5D5gkZgDzU=
X-Received: by 2002:a0c:ae50:: with SMTP id z16mr22121524qvc.60.1563263924052;
 Tue, 16 Jul 2019 00:58:44 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:58:13 +0200
In-Reply-To: <20190716075820.260202-1-darekm@google.com>
Message-Id: <20190716075820.260202-3-darekm@google.com>
Mime-Version: 1.0
References: <20190716075820.260202-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v3 2/9] drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        hverkuil@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill in
the cec_connector_info.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/i915/intel_hdmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_hdmi.c b/drivers/gpu/drm/i915/intel_hdmi.c
index 187a2b828b975..db7953ce49c8e 100644
--- a/drivers/gpu/drm/i915/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/intel_hdmi.c
@@ -2752,8 +2752,9 @@ intel_hdmi_connector_register(struct drm_connector *connector)
 
 static void intel_hdmi_destroy(struct drm_connector *connector)
 {
-	if (intel_attached_hdmi(connector)->cec_notifier)
-		cec_notifier_put(intel_attached_hdmi(connector)->cec_notifier);
+	struct cec_notifier *n = intel_attached_hdmi(connector)->cec_notifier;
+
+	cec_notifier_conn_unregister(n);
 
 	intel_connector_destroy(connector);
 }
@@ -3061,6 +3062,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
 	struct drm_device *dev = intel_encoder->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum port port = intel_encoder->port;
+	struct cec_connector_info conn_info;
 
 	DRM_DEBUG_KMS("Adding HDMI connector on port %c\n",
 		      port_name(port));
@@ -3113,8 +3115,11 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
 		I915_WRITE(PEG_BAND_GAP_DATA, (temp & ~0xf) | 0xd);
 	}
 
-	intel_hdmi->cec_notifier = cec_notifier_get_conn(dev->dev,
-							 port_identifier(port));
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	intel_hdmi->cec_notifier =
+		cec_notifier_conn_register(dev->dev, port_identifier(port),
+					   &conn_info);
 	if (!intel_hdmi->cec_notifier)
 		DRM_DEBUG_KMS("CEC notifier get failed\n");
 }
-- 
2.22.0.510.g264f2c817a-goog


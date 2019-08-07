Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4EBA8483D
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfHGIym (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:54:42 -0400
Received: from mail-vs1-f73.google.com ([209.85.217.73]:39959 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfHGIym (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 04:54:42 -0400
Received: by mail-vs1-f73.google.com with SMTP id v9so22825379vsq.7
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SB3F8TZYhXPlmL6l2l4pVDGNIiypiEu1RaEyzVgjWH4=;
        b=HqwAlDP4zZ5Wkiapdq9PLDACOU2zVk91pmEx2kkMo7fMu1s3oFV8wvnCPvNA2mEyll
         gEpu49b+ZgIVxaspKOv9gtlhFkyxDWtpU2KYqlhi8209tlibnNIywSW5h0NdveMhiXRJ
         l7Afl5iFRRxwG46+ARPEBk0qk4eLYp/HavJcbG2XvJT88/73D/TSV/3XFjSulULmjdfe
         Uc/u8YAa5dGzjmPvBIkPI4tapJuEsCscpjMZxu9xbFIv/QXvJKA7Xnixf0euzLqA/53o
         QUzAkmX3mlCxeTnjpGdKQichzZCaj1aW+dN8lAHMVVdfFaeoAdHZ79XJ6T9dcvCmaNFm
         GK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SB3F8TZYhXPlmL6l2l4pVDGNIiypiEu1RaEyzVgjWH4=;
        b=Qqv2i4L/pAHGGfdyDoTNa7urb1lGKpVI7ZxsMFTyhC3ui5VBVSAna9MpYMYxgQu6yA
         KZv+DsaPobpnSz4EWjqZBaXxUycUzumZo7GN6p3zMLwqiVxjxkXCrpTb6C5WuZUOh5CN
         Y1MDpbG4DJO1DWKqC0F+1dj7p12m/o4NoNS3mGAqcnWKBxCxLxTVbfp6mMcfIx3qEo5/
         6wOU5TDgp28KJXrfyeVpqJoMDKAmdSV/9raSN1dZ3S+WD6/YTRb6hmH1G3VkvZ4LRQgu
         Qa6Xd+pMfBW43aDHGjEH2ycjvul6dGNR5Jis0yDOd6iia+u/sqSE00+VcKa1O1cqJd8x
         pZTA==
X-Gm-Message-State: APjAAAWkAqcYzzKUnEKDnuMzHky/VLhJbMn8gOrPJ10BfFsj1xBGwKwh
        yzjplQWuP0VdgkKDX/lH1kLMDnO+quU6RhhLeWBbREOuO7YUnKeG9cnJk2s/fLODHoAEE7AVRDE
        t9o4Z5LpzGo/R+Z9y7Xbh6aBVNsGhXMNJbNGEiCRl+BScvTwinlSbZotl7ElNP5mV5EIn
X-Google-Smtp-Source: APXvYqyP2o76MbfNxMdFUXTI1TuwFxd+js9nuLhn0YTyHXliuwQoEuxqzeuXDwPx6U1qBjTKji8DJiQBpE0=
X-Received: by 2002:a1f:2909:: with SMTP id p9mr2932712vkp.23.1565168081028;
 Wed, 07 Aug 2019 01:54:41 -0700 (PDT)
Date:   Wed,  7 Aug 2019 10:52:25 +0200
In-Reply-To: <20190807085232.151260-1-darekm@google.com>
Message-Id: <20190807085232.151260-3-darekm@google.com>
Mime-Version: 1.0
References: <20190807085232.151260-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
Subject: [PATCH v5 2/9] drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
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
2.22.0.770.g0f2c4a37fd-goog


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88B548D11B
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 12:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfHNKpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 06:45:46 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:48466 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbfHNKpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 06:45:46 -0400
Received: by mail-vk1-f201.google.com with SMTP id x71so38019042vkd.15
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 03:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=suzgW5VW6Ng90prgpz/ghvx/fVcho6Pl4urYZ0d0Q0c=;
        b=Mv4TEqYa23uJDtobaDY6OSoe+shBIF5XVxXALV+QFVPinFL0cqfxETuiYnTHfikeS0
         beLlJ1+BBIyTAhKd1JqnpQo3tivf3SZ9z9nk7oObNoNce/6RSi9vJcKeItZ2Ap6i16TF
         sO16PNkbi+BrhuokCdIAorhyUJfLy4AtshgXt9ebmMQnJJ4M0k+SuwLsbI7Bsm4wqfct
         I0WU4v/LGzR40UT/Gan8eztP4Nk3Z3k9qcxdtOaJVCJucEb4gb4HXBGf3mNS7bdkYmZf
         laScErz8C4mR2ZvF1JR64oYbIgVooQF19lNDFb3YDWHqMnlxLTlgGCYy+McMlra+GR7H
         AOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=suzgW5VW6Ng90prgpz/ghvx/fVcho6Pl4urYZ0d0Q0c=;
        b=me5lP4AR0NLEivXO+SvzCPZxZQTk3xLauLwDOeGooEKB9gFwoBSRVtlZZRiyjByI5n
         dEd4g/XPY1CfzaMruZjAI2CIf89ae2NS+L1MyvgBbmGbDDGFYK3zbHhIf5Z8fAeQmaBI
         aPZ7cHpIg+8/bLo4Oew47xIyKWBx3gHlM+p03ur9oSvOSy5mBaKDSXgPwluU8qO4GmQo
         CqGW6T8UCYL6HT8p99gruSJm67lrR72KY1bqeD4xwIxr+MH2PEJdXV/5jhylRBT46R0s
         lOLItQwPptcDhLq/228H9YfPvRsRFFNz+9m0tiL4taLZ5m9cgvGKnH1NCqex+Gggpqpi
         ZzOQ==
X-Gm-Message-State: APjAAAUlCdeqx02P+hEnnFVUxLTFErd/S7A2EC1/2OAPSsLauZHdUsZW
        DcDRmjJUiDV/DF3dbrlYARFyi9K60g0=
X-Google-Smtp-Source: APXvYqy2T8ZzD5xkHgUSqk7raFy1jd0urGCFCByhxKXfqSbhhtzmjZm/8Oyftss+nvV1arSJ2jUJFkSDHpQ=
X-Received: by 2002:a1f:93cd:: with SMTP id v196mr11075937vkd.84.1565779544819;
 Wed, 14 Aug 2019 03:45:44 -0700 (PDT)
Date:   Wed, 14 Aug 2019 12:45:00 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-3-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 2/9] drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" 
        <ville.syrjala@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Shashank Sharma <shashank.sharma@intel.com>,
        Ramalingam C <ramalingam.c@intel.com>,
        intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b1ca8e5bdb56d..9fcf2c58c29c5 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
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
@@ -3068,6 +3069,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
 	struct drm_device *dev = intel_encoder->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum port port = intel_encoder->port;
+	struct cec_connector_info conn_info;
 
 	DRM_DEBUG_KMS("Adding HDMI connector on port %c\n",
 		      port_name(port));
@@ -3120,8 +3122,11 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
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
2.23.0.rc1.153.gdeed80330f-goog


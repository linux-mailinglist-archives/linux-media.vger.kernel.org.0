Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD3A8B620
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfHMLDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:03:44 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:36572 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfHMLDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:03:43 -0400
Received: by mail-qk1-f202.google.com with SMTP id t2so11441466qkd.3
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 04:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=suzgW5VW6Ng90prgpz/ghvx/fVcho6Pl4urYZ0d0Q0c=;
        b=mAwTBif5SbxpYaq2IikX38jkOeszeUCovNEYab4cHeVN+v697Wp2h3UHSPoj6PQEsx
         gWErNctQhzZZtEathfy//4/gyuApE+oiS/w6iVDZKnkz+CoezIRW4AxGxBuSUH2Vy5mF
         7xblnVtiwRzWYhRluLub87aOD2EYsxBrPidHFfxkOz9l5amojS0yJpWbP6Su1HrpxNc3
         kWT5XLunbopN/uGkEZe7JDJXXDr5wqe1v5U+JvF6UW36PXO+ZA9c2Z8M6mzWjWMmijH4
         c5f6NIh0A1W1Og+SU2pIQAHDrxScIO/Ezb2xFf/KG9z2fMUfhfmORLA9Q0ahhKKDrTGY
         PzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=suzgW5VW6Ng90prgpz/ghvx/fVcho6Pl4urYZ0d0Q0c=;
        b=kTSxeowKXTv/6kHJmZ+wmjqZDFxhTlg6CXshVUnwgVd/UiBeZjgzzT7Y0mCBU/cW7j
         vG863rV7ZgbVyVJ1ZQjvCy+rWpv+dMjT462eJOpwZnJg5aYQZ0ApafAtu+fiEVwcIcx9
         W7aL1Ibd6Gdnol9mydEjyxBaaj3q8oNB87zXQdMdrwlKZD9RmVhDTLQ6heBBBn7dq6Y+
         mX6Dzex6/Xl0i/QoTY5nQGxlKHOYjSoCwo0ShtfKgd1y7+l0e+NzgrGQKalYKYhH3ZAb
         mHDh2w2q5vBEyOFamZQwJvhooEsShe+YoHpIVjJnX5J8xjpLoISXQXbNiipkwhpJlJOW
         0CEQ==
X-Gm-Message-State: APjAAAWwRBRp8LC4LpcRIngQZwAgUT31A6G9FkwsOH89+7jclH9VdKeB
        ksSJiI5HwCx8JARH3JHx0y+7Musgp24=
X-Google-Smtp-Source: APXvYqxH0s5mm6hwQ1otgCG0chGHch91z1fgqZDyPSZRLZ3zhyi2y9k5EKBX3ssntH2nkvkmJsnKCHjxCiI=
X-Received: by 2002:a37:aec7:: with SMTP id x190mr7822514qke.420.1565694222662;
 Tue, 13 Aug 2019 04:03:42 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:02:33 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-2-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 1/8] drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
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
        open list <linux-kernel@vger.kernel.org>
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


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9B2CE0A1
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 13:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbfJGLfj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 07:35:39 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35645 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727757AbfJGLfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 07:35:11 -0400
Received: by mail-lf1-f66.google.com with SMTP id w6so9010430lfl.2;
        Mon, 07 Oct 2019 04:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m6p9TCl1q4PmCyDnNVWS8vM5CeKoKD3/SoQWgI0Yo4g=;
        b=QJNGZIpScWEOpBiUuR5ogk8EeSrxf1DIU3G2z0VagZr8pkWfPq18XB+4JPgD3xaQD/
         ZfdfWChvTTZV3o7TbXKuRM7qqTfe87O5SsYR3i3NDvFQvUKTis2Kd80xJ+1hOnOkqIP4
         SHLJoBMchklgCpaJOY2O3VDXt5+N9VYsXJGIliJtDEMR7L0gQiw/oL0YaHsKuAOPu3hW
         k9+CyWaYb+3/1FPLevRZdD39NOt903bWVmmOPAVJm8yc1V3ABm/NXXFV74qg7FmCUF1u
         e1oZdqYbaVwltnQblyShyffncaB39lgwbHbWKldxbhNaPIg6NbJ1Q0mVngXl+Wf+7zrN
         pzoQ==
X-Gm-Message-State: APjAAAXf7aLalpSjZE0Qp58lqwbu6rMZhx9fWB5C2v+LP7DbjzJZWs1C
        FTA0v4Wi1N7q2QZUExQAMyPHQNrzkik=
X-Google-Smtp-Source: APXvYqwQBw9XPD6p+WtacfDJ/7xNyoIqolTB5wKw/wcK1/uTSQnIYGe+xUlAzIIsCv6vaMQMqIU9HA==
X-Received: by 2002:ac2:551d:: with SMTP id j29mr16052554lfk.7.1570448108835;
        Mon, 07 Oct 2019 04:35:08 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id b25sm3666047ljj.36.2019.10.07.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 04:35:07 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v10 2/8] Documentation: v4l2_ctrl_new_std_compound
Date:   Mon,  7 Oct 2019 13:34:56 +0200
Message-Id: <20191007113502.11746-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007113502.11746-1-ribalda@kernel.org>
References: <20191007113502.11746-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

Function for initializing compound controls with a default value.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 Documentation/media/kapi/v4l2-controls.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
index ebe2a55908be..b20800cae3f2 100644
--- a/Documentation/media/kapi/v4l2-controls.rst
+++ b/Documentation/media/kapi/v4l2-controls.rst
@@ -140,6 +140,15 @@ Menu controls with a driver specific menu are added by calling
                        const struct v4l2_ctrl_ops *ops, u32 id, s32 max,
                        s32 skip_mask, s32 def, const char * const *qmenu);
 
+Standard compound controls can be added by calling
+:c:func:`v4l2_ctrl_new_std_compound`:
+
+.. code-block:: c
+
+       struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
+                       const struct v4l2_ctrl_ops *ops, u32 id,
+                       const union v4l2_ctrl_ptr p_def);
+
 Integer menu controls with a driver specific menu can be added by calling
 :c:func:`v4l2_ctrl_new_int_menu`:
 
-- 
2.23.0


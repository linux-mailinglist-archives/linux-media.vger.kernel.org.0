Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03865C326B
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 13:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731972AbfJALYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 07:24:32 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46985 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfJALYb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 07:24:31 -0400
Received: by mail-lj1-f194.google.com with SMTP id d1so12895046ljl.13;
        Tue, 01 Oct 2019 04:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m6p9TCl1q4PmCyDnNVWS8vM5CeKoKD3/SoQWgI0Yo4g=;
        b=WZGq39LcAqM2RyI8xaKcVy7beWCGsioVFTfkSZ7K3dUyocGqFyTLVTG78iwR3Y0brn
         b5TmIGbB2V6UAP6hx/m5VVBR4QkdZuQaZqRlM+SzFwEd7IXudLlz1zw7ivkmjf9M3rni
         vEscO6uECveAp3xN9LdK3gqsEEf8TaEtk8s3/KC/eihFxlIG28j9KBJyRjHQ+BYfO2tK
         9C1zQ3IO/thvxQsqINj2HzWF7Xvov4XmEftQDhNoRpcXLkAWhxa1JPJ0LmH7PkmGu5dq
         TBIlUtLXXbdOcj4Eu70wUzs12ahx6LXbKLczZ/lEctSLFTaDpbPEcPKeFGa0MVVZk/MT
         IDUQ==
X-Gm-Message-State: APjAAAWI0FFOsG8S7+pksGIDF0syfZMytz1LKB1CAp45+tsfPXheW4od
        CsWUGwbrCGZfslskYhbQKnlxsUe3E3A=
X-Google-Smtp-Source: APXvYqzP0LwvTal7yo+imIWg6vXdKi/4l+CeZPZLwf5Jhf0C7sMyFUpppOjQ6tRDPHx0XWC7NzRAaw==
X-Received: by 2002:a2e:4704:: with SMTP id u4mr15232561lja.203.1569929068899;
        Tue, 01 Oct 2019 04:24:28 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 3sm3853894ljs.20.2019.10.01.04.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:24:27 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v9 2/8] Documentation: v4l2_ctrl_new_std_compound
Date:   Tue,  1 Oct 2019 13:24:15 +0200
Message-Id: <20191001112421.2778-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001112421.2778-1-ribalda@kernel.org>
References: <20191001112421.2778-1-ribalda@kernel.org>
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


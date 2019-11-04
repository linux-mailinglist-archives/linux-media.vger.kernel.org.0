Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68A95EE0B4
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 14:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbfKDNKM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 08:10:12 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44032 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbfKDNKL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 08:10:11 -0500
Received: by mail-lf1-f68.google.com with SMTP id v4so12192009lfd.11;
        Mon, 04 Nov 2019 05:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VqMrwoYt+5Te3Fp0RTQohq/LCLMxxZa1B7gKAbWNkJo=;
        b=r/lVsDNgdTDGSHejiSjIrVqVkLlvN4erS8w9vtwjGPfRIcBAQzUDrqda25O7PnZHjI
         gfuNnZsLC/DrzqaU0k9RQ1ZeqFcLaw3Z7y/cXlaRCvXP3+JDOFydXPz2y3t2BfqIJJbU
         P936hdjxwxJQsX78F6laRsLcGIjtnpIO8E7zWmfRwAlJBufs/CEFgVvy6sB4PodAfu49
         YV5EhNOox8qBjRoatgHlgyWB//YPSsDInz/YxE99aaMopHqEZxkPQCZNwh+HYUq646vC
         8JoZy0NunGU1Xpb6hf5c3lW6SmTzmbWPMkQLiUEj0g8ry/c7nJYfgaSpP2VNH81a6kg8
         NTXQ==
X-Gm-Message-State: APjAAAWd6gk4Re97JWHod28+vI/O8qYLkMCjsxCoquVTNuHqlogOJodb
        lW42Dqv/eJneUSOrzdWljeQ=
X-Google-Smtp-Source: APXvYqwZMbg/m6nbHubf97d8K0xUKVmBD1Rr8yfixTsKSLakuNH3dxdbOTepGNGQ7j4VPnGRXPT5YA==
X-Received: by 2002:a19:9116:: with SMTP id t22mr15917787lfd.99.1572873009470;
        Mon, 04 Nov 2019 05:10:09 -0800 (PST)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z3sm5931801ljz.51.2019.11.04.05.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 05:10:08 -0800 (PST)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v2 3/3] v4l2-ctl: Support setting V4L2_CTRL_TYPE_AREA controls
Date:   Mon,  4 Nov 2019 14:10:00 +0100
Message-Id: <20191104131000.22359-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191104131000.22359-1-ribalda@kernel.org>
References: <20191104131000.22359-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

$ v4l2-ctl  -d /dev/video1  -c area=123123x233

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 95339561..e079c274 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -973,6 +973,10 @@ void common_set(cv4l_fd &_fd)
 					strncpy(ctrl.string, iter->second.c_str(), qc.maximum);
 					ctrl.string[qc.maximum] = 0;
 					break;
+				case V4L2_CTRL_TYPE_AREA:
+					sscanf(iter->second.c_str(), "%ux%u",
+					       &ctrl.p_area->width, &ctrl.p_area->height);
+					break;
 				default:
 					fprintf(stderr, "%s: unsupported payload type\n",
 							qc.name);
-- 
2.24.0.rc1


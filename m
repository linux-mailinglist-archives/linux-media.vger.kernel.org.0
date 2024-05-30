Return-Path: <linux-media+bounces-12271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3878D5201
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 20:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45FBC2829C6
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 18:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1821950A7A;
	Thu, 30 May 2024 18:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XW3TFjPc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D08050A66
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 18:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717095126; cv=none; b=AzhnacGtxla5ILpsqE8Mah8+WSqhTY6k6GByml32ni+eCwmnBxJ/LnWPGqNBes4/eDfjUV4NKvuAb4MewzJ1eUG5lHxzcDLjJ4vYeERi6Rc+mo26y0q0bCyiMe23fFAe4jCnep7kJKZMvF4f6yY9pEb/dn5wLHW5KJ6gO/XVoow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717095126; c=relaxed/simple;
	bh=bd2DLe9N2OjpPKVfnguwl0GmEbNQB6wgFMwwsncZAK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l6t6QtrIhVE8A8oIlgdHtL0Cn/Zd9xhYpRO8n9HH1DIZL3U93JuodQ97mu3Ke/6QmQ10Y1zCIWofRlvOx48Y7ckzPIyOc8ROr2XNEPD7MvW+RRTq5ciGvefpiw0cfIZ6SVWBPwIXIEJ6Hw8cxC/QxMlbyQdkKvN8Qryv9NkrWRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XW3TFjPc; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70231ac9093so970528b3a.3
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717095124; x=1717699924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kn8xFz7D5Zy147YOHT15TcEy6mHa3GyQX8vOqvdv/zM=;
        b=XW3TFjPco+veKUe1CF5+RPpN32sX6Lgpl1iuGj9VqhNntIEZrG+kErJsJNYDnTtW/c
         fvAh7zzmm+W5yPOAv9UX3VaZB8XgcFMj34MSEas8zNYVzB5SLizx88NPRQ2jRdo2Q4qI
         f9u+EOlONvE1a93wj+zwLtj0jwRjmGE6JXoWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717095124; x=1717699924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kn8xFz7D5Zy147YOHT15TcEy6mHa3GyQX8vOqvdv/zM=;
        b=sP7BPjJtX8PiiIAfELTtaHaOFHWz3bjtiu2zPvrMOnOTq2gAhYaakOlovm2kPRujCg
         HjJbwnJ9qyjy2GIsNt9QNKfndWNwEMHqFXU7vDqp7nInFw9+m68N2ZPBm51rc2qAsjyt
         6l10kzFWHrKpskAgTNufMFv+PmPq21h/aUkh/YlVYhWgEhcxBPwJXZrd3ue9nPjOjfzW
         0m2jab2OmPf2LFeF4Q2+b8JbjmPgj9iUBe2AZmOoJIxJiid8cd8N03lcKyc9BQTz1ACc
         uj05u3e7xMjW7yBK6hvKtp1I5hOaAcm2Bv7GCwefzoIj+/foMnAhC4SXcM6j5BGw7dEN
         Zy3A==
X-Gm-Message-State: AOJu0YyOf5DzRZYExbrn2+NQd1R2Y20gxWe9rC84vL7FRYjIuipQZFyr
	df5ypiIXKvEBekJ+i7Wm7tx3gwFapA9njhGyMTclpb+txOQSXrBJnixWR15PV5W20xbAweunjiM
	=
X-Google-Smtp-Source: AGHT+IH/KHAwe0bWbdNag1WDHwuOuW7mY8Yf3QieXCrKanLTKDNf6B+qKbQuSNNdwva6dfTSrdl1Sw==
X-Received: by 2002:a05:6a00:e8b:b0:6f8:caf2:eeb1 with SMTP id d2e1a72fcca58-702311345c2mr3167144b3a.15.1717095124264;
        Thu, 30 May 2024 11:52:04 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:b720:a50b:7251:1e59])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-70242b2beb3sm64568b3a.195.2024.05.30.11.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 11:52:03 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH 1/1] Documentation: Fix v4l2_av1_segmentation table formatting
Date: Thu, 30 May 2024 11:51:57 -0700
Message-ID: <20240530185157.1824672-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 786127b1e206..c9636558695f 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -3439,7 +3439,7 @@ semantics" of :ref:`av1`.
       - Bitmask defining which features are enabled in each segment. Use
         V4L2_AV1_SEGMENT_FEATURE_ENABLED to build a suitable mask.
     * - __u16
-      - `feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX]``
+      - ``feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX]``
       -  Data attached to each feature. Data entry is only valid if the feature
          is enabled.
 
-- 
2.45.1.288.g0e0cd299f1-goog



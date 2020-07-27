Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE4F22E451
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 05:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgG0DPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 23:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbgG0DPG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 23:15:06 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDAEC0619D2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:06 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d4so8589533pgk.4
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=058a05WSROmXWJ/AwMplhMnH3n9F8IfxZ10fUqkg9F0=;
        b=fflgwXAXZdGNZSIiMEjeVoWABML3dVH5aLIrF/6zyrbAIzEP3PnJIdD34v8yUctIMc
         pqoc2SIH/QCBMJYbLgYmiTN/VxFiOkV7Id0kN0UEBefjOfsyA2RXhovp5NGpQ6Kw1ElY
         7iQNzQX8Nogm+zKmyoZbuuM0li5sUSfQtkzAHHuBWHLHjk0jvpotoos68EFw/ESxqJyq
         hDFmWYtGbcR2H2EogjBZM0xWTs5M72dh7vwOulSFxb4vcjwWIu8bYgkRmhVFaWn5kPoN
         b+/3xx1Pfde08KuOtbDVe0+SB8egdlipSMBtyQmRERcFKDM/+Oe8nUiYDj0e1ZYoFGYu
         8O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=058a05WSROmXWJ/AwMplhMnH3n9F8IfxZ10fUqkg9F0=;
        b=fMwl3eR/J+aAINPjUUCKA0RJ1pJz2NEcVlNBGiapWZy5QY9yNm1/bbdlDHNTmneHi2
         XR33FeCttfh5R9cy4yOypjy+KsrJYmG2Z5ER2mxxyw4EOx0aPEpR8scgbgIzDkkF4xR8
         cR67LGrEXSTX84Q+JLeIvB48fGnKG8vzsxD5No03wioX6Y9e7cJmDaitiIQ1hy2YWxHR
         KyNfkPCmvoEAwtiowYQ4uQSzK13S4EE3zohAmJgHUEX/rxpKP/D8IKYwCPWtE1mNmDfG
         m1pp0z3cIUXYD2mbQc7r5sFsOwdbkJ0e4tgBpOsUqlgZ0iTief/FUlIhTGk/gl3WGyNh
         0s7A==
X-Gm-Message-State: AOAM532fkvDdQoBiGI3YsCRZkUkhKt8h+lRVYsAfOauqwJpVST/aUCDg
        3weqlQrUAH5QLIek2H3UwsJkQU3hYMU=
X-Google-Smtp-Source: ABdhPJx3RZU6cJTBbtnRPkSbGFHNMQbNAlFWy7ZS0/gE69jzZPs+1aeOB86hFWfLVqTm7cfdlQvDbA==
X-Received: by 2002:a63:e24d:: with SMTP id y13mr18301093pgj.248.1595819705900;
        Sun, 26 Jul 2020 20:15:05 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id t126sm13259345pfd.214.2020.07.26.20.15.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 20:15:05 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 8/8] [clang-tidy] use explicit for single argument constructors
Date:   Sun, 26 Jul 2020 20:14:56 -0700
Message-Id: <20200727031456.232955-9-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727031456.232955-1-rosenp@gmail.com>
References: <20200727031456.232955-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with google-explicit-constructor

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 436de288..5df71b80 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -218,11 +218,11 @@ static bool fill_output_buffer(const cv4l_queue &q, cv4l_buffer &buf, bool first
 
 class buffer : public cv4l_buffer {
 public:
-	buffer(unsigned type = 0, unsigned memory = 0, unsigned index = 0) :
+	explicit buffer(unsigned type = 0, unsigned memory = 0, unsigned index = 0) :
 		cv4l_buffer(type, memory, index) {}
-	buffer(const cv4l_queue &q, unsigned index = 0) :
+	explicit buffer(const cv4l_queue &q, unsigned index = 0) :
 		cv4l_buffer(q, index) {}
-	buffer(const cv4l_buffer &b) : cv4l_buffer(b) {}
+	explicit buffer(const cv4l_buffer &b) : cv4l_buffer(b) {}
 
 	int querybuf(node *node, unsigned index)
 	{
-- 
2.26.2


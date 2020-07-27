Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7175B22E44E
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 05:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbgG0DPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 23:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgG0DPD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 23:15:03 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6E3C0619D2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:03 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t15so8413727pjq.5
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WrFO6Uvp2AEddcqN+SoPz7E90iI+QyQjIXS0T8c3T14=;
        b=FE0W1qL5iuxA4zJEJ4px098YLqKPGzcRbkACPxMn5EWkFEbXD/jer52Yt9LZfwmNfY
         JWb1y8pQgTw0jE54p3INtIJNx+Li8pn++pcZmMXrJYJx29zMkL05lWMJAocZtQ3Tlwb/
         PhGkOAUER3RaHhNWgvkUHdIaDiq3B9R5+Rl3lWaS7OFR2gYBSZCsIR8QgbBxbFl7Pyem
         4kuzqPTrdMvg0OVQT9NxLydoOMfFb7ZWupET7JMW8KQXJfWQsJSLyXYT2pWEYyoF35NK
         hSUro8mTz5fBanrk/IFtqqYGRp7BdM7XNkKhHJ96/16lppJz09+RzTn314pzR+i2/Q1o
         xi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WrFO6Uvp2AEddcqN+SoPz7E90iI+QyQjIXS0T8c3T14=;
        b=hXBeKveWi1sT4eN01SLhgYMdEfatnXUQzkIWX3JR2ILnK6U/r8isFBrPj//W3cVoaV
         0xp5zjsyJYTaF7VESzDMMebt14t8eYcIblagsMG57EHM8H57xI66t46mzFmRbW7FWieZ
         B/7FtHnMvJCexfGKnhTwe/ipnqr1j6GGp3kImW+5YEalOSteWb2R/MB5CapuB+IWIPiZ
         O1oc3Af0UHndWQJZ+jtP6WQ9XIks9eqvItQbGfUe+vUfHGyjK5PFcMqcSqnYAB9cmbWg
         y0evr1D+rdwxGppZVtobnqo8KRYYx6vIiac2QUkKs1Bp5EKmc+aD/iMTRl5qeLKJOwGH
         hYaA==
X-Gm-Message-State: AOAM532rlWfOTtH/hznEcUtbVsHmcFAPBafT5fzUxv+DiDWr9vdh+xdp
        JNuwHjD/Ft5rHqPHC2pO06MG2p8PhzE=
X-Google-Smtp-Source: ABdhPJweYPFQ8jyaOuUHD4sTddHimksko44jUH8T8lor+mabqC9/mRoINRusV66eJD37D8jETxD0oQ==
X-Received: by 2002:a17:902:d352:: with SMTP id l18mr18175758plk.56.1595819702757;
        Sun, 26 Jul 2020 20:15:02 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id t126sm13259345pfd.214.2020.07.26.20.15.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 20:15:02 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 5/8] [clang-tidy] use emplace_back
Date:   Sun, 26 Jul 2020 20:14:53 -0700
Message-Id: <20200727031456.232955-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727031456.232955-1-rosenp@gmail.com>
References: <20200727031456.232955-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with modernize-use-emplace

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-dbg/v4l2-dbg.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 8b23752a..c4a7b942 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -499,7 +499,7 @@ int main(int argc, char **argv)
 			break;
 
 		case OptGetRegister:
-			get_regs.push_back(optarg);
+			get_regs.emplace_back(optarg);
 			break;
 
 		case OptSetStride:
-- 
2.26.2


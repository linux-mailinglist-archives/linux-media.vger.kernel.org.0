Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F4022E44A
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 05:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgG0DPB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 23:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727985AbgG0DO7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 23:14:59 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCFDC0619D4
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:14:59 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id j20so8267037pfe.5
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5OX4XYSjGf4BSZrMxSFN5I6MJZK8anAdKIFRJQASvGY=;
        b=Lj6/TKnsGR0gY3bIHW+VyqaoH/vTQQbdN9un/9QRaHH823kY8cW40XnfgTgWZRdWrc
         ZwTvQsLJf97l+bf29NVZ3OdECRU4KaOSadb1lQYPv4Xd+YD9OYKlXIJhqt6ZAphdmGif
         OVfFyPpjsf1vYAw0bUl/MnRqRy15hL0jS9vb8QXscvsugx2l+co+x8iUb0w6wNvjk7/T
         Xsq9+3KrS6Tm3c8Nok6kYRVtn1JL2R4Q8WetNrIPqUciutfuL0+2eH0wZ9hOwK+wGJP8
         YVXoie1I6lTNvVxPUk18wfb0PIKShYzjocRGUeuInybnYhAU1mI0Cx/k8fiKWqwaUdxM
         jLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5OX4XYSjGf4BSZrMxSFN5I6MJZK8anAdKIFRJQASvGY=;
        b=NwRpKaordtEgKzpD6/DLnUL3WkGUheAsBodbgZcMxH+ZuwwQo2CjiWR/3JcNBb4wAF
         b+6le35nWVpRCf8k/8hecHC1/TOO9Uc7h0gOZTlTYpDKXj9qc3l6gCSr2QxDevlg6V/I
         lKoWJR6MKA9HI2EetXffyGIOZ10GlgOjrysO7CKi7R2Qw4XwRrzM4qyr9+74RHc2BC0q
         AwjIGCU77PkSjEY2b0YfOfxqBcAmvnbIXc5kTSD2MM5uk1RQmbo6xtg5/CwGrOMGHM/7
         Sb1wuzCtpBiPlbIkqG2b7UIQqDAqTSYg+2q1o3ECFCkJTYaVf/bRkP45tycNCT0QO5MQ
         hyIQ==
X-Gm-Message-State: AOAM5308LD1lYMaQXMLTpesubD4mvD16wBYoLhd9lqILzWYuBw2xQffr
        GT6A1YO7muBkCCb/avcvDW9tnYFbFaM=
X-Google-Smtp-Source: ABdhPJxu4wBhZO7X2SgcJVDoOQJjiTUopoL1YBqck6rMIfwqt53VbUL1GkzJTpWeY3XKBQOmfMB4kA==
X-Received: by 2002:a62:fb07:: with SMTP id x7mr19450916pfm.252.1595819698767;
        Sun, 26 Jul 2020 20:14:58 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id t126sm13259345pfd.214.2020.07.26.20.14.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 20:14:58 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/8] fix GCC enum warning
Date:   Sun, 26 Jul 2020 20:14:49 -0700
Message-Id: <20200727031456.232955-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727031456.232955-1-rosenp@gmail.com>
References: <20200727031456.232955-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wenum-compare

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/common/v4l-helpers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index e093e717..edd21c16 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -877,7 +877,7 @@ v4l_format_g_hsv_enc(const struct v4l2_format *fmt)
 {
 	unsigned hsv_enc = v4l_format_g_ycbcr_enc(fmt);
 
-	return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
+	return hsv_enc < V4L2_HSV_ENC_180 ? unsigned(V4L2_HSV_ENC_180) : hsv_enc;
 }
 
 static inline void v4l_format_s_quantization(struct v4l2_format *fmt,
-- 
2.26.2


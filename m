Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255DB348E08
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 11:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhCYKak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 06:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhCYKaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 06:30:16 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5ABC06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 03:30:14 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z1so1800039edb.8
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4LQrkxh9XKHSRaKe0wqWIdW7sIgBGHX5Nu3p1oqv7x4=;
        b=ktbIalbIIhDCdyngNwWDlOVfaSjCsoG/22ZJREjlWiLrrXgprFTB0BRCCY5DIOZcg4
         nVaPlzjlWEjDEKW6czVHMHIayNA/dLCes0Q4X7dg/t85hzwjLtLZbYjow3EZdOHGinY3
         Ps8k6UduYvXcIs2ySVvKAmWMWFh6bv8ZeyZjRboLNqMTh7J/fGSfdketOF+kKtFiyunk
         wvEbAaHr9bcZ29A1UKgGrLvRqbeR8pki0wCOph5VuBPlK8yxgVRIar3rfezQ0cNozVHE
         v+TiHsx5GUm5HaMQMBEXLjlv8vc/qrd8kotXON8EIbKGzb6c8htA30rTKBxLdt5ApG34
         I0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4LQrkxh9XKHSRaKe0wqWIdW7sIgBGHX5Nu3p1oqv7x4=;
        b=W2YypOmIXPBHBns+F+E15eHev8RzWeY6T81nCJs00m5OxMiz4ms8zcRP9tUfU46WFx
         rvnHaEC3q1rCwmrNPfq96BH//x/cMGPDETS7uyMej6yi4sUGxbfFwMO+D8vDeK5qzzGv
         AX/sGkqhT8reEzSWusB+x6auiCp2z37dq+4ZhprTkNf1JDuf/BPrSaGl+vrST/zqh97A
         DqimsEPXh5rxyTeYXpOMmOFZ0E3s5eK1bHFf1URSdDBmmTSef0PXX1EBfTjeGrm9DSFo
         Nbg9KTU9VqLEWkZEwnpdSwXwHGq8SFwOfkbFk9uXoZzz8Awclz6ehoQsW2/+1o1Hri8k
         FY/g==
X-Gm-Message-State: AOAM532H6v+QdFQqkAIdZY8Ubka9Q47uehIOk4vQcNg+YpKTHTSI6Lbg
        yS/y28rNPWnE58fiqPxr5FpxH4kcr+c+y+50
X-Google-Smtp-Source: ABdhPJxAqMqXxBiv+v4j+0aErmfQrk/eYif57JfWpxs2WNj4nAW7w2+GLoMEjOL6MsZg2Wo06Q9t4A==
X-Received: by 2002:aa7:cd63:: with SMTP id ca3mr8274164edb.265.1616668213051;
        Thu, 25 Mar 2021 03:30:13 -0700 (PDT)
Received: from localhost.localdomain (hst-221-104.medicom.bg. [84.238.221.104])
        by smtp.gmail.com with ESMTPSA id z20sm2407661edd.0.2021.03.25.03.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 03:30:12 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] v4l: Cast timestamp tv_usec to singned
Date:   Thu, 25 Mar 2021 12:29:52 +0200
Message-Id: <20210325102952.1126952-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some of the MPEG4 standards allows negative timestamps. Correct
tv_usec cast to s32.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 include/media/v4l2-common.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 3eb202259e8c..1ed61416003a 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -544,11 +544,11 @@ static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
 	/*
 	 * When the timestamp comes from 32-bit user space, there may be
-	 * uninitialized data in tv_usec, so cast it to u32.
+	 * uninitialized data in tv_usec, so cast it to s32.
 	 * Otherwise allow invalid input for backwards compatibility.
 	 */
 	return buf->timestamp.tv_sec * NSEC_PER_SEC +
-		(u32)buf->timestamp.tv_usec * NSEC_PER_USEC;
+		(s32)buf->timestamp.tv_usec * NSEC_PER_USEC;
 }
 
 static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
-- 
2.25.1


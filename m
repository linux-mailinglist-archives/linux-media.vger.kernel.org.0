Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0909308417
	for <lists+linux-media@lfdr.de>; Fri, 29 Jan 2021 04:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhA2DGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 22:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbhA2DGi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 22:06:38 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EA4C061788
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 19:05:21 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id n10so5663176pgl.10
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 19:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zTNb1lTIEVQ6SY+1PM+jItpjx6YB2483ibK9X9oBYPQ=;
        b=z1kwyFNg5hSYRi20ZvZ8wuUsM10FJZoI8McYKRlownqrb/9vwSuD19hHoANIKl9o7S
         NM3r0rFYtS7BoYRIxUKv2hJYefP+6PduFPKe6sNVWE7NJvVoSFSo+oGB5ds50UhCUA9V
         SyK9daFDnwbPsOxmmmogF/izeRWdoG3OgCQ6k0DmEgOaW1qa9ZwCI/06RZVukTBn91KD
         jWkK57VznZPmUOrJGfJnxT8iH5+1O3xSd8qHCSqHOszD3n07tm6upXSk82uB3LtU1IAy
         N+1l7G24LEncO+U+I1O4bg5Gt8C/bhkcHAaGe6YPBKuBSfvXS+AFhnzu9hoyFu2QqGYg
         S+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zTNb1lTIEVQ6SY+1PM+jItpjx6YB2483ibK9X9oBYPQ=;
        b=fZE2iIPIN4tbfwhA//TEvBfZzh400Hsayt7Yb1Rj+ryNk9Q5SLr/rWFOw6ynuGxQZM
         HPZioxuuhbmwMpS4gdEo8jZbEuTu8SOSdNEiVgGJ3C549WyyFbfWnVFhsv/jrokM4Jhx
         +sNkD/qiFL5hajaYpIv1c8FUuTPEHg89zXFspw57M1dnhXFHvE0kjidRFgGh2kQqjejy
         RxTi36eq2ybfzyt5RvD0Ft8QHzqxCAyeuqyfVSo1uKjc6AnE3k4aB6jdlyA+VejP/tZA
         lLSxXVPgmxupfd9BJowZkTaOi7EOuEYxeG2tRlsmpKbaRn1XqOGqx0nRmrX7QaWmcAak
         6C9g==
X-Gm-Message-State: AOAM531mXezdDaIJBNzf1A3xZcTcfYApUQcTVKdeBknNaKiGpAI8ZOr+
        ollHNrCCcAa1WcnGqW/kQo93qw==
X-Google-Smtp-Source: ABdhPJxgU85/WQXQ6xIZh5kol/FeQ53pYxb2sLTuRnfE+yO6MQ1sib5AHGRb02vCaC8rjeUx7mU2rw==
X-Received: by 2002:a63:f404:: with SMTP id g4mr2518687pgi.114.1611889520497;
        Thu, 28 Jan 2021 19:05:20 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id y75sm6854496pfg.119.2021.01.28.19.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 19:05:19 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Brian Starkey <brian.starkey@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Laura Abbott <labbott@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH 3/5] kselftests: dmabuf-heaps: Softly fail if don't find a vgem device
Date:   Fri, 29 Jan 2021 03:05:12 +0000
Message-Id: <20210129030514.1231773-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129030514.1231773-1-john.stultz@linaro.org>
References: <20210129030514.1231773-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While testing against a vgem device is helpful for testing importing
they aren't always configured in, so don't make it a fatal failure.

Cc: Shuah Khan <shuah@kernel.org>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 .../testing/selftests/dmabuf-heaps/dmabuf-heap.c  | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index 46f6759a8acc..8cedd539c7fb 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -184,15 +184,14 @@ static int test_alloc_and_import(char *heap_name)
 	if (importer_fd < 0) {
 		ret = importer_fd;
 		printf("Failed to open vgem\n");
-		goto out;
-	}
-
-	ret = import_vgem_fd(importer_fd, dmabuf_fd, &handle);
-	if (ret < 0) {
-		printf("Failed to import buffer\n");
-		goto out;
+	} else {
+		ret = import_vgem_fd(importer_fd, dmabuf_fd, &handle);
+		if (ret < 0) {
+			printf("Failed to import buffer\n");
+			goto out;
+		}
+		printf("import passed\n");
 	}
-	printf("import passed\n");
 
 	ret = dmabuf_sync(dmabuf_fd, DMA_BUF_SYNC_START);
 	if (ret < 0) {
-- 
2.25.1


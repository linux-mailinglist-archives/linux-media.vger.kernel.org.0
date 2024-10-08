Return-Path: <linux-media+bounces-19258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C57994F4D
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49FC51F213D9
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4B11DF964;
	Tue,  8 Oct 2024 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TW0g/tpl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352221DF25A
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393841; cv=none; b=U19d4WHpmGcI/eMaKmO/6Iz+10JACALOzM2XHZ84Isk7ijG7jDjrzPAG1zFDCuhVQp3U508ySpGqVGr/fWDiut/WULMEC5PCi19/kATo0mBA7RVoyI146GyYw6X2SMRMrmsaWdBoR9Em8uoQvQzXpkaPI9f1c/sDnjIIxNFpHfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393841; c=relaxed/simple;
	bh=FLrsFGYpFpG3rnLAk3ibCCInf9I/RedbZNvRJH3/q4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZZdjHlxbb4k2d/PQQC0wWHuF1XR01zwrtDZU//nDFKYwg/Zeh0FtU35tfnPnDptNC8fiGj/y42zlzxfHK6EB+pSIgmdmGKeD2EQ9Wm2qaQ9BPQ7JDmL9WMsn424tqergKTU5c8wfI9iOfUydziBAToxTvE36rQNwPFiLgf/1hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TW0g/tpl; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53992157528so5991618e87.2
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 06:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728393837; x=1728998637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FqMEWBgPkpinmu3Xy53ts+zqhbl6e3Rowk9+IYdzL+k=;
        b=TW0g/tplVFm7tF4J0WHDPVtCPVTFI2xvImN36mLByO/UhCzepU0M9f0DQXYcALBsh0
         wt981TKcoeGNusMtkRJH0WeJvLWieYKjqJFLyrnCT7xSp/YVfhSJvbkKgjVGpMGuxucJ
         2SkfPDZyt5F9Lbfp7t9aK6vpTpckxjIflSuxGiZwD9mQSv+S3m5sXtNGSkhb19d4C3jP
         Z/UeP0Ofw72to7tQWq0M1xofJ7v7dHVRGsRzFZzDbCfJU9WnSDptVAHCPrK4p0cAOgYc
         Ppy9TKIVG7gNvW5Ictrj2cKDj+h6aof7JH9XHuXTMiznVQP1rFuVvra5xWWrzzb4DUE7
         IwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393837; x=1728998637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqMEWBgPkpinmu3Xy53ts+zqhbl6e3Rowk9+IYdzL+k=;
        b=Y46eScq0h+7aQUtywYftigtIxOANXrOH8fbcG3cbhQdd4jgEvfIF43B+3xonpdg9VY
         IYTnF6f41S+z6p/X28iCWqewUWvtnBY1GNhMJ4epR4EjLSyynM20NXYwk6nbUsLWeBCD
         LQZFdbozIe2XOfSrZJchz44UaSzDY4f63VxxJDA287E1hlVH+4tOuXfffatQKRmUzWTp
         gpjL8rmhWgghRgPKCUJnu3iK3e9XOVFDGaaXXqy7BlvhXYCKLHv8a5qS4rwEouW0RTPc
         3/WdBULlNZUtgxjiF4P9ETFmJJCCQioWir01phJj0iTIcN0fIl2AS9HjXyK+hPqqDJGN
         nlxQ==
X-Gm-Message-State: AOJu0YzKgIxZfBv7P62bWjdhcMF6vjPrAu9jbTOtyAMkGAdI1DmWaCiy
	uaGdiyq1jPT5jQTuwovEZ/JmRuiGbwbkGEBH8O1nlQmAVPKVxFdv+dzNq1lDmq/zZ3x7h6UBje4
	M
X-Google-Smtp-Source: AGHT+IGTrmR6Go3tMLWtCf19xCn3o+ZYYVGNBLCmhm6rAHH7pTcQVlAEv138/mdbkuBtl/3qqDmaog==
X-Received: by 2002:a05:6512:3090:b0:52c:8abe:51fb with SMTP id 2adb3069b0e04-539ab859359mr7832885e87.10.1728393836991;
        Tue, 08 Oct 2024 06:23:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05c13d2sm4325305a12.58.2024.10.08.06.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 06:23:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: mchehab@kernel.org,
	akpm@linux-foundation.org
Cc: linux-media@vger.kernel.org,
	klimov.linux@gmail.com,
	srinivas.kandagatla@linaro.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org
Subject: [PATCH] MAINTAINERS: mailmap: update Alexey Klimov's email address
Date: Tue,  8 Oct 2024 14:23:53 +0100
Message-ID: <20241008132353.68767-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My new address is alexey.klimov@linaro.org

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index 54580db9c59b..debbf01371b7 100644
--- a/.mailmap
+++ b/.mailmap
@@ -37,6 +37,7 @@ Alexei Avshalom Lazar <quic_ailizaro@quicinc.com> <ailizaro@codeaurora.org>
 Alexei Starovoitov <ast@kernel.org> <alexei.starovoitov@gmail.com>
 Alexei Starovoitov <ast@kernel.org> <ast@fb.com>
 Alexei Starovoitov <ast@kernel.org> <ast@plumgrid.com>
+Alexey Klimov <alexey.klimov@linaro.org> <klimov.linux@gmail.com>
 Alexey Makhalov <alexey.amakhalov@broadcom.com> <amakhalov@vmware.com>
 Alex Elder <elder@kernel.org>
 Alex Elder <elder@kernel.org> <aelder@sgi.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 9ed1921f6bf2..bc5e039a6229 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7902,7 +7902,7 @@ F:	Documentation/gpu/automated_testing.rst
 F:	drivers/gpu/drm/ci/
 
 DSBR100 USB FM RADIO DRIVER
-M:	Alexey Klimov <klimov.linux@gmail.com>
+M:	Alexey Klimov <alexey.klimov@linaro.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
@@ -13633,7 +13633,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/m88rs2000*
 
 MA901 MASTERKIT USB FM RADIO DRIVER
-M:	Alexey Klimov <klimov.linux@gmail.com>
+M:	Alexey Klimov <alexey.klimov@linaro.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
@@ -15790,7 +15790,7 @@ F:	Documentation/hwmon/mp9941.rst
 F:	drivers/hwmon/pmbus/mp9941.c
 
 MR800 AVERMEDIA USB FM RADIO DRIVER
-M:	Alexey Klimov <klimov.linux@gmail.com>
+M:	Alexey Klimov <alexey.klimov@linaro.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
2.45.2



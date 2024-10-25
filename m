Return-Path: <linux-media+bounces-20318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B31CB9B0374
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 15:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DE9E286722
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 13:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC5B1632F8;
	Fri, 25 Oct 2024 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZOYInIud"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF41632E2
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729861929; cv=none; b=ZZuwF8zSCNsn8pMXhnoEgBmhlcfghZfovWreKawidnk3b32LcwURtkgnfYN0Fj34TDtmIiGRXG1u69e/raJoyLRLWfpHHjiOSemZbmQ0pDeDv09DyKxZrwXWCrQY33Ds4ueiifcPjJR0uQuLPvf9mZWiimuH5OSULThUTGliWZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729861929; c=relaxed/simple;
	bh=W7friAtVQRffiLbA+GCXrUMmE0PLT/AOO5U7Kwjd/Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xx0QnCSBRQQWrb5YddRpZh43DOI0XtqyYefi0jJsEK82UYcMZcz/lWbMV/THWktnJ1FyoGWNRWBBBqrHwepvK1jyIo3ah9fVQIvqVPu7+vsdBSWoplg0FpJyzbzx1hKSz+tXa/dnzoiDUWMAeYgLc0fEMJYLKfHc3jF0a+KvX5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZOYInIud; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2bb1efe78so1339853a91.1
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729861926; x=1730466726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DRMnXvsHsbg1WtETmmqGXSobfWzOVAe6LmlCeFE9Ce8=;
        b=ZOYInIud4I4ffMLGb+envW7ak13Ga+t18iIziEbnoPLzIhXPnbztaAlU+tfEkECBMX
         WYDZnqlniAMPXjRZrscQwa78OcDKubCwTKl8MM9Kuza1qKIJdGl9i0KbqrCUz/T25yIl
         HR8hz2Tr7NIScu55qdsGdqgcDSAQXLHotHvKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729861926; x=1730466726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRMnXvsHsbg1WtETmmqGXSobfWzOVAe6LmlCeFE9Ce8=;
        b=nokUobbc0VhKa37Ns3UjSfj8rrvHaxiNvzdsU+fs1U6HYdSNce3EzGGGaw2AH+A5n1
         Z5eZHqXZIVuFdA7BW+qwT08dcxy6YwfIgm5v1TfhkfpUrOF2Lx+AjgtY2bOq2mRtOUB9
         LM0rsBBQiFRwCIcWz6ItSi/8eXC4O4QPqwaqHtTo0f05pSKeV3g36ce9+bPH3PRGIz0n
         tW3medU+s4jWV1IwYGUYJ/2JnPnz0HPYx9i/UgQ2SRUc5YcgC7gw8JRzyToA5Fbc4+KW
         LqTTQ4oAKPpAs6ehsxwI0AypiRY/DOwdFGrc8uu0pcTZJGKnHOkdM+fAq2Jbp2Fg1Fjd
         sJOg==
X-Forwarded-Encrypted: i=1; AJvYcCUVvTvyFH7ECHGlR1Hj6HpXv+eT/6Ph6gYD5dJFdzqa3yqbBXWxzbOjCb9eeKypB5Ph05cWL1H5YFLZSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfc7g+qiXxUjPZ1l9BVwvXgVIinBNdHZRX9apmb2zViwbktAwd
	2P/D+rLcPSpm1DrPQ1rm1F3giw+GWj54izaU/R3dg/GeImd0EbROiEBSEUUZ8A==
X-Google-Smtp-Source: AGHT+IH6fGLpM4dLLrV3AYDO24lReXJjLEFiphcBXr5XktHSLdQkl0iv0BpZ6miTQucP1s00qgHQNQ==
X-Received: by 2002:a17:90a:604f:b0:2e2:b94c:d6a2 with SMTP id 98e67ed59e1d1-2e77e45ef43mr9071317a91.0.1729861926408;
        Fri, 25 Oct 2024 06:12:06 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3556517sm1364203a91.8.2024.10.25.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:12:06 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 0/3] media: venus: close() fixes
Date: Fri, 25 Oct 2024 22:11:48 +0900
Message-ID: <20241025131200.747889-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of fixes for venus driver close() handling
(both enc and dec).

v4->v5:
-- also drop venc_ctrl_deinit() (Bryan, Dikshita)

Sergey Senozhatsky (3):
  media: venus: fix enc/dec destruction order
  media: venus: sync with threaded IRQ during inst destruction
  media: venus: factor out inst destruction routine

 drivers/media/platform/qcom/venus/core.c      | 25 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  2 ++
 drivers/media/platform/qcom/venus/vdec.c      | 13 ++--------
 drivers/media/platform/qcom/venus/vdec.h      |  1 -
 .../media/platform/qcom/venus/vdec_ctrls.c    |  5 ----
 drivers/media/platform/qcom/venus/venc.c      | 14 ++---------
 drivers/media/platform/qcom/venus/venc.h      |  1 -
 .../media/platform/qcom/venus/venc_ctrls.c    |  5 ----
 8 files changed, 31 insertions(+), 35 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog



Return-Path: <linux-media+bounces-32402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ED7AB5702
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59DFE3B85EC
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC182BDC32;
	Tue, 13 May 2025 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpn1+7So"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD882BE0E0
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146256; cv=none; b=VW//mHtSl44b794E8EbjAJ29ncvlyVfObBtyXmG4QrojrRQ6VRDwhhVZpsboQNVQsoPdiPcNNhY/Sd9h1ufphPR4utPZCUMR65xffW23oE7JMRFEkf6eIp+1bNDQAoBmLYSpYQvY7ORpwh0ZOQ/WCnMrZKfs6x20zG3adrS7dE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146256; c=relaxed/simple;
	bh=xuTTjd+g462s92piJzO152zSuWtKaJvpLpSJbcZ7r7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcDVTjc4UltT2R+33uCRiPzIOX7/9p6/uyzgktJ4Vcsxrwb1qtWke1EOo+QmgO9gpJ9h+OyWL21t7B0ts8/xxZzUEby9xuwvLpaRbQkVBQJ5e0f4kQUMgeHuSpyxwIF+T4aNEVAUUG3Dh3T/HRPbQgo1Kh++eEjxqs7LsK2q7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gpn1+7So; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54fcbc68213so644357e87.1
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146253; x=1747751053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jbp09rP7yjvsBo1LKOhlRvBKJcU01MMyhu8zUDGFwjs=;
        b=gpn1+7So1bBB1yAq2YqdQad9Eu3XhiQ7KYKOOAYWGY9pP2EV//WAtn0+6+HPoZFLkl
         pf2qeUQy9IRPUl5IGo3lxZji6UVl7Fxr8W2wcvBpuBPPiz17LQzfHMAFXfAvH/a5RSu8
         OtQjxAI8fnpDSvDHBxFSTFdqwTAMGeaATx3iuHSRVvBhPNbMOj6Ied3VnaMcgN9lTLAS
         vf1Fe6kwcTux7TkxeWOkNjVD2yvYPZrlV/L3MPmRvGLkE4k83CRPOvZVr5h3HZssv0OP
         zsHA+NKv+XpUjMbSVIqMRjAjyl+7Ruv4io0fnww1yRASn25XVBXeQr4DDAmx77Lz/eLM
         CMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146253; x=1747751053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jbp09rP7yjvsBo1LKOhlRvBKJcU01MMyhu8zUDGFwjs=;
        b=KCrpx54trpRWTNaKdDJbcdx6QkRiY5/8B9/3Km8MogW/GHd0S0bNoLPoOPjW4wsWDN
         zYaeoRxVbsk9ikFsssZKUOVpo0iMyiBCfF4K57ONBwduA91IPbqXd2wUC/wC3hufuMbN
         f1vV8rvFgwTkB62R4efcxYF9y3bG+NBA5emVEzK2IDeld8DFP+JXlznCmnEG0GkKk7Gc
         QJqzPWIIUh/gM2gJQBU/fX8zTggJyv01c3GMb2wkScD9brnTxVo8IMsbq59KsHhf/bGr
         nGHi4GkqZnayH64CZdbRg3foMgjNwLZzsNK4+qs/aoeqAVvSizL+M1hAHdt7kCuV9Y3r
         YteQ==
X-Gm-Message-State: AOJu0YxjpFpGh6C7js1Evy/mMb+BtMUPLLDs9vv7S/YAbawcTVMu38IU
	E5SsHjtYUzdMt6bH5tnSOYlT4Gsv/xV86WD0i9ezmS5PaWlxNBHtLwkQMkayotQ=
X-Gm-Gg: ASbGncuIXxeRJ3a09FWxzHRTIL3Dcu6dYzytpAGyuSPQNVtJJ7DdtfK3wJgiaceifgb
	hpXDkuSJ0/0t/Ac6aOhQtvFF6/OV+UYEFLEOWmah8eEWn008HcvBByUa84qjtYT2YoY9LIapmCE
	Gi+8iPEF8VRnSyY/xEMaZhLkZI7jY7QJJlEVkBCbTGObPgUaqiBAKoqDWn3FDV3SlhkUHCkApkG
	0NL7dcp9V+fIl/oX5D00eIXMLf2B3nCEiuIAQVFX7V09/jMo1Aj0jYlbZR5p/3Px7Dwfh6FygS5
	d6ZJfMCheggcoFc05rwuzbarNW7GmZsQeCMQ7/DLuOCAA4kzsQOohTa28hdUgGytN/OO4KJykwt
	qqAAk3Nvb1kODDA9R38agjmD/sHfuyta9OfNEQHN3ZRuXeldCx4w=
X-Google-Smtp-Source: AGHT+IEysCfN4QoGm+Kt4uTCWGC/FxersV1Axm+mK3Qn1WIeyAnenQCAPHpytZp/YJF6w/cpc4ZOqg==
X-Received: by 2002:a05:6512:3994:b0:549:8c32:78ea with SMTP id 2adb3069b0e04-54fc67bd4e7mr2176139e87.7.1747146252969;
        Tue, 13 May 2025 07:24:12 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:12 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 9/9] MAINTAINERS: add myself as a CAMSS patch reviewer
Date: Tue, 13 May 2025 17:23:53 +0300
Message-ID: <20250513142353.2572563-10-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as a review of Qualcomm CAMSS subsystem patches.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dbdf02d6b0c..9b973c0128fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20135,6 +20135,7 @@ QUALCOMM CAMERA SUBSYSTEM DRIVER
 M:	Robert Foss <rfoss@kernel.org>
 M:	Todor Tomov <todor.too@gmail.com>
 M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-- 
2.45.2



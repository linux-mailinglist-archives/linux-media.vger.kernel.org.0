Return-Path: <linux-media+bounces-34587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55812AD69F6
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 10:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77DDC1899CD4
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D91D221F1A;
	Thu, 12 Jun 2025 08:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eeeec68B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D116D18DB2A
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715643; cv=none; b=uoZx7MZkMlxcO6zLGMIEeILEhVVwo12yLA/N0OpI7uChWb+HSQm4hvw3a8YlqI6nnPdCpshJBrNkLSIvHHR5UTX4S3WLYrJ/bc1OTiA8DtjAqjR15uFShn8iT47X+0gNr9LLvdpxua8X5EnRdvCRRMS4Nuy0GiqH4n+I5VjW0Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715643; c=relaxed/simple;
	bh=8tDz2WWtHl5iNiZtu805A7AYCZLwxYys726Q+3nadXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o1g9ZhClRFP7yIHUoRUTfkLWIGmxC0a4y3PNsKp+HPby3KPDccP2a7MDcoiuWD7MD7X2Ya03gx+fL7Wl5AfZHVciZm8blUY+E+lUtyV+StaHrpO8ikaZSlyIbIupFen9mGlsa3DafY3mTdu/snoiEi+dc0XN8N/yjK91UeK5wR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eeeec68B; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a35c894313so607192f8f.2
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749715639; x=1750320439; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EsXhAjGTTQWpaDRlErU9rdRhfOKTZnFTlIFcBZuhGs=;
        b=Eeeec68BK+ZVINceo2v3/MoOp6XZjFie5jO82x99y06q5MJctyeOMq0LVWL2idfgxn
         pXuVu+z+x1M6hjoATQ/YPBdwNryPfRH8/dol1IoTwZ5ClwNimNCtMrZv3w4gsSXMTDFC
         Myy72ZJis11uL2KuIh9rmFZSQrPL2CVTd6w6pVXJtGFIvZINUBr+HeOxzIFR7R872qMI
         8Ows8AGMrBqKwpp+Gz94kqnESkDiyO1UgIOP/haZbZQOKhKDu7H0SyYgcG5+9QNcm2Kb
         dy+bnPa45mPbUxAWaRCizI2SnW51CLdF7f4083CE951yMxgOLgR/hQcV7GTBmhwzzf+Q
         GCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715639; x=1750320439;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EsXhAjGTTQWpaDRlErU9rdRhfOKTZnFTlIFcBZuhGs=;
        b=d4bYNW/dBvjoNCwRdWB4SDrqIJv1sL4wKjE2e4OoHZcR51dlDKj2ZbqF58NJsFzhbn
         i8+wMFdQiosU7vYWPUNVJKnEVipobvO1dwTdTfzAvcJJbe0+nSrtEAZms+/0Kg/Rwphs
         NroRYbQkebl0DihMTVEgg+Mc4qAgErBptHEnQ0uEf9qBz5aBnxBcMYCevxBadDNF53fP
         f7lFZH8gUAbH1gyv9ea530W1Z17MNnFa02K2LSVABADfzoaXkedbx2H6x4M4AdL8q+O2
         JxwQULgtdBogQW0RODOXZXqeawbZBKD9j6/pjrGPoG0LLjVhHWdH/hU8VR0GwQqqDz2c
         U7eQ==
X-Gm-Message-State: AOJu0YzXlmQuAwxKXFUOeQ2ylyBpRj4ZQx/trqXSXRnh0GpjLSFQ/Nqw
	KXtUkCC0NnOwVi0mprPggpAa4nihnqVq832xcQ0G6E/eAdQ/eE1xwPhg2+rXfW7iUek=
X-Gm-Gg: ASbGnctMqixZ3x91VguJA9iWq41cjyPQQnQrNup0Kzi7sTYxzs03JWEDo44CoJBWMhT
	xgBiOAmfXUbXpc/Mum3aE4iFsvuiMttKsoD13Q9E9w9Yhj8OYid80HjA43NlmfFAlMxVoI1mWob
	gg2ZgUJrkDtCYW35zV2pcjDOqFMkJVy5G0YfG7reA+KWrFWGwi+wToAneyc+fRh8LCL8d9JmT+g
	8ncC22OfjQ30aHKJxKJSnTChz+y69mf1qZXUaGLjIuH7dB+23dsCsFbbALSXrDYlBXtxUXc7j/T
	3RdC3WGVQ7qSBhdbPmihPRo+7fJ7koRIqUK7r9nf7EkXvlOi/k+CPNtpdrF+HwrNr6wry+YaKaH
	HIxlYl7kqaT870WqSPj4mR3c=
X-Google-Smtp-Source: AGHT+IELKF2BpPbSWqRYk4Gz6CQukHgSMRWMkrUf0ssis7ZGRpZXgfdefuUMTWLkzrdWYkstVJZCJA==
X-Received: by 2002:a5d:588e:0:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3a56130ce70mr1541851f8f.55.1749715639161;
        Thu, 12 Jun 2025 01:07:19 -0700 (PDT)
Received: from [127.0.0.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm12942335e9.7.2025.06.12.01.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:07:18 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] media: qcom: camss: Fix two bugs in mainline
Date: Thu, 12 Jun 2025 09:07:14 +0100
Message-Id: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALKKSmgC/x2NQQrCMBQFr1L+2ge/sbHgVcRFsK/6oURJtEZK7
 97Y5SxmZpHMZMxybhZJnC3bM1ZoD43cHiHeCRsqi1Pn9dQqJoufgsjyhvNQj6NiCDb98Nf5zeh
 6jr4j2TNI7bwSRyv743Jd1w05S/pscwAAAA==
X-Change-ID: 20250610-linux-next-25-05-30-daily-reviews-47ef54eee7ea
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=8tDz2WWtHl5iNiZtu805A7AYCZLwxYys726Q+3nadXg=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoSoq0qnkiS+TZmmJnu9CFHauELJP3na1Z5aUm+
 he35PUBSsOJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaEqKtAAKCRAicTuzoY3I
 OjYpD/90owDahLx/oFJlZo5Dugmf1+6K/ibsQ/tHTcVrnVzTfDIQ8SgAsyKaCu3rT9x/pIvsRoJ
 8swTBTOFm1n9Zvjt+i0lDh5FY+gKvOmsu05f0JNTzBYZjjFkv1aAE7Noh48Zqrfjym5qBmeIet9
 VTxj/mDb5wyg6Tx7A1/te2bhnJXqaBl2/d988Ouzsg8DWMxIAfZlLrQ76dG0JQ2deoFiMHTvE6V
 h0O3k1rgwBE9nSHbqUrY8n2t2V8y5GByYHrezqpxswjMfdQ4wqhFaulTgLhuSEq+dl49QVpcRL9
 tPxXcEqzxzpATIg9Ep7CLFXH+eAkppLZfcDEiXIK18GdFgOJhTxW2ppSvlNNOXtDzH9XgkqLTW6
 lgZ1tWxtjhdDkiCxN65I9vn6cbKELju4a5VrS4qH4jsufLB4ebc/XAfX7QLGCYyIBNPn+dhBglo
 Edp9BoOx0kNd09gFw/qZFIKrzZupQtHjB2oqLjREzpcr9Mqn583jai+4UKPfjoqa+3eH3N9/BjX
 AGQOM6v+uBKPXB+ai/pbih3ZeEZFVaH4T2mJkZ/+vKR//o3sS61mdXMGJYPqQ6PxuFCJiZOayj+
 1ewPnybUvQR0MkXP75LDSIcac07osETEn+xRX3NjvAD4mWIFHhGjCS0rdQEcxWziJ0UEv6/nc9T
 OQxxF+8eicIIwrg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Two bug fixes here.

First up SDM630/SDM660 hasn't been probing because moving the CSIPHY gen2
init sequence into a common location also moved the default case of the
switch statement which rejects non-gen2 devices.

Second is a fix for a very longstanding bug which is a race-condition
between fully enumerating /dev/videoX devices along with all of their
dependent data-structures and gating user-space access to those devices.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: qcom: camss: csiphy-3ph: Fix inadvertent dropping of SDM660/SDM670 phy init
      media: qcom: camss: vfe: Fix registration sequencing bug

 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 3 +--
 drivers/media/platform/qcom/camss/camss-vfe.c            | 8 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h            | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 8666245114d979b963dc23894a03c74ecab8a7a6
change-id: 20250610-linux-next-25-05-30-daily-reviews-47ef54eee7ea

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>



Return-Path: <linux-media+bounces-41615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960AB41145
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 02:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2024A5605FA
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 00:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009F01465B4;
	Wed,  3 Sep 2025 00:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QNMsud83"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744AF134BD
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 00:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858983; cv=none; b=WJhSN4D1gNzB9SCCyxWJN0xLMAscmhXcxs7yRjerK77Th+eYrYpjj/bscc1dI0vDe13f+ZXFBScYsCWcSx4cpnZ+xiMDleYq+0v8F66xJ5iRQTaIsMwmRzawB/QSjfOXf+XmwCcG6DihlU2PP7+WoJAazXyvTk3/p6KpSyIZcWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858983; c=relaxed/simple;
	bh=ag5z0JwA4Mm6hwAO2A7hUywDH1CF5WQZAJQqSEYLasc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUl7Fs3JJOdkVJJVGTAHZO2fTda0YxZ1ih3qDKgJU/8CzaSPw7kXJt0Y67JyKS59OssBE/Rd/ta6sVCKgBmA0yWWXwF0JdrPMbbuBC1WPSKOQrUCRmrH9tVl+Sc9OKkiv7efTKO7tQ4m3fYYr8omyabyQDf4KFYXmj+IFUunZyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QNMsud83; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5607b6de4b8so239517e87.2
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 17:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858979; x=1757463779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZxnz4DLEMmHaYFaP9a9fqBtiXxLMoSIaCyGJsHJpnI=;
        b=QNMsud83Wztcn0Y8z0lkIG/1frph7VPGcBPfL+vALXBUNV1zN2Kkb+fRMtHk/72rQs
         3Gv1h9ijGGTVBG2KdkPnC6puC/l6/LYR+RAZmpmMlW8cR8hDDLBmwu/BwfWHZpWNEjY3
         gMxuT5+XT89ZI2wn73vugGTFFV3z/ruiFTFJrc17C7/fBMo/IJAYrdhMDx7q++1wplt4
         bik4Ow/aAMj+KrAAEojDnzokOh5RttLa2mFTQFSYY36Aw2PCOLULx1sv0BOBPhuOKOLD
         fsVctwACmd3K9saBPHWWHuYHiSbHE75hZe80+GuOcFLhGQ64lWZRnaHBXO+xHWFS+3BU
         NSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858979; x=1757463779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZxnz4DLEMmHaYFaP9a9fqBtiXxLMoSIaCyGJsHJpnI=;
        b=qJtskYmdIkQf0gzZvgBsiBRGkrLWmnp/JIlzz+faIPi8doIzNl+eY5TbdwFA5Dk8/P
         3EkPHLrfGCWx7FigcEgSfgVavOZ5dGeN+d/XHvln0HSdNqfFfXz7XxmCzgvSk1eI9QUY
         hg/x0qUW/jyGDKszfg91CCOlgKr8bGTAHVyT5/wgcknu5BEszoD0zb7i+ACKLLVT/v4/
         dcjEOuy2KstSikhs1ursKYABlMYZHFSdXtJ67aENuKz9Hlh48NbsP1C6yS+Yz+yZTdBG
         J8oKfZmruLU2qFypvBO+gwxXnr5buoqy4ItI5IMix+p1DmM057fTWYjZPaZCyUM3ChUI
         cY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyzeJB+/q4DZotIqS/LX/byD3lv4fUeAw7MZb0p1w8vQK7Nc6anwVGgTNQw4eFc+yKWcMkm3scy8AKnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Ek6Ma3XYxeyMnhl97HOq8x+/OiWJJrJNcOl40qictocSOSOP
	701ziXD4oq9oH3nyhXC58RgFkKnpFpzA3W+ffKjnMMVG8AeOejRMSQ9o5h0j/F3BgRLna7E6v9k
	XuIjX
X-Gm-Gg: ASbGncsGs7kCGrKFeUp7eh6fDin+hH1hmwnByRH3v0D5OXH9otv5fKECp4fqeEp6eYM
	guB1AAWQMqe/3n72j98WVnvwfK5jhk6dPuWPF5/yylnYXrBvz9AfD1e5fAv2ZSezc+t+F8HMSmA
	9aDjXhiFzEw8ippk2jxfGDM0KuBWRnU7CyxF0hhHH8hMmfZLWv60RSmshDY0T515sbLt+fmHnDY
	Aenu3AetzLo8Pg7MHYKc7dTLu5CLcI07k4ZYqptbqZWlkURy8Za0GVc8OvsH6RQm0wWw0EOY/qD
	eLL9n84QWL/FIE1112zc494HCtEge2q4H+MGq+b6wvrswOWR65Zo4v8vF7npKnTvJgnhncCGNr3
	uhI39vsjfO939h08WPQ/SaeakOlHDgDdN+UxztIRsxBYftNIHdq9mVdAA/pNW/S1M5S2nJzCDeI
	XFlRTUGg==
X-Google-Smtp-Source: AGHT+IG0WSztm4RifA7y8HjRqrRrlP53lUl+tPDSsHtQ2WGcEwXU8N8FrNhtzr4uEKdwCAwFLw0j/Q==
X-Received: by 2002:a05:6512:3e1a:b0:55e:a69:f4a3 with SMTP id 2adb3069b0e04-55f6b19a1a4mr2104612e87.6.1756858979286;
        Tue, 02 Sep 2025 17:22:59 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:22:57 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/5] media: qcom: camss: a number of cleanups and fixes
Date: Wed,  3 Sep 2025 03:22:50 +0300
Message-ID: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset noticeably simplifies common registration routines of CAMSS
ISP device driver.

Link to v1:
- https://lore.kernel.org/all/20250513142353.2572563-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added a gained Reviewed-by tag to patch 1/4 (Bryan),
* reworded commit message of patch 2/4 (Bryan),
* explained better a removal of port node availability check (Bryan, Neil),
* cosmetic and non-function clean-ups of lesser significance,
* removed already applied changes and rebased the rest on top of v6.17-rc2.

There is no any functional changes between v1 and v2 of the series.

Vladimir Zapolskiy (5):
  media: qcom: camss: remove .link_entities callback
  media: qcom: camss: unconditionally set async notifier of subdevices
  media: qcom: camss: remove a check for unavailable CAMSS endpoint
  media: qcom: camss: change internals of endpoint parsing to fwnode handling
  media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function

 drivers/media/platform/qcom/camss/camss.c | 99 +++++++----------------
 drivers/media/platform/qcom/camss/camss.h |  1 -
 2 files changed, 29 insertions(+), 71 deletions(-)

-- 
2.49.0



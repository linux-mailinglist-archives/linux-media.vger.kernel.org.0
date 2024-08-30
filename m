Return-Path: <linux-media+bounces-17199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BF69657AB
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D594328567A
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622961531D0;
	Fri, 30 Aug 2024 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UQn1fci/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64CD14C5AE
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 06:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724999706; cv=none; b=sfLNNtPHJ8RaOEivtbLAhgV6GAJyEV2Hi1T4ahDm3Jm0VhYkoXsOQnIY99BLze8YCDwrIRB94PQslabcXAe6XAwCnEApUma8pcL093ZzmclahARPcpA35wVcyPmfrsIBfkKCQF5x6plv99AFr+Vk7LK1iK5gNJh9SLLQHk8BAGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724999706; c=relaxed/simple;
	bh=SS9fXxH3VoyBjmFZPFaxsc0VsNSPJvIu5TKSPiboAjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TlCZ6AcCUDeRGQFJBClsvpGuS0Uz3RBMdN4GmZn+aexwY3XJgrwD6CetxGA+nMzyilTa3SXFqgIfOiiFoMxfRtyU+iVKC+JqOL1gyne8ODMt39q70jy6fnMXf6un3O2Ko5bVoKiSVz5P7xRNC2KP7X1sUteICH0M/k6FAwHOF3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UQn1fci/; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3fcdfa099so1129921fa.2
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 23:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724999703; x=1725604503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OuzaFf05L8J4fgAxusny/qESzZ92lsZab8WC1NT5JfU=;
        b=UQn1fci/wmKfWZkkPRYS3K0ZeLtL93yQT+cXyx5RyyUy5Y3uAZkufGkaR5KbquTfxX
         fUHV0jIBq5B+oFNo/KrBnp6x2NCsFYp0VwBrvFtKGlnuDTuZmt5IEzMNKfOTwzpnfqdL
         Yl1crFxgME16ZcsQiOE0SzNGe+mgQjeB0gyPq5WbwvQOUBt3yts4Dh4Kw5cco6KCv8vw
         1grmv/KuBmJ5YXC7kCdt6eummyH0Cebk6rIy/KgkWzEPMbj/GXS4n+WX5iDLeWR6kIUS
         KXDBEp53iuppR6FwA6J7OelGzTrhpjuu7urdqsFfX1Yr9GwAW80wUIGDQL+T49u4ZZ3M
         TL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724999703; x=1725604503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuzaFf05L8J4fgAxusny/qESzZ92lsZab8WC1NT5JfU=;
        b=GuoYDYsG1lQhd1XQrW9ZhD2h2AsYRlzvF8PU+74xbFQqT+9rCnXulUMPu3Ge1rJrBT
         clWG5au6wrI5QlGDxtcP6BqmHncw2WiKDXNOaAYQOVTmyHaznsH0Vm/6pjJbDD783Tyi
         hKWCfC+VIB9hLQ8K0vV0qZs6+iDMx4DulZOlRGcUj9CnGLu06W4YDTlVXlSiYQ4PD+ca
         KceMJgJK1XJud9NLXKrhGnkKiDYwIUk/41sZ+GQcJsiIP3Tb1mk+RUpTbdmFKKMM3LGP
         5d6PFIAO+MVQuujWWUeshBXf5TTH393saySWM4pKFHezOQ4RaUJbXuw9ufWw6eUxstZW
         KFZg==
X-Forwarded-Encrypted: i=1; AJvYcCWueh1FIm74c5qobTKpjvmEyCHRhIpTIEhriWXRXqXFymiMdejxdfAP2fvfrvP1Cd/rxn82o+MDJMflug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+X7nOgLFk+1Zl7alM8mm3rLnWTOug7MCghS16i0iVN2p/Hu3
	7gnhodbjmQWrXegiYHiDpIa37XAK8dVcqhm0KsKPhl+ZnLND7aEFWRsS3ryREfs=
X-Google-Smtp-Source: AGHT+IECBAzYuRQVXIyCTTslKd+vLutFaNZSxSBOn57mqzHVwdBqdN8y/7a2eGosLZiJmio+ZCbp4w==
X-Received: by 2002:a05:651c:198c:b0:2f3:e2f0:5140 with SMTP id 38308e7fff4ca-2f61e0266e7mr3980151fa.2.1724999702650;
        Thu, 29 Aug 2024 23:35:02 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f00860sm4879441fa.45.2024.08.29.23.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:35:02 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/6] media: i2c: og01a1b: Add OF support to OmniVision OG01A1B
Date: Fri, 30 Aug 2024 09:34:53 +0300
Message-ID: <20240830063459.3088895-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change adds basic support of OmniVision OG01A1B image sensor on OF
platforms, and a few follow-up changes from the series extend runtime
power management support.

Previous version of the change is found as a shorter patchset:
v3 https://lore.kernel.org/all/20240823102731.2240857-1-vladimir.zapolskiy@linaro.org/
v2 https://lore.kernel.org/all/20240813102035.1763559-1-vladimir.zapolskiy@linaro.org/
v1 https://lore.kernel.org/all/20240620124745.1265011-1-vladimir.zapolskiy@linaro.org/

Changes from v3 to v4:
* inserted correct delays in power up/down sequences, thanks to Sakari.

Changes from v2 to v3 (no code changes):
* fix of a typo in a commit message found by Kieran,
* updated a commit subject per ask from Rob Herring,
* added a review tag given by Conor Dooley.

Changes from v1 to v2:
* updated device tree documentation according to review comments received
  from Krzysztof and Sakari,
* extended runtime power management support, added functional support of
  optional XSHUTDOWN GPIO, XVCLK supply clock and 3 supply regulators.

Vladimir Zapolskiy (6):
  media: dt-bindings: Add OmniVision OG01A1B image sensor
  media: i2c: og01a1b: Add OF support to the image sensor driver
  media: i2c: og01a1b: Add stubs of runtime power management functions
  media: i2c: og01a1b: Add support of xvclk supply clock in power
    management
  media: i2c: og01a1b: Add management of optional reset GPIO
  media: i2c: og01a1b: Add management of optional sensor supply lines

 .../bindings/media/i2c/ovti,og01a1b.yaml      | 107 ++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/og01a1b.c                   | 187 ++++++++++++++++--
 3 files changed, 281 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml

-- 
2.45.2



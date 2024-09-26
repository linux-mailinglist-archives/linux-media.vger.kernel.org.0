Return-Path: <linux-media+bounces-18658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B34FA987AA2
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 23:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77707286959
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 21:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C95185E4E;
	Thu, 26 Sep 2024 21:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8CPOG8G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC81185944
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 21:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385607; cv=none; b=QQaShbVgYjLMuDra1pGZQFoAilCxuTu0pxrxhW12Z5DQMm9yQl7rhvufNay0wzvwQCDacWX8OdVMmv9VhQ0Qjg82GEEQKOITUcPxQSd3dhXhjZDL1iWoLtKKgtVDd7my/bJa+e0lwSBOHUqTbN6pFNL/oxG6Sq/wiMeKgz5IXp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385607; c=relaxed/simple;
	bh=63nV2SPEt7HrQhYq/afmOkafbu/xUUadZpZ/grNSr1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c1UQDoXboj6qbBOw7xs0EUdLg2kZCq7pIPBI6+bxRGdX2/4bqCoBWjIqdEgtgeBimiUSJMbGBq3SRKerOR0+WcYdT7DkYbITFP+kQuBu08ZT7DJWA84+1brbqNYceeJGj/7G1nxuEkpkagK9Qe6rePnrYPwILeCd3yoCdzALlvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R8CPOG8G; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75d0441a8so864501fa.0
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 14:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727385604; x=1727990404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZmNzvdqCCpWOCO0T1ymFiFyHWj/Ok0pICE14Ywaf4s=;
        b=R8CPOG8G9IvnkD6xGMjU1zLG+0Q0J/cUDgxOyLKcD2f1BKikDUwrrtMCKMc07Bcxqq
         68z0q9jw7Zn5TEt77jQ43CIi5K902Ob5GcoDYdDu5RPGhAEukb4J4VpOKOe3PK2duE38
         E6GRSdgRslC0GDjjDRWgLPMzII6p2cFmDrg3stdkgIwmKG6lM9RCzcgrAZp9r2Wp+WNQ
         XZwfgtgcoQMlcGfZlVhbA6u+wTekoxbHwiqlXaogN8xKI8IABD1bLSZ/6GO0PrI6l/ZY
         HWqBud5kjc+Sqke1PWBJL10ClAGN1646jq84xtq98i87f5Ek7beqaA+tyoOEv1wbOxkC
         uV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385604; x=1727990404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZmNzvdqCCpWOCO0T1ymFiFyHWj/Ok0pICE14Ywaf4s=;
        b=XmZjn3DRGSvprM7r2G+PGmS/62v5m+AD33z1UijrxxS9Ca86JsUOzFbqgW8cvvoWXF
         GhpnVVKqFs91a4Vg/GMXmG77nYcr1OxPtB5mYUNlaPWxiHTJbIOu5n2lI6LSq2596gdA
         PQ9Cz9aOBD/1SchqoUepfGEvW7ueDG1TFk1SzL7MtLFK2HdkUlx7yH4w58CcP3FJzP04
         Ys4Sm8uiNa5AKGPBI6DV23vXIXBIM8CU5UiHBZ1PDBEuIq3/G3SbrdnHqU2c21TNl49d
         HSpfsh16WTEBfJswmOMwd95ABLmwna8pRAu7+6+tWKUEb483pVlulaDsibZS6INqOg1v
         NgLA==
X-Forwarded-Encrypted: i=1; AJvYcCXObOB79NzkoqFrFudZQzHQ2gqOhNyNxaXsvvqWSyJ256zws4fP1E4kctJ3bm6Dn6i4crlxBCObdoV1tA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2fcVs0oedFpDZw+h2VToL0vjYvGpE5lOxLigsRJ0dD+RGs9xL
	epYSVZ+zx76tFSYotdVCnes0zjhOnTenb5sfuhHrRqkoT0L7stu65ebRM/TPdk1eFv/IiBSblKF
	c
X-Google-Smtp-Source: AGHT+IEV+uddoYO+WxMKBOKeJc2BGDo2fSlXDS+9Ajnd3Q3aw9LPoMVM2iLwdcv43rxw1kV1FKOqmQ==
X-Received: by 2002:a2e:be24:0:b0:2f3:a896:1877 with SMTP id 38308e7fff4ca-2f9d3db3ac1mr1876551fa.0.1727385603777;
        Thu, 26 Sep 2024 14:20:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f9d4618a80sm684901fa.107.2024.09.26.14.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:20:02 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] media: qcom: camss: manage supply regulators as CSIPHY resources
Date: Fri, 27 Sep 2024 00:19:55 +0300
Message-ID: <20240926211957.4108692-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change is based on a recent discussion of a changeset, which adds
CAMSS support of Qualcomm SM8550 platform:

  https://lore.kernel.org/all/6d78c1de-00bf-4aea-b0c6-a147faa40a8f@linaro.org/

Regulators shall be managed as CSIPHY resources, while apparently CSID
subdevices can be run with external regulators kept disabled.

Performed regression testing on RB5 successfully, however it might be
important to state that on RB5 board L5A and L9A supplies are always on.

Vladimir Zapolskiy (2):
  media: qcom: camss: add management of supply regulators to CSIPHY
  media: qcom: camss: move sm8250 regulators from CSID to CSIPHY subdevice

 .../media/platform/qcom/camss/camss-csiphy.c  | 35 ++++++++++++++++++-
 .../media/platform/qcom/camss/camss-csiphy.h  |  2 ++
 drivers/media/platform/qcom/camss/camss.c     | 20 +++++------
 3 files changed, 46 insertions(+), 11 deletions(-)

-- 
2.45.2



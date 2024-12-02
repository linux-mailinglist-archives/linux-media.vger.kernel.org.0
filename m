Return-Path: <linux-media+bounces-22441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F37E79E04C6
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E694D161FE9
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B742040BE;
	Mon,  2 Dec 2024 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fIqY70pg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2081FF5F9
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149481; cv=none; b=IACSnXHyKxP3K/CXXfkWMyvhG/F9pFVhT8B9El3GoinuHX1TTyZSZreem7BegstxGSMRw/kzi2uu0vdHcYz+/d/kR6nVxBzY0xbTU8w4t9kQ5Q4XjkH4UKS5nBE/ZrOTxEFX90eg4ULjUxWE94C+55ZpOWL2NryOVq6b+bUiwc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149481; c=relaxed/simple;
	bh=oveab0x/X5lxQcctIhT1NPmDKwzpaRt5bfuaux7SDmM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qDe+J2Csd2LkuDFNIjFG3AhRvfQ4FfTATUhVAo2upGe9ffTiQHTMkJdhijR28WTGjf/b0GMbnt7DqBSLszHuTgusE2Y/L/9eg+ePmPmY7xCn5Otj2xrK4/j3epxosuNkvijO5PqWzzWElAXwXciOJdMPnyylM3TR20Fkje4Yn/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fIqY70pg; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b66ea49407so377912385a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733149478; x=1733754278; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uR/f84OMp446oPhdoEj+ac1SLyhexTWGRvHwC4hhgxI=;
        b=fIqY70pgULraV5XU4IS5HDBAW1s066VE1fdWv97xerIgBcBEViSfy/ufTREbdrXEHR
         wopFCb6xx3+cJa4yfdPFtHwWNLM/ad4Q0cMI+vd4fY50zsqX5phvjnYdKCb1nm/UZfF6
         BeM0E8MgtO/tt+v0JJzrYrNafvZynw1RD2MtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149478; x=1733754278;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uR/f84OMp446oPhdoEj+ac1SLyhexTWGRvHwC4hhgxI=;
        b=VbYtmbzzWh/c5tucNy6WHJXSRUlXRUxjoFILEbeXMsxsjmv0kGsABVoN1snyCAp134
         rtFxcDhqlRJPiYBtSbis2IErMa/rCjmre2xPLiVy+r5Cbfs4yzw5v8mVGiwgsjWeytj0
         TkQd0/uoTupOGQgkg1+wWIQQcA3NvD/A3DlLHXUOuyOMiMHDUd5ToX3gdnrhsZ5Rq3ic
         h5dkdn9qojICh6fAmj3oCuall+I13xqXwYkzzsbQfRoKxq6NIV3t6hhudDd/r8baRg1Q
         h6lq3Kp6Drl01o9uohYbYZgPok5Wyv+pod5cuTMXQtG/LhwTvydUCgkNnnoJudpCq7JI
         SKMw==
X-Forwarded-Encrypted: i=1; AJvYcCXmPwHvmtDn9tOYINTTImDDx4/MHNeqfP6TCl9IvecyTDhNMO0RJ1OyAeWMow5ucWLtzCV1xH/F0hckzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZDCrQ8o9/dz3tvw647sp5fJWtKkTGNf4iLih0wTIXUtyB/WS
	EZHUmTuaVkHCbCKW/PhvN4aWJLD2Chl5RYAW/AmsRqawjjxrSW/sGIQ3/W1zuA==
X-Gm-Gg: ASbGncu7fK9Faa8C4Ym90iwFUv3wPiL+Yod99UbemfPH5ZFGHhBy1fT9YjJeHVsBxO3
	JXGHdIbuI+m3S9YZ1fs2wMA+Zj215UqqD8FSJkcofTPsV91uq3nb+FDNpghp0g5E9EGlmROVP1M
	P1WjvuGQo79sOXfzxPB0dYmDsqqX/b36vnkhMOwuM04U+n3X0yxGIPaXlhKozRFXz0b+VGxgiDi
	j+k4A5F1Bc54wzuS5ez8bL7NrI3rhFrcL/+6pC4RbtFFeC/1mQ69uQ4u95m37MWzCv7ZK5KN3oJ
	g6VOrISACtQEb1kkFRbrQZnH
X-Google-Smtp-Source: AGHT+IGdnM12FG/mve/yBjS01j+lXu+XUWGzwYOjmdB0FCytOi8NRKrlt+bH6OQ9s4cPAmEC05Jx7A==
X-Received: by 2002:a05:620a:2782:b0:7a9:abdf:f517 with SMTP id af79cd13be357-7b683a58b3emr3038810285a.25.1733149478198;
        Mon, 02 Dec 2024 06:24:38 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85be9087890sm179710241.25.2024.12.02.06.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:24:37 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 0/5] media: uvcvideo: Two +1 fixes for async controls
Date: Mon, 02 Dec 2024 14:24:34 +0000
Message-Id: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLDTWcC/33MTQ7CIBCG4as0rMXAAIW68h7GBX9tWbQ1YInG9
 O7SrozRLt+ZfM8LJR+DT+hUvVD0OaQwjSXEoUK212PncXClERDglILEc7a4DQ+s03O0GGzjOOG
 UaadQ2dyiL8/Nu1xL9yHdp/jc+EzX6z8pU0ywN0oCCEaNsmfbx2kI83CcYodWLMMuAAUQlGhtG
 iGJcz8A9gk03wArgDa1FNbXtTPyB8B3AV6AFphU3BmtSPsFLMvyBt1q/z9wAQAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

This patchset fixes two +1 bugs with the async controls for the uvc driver.

They were found while implementing the granular PM, but I am sending
them as a separate patches, so they can be reviewed sooner. They fix
real issues in the driver that need to be taken care.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v5:
- Move set handle to the entity_commit
- Replace uvc_ctrl_set_handle with get/put_handle.
- Add a patch to flush the cache of async controls.
- Link to v4: https://lore.kernel.org/r/20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org

Changes in v4:
- Fix implementation of uvc_ctrl_set_handle.
- Link to v3: https://lore.kernel.org/r/20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org

Changes in v3:
- change again! order of patches.
- Introduce uvc_ctrl_set_handle.
- Do not change ctrl->handle if it is not NULL.

Changes in v2:
- Annotate lockdep
- ctrl->handle != handle
- Change order of patches
- Move documentation of mutex
- Link to v1: https://lore.kernel.org/r/20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org

---
Ricardo Ribalda (5):
      media: uvcvideo: Only save async fh if success
      media: uvcvideo: Remove dangling pointers
      media: uvcvideo: Annotate lock requirements for uvc_ctrl_set
      media: uvcvideo: Remove redundant NULL assignment
      media: uvcvideo: Flush the control cache when we get an event

 drivers/media/usb/uvc/uvc_ctrl.c | 77 ++++++++++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
 drivers/media/usb/uvc/uvcvideo.h |  9 ++++-
 3 files changed, 76 insertions(+), 12 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241127-uvc-fix-async-2c9d40413ad8

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>



Return-Path: <linux-media+bounces-22987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A909EABFD
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC19528BC97
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4599A23875C;
	Tue, 10 Dec 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TA0NoiNW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BD2238750
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822931; cv=none; b=MZWKymJpMGpOyeMSUVjLseOYIzVK3BqEZ49S6s+P9EMToM003O/a+GcJEwLaNCPRGyjoPDbCTIx/RM+yLqSl37OYPd6ZceluCNgpi8XkGvaRB9znSGEQR+/m7SZ5oy7YoSZmuVM5xOM9DEH2RQdGpdl1NrSXBqXFRA78dykzXQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822931; c=relaxed/simple;
	bh=IwZiUC+xzjT5g/3F2kaFOIMCaS5YNKOYuxFdVzfYR5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CFpKQ/YrdCd21LlT+KuefhYC9h7z6Lp1i1ogPr8wTtuozkmFvV9/bThE69GPXWe1XjIsT2prq1HzKL91BJOMyBM9yYtqpNOOOVBBbbnf9XwJfarQ07bmEiXI4pZ2OKc2RMg0Te5bEG+/yPXUJ22DevDyNm4Q7/URXmjvMfv4h3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TA0NoiNW; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467838e75ffso1256941cf.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822929; x=1734427729; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQ6Sr1zHlK7eVAViMLQBWWxa4rYYIz/gHEKTD7nWi1Y=;
        b=TA0NoiNWAXH65z5Fg2SzT0PeNGES0618dgVuvPlZ51EqLvQJRr4QYTe4gS30lnV8lL
         Ze89GxUl3tyh0B1ZN9wb1Moe6/pMBBOGsl//rbFthelW2LU05Id96zT4/TfeatDnjU2i
         oI3JYW0orTTaiqm2OqFy54TDq7/foOGhMdIVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822929; x=1734427729;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQ6Sr1zHlK7eVAViMLQBWWxa4rYYIz/gHEKTD7nWi1Y=;
        b=Z8mtBrqFzZGYZTAjP1k1PeuvTCV++hyyTU3wt+chlvmb5fcAOQoGiblRp4dJKHNy8v
         hpD1idmfKj3NhKKYSlg6tHOrYDr/cgeDVLWvxEE6YxvNEnuD+ZdPnpE+RSO4RyYcc4p3
         yWlpXgicOlePXVmOSLk3k+QBUTyWm2lrTGhvAGryH0x00oaVhizXqWd5eu2inu2m68Jo
         LsMyUd/aZ0V1BBFahpBYJqiRTUcqsGS05QoHOxqqzXBcVGnzCxCr4uGeQKKiumtH4zv0
         9NtUVowNtwuQ2u+WPerGzGTmos74mvasN6LP94/I+/8L2D25aT75LgPHfKKq90hDeYzi
         RFxQ==
X-Gm-Message-State: AOJu0YyUh4ggmfA5aSvJqljoMEg+BW31pmHfi8MPqNNpFc7/74kkQ6Zq
	Jjh3zOvzUWjYnbuJPlZi31Kq2vePMiVRU1lhvb5oZMdLJOR/+F0V1FVojjaReg==
X-Gm-Gg: ASbGncuDarmsF5HKtM6kFPzSawRZ9S+cK5MVvz/njzM7ZoOrbxgHqPVYZlsKz7C8S7U
	YtOOoXiWxDEQMvqxGB2rScJpNuwDFCh5dlmB63IR2HFADykg+/nGEfAhqT6tnjKikHc0dGmOX+6
	vwWKskZF8qZx7o441QEtNeQqHbTwJpzyD4Ce86ZmOOZfR/nzgFkXEYV8KScw/TwGH6mwiqk/rWv
	Foc4LN4ZHTrv2OY2gc7VWo9+Wx2rED1+j19rFjIH8ezqpJ+29O2hkQs03dYiRCjj8DwXhH5ZgSi
	sEr2xNd+AA/v7pBXaYD/Rq/RDRy3
X-Google-Smtp-Source: AGHT+IG4zLpTUeRfCJvNH5jKuYheZyD8tmB9iprUPnqSv4PhKrfbGY9SonvowS8cKS9US1CIu4W15A==
X-Received: by 2002:a05:622a:1446:b0:467:599f:bdc0 with SMTP id d75a77b69052e-46772013edbmr46291441cf.47.1733822928798;
        Tue, 10 Dec 2024 01:28:48 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:47 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 00/11] media: Remove vidioc_g/s_ctrl and
 vidioc_queryctrl callbacks
Date: Tue, 10 Dec 2024 09:28:44 +0000
Message-Id: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM0JWGcC/23MQQ6CMBCF4auQWVtTioi68h6GBQxTOolQnQKRk
 N7dytrl//LybRBImALcsg2EFg7sxxTmkAG6ZuxJcZcajDan3Oires8kK07yVCUW58K0FV7KCtL
 /JWT5s1uPOrXjMHlZd3rJf+s/ZcmVVh1ZWzVoscP2jk78wPNw9NJDHWP8AnVABMWlAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Most of the drivers use the control framework or can use the superset
version of these callbacks: vidioc_g/s_ext_ctrl and
vidioc_query_ext_ctrl.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- v4l2_query_ext_ctrl_to_v4l2_queryctrl
- Fix conversion (Thanks Hans)
- Link to v1: https://lore.kernel.org/r/20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org

---
Ricardo Ribalda (11):
      media: ioctl: Simulate v4l2_queryctrl with v4l2_query_ext_ctrl
      media: pvrusb2: Convert queryctrl to query_ext_ctrl
      media: pvrusb2: Remove g/s_ctrl callbacks
      media: uvcvideo: Remove vidioc_queryctrl
      media: atomisp: Replace queryctrl with query_ext_ctrl
      media: atomisp: Remove vidioc_g/s callback
      media: v4l2: Remove vidioc_queryctrl callback
      media: v4l2: Remove vidioc_g_ctrl callback
      media: cx231xx: Replace s_ctrl with s_ext_ctrls
      media: v4l2: Remove vidioc_s_ctrl callback
      media: v4l2-core: Introduce v4l2_query_ext_ctrl_to_v4l2_queryctrl

 drivers/media/usb/cx231xx/cx231xx-417.c           | 21 ++++++----
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c          | 40 ++++--------------
 drivers/media/usb/uvc/uvc_v4l2.c                  | 10 -----
 drivers/media/v4l2-core/v4l2-ctrls-api.c          | 51 +++++++++++++----------
 drivers/media/v4l2-core/v4l2-dev.c                |  6 +--
 drivers/media/v4l2-core/v4l2-ioctl.c              | 19 +++++----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 35 ++++++++--------
 include/media/v4l2-ctrls.h                        | 12 ++++++
 include/media/v4l2-ioctl.h                        | 12 ------
 9 files changed, 97 insertions(+), 109 deletions(-)
---
base-commit: 6c10d1adae82e1c8da16e7ebd2320e69f20b9d6f
change-id: 20241209-queryctrl-5c3632b7c857

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>



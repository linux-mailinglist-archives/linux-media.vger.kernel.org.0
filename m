Return-Path: <linux-media+bounces-22956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FED9E9F75
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32E74280720
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455FE1990BD;
	Mon,  9 Dec 2024 19:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HqTj7231"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6C5194C6A
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772338; cv=none; b=i77qOMmtm7VlQf+ZduFlcDf8h7++omNe9OqykzRpleTuDImx9+i91KkbFJ/kkYYhoeAnHkK8wouUYvZUDzBffaMlkDJyUa4Ri8pFhGoL+murv06i3/uNkx2wzBTmEfp6csFDOI4x8ffuZaTSNb89qr/EQgTT68xkhuecHzvJto8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772338; c=relaxed/simple;
	bh=1YPD5dfhPPSSjjJMM8/8DpsgemLtu5hAhcvsO4anuRk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pWImjPIwNlA2Ql8BtufDuQr5RgNbohQ1eCI3pxhCMbsxOSF81YlcsbuORAEl23JTBsoKUanAuaX52Jar+0u70BJ475EeoD0nH3JtVD4/wzb4L40Ch15qET/k5GRzeBT2L8ko1bJpTArQpMEPnVklUcbFAnGs18ElRf0O17iE0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HqTj7231; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6d6fe8b16so98079285a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772335; x=1734377135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5w/djmSfwnx1UtWBiBpykCG/spzcgrBqm/dY5n0vUQ=;
        b=HqTj72310htkJRFlrtpTqUkgUCfA4LNQzhsA2kUD/UklmnGGO1Jyz0lpyT1aocfqZC
         IktwMeFP7obTYx97bwnPh4O2oPuCMxPopRS3XKfreTOc+K/40p1HIlO4LUEhhbV7Bf+i
         LKYdV9oRotdF45wX0Mv2oaKftw7ssCR0aW8Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772335; x=1734377135;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5w/djmSfwnx1UtWBiBpykCG/spzcgrBqm/dY5n0vUQ=;
        b=kRFrY+vKt+fm7pqJdE3TBDJlEUHzIqir5TVb0FmhbzPlSUaa3DtIkJyQQspYiYORyo
         516apMExtkiP3m3tAoXbEk9oeOpMpNaDeRyLn2ctfZIG8YzEBBRTKCqnEyJ0ZRTZg84K
         0XBMt8cseLRD48zNJxeGWWG24R/Ga6Ai226IC+DE1clUW0GyjSZLexeNAyAri95S+PBI
         3lDLx5RXAXUGgoMBu2OqH3wXeap8CDZE0suSy/y0h0H+8vxVU2iHZaLA77/K2dL8+9YM
         rca1ACpZqUfVB5Tz5OQzpQTB4mod/AoghSFNeU1FgvTIFTypBLydWOLblwmlGMbshRcp
         XbzQ==
X-Gm-Message-State: AOJu0YwKHpfOFGdnzriIRAiMLnQCng7u9aFg9xmBIewudzXXt23v58GN
	+vvGsU2uV6n5xyb2gu4R/vEze1qC7x+ca0l7bXwo/CXaz1ihLuEFmmQTpNReYg==
X-Gm-Gg: ASbGnctge2eegzjIhj/gwxeiNVbkO3SZQ+XIm0JXmQptlOQgr1P2HNQTMXrALK4UOZ8
	cuBGR/pSn0q4ELXY6Y7WtmkB1flT+HkJOGuxVZikamCC/DrNpBsSy5mKZ6VOcgkPjXWwVox33ub
	e+NVnonO+rPz+Rcewh/03wFIqa3j6HP1xGRycYK3vRK+9iehICqXV7vY8Y53a/00Q/o3xQztRVE
	sDrDdPIvbIU1A+TxuXAEFiaQQHaYbuL39YJvvVOjKQeHkMCP9+suSaAhl+z7VDCfm4DFGewXRv9
	jN8wrP+lF9Kt1fxW1xkJuqEy
X-Google-Smtp-Source: AGHT+IHTy8N14hX6y10Y/KkG5JUIcGqpVcCeWrjq1oZqk0Lx9TuMCx/Mta50Hbm2uF+mXX752TqB8w==
X-Received: by 2002:a05:620a:260d:b0:79f:18d4:d613 with SMTP id af79cd13be357-7b6dce86c6dmr235351285a.38.1733772334831;
        Mon, 09 Dec 2024 11:25:34 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:34 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/10] media: Remove vidioc_g/s_ctrl and vidioc_queryctrl
 callbacks
Date: Mon, 09 Dec 2024 19:25:31 +0000
Message-Id: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACtEV2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwNL3cLS1KLK5JKiHF3TZGMzY6Mk82QLU3MloPqCotS0zAqwWdGxtbU
 AgCzU6lsAAAA=
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
Ricardo Ribalda (10):
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

 drivers/media/usb/cx231xx/cx231xx-417.c           | 21 ++++++++----
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c          | 40 +++++------------------
 drivers/media/usb/uvc/uvc_v4l2.c                  | 10 ------
 drivers/media/v4l2-core/v4l2-dev.c                |  6 ++--
 drivers/media/v4l2-core/v4l2-ioctl.c              | 28 ++++++++++++----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 36 ++++++++++----------
 include/media/v4l2-ioctl.h                        | 12 -------
 7 files changed, 65 insertions(+), 88 deletions(-)
---
base-commit: 6c10d1adae82e1c8da16e7ebd2320e69f20b9d6f
change-id: 20241209-queryctrl-5c3632b7c857

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>



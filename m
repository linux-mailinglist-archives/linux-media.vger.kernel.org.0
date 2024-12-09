Return-Path: <linux-media+bounces-22961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494A19E9F7D
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C82C282D4C
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D3719CD07;
	Mon,  9 Dec 2024 19:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yv7Vyq7p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C67C199FAF
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772343; cv=none; b=cSwnpV8fOugb9vmW2mTXzhr92Q36bIwAQUgQJB8Qb0K2RrQvp0LZlxDl9ZcB6Slpf7GzlS1aUqY13L4s35gtdhAAjT3BOB2cqSjBJIMnczP1CsSsNNdJNenlv8ci//luEYJydqyvuT+e3rgSAQuImenOpzVYqcivpvPnfNABHBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772343; c=relaxed/simple;
	bh=qjgx+2RW+2qA3Kpo1t21oiWuDE038T0YMMKuiv+Fi0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JGRcoGiQ39SIjwzjmmCbgRCVw3HjU/N0nEnlSF4IjSDtB8Lrdm1WN26LYo9iFusZa5Y+hcTKeNxtOKnQMABIno0IkTmuO90PQtaF3vngWauMQoboNDiQIBzaw7J6FOna77FQFKGPFUTOVi1T/IhAq0WyT6rct5KrXzRlpBvEedA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Yv7Vyq7p; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6cade6e1fso156027585a.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772340; x=1734377140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bD/oB3rKRX6sl1z5Slf9ygtbR1yaEO5qPjqhHmqcVUs=;
        b=Yv7Vyq7pfI/rSU/66IqVKgaPy9znhSKlSLsEz3dmnOaCHgdhDvFdwQwv9QLe8U3RYg
         wch3e0i+OCftccYTws+9JMFKiVxEXs9KtO5wfDBN4FT5hE9hahFRhwP3NtvGv39DoXag
         6eqyGunRRyf/kdrOw52x+MOo0hlA/uVqrEaRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772340; x=1734377140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bD/oB3rKRX6sl1z5Slf9ygtbR1yaEO5qPjqhHmqcVUs=;
        b=RYF9clX5yc4RbcNYy4spXeqZnuPyoEwL5SxqP6cn033KMbl6aa3m83rXpzBAMHH/P5
         C8/G6txbVp9Wi18wk66ScBCWfDTlkcCcc5BblgChoPb0Z0fBQGD4ncOjY6talSSpCd3r
         tfCWFmmsfVvQ44Bf0siRWSnzmkMteCvc0sUi2Vt+7DtXXA34NcEpmLBe2j92+b5PYcFP
         nHovc6WPhnXBHY9q9i4zvjev7x7Jf0tA3/6AcmY+BY5g5MMP6ls/m99czjeeMDDQX287
         LpT24WSrHH57IiYEBqXMb+7q2+pvOks9MiwsaVGi7+BN0yFOjCRLtsmSYklxVP4K/ShG
         qeEA==
X-Gm-Message-State: AOJu0YzramUo6pxYYffiqLZmRT0U2LFqwiXgQIuI6WMHTjsntVvfqMZP
	SC1xjqNYdVzHODfgUjxThR9sm5qL+cjj2qfy/5u2ZyEzSF6jWJ8iysadlrTqow==
X-Gm-Gg: ASbGncuI4lcDnTkdeA2zHd4iNUQwRis9wlIITXU6zl4RjNvK3PhxYiNRkkpTfoPqTZZ
	UDuD/VJ3I933IUjLyqtBKV/3cWA7DXKgh0US5el5Gtas3pqxnvHYD0Po678v1UIIi1acCty4hAa
	yyZDB7djVJIid76uBY3Mx62aSJLVWCCZ55qFs5vw23PKLLHVZh+GZtviXVeo5xhs8N0NJzyfEkX
	zJVf/ZCq7f5519ew/IIoXCRM9uGiu2s492xzLMSD2KPCBBu093ak0yn85HKXi6pOb5i89+uFRSA
	NM0xXCZg0VrrMGsOEOnSQuwv
X-Google-Smtp-Source: AGHT+IFFo3fcSdPum9b6G5uOLTbU7+t/CJfByumNs2Z5/XcG53j0L97A8+L9Fove8A9qec5bpHOBcA==
X-Received: by 2002:a05:620a:450b:b0:7b6:cf60:3971 with SMTP id af79cd13be357-7b6cf603aa3mr1080045685a.22.1733772340240;
        Mon, 09 Dec 2024 11:25:40 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:39 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:37 +0000
Subject: [PATCH 06/10] media: atomisp: Remove vidioc_g/s callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-6-deff7acfcdcb@chromium.org>
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
In-Reply-To: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
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

The v4l2 ioctl framework can implement vidioc_g/s_ctrl with
vidioc_g/s_ext_ctrl() and we provide those.

These are the last references of vidioc_s/g_ctrl in the codebase. We can
attempt to remove them now.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d24420d8bd57..394b6f06246c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1566,8 +1566,6 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_g_input = atomisp_g_input,
 	.vidioc_s_input = atomisp_s_input,
 	.vidioc_query_ext_ctrl = atomisp_query_ext_ctrl,
-	.vidioc_s_ctrl = atomisp_s_ctrl,
-	.vidioc_g_ctrl = atomisp_g_ctrl,
 	.vidioc_s_ext_ctrls = atomisp_s_ext_ctrls,
 	.vidioc_g_ext_ctrls = atomisp_g_ext_ctrls,
 	.vidioc_enum_framesizes   = atomisp_enum_framesizes,

-- 
2.47.0.338.g60cca15819-goog



Return-Path: <linux-media+bounces-22993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 810899EAC11
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14E716A202
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C752080FC;
	Tue, 10 Dec 2024 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HEFYh1Gz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1856F1DC9B7
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822942; cv=none; b=SW+6tGiCrWa1WkL/DiBn9t/kHycuptPAzMwaXhvE/0oMmScsTn8UGlTWdJ6l0MTpUQN6wihrb05xxpV+TPwqdKMWC789RLC2ShakH37/IBUGg2bRhhE4kHQNZtJl1Za9796wimF8n5k14ZDvsmpVL1nQ8gWEjZt3XYs1ExN3tnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822942; c=relaxed/simple;
	bh=Kwv/wusL3b84HhR/u3oJDyjPqtdw53INZ92ugbbfA2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F8M7Ol+5sDzrUqhg1sTjiep0hF/r0I9NU+dlj8x9qHZTMh8k6/RhlF0i9Wyo9IMJIFRehcO27XgeZIb95VcP663iaGmCW/GRqpqx1YgMv3pnSD0CYvc7CvQ4Hd2RW8leny4K9fSWb/jiC/OmZa4lh2gTCCIZ8YeSMnkX8ccsw3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HEFYh1Gz; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6e4d38185so15172185a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822939; x=1734427739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yvntl3jvEfc//x9pm27kdXuf3uRYNcagoSWI36TzXug=;
        b=HEFYh1GzD/2YzB5LKa6KQhG2Tx1VaQrh/REseLNiH9NRm77HoILhHfdib68K2080Fo
         FjfsxXVKIOaMeY24zgPQLGR+HOOruicZPlDGlVlwyt+nIfRNRI9ZE4AkPp3JI7vOZscz
         w8cCUNToL/wYaVHTqqxF3WG7TiFmvqzTYLjhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822939; x=1734427739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yvntl3jvEfc//x9pm27kdXuf3uRYNcagoSWI36TzXug=;
        b=bylzTdi8EKgGwSWDiuBdXTkY0l5aIU3OcoxIJo5bwF6xgbWg0iIFD4lA8H+UcLJOA1
         lRo0qiq6s62FiZlnvuqdIRTNEvFQ2u2F4RduvBtWututH9kuApLi6AfFjSrybym+s8S7
         kCgGZCxEC+hjhK+Yyp6uKhzw8pjXoUnAilGBbYIPJlrnUKsnHmEVUSLA9mdsxG0dyIm6
         rAAg46cUsEQhZHLOBMYYoT1uR3Idol6E/GJ/0ZxswGC3s0tDKcmzK1ecNOh7bOCCkpmi
         EIA6+s2s1ezIBxedr3WV45t/4xz5Tk7MdMdivVoh/9GjFS/fqmmnGoPxfxdWmhWPy4WD
         h5PQ==
X-Gm-Message-State: AOJu0YzRDYDYnx1t7rmr0XxnETOe6KNbnItIpK8cVcpqSsDq7FIBRE9H
	RlqP8lMmvOFUrW5C5iRxHbMjegid34DXg0uQCK8PlgZJvyjp6+D6AJt/KhssWA==
X-Gm-Gg: ASbGncuwVe6Gs5qS4nT6JPnhHXpubG/yDUjEVvLfw3SDhhlVSGm7QqSaLbAezAtrUhK
	eRQaCw1ASViL+VqsiVktRYBkaSkPpZVhuHxRROfGW2/wQWRprCHFhwswGhZr/kdU5Bw7KD761hm
	VM4NDElMdznYR6u6HKh3KX199xtSghr8TUeUdnPOPttCO4H/Gk7F7xg+H2Zw/k1jhrRFaV9nfNT
	DhaxGB39YBtMrVQ2wpy8V8SgIV64DF+zR5PqPT0zk6Z2bD8CJe1CRlxlaxkt2jHkWy5voXTh47E
	96wDHhqxy9owSem3fcl7aIAUXcZT
X-Google-Smtp-Source: AGHT+IHfGjM3il73uzcVVahBJWJV4voLVQSpqP4azfgSBEzlCLsR7XuITVeqz6peN1GDRvj/X2uvew==
X-Received: by 2002:a05:620a:262a:b0:7b6:e8d4:9b89 with SMTP id af79cd13be357-7b6e8d49fb7mr13352885a.34.1733822939131;
        Tue, 10 Dec 2024 01:28:59 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:58 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:50 +0000
Subject: [PATCH v2 06/11] media: atomisp: Remove vidioc_g/s callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-6-c0a33d69f416@chromium.org>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
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
index 6b84bd8e6cf3..1fb2ba819de3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1565,8 +1565,6 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
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



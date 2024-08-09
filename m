Return-Path: <linux-media+bounces-16042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EC694CBEF
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DEC9285F74
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD97118DF9A;
	Fri,  9 Aug 2024 08:13:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D07C8D1;
	Fri,  9 Aug 2024 08:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723191197; cv=none; b=T3x+wD4/VjlNuT/0OVeSsrBplyw90Kq25F2kG3yFmFd+IEUFlnlYqWHxAoTO7EQWAdq/gpaEb/oRYFSTo/U/DYX0mMhP0Iy6YGvRco4flbrmocdrQSKaJvFEATjsqwZyhnv/wd5ek8SoxibLaK7rBIo9PzjahjnFS3kztKWNPiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723191197; c=relaxed/simple;
	bh=+RvT5oYD0ds6G+9jSn1C+P+GmA0FxvcNKYUddrnNsbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pyt1qjYSFqUFGU9nZJlycM05hzEJKAZEOMXbhkKSnGONkie1WDsRX6Gq9SHT2jdbW9TgDGb2zApUqgFPtSsRJn5FKzkxMPC1stbZSeQzLLbeywr3ncf+xOsROEsbNggSAIDqxotmAFmFijGPSgymuXPGOEGhxk9uuQLj6aNDerk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77429C32782;
	Fri,  9 Aug 2024 08:13:16 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/6] input: serio.h: add SERIO_EXTRON_DA_HD_PLUS
Date: Fri,  9 Aug 2024 09:57:36 +0200
Message-ID: <ccbb099a35cb788c7304795927f508cfc2342ff8.1723190258.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new serio ID for the Extron DA HD 4K Plus series of 4K HDMI
Distribution Amplifiers. These devices support CEC over the serial
port, so a new serio ID is needed to be able to associate the CEC
driver.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/uapi/linux/serio.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/serio.h b/include/uapi/linux/serio.h
index ed2a96f43ce4..5a2af0942c9f 100644
--- a/include/uapi/linux/serio.h
+++ b/include/uapi/linux/serio.h
@@ -83,5 +83,6 @@
 #define SERIO_PULSE8_CEC	0x40
 #define SERIO_RAINSHADOW_CEC	0x41
 #define SERIO_FSIA6B	0x42
+#define SERIO_EXTRON_DA_HD_4K_PLUS	0x43
 
 #endif /* _UAPI_SERIO_H */
-- 
2.43.0



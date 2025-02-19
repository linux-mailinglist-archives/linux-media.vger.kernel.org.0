Return-Path: <linux-media+bounces-26320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B38A3B304
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 09:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19F103ABDFF
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 08:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671D31C4A16;
	Wed, 19 Feb 2025 08:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCuVn+1Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56D8192B66;
	Wed, 19 Feb 2025 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952126; cv=none; b=k51ilbLnZqvmlkqlfhOtklMwmFLK9KYQ9WFSDgJ7lZfiRJzU08esOanjesfKEy/t9kJ3qOA+vpTCthpamFFWe4+tWJLZNI9IXx6GsuXlh/oR5uXRTHYslEfbq+AQSG0Jhcydh88J6awZBdW6p1odohisIKqzJwh9GrKhrfq4sqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952126; c=relaxed/simple;
	bh=nYxmSRhkvwVZZe9/cXfI6tUDCgG7Di0u0OEksrdR7FM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hRktgZvMc3AUbVv8j6Y9I7f425Xojhp2ihHUz+/Ujkd0OYt9/NJygc6aU9D7EUrxTG+9sM2Cn4M9EOD5Zj0i8AJqVlbzdirN3atZPUv8xzYIHTD28HYbztOOcl5yVsisUUKNT8iL1Qz7xX3KgfKOSzN9XR7usR5GWjHkNB+KLwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCuVn+1Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973A9C4CED1;
	Wed, 19 Feb 2025 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952126;
	bh=nYxmSRhkvwVZZe9/cXfI6tUDCgG7Di0u0OEksrdR7FM=;
	h=From:To:Cc:Subject:Date:From;
	b=PCuVn+1YtU9Ywr2EqsbGGAM7EsfwPCKJyyeDv31BUyYmj/xvmrTJyontLVFjsaOdE
	 ne0CbNrDFEJFi87YuedR7XfAT0Gk/3ECjkeFkLhysya3IVduxSHhSpDVvn7VINzpvY
	 Dk/yp4+y1qn5NqxBVdDv0WB3cThdNOswGifY0oS3AV2bCRV0pHpXUebCSBD1EQTn5G
	 YN4wV+V5U84ksKaZZiFdDBP5aIfGpkTavxqNs434Ireo4s2Yf7G0wf4xNc/WC9ty7Y
	 mZYRn1AKLWdSajiFYBSgfGHWF9Mpbfx4A1Q6gXTJfw5WJqo2LjAw3UgCIkEIXz7xa5
	 g43hKOXoj84uQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Sh=C3=A9rab?= <Sebastien.Hinderer@ens-lyon.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Vedang Nagar <quic_vnagar@quicinc.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: iris: rename module file
Date: Wed, 19 Feb 2025 09:01:53 +0100
Message-Id: <20250219080200.3907925-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Build-testing on x86 showed two modules with conflicting "iris.ko"
names after the addition of the qualcomm driver:

   error: the following would cause module name conflict:
     arch/x86/platform/iris/iris.ko
     drivers/media/platform/qcom/iris/iris.ko

Since this a new module, nothing should rely on the name yet, so
rename this one to a more specific "qcom-iris.ko".

Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
Cc: Shérab <Sebastien.Hinderer@ens-lyon.org> # for x86 iris
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/qcom/iris/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index f6d22b88f6db..35390534534e 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,4 +1,5 @@
-iris-objs += iris_buffer.o \
+qcom-iris-objs += \
+	     iris_buffer.o \
              iris_core.o \
              iris_ctrls.o \
              iris_firmware.o \
@@ -24,7 +25,7 @@ iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-iris-objs += iris_platform_sm8250.o
+qcom-iris-objs += iris_platform_sm8250.o
 endif
 
-obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
+obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
-- 
2.39.5



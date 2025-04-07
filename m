Return-Path: <linux-media+bounces-29467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0EDA7D887
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 10:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 274283B2FD7
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 08:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CFD229B23;
	Mon,  7 Apr 2025 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqCUj+ND"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE742288D6;
	Mon,  7 Apr 2025 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015905; cv=none; b=cpZD0fmyB8nw70nMpiOnoxMqdmSgVB++wjEjDK3gP8/nh8BQi1HfRV5y5sFpBJIC8K+4D4zKhRcBlkvTSQA9J3GpgctHJCn0KUUirFWyrGeRhKeYQJ4Ghjs3RiGPfAg20I7/FIRMVqt4izJuv6YK+QsucybG8j4MAtaXyFYI5qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015905; c=relaxed/simple;
	bh=/cZ4bLwYN3F5IlIV369ScToRFFo5Y2ZC1Fw5hv9absI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4no9Oot/sNaUe44auBC76GivwNcQOGCZ4qTk/B5O8ZHhtTIKyJiideSM2DY9voBdqaTby69hjLsdNmc7y9AYA3x/6QjxJgfW1WxA5BmhbRf+KWJuDjk3TD2CGdm+eN/HWMXI9abKFZglmiBG1s9STxTaZu6GNwm61ibsD3SIZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqCUj+ND; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F07C4CEDD;
	Mon,  7 Apr 2025 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744015904;
	bh=/cZ4bLwYN3F5IlIV369ScToRFFo5Y2ZC1Fw5hv9absI=;
	h=From:To:Cc:Subject:Date:From;
	b=TqCUj+NDK/sbQgrGvHdijroyFHd81/aqWTTu5eeUBozVH4GcbdydFZQJuS5Ia0DEw
	 uPONKsVeV68lNlbzcmJCNkPTgnjqVfIpSqrQxNgrGqAE0FRlFGaK/UUC5FkQ56bOjF
	 0TB64KilrZMePFrtgHf0l5xFZaYxPUHXxpcuq56/fRH9/3/mHJawMp0zx/Q6ahD7pk
	 A+kXwAcLFUGsbapMDA5etFa7tS9FRsZiUa5cPwbXXnMsk+sOe5yCGo+7Q6UGLx640C
	 DulE/aHTL6f8pivUIKxhX4Ds5hSXNx6k44KfIlDRkywB3UaO/VtdrYLNyCKEYhCPAU
	 akFF+SoEduXvg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u1iCs-000000005YX-2yRE;
	Mon, 07 Apr 2025 10:51:50 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan ODonoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Depeng Shao <quic_depengs@quicinc.com>
Subject: [PATCH] media: qcom: camss: csid: suppress CSID log spam
Date: Mon,  7 Apr 2025 10:51:25 +0200
Message-ID: <20250407085125.21325-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent commit refactored the printing of the CSID hardware version, but
(without it being mentioned) also changed the log level from debug to
info.

This results in repeated log spam during use, for example, on the Lenovo
ThinkPad X13s:

	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0

Suppress the version logging by demoting to debug level again.

Fixes: f759b8fd3086 ("media: qcom: camss: csid: Move common code into csid core")
Cc: Depeng Shao <quic_depengs@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index d08117f46f3b..5284b5857368 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -613,8 +613,8 @@ u32 csid_hw_version(struct csid_device *csid)
 	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
 	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
 	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
-	dev_info(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
-		 csid->id, hw_gen, hw_rev, hw_step);
+	dev_dbg(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
+		csid->id, hw_gen, hw_rev, hw_step);
 
 	return hw_version;
 }
-- 
2.49.0



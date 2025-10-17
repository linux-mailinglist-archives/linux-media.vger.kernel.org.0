Return-Path: <linux-media+bounces-44800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FABE683C
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 674D5356F5C
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EF03346A0;
	Fri, 17 Oct 2025 06:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjSHN5Yk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31923EA9B
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 06:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760680873; cv=none; b=bwknTi4rYmfdLOb1YfSA6OLGYz9oOZhUjHAzl5pXyqa65pSSejPJUpghGIOWeGhEYOcja4I6vPUJkurVvQDHcTwvE/CKSLbVWRighg+93jGZbgJRoZ/qC2qxlcHE1+W+W3G24HRceUpzMcJTdunEyCIMAYacsIS6oIQi0jQ/KMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760680873; c=relaxed/simple;
	bh=aXIG2PE7S0TOPEDHAG6amHWiC4IOps44S5c5kBb9pPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQ0tzwBH+6BYARl/VaZGSDXLGbghkik2QY0EZfL7jVVc4G7EfNNEEuYZCsj+Hc31iJItbrcFAIu9YD9I4EAV4s++jNRqnzf1Y+rbskyBz5L47ZgFPFzxkjci2440S9Vd/TmCOrY2DPhoSzZELuWvwj6Mmm0C0uWq1usnzDlS9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjSHN5Yk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA66C116B1;
	Fri, 17 Oct 2025 06:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760680872;
	bh=aXIG2PE7S0TOPEDHAG6amHWiC4IOps44S5c5kBb9pPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LjSHN5YkdVk2r4hPk+SkCBXwwSQ8enJ44rHVoJgAM4uilx7VvbQiPd5nMft4OSzEd
	 5AWVyEVsN0hqjV/sv8XTfxQ4p3wFE6CprCwXVWeYF6N+SGPQwhHyY80gkPgYH0qvsD
	 xHbvB8W43QaD0i86u4k26BYNX0D/mEuwEyNsxHpKozPfgfvN8iHwPEkY3SjvR9CL6c
	 0XK/i7rNhXP7wKyrEwzubnD8so+CsY2JWhOdF3MDzq0WKNxieO2xevoobGBd1Wmh7k
	 pa2bQyt2aduC4BEKbTy343mUSYiwLmrTKLW5h4AUSZn/8ZEtFyAIcOFdkzTxAWpdSQ
	 h2Cr4q1mRhZDw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9dWd-0000000029E-12TE;
	Fri, 17 Oct 2025 08:01:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>
Cc: Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/3] media: imx7-media-csi: drop unused module alias
Date: Fri, 17 Oct 2025 08:00:50 +0200
Message-ID: <20251017060051.8204-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251017060051.8204-1-johan@kernel.org>
References: <20251017060051.8204-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver has never supported anything but OF probing so drop the
unused platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 34a92642bbfe..933a5f39f9f4 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2290,4 +2290,3 @@ module_platform_driver(imx7_csi_driver);
 MODULE_DESCRIPTION("i.MX7 CSI subdev driver");
 MODULE_AUTHOR("Rui Miguel Silva <rui.silva@linaro.org>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:imx7-csi");
-- 
2.49.1



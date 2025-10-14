Return-Path: <linux-media+bounces-44465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE9DBDAD2A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E55E547B6D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B883019DF;
	Tue, 14 Oct 2025 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2FJK8et"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBAC30BB87
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463670; cv=none; b=nvEdbtZO/LNzm9R208iK0jtMXJRGI66Af8ZxBv/xuX0Z7DJZ/Nui0x+AUUb8yP7EDmKQyVyyiVN33c2PVo3EAZAG/zaIVoKp2ybkuP6x3JMOOfUTiZKjFEAdImr9PsXaQsAMQ8C4QXyyAdQermLPH5EN2/EJPtg2q6299J68YuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463670; c=relaxed/simple;
	bh=IqQZ4gRXExNwGTEkeOhHpIPCdkRDN5k9nngJXX7TA94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfSjboz2/znifZpCTDo4LNExNY2TyNQwHRsuOb02IuuVEgRGNowJA5xtpb3Ixhkn17dCqYyJ/gHafN2C61IKe/3YW+D7Kv2CcZvUACbzv1/ZigUdhm0c5p6KoSceiLEYnzHJfJpOGdgNK7z1JL75/XFPIaMMkKnro4tQraK3IbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2FJK8et; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4878C4CEE7;
	Tue, 14 Oct 2025 17:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463670;
	bh=IqQZ4gRXExNwGTEkeOhHpIPCdkRDN5k9nngJXX7TA94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L2FJK8etLa8LgcYRKocA92PS++1A/4WcKYA0Av+coxMjk6uPhJmo1hyfaqSi8Rlyi
	 mESmbrMQxtHSkR44sSxGLmmDuB57KIFqkDhoK5ZOiIs3q8ZQkQU3wzSdYqxp6kf/wN
	 YUJGTloQfKUTsF0wy1e5Zc1v6FxvGo7dGV0vru4cy9tLNr65fZMSlhZLMsAzQ6x6QJ
	 Z4SEYShpJUrCxa30BfBcnpYPduReOItQF6vX9oRW9ECYn9xCI7YkuYQtmRDejW5Vy9
	 0/wYXbCMZi3ekbAsZbypfAKTRE2Hjv+35OJgagGaG5LQEJMWgiXTooTeyaSJ8yUHEi
	 KG+ILXCC1kgDw==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 18/25] media: i2c: ov01a10: Replace exposure->min/step with direct define use
Date: Tue, 14 Oct 2025 19:40:26 +0200
Message-ID: <20251014174033.20534-19-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exposure minimum and step are constant use the defines for this
instead of retrieving these from the exposure-control.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 805ed42d86f9..c8b870cf6318 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -367,9 +367,8 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 		exposure_max = fmt->height + ctrl->val -
 			       OV01A10_EXPOSURE_MAX_MARGIN;
 		__v4l2_ctrl_modify_range(ov01a10->exposure,
-					 ov01a10->exposure->minimum,
-					 exposure_max, ov01a10->exposure->step,
-					 exposure_max);
+					 OV01A10_EXPOSURE_MIN, exposure_max,
+					 OV01A10_EXPOSURE_STEP, exposure_max);
 	}
 
 	if (!pm_runtime_get_if_in_use(ov01a10->dev))
-- 
2.51.0



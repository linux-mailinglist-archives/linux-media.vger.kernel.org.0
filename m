Return-Path: <linux-media+bounces-31763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B5AAA71D
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAE101B6470D
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 00:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE7D333879;
	Mon,  5 May 2025 22:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bASGWgaJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB9533385E;
	Mon,  5 May 2025 22:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484566; cv=none; b=KiK8KvsZGHV6tJTtopcZ0aN/SgFI7N8Xbrh3AAtINEs5wAXalbAXAs2zM0i9O6HRUmCKar3d1UYBnM5ljuzkvn7NBEnHbWJkY24VIxT5No3tWJ8G4pv9v8YNzMgebTim95/jE0B84V9uvl11Oof6sfstLkhj1yVNDdghxlUD3w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484566; c=relaxed/simple;
	bh=advhH6BmqNqwfkX1bC038A2s0ql1fIioYBwf+ifhU+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AaY4UF5oyKaAXDnPx0VkK8Sfx2Q6ZeVpay88LS1Wm6yYL7Zr2zF2xL4YDqr9/+tFrcfKszQJRZc/GSIkh+uQjp1/7TdxXJWIVX/l4oz7ftA3gG9XP2OrmPho4+HJp05wFTQ7hJwjkyYDr01a6x2W/H3meUrvgjgLDCSRyEnrdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bASGWgaJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E55FC4CEE4;
	Mon,  5 May 2025 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484566;
	bh=advhH6BmqNqwfkX1bC038A2s0ql1fIioYBwf+ifhU+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bASGWgaJ1uQHfyNyWhQK+XQedCPbLeGxnLLU3SnVqYI+l0KFpYskB4mbP6NML7d8X
	 7Q+GxeYz2EqwaTL44FN3C0+fD/108G68gp4aAM0quin1bOkcWWmSf8pc+y0Bw6gD5q
	 iMcSRbCBms8AHwHpaP1L1Kw4g7NKjv/j1DhBUxzENKUGJqL9jRCqvI8WifUmcVJJVn
	 QY6Y0WybYDouzc8zWufEzFPZocs0mJVxr3WRtg2xmBeNy+9xIyscUYhzC1kaK3FI4K
	 ldErgrdhbBylv7CcR++JlVah6MTpvUm/lOqsS4CPa2nIbi2aIfTk5rO/ooKsw+sFGh
	 LMesgeOpPGrxw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Depeng Shao <quic_depengs@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	rfoss@kernel.org,
	todor.too@gmail.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 541/642] media: qcom: camss: Add default case in vfe_src_pad_code
Date: Mon,  5 May 2025 18:12:37 -0400
Message-Id: <20250505221419.2672473-541-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Depeng Shao <quic_depengs@quicinc.com>

[ Upstream commit 2f4204bb00b32eca3391a468d3b37e87feb96fa9 ]

Add a default case in vfe_src_pad_code to get rid of a compile
warning if a new hw enum is added.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 95f6a1ac7eaf5..3c5811c6c028e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -400,6 +400,10 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
+	default:
+		WARN(1, "Unsupported HW version: %x\n",
+		     vfe->camss->res->version);
+		break;
 	}
 	return 0;
 }
-- 
2.39.5



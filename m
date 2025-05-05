Return-Path: <linux-media+bounces-31794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A86AAB209
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 06:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 455051658E0
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E72420179;
	Tue,  6 May 2025 00:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUcBd82O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433092D5CEA;
	Mon,  5 May 2025 22:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485669; cv=none; b=oTo+OCzIuXGt3mYRxCrj3aPFY6dRqp1+gqMdZCGtn9Lc7bIptbdljgImp6zEUyzAE68anpeepM66IyI8IhTnRsLoISwozrbkOIUnBDNB1Uvy43ABb9u2meJyEGF7k2qHV5WtcTmv4xmDQ+/4amwALE2YgIt3qIryhucX/Qs2W8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485669; c=relaxed/simple;
	bh=Lzk6MmQLtDj/XBdJxZbM25xFcGGq310EIE1eix9toG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r2WEwMQorp5rwlYkSmChTmdXa2gmaU22fo4osEQiAdmAmbniDCQTaKeCCsuLjz0WZeaUpzDozdotxNvp5tiEncf+va1HrEkDNcfFZugdED6hvAs9wAsJBSBJcrje0nOD8Rg+lW8J1z6olS4FEYY8/GcgpBr52P/hU1MZzv/DcoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUcBd82O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E230CC4CEEE;
	Mon,  5 May 2025 22:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485668;
	bh=Lzk6MmQLtDj/XBdJxZbM25xFcGGq310EIE1eix9toG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JUcBd82O35Xw9aaap8731RHfD6GESv5rJ3LjdkEDU6AoX9AeDvcvUWOdDLZOUcti5
	 RlZvTSnUZs64yJbWHzNh7Ow3VQRe05VsPLwVmnGD4J41y6KWM1SFhn6tf8uoAxI0r+
	 dp8tthEgoxVbr5+95UlVI1rXDBYjYf73tYnB7/tHPpTwqDphXaZ5wqHcUCiCgOgOTH
	 SkqzpOZ7Zr1WsVCMPMJehVYbl3B+SZg+Uq+zYUgBa0Rrvnu9++rgAXZFFNvLXDc/it
	 41qrZW4whMEF43pZITnJVVx1z+I6OmcpnmOLD5x7qZa8jEOz4v4Hw84qGPT/PiR1ys
	 WP2qytH/ubOEQ==
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
Subject: [PATCH AUTOSEL 6.12 418/486] media: qcom: camss: Add default case in vfe_src_pad_code
Date: Mon,  5 May 2025 18:38:14 -0400
Message-Id: <20250505223922.2682012-418-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 83c5a36d071fc..8f6b0eccefb48 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -398,6 +398,10 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
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



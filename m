Return-Path: <linux-media+bounces-19833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE249A34BB
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCB911C2314C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D82518C939;
	Fri, 18 Oct 2024 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSi5Aokm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF0018787A;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=siW4tWNCpaLFW3wAE1ztbi+I12j8b0LGEE7lfvsRHWUT6QYQfbqy1klu/xqNCTlwd2WzyVDuapvmvpX1orGeEoGW6HyaemuyqiAi/agZkD7RspQ8kUR7JA2Y2WbweE4AY2Kpm3+ZAhzv+zlTMLoMKUR+tPUpW3HHhtS70OzDS5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=LtBSUA7B+3VtO9zE32j3VEtv7Mc19nC7jsWGMOsbHxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJz0TwUJEspHCS5oPxSUk3RsYBRf/85aStYK76W/I5k8tTdcoxqzhlCQrGSrDYyGC8y4PMt4W9eqgB/3EThbtHST0jxJgKpyAFEV2XXfEReXDUwln+PY1h8Nx7HmuBeGZbn/xmSCWZlK7Yz27dx8/xSW9nWPmBIpSHaky+eupWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSi5Aokm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB865C4CED3;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=LtBSUA7B+3VtO9zE32j3VEtv7Mc19nC7jsWGMOsbHxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hSi5Aokm1GFJ2zASIYQbzaJRHNcPg07FZvuYQw7kNwNPUK/G+NLBBZnUMtsTb6umC
	 m9qipTCK7wJ4K2ChUsYygArXeMy0AIPWZfRScKwVZ2Uf+B/skhIZBQP6A/PSFAz392
	 If//WzriECL1hwvaZmMihWtdxU4SqteBBQZZEG7DgYZIucD7r2H32cUvv+bKXnxtyc
	 XEaf5XLSNehdN5w5i2o50ciujJYrfnfucRDoaiZ+adumyW8kcIv6NkzIzoLaymY/i6
	 9HQDZZU28A/xtvoR1NCb9x2tyRIqI6/uMnMwU9WMeombDnrUBu2ndCk5SjonMzbVBy
	 /f5MX1JLoMNbQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005Me0-1Mai;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Zhipeng Lu <alexious@zju.edu.cn>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 02/13] media: v4l2-tpg: prevent the risk of a division by zero
Date: Fri, 18 Oct 2024 07:53:04 +0200
Message-ID: <141426ff0a1fcd99a82b57ad0ab7389bb5d5a072.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As reported by Coverity, the logic at tpg_precalculate_line()
blindly rescales the buffer even when scaled_witdh is equal to
zero. If this ever happens, this will cause a division by zero.

Instead, add a WARN_ON_ONCE() to trigger such cases and return
without doing any precalculation.

Fixes: 63881df94d3e ("[media] vivid: add the Test Pattern Generator")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index c86343a4d0bf..940bfbf275ce 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -1795,6 +1795,9 @@ static void tpg_precalculate_line(struct tpg_data *tpg)
 	unsigned p;
 	unsigned x;
 
+	if (WARN_ON_ONCE(!tpg->src_width || !tpg->scaled_width))
+		return;
+
 	switch (tpg->pattern) {
 	case TPG_PAT_GREEN:
 		contrast = TPG_COLOR_100_RED;
-- 
2.47.0



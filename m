Return-Path: <linux-media+bounces-36209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3DAED116
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BCB07A21A6
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A459B23D2AF;
	Sun, 29 Jun 2025 20:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbiAAiCK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146422F74A
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230597; cv=none; b=S56J3qD5+650093jWjHnpPs/pXFxpEETx8I7as7nW1KNxuFd+hY8y18teNpLSz/acb5+ugaV+B99aTR1c/ACsDb9idXWD/FI0F2k9DKYbLeGBw5nNovwZFhG0ydU384DHpoqF9n78TYVx5Yod8hlwlEi58rISe/LqLv42/t4oxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230597; c=relaxed/simple;
	bh=H1hVFrLqQx9qxOhe1aNvAQrEbPdB21UNiSFh2xSwzRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/jgjLiuS+ZZZW9k0NwRJuwz9Xyc3LjZlLfzDpX5U4w/MQysswb9eJmZsCaoHvTj1M4u9mrWyHWy44aMp61PjoJA2XDggIJom9phOzwiPqYJS7NvghtmyMcXHMjhqqsye0oxX1Rh7DIz0KXZmdESegd7g0Y3KlxyoJTSTF+kOOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbiAAiCK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D700C4CEF0;
	Sun, 29 Jun 2025 20:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230596;
	bh=H1hVFrLqQx9qxOhe1aNvAQrEbPdB21UNiSFh2xSwzRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TbiAAiCKCificbpqxFZT3ZllXNqqbqFp0i+tw7P6YTLi68ztA1m3T2/q4vz+Jv3JI
	 b1GCBC+3yeT5rTa6U0KMOy9sJgZE2RsNW41FgRnnuXgTtGSpBgSHQI/kZHP/Dp17Uq
	 /sfs1SpIY2l4tGdjqLczNzoSoDUQBt8cowLZEHSbK4uIOwjN9geu/KetsT1NPNvaOR
	 4I1cgp8pECeUJGqLg6YLu4CLdFJv1jref/8tZKWQB9/kBs/YdK8uvo/b1HQoB/9p97
	 iZbqJFAfkdlo4USUD8Qqf/LK3nIO5WWHs/iECcQPWOaXbGesnwHKwdmBKXee2wQX/M
	 JqMq6Uj5YJPQw==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 01/15] media: aptina-pll: Debug log p1 min and max values
Date: Sun, 29 Jun 2025 22:56:11 +0200
Message-ID: <20250629205626.68341-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make aptina_pll_calculate() debug log the calculated p1 min and max values,
this makes it easier to see how the m, n and p1 values were chosen.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/aptina-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/aptina-pll.c b/drivers/media/i2c/aptina-pll.c
index b1f89bbf9d47..cd2ed4583c97 100644
--- a/drivers/media/i2c/aptina-pll.c
+++ b/drivers/media/i2c/aptina-pll.c
@@ -129,6 +129,8 @@ int aptina_pll_calculate(struct device *dev,
 	p1_max = min(limits->p1_max, limits->out_clock_max * div /
 		     (pll->ext_clock * pll->m));
 
+	dev_dbg(dev, "pll: p1 min %u max %u\n", p1_min, p1_max);
+
 	for (p1 = p1_max & ~1; p1 >= p1_min; p1 -= 2) {
 		unsigned int mf_inc = p1 / gcd(div, p1);
 		unsigned int mf_high;
-- 
2.49.0



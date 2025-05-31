Return-Path: <linux-media+bounces-33720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46011AC9BB7
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BBB717C8FF
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D2117C21B;
	Sat, 31 May 2025 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQKE0V/z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC917F4F6
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709119; cv=none; b=flS+QkcCPoYAFjSfONvJWye8dYDdlyHRTBa1gOopRm+maKj7ZBW79Tbwcr+wppIY02RaU7vF8s5VovoDXlYaNVo9oMWhtnNZY4JguG3xZBJxh+m+8m3Abvnhyj/P9xZWU58HPa2JVHMTgOE3I3F9GtTFf5jod/Dbf4koxK4FKL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709119; c=relaxed/simple;
	bh=H1hVFrLqQx9qxOhe1aNvAQrEbPdB21UNiSFh2xSwzRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8f8X7PPNk12epOz+AEO6jydYO6sK9/4QRjlwaS4KsLSnHaMa0EFtGyjW7w01HcaA8xuMPcp6UvtffjR8XqCqd03T6YmYxQHBi9sIF1HYOTG0BFsdZFcQEjD+zxd+TMiW2xRgYA6xyFM6z6IbP1YY+GGtlRwm/ARpVJSekkKxeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQKE0V/z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85826C4CEEF;
	Sat, 31 May 2025 16:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709119;
	bh=H1hVFrLqQx9qxOhe1aNvAQrEbPdB21UNiSFh2xSwzRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZQKE0V/zlNDlH5LgkTNqqpz9WdCIr+e/HB2lFyhTRrt4pf9uSiHN0tkqk+PJRcI5e
	 GwOJgtobavdjLnWApObogDEjv1S5AjdQQPt8lB93tyYi3QHx0gfARdSov9HhT32kbs
	 ncjSzEwaFSP40DHH+CBc5oXmXOAk5DjotsLmdTMXigP9Gzzj5qPTmwXn8CTD1eDZmT
	 9FtOmd5SiXIjdB0+IQrK0KYp+vpSQdneMn/3TUEHGwPBvB4wFCEuJJWedAdgzEu1EL
	 6PYsUwEUEtACbp6y5TKxiybtcFHpLlT/w1YyRR6WjKPXPitJuFtLkP9ttenO4wcUny
	 Hj7cRIbqFhvFg==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 01/12] media: aptina-pll: Debug log p1 min and max values
Date: Sat, 31 May 2025 18:31:36 +0200
Message-ID: <20250531163148.83497-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531163148.83497-1-hansg@kernel.org>
References: <20250531163148.83497-1-hansg@kernel.org>
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



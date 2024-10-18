Return-Path: <linux-media+bounces-19836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C24639A34C1
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DD3CB239A8
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E3218CBFE;
	Fri, 18 Oct 2024 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gX8Vei/t"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACD3187862;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=nM8a7niHciXG18wT6O3J4cMV2/6Mqc6U0fFY1Rh3EivAtKJ/2EspW+4qQWHSpHNxnTS2XT8kr6n+mud9TnveVDlFaWiu675mRsvI9poH4kjf66ogqchkjtJQzouSXguDeLxEOJXSOvSZHq2EQHMHA9jL1zjKp1GI2QujwdXYv2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=lGWpAXxWV3zz4XGNsiMpE6t375yXbG2Tiq87XA+eXFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4L8e/lbEvAz0c+3Jg8HhF1/nT4B5JpTS2s4Yyym36juXQWVJ4cqS63romTlf0NfsdAbO7g2sSQNdZnb81HDE6nkanEUk5bJIph4tHsFBEt2EpZ7f3VJ9L4XYP34pbiAMtSZoco6dvHdrV2ZmDDqt/j2aQIgHybr2EQ9hoMRSUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gX8Vei/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD63C4CED2;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=lGWpAXxWV3zz4XGNsiMpE6t375yXbG2Tiq87XA+eXFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gX8Vei/tEEktbLeGqPL31wg87cH7/bnX6mQdsiTAZxq3oFxpXT51xPFppxECcf8qV
	 2K+Fd6J1w7OBkzSlWVXsjuOKte+IEUvp9LMJr9JZ+W/AJ04LePmjHgchRRfW9gZ9ik
	 qr6c+OJ+/CVxxXo4xsdR9f0XeNmT8yff//sR3OZIczW9MtRHsMs5JRVpNNEOAtYKiU
	 gDFzS9oRLfeHab5Y4tLURTNMWa8PHqn4xeGvnrBEDggxX3pYWvlvK6cJkoSqIvEIXb
	 Yl5Fqg/bXR5pEUi9bYu9p4xqzmRr4RvByak9tS2bA8XwrK15fPORdZpR27r0un7ASi
	 HY9IdjGSHVdrw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005MeD-1goc;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 05/13] media: mgb4: protect driver against spectre
Date: Fri, 18 Oct 2024 07:53:07 +0200
Message-ID: <e03711da05ae943790106a72b4790a96464e0179.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Frequency range is set from sysfs via frequency_range_store(),
being vulnerable to spectre, as reported by smatch:

	drivers/media/pci/mgb4/mgb4_cmt.c:231 mgb4_cmt_set_vin_freq_range() warn: potential spectre issue 'cmt_vals_in' [r]
	drivers/media/pci/mgb4/mgb4_cmt.c:238 mgb4_cmt_set_vin_freq_range() warn: possible spectre second half.  'reg_set'

Fix it.

Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_cmt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/mgb4/mgb4_cmt.c b/drivers/media/pci/mgb4/mgb4_cmt.c
index 70dc78ef193c..a25b68403bc6 100644
--- a/drivers/media/pci/mgb4/mgb4_cmt.c
+++ b/drivers/media/pci/mgb4/mgb4_cmt.c
@@ -227,6 +227,8 @@ void mgb4_cmt_set_vin_freq_range(struct mgb4_vin_dev *vindev,
 	u32 config;
 	size_t i;
 
+	freq_range = array_index_nospec(freq_range, ARRAY_SIZE(cmt_vals_in));
+
 	addr = cmt_addrs_in[vindev->config->id];
 	reg_set = cmt_vals_in[freq_range];
 
-- 
2.47.0



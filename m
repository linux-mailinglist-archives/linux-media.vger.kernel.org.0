Return-Path: <linux-media+bounces-41437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EA7B3E4F3
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27DB47A1E83
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 13:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A167B3375B6;
	Mon,  1 Sep 2025 13:26:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0EE188A0C;
	Mon,  1 Sep 2025 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733200; cv=none; b=jLjCA/n4wMxOgpCN5FBYebfCcgi4FlskooFTFf3J7QVv/eDk3BIrHdy9MwME1xZoFpt8KYiWas/fR0/lTCBNbNpdXVitQC5rYAlTXZJEFA5c1M2+NXjxOJyoF3LTUf9lpVTjFBTuMkcLfYsHAwSpQF0WkRTKarIXqqxbZmEmZwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733200; c=relaxed/simple;
	bh=C3eGYQEDdFxnVsk8a5fwepd/ZNJVsBNgRtSYuMC1Ldo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qV/AHmNthsKf8yV6T4hpgYKsbv4u0bZFP4yYEJK9e3gimPo3ei1dAVRx/SDomX6pcBwLYAqnv5j92MTK3GwxDv0CUKWnUIOfKQWO237OCxwDvuMUEnS+QttInA/BQU0EMgEvxv2nE6kI91MwgqzoASwhTmz/5H6f18omf+fTcJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [106.117.98.8])
	by mtasvr (Coremail) with SMTP id _____wAnxUEAn7VotdbDAQ--.3920S3;
	Mon, 01 Sep 2025 21:26:25 +0800 (CST)
Received: from ubuntu.localdomain (unknown [106.117.98.8])
	by mail-app1 (Coremail) with SMTP id yy_KCgBHnNf7nrVoxMquAQ--.45124S2;
	Mon, 01 Sep 2025 21:26:24 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	tharvey@gateworks.com,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] media: TDA1997x: Remove redundant cancel_delayed_work in probe
Date: Mon,  1 Sep 2025 21:26:17 +0800
Message-Id: <20250901132617.18985-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgBHnNf7nrVoxMquAQ--.45124S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwYQAWi0pXkI7ABdst
X-CM-DELIVERINFO: =?B?JJit3AXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR16OIBAsQKXAjlXLAGryky68Kwk92lnJUUFRq0XoR83McCuyxtqYhZJFCsnCkXIBkJXDg
	b6idtCkPqb0KZyHuIZtiXj0gJRcKDxppq2ZgCjRbAscgt2pF7M08Wx2cG+qHAw==
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw1xtr15JFykJw13Ary3ZFc_yoWkZFX_Wa
	4fXay7Xr1UJr1DC3Z8uF4fZ3y0ya1DZF1rW3Z0gr45Aay7uFykAw4ruFyDAw45uw1akFnr
	Gr9xXF1xAr1kCosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbsxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IYc2Ij64
	vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x
	07j0iihUUUUU=

The delayed_work delayed_work_enable_hpd is initialized with
INIT_DELAYED_WORK(), but it is never scheduled in tda1997x_probe().

Calling cancel_delayed_work() on a work that has never been
scheduled is redundant and unnecessary, as there is no pending
work to cancel.

Remove the redundant cancel_delayed_work() from error handling
path in tda1997x_probe() to avoid potential confusion.

Fixes: 9ac0038db9a7 ("media: i2c: Add TDA1997x HDMI receiver driver")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/media/i2c/tda1997x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 1087d2bddaf2..3532766cd795 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2797,7 +2797,6 @@ static int tda1997x_probe(struct i2c_client *client)
 err_free_handler:
 	v4l2_ctrl_handler_free(&state->hdl);
 err_free_mutex:
-	cancel_delayed_work(&state->delayed_work_enable_hpd);
 	mutex_destroy(&state->page_lock);
 	mutex_destroy(&state->lock);
 	tda1997x_set_power(state, 0);
-- 
2.34.1



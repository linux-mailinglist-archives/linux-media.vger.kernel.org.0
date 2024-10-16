Return-Path: <linux-media+bounces-19742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3201E9A0726
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D34D21F28AEA
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB129208D6E;
	Wed, 16 Oct 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxK6WtW9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543272071E6;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=CnOWybx0/1mh+FJG3ctU8ENf+MgIboMUzZ2cGIhFFJKF7aCRxwU4/zKsqnNDu8FN4fRGerb3Jv0gTUtUf0f8zF+rcEQZaENpxe1oLiL3XV3dEtQgP45Sea6/zAzQkD4ERkWKuwus74j4SWNPjwz2I4G9HbJac7+g9xCxGAWDfYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=Bn2f3bmb+9nMMRejNorJo9NsRZzQIn1Q3kUP79AKzdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0ysCsMTk7cMsugps3FZiyxNA7LrtJ1uAkISHS983FreHODf1yW2OV9s5UsMZZgTSnvzJqtn3oo6uPYw1BlCCv3gCdl3sHTR32l/hnO5HHDbYzgFeot53/xSEeQp11x+hRTl8Mfpqu6nEIX4DmQWObp7RjZ2AT3jAz08Uxvnk2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxK6WtW9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5BDC4CED5;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=Bn2f3bmb+9nMMRejNorJo9NsRZzQIn1Q3kUP79AKzdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NxK6WtW903tq2pITJtkGQe7E3238/Yrh4e9X53qcPnv2n335x6iJgZqglhp3YsU1U
	 awUoSIS+NTxiReF0vwobovRaMXCvLmzJzyk3dX0rs4TfU/lV79SNgNr15RaceuKgFt
	 fBzngsKUGd4Tfs0eU+DZdRySBm2fKVcJE9is/purQU984xcfQ5aWHL4b8iRGHzYPnw
	 /r3SQnSOND2THFszDVKFLMpJ8fkQPsbsVMqbXT428J7+RJs75KLpbT6RZh2G+hBhyB
	 43yHirILOsLJsEbEaRtwxx1a2SekxaAaDHpicSn9H3xuZ5yxJDyHMub6upkxWOvVsh
	 MAQqWurci5xUA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004Ymx-2g4X;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Steven Toth <stoth@linuxtv.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 09/13] media: cx24116: prevent overflows on SNR calculus
Date: Wed, 16 Oct 2024 12:22:25 +0200
Message-ID: <644e1a8c55b7cabad791c398e488e2a825fdefb9.1729074076.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729074076.git.mchehab+huawei@kernel.org>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

If reading SNR registers fail, a negative number will be
returned, causing an underflow when reading SNR registers.

Prevent that.

Fixes: 8953db793d5b ("V4L/DVB (9178): cx24116: Add module parameter to return SNR as ESNO.")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/cx24116.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cx24116.c b/drivers/media/dvb-frontends/cx24116.c
index 8b978a9f74a4..f5dd3a81725a 100644
--- a/drivers/media/dvb-frontends/cx24116.c
+++ b/drivers/media/dvb-frontends/cx24116.c
@@ -741,6 +741,7 @@ static int cx24116_read_snr_pct(struct dvb_frontend *fe, u16 *snr)
 {
 	struct cx24116_state *state = fe->demodulator_priv;
 	u8 snr_reading;
+	int ret;
 	static const u32 snr_tab[] = { /* 10 x Table (rounded up) */
 		0x00000, 0x0199A, 0x03333, 0x04ccD, 0x06667,
 		0x08000, 0x0999A, 0x0b333, 0x0cccD, 0x0e667,
@@ -749,7 +750,11 @@ static int cx24116_read_snr_pct(struct dvb_frontend *fe, u16 *snr)
 
 	dprintk("%s()\n", __func__);
 
-	snr_reading = cx24116_readreg(state, CX24116_REG_QUALITY0);
+	ret = cx24116_readreg(state, CX24116_REG_QUALITY0);
+	if (ret  < 0)
+		return ret;
+
+	snr_reading = ret;
 
 	if (snr_reading >= 0xa0 /* 100% */)
 		*snr = 0xffff;
-- 
2.47.0



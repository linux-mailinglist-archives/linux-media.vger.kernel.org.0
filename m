Return-Path: <linux-media+bounces-19831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 247069A34BD
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA3E7285F13
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1128B18CBF5;
	Fri, 18 Oct 2024 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYWWJJ6m"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC76187861;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=KwxE0NV4MLmxeDDhIsexsrzSPqOkD8qFTRheJ6ze9VVpZMwFEzBbInYQwJVuiNgOcntD03eOmv+pFZnJg0lwPZVpnHaTkrMsipFiLrGmKWm5Y40UxlbseqUxDbHogHdxcoZFiS3tueOHcI21r8EqWv2e/bVCivICh0buVDez08c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=dURN9dIELtyC2m0Zlh5rzANJ1Ev1GACofUTUaXFiXig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLePTdgYFRdY6R/V3NnOdem7qgkgY8yAvD6ABIRITVYQdCwvR/fGpwuglXkS5kOO7yY9Ql9Zi3T8XE5AEhgrUU/G590Rx4oS+Bi3a1/Z1A6MU+bttEpoffen2v2woGtT70IVVuMdIwq+vvs+Kb0jgDzwe323HjR+3tzhL5pHriQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYWWJJ6m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22CAC4CED6;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=dURN9dIELtyC2m0Zlh5rzANJ1Ev1GACofUTUaXFiXig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FYWWJJ6mf9ei+25Y/KLX5XAHvQZZrcfbkmbsbO5vWYyaJEWjWAUE3NiYmqzjgu2y+
	 N9SMt+ij9o6yFeEfumEkPcg9OoBzffxNRS+J7IS/c2YCZW4CQElb9eGQZkV20u1+uu
	 wrOPmafBLg9Z6ayfJ1ze95ndteQhUPYFVHQL65t+XaUoN4pBE5raJpDksC1cNeFSfH
	 mNzWFoJ9I3XNgS0x8ZbT2tNxmPJrrL6UrlKhd4Xrg37d7fmVr7Cz3vmikNnLpjDuwD
	 o04QQpjxr1jAzWE4FDEsoHTBcpCZ+NhbMY9sBDlkQpOLK6NrxHV56GUUGcFmzc6+fY
	 tk3ixUG26PRkg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005MeT-27wx;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Steven Toth <stoth@linuxtv.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 09/13] media: cx24116: prevent overflows on SNR calculus
Date: Fri, 18 Oct 2024 07:53:11 +0200
Message-ID: <b7e7f344d57ce1dd8c1bb0f82abfc8e5967eaec4.1729230718.git.mchehab+huawei@kernel.org>
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

as reported by Coverity, if reading SNR registers fail, a negative
number will be returned, causing an underflow when reading SNR
registers.

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



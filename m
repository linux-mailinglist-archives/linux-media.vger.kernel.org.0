Return-Path: <linux-media+bounces-19743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF29A0729
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34CBB1F28942
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2846208D71;
	Wed, 16 Oct 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aawmd90C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570AB2071E9;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=mzFh+D1Y1RPQ4n+Kut9m+DB98Y0r4AlYgY3uIsXXJuC1mN6JDxBFRWerv20t7BQ5+H4b4d98lzu7VetdRPs6RX/GvdZdCVr0QozvtmwPJbNWdei4fV8HYnhAqkBsa7Ym/S8HWG8EyE12O+E/Ug1V9Izmh0Vd5RSBx+OuxAM9P5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=SLmUaXbraeATMVHmFTi+JPax/3jn/YG3CdMafhTLceU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IY+CIudelpi265KmbbMusYN6Fxsx+XRDOF1RdttwkzmnJaKfRUttMc6UG9jgJTSi1HvRUHJsosPQKboqv5v8u/FgTMF1KKuBrEYvilg8LtEDOYYGd4329ztRocLEPbdtgU+9UIEeL9va8DN96ztXNcrQwfLVUuoadXDBwyxC5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aawmd90C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4352C4CED9;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=SLmUaXbraeATMVHmFTi+JPax/3jn/YG3CdMafhTLceU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Aawmd90CzbQ6C/1SR6xMZAaWhZyacmr2jSouZGOf7tSmToo121gHJ9LVzRkiqP5a5
	 sZYPuSJdWeTgDS8KR6BEPfayb62Bp4EZvKYZZQ9ekG8J1qpY6V+WALl4+OEHB0+Cwm
	 yvbkPo1Rd7itxpOBZFAMJ0d5/kXDm9n7uNn0qUJwaJHfPq6uTxVxv29yvczp7ivEDI
	 4QOBJMwujxLiroX9CiSRhyLFZB6p6RnmUv2esEvTe7+b5vDWHs+rYvLHfsjPx2UNKu
	 TzDuZXxHLY3ls4obSxzm41vqpbBsZovGwHw9MRh+63HUJZu7St+1hxhQCQV+CRqTRT
	 lRAaynNYT9d6A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004Yn7-2tGA;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Manu Abraham <abraham.manu@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 11/13] media: stb0899_algo: initialize cfr before using it
Date: Wed, 16 Oct 2024 12:22:27 +0200
Message-ID: <cb84bd8b0a224b7976d91051b5c1e22a93fac928.1729074076.git.mchehab+huawei@kernel.org>
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

The loop at stb0899_search_carrier() starts with a random
value for cfr. Initialize it to zero, just like
stb0899_dvbs_algo() to ensure that carrier search won't
bail out.

Fixes: 8bd135bab91f ("V4L/DVB (9375): Add STB0899 support")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/stb0899_algo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stb0899_algo.c b/drivers/media/dvb-frontends/stb0899_algo.c
index df89c33dac23..40537c4ccb0d 100644
--- a/drivers/media/dvb-frontends/stb0899_algo.c
+++ b/drivers/media/dvb-frontends/stb0899_algo.c
@@ -269,7 +269,7 @@ static enum stb0899_status stb0899_search_carrier(struct stb0899_state *state)
 
 	short int derot_freq = 0, last_derot_freq = 0, derot_limit, next_loop = 3;
 	int index = 0;
-	u8 cfr[2];
+	u8 cfr[2] = {0};
 	u8 reg;
 
 	internal->status = NOCARRIER;
-- 
2.47.0



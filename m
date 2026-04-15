Return-Path: <linux-media+bounces-58839-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JMLNIbg32kzZwAAu9opvQ
	(envelope-from <linux-media+bounces-58839-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 21:01:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F2407411
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 21:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3D0030233F6
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 19:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD23385514;
	Wed, 15 Apr 2026 19:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoZu2WBq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90E43845D1
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 19:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279618; cv=none; b=Y/OqYbj5+2iHDS2nfgeGXKFs/x2/Deffp/2s8+qvPJ4N7CQtcA0mf2RC59STg4x5n7Cmf8/sFr20xUu+fgOX66k6M79Eb85NGBOXm2DYWNC8bsJrrzUPHEvgOwTRbjK936io6eTNcrGscWxFfpIsbJ/uzIEfMszlqGa6Mu7ebsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279618; c=relaxed/simple;
	bh=ar38Q54FqS6BfJ7qfdNBxhWZJgoF1oHUW4lZ51lRlHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSHxxp38JNxvCX0OF6yin0d4mQc99qcX76ZB0OLzYpiEcCRlvRy4S7JyStQRQO2c6XvFEiZ7bBaTX5TmdGPp6tIjUdKXK2UqFXS5QdGK901PknpgXU0irivsw7Z9eWT0zww3tMAjFGZuIBZaBPV89rSxOcqaQj7t4YHztQwH4xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoZu2WBq; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2de831d2b20so1982351eec.1
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279617; x=1776884417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J2rpous9mFPOJaAxWsvEkQiTvEp0NZiIYNqjDYSwcQY=;
        b=aoZu2WBqHr4ZalixV1QJbpLVZhJ+xWag9sbPbzoZCrR3QqYYveQ1WibSza8tOs6SXf
         CvFjpAMGx6n5fve34Xkhm/GSt9GVFRGpz9fLft7pHNrizUSlRFSOLH7K7PDigDDvxtZr
         pL7BS8W+A53FjQgnRZ6D3bsVeAsUn632ilRHU7ZUSIJbncijOAHFfiQFwFryGHyU8EZx
         f7yMw/tZgQ0B7a7+BTo1HUms0cNR5FnlWrp8RD8qL7Y4b6532LhnDuToX9OIuEK28UDA
         tITXe/Ql7MtayN3RMh4jPUtdZ5tg+fz+puONa2z7/ar42I9y44bijFBpeeDDorLmnqXP
         rxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279617; x=1776884417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2rpous9mFPOJaAxWsvEkQiTvEp0NZiIYNqjDYSwcQY=;
        b=lV5kVaGW1xx/ckB8glZB2/UHSPuSUtUVUhciY1n1U+eoC17ga3+J/4KRbXGFsJA83U
         XSJ0i4JjhTlPqko0nZIsb1PmTa+VAgGLAf7Tu8wRHpiziABe2D493Tnc5KcU8DkReCEu
         KAdEFwv3Y4k+QHrEDqzWoE3tWhz0XhawWeQRs2I6WQ/UsicOqDhbldPlmSohfJd1QGP5
         6PKiAI63O5177wTrDYzzHfjRB0QZxddd8gNroCzI4tStO0zXvMMl7Yo3sWen0Ipeq2Uk
         gsRz/+boMglOMoSxwu5FXHMsMVUu1h7DL10Zby/Go2FsChjH6G1Ty1vXIGGhccDYpWg2
         8voQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gU2R0PKMzVb3Rco6SzhzhZKqQiHt5skUsaYLTP9RejkpL88jA2HcU5ABDf1YO0j1CsUq6W7XKLlKPeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp3JhmrGu9vVlMT5J6afSiaEMg7Ag8Tm8ON4Bnj4/SAxWHxLHr
	fZnTEHjHsK4tfDqp1W0gm8A8lZOm4kbbJsQcjXLZ65xO22rxUjpxUH8=
X-Gm-Gg: AeBDiesCnZhwBzxSvbKS4n4gJe8wSJW2qqxB6mDD304sCZE8CWde0X7uSGARSZGXufr
	pYORVCyh3G4rWz6AmcEGPUGNvOniDOjCojS/0TcnpQubZ6yl+fDxTozhotw6JJfZfIfsqvMz0O2
	ifC3MGigqNOeDVVZNn1h2YfQ3ZI27zw1Vq0KCEe20ZIUmduOdsRkkg+In2F/+cJo7atJGKLFJm1
	+cudJMOv2c23tE+QGFQGpnt5fJg5KtBPvCouKD32mxFsU4zNgKzuETyLe8nzXuB0YhaZx6WwHDz
	4Rqwy15IHsqZ+FdUC2f6vmg0qeOANpkptVhT43730xkjwkhO5CAWK7RdPoh+7hQZsP3JbGO12a8
	PdpJx6DZybH1DFnr6bCU2qU36i8m9xo81aBBh5/cc3Eq9ZY+s8pKRU/z3zkPPfJi/AaO1qu5V4N
	6bcKLKn5iJzwOUu/ob48x+WvNHNlicvsPh1FoZ9Mr63hb419FER4RTDX+DN3NTbhovDcjbr9XzK
	KB4D6Lz5w==
X-Received: by 2002:a05:7300:d08d:b0:2da:39e9:20fc with SMTP id 5a478bee46e88-2da39e96e53mr4933771eec.17.1776279616401;
        Wed, 15 Apr 2026 12:00:16 -0700 (PDT)
Received: from vilarmanjaro ([2804:29b8:50e0:3432:1ab7:b7ed:546a:3e8f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb84673sm4009468eec.19.2026.04.15.12.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 12:00:16 -0700 (PDT)
From: Ramon Watson Vilar <watsonvilar@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ramon Watson Vilar <watsonvilar@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: use usleep_range instead of msleep for short delays
Date: Wed, 15 Apr 2026 16:00:05 -0300
Message-ID: <20260415190005.114900-1-watsonvilar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-58839-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[watsonvilar@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 418F2407411
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The msleep() function is not precise for delays shorter than 20ms and
can sleep for significantly longer than requested. Replacing it with
usleep_range() improves accuracy and is the recommended practice
according to documentation.

Signed-off-by: Ramon Watson Vilar <watsonvilar@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..e0b0f09a5c26 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	usleep_range(5000, 10000);
 	return 0;
 
 fail_clk:
-- 
2.53.0



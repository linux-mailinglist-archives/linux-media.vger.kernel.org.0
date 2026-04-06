Return-Path: <linux-media+bounces-58087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP99GhOE02m9igcAu9opvQ
	(envelope-from <linux-media+bounces-58087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 11:59:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 055683A2B78
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 11:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 538603007527
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 09:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB34F3264ED;
	Mon,  6 Apr 2026 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBTCUjme"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1731353B
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775469581; cv=none; b=GDWlrjiq40GGikCf8lAuaKQVEFoerjU4jfFAOq9sWXff6+9/VfUkmgVpl88vDdQ+AGgmnmknlivlhVXIXp22Pa2MM0/wsSTsgG5e2q7gHCau+4+skwk+IBYAUJZj3/0BnhZKRadzbhFFB0sUahXwkBu5IfATMCkZhhOHf3xi/+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775469581; c=relaxed/simple;
	bh=CKnrfKF4lZ8P1svwgDKyEKGLteS5unEM9CDMkCnh8UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aoUERJWpyssoaBE8dEd8xs2oL/lGg4HT+0EV7yL5TglB2c+UeKw6X0JVrCEbgElGapfPBDxs3+t1TCnO5WkHUjR3fvp+PnA7ElUGseqLuBGZG5+lk1Bl9WxLE3z0LfAYIqzZu8ykMYvle85msYfAZ9TimYGaGtF6WimzZLIt0GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBTCUjme; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aae146b604so23596125ad.3
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775469580; x=1776074380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rw2AM2nd8jsh/WeGgK3cPZGTW2n61k3Zo4dYYbnAFOs=;
        b=iBTCUjmePrvnk2fWFkPYNEYCryiYRPgtyIYSwyU0ck1kdiHn2qq5DKbHEUNCRuoeLR
         zr2czWBEB2IbpuUEIekXP5PiAPLvsZY3ct2jHoDLX4Rb034D6tCk2J1ZhDi/AsB6f8MA
         dwIZNYn42IyWX0CrR/ZOm0gf5J/6RFwI2GkFvGi/MuxRo1LYfkFyL7978zLQd/+s3AFg
         lc3zNVkwSbBdsKqxHYttP4I2LwmX/xq96jC4Vexk6lgAFYgH7JZFAhJsv50H0jelkXJi
         at01pjR0/05TmMHdkbKi8+Wt6VWz9hJIySO5Ac976IQYMdIfEDb4/jINgCqtdcsu54l9
         iCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775469580; x=1776074380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rw2AM2nd8jsh/WeGgK3cPZGTW2n61k3Zo4dYYbnAFOs=;
        b=FFUGJ/8JC8pyR5LY1uWFueRcmkxKYIac+hcHCBDWiLr3GQqf8Lr/y/4yWi/Koo3k8M
         YyKm8TbUpFPVr/IPLCzZQ6LVlQih505edYfXcTJ61vMlXHXzUuZ2G0V8wpsrUcN/TATB
         3TpPqJUGkqjmAwUA2WXds4rBol+1TiuYyu73Cp7KDwMAo1aHirR4UHEmnBgWNDMIqETC
         nIK7N3hIaTzHpFKEl/sih5A7gmUn8hA1iVP2TkNx8euWMHW44uCQRei/tldQP6KcQ0Cx
         ufWOHUuzYCuhm4iXRBWJLyzn0wxzudfY424UibKJTR+v4cB3cesds0t/sfct6o1pcPx9
         siPA==
X-Forwarded-Encrypted: i=1; AJvYcCWpq+b9QOzI2SAMVsslsHILiN9i5OxG5VVnAdW9O2MQrdNSpPp3jb9q2ug+X7xe1MrC+PCOLLFEuXibOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6BcXsbNle9N4gKsIMWta1uYv4gTOqWSuromQu2MCCAYeYxHEa
	o531uwOh8YGflMFKDDxnEAEY2uDq2PCdQD/ueaJ10pnXFwhLs1ofWAOD
X-Gm-Gg: AeBDietP/rzrSXxHBMqmgmBuDwEqkRQr1A1yP3GKzSPFw1UTugvRcvHx/PfPwxwYhc4
	ClpPDs3FybcxT011lv+R0T6os4wSuCWtLiuSUkRjT9lsJDMKFgKgR1GuF2iEWguF6NlQ7wzEaEj
	vt48XIV+887olmrS7PGk73oV0Vjd3wJiYnae2UYbuqVOUmDwleRlaBuTZ+R4RWoEeTpi8/wE88n
	xzxTCC7ok/zPgbVQLBW+IudIJ+R5UfHYpUaxJqeA4RP7KSJVNTb2oSdmRTr6m7e6Sdwlfnnakna
	5gFNZcDDBlBTsuQ0fc1CvZcL6EqnJ1829HUiFWYrSw/6FmkVbwHHGh6zO3kYAIPLBAvgJgNAurU
	Rk6y8iKu5PzksXbk7dnaiaIqx4GRUdgolLdYj3KxDlxgePbYf/fIfQ7gen3jYggkI8axJeGu6ms
	Ed2iH8uHudLhywEwo4uxUC+/NwrjxWvsWAIbu7/mXyI9TCrQ==
X-Received: by 2002:a17:902:f54d:b0:2b2:4e1a:aff9 with SMTP id d9443c01a7336-2b281997e1fmr123631255ad.44.1775469579653;
        Mon, 06 Apr 2026 02:59:39 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([122.171.19.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749ce29esm144384235ad.81.2026.04.06.02.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 02:59:39 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] media: v4l2-core: v4l2-subdev: Removed duplicate lockdep assertion
Date: Mon,  6 Apr 2026 15:28:50 +0530
Message-ID: <20260406095850.32732-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405212020.GG1213462@killaraus.ideasonboard.com>
References: <20260405212020.GG1213462@killaraus.ideasonboard.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-58087-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nueralspacetech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 055683A2B78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The __v4l2_subdev_state_get_interval() function has a duplicate
lockdep_assert_held() call. Removed the redundant assertion.

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 32e6f60e26c7..4616e9280a28 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1843,8 +1843,6 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
 	if (WARN_ON(!state))
 		return NULL;
 
-	lockdep_assert_held(state->lock);
-
 	if (state->pads) {
 		if (stream)
 			return NULL;
-- 
2.43.0



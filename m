Return-Path: <linux-media+bounces-59921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGArIiCu8WmwjgEAu9opvQ
	(envelope-from <linux-media+bounces-59921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:07:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F70490346
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C98C73030B1F
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DC13A256F;
	Wed, 29 Apr 2026 07:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1/P4+2I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B90D39BFEC
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446420; cv=none; b=OlS3QVyBPO7po29596kqj4BrKwkkUoX4CQNXllu8T9p3/3i8qOEFYx+hF/SXMs5w5w3Zu5WyWziMup55doOHzpn9jKpYMfKyM1GuVvDD27xwpgR08jH1xADXj7i2gVqfm9JDfbqUrsPioDW7i4gT3GaSWMAOhZZ+xxL5MkzVEwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446420; c=relaxed/simple;
	bh=Uk9g76i9H/GhbU90hzXh4+nm0+aEIaHCazcmT2ZCuhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpMk+gU/IsUfU44cAH6rGrI1H/GSyvVJL3rHnCRPFSvMgwNUuujnLqLSkacOBiskHS0mVotfOxGjpCNSeNs0LK69X7y3ycWLop9Ii7F98umSLTkrkrumd0Ybw80wh8KFrTLAuooOExWEr3DN9RD9D8ifv+/dewJ9Lin9Y0mDtIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1/P4+2I; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b23fcf90b2so116952325ad.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 00:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446419; x=1778051219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sT2kWnaXD6E32HzyGyfxrcqmbsqJ0vh00m1r8Sjx8FU=;
        b=T1/P4+2IZWJfY31TnvLVy4TclmJA97E1Hjn7vNzj3FYSoho02AxShZbuagZNdQc3Mz
         fteKpCyRVRstVJ/4xATBPNNOz63bsdaAOElRa2WKV54JbyCZA32LcAOzheOnNqfzgbDv
         86YqQ2fS/+YqXtKcudHPToCj0w4odA9egXUpyz393XdtxnNGn3gQVg+keZUmGTUAKYYG
         ipzIQ0iyVtVw+E0mZ147jbtNmi33oIs6vi+XZl84U/gzbW57Scyoh7DVFHnrtMqemchB
         vQbevyUv/S2oBWS4un9BGgqfBctjswxkXNqec0GBI5IQbP0AOXV4kP9gYwsI1h5CKcGO
         3p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446419; x=1778051219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT2kWnaXD6E32HzyGyfxrcqmbsqJ0vh00m1r8Sjx8FU=;
        b=QZU9ihwaqawJkDUqnHgjVHG14d9P73m7So3prJR0dtgoCzx4t5NUIaL8hrrEUo3RVM
         /3gxTKVkNln+/dTea9bz9sQCEBrESntZtLPdi/c+Ah5feaLHS/B4AtPApq4A4IJDC2y3
         Hv02EpZ2FGLAkrfSDRkp64oHXPRTayS0ifCKMeyKSEn2i+eDf6CHEImVlGKkrp7EVmcQ
         g+9CKqAKEoQetJkYc0jMlgzLMD1Q15kFtvmGTNtKfC2L7B5fzT8HHOkw2KYZV9hvIQj+
         QW2nBSZY7aPiYvfEAPjMOTd/Igi2x/k+7+s1Y6GYm3hkz9owmIlUUfL87iYAzj0/VdOc
         21wA==
X-Gm-Message-State: AOJu0Yy3xqD6d6cvbP5Ojqp9ZJKVlSN25OwpvTmiwVR/UKeU7jAcvNGh
	Mmbr59TylqS64IxMZScRFhUQ+yl4cGij3bbRS5uGZ+AYhZ5X5zaSJ5s4
X-Gm-Gg: AeBDieutxa4FHsekgslHgIJr39tKFBMJeu4g1UKcjmls4cJtBKj9JBuYcaL//pq0DB7
	qxJkq9tzPh9h64UTeY167hmEt4IS+J6jE/WCLQAUo4NPeYYV1V47MmMO67vM7J9vEVvNp98t0WW
	ht+TiU3m5xlnjYBHXXRcwOH+tj4HlwSUjDRME/QxRG3ODfQFlADihoLVQICHxSpqypqVf068zyD
	+nAJ6jwpeW/bHfMt6cNopn3a+My+whHDOb4mFGjR1IKsJatWM5lqL8rgLk1rfrhgqyjPSS8aB/U
	v3eD4e8WnP9JNfNOaZh4v+gM7qHpu9Iiqivu0TILd3Ykd9W8hYY2qI/0OeptO0T3Kph1ak//GZc
	4k2nBTY1KMsa2U9F3HnAdwb0VOxVAOVyuoFeLv0PyTrqrrrCeewge49EoSo7WfWzoUWMXrQS9sY
	QRSk3jE1fg3NudoH8RiObCGsNMlHAK
X-Received: by 2002:a17:902:f785:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2b97c497ee8mr66514005ad.35.1777446418718;
        Wed, 29 Apr 2026 00:06:58 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e6dsm11872125ad.16.2026.04.29.00.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:06:57 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/2] fix and improve for Hi846
Date: Wed, 29 Apr 2026 15:03:49 +0800
Message-ID: <20260429070351.1307204-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 29F70490346
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-59921-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This series fixes a error blocking Hi846 driver function, and
supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Pengyu Luo (2):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: Add 6MP and 8MP mode support

 drivers/media/i2c/hi846.c                     | 156 ++++++++++-
 1 files changed, 155 insertions(+), 1 deletions(-)

-- 
2.54.0



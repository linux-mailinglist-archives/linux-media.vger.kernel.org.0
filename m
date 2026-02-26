Return-Path: <linux-media+bounces-53499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNoODMZNoGnvhwQAu9opvQ
	(envelope-from <linux-media+bounces-53499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:42:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C3C1A6D25
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54DD330F1EAF
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303BD363C6B;
	Thu, 26 Feb 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OyH7Ovew"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8022D7DF5
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113072; cv=none; b=JVY616mnhA5FGQAz59AjGDbFaR1vY0L6ofd80KYCLWW1VDTgy25XmYfD1SGesfnN8Dj/fZLmqNhMwYLB2INE14AyEe8/ZmYigS90zImpP8ZEXuZq5cl2FkjoJgkYyibLPF1fNmb5E/0ulFn8o7zb+BTkIqC2L2NNa7GMdfmMONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113072; c=relaxed/simple;
	bh=A/bhWHfDkdngtW8OaPIJhSywA09qaFlpNobpdukj5Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snHMmpv3Ey8LrNIO7MPtvR3WK9Y+kEGyPl47DVaMjTCs7ogYGdbUakqIpvpS41j+4pQedsaIbrAmSz0PIAwZg2daEycGqDLi2+/2o8CgpxE4IRuZ7xrCX+8Nbti+yfGdS4IzZOZWJh3TB3A6qEwOH+o9MJm6tCcGmiaJom+VFRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OyH7Ovew; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-389ea1aabcdso346191fa.2
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 05:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772113069; x=1772717869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hu2Gs1IakSmd6hv5BWpHHNs09vmykuhmpHghIky8JY0=;
        b=OyH7OvewOmdIuBbQygkTgTc7zR3BVDQD9m11Z+elUr1K/a8mm8uLdsYERpqq1Fw0FP
         tk0nV1KkkYfgT2cCS3N9PwPAMN8CePdUDUz5ALWPLtusbAK0ZnULNIsoxk+ijb7vxk27
         ok2F0rBHSLUxrwq+ISb9Rza2zf04bCJB2T+aONOtDY/vwssKbafzVcJ4qqy1CrHeaMSL
         aYfG65nXgjxMFlv4V+LCwo+gibIZ+h9GAa6Mby0kDYoLIQcH38+RfYakCvffBOgk2vcu
         Fmd6+fU8RUleZQNWue5FNZ+qxPYvYw+Hi5RRbzdwhO6XegM2Iy41Mcnv9fZE9iRXW4lG
         2ZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772113069; x=1772717869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hu2Gs1IakSmd6hv5BWpHHNs09vmykuhmpHghIky8JY0=;
        b=f37B5nXOZmA/XOlvV9LdZUmYrAKiiTvbq+fZ2n0tFDEu/Cm+Wn01zmLrYo39Ia3Tli
         Jh7GqvMRKDEW/+tAls46f5wco2Yb09ULfovsI35SCd261O1GS39x4ElB8Z810In4YEWG
         cJWIAODHnfcLFcbhzXQCC0JqfNok3RUy3J4lz5ElXyFdWE4q7Z+cki0tmnmxbQa8g0Ba
         SUft0wWWNCWl62WRExhn9xFU8qldHNlkAipI7rsajG0GDEZHXKQ7xlJeqim4/GuEhpHw
         bi026dGpCfYslP2GBB64UQpa2A5psGvYNS0pNda29wLa3iAxLCBrFoYfKjSf1yDLTZma
         4Xzw==
X-Forwarded-Encrypted: i=1; AJvYcCWkhpzukfHDiyY83DMUpIG8bdmV29lI5btn8mwZm79/+6cMnY5h4WJpTqOacXSJO0d1HkoaWtIFkrgeog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7bBMfmoTA4/ugd8EpZj6mtqxz0a+FdYWLL5Vzq1CnhGRO1AQZ
	BsR/K0wYrm/mFfzK3yQOjDTrD6Y4HNoaPmMji4dmPfY1EIsHe6YaWI6N86N0CTZNM6w=
X-Gm-Gg: ATEYQzzFv0k20JE2WVoDcCWV6cDMHnOa1OO5XFRgYYc0PUbpve53zgRWHIV/w2PPlhv
	XiPmAW8la0GeJFQddrINIhYu8ltTlhX0OEXEgVuRq9YHEy7hF2TsAlz9sHVq0vJHWRsP86YQ7XT
	tuRJycOOzpbB0xHVGWc8VJI5ThJHTOYU547dZLyLUIPG8o12N31VEZ3CMMDAggOeqFyQvrj6Le+
	hv2EZZUS5nozAl3chgceGW3ruMwwVM+FMFcxxizcEORh6pzni/HqmE71NDoaKaSoNRkYpCBmhnh
	HdOclmFbaiiJ3VY2+q1uoUolshk3EqDLzfWjEGc/m7RHIBzu7dd7JPRI/z7lDqR+6NeONEKV4Gj
	4ovoHM8v4PAJosP9Jr1zAqoYooyZ7pj2i1gkqsQf6VsdQaIYChCKYC8RDcRb12wzq3QdlKI2YAW
	+8eIzpkZVTij1A7MKX4GKwHQC/GnUH6PBrLJRJn+OItt0kjaeuTuQa01gDj3fN54CU3w==
X-Received: by 2002:a05:651c:f19:b0:385:c2b1:ea7c with SMTP id 38308e7fff4ca-389a58a4afcmr33246431fa.0.1772113069411;
        Thu, 26 Feb 2026 05:37:49 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f302292bsm6572041fa.45.2026.02.26.05.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:37:49 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 4/6] media: i2c: og01a1b: Replace .open with .init_state internal ops
Date: Thu, 26 Feb 2026 15:37:37 +0200
Message-ID: <20260226133739.4050870-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
References: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53499-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: C2C3C1A6D25
X-Rspamd-Action: no action

Instead of wiping the camera sensor subdevice initial state on every
open() syscall it would be better to set the initial state just once.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 1f33a4e427ef..537218f6fa62 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -746,10 +746,21 @@ static int og01a1b_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int og01a1b_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+static int og01a1b_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
 {
-	og01a1b_update_pad_format(&supported_modes[0],
-				  v4l2_subdev_state_get_format(fh->state, 0));
+	struct og01a1b *og01a1b = to_og01a1b(sd);
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			.width = og01a1b->cur_mode->width,
+			.height = og01a1b->cur_mode->height,
+			.code = MEDIA_BUS_FMT_Y10_1X10,
+		},
+	};
+
+	og01a1b_set_format(sd, state, &fmt);
 
 	return 0;
 }
@@ -777,7 +788,7 @@ static const struct media_entity_operations og01a1b_subdev_entity_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops og01a1b_internal_ops = {
-	.open = og01a1b_open,
+	.init_state = og01a1b_init_state,
 };
 
 static int og01a1b_identify_module(struct og01a1b *og01a1b)
-- 
2.49.0



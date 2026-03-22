Return-Path: <linux-media+bounces-56630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DCOpEMj1v2moBgQAu9opvQ
	(envelope-from <linux-media+bounces-56630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 14:59:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE252E98C4
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 14:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B5AC30048E4
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 13:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366E035F603;
	Sun, 22 Mar 2026 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FW5FO3bt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D005435F199
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774187968; cv=none; b=qZv95WWiJJv5GHyCpX0IvX17LXJKMf1BdyX1rdCWHEzWrr3usD4HVrqKYkflh4LhaiS4slQTwfskuvum4VG+XgZp0ued9ESr81TDEFPtsFhK0RU/E9UINq+V5HhzZ9W5aTnNCBZ1/84zInSTknfmZjTjKd8ZhyIakHCiqhtNi38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774187968; c=relaxed/simple;
	bh=F6BLcPnvDJ8TlcGGAp6QvU95NRrjcWFjh+v02anCcvM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nlu83nvIamRmvZUP1KmtEvf0UJgJtfpzmIFR5ugjmDCtZtnYpGAmq2tlzd+QuUcbCOUHMRbk2UxRrjf+flpWb+sHYo2/tktGokhboXCFzTbyTMUAf2zWLDGnWit0hC5sqOj9033Ob/UNFVD/0WRhGRWLf2p0/283GjNV11zwnF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FW5FO3bt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b04fc8851cso35991755ad.0
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774187966; x=1774792766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7drRmchDDg/N48TpGcKJzYUq/Y3ryPf1jRTgQZqpjK0=;
        b=FW5FO3btXkQIQX9m9DhUzDT8Vq/q8pjOT5N36jbszHBrq9jTDbPmlai8wfL2jwyGkS
         VVIpUMRKlayN4XnKOuBSEUfMirvGlDJa2/hcoVJ/h/wfHl2PAJ9lWBDlVreSWwAvqwy2
         ZQzq/avvQFZFF5hSb6GMdQqQaiHtX4CG7wXYZPUw8MkwXvEotIBQFgr90edo9s3I1en0
         s3zhFTfUb60POL1Ym+5nauLxCTNIjXR/KKuX1EtPmC8do8F25li+s1b2TFbZ5ECSuQHh
         yvlwAvbL2V8O7tF3TiDp+Y4M7E24CHFRN8NAGyOcOz8zxiK1olNMHY7rOA+xJOrOsL0p
         IJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774187966; x=1774792766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7drRmchDDg/N48TpGcKJzYUq/Y3ryPf1jRTgQZqpjK0=;
        b=rtlJz8DbSNhNjzwrIyD3E62DIKyXVX0j327WGd1zsJXAGPgHs82/gXkn6lehvHwiLa
         FmHoO/wOSsvR3njG8v4CepzYk3L7DUUhECZN0y1hzt56dkco8xGWGET1g8w1sJC+KG+u
         bNXQkVMQ2JRKGsPt/L5mk7BtNEEkzTBHstj8zjCbehl96rd3H+q/N15+EjOgV2iIZ8lf
         heDOjgnGRqIfUArjVJeyoGPVtaomhbFHTuedxJE19lNvoM4OXbK+JPTyDdR40i5JgrLV
         Z8r7aQvI9NawiB0/nWmTyBms2/zht4xjEY+/OngRzdCmbtcMKVkL9pc1gYWOkZxLCuYp
         /nuA==
X-Gm-Message-State: AOJu0YzI4ucGP28DULUzMkEVLAfd/sIBARobVeow2tANFLc4I7enX+PT
	SwG7QqhXSVzz55SQ6jSULEornThvIRDGOqFCnksbHQhJFGTl9HOtGp567Wofhg==
X-Gm-Gg: ATEYQzzBhwnIqov438x7UkgtS7azqDnC6X6dM+ODvP2oHIpLTgaDCR34AENVcxwNZL0
	OvtYbeL1CfR7ZIwFJqitBOdLf/blqBnMjJKmQ1VzDb1/uFNbcfvh2FLFDUSDU2cJzHY+g6dS8ER
	z4eI+FQterkRbK+subVjWjo26asgJUhRknWbRO+p1YWUqUOEXRtcLbOEkFRZGkxPelH9V15gij3
	YrYzouW2Zwg3+OZgdaL+ykh6k2ti6GMcqSBkrsrOmQbiKhNvGCeQC7wj1nkOMgHzL3mYFT7hspE
	pJDSRl3Mo9PHDWCgJPkBJVdtG/KmBfK+hajwl7NWG8hY/YefBuYy4y7Hivy0it6cANLj8tWJ8MY
	aLyfyJJWkThDcZGjFZUWU3M+HAr/hQYouTBdKDR+PX6voAJgWyc1v/8AsBV8VsTy2grL1sMte1x
	lARs7eDTsqNsLOTRbN31sX/SLyRjc128ME8YxRJDUvdlU3mc1MdERevdLz6PS8YRN0mMRgE4Tws
	L6ZnY/YC71MBrquOs5NQeWy29tZT5ZNjOELKu0jlFf593gRhLnZwxKXu/v880iemfJWmOUpAQ0r
	wg==
X-Received: by 2002:a17:902:ebc2:b0:2ae:a8a8:92f3 with SMTP id d9443c01a7336-2b0827de557mr95617825ad.44.1774187966042;
        Sun, 22 Mar 2026 06:59:26 -0700 (PDT)
Received: from suraj-HP-Laptop-15s-fq2xxx.. ([2402:a00:163:3509:5e46:e785:168a:108b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656b51sm97723425ad.54.2026.03.22.06.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 06:59:25 -0700 (PDT)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH] media: i2c: ov5647: handle V4L2_CID_LINK_FREQ in s_ctrl
Date: Sun, 22 Mar 2026 19:23:48 +0530
Message-Id: <20260322135348.11339-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-56630-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surajsonawane0215@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABE252E98C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Handle V4L2_CID_LINK_FREQ in ov5647_s_ctrl().

Currently this control is defined but not handled in s_ctrl(),
so V4L2 falls back to estimating link frequency from pixel rate
and prints warning like:

  v4l2_get_link_freq: Link frequency estimated using pixel rate: 
  result might be inaccurate
  v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ
  in the transmitter driver

Handle it as no-op since link frequency is fixed per mode and
not meant to be changed at runtime.

Avoid these warnings when control is queried.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/media/i2c/ov5647.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 6a46ef723..a5a9cff5a 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -999,6 +999,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(sensor->regmap, OV5647_REG_HTS,
 				sensor->mode->format.width + ctrl->val, &ret);
 		break;
+	case V4L2_CID_LINK_FREQ:
+		ret = 0;
+		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
 				ov5647_test_pattern_val[ctrl->val], NULL);
-- 
2.34.1



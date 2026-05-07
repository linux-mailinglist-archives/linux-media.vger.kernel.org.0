Return-Path: <linux-media+bounces-60856-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GkCDQb9/GmxVwAAu9opvQ
	(envelope-from <linux-media+bounces-60856-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 22:58:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C506F4EF0D2
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 22:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8FEB30309D7
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 20:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1C9342C93;
	Thu,  7 May 2026 20:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EVQ7j/Vk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3480C34165B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 20:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187499; cv=none; b=hWSn5w7+v5jqDxj8nOrE7dUqPGpqPQcXM6weld8KnK4Mi2NJryU4+aENXOsszz3ODljGXn4albZyCkj0vmMwPhGLyH2w7kB1Y3R9cUIDpvjXhXLVr+w4iI/dTdhTLG5jRUK2WJDdNMh8TdeRcXqNjY458YWqEcQs/jGPo+NAZ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187499; c=relaxed/simple;
	bh=qlDyVSguO43yD+o1D6syNL7bDlNFGJb1XrBv5FCyraM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rf5DP6Bol18J2jMaSN0mh2ujf/cvqih+PXInWryccaHjIuKUxKuTudfFuChT3Gl2w1nqxD2MjOEbRq8TZhSi+Nanv35vxTd/wYFIO3jTBSR56jyhtXJoVjrEvcVZhp6+BdDBV+DPuaiMK6uIg+mQDtf5cP/6Qga/ykB6nUXSoAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EVQ7j/Vk; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso11903371fa.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187496; x=1778792296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rR9uqI1Ds3GQSANQEb3RBFKQcN17Sla3ff1JK+seUFw=;
        b=EVQ7j/Vk0pW4YkeYVee4tzv2elhRG20B+64GXeQDslDKUE1CWGszah5JaeWqF8cRFl
         W8KccwhoUyPRKvLqIrKhH5imFFDXsjmsWQ+vzGQENjzeL/6ynH4W+yphtRABvNr9oyWK
         ht+87mbIATACGGBIOpTrs2z6N8SFGCkL/bae4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187496; x=1778792296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rR9uqI1Ds3GQSANQEb3RBFKQcN17Sla3ff1JK+seUFw=;
        b=ozrOJdFDXpOF2MtHabL4Wd/S7NcK5W4W8O8M5kmSd41k522Utxw9f3gyQ1Qmy3yQHC
         kn2JOb2njRHxgTbQKWwopKqzNXavHry0ZA/3BHnxwljcJQ2PomhgTqo5Qm6+20PwUSD6
         /18FoNWuCsTwa1rkUVkXW7d8H/h3ujFw3SlKEVluTSYGQoFYfe4ftNsuXLN7mbcX17IS
         cVE7A4zuxS/FzNUiRQsDlyU6eg0eLbq3PD+A/pwiCZsTq7xMfiqbNPCQgkgnUBVuCmd5
         AF8XSLmSWzWrcrCyzF1Yf1tKI3nVIhpE0gZbeLLIVpDULOXUE2o5YORhD8ttsc0qbint
         X+xw==
X-Gm-Message-State: AOJu0YycqxzeFWOdRio1FAb2MFZ2hRCSFPNeB1lfGcGtKBOgBSsapNoL
	JNL3bC5nXUXUMBziaMFED82QvKc4zk+SsPJwukE3FV5G0vOFfqcKa8GnRbzU3/ACFg==
X-Gm-Gg: AeBDievqgPU4IK3oZ1/D+OsbsG2807QNqELGCLsH86Lr2r/M2rtrOW3a9KPIPD5He20
	8Y5U9e52qMUKc3bZUQIuvr9iZPul9C+hnyuSM/eEzOv5q0iyrpznCUvLoRArQqtrlO0ad3KcXvp
	IkHvsc0Db5VJ4dJjg3nTGDWarzfwY2h12W90K5Lu87zmgbHOSXg4Dqdm/4sV7hAUVcTD6e1eTiX
	QxLQaK5hWRefiSwt4I5ba3FRGeXqZ9IGVFytuWajRttdIZ71tZkfaYickJ0x6wfw95aue85XhPC
	fvpy/AbCaL6hCBCPnIbxfoXuSAXj5Yx64iPPI7sYWdkAJdZlA9kJwrftsH5IlUQmRDjuwLcmu80
	FU0Ufx4OeRs+fsTah2Y2VUguLCMAwU9beU9Acgu3PdR2FbHvCuW4aeBxuD3N9LEV/bxD8tMsrgi
	PPoHa80+4A0JxupKGcqasFk9iwgIaMwXhSTgfrGMYmEi0g4GbNTzr3L70ZuoF49whm3AIFPKPYJ
	EaKqKs=
X-Received: by 2002:a2e:95d4:0:b0:38e:d870:1db4 with SMTP id 38308e7fff4ca-393c41efc1amr27481061fa.22.1778187496487;
        Thu, 07 May 2026 13:58:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:08 +0000
Subject: [PATCH v4 3/6] media: i2c: adv7604: Add range checks for chip info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-3-cc195f142167@chromium.org>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
In-Reply-To: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: C506F4EF0D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-60856-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

If the driver's chip information is invalid we can end up accessing an
invalid memory region.

This fixes the following false positive smatch errors:
drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7604.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 67116a4ef134..ae75982fb514 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3668,6 +3668,12 @@ static int adv76xx_probe(struct i2c_client *client)
 
 	state->source_pad = state->info->num_dv_ports
 			  + (state->info->has_afe ? 2 : 0);
+	if (WARN_ON(state->source_pad >= ADV76XX_PAD_MAX)) {
+		err = -EINVAL;
+		v4l2_err(sd, "invalid chip info\n");
+		goto err_i2c;
+	}
+
 	for (i = 0; i < state->source_pad; ++i)
 		state->pads[i].flags = MEDIA_PAD_FL_SINK;
 	state->pads[state->source_pad].flags = MEDIA_PAD_FL_SOURCE;

-- 
2.54.0.563.g4f69b47b94-goog



Return-Path: <linux-media+bounces-60130-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMHbIeSQ9Gn/CAIAu9opvQ
	(envelope-from <linux-media+bounces-60130-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:39:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8444AC1A3
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C219F304DCB4
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 11:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734C836EAA5;
	Fri,  1 May 2026 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iWSW1Sak"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69E83644D0
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635185; cv=none; b=DupOt1JYeRyNbvcXF+AbAMKG4klfRPBbjptoc8jTaSMPeO7Ntjtikywnpz6Nyvsq0TZl7nUu/jMDSHJikPZklh/6BIU1MQ1WcP9EdQu5ee/0ziLp2HbXozZMTN6lxBletHNbgGBpxEHvA7f7Zb6SumZgkeOBQ+1PGWcamNS+EeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635185; c=relaxed/simple;
	bh=1ZSaYK9KkfV5+GCoFqf+X0v1Q+Y+dHjA70Bg+RMm57U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RxRrEzf4xB16pl1/aaM0OJSn7bHc8kT5q/peEZPe/6WlNZ475gvK4XYh/zyI5EVbp08IKB09rJZB9Ji4Am57AYRfXhEHdYsroHQmDFRU8IT8gmOgp8uElua7FgJuu/6hA0uV7hmrbUEd/lIlt45lYPKMaZNLyahqwYO0YMz/UbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iWSW1Sak; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a283c44478so2865910e87.3
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635179; x=1778239979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnXlL3KzWzfPtDefDXKY2+uDbjeKnEfIYOtp4pEQbxI=;
        b=iWSW1SakPtcqlRtJ9/IUNdFCE+zw/6MBiH5kaYoEmPJJwt5ug8p5LFr2i85gkTSUtc
         hU2Str6N6aBFJ4ErPQysjOEn9I1qpeq/XPpnFXvBqDvqrBPTcaJdYcA8wSwCv7MjkHTC
         L4lYVSxs5xFjKnU626ohoKW4HxR+NNo7sADg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635179; x=1778239979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BnXlL3KzWzfPtDefDXKY2+uDbjeKnEfIYOtp4pEQbxI=;
        b=mlxrUpZkJWOvWqs39ulu4RBsNmiWmR7TiO8wWfFkrMJU5wa/xHzpVaxetQbCXDg4+m
         Rx5JJg6Lf9BRlP4zkgomgj506SixO0XPHANY9nMmUFdGyUqbwSlrp/7V3hoIPnaaAQV8
         kdWAw1JB/DL/ctxLqZ+ND58hfRoH4hC2QP5am+eT/DISnFDTCzW8SRiVx9w8koPdoI9H
         JC/WZO+V2z2uCPomjIKI12OFCFGoCXXAoXhCTIkhfn9MkcHo15+DSVX/JpV1Ex0jzfqF
         bggBOWlYOkyJv74qnYTK32s58a+pJJ/iSBQz22vwz7AY8xF95uCzc/HhZZisEpdhp2n6
         I66g==
X-Gm-Message-State: AOJu0YxeOY7MN+qvD1RQyaXMej2DBFwpQpqZrXd+uYfNGd2dsi7b+84I
	nEu4oF16XntuQW0HHmJNBIJn1I4BQXP98A6v77KN2+ODR1Aee0H2U1R2yUsrCCfHaA==
X-Gm-Gg: AeBDieuOvc6bXzuYU8k0pYYCqfebOQE9zsVrp4kogLmmt6DvNKTRIXwbrUHSFzaQmCl
	d1MecZO7s0eyeRfjvItEbne8aEXtVdQDuFP1wE4ilDzDSX8+TxCwh0J+5yKBGfyI+QcQr9AJ8oD
	X02kwYemdEcl6qdysNPNKJRi6XUjTvMz+BruR4yIbBRdYzAHpFnmWfGlyxf6T/DRE0w0A6DV3Cf
	I0cYYe80DsAcTt87NMXww0aWyaurIK0gi78aMMSfVkQQXy+AeRHOvP1wW9W0o/E7Pp9lGEFwBDr
	gGUN20ghWMaGaku7UTayVYjEzYosPfTwe4kWySdsZkJGoNJFXaG2SWI6M/fW6Z7gU3RKOaKLXWs
	LY+MkP5vAMATxQUGx1zBBexXmby7Xx8QIyGNa1aFJgmRz/gCfZLVEAPSPqkkKlXp853fV0bhHeP
	lsMKdDIo07KKSRxTasYxQypci98xAlvmyVT8ysMy/u4rTz3BhMKv3qtbpRBH6G5ToSPJ9JDy8V6
	Y5t6h0zXWwQboHhlw==
X-Received: by 2002:a05:6512:1092:b0:5a3:cebc:65ca with SMTP id 2adb3069b0e04-5a8522b1196mr2252516e87.7.1777635179035;
        Fri, 01 May 2026 04:32:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:32:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:48 +0000
Subject: [PATCH v2 3/6] media: i2c: adv7604: Add range checks for chip info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-3-a2fcfb2531ac@chromium.org>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
In-Reply-To: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: ED8444AC1A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60130-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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
2.54.0.545.g6539524ca2-goog



Return-Path: <linux-media+bounces-60237-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IweG9dC+Gn9rwIAu9opvQ
	(envelope-from <linux-media+bounces-60237-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:55:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632CF4B90D7
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24F553006016
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 06:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AE32E1C7C;
	Mon,  4 May 2026 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y+/PNc+g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C43B2D5A19
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877655; cv=none; b=Iy+UKjYSZ3N8saSXuOAh72R2+nCz5yUxRoQ7A77WW9UkN/zgO4/57l4p1FN6lHBvR/IsjYELbcBzR9p5D9WQjHNEKVhwwTSO8MxvT7yiyFlrqLIuLtRzjaZ9xWUXgpS8mEBL0yuOWN3EjrJGIGti8qUyo7kxkrVPPua3XgWUVRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877655; c=relaxed/simple;
	bh=tLwMsZtKESL5KitvooJvICOu2RrZ4OM6qvgcLZaroZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POsirjqBibn7d6BMw6gbkPfMHVdvxwVfSbxFLrEDUUDGSOuoL9hCXQAnHigDUU9SkY4AKEFiYyr1T0t5ELq/bNQmNBns4Dr6EDCWGw8gaSzPkOTxggAr/u8QNdGFwwVqTcD0uQybvLgdjn6/tOOBRWwDr9X4wpkWLWSCsUQVBeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y+/PNc+g; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so1653794e87.3
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 23:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877653; x=1778482453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DO6EYg4vrsGld5Vns0zx8Rx5L9ViOljnC9zyP7KqNys=;
        b=Y+/PNc+gBaOBV/R3yZtS5BkfC9QiihrpbwSro68IdCRdRKsH2o6digdm3TTAJd41c+
         T6l0jM0/e84bge60od94j/4YWysqdeE5mqVQE31FNcFfl52QQC1bXPCU1ra9H3GTOeww
         FdnH1eUUa2dTg690mvhRTJQ/f7gb3cvjUYTTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877653; x=1778482453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DO6EYg4vrsGld5Vns0zx8Rx5L9ViOljnC9zyP7KqNys=;
        b=Y2PlKMLdQKhrmUL2VF+wVBhJW9Iq2vRN78AcZYebLII8zTYNvlIOTLSgi4DMOtcE4O
         AuMoCxkzeqLpMJxEMldg3PG3jJI/FlsROzE5dzyF2q5fJ4G/XYcLOiHOV2kvhHi8qo3J
         jOpjrMBvQqmcHIqehwJmV79gNWsbr6hdzoV0iAWmJ+e80Y0zQ5/39gt+RN1Vgo8Q50Pm
         jGJNkwiNb3Le0+pj0zFwa+Qc5cqpQdfNzM0/Yum2aZntj0uvgrWbsv10+Xeaod4lK5kn
         dsEHBKdtLPX7u+j/LBg6po+n/inMSetmOyzW5oSCLiElBSSuJPelGaCtDrALddrFOgwm
         t7wg==
X-Gm-Message-State: AOJu0YyhHcC/E539j8YxYbd5TeyNp0zNM5fKO2ooCTe3KC6XaEkAs/I4
	rOL8vr8ACOf7CfGXrgwfAAqhargSQt64Bn0hxaerOkWdDomM6cBU8TqcPgO94LYodg==
X-Gm-Gg: AeBDieuLQ3RPNs/WiGDZwt/BHGPD4SJuiGWdGYRNmhSOAzV9bdRAXwL88K2+eEPnMY7
	C1zqY2S5rVtwk+NoHDBYUsziZIynvwkk8OZbAnqen6ibN3iuMu5Fq1Ho4KMYiSvpqGIH22lIHZT
	y2XDO7HyxhRuVPuSEtdCL7/VvZlj1xkQM9LNMo/FnXR56J8tIUvBgt+WY+KcyOpjjsX1ijht8/x
	hhBqxtrmdi55EFuWwbV+9mazxUjeyurtebDs1/+uV65+HHiQU+W0AI+gwN3KxP6H/sqK6zldBmL
	XSNAJMZ3weyrN+243IrykX2sMLUcR7jJrGthoVabufmURldlfFNkELN/lfMA7SxAYP44EmsEZJ4
	6bPJWS9hyidS2vQMITz+aUBxAOnKTIod8FUJmw2s/5mleWR648ewh9wNKPynZvQt2rEA21ErsEk
	Zp2qS96gjtJGIDyFov9AssPy6rhMD0GJgSkUKWLIcobrSkrsonBYTETyYYJF4zdknD2OxAlObdp
	d/m0aHYppICPRlnRaFpDMyZvtLC
X-Received: by 2002:a05:6512:3ba2:b0:5a3:d1d9:6080 with SMTP id 2adb3069b0e04-5a8631c00famr2451231e87.29.1777877651260;
        Sun, 03 May 2026 23:54:11 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:05 +0000
Subject: [PATCH v3 2/6] media: i2c: mt9p031: Rewrite assignment to make
 smatch happy
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-2-fda125c30058@chromium.org>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
In-Reply-To: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 632CF4B90D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60237-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

The current code makes smatch a bit uncomfortable:
drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'

Probably because smatch is not clever enough (yet). Do a simple rewrite
to make sure that smatch understands what we are doing here.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/mt9p031.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ea5d43d925ff..8dc57eeba606 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -796,7 +796,8 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
 			data = (1 << 6) | (ctrl->val >> 1);
 		} else {
 			ctrl->val &= ~7;
-			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
+			data = ((ctrl->val - 64) >> 3) & 0x7f;
+			data = (data << 8) | (1 << 6) | 32;
 		}
 
 		return mt9p031_write(client, MT9P031_GLOBAL_GAIN, data);

-- 
2.54.0.545.g6539524ca2-goog



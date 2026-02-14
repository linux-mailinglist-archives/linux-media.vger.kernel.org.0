Return-Path: <linux-media+bounces-52811-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN/3EJNzkGmxZwEAu9opvQ
	(envelope-from <linux-media+bounces-52811-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:07:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A413C0EF
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E56D304BC39
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 13:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB3330E851;
	Sat, 14 Feb 2026 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FVFH0bot"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B24530E84B;
	Sat, 14 Feb 2026 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771074355; cv=none; b=ZikRxPTBNC+SAAvo28axsxcuoJ7N1ZGX3Ycqrk0hp2AY9MVyhR/7TYtoTBZoGlm2/wNe9MANUQZul7LrEXKAI9HBqvj2VgqYVcA5AUdnUd6S9uuv15wyet13CQ4oOTczMrHIqsnHMuTImx0+O2fD9UgCvdSqi8Qx95WXEYFQaO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771074355; c=relaxed/simple;
	bh=ABNEPJUoE5R/NR5YbvAietOAlmUIsolfr6/ifzWQF/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mTQt40YPskVWzV9n+aDo67eNOqMHxbbNi98hNwGMssmmqWEPw7qfwlkdgGAz6fFVFFMwCe/37YN/OSuZAKn6RmcGyOYzxXZ8xiOqO6VDlX3v3ndEODpDKS9wDz/zkETBN0NhP/3kzU9EX5pya/qKLhs/XPptXzL1OD7Yh5V3wM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FVFH0bot; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5CB819A2;
	Sat, 14 Feb 2026 14:05:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771074302;
	bh=ABNEPJUoE5R/NR5YbvAietOAlmUIsolfr6/ifzWQF/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FVFH0botob5ke1jYywX960dMRuwtwZXC3i23oXSShTEws/abIo95BIrL7V8+IZlGc
	 mMIXvrByzuFjdEiZPsVfQ9NdOnbDyFOUrcvf2CFrMjsEr8OThyK7n/nI913ZCApLtK
	 ln3XnnW6Ab32EItQylqXrJ2YHvaZnjSkWWby5Zug=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Sat, 14 Feb 2026 18:35:21 +0530
Subject: [PATCH v2 1/2] media: i2c: imx283: Enter full standby when
 stopping streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-imx283-hang-fix-v2-1-f4fd3de0f020@ideasonboard.com>
References: <20260214-imx283-hang-fix-v2-0-f4fd3de0f020@ideasonboard.com>
In-Reply-To: <20260214-imx283-hang-fix-v2-0-f4fd3de0f020@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ABNEPJUoE5R/NR5YbvAietOAlmUIsolfr6/ifzWQF/0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpkHMiueVq8Jzpm8PXqMSK0+pvDwGBF5A5QeSWN
 xniILmP042JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaZBzIgAKCRBD3pH5JJpx
 ReN8EACaUoBcny+brlsrQb9t9lyDzU0s/OBTF1Hq8KcZEIccHjJehFGgcaO2JRbqwArLRhmA0eP
 VJw+GKTZB5sKFjJh3XN6vZ3VCFNDjIDbDS17Mi83InvPISasdZLW6ocqDS6JSzJ74yL7djfT9Vy
 XWkF+oML4CGnOkcRGuNGTRkmSU0V0ythWpeWUjkBuTc9zwowc2PnJf+kZZFMbFbD5GzWpTbB9Zj
 9G7m1bcBx1zEUuzSiNVYNHgqcJYS75s1EjhEZ+e9zS4CuQESbK7PNeZ0IAbGxarcFNwfyBIHFdM
 YNedJX8Ty0hHHur7MYZx46RGi039+OiEvtSst+LcahXrXfKHWQW4/ADZq9OCjtTLGpb0pEy4D06
 gdrk1rcy+JhWl9lWL95Pjvggs07XmoE+LePyMoStwEtLU9ke9NAjFaClEwOc8I6K8a3WBqMPvVW
 2oyguWmLTrM+S7/VOfFbSqO1NzOEAqTdCmcyIpwH5Kmf07d4j1mn9hZl1iwfCnmCy7ifvCbrDFD
 IoGGpBUuDBuHen8qCuok1h/W37qrGmlT15Xze+v5uk8dKms2bf3YD1OmFnYptu7Vc115GK7Qe3x
 RByi8YPrGz+U/8svZaXGm05P0N/2XhAtpxhF5o9sEFWWx4186tVryysHBtesBUEgLIWa5PzycYN
 Y8u+3knXipChmjg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52811-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B99A413C0EF
X-Rspamd-Action: no action

Use IMX283_STANDBY (bit 0) instead of IMX283_STBLOGIC (bit 1) when
stopping streaming. STBLOGIC only puts the sensor logic into standby but
leaves the MIPI interface (along with other components) in an
indeterminate state.

This (presumably) causes the CSI receiver (e.g. Raspberry Pi's CFE) to
miss the LP-11 to HS transition when streaming restarts, resulting in a
hang of 10+ seconds. The issue is most visible when immediately
restarting a full-resolution stream after stopping a 3x3 binned one, so
that runtime suspend hasn't yet been triggered.

Writing IMX283_STANDBY puts the entire sensor into standby. The
imx283_standby_cancel() sequence already handles the full wakeup from
this suspended state.

Cc: stable@vger.kernel.org
Link: https://github.com/raspberrypi/linux/issues/7153
Link: https://github.com/will127534/OneInchEye/issues/12
Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 8ab63ad8f385f6e2a2d7432feff0af09a5356dc4..9b3094a57873c6e8ff8c41d058ea3b0012642cac 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1158,7 +1158,7 @@ static int imx283_disable_streams(struct v4l2_subdev *sd,
 	if (pad != IMAGE_PAD)
 		return -EINVAL;
 
-	ret = cci_write(imx283->cci, IMX283_REG_STANDBY, IMX283_STBLOGIC, NULL);
+	ret = cci_write(imx283->cci, IMX283_REG_STANDBY, IMX283_STANDBY, NULL);
 	if (ret)
 		dev_err(imx283->dev, "Failed to stop stream\n");
 

-- 
2.53.0



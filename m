Return-Path: <linux-media+bounces-62328-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF4+KC7fDWro4QUAu9opvQ
	(envelope-from <linux-media+bounces-62328-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:19:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42813591BD8
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5F5C31B16B8
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE7D3EF0A1;
	Wed, 20 May 2026 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYMlE9Km"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D663ED3A9;
	Wed, 20 May 2026 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291430; cv=none; b=bREnQq30mvYElAjqpCe0DWTFNSmcPBmfCduTeb9yeA4FoyIABWLujtdaVrRrnFt5xEgjGsq1dI2i0FEcPeFppXGTXRZT98OS0F8Zomiy3K8N87M+sCDRn0X1jQglJXtbJanusXWk6U2sOKDYzibbI8svnxdA4Zco9eXqymLSHKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291430; c=relaxed/simple;
	bh=t9dlwa/PW4NqUH44Ui3R+NtfUyGFxOU24A9dkasKujk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oCwkcgvqXBPvBvSn+ANeL61h9Q+qa/mJwts6OEiI9fzEOF+nYjMGyO+7grXffac2y2am4dJFnFlC2CY6CPpZzic0lPPA0UbSxpCoDyrdBK1a09ia7Q5ewcp5DM9jWcCDV6VhTvI01wKQP91r0JkJO3aPqopAeq3bwV2gzaDGTMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYMlE9Km; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F601F000E9;
	Wed, 20 May 2026 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779291428;
	bh=yQGi3lzFLr9/fuMOxDQJrgdU3HWx1+ohqNB/fah88rE=;
	h=From:Date:Subject:To:Cc;
	b=ZYMlE9Kmp++UqCoKJdvPv3O66yqECsvJJHz5ST4OO9z+l5BjAIJFoiRq1aki20w0+
	 /FIa0T55nmo5pjhA3gN7p+UtOuh+NGHR5vkCozLHJ0oXDgqR0xIhMGduAnpDoYQQGc
	 T8o9PBIzvZkOADFjbBlmzr9rrHTJO7r2Vq9ygVc82vaOhudnO0D1IX/TwMpRrWaL5L
	 rrUpfrpGh5FeX4RDb9mfZMc4RCOGpYCMcSQ+UvXtIK/CdE+OOlrStc5gh1H2jTuyQS
	 Drin9ymoq6sS15HANYDRM2WA5W/RJoRe1+qwsbSdQ+R3vo+mAtV1glpH7YLKxKG/1s
	 Eye/PQ2D8HK2g==
From: Eugen Hristev <ehristev@kernel.org>
Date: Wed, 20 May 2026 18:37:00 +0300
Subject: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for
 unpacked formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
X-B4-Tracking: v=1; b=H4sIABvVDWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMD3aTk3IJMXaNkEwtTA2NDk1QjQyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQACC+XwaQAAAA==
X-Change-ID: 20260520-bcmpi-2c4850314e21
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maxime Ripard <mripard@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2451; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=t9dlwa/PW4NqUH44Ui3R+NtfUyGFxOU24A9dkasKujk=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLJ4r8qtmRM4lZ/jayO/yc9d194mbfz00VnM/avJim3ss
 opF6kqHOkpZGMS4GGTFFFmqTf7VCvfvcD/paqkCM4eVCWQIAxenAEzkYwPDP9NZT0KPzvkefTyB
 ZfXLiPCyJ/VxvorvRPMlFy+3+XB8pQYjw/T2rTcm7vfksd4m9HP9up1T3Ob9v7k64pXp/s4M+ws
 3AjgB
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62328-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 42813591BD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The commit
08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
introduced a check to see whether the format requested is the same as the
fourcc in the format list.

However, this breaks the case when userspace requested an unpacked fourcc,
e.g. RG10.

Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depending
on what userspace requests.
In the unpacking case, a dedicated register is being set.

If the userspace requests pRAA, this works, because the check validates the
pipeline:

v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=pRAA \
 --stream-mmap --stream-count=1 --stream-to=frame.raw

but, with
v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=RG10 \
--stream-mmap --stream-count=1 --stream-to=frame.raw

unicam complains at validation level:

image: format mismatch: 0x300f <=> RG10 little-endian (0x30314752)

This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into either
RG10 or pRAA depending on the packing register.

To fix this, modified the condition check to also allow in the case when
requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.

Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..cc7627e9a51a 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_link *link)
 		 * In order to allow the applications using the old behaviour to
 		 * run, let's accept the old combination, but warn about it.
 		 */
-		if (fmtinfo->fourcc != fmt->pixelformat) {
+		if (fmt->pixelformat != fmtinfo->fourcc &&
+		    fmt->pixelformat != fmtinfo->unpacked_fourcc) {
 			if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
 			     format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
 			    (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260520-bcmpi-2c4850314e21

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>



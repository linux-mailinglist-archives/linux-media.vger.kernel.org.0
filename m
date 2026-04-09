Return-Path: <linux-media+bounces-58330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFH+Lo2u12kMRQgAu9opvQ
	(envelope-from <linux-media+bounces-58330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:50:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A52163CB8D7
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EDE84300BE31
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EFE3D332F;
	Thu,  9 Apr 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pFSGkhfx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C193CAE71;
	Thu,  9 Apr 2026 13:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742590; cv=none; b=G4GReBP48z0gSFilNqC5adkOtyJyJM6xUf85NdugASMCll6tr0TRi08AoD9ttIr9OfNM3yy8cuKKfTMtVCa/S5udWJetMNEOBXjtRPT5TgHms174uTCYCYdMvrRreLcSVmrznGNRlREKHAyK2i3teeUzT8tMc9oESvrV7j4NACk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742590; c=relaxed/simple;
	bh=jqcrmMuFbfsiDA/7PQOZmdVkbmu6Ur3HF3siTrHCda0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMYVWoNKFdKqJay5wUVrWyNQAMTCQMGHyJkmlE9xQlNN1UFjE+UiFbXgD/os+dHHThJ4xqTY4aaftsWv07N47ObrNqFljUC9fMyD6jxMW0uQLFzzTuKqc7D3D+6OQCbyV/gzStsfahHPJRMW6AqjrEpZWtQEVmqEuo1AioqO+zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pFSGkhfx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F73BC19424;
	Thu,  9 Apr 2026 13:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775742590;
	bh=jqcrmMuFbfsiDA/7PQOZmdVkbmu6Ur3HF3siTrHCda0=;
	h=From:To:Cc:Subject:Date:From;
	b=pFSGkhfxQZPZex4oCEl+r7ZdkSqgh17p4D68OTn0sOjPP5KB1Y6S1CKmkXCUd9TdU
	 LnkU6nOPE3vi6UwSxOje5gx116EUA8rpi/G/iyfIiQWor+xRKGke1WSs2P9UTjH16s
	 I364Czjd0pnTFN/NeCGLDuszkJTey7sxB5BYeluk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	stable <stable@kernel.org>
Subject: [PATCH 1/3] media: adv7604: avoid negative array index in log_status when cp_read fails
Date: Thu,  9 Apr 2026 15:49:44 +0200
Message-ID: <2026040943-finishing-daredevil-d6e0@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 36
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=jqcrmMuFbfsiDA/7PQOZmdVkbmu6Ur3HF3siTrHCda0=; b=owGbwMvMwCRo6H6F97bub03G02pJDJnX15XXrWGsYTusVKtbqR3fFDftazxbaPwx0ZJzU2a0J //M/pjYEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABNZq84wh7/6wnYf50VOyWLX P4nOV4r7f/iRLsOCS9of/iR+457AEW1hWfoijVn525ccAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58330-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A52163CB8D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

cp_read() returns the negative errno from regmap_read() on I2C failure.
adv76xx_log_status() shifts the result right by 4 and uses it directly
to index csc_coeff_sel_rb[16] causing the right shift of a negative
number to result in -1, reading a negative place in the array.

Commit 8163419e3e05 ("media: adv7842: Avoid possible out-of-bounds
array accesses in adv7842_cp_log_status()") fixed the identical pattern
in the adv7842, so do the same thing here.

Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Fixes: 54450f591c99 ("[media] adv7604: driver for the Analog Devices ADV7604 video decoder")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/i2c/adv7604.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 67116a4ef134..02203fd4c937 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2641,8 +2641,9 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 					"(16-235)" : "(0-255)",
 				(reg_io_0x02 & 0x08) ? "enabled" : "disabled");
 	}
+	ret = cp_read(sd, info->cp_csc) >> 4;
 	v4l2_info(sd, "Color space conversion: %s\n",
-			csc_coeff_sel_rb[cp_read(sd, info->cp_csc) >> 4]);
+			ret < 0 ? "" : csc_coeff_sel_rb[ret]);
 
 	if (!is_digital_input(sd))
 		return 0;
-- 
2.53.0



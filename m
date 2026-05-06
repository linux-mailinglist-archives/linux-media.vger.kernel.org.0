Return-Path: <linux-media+bounces-60605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG0JNPpD+2lPYgMAu9opvQ
	(envelope-from <linux-media+bounces-60605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:36:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A274DB113
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B17D3017005
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682E53F9F4F;
	Wed,  6 May 2026 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knN8b5Oe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0DE30F927
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074563; cv=none; b=QGqOan+CQiXjZzF5g1J0krVzfqfYYYkZePfs5OhRoEmbQjj9e2Qhsoo+Ap5zlZSH+zz5mM3wXO2lrm/zEOg8jG+vx0iTdu1IFHkhn6IqX2Z16g34AY+uhOutI9gyJPFNVp98XzZHmnqmyPjZo8HTwMp/DyMLG7NDHy9i7r4M/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074563; c=relaxed/simple;
	bh=Cy1kJ4rFopfeY8WoIvwuo1icLY/akZbENU7TB1mXsD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PuW+dmfe+ZIvv37TYdWTungo9AgGvfmup0s17QgjtNZ7mORiUQY3miegdln0BatUJuee4wHFmvxOl19lAOZQK38isaYFVqRAOZvGwrJxCQQ+In48yKhRRYR4ngTKY5jIb5nixIWoZT02xsRmmzG/yZheZ5I3ED51cNY95H6I6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knN8b5Oe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34CEC2BCB8;
	Wed,  6 May 2026 13:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074563;
	bh=Cy1kJ4rFopfeY8WoIvwuo1icLY/akZbENU7TB1mXsD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=knN8b5Oe2jOiJUdKte1fCXZYZbBesNFssNxKOx8EYF/AQFSiFg6Sc0ugBWc1eVwqo
	 398iVz8UaSf+lXOmxc29fbltliCewh8erBt0LYqn3KksqOxh9gaTjAGt+q/0TqF1A7
	 bAUDLkLFIYVPSzaQ1oOSvvBrFLVXQi156b/v9sgwWNfh/2lvPd/O4cslBiKrTOA4Ft
	 AxlB6bY3ZueRzRPnBx7kHqcXf/Ib1Bt4hUEjoSt7OCYiKx2WWiX5jAYLf8gwxoM5sH
	 3BPkbm+wgPe1KhCa3wixPshsjw7ba8YvNyLxRGJc2klW/osgiXHsLAnOOuH/P8O4Wk
	 6xElBHDKDclOA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 3/4] media: cec: core: add LIP support
Date: Wed,  6 May 2026 15:34:07 +0200
Message-ID: <3b1942282ad4fbd448bcee29e5d99e9610409f50.1778074448.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778074448.git.hverkuil+cisco@kernel.org>
References: <cover.1778074448.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 38A274DB113
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60605-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add support for the new CEC LIP opcodes.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 8f7244ac1d43..a90cb84a4b4d 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1098,6 +1098,15 @@ static const u8 cec_msg_size[256] = {
 	[CEC_MSG_REQUEST_CURRENT_LATENCY] = 4 | BCAST,
 	[CEC_MSG_REPORT_CURRENT_LATENCY] = 6 | BCAST,
 	[CEC_MSG_CDC_MESSAGE] = 2 | BCAST,
+	[CEC_MSG_REQUEST_LIP_SUPPORT] = 4 | DIRECTED,
+	[CEC_MSG_REPORT_LIP_SUPPORT] = 6 | DIRECTED,
+	[CEC_MSG_REQUEST_AUDIO_AND_VIDEO_LATENCY] = 6 | DIRECTED,
+	[CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY] = 6 | DIRECTED,
+	[CEC_MSG_REQUEST_AUDIO_LATENCY] = 3 | DIRECTED,
+	[CEC_MSG_REPORT_AUDIO_LATENCY] = 4 | DIRECTED,
+	[CEC_MSG_REQUEST_VIDEO_LATENCY] = 5 | DIRECTED,
+	[CEC_MSG_REPORT_VIDEO_LATENCY] = 4 | DIRECTED,
+	[CEC_MSG_UPDATE_SQID] = 6 | DIRECTED,
 };
 
 /* Called by the CEC adapter if a message is received */
-- 
2.53.0



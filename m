Return-Path: <linux-media+bounces-52810-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGWUGnhzkGmxZwEAu9opvQ
	(envelope-from <linux-media+bounces-52810-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:07:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD813C0CE
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90CFF303D67F
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 13:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA3930CDA2;
	Sat, 14 Feb 2026 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RwSwQWR/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4D01A9F8C;
	Sat, 14 Feb 2026 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771074351; cv=none; b=D51xh9B+T4xCRjz/7FSXPoXlcvm1M8Vkj9mgpiLuDaX9YEgmdDESW3NXptgPQ/hUhrZ+BTjSJlKk0gxtNy1s0kemPMFBQoHWVN5a+6NoZeRIFqeM8vdFO++fUOH8pNFS6Mew1SDIu+R9wejQIgjaNzrWpFaqygCxB1xYyDvkU4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771074351; c=relaxed/simple;
	bh=iTAZwkjRN9H81yo51A/6q2Anlf/lLM//yp+kqGlgbdc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SWlkZm3DXY86OBUO2ZHtXuAReM5DUj56p4GvTL06r4ql/ky0Jyy/3xFkCDwFu5DITdb8qJloXKKiswuZZ67jT6TG3IxiHTQoju6/B9LGqTbKydFMxSHQLoLvITedVny1BMVUJIPg19ZeBe3BQK/Lo9YFoo5EDwFElvIRZkosfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RwSwQWR/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4FEB557;
	Sat, 14 Feb 2026 14:04:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771074296;
	bh=iTAZwkjRN9H81yo51A/6q2Anlf/lLM//yp+kqGlgbdc=;
	h=From:Subject:Date:To:Cc:From;
	b=RwSwQWR/PExLTPJPNs2VPyZZycuQyjd0zqgl3g2AmOo6Ht/m12s7sSz3PU/3XDFC7
	 uat5B74USrZ5544QoCSojRN/iMFOBcCicoMGkhBtBPwNayGNeXgB06oxofcK8PBoqs
	 Lw6PCl4OHtzgcZqleANM0V2dYie3e7bXBaPLK8OI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/2] media: i2c: imx283: Fix hangs seen when switching
 modes
Date: Sat, 14 Feb 2026 18:35:20 +0530
Message-Id: <20260214-imx283-hang-fix-v2-0-f4fd3de0f020@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBzkGkC/3WNwQ6CMBBEf4Xs2TXtAm315H8YDlAW2QPUtIZgC
 P9u4e7xvcnMbJA4Cie4FxtEXiRJmDPQpQA/tvOLUfrMQIqMIk0o00quxCPDQVZ0XTlUtXKWBwO
 59Y6c9bn4bDKPkj4hfs+DRR/2/9aiUWNtratseTOq8g/puU1h7kIb+6sPEzT7vv8ALoXAB7UAA
 AA=
X-Change-ID: 20260212-imx283-hang-fix-8b3f45087ef6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=887;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=iTAZwkjRN9H81yo51A/6q2Anlf/lLM//yp+kqGlgbdc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpkHMaCLdNo1xHQx6wT7UaYk9yfeeEl7QRhLCv9
 dTF3n7siYuJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaZBzGgAKCRBD3pH5JJpx
 RV/LEAClRitozEC8JTrQpT+YKESCW5A8+eTR8Um3HQQPo+q9lOw75G8KhIwBwX0QV9AcMN4SB4t
 Bosc2/uU36f/xpJWhlgoWD6gLqoZnI1gZD8lcQXdeK1mNZM0DXt4Wr+0+lUhrfm/D1159h8bxVe
 owW2gQsdWCfR69HLziUZBKsP8YMXiAv5Qc3a3zZ8VsVk6t2PLl/THOq0FyAbJHnA8gvhik+shIQ
 MoPeDnQoJEJhUbV2qzqJlvHAANVaO5NT47kJISEMUESVFa8SoVM2RPrdo2PUmaYM+9EV1kWwW3x
 6aPZWaQ5tVd0/75kBf43Imn5CJmxG4TMvVu5oBwJSwAiNGA3qWYmGk7G1cIEkRv7m3v36695z6G
 3g2LBd0ACHm53M5lDRL0Sfb7UeBVZR6eWfnZz2baUklAH/xhtZKKTY+6+B+LO53CKYYaoYFl7ro
 ijaO6SCu4z1Gur5oTV/3fEVzlOcbMHuSn6w6N6VhQsUwrZurGpBg86yNqEpBFRbR9h5RF3Q/CQX
 yUvhwRzha7frUhZGEc0jWgUYFKd4JEkPhrT7aqzDwS0z9XPPycCWVrjwJLf1JQSAXoTVRv2g53x
 SX6Q6UC9CJ/TUzmrYkCQ5RkGTNK85VXczxupZADoFoHudnIZGrd4zeAQ1tNE2Ac6TjiUpcRno2w
 yWH9ZpMXXcjcrLA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52810-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21BD813C0CE
X-Rspamd-Action: no action

This series fixes hangs seen on two different platforms (Raspberry Pi 5
and iMX8MP) while streaming with this sensor when switching between
different modes.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Add [PATCH 2/2] that fixes hang seen on i.MX8MP when going from lower
  to higher resolution
- Link to v1: https://lore.kernel.org/r/20260212-imx283-hang-fix-v1-1-57784739604c@ideasonboard.com

---
Jai Luthra (2):
      media: i2c: imx283: Enter full standby when stopping streaming
      media: i2c: imx283: Fix hang when going from large to small resolution

 drivers/media/i2c/imx283.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)
---
base-commit: f31142b04437da4dafd42a479936d19db53c5ab6
change-id: 20260212-imx283-hang-fix-8b3f45087ef6

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>



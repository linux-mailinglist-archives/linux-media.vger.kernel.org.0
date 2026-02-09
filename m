Return-Path: <linux-media+bounces-52416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNgZBv33iWl7FAAAu9opvQ
	(envelope-from <linux-media+bounces-52416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:06:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A78111873
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB5E73014926
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B5637D122;
	Mon,  9 Feb 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jlt0tSrd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9FC1DED4C;
	Mon,  9 Feb 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649406; cv=none; b=JFStq92dhfiYTR4lsQmQTUngPEM/II6HsK0hffmNWKCee7XbtsVuL7xlYk8TCZeHvzXKrg2SPjjw2yaQzHVlHOKcpdylO0lIrl6B6WWSzTlansUA8D2Fo8W7xstPp8NY27phBvHTNWSLL5zJF37+eBcjZdmoE0t+oNNLSpPkcTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649406; c=relaxed/simple;
	bh=TkTKw0kkdB0LniEy76wwyWLa1WRt/WWy4CQifIAYYBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JXhGs+8LVrpWbJcdc6wopo3w0peS5FVLV5sDVj2wn4eUHkxWUJEMNb0OWsZ/p7x5J0jgPOmYw+QPHGz5f7jS47NgB0YFcDbpqnCiczpJR0h5eYkuepG8PfjykOHEH8jaQX8yHrtVEpWUlNuAyfN3lOHYirKiHzkSKwCzvjM2dQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jlt0tSrd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A8CC116C6;
	Mon,  9 Feb 2026 15:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770649406;
	bh=TkTKw0kkdB0LniEy76wwyWLa1WRt/WWy4CQifIAYYBk=;
	h=From:Subject:Date:To:Cc:From;
	b=Jlt0tSrdJZmdOsYwojrDDPXhwY7cD4a9XRKnNsVYt8ZpGiN2aiPGHxECHfpwQIBmQ
	 yiAqehG2EOEp540yL1cT/+hT0wWLO5o996rVDc+s4ffCLAq7gEzdRTJwo1SBjx6c7m
	 zG5DyP+z1kmsAGDzfUyrWneZ3PjjzNjkREEz9wz93cT1WHTqlFvudvEfO7ltZCgeCy
	 djKJGIEAik75oOr6ZKH8gjCYDlnTapsqM2DGVIbKpnwGRTI59XSjqEp+F7586pcMLL
	 VYLiNIQWSsQLEUjUOI6u2ukzrjak5BzrMsDu7VWkVC41P3tblzIAX/BqjMK+PUjAHU
	 Azqg8VIgRdNmg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v5 0/2] media: Fix CSI2 RGB vs BGR pixel order
Date: Mon, 09 Feb 2026 16:03:15 +0100
Message-Id: <20260209-csi-bgr-rgb-v5-0-e7af3cd6cde6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MTQ6CMBCG4auYrq2Z6Q8UV97DuGjLAI0GTGuIx
 nB3KwuV4PKbzPM+WaIYKLH95skijSGFoc9DbzfMd7ZviYc6byZAaChQcJ8Cd23ksXXcGVlWBjy
 AkyyLa6Qm3Ofa8ZR3F9JtiI85PuL7+r8zIgdee2MlVIimMYczxZ4uuyG27B0axRfnjyUWGVPhC
 4fgERSssPzF5RLLjAGV1iU6aa1aYfXBCCiXWGWsNVknvLVF1SzwNE0vbdtJQ14BAAA=
X-Change-ID: 20250612-csi-bgr-rgb-b837980c00b3
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>, Maxime Ripard <mripard@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622; i=mripard@redhat.com;
 h=from:subject:message-id; bh=TkTKw0kkdB0LniEy76wwyWLa1WRt/WWy4CQifIAYYBk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmd300/5+4PY1K4l32vUuKIxKutjUUZLj85VvIfunngn
 5lByhbljqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRXxWMDd8UNHg/FTvpH/7w
 11rxh05hu4vWpKr47ekR73X8ru8QvH1r9/4Ju7eF//3dyLb975JXNxjr0+/Xif3jua2jvelvfn/
 50t/V6TlP9/y8IG7Xrc6g+04psuuKKHPsQRuevL9vzI6+d90NAA==
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-52416-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 28A78111873
X-Rspamd-Action: no action

Hi,

Here's an(other [1]) attempt at fixing the current mess due to the
opposite meaning of what v4l2 and the MIPI-CSI2 spec call "RGB". By v4l2
nomenclature, the format CSI calls RGB is actually BGR.

Unfortunately, a handful of CSI transceivers report through RGB media
bus pixel code, which is then understood as V4L2_PIX_FMT_RGB24 by CSI
receivers.

This is made somewhat worse the fact that media bus codes have been made
mostly with parallel busses in mind, and thus the order of pixels wasn't
clearly defined anywhere.

So the v4l2 vs CSI mismatch was confusing (but there's nothing we can do
about it), but the doc didn't really make an attempt at clearing it up
either.

We did have a convention so far though, that about half the affected
drivers were following. 

This series improves the doc, adds the missing media bus codes, and
converts the transceiver drivers to the rightful media bus format.

We'll also need that series [2] from Laurent to fix all the affected
transceivers. 

Let me know what you think,
Maxime

1: https://lore.kernel.org/r/20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org
2: https://lore.kernel.org/r/20250611181528.19542-1-laurent.pinchart@ideasonboard.com

---
Changes in v5:
- Standardize on using RGB888_1X24 for RGB888 instead of BGR888
- Drop the BGR patch
- Drop the csi driver patches in favor of unicam
- Link to v4: https://lore.kernel.org/r/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org

Changes in v4:
- Rebased on 6.18-rc1
- Link to v3: https://lore.kernel.org/r/20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.org

Changes in v3:
- Fix typos in commit messages
- use dev_warn_once for deprecation warnings
- Reintroduce dropped unsupported colorspace handling
- Remove unneeded fallthroughs
- Link to v2: https://lore.kernel.org/r/20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org

Changes in v2:
- Don't drop RGB, but treat it as deprecated instead.
- Rebase on 6.17-rc5
- Link to v1: https://lore.kernel.org/r/20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org

---
Maxime Ripard (2):
      media: uapi: Clarify MBUS color component order for serial buses
      media: bcm2835-unicam: Fix RGB format / mbus code association

 .../userspace-api/media/v4l/subdev-formats.rst     | 19 +++++++-----
 drivers/media/platform/broadcom/bcm2835-unicam.c   | 36 +++++++++++++++++++---
 2 files changed, 43 insertions(+), 12 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20250612-csi-bgr-rgb-b837980c00b3

Best regards,
-- 
Maxime Ripard <mripard@redhat.com>



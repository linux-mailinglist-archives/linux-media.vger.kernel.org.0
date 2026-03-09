Return-Path: <linux-media+bounces-54963-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPhEN6jirmmoJgIAu9opvQ
	(envelope-from <linux-media+bounces-54963-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:09:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E9823B506
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED008302BBE4
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6BD3D9044;
	Mon,  9 Mar 2026 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6UgEhyM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1FF3D904D;
	Mon,  9 Mar 2026 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068869; cv=none; b=sgpD1tLzurK1jNZ9zLlCdEIaPQvxL/9n7S7XK+GjZo3Zg+zFZAZ/+5BZZ/HbtQcGoFuF6D8pj7RSlxoEEK55WFMymLSqsGJI6l/kQ8NwmuTpq+f+h2ayrrLhhY5YByKdIEFpMRf1kbIMqqV8NEbot2T6tG6escWaGJjGxBV3phY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068869; c=relaxed/simple;
	bh=CZwlq1EGcKoXJMDg7FmmTtw7+Ec/bhNt3jcf1ddiTqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aON4HpQVpINk8vGP7OwEfpPWF3JOPesk2c1aimyWO2eA87ueGW1hkUyiML5V2mnt5c9WKZZ11NIx7gMVeaCaJB35w22KfEJ8v41+G+ynFzdGEZKONevGLgc9iX1YcTWYVH93uHY+vywm6eRGExS2kGxCVN1yn1BJlf+IoXRCiU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6UgEhyM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCB7C2BC86;
	Mon,  9 Mar 2026 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773068869;
	bh=CZwlq1EGcKoXJMDg7FmmTtw7+Ec/bhNt3jcf1ddiTqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J6UgEhyM7hMuZZiLUV5ODzsdzcyh8vPV1lYDLJnX+5At5bwjDlYOFYmO2Bvxi7CM5
	 h1I9tc2wZhdVUc04wAZJRjoKoRwLMEIyqMju4L/xYFgwsH7wHZw07UesSZQ7As822S
	 jLCapPbYe7rndqSLc8M0M0WTg9DHRCTycZwawntceWlkdt8mingdUbUys2oYiQ+72P
	 V9H9OsfbCiRavdMPiL5dfAmHVeBmYzj5TeTBMM/daEWPEFAn+bzjtlOr70bhnxoC6h
	 t/UPODP+vNxI3hMMRFaheevxpqZH9noUB1JCom8MzyUXZCvkE1jKS/Dhuoa+OLYf/w
	 ccsVXwDAimzXA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 09 Mar 2026 16:07:40 +0100
Subject: [PATCH v7 1/2] media: uapi: Clarify MBUS color component order for
 serial buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-csi-bgr-rgb-v7-1-fcee993b13d8@kernel.org>
References: <20260309-csi-bgr-rgb-v7-0-fcee993b13d8@kernel.org>
In-Reply-To: <20260309-csi-bgr-rgb-v7-0-fcee993b13d8@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2653; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CZwlq1EGcKoXJMDg7FmmTtw7+Ec/bhNt3jcf1ddiTqk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnrHtlZaSzyn71G5yGXmcZa2XzXd1XlzxtqXkZ/u5V3w
 nYaq8LGjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjAR9zOMDY+28j34GJZekNvV
 uVYz/nf7qUa9aVJyrZO84lSfSRj76a+IWvO9/Jr7rxmHpxZvmXKYkbFhYvfsgOvGjd8296i4aez
 U/Ws/heXz/H+LbHN0IoyPMWevzFnq/EHmgstPl5kfND/c4vsLAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: 85E9823B506
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54963-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.924];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

The subdev format documentation has a subsection describing how to use
the media bus pixel codes for serial buses. While it describes the
sampling part well, it doesn't really describe the current convention
used for the components order.

Let's improve that.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../userspace-api/media/v4l/subdev-formats.rst       | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 896177c5334fe0f3526550b9852508f786e95652..c9999b929773b244290b16280b180a9d4f0ff609 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -157,18 +157,22 @@ memory.
 While there is a relationship between image formats on buses and image
 formats in memory (a raw Bayer image won't be magically converted to
 JPEG just by storing it to memory), there is no one-to-one
 correspondence between them.
 
-The media bus pixel codes document parallel formats. Should the pixel data be
-transported over a serial bus, the media bus pixel code that describes a
-parallel format that transfers a sample on a single clock cycle is used. For
-instance, both MEDIA_BUS_FMT_BGR888_1X24 and MEDIA_BUS_FMT_BGR888_3X8 are used
-on parallel busses for transferring an 8 bits per sample BGR data, whereas on
-serial busses the data in this format is only referred to using
-MEDIA_BUS_FMT_BGR888_1X24. This is because there is effectively only a single
-way to transport that format on the serial busses.
+While the media bus pixel codes are named based on how pixels are
+transmitted on parallel buses, serial buses do not define separate
+codes. By convention, they use the codes that transfer a sample on a
+single clock cycle, and whose bit orders from LSB to MSB correspond to
+the order in which colour components are transmitted on the serial bus.
+For instance, the MIPI CSI-2 24-bit RGB (RGB888) format uses the
+MEDIA_BUS_FMT_RGB888_1X24 media bus code because CSI-2 transmits the
+blue colour component first, followed by green and red, and
+MEDIA_BUS_FMT_RGB888_1X24 defines the first bit of blue at bit 0.
+While used for 24-bit RGB data on parallel buses, the
+MEDIA_BUS_FMT_RGB888_3X8 or MEDIA_BUS_FMT_BGR888_1X24 codes must not be
+used for CSI-2.
 
 Packed RGB Formats
 ^^^^^^^^^^^^^^^^^^
 
 Those formats transfer pixel data as red, green and blue components. The

-- 
2.53.0



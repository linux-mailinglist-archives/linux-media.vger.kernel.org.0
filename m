Return-Path: <linux-media+bounces-52965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNK+OVIplGlTAQIAu9opvQ
	(envelope-from <linux-media+bounces-52965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:39:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B214A0BF
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 963393033D18
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEE32E7648;
	Tue, 17 Feb 2026 08:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bge9PSNe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFDB3EBF07;
	Tue, 17 Feb 2026 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771317546; cv=none; b=ReoepZKweJM70vGKno1wJ2vqXPbqeYDuxdst7/mEDTyhKN9FEtuIRi4V7AyartTKbtXTM3QHmcWRno+q+zAVUytbDrIcfpOo7wbPGeMbtMtDFxRNx21XBvku3qKnV+r5RdhORyHD7utarW34qPbNtMbTrRahKV7plaW9aky3cSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771317546; c=relaxed/simple;
	bh=rCXW6thZ22OoTYS2shR13ipLTwJKjj/uhfp7FYURAYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lzmr6R2z4CJ/m1iPcOK+VNtNWwrQQjYcGOsaXW8liqo4VPA84GJmoDolQ+7rw4ZILuGGdgg+E8Ahst0ptwuQhgAr9FbJhpZsEc1aeA5t++blNjqYQ4QqC56GzAIo7ZY2RLNtNGtWs3Oya3Vwtdu1BJvAwrHkA7/w9FMdSrjUE5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bge9PSNe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82ADBC4CEF7;
	Tue, 17 Feb 2026 08:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771317545;
	bh=rCXW6thZ22OoTYS2shR13ipLTwJKjj/uhfp7FYURAYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bge9PSNeoUwH3EtFvpPagNvm5FCvIyQGqhVzeXyLDoShBMfdAFjTxOmap8Vr1/6o5
	 qEP3xRuIhk+srx0pDjyZZXSpm6M4Bh3ZshC6cPTAnJG3W5zrgiqca/8VupUKS/I5JY
	 gqoKTSAofEd4H32ca6yhGJ/3nBRMgA+ord2a6xK2x21Ucy/GB1GHffkwEVK4ISao7C
	 Igtvu1yNm48OBUv3Yvk2NgEaC223odXmqmPZhLJkA8jUATSwnuTqJbESZuKmYB6gNI
	 T12wVbDegb0pAQsQTwDHlSObtDAQ1sF3YdX3JxOHV2LT8vE9Q1YFNGIa8HKDs0aSOQ
	 aoE29pw3WUMeQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 17 Feb 2026 09:38:57 +0100
Subject: [PATCH v6 1/2] media: uapi: Clarify MBUS color component order for
 serial buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-csi-bgr-rgb-v6-1-064607effe42@redhat.com>
References: <20260217-csi-bgr-rgb-v6-0-064607effe42@redhat.com>
In-Reply-To: <20260217-csi-bgr-rgb-v6-0-064607effe42@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2565; i=mripard@redhat.com;
 h=from:subject:message-id; bh=rCXW6thZ22OoTYS2shR13ipLTwJKjj/uhfp7FYURAYU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlTNJUf3uBUf/ZVpGp36oP9V93X8eo4du8NnhvCf0HL6
 pWTj8uvjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRzlzGWrlfa27bt1umV2Wz
 FfBlNb9MWhcfufzjtoVWrLmxMx6a6/LmRc1bZ7dl3Srxo9M4kgVTGBuOPFOf+pqR68Tui6eEmdp
 rt28Xlr4ikrN/C5OngqdL+uEsk2U1R7rKbxwzOlKQHDX/ayIA
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-52965-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 583B214A0BF
X-Rspamd-Action: no action

The subdev format documentation has a subsection describing how to use
the media bus pixel codes for serial buses. While it describes the
sampling part well, it doesn't really describe the current convention
used for the components order.

Let's improve that.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../userspace-api/media/v4l/subdev-formats.rst        | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index cf970750dd4c6ab32274f75453390eb8148ef3c6..6d57c325ffa506fd57dad0845c9a742fd199a6f0 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -157,18 +157,21 @@ memory.
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
+single clock cycle. and whose names correspond to the order in which
+colour components are transmitted on the serial bus. For instance, the
+MIPI CSI-2 24-bit RGB (RGB888) format uses the MEDIA_BUS_FMT_RGB888_1X24
+media bus code because CSI-2 transmits the blue colour component first,
+followed by green and red, and MEDIA_BUS_FMT_RGB888_1X24 defines the
+first bit of blue at index 0. While used for 24-bit RGB data on parallel
+buses, the MEDIA_BUS_FMT_RGB888_3X8 or MEDIA_BUS_FMT_BGR888_1X24 codes
+must not be used for CSI-2.
 
 Packed RGB Formats
 ^^^^^^^^^^^^^^^^^^
 
 Those formats transfer pixel data as red, green and blue components. The

-- 
2.52.0



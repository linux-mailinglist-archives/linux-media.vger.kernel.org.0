Return-Path: <linux-media+bounces-52417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK/aKw/4iWl7FAAAu9opvQ
	(envelope-from <linux-media+bounces-52417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:06:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB91118A8
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6BE4301712C
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295A437D137;
	Mon,  9 Feb 2026 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk8EhDVU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CAE1DED4C;
	Mon,  9 Feb 2026 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649409; cv=none; b=mfbdaP01mgiTwOwVntW44Qoux9unVV7JA0KWZOFkW6w9dC1EWbTYi/hpDvUNjf9fUrLHd7IryL4zEAd+5c5TFTYJ4zqTqGwe4H6Rs6hAwDpnIz/8BifHUeLJ5RhuBsbm8e4pB15JGOjp7wvv0NwIrxeuBXIR3xTEzBcv1ZPq7+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649409; c=relaxed/simple;
	bh=rCXW6thZ22OoTYS2shR13ipLTwJKjj/uhfp7FYURAYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OHEz7PmdE8s/3JPT7aj3KnU4pO6lSmSFqOTnJIgkfzaEBSCq0Ck049NPqJa7k9W6UZWXNvXdtIlK7Dk0qmj+7hg8te6Omq+rSendNVrT7oGXN17clA0bSugAzYfM4F/48pcLXMpGF0GCMkVtVgJGB9I1U8GWtVfLeryruGD6kCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bk8EhDVU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9828C16AAE;
	Mon,  9 Feb 2026 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770649409;
	bh=rCXW6thZ22OoTYS2shR13ipLTwJKjj/uhfp7FYURAYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bk8EhDVUgWsznXO7b7LNuEwLGaXAXi6RRESMGaD1vItuxBl39BOZaq7hINkC9e2br
	 EMu10Cah+P7Oy6OVfSq84iRIyCNfEU84csxLFYdCEEUE2yPZ6z3WCR8IeWSecGRhpD
	 cfJKWGtZ4E6NEldoDIrwptevr6EGxjNP2Y6AEm62pRRN4kyr5PxsJwFcizp6lrNZCg
	 wBZsHl+BvFb1dooixoyTS3liwaCX1s8c12gPGzSY2oeIb90PsVlULs9evm5AHHXi33
	 DjnfdJ4+sRUvBbLxNr3Cyxfc112EULKi+8z66FTeVnPX4ieA6ZPpC0BJ8QD+0GhSmb
	 7hEcHk16iq5tA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 09 Feb 2026 16:03:16 +0100
Subject: [PATCH v5 1/2] media: uapi: Clarify MBUS color component order for
 serial buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-csi-bgr-rgb-v5-1-e7af3cd6cde6@redhat.com>
References: <20260209-csi-bgr-rgb-v5-0-e7af3cd6cde6@redhat.com>
In-Reply-To: <20260209-csi-bgr-rgb-v5-0-e7af3cd6cde6@redhat.com>
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
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGmJ9zqjX9gjI3aIGwglN25ccr+Th/g7+r25m0yPUg0LKJ3Or
 oiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmmJ9zoACgkQJ1/OGaI9vnbXbwF/QfLE
 lNJwmnWbFwuYY3NvRdu6WgFzwfdTHyx1vqhR9ugl2stjxUfGwSYZlKXwVKc0AX9IQZAOJ5gHxxD
 L2aWW+gFP5Wo21A541ZCf2XotOIG9H9fWW3a1rfHQs6updiIZHV0=
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
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-52417-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: E8CB91118A8
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



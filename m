Return-Path: <linux-media+bounces-52742-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJIFFhEvj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52742-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:02:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6AA136DC9
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CACB030792DE
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758F53612D1;
	Fri, 13 Feb 2026 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="We2fb+HR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFF13B28D;
	Fri, 13 Feb 2026 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991329; cv=none; b=c/AFD4zNezZH+liaJdrFdkSNSeQt0dA6PWuxLBj89k4pDOVfZ126Ee9uvGJ/YZ2JIcMeULfJwUzUFMTULN8xy5Y/8PMjmpU5dq2viTiJKVM+6UExPNITT8BGbiY63BgGp2bVnmFBWxPEcaBqrLlh9s39urTE5aA2Q4o0kC0m7WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991329; c=relaxed/simple;
	bh=ca4k7L25xONgjSva1mhBPxgXgTu0fUMOncOrZhrQyf8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G3RhUWjdb9twPzVfty/EqBJHxUN8OOc0U24lkAR/Gz8PVnisRnVMAQ741nsi4j8vi/53BUih4a8kPi2ugMsBHQk/maJ/NwLOb7R6CN/ZeSm+2YjBGfcTZnb2WzWwGkdVx158OmHscBMczIFsArEGI3JShOquirKl3Wv1HU3tWdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=We2fb+HR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3A4E324;
	Fri, 13 Feb 2026 15:01:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991277;
	bh=ca4k7L25xONgjSva1mhBPxgXgTu0fUMOncOrZhrQyf8=;
	h=From:Subject:Date:To:Cc:From;
	b=We2fb+HR+upp7maVsEaPAL4qk6/Z6dQ+/KGKl+GJBirunoopnBrnSOUW7Ff0SSsXX
	 LA9eBCQGLEbBzVEqTDIqvYF4OGGTagWfna2nLHPgmJDdINTRRmPRLyMsXpeRV/0opC
	 TL4IL7a8NW/hvFk4eye1VInO/Uv1gcXsAu3tcgDw=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 00/25] drivers: media: imx283 improvements
Date: Fri, 13 Feb 2026 14:01:39 +0000
Message-Id: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMuj2kC/x2MQQqAIBAAvyJ7TrCNLPtKdJBaa6EsFESQ/p50n
 IGZApECU4RJFAiUOPLtK2AjYD2s30nyVhlQoVbYorws+5N99VfGsZMJpTY9OTRqHFoHNXwCOc7
 /dF7e9wMdSSMDZAAAAA==
X-Change-ID: 20260212-mainline-imx283-v2-695ef290871f
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Stefan Klug <stefan.klug@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991324; l=3501;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=ca4k7L25xONgjSva1mhBPxgXgTu0fUMOncOrZhrQyf8=;
 b=1aCTcJr2LURdsen6M3b+8+17Zf5ARE0z88OLXrR35nj38Ss/CUSXh3vPYT76VlZ6YFF8v1uJ3
 bZIepT3rC8TDaOawwrPdVsI5njUGklbre0wEUkK0nUl4qAJMoydJd8u
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52742-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF6AA136DC9
X-Rspamd-Action: no action

This now far more extensive series reposts some patches which provide
fixes to the users of the IMX283 camera sensor to resolve handling
exposure and blanking updates and the reporting of the cropping modes
configured.

The series then goes on to extensively extend the driver to move towards
a dedicated scan out structure allowing mode definitions to be greatly
simplified and factor out a lot of common definitions and duplication.

Vertical offset corrections are added which handle the correct
alignment of the output mode in the different binning combinations which
otherwise translate to an offset in the image capture which is
detectable when the camera is used as a measurement device.

To make use of this, the horizontal and vertical configuration is
refactored to make it clearer what calculations are being performed and
manage the vertical positioning based on the VOB and binning offsets
accordingly.

This then provides us with a mechanism to fix a separate issue that
occurs on the IMX283 where an 'extra black line' is inserted by the
sensor to resolve bayer re-ordering. This extra line is undesirable in
the output and so we account for this and remove it by instead
requesting *two* additional lines, and moving two lines back into the
VOB data type. The extra line is required to maintain bayer order, and
moving the lines prevents them from being added to the captured image.

Extra modes are added based on this new simplified mode configuration
structure to match the diagrams present in the sensor datasheet.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
Kieran Bingham (23):
      media: i2c: imx283: Move imx283_mode structure definition
      media: i2c: imx283: Move scan out data to single data structure
      media: i2c: imx283: Remove horizontal_ob
      media: i2c: imx283: Move vertical_ob to scan modes
      media: i2c: imx283: Factor out vertical cropping parameters
      media: i2c: imx283: Vertical offset corrections
      media: i2c: imx283: Define recommended area
      media: i2c: imx283: Move Horizontal configuration block
      media: i2c: imx283: Constrain scope of vertical calculations
      media: i2c: imx283: Simplify v_pos determination
      media: i2c: imx283: Move binning to scan modes
      media: i2c: imx283: Move minimum exposure handling to scan modes
      media: i2c: imx283: Simplify and clamp widcut calculation
      media: i2c: imx283: Account for clamp region coordinates
      media: i2c: imx283: Crop leading lines with user clamp
      media: i2c: imx283: Reduce vertical cutting
      media: i2c: imx283: Provide Native pixel array capture mode
      media: i2c: imx283: Provide a full active pixels mode
      media: i2c: imx283: Provide an effective pixel array mode
      media: i2c: imx283: Recalculate SHR on blanking changes
      media: i2c: imx283: Fix binned mode blanking timings
      media: i2c: imx283: Update exposure range on blanking changes
      media: i2c: imx283: Simplify VFLIP control setting

Stefan Klug (2):
      media: i2c: imx283: Report correct V4L2_SEL_TGT_CROP
      media: i2c: imx283: Fix handling of unsupported mbus codes

 drivers/media/i2c/imx283.c | 600 +++++++++++++++++++++++++++++----------------
 1 file changed, 393 insertions(+), 207 deletions(-)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20260212-mainline-imx283-v2-695ef290871f

Best regards,
-- 
--
Kieran



Return-Path: <linux-media+bounces-63855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7jXkA9FAImo6UQEAu9opvQ
	(envelope-from <linux-media+bounces-63855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:21:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 666BB644D48
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:21:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=BrAEWnRE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63855-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63855-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65F293040AAE
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 03:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AB734F46D;
	Fri,  5 Jun 2026 03:20:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from outbound0.mail.transip.nl (outbound0.mail.transip.nl [149.210.149.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4E3E5A09
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 03:20:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629647; cv=none; b=FTBJFf4UGLzpp2o+M7UNnP6vd//iKN9e3FLNDqt+9EOOLA7IrhHLdeM456T2+r86EybqVEs2h/TMHucBfcxbRuLhlOhMwyR4YR1Tpg/GBSCYf/ZN/w2zszqK8cq1q0r61Uah5iN2C8Ruo/Gkcm3Y1N9mv9fYd9xoyBVs9W2iCwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629647; c=relaxed/simple;
	bh=ApbxPaKFFEexR8wnxfVsRKseWLe6S8mZXKmP8pnfq5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S53tLk4cWD9Ym5chtFhOogF06rwn9BH0jpvMElpY9SZBn3fmHj7yRHagoh5V0kiP9I+o0kwkenbS1XasDN4W0lcphWhTaiuOPuEcJAhuxu35749nzLWM+liQ4k3IKbSg5jqVlFifgdmYUqo3ou25BZhglJ+kR3+1LOqgodgtl3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=BrAEWnRE; arc=none smtp.client-ip=149.210.149.69
Received: from submission12.mail.transip.nl (unknown [10.103.8.163])
	by outbound0.mail.transip.nl (Postfix) with ESMTP id 4gWmsh2G37zxNxQ;
	Fri,  5 Jun 2026 05:20:40 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission12.mail.transip.nl (Postfix) with ESMTPA id 4gWmsg5g4bz3SJ37P;
	Fri,  5 Jun 2026 05:20:39 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 0/2] media: i2c: add Aptina MT9M113 SoC sensor driver
Date: Fri,  5 Jun 2026 05:20:37 +0200
Message-ID: <cover.1780601033.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission12.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780629639; h=from:subject:to:cc:date:
 mime-version; bh=kViDbVFZ0fYEjw6HUxIoRCbf8V2Xv6QN5U5aVmfaMCE=;
 b=BrAEWnRElyp47m1EYYdTM4GO6ij3dzNuR3PA73mfI9BiaLwc53Zo+RG/8dSXr35ljIEhws
 jmPWYoDltz6rfh6o0LJUUJH6nerPcLjKHTZKD3Y8vSNNMmlnTGquExoc3XduniYfeYh1YJ
 uflC1Fx1zlF/9fx1Kg7EV4dVVaOyuV3B4mVfv3R+f2QGV20BRa4HTdA/RI2pSIRYtSgB78
 rm40g4B2k4h0QHlFE/9x27LhkBH0xrvVv91weBrjWAOO1Shj6VfvbkMWM74vMKkAcq29C4
 qPYubXzJKJyQooLkU9aLUFskAn4EV3CIe6FIyGCh1UbTj5L3GNxDMuZlH2RhxQ==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63855-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:github.com@herrie.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[31.184.93.180:received,100.90.174.1:received,10.103.8.163:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:from_mime,herrie.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 666BB644D48

This series adds a V4L2 subdev driver and DT binding for the Aptina
MT9M113, a 1.3 Mpx SoC sensor with an on-chip ISP and a small MCU
running a "SOC1040" firmware that performs auto-exposure, auto white
balance and lens-shading correction.  The sensor talks to the host
over MIPI CSI-2 (1 or 2 data lanes); register access is over I2C
using the Qualcomm CCI helper.

Hardware layout exposed to userspace:

    +-------------------+    +-----------------+
    | Pixel Array (PA)  |--->| IFP / ISP       |--->[CSI-2]
    | sink-less subdev  |    | MCU + pipe      |
    +-------------------+    +-----------------+

PA carries V4L2_CID_PIXEL_RATE and V4L2_CID_LINK_FREQ so that
downstream receivers walking the graph from the CSIPHY (camss does
this) find them on the entity flagged MEDIA_ENT_F_CAM_SENSOR.

V4L2 controls implemented:
  - exposure / gain / hflip / vflip
  - test pattern
  - V4L2_CID_COLORFX (sepia / mono / negative / aqua / vivid)
  - V4L2_CID_POWER_LINE_FREQUENCY (50/60 Hz flicker avoidance)

Tested on a HP TouchPad (APQ8060, MSM8x60 family) with the on-board
front 1.3 Mpx MT9M113.  Probes cleanly, both PA and IFP subdevs
register, csiphy_stream_on() picks up link_freq from PA, and the
preview pipeline up through CAMSS produces frames.  A bounded
3-attempt retry around s_stream(1) handles a residual silicon-level
wedge that occasionally leaves the MCU's SEQ_CMD in an inconsistent
state on cold start.

The DTS patches that enable the sensor on the HP TouchPad will be
sent separately to the ARM/DTS tree.

Herman van Hazendonk (2):
  dt-bindings: media: i2c: add aptina,mt9m113
  media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

 .../bindings/media/i2c/aptina,mt9m113.yaml    |  127 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/mt9m113.c                   | 2971 +++++++++++++++++
 4 files changed, 3111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
 create mode 100644 drivers/media/i2c/mt9m113.c

-- 
2.43.0



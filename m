Return-Path: <linux-media+bounces-14715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6F92AD3A
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 02:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08179282430
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 00:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3007D29413;
	Tue,  9 Jul 2024 00:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="mnQId6Xx"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1122.securemx.jp [210.130.202.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9724A05;
	Tue,  9 Jul 2024 00:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720485887; cv=none; b=ma6iUziaqHKZYICrpMZ/7nKtxtNR6bZjLVNUb2aY5nD7w3HLUKmArMyiDrqAgggBVxAUHpxMzS7ysq3xACLXRoAt/B6OQxcWPK1gyVWpVNh0baC6nBeMBlf7zhJMOAUtbhTPLrlHspf50a3YchItE7csgG99J2I5eQErcvNKqHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720485887; c=relaxed/simple;
	bh=e1dzAiBXQhbVLezx3qDYjhlathF5T/E1TJvwyCTSHl8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d1F698p9flQRDCiJI8mh3yLISYHr7TX8o7OkRzElHZyewVFo826o4nZ/3LTAX2C70hfxmX4K8kHFfkCD+gnPkD5si4bgWRsql7TXP3WTH3TP5fQ6UPQcU0tnbyIOoVOrS9JKRqgJWQdDQy9am/ht83neZJGVQSsSioySvpFb3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=mnQId6Xx; arc=none smtp.client-ip=210.130.202.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1122) id 4690FGhA2337246; Tue, 9 Jul 2024 09:15:16 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1720484084;x=1721693684;bh=e1dzAiBXQhbVLezx3qDYjhlathF5T/E1TJvwyCTSHl8=;b=mnQ
	Id6XxWHtvudM4ICe1B99n9nk/F/zlkvsjZ2hxIVIsvf0HvQa4mFKKd78ukwTqttz9w7cHvG7B2U72
	QEUWLcNwaZXon8tt5bJ6QxGIsvee8Gqt+sJ5HObQ5Q9EsEdw8LcLIYb3dSvIEZ7znRMBZxA/NZOgp
	BhhvDUEevO7HulaF4r+aopVwrZeLKBP31VmetqyieB4iiq5xtvIpbkBdQhmVl97ci0fW/TYPnfZDV
	NZUY0XT2yeGQx6O6JL9b+GvsnTLqvVQs5Pio9EgC24ho/1q92LToJZWktEfsWU0+xESEh7Rhc1Mvv
	2XWPkbIFqEXq4hZRzlXz5ycyV3Ep32w==;
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 4690Eigc3581316; Tue, 9 Jul 2024 09:14:44 +0900
X-Iguazu-Qid: 2rWgcwEFXkFHW1EwRr
X-Iguazu-QSIG: v=2; s=0; t=1720484083; q=2rWgcwEFXkFHW1EwRr; m=RC9L+gHFs2stttK5pKGR6z1upsS3B/TWlkYHLZqw76M=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1121) id 4690EgBh130368
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 09:14:43 +0900
X-SA-MID: 26358990
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 6/6] MAINTAINERS: Add entries for Toshiba Visconti Video Input Interface
Date: Tue,  9 Jul 2024 09:08:48 +0900
X-TSB-HOP2: ON
Message-Id: <20240709000848.1108788-7-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added entries for visconti Video Input Interface driver, including;
* device tree bindings
* source files
* documentation files

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
Changelog v2:
- no change

Changelog v3:
- added entry for driver API documentation

Changelog v4:
- added entry for header file

Changelog v5:
- no change

Changelog v6:
- update path to VIIF driver source files

Changelog v7:
- no change

Changelog v8:
- rename bindings description file

Changelog v9:
- no change

Changelog v10:
- add a separate entry of VIIF driver

Changelog v11:
- no change

 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3c4fdf74a3..f051f4ab34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22734,6 +22734,17 @@ F:	Documentation/devicetree/bindings/media/i2c/tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA VISCONTI VIIF DRIVER
+M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/media/visconti-viif.*
+F:	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
+F:	Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
+F:	drivers/media/platform/toshiba/visconti/
+F:	include/uapi/linux/visconti_viif.h
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.25.1




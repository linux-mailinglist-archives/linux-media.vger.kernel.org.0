Return-Path: <linux-media+bounces-21969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C19D8516
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 13:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A944B38EE5
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CA6195381;
	Mon, 25 Nov 2024 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="ssKrD2dA"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1121.securemx.jp [210.130.202.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C821925A6;
	Mon, 25 Nov 2024 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732531399; cv=none; b=LZhUUM15+Gi6ZtOnLmy+K1QsYj3/3YX3IClHVhlSYLNGYuGJp4/KGnjla+Te9TlnHhSdNfEqYi4Vk0szgOQ6YeSlW1Ch2QfckkjhgZ3FXbUCVe3vVqyb+auYBZD4fhV08AAi/1kb5Zi8U0M1NJNnCzmORrde5jmVyzrpJ09OJQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732531399; c=relaxed/simple;
	bh=PCq/pu+QO5n9bATAUWThnGACe2nepbUSJDlQFbrVrx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bbFCK27V9VsMD2pGpX8h+fGw054hR5pk0KH5+TEZPqGq7N2lyF5QytxPduYNI28NOQ/rz6i3iCNGVOhSEjfT3hS7aliy5pdlLKU3qkEqbWexjvSR1k13HUjexGNBfpLulMX5XOejtlDarfZuh2gxk87odhfBjODy3H55Ed8wm24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=ssKrD2dA; arc=none smtp.client-ip=210.130.202.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1121) id 4AP9Ro6t729184; Mon, 25 Nov 2024 18:27:51 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1732526841;x=1733736441;bh=PCq/pu+QO5n9bATAUWThnGACe2nepbUSJDlQFbrVrx8=;b=ssK
	rD2dA6ydWDQ6pOMt2C5SL8sXLaAYRAfqPxs6mSdZYsTxCkOhnxEqJ5+gXjHoqI/vi81FEUxoFDrxS
	Qt3jLqg0153A6aZQq6KoE/jltceTLvhDyrw2K3d+zUMn31MZMdyCXez0RjnSNgOO4GJLcJuh4WddV
	AXGqimEQITHWVsUwf6hzcNHSxlQ0lVcw67zkNN5Juz2h4tqj0Z/atXbLe9KYGE127KhmlKTFQEd37
	yy5UBWaNAcpN1I2YuxfAN6UsIG1+WybisEaHoOLtszQ0hKd9r1J1lh/6hpNvErmBclKErBTR0AnkH
	5iaYi0t1Ql7JK04F6OYVQQ+U2Wd2anQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 4AP9RJmm099468; Mon, 25 Nov 2024 18:27:19 +0900
X-Iguazu-Qid: 2rWguDC9mIphlABSrL
X-Iguazu-QSIG: v=2; s=0; t=1732526839; q=2rWguDC9mIphlABSrL; m=k1DP3cEVolB9mfsCCNGe71tsvk/AiYIrIbXeZwTU+I0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1121) id 4AP9RHIp297761
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:17 +0900
X-SA-MID: 35004190
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v12 8/8] MAINTAINERS: Add entries for Toshiba Visconti Video Input Interface
Date: Mon, 25 Nov 2024 18:21:46 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-9-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
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

Changelog v12:
- add a bindings description of CSI2RX driver

 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b878ddc99f94..b5c819e94e9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23430,6 +23430,18 @@ F:	Documentation/devicetree/bindings/media/i2c/tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA VISCONTI VIIF DRIVER
+M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/media/visconti-viif.*
+F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
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




Return-Path: <linux-media+bounces-5796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAB5861391
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 15:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E42C1C20B6A
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 14:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F1681AC9;
	Fri, 23 Feb 2024 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="lmkYy5Lz";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Fo/E8kpO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4BF7FBA5;
	Fri, 23 Feb 2024 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708697105; cv=none; b=rGS4p3cIb3zMMxtA0Iltt1ZNc8rI8YXT4T2HTRAoTdecgmkDom9271wTufkW5bjlb355rU0wGYVr1MeS6OPbL9HQHewB+2tr9Z3znuVlRQTq/9iviTYJMyCzXw2FLN3yvWKYSSTID992uKyrjkiglW8OfqSfr0+v/Qv214GvJCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708697105; c=relaxed/simple;
	bh=fMW0imeFdM3J6lZ5vQxQP3nXkT323be3Rdd11Op6LRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lBxSDJN/Ctv+ADd0NQOTOsdu0R/cPsUr/XBQ9CoNDrjL9osXPqS4KRfFE58KoUDxxrtUNnuC+0DH1h9grl839OM1AuDSiut6svSAV2u/ge/a6RPOJa0lhYS4HhDaATrsfy34pF7vlCZBDfpA125cl64Whuax0l+ot6ilX6w4WU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=lmkYy5Lz; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Fo/E8kpO reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1708697101; x=1740233101;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VM1Xz9CQae+JTe7Rkr9En+QQS/uhf5ObPETIv1LmTcQ=;
  b=lmkYy5LzW8rDH7ROcpn6DChSEPudXdXKsEsZ2uKW9L5hEbm/Rh6hu6qm
   aC7RUf78PtwQqmA/IKV3ekjE0r6ent3fuTKqVSYzPgyHYhHb+x0K9eqAm
   M12ML/67NaBUndm29ojUc2Ll8L/znkTv2Z7fXZ+slrSpY39+DLuVA2fG/
   xJA8bG4S087O3CWy9HIReQ84cEfhPsU9EXZ4ewozl2MkwVPAXRm/LV5lD
   LqWbwPzxkfE+TVTAwVEBnAi4gkaILrJH346R+DXFARNnE6+4zKM9icQcr
   a5TXWX/9gjmzuUolHf/4mfDJnzLE8AKNuPfiWdbkedU7oc/fgi8meXq/M
   Q==;
X-IronPort-AV: E=Sophos;i="6.06,180,1705359600"; 
   d="scan'208";a="35569647"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 23 Feb 2024 15:04:58 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBDEA170276;
	Fri, 23 Feb 2024 15:04:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1708697094; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=VM1Xz9CQae+JTe7Rkr9En+QQS/uhf5ObPETIv1LmTcQ=;
	b=Fo/E8kpODF8SAK91MxisN7FclxelrajQFyOJ7w72Ndp2+kBctnss5VY92S+GtCdm3S7Ydo
	stS6nC98mn9g1tOJ/QxDpUDS4yb4pL4hf9Et1OTEcyDEtj/7c1NYh2A3Y7KV9o0c9zV9hg
	XqLyWCBlEs0NVpe42v5PDLggnuspMpxqCvXI10f9DrNy2NgjlYJosH8QFlthwEo+FFwHeH
	R7gEt3k9RQsJb57wlYAd42i3DtCUHc0YpxTmT3s5NWoZgI+toYsaMKN1VaCkRIwRmlTKfM
	YlvCxbX0yxYBIi4RONOtgeGnyr1MCy8PQUt33eOr2ZlG5pk/ur9CBmwNjf4DqQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] i.MX8M Nano ISI single port support
Date: Fri, 23 Feb 2024 15:04:42 +0100
Message-Id: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

I'm trying to fix the dtbs_check warning:
/soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node
'port@0', #address-cells/#size-cells are not necessary

OF graphs with a single port should be placed inside a 'port' node, rather than
a single 'port' node inside a 'ports' node. Bindings were designed for the
latter case.
Adjust the bindings so a seconds port (port@1) is not allowed for
single-pipeline models and allow both 'ports' (current one) and 'port' based
OF graph connections for single-pipeline models.

Best regards,
Alexander

Alexander Stein (3):
  media: dt-bindings: nxp,imx8-isi: Refuse port@1 for single pipeline
    models
  media: dt-bindings: nxp,imx8-isi: Allow single port for single
    pipeline models
  arm64: dts: imx8mn: Use single port for ISI

 .../devicetree/bindings/media/nxp,imx8-isi.yaml   | 15 ++++++++++++++-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi         | 12 +++---------
 2 files changed, 17 insertions(+), 10 deletions(-)

-- 
2.34.1



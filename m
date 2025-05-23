Return-Path: <linux-media+bounces-33237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF940AC1ED0
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAE63A2233B
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E4E266B77;
	Fri, 23 May 2025 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cislz5O7"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C8422D7A4;
	Fri, 23 May 2025 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989489; cv=none; b=KC5X/zNpEnlDAn4x0nqIdVRJGzHn+1QPiSArbpvK+AmVmgmlfHCqa4BVfRn6bMR1VBHf4ejkMOtC2xvSbGheHVyTg7058q6H4wQ4roNxmr2iBrEWZ68aie77k+XgJZupliKCHIXWSxdJzimqBKrSgD3YM484bJ1/7xPaECq70iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989489; c=relaxed/simple;
	bh=gfMMfFKCWRsKB2blVrhRdizR4dE94fSlLY0sOVOouR0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BD7bGSFiXH669TStbgCwn3TBJaYIC7VX9vSgQbb29GBcH9tA2cF5GSa576080fjvGATrMwCUNj85R34QlZGkqdOkwpRN8vZmOmdAZ69MCv6LrW9TipRgSvkBCIjpOMgVLf6owTogXygWLMGLj9FrPj+KjTnLGq7JfqnSAGWZOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cislz5O7; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54N8bh2n2049413;
	Fri, 23 May 2025 03:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747989463;
	bh=k1p76UpelNisSwa4C74gtjsBylt/chikLdhHdjZjXP8=;
	h=From:To:CC:Subject:Date;
	b=cislz5O75UXTVNeyyiJ0Hagx1J7AcJ8Y5+b7AA4I51W5GrzPwhREiO31lB4lE4iv+
	 J0oWk7xJvAZbLlxrtkU5mCbrfWLTzAtGD64Z1AOpj5vc2v+2rzuV+mtWid2pM6Ea3O
	 qGR59iBfnlwlUHD+IHq620hZsT2aJ01T+A89jv0Q=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54N8bgRi2094828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 03:37:42 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 03:37:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 03:37:42 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54N8bbs31130054;
	Fri, 23 May 2025 03:37:38 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <vaishnav.a@ti.com>,
        <u-kumar1@ti.com>, <jai.luthra@linux.dev>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <y-abhilashchandra@ti.com>
Subject: [PATCH 0/2] Add support for DS90UB954-Q1
Date: Fri, 23 May 2025 14:06:53 +0530
Message-ID: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports
half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
port. Therefore, add support for DS90UB954 within the existing DS90UB960
bindings and the driver.

Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/e7af7b4f5a4e6304dd572e3a691e8b98

Note: Few differences between the DS90UB960 and DS90UB954 leveraged in this series
were originally explored in an earlier submission [1], which was not merged due to
the contributor being under the Russian ban list. We acknowledge the efforts made
in that submission [1].

[1]: https://lore.kernel.org/all/20241015080737.16272-2-eagle.alexander923@gmail.com/

Yemike Abhilash Chandra (2):
  media: dt-bindings: ti,ds90ub960: Add bindings for DS90UB954-Q1
  media: i2c: ds90ub960: Add support for DS90UB954-Q1

 .../bindings/media/i2c/ti,ds90ub960.yaml      |  1 +
 drivers/media/i2c/Kconfig                     |  2 +-
 drivers/media/i2c/ds90ub960.c                 | 46 +++++++++++++++++++
 3 files changed, 48 insertions(+), 1 deletion(-)

-- 
2.34.1



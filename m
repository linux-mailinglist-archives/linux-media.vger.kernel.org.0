Return-Path: <linux-media+bounces-14706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C892A69D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 18:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D11421F2227E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 16:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35014148313;
	Mon,  8 Jul 2024 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GuAFNxQt"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9EF13C67D;
	Mon,  8 Jul 2024 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454411; cv=none; b=q5Apa2Hu/vjqskoJg6ebiHs1Xu/83y5+rtvT4QblsDaRQoTTMikFZBcsqF4YzXOPLnIZ2/+prWh4HCSAWc4WR+9mjGuZq1c4hA4oWZRH5rm34GI5FM0uNynY4iUUD0hYDraTmIS1mf662Jr9tbIxHw209XknG1F2zSOVpFlVFe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454411; c=relaxed/simple;
	bh=ZQbTkaBr2DOoUJe1drOkDZl3IrtY8+Zz0OkM0BQHeC8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TgRtegoQCuUNZBh/epaftpzUiMJ5cNS0AONyoyuteuR8OsNfCjwiCckkSuHEF0ExLGV2hUBeYMxPFJZ32Kgdvpsxtaemix2AlZH9IdE7lqI4Ald5hs2LLq4KJTxk8lHQPM8+uNihX1LtFDkD8MhbkrXyomTA2tfYLYeVcTpZWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GuAFNxQt; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468FxiSK079666;
	Mon, 8 Jul 2024 10:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720454384;
	bh=QkURj1joryyxKfydPczK0vpjAuNzFSZp9U/Qg34mdC0=;
	h=From:To:CC:Subject:Date;
	b=GuAFNxQtFxCBsc7Psy96CHyQJ8GG/m/uMfFjpLHfMVLsulfIpDT0Bxw0mgty+q3C3
	 7n/0qNQM7Id6JUHUcIxiIMop2cxs0tOp12ague3Sv0LfDERm+DO4robvzM55fm1iOa
	 3FnY69pjAHWBTtcUEMpyN4V0ucNIgcfwjFtxOPHc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468FxiQV051938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 10:59:44 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 10:59:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 10:59:44 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468FxhEX103421;
	Mon, 8 Jul 2024 10:59:44 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <andriy.shevchenko@linux.intel.com>,
        <jani.nikula@intel.com>, <jirislaby@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andi.shyti@linux.intel.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH 0/6] Add rounding macros and enable KUnit tests
Date: Mon, 8 Jul 2024 21:29:37 +0530
Message-ID: <20240708155943.2314427-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

This adds new rounding macros to round to closest integer along with
enabling KUnit tests for all math.h macros.  It also updates kernel-doc to
render math.h related documentation and lastly updates the imagination jpeg
encoder to use the newly introduced rounding macros to find nearest value.

Also to note that math.h is orphaned and so these changes need
to be pulled by subsystem using it as a first as discussed in below
threads:

Link:
https://lore.kernel.org/all/1db64af7-3688-4bcc-a671-9440d8f02d1a@xs4all.nl/
https://lore.kernel.org/all/ZmHDWeuezCEgj20m@smile.fi.intel.com/

Daniel Latypov (1):
  lib: Add basic KUnit test for lib/math

Devarsh Thakkar (5):
  math.h: Add macros for rounding to closest value
  math.h: Use kernel-doc syntax for divison macros
  Documentation: core-api: Add math.h macros and functions
  lib: math_kunit: Add tests for new macros related to rounding to
    nearest value
  media: imagination: Round to closest multiple for cropping region

 Documentation/core-api/kernel-api.rst         |   6 +
 .../platform/imagination/e5010-jpeg-enc.c     |   8 +-
 include/linux/math.h                          |  86 ++++-
 lib/math/Kconfig                              |  14 +
 lib/math/Makefile                             |   1 +
 lib/math/math_kunit.c                         | 329 ++++++++++++++++++
 6 files changed, 434 insertions(+), 10 deletions(-)
 create mode 100644 lib/math/math_kunit.c

-- 
2.39.1



Return-Path: <linux-media+bounces-16834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6E695F49E
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDA6CB20D44
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBFE193075;
	Mon, 26 Aug 2024 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ijqGN3++"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AB313B286;
	Mon, 26 Aug 2024 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684925; cv=none; b=nmnvDHs+R2x9DS7xgXvBKmErowgKGhOMMEMFRL/ToHg3r2Xc+mDoH2vGrJfeF046eFrXmmv6/r+k/JG5tU3rMbBIBKm9NJAcw3beT8hftmqj2RtrsC5XEERKKITPY3sQ6iba3kjzjY7w/6HjXgc0KJ4f7oNFxOTNZA51MVrkG9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684925; c=relaxed/simple;
	bh=IS5O62vTquZGY9iCfoeiIpSDO0hBEfkkcs+K/HFrRBo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pu3d3p2pvVyqcX1rOQvDAFjuW9ZmkI/LJl7qUAnDyoLb7GSRBXyNXHah2l1NSDZ0tWgmnwJZeXBVHrttSFoE0+iATRH6r9kFfW8xwqF4sm9wDD7/CZ101qrdJgWhezcySNnwmoOQwPzYFQRP4LJTbu9GRMF9SluOwEysimVvw54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ijqGN3++; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8OwG036649;
	Mon, 26 Aug 2024 10:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724684904;
	bh=8SadMn9BIJuUjTDgmzUFfmBg/3FZu68BaYZYp7OppYg=;
	h=From:To:CC:Subject:Date;
	b=ijqGN3++9AMq+98M4ft6QqqXcXHl1J6AuXxkP9GmW57yxi/K61ABlHnB+lRiMdY8Y
	 FicGMJuGPwnXwQeLfmlS9Fg5oZMslLbxdh1iSLDWUew3NL9x6rfDkx5ifaMyBczNlt
	 JWZFzLkdsRiZFaHKHwpGlZu2iUydkkpqkGDcA6Vs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47QF8OJ0124004
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Aug 2024 10:08:24 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Aug 2024 10:08:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Aug 2024 10:08:24 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8NCb100774;
	Mon, 26 Aug 2024 10:08:23 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <linux-doc@vger.kernel.org>
CC: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <devarsht@ti.com>,
        <andi.shyti@linux.intel.com>, <nicolas@ndufresne.ca>,
        <andriy.shevchenko@linux.intel.com>, <jirislaby@kernel.org>,
        <davidgow@google.com>, <dlatypov@google.com>, <corbet@lwn.net>,
        <broonie@kernel.org>, <jani.nikula@intel.com>, <rdunlap@infradead.org>,
        <nik.borisov@suse.com>, <Dave.Martin@arm.com>
Subject: [PATCH v2 0/6] Add rounding macros and enable KUnit tests
Date: Mon, 26 Aug 2024 20:38:16 +0530
Message-ID: <20240826150822.4057164-1-devarsht@ti.com>
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
to be pulled by subsystem using them as discussed in below threads:

Link:
https://lore.kernel.org/all/1db64af7-3688-4bcc-a671-9440d8f02d1a@xs4all.nl/
https://lore.kernel.org/all/ZmHDWeuezCEgj20m@smile.fi.intel.com/

Changelog:
V2:
- Fix grammar in new rounding off macro descriptions
- Use roundup for rounclosest to avoid overflow

Previous patch series:
https://lore.kernel.org/all/20240708155943.2314427-1-devarsht@ti.com/#t

Rangediff (V2->V1):
https://gist.github.com/devarsht/a3c4420869d3f66fdc88e0af6a0f0a95

Daniel Latypov (1):
  lib: Add basic KUnit test for lib/math

Devarsh Thakkar (5):
  math.h: Add macros for rounding to the closest value
  math.h: Use kernel-doc syntax for division macros
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



Return-Path: <linux-media+bounces-35867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C774DAE84D0
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1414167806
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 13:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0CD25DAE3;
	Wed, 25 Jun 2025 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="sd+hwJaP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB92586FE;
	Wed, 25 Jun 2025 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858422; cv=none; b=UZOpyio6EHKEGF67WN/W3ukqpiQxPyQXj3EdlygcNn6ZJ7K8L2IkuJ7ZgnYEAT5hj2E+1g+MqTUCCaylXywzoO0P+t/M7W7hN1t2ygP23VYJpsxgTrlh6UQcQ6PDM/wqmhp8hPrGOrIkCCZPTDHtLUYd8t1ER3rqahbiJnW3VeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858422; c=relaxed/simple;
	bh=lDOzfLFYnce2ht1ijwHI+6Ar6U5uFvs8nfLW/Q4S5hU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDHO/eofvrWmkztluRuKHVgPLY+A2CEEoO5gHHjY1u8YnlczVX66SL8TpYK8X1R0uIexFETiTaiI+U/wPcX+helGDLFc2mcPXh48rh1xbhKnihtgxnw2WaXqJ9vkj8Ype+B6e4B7Z1OScUGj8Pk++h11RXh1icGh5yaq42GEnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=sd+hwJaP; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=zqx2KgAi1VCVY7TCjgdrUvxQpLCcfFlwhR6H6v4qQbc=; b=sd+hwJaPQyzCEAOd
	TdgmyMt7TaP2xQ0/hfBh39zR7mNRgLcKzR4Jj1LkVi6Sv93O6woSpQ8H3w1syS34AbUdvLdMR/yDu
	RtneKlm0GJrWDb5njHlNuRxnO1f6JnEyNCPhXA4HdSODKpuBChqQb7VtlwxHn9ocuFO51gTCfTRTo
	KUY0legorSj4fqoL4y8QsBhtZWY3xaCbscZUWjdwtHn5hXicUHIKNIYgabQOVJfLcxbZBWj858ecQ
	aISV541jNnikLqFawuV0Tys58/Dk+AOHnpZJH2UolggnC4ptLhnuCNFd8cX8iomu1D9MNHI9t1WTx
	8NYcytcu3ePYiqG5xw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uUQFe-00Bvly-2J;
	Wed, 25 Jun 2025 13:33:22 +0000
From: linux@treblig.org
To: arnd@arndb.de,
	lee@kernel.org,
	mchehab@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/4] Remove the wl1273 FM Radio
Date: Wed, 25 Jun 2025 14:32:54 +0100
Message-ID: <20250625133258.78133-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

I noticed that the wl1273 radio had an unused symbol, but then noticed
it is on Arnd's unused driver list:
  https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/

So, delete it.
The components seem pretty separable, except for Kconfig dependencies.

That lore URL is over 75 chars, which checkpatch warns about,
suggestions welcome.

Dave

Dr. David Alan Gilbert (4):
  media: radio-wl1273: Remove
  ASoC: wl1273: Remove
  mfd: wl1273-core: Remove
  mfd: wl1273-core: Remove the header

 .../admin-guide/media/radio-cardlist.rst      |    1 -
 drivers/media/radio/Kconfig                   |   17 -
 drivers/media/radio/Makefile                  |    1 -
 drivers/media/radio/radio-wl1273.c            | 2159 -----------------
 drivers/mfd/Kconfig                           |   10 -
 drivers/mfd/Makefile                          |    1 -
 drivers/mfd/wl1273-core.c                     |  262 --
 include/linux/mfd/wl1273-core.h               |  277 ---
 sound/soc/codecs/Kconfig                      |    4 -
 sound/soc/codecs/Makefile                     |    4 +-
 sound/soc/codecs/wl1273.c                     |  500 ----
 sound/soc/codecs/wl1273.h                     |   16 -
 12 files changed, 1 insertion(+), 3251 deletions(-)
 delete mode 100644 drivers/media/radio/radio-wl1273.c
 delete mode 100644 drivers/mfd/wl1273-core.c
 delete mode 100644 include/linux/mfd/wl1273-core.h
 delete mode 100644 sound/soc/codecs/wl1273.c
 delete mode 100644 sound/soc/codecs/wl1273.h

-- 
2.49.0



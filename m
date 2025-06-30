Return-Path: <linux-media+bounces-36279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 782C5AEDC85
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8636C188C946
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 12:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525FE24EA8F;
	Mon, 30 Jun 2025 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4MwWn88"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FEC23ABB4
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285829; cv=none; b=Yo9GP8QahUY29UzFojoaqpl36w7RBuA1kQJeFlpSpInAMSfKdkj4ji/3qybUv/rQkZLO7GUqZVEMeQExorQL5sYvjg/MY2mOKDu2id2GOMdGuyGfkIMxWkEsfNSPl3VDZpkNdF5ebB7Wh0UMjUCJg1x0qUmUpDFA6Vd2sYGeGJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285829; c=relaxed/simple;
	bh=MrTAx21jJ93mXFNjDDrX+WbUv+LHcU6ak9xp7MJ5wGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FtK+cTLErDD/6rE9pqeifdkR6/Ygo8ScttFjp5pLhx7vvebt5ZXhCYwKLto1Hifxq52ppJ/g8YB3WS0//T5MloBdu5eiDJ8X2s7FKfnBTLa8W2eyCz9AsrkhjmtLKq3Xf9v9dxy0Hv+7T2MVwMxI0vkViL4uEPP28WPu5lq8m5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4MwWn88; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB92C4CEE3;
	Mon, 30 Jun 2025 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751285829;
	bh=MrTAx21jJ93mXFNjDDrX+WbUv+LHcU6ak9xp7MJ5wGQ=;
	h=From:To:Cc:Subject:Date:From;
	b=l4MwWn881otUwra+yO+jalsQx7eb1xuOTcXn4aV5ndRL++8557uD/YfiuzF5HYBYI
	 +BYbGdLDy6CUUzKGc63IrQZ7t6XSepcsshdBT1yPzqMlgXOPAcXFnBaouQxwfJ4IA8
	 FyHfAF2M0tmc/zo8bQHCaji6rwi2L5cMs2yRO55rHZ0vMFgtcTZpvoq6/NaYBhhj1c
	 MQq8Wnyi6Av6rBxs1GCMiMkvr9hPzVORoMseaAn/Ip+Yt9gs8ZuPxxxwUdRS+I/pAj
	 bx4JOZa0fdbMjc7Cc5ZLhnYAPv7F/qRhoccCHNPGVOXm8ybHd8n23FDsvufSBzddoy
	 HsWPjWCu/acTA==
From: bod@kernel.org
To: linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: [GIT PULL FOR 6.17] Please pull platform-qcom-media-for-6.17
Date: Mon, 30 Jun 2025 13:17:00 +0100
Message-ID: <20250630121704.260831-1-bod@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 7d16ab17bef917095b10a56b9948cdfd6ccbc5ba:

  MAINTAINERS: add myself as a CAMSS patch reviewer (2025-06-30 12:26:36 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-media-for-6.17

for you to fetch changes up to 7d16ab17bef917095b10a56b9948cdfd6ccbc5ba:

  MAINTAINERS: add myself as a CAMSS patch reviewer (2025-06-30 12:26:36 +0100)

----------------------------------------------------------------
linux-media platform qcom for 6.17

- Venus
  Cleanups derived from various automated checks
  Operating point support added
  Security and exit path bug fixes
  MSM8998 frequency table fix
  Verified: sm8250, sdm845, sc8280xp

- Iris
  HVEC and VP9 encoder decoder added
  Various buffer size and frequency scaling bugfixes
  Verified: sm8250

- CAMSS
  DT binding fixes
  Fix x1e CSIPHY power-rail name
  Improve pipeline power sequencing
  Code optimisations
  Add Vladimir as a reviewer
  Verified: sm8250, sc8280xp, x1e80100

----------------------------------------------------------------


Return-Path: <linux-media+bounces-31281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5BEAA07B5
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 11:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29FAA1B6064B
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 09:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820792BE10B;
	Tue, 29 Apr 2025 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="mlym7ABC"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288022BE0FE
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920117; cv=none; b=tgPtHW0EvHW7UZOSeru0vO7SoXDpjdr0Vpbg8/vyERjnPmbQi1LWLkwL5DzgzGnLXTW8hhqYsbINhtJT5YU7/lZ3gIh7LP72Au23mORWU53TmpLLT91Zq+FgBiiEsKPadPzRHDtEPbBDTR9z3QGfDYhZqwbhbd7r4f8oUGACjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920117; c=relaxed/simple;
	bh=Ognph0KczDgbYRAcXCpcNnZ7jWd2vBCwTHl72vuXxck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyOFBzYfchpo5Fe0s5nxTdZ36okxoD2Punpv7i5IkMEE001Mma1XWKJLFq30/YI82/G1Mhk3Fcy64ZLodN8Vw00c3HdI0hu5E9jNy/50UaPDZ0oaflScp2QRMy4m4H8gJ1dFVs6YOyJRdCOUKyUkKaSyZ88dRIxHtGXa7Lkwn9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=mlym7ABC; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1745919575; bh=Ognph0KczDgbYRAcXCpcNnZ7jWd2vBCwTHl72vuXxck=;
	h=Date:From:To:Cc:Subject:From;
	b=mlym7ABCwkoRCn/z5xz0uwWiCVooRFUu5obZcc6QBPRcT+RCTfTvDl6f4oBdNFlxH
	 mKGjBSKRIVAYfp+aLMpPYQ2ROTOBQ8jvG8GmClEnTPOhepH260AubE+/d7iPtrh92r
	 XU2cEuu1WJRpwgTAyrs/pR09fF5xOuVpLvs65DCx4QM2fAvrEYpaTe6XvW84xVjc0A
	 UvG5Nzrl59F2/AUPu9hR8nQdYQVPo22Ceg0fp+7f+RX1jGL+xSd6QalAg0CEL1RHrV
	 hkIpW86/32fSAkksSoCrrAb4Ftkm7DFkmQumIXVd/MPYMgCnRVa/AnxeJiiHzsi3is
	 bCwHoVUGXCQcg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id C2168100088; Tue, 29 Apr 2025 10:39:35 +0100 (BST)
Date: Tue, 29 Apr 2025 10:39:35 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Petja Patjas <pp01415943@gmail.com>
Subject: [GIT PULL FOR v6.16] Minor rc core keymap fix
Message-ID: <aBCeV84Mn_BtZMml@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 398a1b33f1479af35ca915c5efc9b00d6204f8fa:

  media: gspca: Add error handling for stv06xx_read_sensor() (2025-04-25 15:14:37 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/seanyoung.git tags/v6.16a

for you to fetch changes up to e6378c0b6fe17f743a1ba58c1437932812715795:

  media: rc: add keymap for Hauppauge Credit Card RC (2025-04-27 13:51:33 +0100)

----------------------------------------------------------------
v6.16a

----------------------------------------------------------------
Petja Patjas (1):
      media: rc: add keymap for Hauppauge Credit Card RC

 drivers/media/rc/keymaps/rc-hauppauge.c | 42 +++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)


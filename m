Return-Path: <linux-media+bounces-42229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F459B51BB4
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 17:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 366BF544B9A
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 15:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F06261B83;
	Wed, 10 Sep 2025 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="P8mondxE"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4852329F33
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757518382; cv=none; b=X/fV8GwPfxSCsFt0DKMr7WC2X+F6SXpudNqfBDZLSP4fe6P+0wl/15PEld1CiOEmgzinS+CKi1yLGXs5Ua/JYsufpQUITrqOgOyv24QLYQgkeb6HKyi1cKvnEiM8z+6i/oAPG6suaUuc9iTg64xS9b/O76mmtsb8kZvwn+3oRsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757518382; c=relaxed/simple;
	bh=dJ2462Vlk+v24fvh7BOOGdY4vOEkMjbYG06F8E1wxrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/MboVFc4o1GJcQ2chfGPmL18BBMLLWEwJMrXWyVCSdQu1VRVi9Vwywm9pwNsUmsD9Sla0oMMWG2WbnAQ3iKoRXqa+7X1J/jFOgssal4EGeR2jFziWS1/8mNJ+/nS9Amp/iotSupeCoLCbKKXbTpB3rpgwo1JfF2bEm+7gYVPgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=P8mondxE; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1757517787; bh=dJ2462Vlk+v24fvh7BOOGdY4vOEkMjbYG06F8E1wxrY=;
	h=Date:From:To:Cc:Subject:From;
	b=P8mondxEBE2vh+TM+uACNdGUtsB9Pgj0EH1vqF8oYZpAPu8XaJKGHSIcu/K9ejb1G
	 b6B78Z2lM/JzksVoxwd6qUstU5MvI7znNa7lsv3jmSLBqzh+OA35pzsH9H8/1wrhB7
	 C6UNmAw4FVpPZq0v94yATkom5jWGqu3G/CAe9VepJ1apB7LTtKuRiWqRt1ApjPJIpU
	 E/IFsMbDNpA24ChXAOT0kRdQwt8wQYAZbI+xuVrmv5nZCgLcHdWkTZNbixGrwYYxOd
	 FBZqzjcj9ZUOA7Ed8coGL5BVIT6lpb8xvm34yrPlvKjHyzTK/qwCThmMrpP+tIJybz
	 WVoYBTA/y5EYg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id C5F511002BE; Wed, 10 Sep 2025 16:23:07 +0100 (BST)
Date: Wed, 10 Sep 2025 16:23:07 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>,
	Larshin Sergey <Sergey.Larshin@kaspersky.com>
Subject: [GIT PULL FOR v6.18] RC fixes
Message-ID: <aMGX27HdaCW53PwL@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Hans, Mauro,

The following changes since commit 8cfc8cec1b4da88a47c243a11f384baefd092a50:

  media: mc: Clear minor number before put device (2025-09-10 10:42:13 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/seanyoung tags/v6.18b

for you to fetch changes up to 64ea936e778d86a85d6a1099a6e36c3ee91df844:

  media: redrat3: use int type to store negative error codes (2025-09-10 14:17:23 +0100)

----------------------------------------------------------------
v6.18b

----------------------------------------------------------------
Larshin Sergey (1):
      media: rc: fix races with imon_disconnect()

Qianfeng Rong (1):
      media: redrat3: use int type to store negative error codes

 drivers/media/rc/imon.c    | 27 ++++++++++++++++++++-------
 drivers/media/rc/redrat3.c |  2 +-
 2 files changed, 21 insertions(+), 8 deletions(-)


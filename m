Return-Path: <linux-media+bounces-35615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E76AE3DAD
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA76016BB91
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A4123CEF9;
	Mon, 23 Jun 2025 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbBT/gWX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CED1F2BAD
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676994; cv=none; b=CYAFZBSFuKurqicLs/JvbaxBF59/em6KxWoFtDvIeKDAPtRUQw/OkdDMDeNsOl8DWcCjsJuDJ0cKObiSKNyETibPQRZfIIJhP07Nb88HZPTLnYWkB7Rh2FWEQX+J8Jcb1loxOUOL0YoCe3Wi7GLDwSDW5WJFgiMq+lYmpMpYQ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676994; c=relaxed/simple;
	bh=MktKs/hgbOE5aeJuk1qAV+WjYtecuSyl+bmLi0dQrjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJ/SoAxN5HhumfBlA0+vZGYLJ+FevrZUifTRQQsYaXL/p8JvGzX9m1QtN3Lvz+3Zm+LmPW22obbNMUH/28iywIAh8G+n+Ix7OISGoQDu1uIy4gWP7lP5TI9COd60yuH2foyulQNrjAy6qqTyv7rWHiUH7uBQgm1HoWYhPOi0ELA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbBT/gWX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C41C4CEEA;
	Mon, 23 Jun 2025 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750676994;
	bh=MktKs/hgbOE5aeJuk1qAV+WjYtecuSyl+bmLi0dQrjE=;
	h=From:To:Cc:Subject:Date:From;
	b=nbBT/gWXAWA0thoyTXT4iAYVWmJMBHMVJTSMYBdYyXWnBvWh6wvp3q1+1kF65p/Y8
	 1VvzxAtOxJh8gdpEfeEvedFNsCoCahUNeONNoTPagYxqmQiHGgEVG9dyxVClixfac6
	 ILBV88hgFJ6R0Kn0e4lLUlB90uTIScfgInWiegtRyIw5S4dQ/axjuGaHoDM0nEBiEW
	 4/qT4r5Al6vX1VyqRXv78PFfJlJ+fN6HXC3gF/2elBplW5DGRASAwI07LI/hie7o1v
	 nfloGj4Q5odiFdK9qwgpUmyf74MWBdVHX6JvD7OkrqaK2LHk93hLLW7EosT8kNhArF
	 naBHOWy5Kk98w==
From: Hans de Goede <hansg@kernel.org>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: ipu-bridge: Add HIDs of 2 more sensors to list of supported sensor
Date: Mon, 23 Jun 2025 13:09:49 +0200
Message-ID: <20250623110951.18649-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is a resend of 2 patches to add 2 new sensor HIDs to the ipu-bridge
code. I'm resending these because these 2 patches seem to have fallen
through the cracks.

Regards,

Hans


Hans de Goede (2):
  media: ipu-bridge: Add Toshiba T4KA3 HID to list of supported sensor
  media: ipu-bridge: Add Onsemi MT9M114 HID to list of supported sensors

 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.49.0



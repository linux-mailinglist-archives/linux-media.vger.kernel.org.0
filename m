Return-Path: <linux-media+bounces-502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C85807EF396
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 14:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 043C21C209F3
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 13:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C5E31A74;
	Fri, 17 Nov 2023 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="knprkTdL"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F9AD55
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 05:16:27 -0800 (PST)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4SWy8p0bFQzyYM
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 15:16:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1700226986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Vwtte2qM0LNtr5cyHyx7BoMJZFYKCAjd0dv7qwsJ6KA=;
	b=knprkTdLr3nnk4Ujw8Rhfhrafoc88WIwjwhhtGJDRaUU1d9j+Tr2HuqUS0yl4ALlzRRbC/
	oWYUyQteeM0Vw6fL4nBhFeNtNNuPLJqz2fqaJnFrxIOssqddw1QZR0SXynahfQa0pChirN
	G0G4h4PkUFodcMaBL9CYc7DIZudPnRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1700226986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Vwtte2qM0LNtr5cyHyx7BoMJZFYKCAjd0dv7qwsJ6KA=;
	b=omxNitFGPyo1wuDkiHL2s1dQe/uXx7KYV3lSfGEwTtn5NqS0S7sb5XT/GCbpCNsOAGG0ae
	Qr+SY+p1uS19Sb+uRJZE6jR4fdhbwrlqqFh2etAqRX1if0niAw3CH/uHZkvTzqIkXD4iDr
	EiR9PJD0eWgJ9Gm/KwJG+6ylQMI6C9U=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1700226986; a=rsa-sha256; cv=none;
	b=EnII1soXqVkvklk34OkbVs2ur9xVv/NYUV+mK1tnkYa+WwKBz5xes/A56pwJA+NBa1NwU/
	PnZxJRC7vzSJzRRUvbK8ZSYg4emDF37UC/uDQXK5SkM/ImccE5s9zJWbl8+/LdE7rp3MUR
	R1ii0x8CSTMVIwg81oU0Mo0pCHMEVKY=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 42323634C94
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 15:16:22 +0200 (EET)
Date: Fri, 17 Nov 2023 13:16:22 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.8] V4L2 subdev patches
Message-ID: <ZVdnpn9EpuY9phPg@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro, Hans,

I've split the large PR into two smaller ones, this only contains
relatively unimportant fixes and cleanups mainly for the recenlty merged
IVSC driver, but also one for the CCS driver as well as an indentation fix
for the v4l2-subdev.h header.

Please pull.


The following changes since commit 1865913dd590ca6d5e3207b15099a1210dd62f29:

  media: meson-ir-tx: Drop usage of platform_driver_probe() (2023-11-16 13:56:48 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.8-3-signed

for you to fetch changes up to 27b4ca9ef301b2475d4a72d2a8c264ebe7f91482:

  media: ivsc: csi: Check number of lanes on source, too (2023-11-17 09:41:52 +0200)

----------------------------------------------------------------
V4L2 patches for 6.8

----------------------------------------------------------------
Laurent Pinchart (1):
      media: v4l2-subdev: Fix indentation in v4l2-subdev.h

Sakari Ailus (7):
      media: ccs: Ensure control handlers have been set up after probe
      media: ivsc: csi: Don't parse remote endpoints
      media: ivsc: csi: Clean up V4L2 async notifier on error
      media: ivsc: csi: Clean up notifier set-up
      media: ivsc: csi: Clean up parsing firmware and setting up async notifier
      media: ivsc: csi: Don't mask v4l2_fwnode_endpoint_parse return value
      media: ivsc: csi: Check number of lanes on source, too

 drivers/media/i2c/ccs/ccs-core.c       |  5 ++-
 drivers/media/i2c/ccs/ccs.h            |  1 +
 drivers/media/pci/intel/ivsc/mei_csi.c | 69 ++++++++++++++++++++++------------
 include/uapi/linux/v4l2-subdev.h       |  2 +-
 4 files changed, 50 insertions(+), 27 deletions(-)

-- 
Sakari Ailus


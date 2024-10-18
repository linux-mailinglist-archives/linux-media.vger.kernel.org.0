Return-Path: <linux-media+bounces-19830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804DF9A34C0
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A0CE285F30
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DDF18CBFA;
	Fri, 18 Oct 2024 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mr2euONv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D818785D;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=KyC2Fn8pGFYivFz9EvtLKl6KyCOtvijiuZ/kkaFG/Wbe2AMxh2xvgKmyE4/M9uzfsk79ApqjaTxaHsymkw7G4UjFzELKbd25gvLVK9WpP+yDlqPYWIT2byNkTwfqkticvpaHFw2YlLRWzKY8jTPJD1vn0qzs8CT8R+dhcHCu3Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=aG6hoMo4uzmVEhnDz98AaAEGaoD34QTsOAO33KKqS9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XC1s1pgiwn3ZdcN2C2IH6D5BZxuqFj6yQvwDL0r+q28P/ddCmd4aBqLUaxrkuaO1AKGOZgXtg3FhGhc9Q90FJYrcZl8w8CmgCuCbKUBYYP19i4K8XDRJYgHtOCk2VjL9Rx9VYtU3BzRYWe9f8WE1rVBD2zyugcPk/v6IXh/s5k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mr2euONv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFCCC4CED4;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=aG6hoMo4uzmVEhnDz98AaAEGaoD34QTsOAO33KKqS9g=;
	h=From:To:Cc:Subject:Date:From;
	b=Mr2euONv4fUfZDP/s3EqyB2EvuHMXCn53FiDk83Ep31dnZX5NT9xksVhYGFJ9AZub
	 WLiyV9o5/SGvI1a5R3mbU5b6Cc6jhPC8PLIp8AU2d1YzwVcVz7ug+uL3TkOVnLeJMH
	 /45FX3+jmX8kQMtQ9OPF/cWVG7bfYCAJ+BYdSg+i9pPiO7aqUqalA70ohGe4/YhHKE
	 Vpam9QFxLYw3tGa8feJ8endFQyjYQp2ss6AGczaSUYrPL89mkdh2EDmdCQFr0VDhHh
	 DT8jU+y8BEZDjh5LJUeJtE1AHccZfzpIaWVtaSTpFki0Dmuh1kKAOy/jQwGeiwMgRA
	 z+wXkxCJH2lvw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005Mdu-18To;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 00/13] Media: fix several issues on drivers
Date: Fri, 18 Oct 2024 07:53:02 +0200
Message-ID: <cover.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are a number of issues that aren't passing on smatch or Coverity.

Address some of them.

Mauro Carvalho Chehab (13):
  media: v4l2-ctrls-api: fix error handling for v4l2_g_ctrl()
  media: v4l2-tpg: prevent the risk of a division by zero
  media: dvbdev: prevent the risk of out of memory access
  media: dvb_frontend: don't play tricks with underflow values
  media: mgb4: protect driver against spectre
  media: av7110: fix a spectre vulnerability
  media: s5p-jpeg: prevent buffer overflows
  media: ar0521: don't overflow when checking PLL values
  media: cx24116: prevent overflows on SNR calculus
  media: adv7604: prevent underflow condition when reporting colorspace
  media: stb0899_algo: initialize cfr before using it
  media: cec: extron-da-hd-4k-plus: don't use -1 as an error code
  media: pulse8-cec: fix data timestamp at pulse8_setup()

 .../extron-da-hd-4k-plus.c                    |  6 ++---
 drivers/media/cec/usb/pulse8/pulse8-cec.c     |  2 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c |  3 +++
 drivers/media/dvb-core/dvb_frontend.c         |  4 +--
 drivers/media/dvb-core/dvbdev.c               | 17 ++++++++++--
 drivers/media/dvb-frontends/cx24116.c         |  7 ++++-
 drivers/media/dvb-frontends/stb0899_algo.c    |  2 +-
 drivers/media/i2c/adv7604.c                   | 26 ++++++++++++-------
 drivers/media/i2c/ar0521.c                    |  4 +--
 drivers/media/pci/mgb4/mgb4_cmt.c             |  2 ++
 .../platform/samsung/s5p-jpeg/jpeg-core.c     | 17 +++++++-----
 drivers/media/v4l2-core/v4l2-ctrls-api.c      | 16 ++++++++----
 drivers/staging/media/av7110/av7110.h         |  4 ++-
 drivers/staging/media/av7110/av7110_ca.c      | 25 ++++++++++++------
 14 files changed, 94 insertions(+), 41 deletions(-)

-- 
2.47.0




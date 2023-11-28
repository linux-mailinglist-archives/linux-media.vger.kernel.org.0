Return-Path: <linux-media+bounces-1291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DA07FC527
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 21:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6F5F282E7B
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 20:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA3940C1B;
	Tue, 28 Nov 2023 20:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sgneeDHb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4251612C
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 12:19:35 -0800 (PST)
Received: from umang.jain (unknown [103.238.109.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1A16BEB;
	Tue, 28 Nov 2023 21:18:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701202738;
	bh=BYZnM8Xk87PhsS1AGfDd/LqFrgG9aXvrXv8so0BrbZo=;
	h=From:To:Cc:Subject:Date:From;
	b=sgneeDHbIQ2civmHWobsP+4TS7bjIePcEmPPjyH8m5Ebf5oghyomE2Qz0gzw4KdkV
	 1LJtKZKthA8UHOz612xAcoCofVhnOKoWv4Sho7n4ESDdI6meCnMaJAb4F50ITCYNMc
	 yAtY7IZ/WEsktCXkwxRE5UxZJo3ahJbMmh77/PFg=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/5] staging: vc04_services: Drop custom logging
Date: Wed, 29 Nov 2023 01:49:21 +0530
Message-ID: <20231128201926.489269-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series also removes the vchiq_log_* macro and makes use of dev_dbg()
directly.

Patch 1/5 is fix. It prevents passing NULL to one of vchiq_log_error().
The function there in question, does not have any users as of
now. However, it is going to be used by the vc-sm-cma and bcm2835-isp
drivers (posted on list for review [1]). There was discussion on v1,
whether I should drop and add the function later, however, didn't 
conclude.

Patch 2/5 removes vchiq_log_error() macro
Patch 3/5 removes vchiq_log_warning() macro
Patch 4/5 removes vchiq_log_trace() macro
Patch 5/5 removes vchiq_log_debug() macro

This completes the following TODO item:

```
* Cleanup logging mechanism

The driver should probably be using the standard kernel logging mechanisms
such as dev_info, dev_dbg, and friends.
```

[1]: https://lore.kernel.org/linux-media/20231109210309.638594-1-umang.jain@ideasonboard.com/

Changes in v2:
- Separate out one fixup patch from v1 (Patch 1/9)and send separately
- Drop usage of log_type() and log_category() helpers. Directly use
  dev_dbg() as suggested by Greg KH.
- Drop __func__ annotation from all logs. Dynamic debug has 'f'
  decorator flag which can be used instead of manual __func__
- Reword commit messages.

Umang Jain (5):
  staging: vc04_services: Do not pass NULL to vchiq_log_error()
  staging: vc04_services: Drop vchiq_log_error() in favour of dev_dbg
  staging: vc04_services: Drop vchiq_log_warning() in favour of dev_dbg
  staging: vc04_services: Drop vchiq_log_trace() in favour of dev_dbg
  staging: vc04_services: Drop vchiq_log_debug() in favour of dev_dbg

 drivers/staging/vc04_services/interface/TODO  |   5 -
 .../interface/vchiq_arm/vchiq_arm.c           | 176 ++++----
 .../interface/vchiq_arm/vchiq_connected.c     |   8 +-
 .../interface/vchiq_arm/vchiq_connected.h     |   4 +-
 .../interface/vchiq_arm/vchiq_core.c          | 402 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |  38 --
 .../interface/vchiq_arm/vchiq_dev.c           |  92 ++--
 7 files changed, 315 insertions(+), 410 deletions(-)

-- 
2.41.0



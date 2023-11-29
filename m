Return-Path: <linux-media+bounces-1367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334C7FD919
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 15:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FC44283066
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D6330659;
	Wed, 29 Nov 2023 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqr1rOh+"
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Nov 2023 06:17:07 PST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75301B6
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 06:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701267428; x=1732803428;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uuaB+t3XO6PdGE2f8wJbaOhFVL9FuH/BtgN9I+SKdLk=;
  b=nqr1rOh+qqfauAwX0k3PX5hggCV/pzHrEbsWaIzdvGHZRvOO/VVjF/83
   hCzpNnja+5vRyk5YqcmdboShaYACTHjjZk1aZzDbjWk+lxMe5SOyz7kxU
   lnZw0RlnthBkuCApVnCQJrs8TwYUdni8mB9ROJpZpOnSVrdkKqZLOZe+Z
   beay4NwKXSNYC690m1o/oRTNkRZxSlp59nCN8NADsCdLerDWIIxFlZ0jN
   NfVzxJ8rySRfgy7BjuG8BPrDoRrTSmDCRMzFV5V0tqAfjFdWktGy6JV13
   tKlZwpPO7LlImHYsyU9+pBJvZ8dGuBbBeTn3wR9fPJxb0VA1ytAHieJPq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="153849"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="153849"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:15:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912868282"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912868282"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:15:49 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 26F1111FC26;
	Wed, 29 Nov 2023 16:15:46 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 0/2] Don't set bus info for test drivers
Date: Wed, 29 Nov 2023 16:15:43 +0200
Message-Id: <20231129141545.87461-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

As it's no longer needed to set the bus_info field for querycap or MC
device in drivers, drop this from vimc and vivid drivers.

Sakari Ailus (2):
  media: vivid: Don't explicitly set bus_info
  media: vimc: Don't explicitly set bus_info

 drivers/media/test-drivers/vimc/vimc-capture.c | 2 --
 drivers/media/test-drivers/vimc/vimc-core.c    | 2 --
 drivers/media/test-drivers/vivid/vivid-core.c  | 4 ----
 3 files changed, 8 deletions(-)

-- 
2.39.2



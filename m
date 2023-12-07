Return-Path: <linux-media+bounces-1796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1BC808348
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 09:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 904E31F224C5
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 08:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FBF2FE31;
	Thu,  7 Dec 2023 08:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EnfGyWg3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B26D10CF
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 00:38:46 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.79])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE3CE674;
	Thu,  7 Dec 2023 09:38:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701938283;
	bh=75xCJqmJUVCtt3VKSEVcNMF8m0/zCSzzSSX8SGDenjU=;
	h=From:To:Cc:Subject:Date:From;
	b=EnfGyWg3WcOg3ilmYkUWkC+IRBW1kAjobv7ZLg7ckmix9A6h85uPnygrWKxrQG/s7
	 AcFX5bjS/jF9CzjuITpzZVpqhqYfeOJUzTUB1wksCLwE6WOs4joS9WpKrML5289wHm
	 mJtmW+lLNY5o2z0qZ1aX3ZjaGZoemWIQluLc0uao=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 0/2] staging: vc04_services: Use %p to log pointer
Date: Thu,  7 Dec 2023 14:08:35 +0530
Message-ID: <20231207083837.153843-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

%lx is used to print the unmodified pointer address for debugging.
%p will print the hashed pointer address to avoid leaking information
about kernel memory layout to userspace. But when `no_hash_pointers`
is passed as kernel parameter, unmodified pointer address will be
printed.

Hence, drop %lx in favour of %p. For debugging purposes, one can
easily depend on `no_hash_pointers` kernel parameter.

Changes in v3:
- reword commit subject line.

Changes in v2:
- Built/Rebased on top of:
  [PATCH v2 0/5] staging: vc04_services: Drop custom logging

Umang Jain (2):
  staging: vc04_services: vchiq_arm: Use %p to log pointer address
  staging: vc04_services: vchiq_dev: Use %p to log pointer address

 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 7 +++----
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c  | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)


base-commit: 55e23aa95b10731c08ab207a42d868aaff3bd2a5
-- 
2.41.0



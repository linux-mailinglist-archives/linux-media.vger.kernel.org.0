Return-Path: <linux-media+bounces-938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A457F6804
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 21:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B4A71C20CE3
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 20:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF694D138;
	Thu, 23 Nov 2023 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IbkuHSDs"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17721F9;
	Thu, 23 Nov 2023 12:04:46 -0800 (PST)
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 74B416607394;
	Thu, 23 Nov 2023 20:04:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700769884;
	bh=ergabYaAv14XuAzNZwCnvpH0+KUtcqgOCKlAljZh9P4=;
	h=From:To:Cc:Subject:Date:From;
	b=IbkuHSDsL/L8KhKQVNcLmTEFQdcmARfvBS4szdVbmIOGqo+/ZU/3nP5Tks+prg+NA
	 2fPPS7e/VxB5n+irM0smRD/vgFEIWeXCSf0MZ1qOsmkPjbk101sxT2Kosewt7RZOzA
	 NDuaB8s/Afr8SteDBfUvQqSt6faZ6xL7IvgzID+7dWF074ny61VlVqd2ahTHEtp7qJ
	 hR/aI/HLqD0sQEP7JyXSe8akwcMlN+tyEPRsfZX18M2jixsShBtgTTovSNyBWRfjJv
	 5Byv4e4iFtRh1cR/+4AEfr9L/xiDqmwwVmavrgaLM4fHjGVB9uTZMU3c4YbjwB/v4s
	 XLzLZwuKq0EKg==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 0/4] visl: Adapt output frames for reference comparison
Date: Thu, 23 Nov 2023 14:57:43 -0500
Message-ID: <20231123200451.148097-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using visl in automated tests, we need to have output frames that
can be compared to reference frames or hash of those to validate that
the whole pipeline is working properly.

Add a "stable_output" module parameter to make sure that a given input
stream always outputs the same frames.
This is done by skipping information like queues status and pointer
values.

This also adds some stable variation in the frames so that different
input give more different output.

Changes since v2:
 - Set parameters permissions to 0444 in visl and vidtv
 - Make stable_output true by default
 - Keep showing frames timestamps and remove vb2 buffer indexes only in
   stable output mode
 - Make codec_variablility non optional (remove parameter, keep
   implementation)
 - Add details on used variability fields
Changes since v1:
 - Fix typo in parameter documentation

Detlev Casanova (4):
  media: visl,vidtv: Set parameters permissions to 0444
  media: visl: Add a stable_output parameter
  doc: visl: Document stable_output parameter
  visl: Add codec specific variability on output frames

 Documentation/admin-guide/media/visl.rst      |   4 +
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  20 +-
 drivers/media/test-drivers/visl/visl-core.c   |  15 +-
 drivers/media/test-drivers/visl/visl-dec.c    | 292 ++++++++++++------
 drivers/media/test-drivers/visl/visl.h        |   1 +
 5 files changed, 221 insertions(+), 111 deletions(-)

-- 
2.41.0



Return-Path: <linux-media+bounces-34086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3CEACEA9D
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 09:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB5203A4BAF
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 07:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F551BD035;
	Thu,  5 Jun 2025 07:05:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D15B2C3242
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107144; cv=none; b=Svp97H8KucDS3ycqKN5MW6AyGimPCRnC3h57/b2B+T+TJIt2yb99uGdT+Or8/Vu4pXarjwXi4sTZ4bb6DcRkY7ajG/LVuFmO4adXURFscCooKcSk7Rh2jcym8XWDJUO3LlFz9PmbTRikjwN4cLLnGStuEk148pAMpwek7FAs2lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107144; c=relaxed/simple;
	bh=ayn26Pc75iuLXzSrN8Q8BWf2ETKFVY3cW9V/idd46Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iOmstwUXpBn1OrGBJszvgmnp1Gh6bWuzD+nNdfWAADGLx6USNFcErhwnfhFqT/P/59K6a1yxu7f6jLlmiUMYU8pPYhcEP2ZORu/XJXUtdYzMMwz0bASaM/AN9FpwSbT/XkIGY98tLpA/oPVGGcItai2PW+i8YqFS7uN4rhJjTvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42975C4CEF0;
	Thu,  5 Jun 2025 07:05:43 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 0/5] media: dvb/vb2: fix DVB streaming, drop wait_prepare/finish
Date: Thu,  5 Jun 2025 08:57:34 +0200
Message-ID: <cover.1749106659.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last user of the vb2 wait_prepare/finish callbacks was dvb-core.

It turned out that the DVB streaming I/O code suffered somewhat from bit
rot, especially since the patches adding streaming I/O support to v4l-utils
were never applied, so there was no way to actually use it in
dvbv5-scan/zap.

I will post a separate series adding support for this, based on the
original patches from 2017 (!).

The first two patches for dvb-core fix two issues found while
regression testing. The last three patches in this series remove the
support for the wait_prepare/finish callbacks.

Regards,

	Hans

Hans Verkuil (5):
  media: dvb-core: dmxdevfilter must always flush bufs
  media: dvb-core/dmxdev: drop locks around mmap()
  media: dvb-core: dvb_vb2: drop wait_prepare/finish callbacks
  media: vb2: remove vb2_ops_wait_prepare/finish helpers
  media: vb2: drop wait_prepare/finish callbacks

 Documentation/driver-api/media/v4l2-dev.rst   |  8 +--
 .../userspace-api/media/conf_nitpick.py       |  2 -
 .../media/common/videobuf2/videobuf2-core.c   | 49 ++++---------------
 .../media/common/videobuf2/videobuf2-v4l2.c   | 14 ------
 drivers/media/dvb-core/dmxdev.c               | 46 ++++++++---------
 drivers/media/dvb-core/dvb_vb2.c              | 45 ++++++-----------
 include/media/dvb_vb2.h                       | 17 ++++---
 include/media/videobuf2-core.h                | 23 ++-------
 include/media/videobuf2-v4l2.h                | 18 -------
 9 files changed, 62 insertions(+), 160 deletions(-)

-- 
2.47.2



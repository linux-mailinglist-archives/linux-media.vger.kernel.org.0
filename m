Return-Path: <linux-media+bounces-40839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA4B331C2
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 20:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 924D82012E8
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 18:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3959F2DE6E5;
	Sun, 24 Aug 2025 18:08:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58D1E7660;
	Sun, 24 Aug 2025 18:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756058886; cv=none; b=Vv+Ya2ab8Xz8cttZf+xbd2A7Tqj3ZZrJ7JjcTCXblmY15qviUohoV/b+v5sTnuzNTlGvRhyzUwDTfIJOcCE8VKfLlGVZLkGzA/I4yRbcCRYXimJk0eK5wWbklplln0qdUeKjjZ6F3FqvyPRBknV77drwS4xnvS8wYDifMXxyTVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756058886; c=relaxed/simple;
	bh=AXqvKB/Jhsaoxd1nNvwJBxFArZ4cC+Khs+VYGtYfj+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FfyDZCqXGzFWdLhJRlik3tuXLpceMgHzxhqpc7vUoIL+zFTlTAD6XuG9TUVcmPLUabcqQyA/bCh3gkyTtBcMKapKM63VK6s/YsStpFLRj3mkegZK5e5reP+2DP90hgc8QmnrgVkOk3Ux3e02lhoeA2eRTHxsGHwxICDzkg7mOZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 2290E1F0005B;
	Sun, 24 Aug 2025 18:07:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 92777B01DDF; Sun, 24 Aug 2025 18:07:53 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id EED6BB017C2;
	Sun, 24 Aug 2025 18:07:35 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2 0/4] Minor V4L2 Headers and Codec Doc Cleanups
Date: Sun, 24 Aug 2025 20:07:31 +0200
Message-ID: <20250824180735.765587-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
- Added minor codec control cleanups;
- Added documentation about h.264 frame-wide type flags

Paul Kocialkowski (4):
  media: uapi: Move colorimetry controls at the end of the file
  media: uapi: Cleanup tab after define in headers
  media: uapi: v4l2-controls: Cleanup codec definitions
  Documentation: media: Document
    V4L2_H264_DECODE_PARAM_FLAG_PFRAME/BFRAME

 .../media/v4l/ext-ctrls-codec-stateless.rst   |   8 +-
 include/uapi/linux/v4l2-controls.h            | 121 +++++++++---------
 include/uapi/linux/videodev2.h                |  18 +--
 3 files changed, 75 insertions(+), 72 deletions(-)

-- 
2.50.1



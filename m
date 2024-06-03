Return-Path: <linux-media+bounces-12474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B6A8D85FA
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 17:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53EDA281E7A
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B7F130495;
	Mon,  3 Jun 2024 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mdyuQMZ+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53112CDBA
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717428371; cv=none; b=Ug0wuM5DKWfZgel/7VcgoLg88DGeyG1kKE+UQA/8coMy0KZUS9iywgSbKrTjV7Mnh5+/dx6lrGO61fbanKgxi/Q2DQJKI0meC0Cq4GJqHKDqJnfz2m7dZ7y572Lai7IAe4VA1NDIfxaspqnLFgUKFkflUdJ7lDCPUPOfxXyO7ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717428371; c=relaxed/simple;
	bh=9ErfmJPX78O0wIPfvxmAkfOVjxzZ6nKx7SYmxrK8rJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJlXJldZXbCHNlM4bczxgaSK4p6tqxmgSuWjL2HdBZNuYYueDq1GemKoSO89U0Radr/GY9UdF8EOJYP05QW3v/YkXYaKWmzG+w2EogBZYlYN7hGSgZuRAtmYWjz/WcwbAC3bYV30VkDbsaQDXQ3/HAzarwwX56v3AmJrb016sMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mdyuQMZ+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7468039F;
	Mon,  3 Jun 2024 17:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717428353;
	bh=9ErfmJPX78O0wIPfvxmAkfOVjxzZ6nKx7SYmxrK8rJ4=;
	h=From:To:Cc:Subject:Date:From;
	b=mdyuQMZ+9ZGEFK1sWp/dhJP9rfT3ME2Sal3ORSgF8rKfbwJdht/VdCW+gCYNPCWw2
	 IiKZFrdRMeLfmOP0Zsu0cR3w6kvMIWXqv7xWY3F+/t/T/QcydNbOmoBoKgkUtwNJi2
	 vqvlES/V8eRC68qzEzHpB4fewqLQAIsmB3TaEHl4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [RFC 0/3] media: videobuf2: Allow driver to override vb2_queue.buf_ops
Date: Mon,  3 Jun 2024 17:25:44 +0200
Message-ID: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello

  I have the need to allocate a scratch buffer to mirror the content of the
vb2_buffer planes (more detail on this on request).

The allocation of such 'scratch' buffer should ideally be done once, at buffer
creation time (and released at buffer release time ?)

Looking at the videobuf2 framework implementation I noticed that the ideal entry
point for this would be vb2_queue.buf_ops.init_buffer, which is called in the
__vb2_queue_alloc() call path.

I have noticed that the vb2_queue.buf_ops members seems to be there to be made
overridable by drivers, but are instead:

1) unconditionally set by the framework in vb2_queue_init_name()
2) the core helpers are not exported

hence I was wondering if this is the result some half-baked attempt to make
them ovverridable or the possibility of override them was instead deprecated.
As I found no traces of this in the log, I thought it was easier to send an
RFC.

I also checked what other entry points I could have used to allocate backing
memory for a buffer, and I have considered vb2_queue.vb2_ops.buf_init which
is however called in the vb2_req_prepare() call path (I'm not using the request
API atm) or in the VIDIOC_PREPARE_BUF call path, which requires ad-hoc
instrumentation in user space (something I would like to avoid if possibile).

What do you think ?

Jacopo Mondi (3):
  media: videobuf2: WARN if !vb2_queue.buf_ops
  media: Allow drivers to overwrite vb2_queue.buf_ops
  media: rkisp1-params: Override vb2_queue.buf_ops

 .../media/common/videobuf2/videobuf2-core.c   | 12 ++++---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 34 +++++++++++--------
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 18 +++++++++-
 include/media/videobuf2-core.h                |  7 ++++
 include/media/videobuf2-v4l2.h                |  8 +++++
 5 files changed, 60 insertions(+), 19 deletions(-)

--
2.45.1



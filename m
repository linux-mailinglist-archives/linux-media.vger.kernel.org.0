Return-Path: <linux-media+bounces-16821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E3E95F41C
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CF4EB21898
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF37D1917E6;
	Mon, 26 Aug 2024 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RPleQYOc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED74618E059
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683443; cv=none; b=kuXOG1tIHpqNtPvkURcYni+Yzgo2lYclltf7RTfAPRJQeMbGmCksetBzpL3gujdXDhKQXSovwDW9Q40vZ/gaw05DSuBlTxgpH7svcCDMmcfXbzR/6pygqeOGKTdhuW+bvuePJ1EgSkfbcpknivuDagvWbGHhChAD3VRh9eH10BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683443; c=relaxed/simple;
	bh=vQlO3mY66Os0V65bNK1YqlpY0iqblqsawwRrKZDee/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c5EbVcoBInnCoqesS0huCcA3ocESII+P3ro/Qffwd7Io6IjLNwE1HoAKNh2ywkIoFbp3v4XpZJkhV6IsJKFd+ImdObRpM/mw0cyBhEMqlCAVJG2HWqDiu7XG5XUNEN8CJRHxk40WwiiNfjl45Pck3Alx62Uzciok41mqWtsBXYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RPleQYOc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-142-90.net.vodafone.it [5.90.142.90])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AA9C6CA;
	Mon, 26 Aug 2024 16:42:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724683373;
	bh=vQlO3mY66Os0V65bNK1YqlpY0iqblqsawwRrKZDee/k=;
	h=From:To:Cc:Subject:Date:From;
	b=RPleQYOc6/4UkUlBr920JBnxNhstoOZ9U5r5h/DjJyzQIl6PORknvFjRCB7zTslgd
	 emkY3vIx5rh83NZTA8JpGYOpMF2P1pg/k1miltjixFJ4tLdEtx3pUVzCcadlG6PiL9
	 MpmROdfy1Nz++eBrUP49zWRe0kMiWzJnQozItWkA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/4] media: pisp-be: Split jobs creation and scheduling
Date: Mon, 26 Aug 2024 16:43:33 +0200
Message-ID: <20240826144338.463683-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1->v2:
- Add two patches to address Laurent's comments separately
- use scoped_guard() when possible
- Add patch to fix runtime_pm imbalance

Currently the 'pispbe_schedule()' function does two things:

1) Tries to assemble a job by inspecting all the video node queues
   to make sure all the required buffers are available
2) Submit the job to the hardware

The pispbe_schedule() function is called at:

- video device start_streaming() time
- video device qbuf() time
- irq handler

As assembling a job requires inspecting all queues, it is a rather
time consuming operation which is better not run in IRQ context.

To avoid executing the time consuming job creation in interrupt
context, split the job creation and job scheduling in two distinct
operations. When a well-formed job is created, append it to the
newly introduced 'pispbe->job_queue' where it will be dequeued from
by the scheduling routine.

At start_streaming() and qbuf() time immediately try to schedule a job
if one has been created as the irq handler routine is only called when
a job has completed, and we can't solely rely on it for scheduling new
jobs.

Jacopo Mondi (4):
  media: pisp_be: Drop reference to non-existing function
  media: pisp_be: Remove config validation from schedule()
  media: pisp-be: Split jobs creation and scheduling
  media: pisp_be: Fix pm_runtime underrun in probe

 .../platform/raspberrypi/pisp_be/pisp_be.c    | 169 ++++++++++--------
 1 file changed, 92 insertions(+), 77 deletions(-)

--
2.45.2



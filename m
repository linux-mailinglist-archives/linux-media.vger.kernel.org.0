Return-Path: <linux-media+bounces-49899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 655B0CF34E1
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 12:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 298DD304DB75
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 11:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB1E331A65;
	Mon,  5 Jan 2026 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QyrRu6PV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C458A32C31B;
	Mon,  5 Jan 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612989; cv=none; b=oSS6hS0PJ4lcQMxlaJ9xhI8n0Mvrxw41R7wLxARYpiTNVIcuOyolgqP07ppV4GSMUxPUNBW+9tn9lxlVFRkd9FdIDvsVqUd5ktYg2etUy+GCiOzbu3qFzxKnhPEVeu6ifonx6DwCYrrk47LP1DCf+F6MbwkXhhHJwPCaqwOYHlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612989; c=relaxed/simple;
	bh=XR44IfZoG7E2F15OfJorFS0OEFQAHjTSH3tln9pFcJ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=arnxwQUhsgThDEGoMtn+e2afl3M6E20s1x8NZ+lLWNLRqLb2N/ox1DwZR7B9nWj6gH4tIJqsp4QVcLQLOv/JkyM95R2fnY+4laSCJZHDXC1wLHjkrOwPtjzRGw8qICQ6iwE09q7nAGKycLKpEOj/8nRieGhZkSZhrtyzhxOK4yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QyrRu6PV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:c12b:c5c7:ad08:9cf2])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0F8FB8CB;
	Mon,  5 Jan 2026 12:36:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767612965;
	bh=XR44IfZoG7E2F15OfJorFS0OEFQAHjTSH3tln9pFcJ4=;
	h=From:Subject:Date:To:Cc:From;
	b=QyrRu6PVYoQvJGDg/qYpx2qY+lBIEow7F6sLdwv02A7JVnhbKx3nOjRHHh27zwyCH
	 N7UOEAxo5dN2u/Rnj++YN3y5/MATT1L04XEDnrubGB71AGiho83GDgJwOosyEca9d/
	 sDLP9SfGPkvz49dxTojYODcGK3XBpSBf8TQgbkVM=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Subject: [PATCH 0/4] media: dw100: Dynamic vertex map updates and fixes for
 PREEMPT_RT
Date: Mon, 05 Jan 2026 12:35:52 +0100
Message-Id: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABiiW2kC/x3NywrCQAxG4VcpWftDUpl4eRVxYTuxBqUtM3UUS
 t/dweW3OWelbMkt07lZKVnx7NNYIbuG+sdtHAweq6nlVlk4ID9f7wFFIYplmr1H/Agzyh6CaAX
 dMaiGQ+z0FKhm5mR3//4Xl+u2/QCTXktUcgAAAA==
X-Change-ID: 20260105-sklug-v6-16-topic-dw100-v3-1-dev-b856657db695
To: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, Stefan Klug <stefan.klug@ideasonboard.com>
X-Mailer: b4 0.14.2

Hi all,

This series contains a few updates to the dw100 dewarper. Patches 1-2
implement V4L2 requests support and dynamic updates of the vertex map.
This enables advanced use cases like interactive pan, zoom and rotate. A
first attempt to implement the dynamic update was posted a while back in
[1] but wasn't merged due to races in the implementation. By switching
to V4L2 requests the implementation is a lot simpler now.

Patches 3-4 fix an issue on PREEMPT_RT enabled kernels. These patches
should possibly be squashed into one. I expected patch 3 to be
sufficient but during testing I hit an error condition that is worked
around in patch 4. As I don't have documentation for the hardware it is
difficult to decide on the proper fix. So feedback on that is greatly
appreciated.

Best regards,
Stefan

[1] https://lore.kernel.org/linux-media/20241022063155.506191-1-umang.jain@ideasonboard.com/

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
Stefan Klug (4):
      media: dw100: Implement V4L2 requests support
      media: dw100: Implement dynamic vertex map update
      media: dw100: Fix kernel oops with PREEMPT_RT enabled
      media: dw100: Split interrupt handler to fix timeout error

 drivers/media/platform/nxp/dw100/dw100.c | 89 ++++++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 16 deletions(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260105-sklug-v6-16-topic-dw100-v3-1-dev-b856657db695

Best regards,
-- 
Stefan Klug <stefan.klug@ideasonboard.com>



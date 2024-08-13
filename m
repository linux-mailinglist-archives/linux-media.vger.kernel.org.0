Return-Path: <linux-media+bounces-16190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763479502BC
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 314E628303A
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 10:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A62199380;
	Tue, 13 Aug 2024 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OreNwnuH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A667117085A;
	Tue, 13 Aug 2024 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723545914; cv=none; b=nfvFvpVeagICn50IXPhjFQUj9mVWjin9Q8r8McvmZpymUOqbFjqXNnq9XjQDdo5Rva0oLErbRXUuHabTS2yqOJVEiT2JewwUHr3NIdhviiaAMm1lcMpAwZUoC6zTAg7NowBnU8abPg5f+2QlOCoCyJRSpr1nVxE1bajZMHWWfLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723545914; c=relaxed/simple;
	bh=qM4dwAZs4TGXDAayWODF4A+WCfHxHEZswWYh1lS7q8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/d+QTOLxJ230R5S7LO9Npn0aAhOlKaTDtWNA/0wpFDP+JZUntjuzPT+n7TJax8iHWnByF7IMWDDjBWqPDpeGgVENYquxl/VVWHvZHxytAGVgqUkUnwm6xVNqOiNrF6RcZEvWaPEnt4HufcKuiwL1rB33GJdHRlyUrD17UfJ3Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OreNwnuH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B13D62EC;
	Tue, 13 Aug 2024 12:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723545853;
	bh=qM4dwAZs4TGXDAayWODF4A+WCfHxHEZswWYh1lS7q8g=;
	h=From:To:Cc:Subject:Date:From;
	b=OreNwnuHZzVjK/xyY4Fexauaf4oFjibkadWBTc/kMpuxHVVrNExYCdK2sUnAcN6wZ
	 xG3hPvmk0f5dor6WV8rjFTeUzW5PCgYqex7TL0DDuAgIbmyxaEta8ZHx+pfQJtZhYA
	 AaAUL8uVQIcij6eo7fbIZhZWdFwNVVXRooxTuwbs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-kernel@vger.kernel.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Michael Grzeschik <mgr@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Avichal Rakesh <arakesh@google.com>,
	linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Mark UVC gadget driver as orphan
Date: Tue, 13 Aug 2024 13:44:47 +0300
Message-ID: <20240813104447.25821-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I haven't had time to maintain the UVC gadget driver for a long while.
Dan Scally confirmed he is also in a similar -ENOTIME situation with no
short term hope of fixing that. Being listed as maintainers doesn't help
progress, so mark the driver as orphan to reflect the current state.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Dan, could you please ack this patch ?

Michael, feel free to take over if you want. You have been active on the
code base recently, so that makes you the best candidate, even if I
disagree with most of your technical decisions. I'm a bit sad to leave a
driver I cared about without trust in its future, hopefully the future
will prove I was wrong.
---
 MAINTAINERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e87e..e6df197f1a58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23819,10 +23819,8 @@ F:	drivers/media/usb/uvc/
 F:	include/uapi/linux/uvcvideo.h
 
 USB WEBCAM GADGET
-M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-M:	Daniel Scally <dan.scally@ideasonboard.com>
 L:	linux-usb@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/usb/gadget/function/*uvc*
 F:	drivers/usb/gadget/legacy/webcam.c
 F:	include/uapi/linux/usb/g_uvc.h

-- 
Regards,

Laurent Pinchart



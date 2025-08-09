Return-Path: <linux-media+bounces-39210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C629B1F66D
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4647B4E04A2
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A064F2777F1;
	Sat,  9 Aug 2025 21:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vZRHcdYY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F2254AE7
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774271; cv=none; b=drMXv4qL4SM5B+GSA9qi5Yb9ia6A19+wbfExjzAllrb4LjAJfEV/IGYRR9nAHtQwHtkaSbP/BSSq3orh7MDlQJxDLd2MHE12UUsyimxPica3Uhx9T+SWPTlE42Q8tJIKg0nrwBrF0rckhE3y/K+Yj6CSE0ZLLKI4/tLKzroxbpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774271; c=relaxed/simple;
	bh=VhPYj6BnlKp9IWLLuS0d8Nj+tVLqLOK+sL1tYZuPSrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A370vodzzXhnKxFvH8CYtEATE/HbjK+AVsPlOyKgjFXFuZBw57uK3iji9+PM5WU8aNyVVqmIQeEsY4ijM7CpLRizaihScA4N1OEkCH7N/DSpCvULwf+qYM3Q1VVSMg6+aldq2FiyTViL4gLi6S5Nd2QbSaz/Qc9JHaCsZtgF+/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vZRHcdYY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 39A5C15B5;
	Sat,  9 Aug 2025 23:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774205;
	bh=VhPYj6BnlKp9IWLLuS0d8Nj+tVLqLOK+sL1tYZuPSrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vZRHcdYY+q7MYeURCPW8EypIpy6OKCqwqfF/MBjGs6SEFUZ6i/l6nVGPDg6COaDpf
	 JGMNdZmpxmE9axTL6cv/pz1sdePbkIfYuAVCVQBpyUVvF8taSpsHChjRmASZklUtl/
	 ocuNsnhDxGinqtGbgE9I3LmpCZH1Nl2wRAF/egUw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 16/76] media: v4l2-fh: Move piece of documentation to correct function
Date: Sun, 10 Aug 2025 00:15:53 +0300
Message-ID: <20250809211654.28887-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The paragraph in the v4l2_fh_del() documentation that indicates the
function sets filp->private_data was added in the wrong place. It is
meant for v4l2_fh_open(). Move it to where it belongs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/media/v4l2-fh.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index 823fa8ebeb8f..14e7136e693f 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -101,6 +101,9 @@ void v4l2_fh_add(struct v4l2_fh *fh);
  *
  * It allocates a v4l2_fh and inits and adds it to the &struct video_device
  * associated with the file pointer.
+ *
+ * On error filp->private_data will be %NULL, otherwise it will point to
+ * the &struct v4l2_fh.
  */
 int v4l2_fh_open(struct file *filp);
 
@@ -109,9 +112,6 @@ int v4l2_fh_open(struct file *filp);
  *
  * @fh: pointer to &struct v4l2_fh
  *
- * On error filp->private_data will be %NULL, otherwise it will point to
- * the &struct v4l2_fh.
- *
  * .. note::
  *    Must be called in v4l2_file_operations->release\(\) handler if the driver
  *    uses &struct v4l2_fh.
-- 
Regards,

Laurent Pinchart



Return-Path: <linux-media+bounces-39289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A11B1F79F
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30CD83BB128
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC541A2C25;
	Sun, 10 Aug 2025 01:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MUfoJTKs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7C342065
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789510; cv=none; b=RN3e4pGp3usGzWAfrE7E+YhZVZDOoJpUa2tQGbQPvoV0euEbovb33YnGPDazR0Yb9MpCLBC6bjbdivZ9+GfnMyrRTjvvsHoTjk/FGcNRLvIQr8sAJbFkVh7JnBSQx02f1RMlTqX4csupUDBN7k+HLAlv6AVovpdoazJumA6t6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789510; c=relaxed/simple;
	bh=61t0JN0XY056moGHrQi6Ap1aKAMnc6nPr0SJj4Lkds0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5tIdFNp3CgI3u6fP46yh2dPKG/Y9qtFivv/RSFquUTlxbO1NA0huniik7E0ixj/1x595Vy2NiYJXeX6C4wLVid8994Hjs6jtdmjM9kQ8y6PL/MeQLxPgb1g3/z7Sbva9JUI5Dd1vHwFuQsCa8ZsUd4VJOSzHi4FyNXWQ4j2LqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MUfoJTKs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2891B1B3C;
	Sun, 10 Aug 2025 03:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789456;
	bh=61t0JN0XY056moGHrQi6Ap1aKAMnc6nPr0SJj4Lkds0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MUfoJTKssr8u0VJDx1Pkm/sjXir4bgShsCWgqLN8QmDentYebR3c1Tp8MijtH4AjT
	 aarZKP/UR6WldUgyxxhh0n11AaP0UQpf9cFFp3grMQnQedL9+yH6TN425LZHEwmiTH
	 JErrQNKeoKQf+rFBxAnfg4unG6bY73mbtfaET/sA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 16/76] media: v4l2-fh: Move piece of documentation to correct function
Date: Sun, 10 Aug 2025 04:29:58 +0300
Message-ID: <20250810013100.29776-17-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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



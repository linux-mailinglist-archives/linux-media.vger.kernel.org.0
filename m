Return-Path: <linux-media+bounces-21846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B68309D60F0
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 15:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 803EEB28CF3
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 14:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C371494DD;
	Fri, 22 Nov 2024 14:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT1w6Gys"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A518BE7;
	Fri, 22 Nov 2024 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732287331; cv=none; b=Z4NMZrJAKjKVW0IasFheX2b9iUJV3R+fiSn0y5WVqtVCbuwfMkmDYBStTfF4rYszcXQzBfF1s2SKjGS9DPD9d3JT1F7Emsk9Y5cOZBLow54oKXL5q4wRkcczr2woSP7kOGLc8v9x2PmYUG2po6tvtPOqY//tFL09YZCPyG47pFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732287331; c=relaxed/simple;
	bh=+S44ft8d786SjiySV8bWlVLcl+EEkcxPo3Z0bd1IgU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GzW94nGp9SCBLPPxD69/2ogo9744JALb13V2eFyExdJ3VluFkgKnD3AxKm6WZ4RQDk2Wbc50ocPs7nNkraVbJhSzDIXm5qLnCKGUEykitCGwV0VYONqo3ZItcexicB53eAEz6rRDUP3kk/JEiY67s8XAWD5gthsKWgBjryNTD58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT1w6Gys; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso19687345e9.0;
        Fri, 22 Nov 2024 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732287328; x=1732892128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kcCj1LFENTDkwVOjlHzVjf9FNNGMMUic5s6igZTbt58=;
        b=cT1w6GysEksxnoDMpmthVCCp+6mT9xSiGBnLKji0dL4Rv6hwOJiRo6a4alnVATUKxS
         eJYCGodIyNt5QoOa6eLH02DD2+CG4FZT7eG31Kgq6V/V0zmkzmt6CCuyX+ag2xxilI/q
         7nfUMSuTtBoV89YD5Cbf3rtJtCptxyAMYPjatqqvob7WMWNwOV8oK41iMLpigtFaK8Ur
         Z+I6lX0xs+sU2Lf0+go2BFOM+SUEhWcePRT4tE3M6QkuwtHbn7I2bX7wFURGlAv//aUI
         jCDXGXPNW75BrPGo5VrnXy1NcsBIaycWLjkPVWw/PvQM5LtbkcnmSWXoNF6jQjwY2oaS
         x4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732287328; x=1732892128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcCj1LFENTDkwVOjlHzVjf9FNNGMMUic5s6igZTbt58=;
        b=PYPmjNSNxHEyJmUXZYHlBsLBYOuz6gnYDekSYMekXdyVZm1Kf1h8XkKmwL0SyE3vrK
         7XleRbRnGwARAt8tQzBHAwMqhRjUw3W6XYz8KGnL19XLy7vcAUNm7m8roAMuyLl7Ojwk
         z0vkDlM/1umDU0MS0Y/PkQkii+iJ1dJ7D1y2OttnvDExL2Arzdlo/lNzRmLhTeqw3OYb
         OSAaCCLd8W2rr2OKDdGfl4wzitm5EYcerycBMH2YV9bgg0JKvftOPOjMhxbppQjtHXW0
         KFpX3BwSgcRUBdQL9Vx5hSOZnYgF/iXcMRPJiddANGVl1CWRRoY0XdAYpyNc5TgzKNtJ
         Ud6g==
X-Forwarded-Encrypted: i=1; AJvYcCU9okIiVy4VOpl65yl3lr0nVr+oQ+omUN64zS4HCx7KSrxXIl5XLYdr55+NpTFKzqqdwvt9HpcdVteomE0=@vger.kernel.org, AJvYcCWpG01clOvoiamI5fwlYfPQq94aeu7SJj3JF/35oDxPVCyP9DbQOGEi55dhhhjrICsgstk3Dp8/yTwwhlI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz93oICkcBQA+GSyZaSzGB0ZYJOBlhDl/0swkG6Oj6VK8P/9aBW
	rDpGXeyFysrEJxQkMjrYALjl5o9tt8nEj/G9hz4VOcKl7u7EC9TW
X-Gm-Gg: ASbGncv20bWzWWw7lKsBlRHP2rKNSdPzPIxY5CHjEnh5UPaT6Wid6J7agTGyEFt7buM
	2rJPe/1D83170jxvPmu3UpJ61a4wmI1mpSejfZ8TpQoNUP+Xxzocg2gp2Jozshcq7DmVGe0l+2F
	yIADVKmTGUGjw3rLwccSRzf38xAsWCOkULZvg4d15gDkNr251V0KO6NwB4GONwRPwcB/PvzZdSd
	ls4aMpLGoZme52D8B0/RrY2DjhtG6ZYJInbucedYadmb7kSvjDFEvwysnL2qBaX
X-Google-Smtp-Source: AGHT+IFBeVUVnOoLJ80v0sm1WHosA0NVoRIjsNDSw2wcgu72rxQPKjOmdWXw46ZVlVUEpQMJg2jBFg==
X-Received: by 2002:a05:600c:548b:b0:425:80d5:b8b2 with SMTP id 5b1f17b1804b1-433ce428fadmr32855075e9.16.1732287327350;
        Fri, 22 Nov 2024 06:55:27 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.131.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde05949sm29780545e9.8.2024.11.22.06.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 06:55:26 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] v4l2: mc: fix endpoint iteration
Date: Fri, 22 Nov 2024 16:55:24 +0200
Message-ID: <20241122145525.194253-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When creating links from a subdev to a sink, the current logic tries to
iterate over the endpoints of dev's fwnode.

This might not be correct when the subdev uses a different fwnode
compared to the dev's fwnode.

If, when registering, the subdev's fwnode is not set, the code inside
v4l2_async_register_subdev will set it to the dev's fwnode.

To fix this, just use the subdev's fwnode.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Fixes: 0d3c81e82da9 ("media: v4l2-mc: add v4l2_create_fwnode_links helpers")
---
 drivers/media/v4l2-core/v4l2-mc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 4bb91359e3a9a..937d358697e19 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -329,7 +329,7 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 	if (!(sink->flags & MEDIA_PAD_FL_SINK))
 		return -EINVAL;
 
-	fwnode_graph_for_each_endpoint(dev_fwnode(src_sd->dev), endpoint) {
+	fwnode_graph_for_each_endpoint(src_sd->fwnode, endpoint) {
 		struct fwnode_handle *remote_ep;
 		int src_idx, sink_idx, ret;
 		struct media_pad *src;
-- 
2.47.0



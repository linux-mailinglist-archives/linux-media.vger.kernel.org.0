Return-Path: <linux-media+bounces-26410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A984FA3C852
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 20:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FCC43A9792
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 19:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D692206B3;
	Wed, 19 Feb 2025 19:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiyYf5OL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E1721CC4F;
	Wed, 19 Feb 2025 19:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992319; cv=none; b=UH23pjN5M8UCsfgarCzw26l1JxtynlnDdN/cnlwbWr6pYhNkAncL3peLe6xkdByTUPPHNPzyKy4kgHHcD/bZ3R7fC2J0Uq9F2H4JW+siWk6mkDMvdcKVgZP6mHmU/aDE9sV9eSNW37gSBBDcXE4WBomRQdL6HooZ7n2ew5cczgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992319; c=relaxed/simple;
	bh=2qxO7sp4fQZHW4yc/WU6++oB4+ROKixIPdfhd+lJVwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPQe6ipPVsbv0cqdA3tlgSoM8tmlYktaT5ELcDbeIk5RajxF9Q10VatCt3HwDRdAnVoY04tDWMl2wFgN4Nl5RT53lQhUwuhtxBGcbFdSfO3eGW+2qi4xA+209Yk5FaMg8PAuJaf5qKfsj5hDdq2Qhckv9fFO1crzp1EupPLxgic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiyYf5OL; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb7520028bso24944466b.3;
        Wed, 19 Feb 2025 11:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992316; x=1740597116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwHvox6WJGQYQEIxf5WT1th5ef4Nf6RAE7x7WQqDiYU=;
        b=eiyYf5OLpodnL4vZr6/yLRZrvBtR31sJrG4JaLE7GDhIJonoq4J1G8jX1Bb36oV0rr
         uNQn46zsFIcjlt2Fq2xWLDZrDOxln4bYrsTSFc7XBz6D/pXV7H6tQL94hJo2ACDmHC2Y
         PSu00B37rsQUaj+cWWzq2NOjEszOOfU1HXc4tTxzWOYjF75HOXvfjI6diLurGapzOz0C
         G9TczchpWBtryExEmV94paQx06C948HM8oWXnVgXVZoKu4BePULOlYiuOfQZ+M97Hvnz
         JVhapZLMGHKRzoIzbGgCOsHaKNwVuhSlkNsNkEIfmyxmuIiHctaXnwa1T/Z8Gbm5/WUf
         eAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992316; x=1740597116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwHvox6WJGQYQEIxf5WT1th5ef4Nf6RAE7x7WQqDiYU=;
        b=AwGXjamelZXYcRckI+HLIe3SAZ31kD6/axFst0du4A3jdeMCNC1rx6XyxMsHj9tfrZ
         ZaHgIxVQvh7ORR3C0I34idxs9npvdChby2/gqvwJpCKgkFkMj75EeoNYO8AsxwHj7AvC
         XYWg1IvyJuUJ0Kp3QLk2VX2D0PlZv13RtswTdKifcDV6ohqnr5w0y1oMlTlHIAxPq73r
         B2rcwgnCqW+EcH7bDqpG+uwb3jX9xylEXZe50rTbmml8H3PvMZ0SEByFtEQk5hrrsZDf
         QIx0Zh3uQkv1jsIqclCYacj0Ae1G1F+tekmNWv7g41347gbYYjENifbk2uR2QjNWUtpx
         j2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG9IH1HujmA6aZazcmYMU71A809NOAJ6S6nGDq32W4KcBsnFh9IuNbXDrX8OQqN4Nkdpl3am2rnsNPMAU=@vger.kernel.org, AJvYcCXD+2t3AI9vxBvouV6bI71V1jUs1y218XaJ8eOaEdr7nOUxqhljz16vrzY0lHejf/J7obucPX/ooIpO6C0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvjhKe7W9P9EZ9K9idzy6492Xb5Bx9jkFeLkKn1vPqpnYU41Ok
	44NqNqIU24W5uXj4rCCGL/HTqSKcqGVHfRqxcVYAgptEZtuX1hnZ
X-Gm-Gg: ASbGnct4CX1Nw+plFxI4/wJelvP8cKa8bUg1C4QOKpHT3jjtQWiTVB2VpLj+OBcq4IP
	o4ce6Rbw22ZmH1KsgD0K3P3yo9pL+PAi0Si/WGfWDusUT8J7WXtfKbmNW3m3Dn7e4X6mVz/HE6u
	nvjrUClpy678/69QDdrnllANVi22sIuT7Dr1AU8Uz07AMcAYI/GAvcJxydh1OoE43vypHu6UD3p
	MPMglcTgPdoq8+FvYaJqQ5oCIdl4mW8lIMk9Rl6e4LcGSHS6R9FO+y/j4ykPcGu4j/J7qv5x1+l
	3daqr5fWSPqjfLoF1CrAgvFLrNj/
X-Google-Smtp-Source: AGHT+IFyOBwXGTpSYagOOpkWDMhkVuORfStvj5grnxd98RQN2N6gtL61zwIr20Bcm+RaMlN8QO+yKQ==
X-Received: by 2002:a17:907:7815:b0:ab7:d06d:b4bf with SMTP id a640c23a62f3a-abbcd059bf2mr461138366b.39.1739992315757;
        Wed, 19 Feb 2025 11:11:55 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:55 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:32 +0200
Message-ID: <20250219191136.215151-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219191136.215151-1-demonsingur@gmail.com>
References: <20250219191136.215151-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All usages of v4l2_subdev_state_xlate_streams() have been replaced with
v4l2_subdev_routing_xlate_streams(), remove it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c |  7 -------
 include/media/v4l2-subdev.h           | 14 --------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d1581f1036487..1fb413bb337a3 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2067,13 +2067,6 @@ u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_routing_xlate_streams);
 
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams)
-{
-	return v4l2_subdev_routing_xlate_streams(&state->routing, pad0, pad1, streams);
-}
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_xlate_streams);
-
 int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				 const struct v4l2_subdev_krouting *routing,
 				 enum v4l2_subdev_routing_restriction disallow)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 90d08e13e016b..3781d6d8465bd 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1604,20 +1604,6 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing,
 				      u32 pad0, u32 pad1, u64 *streams);
 
-/**
- * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
- *
- * @state: Subdevice state
- * @pad0: The first pad
- * @pad1: The second pad
- * @streams: Streams bitmask on the first pad
- *
- * This is the same as v4l2_subdev_routing_xlate_streams, but takes subdevice
- * state as parameter
- */
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams);
-
 /**
  * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
  *
-- 
2.48.1



Return-Path: <linux-media+bounces-19740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D999A0727
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0341EB252E5
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1420208D65;
	Wed, 16 Oct 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zfl9cPRA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D952071E5;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=VHqyF6ktkdunPxKKJfsGqKsv73zLnbP2lMQasHIfDcakoWuPbZzGEQ0SofQTHcSfmYhVRRtjk+WMWm10wLd1jP7gAFL/ZyNwcuvSfR/i9joX0RfzlJnKVJSmPi55/BNYFG+BRVAF2B0EEieL47NLEv7gLnjOnX+e5J6jc+VTbII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=r3DnZnXmOPL/1ov+qmgi5QK936wJgr1oE0kz+ynd/Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBGsVlUgG+TDtYq/WnJvRRE5YV4OjyiG0M6RwzB2pYEbkzb/FXjH4WYf3JL6IbZbIU73280kJqQJgdtPGgR1R0QCHzBXfIdrPrr4I3yExKziEW7Wobo4J1J8Whw1l0pSN6VAlfVVxtSLtSmOiOrw+ziQAK4aqQi2c7CFirIsIp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zfl9cPRA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D643CC4CED2;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=r3DnZnXmOPL/1ov+qmgi5QK936wJgr1oE0kz+ynd/Pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zfl9cPRAhPfLv2wztu2p7KDgxgC1zyrb0Yi1d9nhG4Ukxxgvxz8xihuf9BFqPlKzE
	 fm9Csc4XXTzWNPzAjX8r6UvXWtpKJpylLjhtm3hSP59expzEoX8piZoDxWk0zEZ6SA
	 B33JhgyVNiAw842u+fambh/l66WyI9v+orXuyXGbxyqonNoR9H15lj+cQMXpjKmZ4k
	 TJo6YeYCwEO+UoEMjTuEyr2KT/93EJG1WEUx1mDN3i1VDSmO6bYGmxgeUDLKXtInu3
	 sX32OlWqO56APgdVzciS7cSTQFlcsp82clCBp+AwA2vSWVPacjy/wZ2IrtER+55kXc
	 lg5e66drb6Qbw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004YmR-1o4r;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 01/13] media: v4l2-ctrls-api: fix error handling for v4l2_g_ctrl()
Date: Wed, 16 Oct 2024 12:22:17 +0200
Message-ID: <f7cff5c05f950ab28532f71d5ac7a4a8efed38fb.1729074076.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729074076.git.mchehab+huawei@kernel.org>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The error check logic at get_ctrl() is broken: if ptr_to_user()
fails to fill a control due to an error, no errors are returned
and v4l2_g_ctrl() returns success on a failed operation, which
may cause applications to fail.

Add an error check at get_ctrl() and ensure that it will
be returned to userspace without filling the control value if
get_ctrl() fails.

Fixes: 71c689dc2e73 ("media: v4l2-ctrls: split up into four source files")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index e5a364efd5e6..be32dccf9830 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -753,9 +753,10 @@ static int get_ctrl(struct v4l2_ctrl *ctrl, struct v4l2_ext_control *c)
 		for (i = 0; i < master->ncontrols; i++)
 			cur_to_new(master->cluster[i]);
 		ret = call_op(master, g_volatile_ctrl);
-		new_to_user(c, ctrl);
+		if (!ret)
+			ret = new_to_user(c, ctrl);
 	} else {
-		cur_to_user(c, ctrl);
+		ret = cur_to_user(c, ctrl);
 	}
 	v4l2_ctrl_unlock(master);
 	return ret;
@@ -770,7 +771,10 @@ int v4l2_g_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_control *control)
 	if (!ctrl || !ctrl->is_int)
 		return -EINVAL;
 	ret = get_ctrl(ctrl, &c);
-	control->value = c.value;
+
+	if (!ret)
+		control->value = c.value;
+
 	return ret;
 }
 EXPORT_SYMBOL(v4l2_g_ctrl);
-- 
2.47.0



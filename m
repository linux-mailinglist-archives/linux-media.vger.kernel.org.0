Return-Path: <linux-media+bounces-35611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA38AE3D91
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECDCE1644F3
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9224023C4F8;
	Mon, 23 Jun 2025 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFmaWReZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008E410E9
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676442; cv=none; b=dLDRJVTtpGEv6dDTwyLfZSTgAOqkBRABhsy9Bn/hcX8qDm/KPBnzRzD+SI5JNoOqAHEfvVtxx0nujJ8j7ohJOxfRdILJcVjf1Xi1aC3xLHmvAG7xjJdZw4wOqUyMHIM+6jvf6lKN5lCWyQl7QseeKssK5s7x7c8D3H1EGWtmPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676442; c=relaxed/simple;
	bh=Wy6DHYk6YAXM+2Nge0MX7ipdKUDNu6D0/YjWHOdKsnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g15U5tU74JVVIUQ2ly7xX3hW+dDDnF0bTS3Ee1F4Laed9EZIjtaAfi0rEeCTSOuv/WuC3wYHE7YCDHkdluzR+SHAd7iLNoEMMnYHJ8bCn2WFFUfxy8KktlMZpQNoKXXeWqgxddGGU0ei2/1OWMtdr+pVpAwujUanujxORQmRFxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFmaWReZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECD8C4CEF2;
	Mon, 23 Jun 2025 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750676441;
	bh=Wy6DHYk6YAXM+2Nge0MX7ipdKUDNu6D0/YjWHOdKsnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jFmaWReZL9IDLIATjI3FDiD+f004Bl82/YJcc91U97vKYPbLV10zpdn+msY1RmYDF
	 CKMsJdpIVlPfxwWfNByLbLJ5N6Pc+yXP0jsa9u3qq/fLu/nezGOoOF8ZfxLjUeUC2k
	 jjPooues+fia08AWfqPEXQY3+T6pXrxgGd664nxZCXByRUme5ndbSkHUEkLg07ewDr
	 P/zuuH0FScB/oWxDZ9kjbV07YWCS1JVXn5fdBe+JPBR0j5eB0oeYbHxKdl55FJLQWE
	 l5eINghxv8cKQenZAgbV6Ys1wRaezqarwHmIy9Rvw3Jt+kLsaQOAk6lxG1WJs4zZXg
	 T2n7njLM4kfLg==
From: Hans de Goede <hansg@kernel.org>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/4] media: ov5693: Improve error logging when fwnode is not found
Date: Mon, 23 Jun 2025 13:00:32 +0200
Message-ID: <20250623110035.18340-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623110035.18340-1-hansg@kernel.org>
References: <20250623110035.18340-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

The ov5693 driver waits for the endpoint fwnode to show up in case this
fwnode is created by a bridge-driver.

It does this by returning -EPROBE_DEFER, but it does not use
dev_err_probe() so no reason for deferring gets registered.

After 30 seconds the kernel logs a warning that the probe is still
deferred, which looks like this:

[   33.951709] i2c i2c-INT33BE:00: deferred probe pending: (reason unknown)

Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
deferral reason changing the error to:

deferred probe pending: waiting for fwnode graph endpoint

Also update the comment to not refer to the no longer existing cio2-bridge
code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov5693.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 46b9ce111676..485efd15257e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1222,9 +1222,14 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 	unsigned int i;
 	int ret;
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver
+	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
+	 */
 	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!endpoint)
-		return -EPROBE_DEFER; /* Could be provided by cio2-bridge */
+		return dev_err_probe(ov5693->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
 	fwnode_handle_put(endpoint);
-- 
2.49.0



Return-Path: <linux-media+bounces-29490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23727A7DB76
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 12:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638BD3AD2BB
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 10:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9034238148;
	Mon,  7 Apr 2025 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="go80UEkZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9F22206AA;
	Mon,  7 Apr 2025 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744022939; cv=none; b=cpYlzVvBcxOTYSn4x8zsC0BDzOACGvXAL6O0xI5MQqd2/9Zwd5id219hFhYGw7s6YuCxI3/7n0hQHjIiLi4ivtTwjLO4m7j/HW9uT3WYNcE75cteu+oVwm0CgzcjbpGXQIARyWowIyPhe6QQeFT8MghlrEMM95EA9sbtFM9z018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744022939; c=relaxed/simple;
	bh=aru6FQIfXm84CVtd9q10ngK8MDAfOPZu7cl1tqiA6YY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFyN0xxsGkZPrIwEdlr5VfREVq5FIwKDyC/N4m0quDhv4RZONJpBPyIyefMEocW3DKqEWuebCuIUHb8o0ER3tRAefVZnPpJUt8ZwRlrCu0eBskAfhMhPw6aqThtnKmjyITE1SwmwHWRiieAw/N5es/VIx6WIm8BqJtEFRAGkw0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=go80UEkZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACAAC4CEDD;
	Mon,  7 Apr 2025 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744022938;
	bh=aru6FQIfXm84CVtd9q10ngK8MDAfOPZu7cl1tqiA6YY=;
	h=From:To:Cc:Subject:Date:From;
	b=go80UEkZUxP35WWrXzEaA8P0xuDWkNvQigcpC7BiYe774Yij7VwTQYhcAKVDymyjl
	 v06a4XedfjsENSkkNkh2iEFFfYh1nQoL+jYfng1QkewLjAT46XB/nonU+6S1PAaTEE
	 CKVnunTZCFYxgFSpg5HytxgaxSVNhErvbDiJNArmC/Vr7JJi4aKFttP0GG/vgqLJk9
	 ukVK6d8DehRhE9J+0nJ3L38DXSEA3EKYuGjIpgjYePuazbYTcNZBgm4+W0B1oFmxfk
	 sMazPSgkLfTtwWvBrbXWB6AHnqv1foh/7du2AaZGCxY4om8eYk69ahEsTlSusuDlC5
	 rDyRedovAYl+g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u1k2K-0000000010c-2Qtj;
	Mon, 07 Apr 2025 12:49:05 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan ODonoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Depeng Shao <quic_depengs@quicinc.com>
Subject: [PATCH v2] media: qcom: camss: vfe: suppress VFE version log spam
Date: Mon,  7 Apr 2025 12:48:28 +0200
Message-ID: <20250407104828.3833-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent commit refactored the printing of the VFE hardware version, but
(without it being mentioned) also changed the log level from debug to
info.

This results in several hundred lines of repeated log spam during boot
and use, for example, on the Lenovo ThinkPad X13s:

	qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
	qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
	qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
	qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
	qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
	qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
	qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
	qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
	qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
	qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
	qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
	qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
	qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
	...

Suppress the version logging by demoting to debug level again.

Fixes: 10693fed125d ("media: qcom: camss: vfe: Move common code into vfe core")
Cc: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

Changes in v2:
 - align continuation line to open parenthesis as instructed by the
   media patchwork hooks


 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index cf0e8f5c004a..91bc0cb7781e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -428,8 +428,8 @@ u32 vfe_hw_version(struct vfe_device *vfe)
 	u32 rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
 	u32 step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
 
-	dev_info(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
-		 vfe->id, gen, rev, step);
+	dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
+		vfe->id, gen, rev, step);
 
 	return hw_version;
 }
-- 
2.49.0



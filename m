Return-Path: <linux-media+bounces-29463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FC8A7D638
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEAE41890D6D
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 07:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E437227EBB;
	Mon,  7 Apr 2025 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h52cLi1T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53C1225417;
	Mon,  7 Apr 2025 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011106; cv=none; b=KmhwXU5klZz217d2T2/2gwgP94DtmbYv432B40pBX/uKmkFpDoxWDYZeK9subIuJT+SiwWcY0IekRCjOr2ZkoxaKZcTZIQVBGeaAI87vbaRPgm9SO4u4fDtWUxBIiU0IJk0z/d+9le8FHhKlDVW/Ubw+6nA1+ZGNtuqbZvTuZjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011106; c=relaxed/simple;
	bh=qSpD2vGxbKbg4owQ67ABazcYbAaP22GKyh23tvoQmLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JdMfUokwIlLgeeoGGXOxMwlGQW84GG+EPNPCkAc1GkzKTkRJH8pzE3xgv60eH7DM7ghmMZEuLfJJ6vOj1YYPfKWJYcnGE+s+5wr8mjVlIjsLhGJQBmMX4sGyESZlEvpFgkvlvaU0oMnkszZ0WNF3ynFZDlEVzrG9SxeOFKZAdaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h52cLi1T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344D6C4CEDD;
	Mon,  7 Apr 2025 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744011106;
	bh=qSpD2vGxbKbg4owQ67ABazcYbAaP22GKyh23tvoQmLc=;
	h=From:To:Cc:Subject:Date:From;
	b=h52cLi1TbtiLbHHcEWVb38c96crPr61xnmewIP3lpOGwljFNcj8IJSEqlDvR0cF/H
	 LsaSQ2LcQ1LaSszoSkW2/BqAL5Q2woFua6eIdcM54HVz6IOJ9X8bbBcA0m32ZVRmaj
	 9aUuLB4rSTW9EsDf6ySdKJDgnrpuN/bcoLqqnoXVFwzuLTZ3nZ6zrQAXhgnEohfMKa
	 9Jw253wuy0wbp+CW7B7HHqGKQDmihMZRfDVJN4Tk5cwtmF6OVd2a2H1EXPBBaPTtWl
	 8vjrhsozpPLQ9r8sR4B2XVRMEw5lwjJvqsxMTTdFBepzptMZkRAbH6LCigMnD31LpK
	 d+9WA/4XXU/5g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u1gxT-0000000028Q-0ANf;
	Mon, 07 Apr 2025 09:31:51 +0200
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
Subject: [PATCH] media: qcom: camss: vfe: suppress VFE version log spam
Date: Mon,  7 Apr 2025 09:31:32 +0200
Message-ID: <20250407073132.8186-1-johan+linaro@kernel.org>
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

Cc: Depeng Shao <quic_depengs@quicinc.com>
Fixes: 10693fed125d ("media: qcom: camss: vfe: Move common code into vfe core")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index cf0e8f5c004a..1ed2518c7a6b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -428,7 +428,7 @@ u32 vfe_hw_version(struct vfe_device *vfe)
 	u32 rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
 	u32 step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
 
-	dev_info(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
+	dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
 		 vfe->id, gen, rev, step);
 
 	return hw_version;
-- 
2.49.0



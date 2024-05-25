Return-Path: <linux-media+bounces-11865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4018CED20
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 02:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAE4D282A0B
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 00:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5157E17BA1;
	Sat, 25 May 2024 00:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="fiTbZUbb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F75C148;
	Sat, 25 May 2024 00:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716595367; cv=none; b=FqmCXZJmjngdHKmdu6+ipWnVWpOKj6l/Pkc9q8QhXQ5GQ051I12ETNfGrqbEHSD/kVFQHAPA32O4vw4kA9pCcnGbh7tWDMy2L4594VI2+IaDuJq7TccyydyV01epunmjhziFV2A8sPaq3LQJ4srGXiBo4zCqeln4WQ2YD415c4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716595367; c=relaxed/simple;
	bh=2YqaKbGGx17M8fYC5mL2w9EgB62MUXaplTSceygTtn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aR1fAY0ZKu1uH09RHhimcoD+v9PuFNatc9j1O8YruGc1nse5x/0anq+6hv/bRMU5HmxXQHinRtKvUfhMZTZdtXqi0AS1+P2Jg0rHdpEcrOdGaKE3E7j8N6/GabTKZj3seIIJJo1twU49shw+BpMJvx9PCfJ5VOeg4ODQI1rce2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=fiTbZUbb; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=dxvZUetAiCIC18M8tRvFfOtRH138FBKR3Nc2RIdT6Bw=; b=fiTbZUbbGmW88f/n
	Av5fxmyoPAC4gamH+ipFxyhpE8qoRzLM1ab0G+5aN5qAU+xvnOk11YeP/2AuJXTHfpqWyQjXbaHAY
	OFO5uwTldVaZV+OIVE+fHrQuotR9AbOErOdLtyYWxtrM6fQHNPDvO0Te0s3NqM6oWMtlbcbLpox0r
	G405/kzB6wcbAZ3Ci429c6v4nA4UZtiQYNjCDFcOffiD6rCKaAQrAF+NafmtgOxz8icTDwJ3pm/s6
	3bYQ9/mYZygpfqc7bVsy66LfP/YuKbnRjqeBIPDvrUe1QyLloozTNbI0k5Vt9yC7I7jK2LHndBYx0
	Hj5aHYOZWxtW4/7y5w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAerp-002TKv-1d;
	Sat, 25 May 2024 00:02:34 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	digetx@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/3] meida: amphion: remove unused struct 'vpu_malone_frame_buffer'
Date: Sat, 25 May 2024 01:01:44 +0100
Message-ID: <20240525000146.282500-2-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240525000146.282500-1-linux@treblig.org>
References: <20240525000146.282500-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'vpu_malone_frame_buffer' has been unused since the original
commit 145e936380ed ("media: amphion: implement malone decoder rpc
interface").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/platform/amphion/vpu_malone.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index d3425de7bccd..4769c053c6c2 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -207,11 +207,6 @@ struct vpu_malone_dbglog_desc {
 	u32 reserved;
 };
 
-struct vpu_malone_frame_buffer {
-	u32 addr;
-	u32 size;
-};
-
 struct vpu_malone_udata {
 	u32 base;
 	u32 total_size;
-- 
2.45.1



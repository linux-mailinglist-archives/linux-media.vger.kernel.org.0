Return-Path: <linux-media+bounces-12244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4708D4C9F
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 15:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6E3CB2281A
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 13:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992341C8FDD;
	Thu, 30 May 2024 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="i6DyeWMP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7089B4D8DC;
	Thu, 30 May 2024 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717075591; cv=none; b=F96UCXsTcOImkY3ERxjY+dkTGKsMJNEblA8FGyGXU9mcEigr93K6LTSJ7DUbDZ+i0Vihj4K6/o1TzWFbg8CTdZiieg7gSH802pYOIUTT4JflRZoTyclJwH8z4+PJjGDpB8SvwDiTtEceyIjD3PgjJM/m6X7V54WAW1xK9fpksLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717075591; c=relaxed/simple;
	bh=2YqaKbGGx17M8fYC5mL2w9EgB62MUXaplTSceygTtn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khR9rArr35hSL7GrfEYFr9tI27+msPP9kn14/P3yDJsCobQXOOPCB1javEI9yJpaJQehamU2/TxdCaUII4clECpAOta2giGincmvBFiCN6LmG/Xij3j0hmdAuXW/KkY9A0cQOkiRmJDr++fZQaoQg2I5X6WHZ54Om864bSw3NfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=i6DyeWMP; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=dxvZUetAiCIC18M8tRvFfOtRH138FBKR3Nc2RIdT6Bw=; b=i6DyeWMPn7fqbhTS
	LAK+EsncXn+MGwg95oTHXpuuZyyFO4b8M1m3hq9NxSQ2I6+hj0Npw80vAq09zgLWcJ4LkE+onSBr9
	zlwlqxPoFzHF9bBkcwC56eemUUeVtlKSNZ3d8I5z7/PvCOo8Ai2h9Z+q3qiAUOMSJRgw8Ae5nz2Np
	CL4dU+buicxEvrQ7dtWpK9iVkUKiXKZc7aZ6+bIqEWgZw7joIGy8RxVpeXPm2BqSj5DI0dqy3lYP9
	8SETZ608yG3h5YdLmyBI5QTT1rcWQk8+OITn+KWgXYg5FblAcNZv09wPNr7HGfnKzGtzvlwcZT08C
	kWZv1ExbkFsg8fh4HA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sCfnT-003N3v-1b;
	Thu, 30 May 2024 13:26:24 +0000
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
Subject: [PATCH v2 1/3] media: amphion: remove unused struct 'vpu_malone_frame_buffer'
Date: Thu, 30 May 2024 14:26:17 +0100
Message-ID: <20240530132619.71103-2-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530132619.71103-1-linux@treblig.org>
References: <20240530132619.71103-1-linux@treblig.org>
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



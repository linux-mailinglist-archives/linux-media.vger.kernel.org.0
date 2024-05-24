Return-Path: <linux-media+bounces-11858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 032EC8CE8E5
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 18:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B24012811E7
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 16:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4039412FF97;
	Fri, 24 May 2024 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="pX/QxcyV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2C512E1F2;
	Fri, 24 May 2024 16:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716569358; cv=none; b=jN/+jogSgtO1Q4hMLwlow+GosJWNmTnzmBgE8tjlvGIMEYdytwM+JKU45b4knBztWj1+rWW6ocTDYmNb3TYx2A2ibTPLQZBd+w6lbjL6c6KQAGfSJXbdguyQLV7sLs3h7Zo6Wf3AghqiepBnBS7WqZrMIeJTxNduXvJkjY2bPJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716569358; c=relaxed/simple;
	bh=xyD99tgT3aw+BUIOMhiiUokw2vS+osuZnjSxhCkCcDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2SI4X14EfxZDC13vXu5PkbHlgp4SxgllPf8rGS5XkGET0g/P7nM8BjRNmPM32HpFezB4TwkfhI35Yxi+qQT5wBlAIDB8wwc3w4YSCERgr4AN3r4SywCLcMonpRgksFnCCrVSVTKWUQebpPuh8APXT68NKOWsc6uB64av+MTMr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=pX/QxcyV; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=VeOOJgMq87wNzONgWWyqOlC7t90SJ915OsvUKnI+boE=; b=pX/QxcyVwuMhdiRm
	aHKcuMfNKA4Zkj7J1kd+bU6MF7lJhNcGaia/Ejpea8kXhjlza1NPY0EcZZ1gzLO7AOSAaWKcPWZaT
	eJk99JzEh1KqlE2PHm997PN67NuH08EwQ0W8wHd6wZ+YcNJauO/aS/jRlgeSTt9lAiixOLxxPjylE
	j1+Hq2W4EX8/ooi/gr3MU5QBbPwlZubwrjPGGV+qB1XiMWb5w7Qvs1xOsEuAkRpm6je6xxDKOfWio
	e6Sal45NWw6o/3hGejAPBC0DCGPMXvbeQ+qtxf0BuqErU7WHXgwVHgqYqjDYicncTqADYKl3h6ZwP
	gSE22bTRJRRdbSZKMQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAY6R-002Qpy-23;
	Fri, 24 May 2024 16:49:12 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/4] media: i2c: dw9768: remove unused struct 'regval_list'
Date: Fri, 24 May 2024 17:48:48 +0100
Message-ID: <20240524164851.184467-2-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524164851.184467-1-linux@treblig.org>
References: <20240524164851.184467-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'regval_list' is unused since the original
commit 859891228e56 ("media: i2c: dw9768: Add DW9768 VCM driver")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/i2c/dw9768.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index daabbece8c7e..18ef2b35c9aa 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -115,11 +115,6 @@ static inline struct dw9768 *sd_to_dw9768(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct dw9768, sd);
 }
 
-struct regval_list {
-	u8 reg_num;
-	u8 value;
-};
-
 struct dw9768_aac_mode_ot_multi {
 	u32 aac_mode_enum;
 	u32 ot_multi_base100;
-- 
2.45.1



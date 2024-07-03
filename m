Return-Path: <linux-media+bounces-14583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5697A925F7C
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 14:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A16D1F25866
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 12:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F236155A30;
	Wed,  3 Jul 2024 11:59:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E440173348;
	Wed,  3 Jul 2024 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720007961; cv=none; b=ImHSVraRQcivg9VwW4M+CS4VY0THNzSEMelUsTKwmqh22de1HvIaEiWUTzkAvvG3LbF8kUuz7lXzgdXpk7LPkSB3tDm6H0pacPaV98H9nfEBpcxLOmq1fRPtmbWBX8NrkARC/Ju/Y+owuDF6xI5LOlK8qwIxCUst+dHiWqBgsP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720007961; c=relaxed/simple;
	bh=Je7wS9RpqxSacD0i2REqoriVrEW8W9Ly+p/tTqcEIE0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=MqcIsuXgechAjgM7KgQpsgTKdPEkBrp4WDlH6/OqheYEKiYH4okBGj55IFtK0V14ag/wnmN3tx3U3M2zo9QGqAOKMVDeFDYDzJsMHbv/m+BUG9FZoy9DA5rUTrLXO7FZdKbQ8YHLzVo2vIH8Iz9qOqKK9JqVu0nQ/eYQeXpD/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33501C2BD10;
	Wed,  3 Jul 2024 11:59:18 +0000 (UTC)
Message-ID: <2dea6faf-53f6-461a-809b-ec572357ad07@xs4all.nl>
Date: Wed, 3 Jul 2024 13:59:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@st.com>, Linux Stable
 <stable@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: stm32: dcmipp: correct error handling in,
 dcmipp_create_subdevs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Alain Volmat <alain.volmat@foss.st.com>

Correct error handling within the dcmipp_create_subdevs by properly
decrementing the i counter when releasing the subdevs.

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[hverkuil: correct the indices: it's [i], not [i - 1].]
---
The original patch would cause a crash due to the incorrect indices in the
statement after the while. Since 'i' can now become 0, so i - 1 would be a
negative index access, which was obviously not the intention.

I reverted the patch once I noticed this (better to hang in an infinite
loop than to crash), but I want to get a proper fix in. Rather than
waiting for that, I decided to just take the original patch from Alain, with
just the indices fixed.
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 4acc3b90d03a..7f771ea49b78 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -202,8 +202,8 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
 	return 0;

 err_init_entity:
-	while (i > 0)
-		dcmipp->pipe_cfg->ents[i - 1].release(dcmipp->entity[i - 1]);
+	while (i-- > 0)
+		dcmipp->pipe_cfg->ents[i].release(dcmipp->entity[i]);
 	return ret;
 }

-- 
2.43.0



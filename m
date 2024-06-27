Return-Path: <linux-media+bounces-14241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F991A6F5
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 14:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C7071C24147
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 12:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56E417BB0E;
	Thu, 27 Jun 2024 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=m4com.de header.i=@m4com.de header.b="omr5/TPD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgw1.m4com.de (mgw1.m4com.de [159.69.93.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EF917965E
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.93.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492696; cv=none; b=JwZyDgPOuLy0x5cT9Ajv+6SFUFIkEGHFqmkH/F43vpYmOzo0DfOVPxA/qViNIgnqYLMRDyvGcI1E8BNTZe9r6LfRODnBXqVD4NCnIU73i+nkSoVIPHImoMD3ZQP5il6qDtPFv17N9lnru6jqhNNOBrFhp/C7bW4rb0p8pcKQiVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492696; c=relaxed/simple;
	bh=aDjYpNI77riIfnSILMro15Th3tcI1PBdN2fwQWCrazk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=cyYu5t5NVr3j+GdGLhnQIRayYRM0CXFZBLQZXh76b/e6+5MWX/QpB/BzzWepa7LwPTtmZTuIenkSoLW0FYgqsdQ3kOtojD3EWzXlL6IDe6dJLWOC4n/xFdTX1WE47lJYQ9h0tEFks6VQNXQYroC0tnHJkGtRCAfDmpWmjvAfIno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m4com.de; spf=pass smtp.mailfrom=m4com.de; dkim=pass (4096-bit key) header.d=m4com.de header.i=@m4com.de header.b=omr5/TPD; arc=none smtp.client-ip=159.69.93.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m4com.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m4com.de
Received: from mgw1 (localhost.localdomain [127.0.0.1])
	by mgw1.m4com.de (Proxmox) with ESMTP id 5A2F321A0592;
	Thu, 27 Jun 2024 14:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m4com.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=m4com.de; bh=Coen/408qipH3IKVhTD3T3VPN+Jaxnj/AcZGQqJmZqE=; b=
	omr5/TPDNjTvC5u8hRlgZtp3sdX13U8YUPxnWI0k72Pa8mQFQCwUtgAaYSUoE4LL
	PRxdBqZ7Wct9ERjCJEQc9N0fh4KPI+vfBbb5FvShj864yZwKbVL8J5dJcGw7zBmJ
	i4AIiTdKMlC1vbXYLp6Dy4veGAtw/vpDw/n81u0FKaD42tt6v1uxmVCE/k8wtK0M
	wxhmaclOmFXLd4+sMjiHWIls+w+s6jniUxlQXzHKswuh9s6bKYWMq7967f4pE9DV
	veLjfUaa6t+nUj5IFus5AfgJRjuOrraoOFaOxia6U5HM5hycvlpuIhsRTBEuCTQf
	24jCV1cSc0RwpOkzPt0G9sgpeplD3gHENqGD2wAjnXPZq41KseWQ6TK6bigNNGaG
	y5ZJUWuUNwRnHEgvmPEnOwDI+EPKehfGdCnwyCzPy8pTDjRWF1/plcnDC9xzyBWC
	Sh6AVsVVmW08k7mLrr6PHjz3sfNYUr0HZRFMwqHOkyE6yQFa2zyQByxxVxvagUbd
	ALE1rHdKaHgQ9s+zh8vgKALs76vMaJyVaI5OquUUvQH2IJi5v3CZ7uVFL2QQWVRM
	r0NJt9kTfbPOTPQrasp94bGcxsr9ONR8hcZJv03oNGjIDcg9FFxNVBbJq2KNpdM1
	B5gUBJ1nxf8KdbRNM5xaGUxgLBFW8IDaLVZy2xxDORE=
Message-ID: <e304b0a8-1764-407c-81b1-3cb63eb1d820@m4com.de>
Date: Thu, 27 Jun 2024 14:51:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
From: Marko Lukat <mlukat@m4com.de>
Subject: [PATCH] media: libdvbv5: fixed DVBv3 error block count
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

__dvb_fe_get_stats() - when falling back to DVBv3 - reports DTV_STAT_CNR 
instead of DTV_STAT_ERROR_BLOCK_COUNT.

Signed-off-by: Marko Lukat <mlukat@m4com.de>
---
diff --git a/lib/libdvbv5/dvb-fe.c b/lib/libdvbv5/dvb-fe.c
index 7848fcda..4ff9eee0 100644
--- a/lib/libdvbv5/dvb-fe.c
+++ b/lib/libdvbv5/dvb-fe.c
@@ -1520,7 +1520,7 @@ dvbv3_fallback:
                 scale = FE_SCALE_NOT_AVAILABLE;
         else
                 scale = FE_SCALE_COUNTER;
-       dvb_fe_store_stats(parms, DTV_STAT_ERROR_BLOCK_COUNT, scale, 0, 
snr);
+       dvb_fe_store_stats(parms, DTV_STAT_ERROR_BLOCK_COUNT, scale, 0, 
ucb);

         if (parms->p.verbose > 1) {
                 dvb_log(_("Status: "));



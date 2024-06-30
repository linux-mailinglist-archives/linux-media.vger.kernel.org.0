Return-Path: <linux-media+bounces-14414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E491D129
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 12:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7181281DBA
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 10:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A5B13774B;
	Sun, 30 Jun 2024 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=m4com.de header.i=@m4com.de header.b="ltG2Ju36"
X-Original-To: linux-media@vger.kernel.org
Received: from mgw1.m4com.de (mgw1.m4com.de [159.69.93.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B84B132117
	for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.93.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719743548; cv=none; b=gReR82q8+sUDCuHhJQ8JZOIw/nAkek+LJoJaE3xkp3P67OrdVEH/3CfgQqraUV2Y8i7jaghSUsz4cOkhYtl6pFv20O3lMaUvyzl/jZrlFwom9d+mW720tFVFwIYhf0n2KJoKrnmbVEx3tD4vImJyCDJJWttqR2PXxTjxMYtym5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719743548; c=relaxed/simple;
	bh=qctuKGUJGZDRZY2BDq9vaJd2VTI8nfPTT4w5qpFAeb4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Le2eQ2Zq8nG0qSz/W0mQYXvKMlSVqsjlDk/Vnf69ubBC0b4v87tibCqQp65Y9eJJw99/zWEtpS7KIT7qvLFWVpkke8espONitBSk8iQypc+vghG0sf6TuzHw7AiMdnUfuPmcsKDVwn2ThNC42Q8HaFpTvnWfCgRF80a9LmwCpzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m4com.de; spf=pass smtp.mailfrom=m4com.de; dkim=pass (4096-bit key) header.d=m4com.de header.i=@m4com.de header.b=ltG2Ju36; arc=none smtp.client-ip=159.69.93.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m4com.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m4com.de
Received: from mgw1 (localhost.localdomain [127.0.0.1])
	by mgw1.m4com.de (Proxmox) with ESMTP id B71B6203B622;
	Sun, 30 Jun 2024 12:32:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m4com.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=m4com.de; bh=LEbUvZKiOOiLyTTrWnYd4ZeTElddCXHbjFfgoVAJcbo=; b=
	ltG2Ju361/2LJ3VPuKb32d7tTMnlaLe6Ke7JtU7+kZBvYBbK/l+hueiekjrS+JwL
	YTL/4eX5JpaizVL7e5vXggyhs7L6V0X3i6Dd/bfdPO8g+mKbxfzDnSf7th9DSPkm
	nMfR4oBNXwSttKiHm9b78MRRcZAsv6kxZ4qGTu6oU7X79ZBr0NEfGexMn9QNqNU0
	zmZQ1pB3QOlwDyRfSjONFJplQJKuPC7Xny8torCYmBJ6ErPopt+lBjWy/+uvOjpv
	Ifh7PDX0RMO7S5I4O2FxZR9KlsHVzqZKIRjDK76hhfV1sMrN/OB8lTMz8szfjXcU
	snZ47B3uzN6xxTOpPpKcaZuGYzsSCmmmjr5RzX8XbKutSOJARQ8Dx4BNH3Regh7y
	7R3VXWUWb5jJfb0R2CWBQRCwHjZejiB5bsshW7MgNBDqo+V4o1G6PoIB1byoeaLP
	l84W+CJG6gnggIKxV0Hba4bjkkX3n2nC03GOVuRRLjfiBsvz8hMOOy8Snht50gt6
	+yieeK/eb5dJN+WqbUxNMFICDzGNNTtP9R7HQYh17tiIDnuLktnO0lqp+pEYAul7
	jvxQSDy5l1zcesYg0K82IG5IX782v3c6ZWInvgHivENZovAc6oMlAzid3U0qNvrc
	PxPrL5WrZptvobOHpPkdzX+HT1qNH3Srm4lTnrkwOcM=
Message-ID: <5c6133b4-7c98-441d-924d-bbdf36f440f4@m4com.de>
Date: Sun, 30 Jun 2024 12:32:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org
From: Marko Lukat <mlukat@m4com.de>
Subject: [PATCH 1/1] v4l-utils: fixed DVBv3 error block count
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

_dvb_fe_get_stats() - when falling back to DVBv3 - reports DTV_STAT_CNR instead of DTV_STAT_ERROR_BLOCK_COUNT.

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
-       dvb_fe_store_stats(parms, DTV_STAT_ERROR_BLOCK_COUNT, scale, 0, snr);
+       dvb_fe_store_stats(parms, DTV_STAT_ERROR_BLOCK_COUNT, scale, 0, ucb);

        if (parms->p.verbose > 1) {
                dvb_log(_("Status: "));




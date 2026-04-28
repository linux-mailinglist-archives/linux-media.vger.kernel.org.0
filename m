Return-Path: <linux-media+bounces-59865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Dx6AGDW8GkSZQEAu9opvQ
	(envelope-from <linux-media+bounces-59865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 17:46:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 699AD48828C
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 17:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6472C3014856
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB54F3C3420;
	Tue, 28 Apr 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ/1NifX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA27E3A9638
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391189; cv=none; b=naJ0356FrLBbvwsCL3frzgAdN7n1UA7fZLsUK01jGjajMmvzPU8CDVbxNZJuBqUg22Wpb1WjnN6eoAhPagvBEDYlj3nB0ZGkqa2+sEKz2G6MEm0O4fFkHqMuGZKHxyt/i3pyubzBXn7HSDiH/EGN6agIu9WyiuSYu/vEWBtSdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391189; c=relaxed/simple;
	bh=3l8/jYpkdXsG6SyQfIwBjPSuCSBodHOhQRlhk1OXomI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2cj05WnsC8liHnh70QAIVaUNLWg3ALXSEQLh9FN1xH6570/ZIKHLw6MxSFknEx5JFZ0g45tLCqDeF8hQYzYK50P5Va5Gih0mEoSFsoyHISTlA9lzTYJEsiI/YgS1GK6YH+SWV5tziEpiqfdFerDtkk6jCmOWY9oXKcNfMnMYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQ/1NifX; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6948b5b1c53so5283428eaf.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777391187; x=1777995987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k9WYxtMVhrcTFANW9nJ4oPBcCFr6W4sm1HRZsTUDwQ8=;
        b=YQ/1NifXnKX9yYa8C++SynfY1Nc8m4i7AYYpWVjCisCva3JEoi4K7KKrQfBrcLbkdd
         UtvxSNMd8D0w8Hkdb+uOpb/cVp3I2IqbYt1I3RSk+iZBdZyw03PubgZI5yEZlV4LVAEZ
         ZT2CglgU/PpczihWir8Fm6aDEDJdTz7lsV2MTvgC/IBpRI911zle42bRJtkXs6uOS/ln
         8Rv2/paXIr+pHEvY13HdKw9TztMNGGseywWzZrcQNi6oMtCQ0npj0+6ecGgS+IG5r/03
         1908YbEjeSxqatfxuLTi8hBoiT+u/tPjbZoAEaOOeVbgYnuVibz0zosHXtYfFOSfxngG
         /vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777391187; x=1777995987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9WYxtMVhrcTFANW9nJ4oPBcCFr6W4sm1HRZsTUDwQ8=;
        b=hXuzqKC3ENLZS2p7aCb54kmQ5NojBffdjEiEseuFlxBzKVZrglpbvX8jDOfkFiHVSu
         XVSK66s5lT0lrryXmsPiJ5ZnB9GlAW4K2pYRpnvInYoblh5Rn0plM1Yc6mSl84GLI1PZ
         e0JV9IfxbpbcgUDQGHvsYiUtGumkJhPPcpL4oVLOkKHtfWO/WTQaHxOdYB4GSBsNHwTJ
         Aoo/gv0+dRJqcsbKLTr3kSYw5cz0JNmqXhVjdw9MPVVBU/ICaHN7PGaR80smtfdw+wyc
         lTaIPiGD8S6ywq9+zBHgBs/S5tk+g5UinjwZQbz8J8SE9hHbX5UxB5MRMKFrydKx5Wek
         y2vA==
X-Gm-Message-State: AOJu0YyhlvoEr44B0WPS3IfKM/I1Zbgf13R42USkGqgt0PJczAT9cVSa
	hXeCEtqUZpY8bu04j9MSpZxcvqHiFCkWu1ElAcLJvsqBrc3gIUijPOU=
X-Gm-Gg: AeBDiev6i+Ihts6V6qzQlpejQ+6LgCIqL3VwRoU6RDGKzLA10yh9azXwPrToLA5iK5z
	KzPbMmE8Tqenn6vOF03bH3VGJ0ak55vFG/wlUrL+JpqMnsf/btlejn0I6LxGpIPdxi1LwRAdKs6
	uc/mgnJQsn5aHALGySO2np4OT96Iiat9t82C8mZBswF49u1+l19uIn5aJa6Ocs6jZf9BzCFTD/k
	8bdZEMM2jhlWXztoGPthJcBsgw7NMjwZuz8Ail/bCU1IS390whOqUH7LN2YHRVtr7YNNA2OMiok
	XAlI/Ba6HzPYY5MN/XUpLDkrAcd/t2tfQ9NSXb4tDcjESL8Ng2VECSap2L2MaoNJOQdZdYW5xuC
	VR3yIRgSZnqClGO1CTHN2LMHDTL+K1EVCSQGCaDcOFLuNu1ysUnCGJh81vw7Vc/16YvPLn5ZVeM
	dvmEYUpdo2ekQ2gl55IgoTvm8flTIlLDTaO7cEwmSgSR2vAUMb9I66vl29Wf6OaSoEqIIByhgN1
	/5Jet5Fd3ZhYlX8Xnfd8rmkO5s=
X-Received: by 2002:a05:6820:612:b0:694:9e64:6785 with SMTP id 006d021491bc7-6965ca7355fmr2030129eaf.21.1777391186824;
        Tue, 28 Apr 2026 08:46:26 -0700 (PDT)
Received: from MSI.hitronhub.home (24-40-252-177.fidnet.com. [24.40.252.177])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6965ba3686bsm1710931eaf.9.2026.04.28.08.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:46:26 -0700 (PDT)
From: Mhanna112-code <marchanna111@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Mhanna112-code <marchanna111@gmail.com>
Subject: [PATCH] staging: tegra-video: Fix function argument alignment
Date: Tue, 28 Apr 2026 10:40:22 -0500
Message-ID: <20260428154022.6997-1-marchanna111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 699AD48828C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,nvidia.com,bootlin.com,linuxfoundation.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-59865-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marchanna111@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Separate long function calls into multiple lines to comply with kernel formatting style.

This fixes the following checkpatch warnings:

CHECK: Alignment should match open parenthesis

Signed-off-by: Marc Hanna <marchanna111@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..eb1fc5b7e2cd 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -552,7 +552,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1),
+				 base + chan->start_offset);
 		break;
 	/* RAW8 */
 	case V4L2_PIX_FMT_SRGGB8:
@@ -565,7 +566,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SBGGR10:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2),
+				 base + chan->start_offset);
 		break;
 	}
 }
-- 
2.43.0



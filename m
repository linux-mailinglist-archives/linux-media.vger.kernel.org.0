Return-Path: <linux-media+bounces-55551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CME2KLkxs2ntSwAAu9opvQ
	(envelope-from <linux-media+bounces-55551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:35:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A921427A13D
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83A7C302C151
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C217A3E6DCC;
	Thu, 12 Mar 2026 21:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="qUyggHjo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01081389DED
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351345; cv=none; b=oe/Xd29aY61tehiBGYrj593heEgui3EHM6ypDqlY9DyPDKokMuFTnk0jHv3gD1r9x4pOqSnRIRyWXExDy52MfwnR78oJQ/9YY2RtCg3nvb2rltjId5cggN+BzW3r1SD5TeKUlkYSMRKHaq7sWzg8Xml+AN+NMZ8JCmHJHLF4R9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351345; c=relaxed/simple;
	bh=3katCCU5BugUNLf+dSkuK3KaaDTXoADVb6Ih96vYJIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OSxYI+bUgcDpHAypRpXGW0NrTq3pSmATm8eurQ7VKv1QF3VuA71sOcLkwTenWNNb/EGZkFwYnCzoNf3LwFMBW7QJpIUSQtnKpja6rH/AG733/S9w4AyPwJowc42dWu+bIA6QK5YIn8N9/YNy1lxiMAJ/+GrOhSnHqtKlAqP1hdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=qUyggHjo; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-46708149af2so897990b6e.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351343; x=1773956143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwj/G6rb/3H8RUwXrMjzLTFIftHlLu6Jqj/Yz9uokvA=;
        b=qUyggHjo0IX2AgbbLb9ihf/94kFp8YUyUAbga4UfB0cSgbxELmnhf+2WmAJ4il4Z+P
         2+u6+7dG38m8hcVSVjH97tHjL9yNNcDrR64ru4r+h0lYiwLwHt25MZ7C/R0tDM4qwyhM
         dj7pBxL0ed2NtyvjlsLGVMrL2dOXYFhj/dHQhnWihmqvvuGmwDCIgQGjtwDbJ3OAUNpc
         u3SwLDLIIU2q+wXsVDLQrHa1Ilc+56V+eMLluo/FCTAB+A/K6fzR01ibmklgswlxxe80
         aqwlkr+G9lGW+SE/67oDkM6UlBUvxrlHv+hm+cwOPgOGXc1c6BbndvirmplCVV0TeDoH
         gZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773351343; x=1773956143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fwj/G6rb/3H8RUwXrMjzLTFIftHlLu6Jqj/Yz9uokvA=;
        b=TjuLwZwgOXgH+4qXEqpp4QW6OCusXeEzym7e+oEhC3qLOKsKUujQCaEG8XZhFZOq4T
         RIoG4B4QPxMREkjaFW0PJvUDa//H1aK/6Hbex0iuYhMz/Pw3tKtSJQklZE8Dh1gMfwRW
         tK1C8L2of///Q3INl8TLPB9kvRRc/tVrYESoHCuiacIcA+28POMiyAi1+MKTNazvzfXm
         Dl/oZrVc+ZZUx8gO9FD1jH6Ie64foP1RAUW6orpFTZkkCQVDUaqlwvUiWSEpoXpl73Pf
         b6oc+qYcpZd0oH/BPKH6Ax2pTX3rZlOjUnL6AK5WxaYhNQAsOLq0nzbnyKa3zpvkG9lx
         6EGQ==
X-Gm-Message-State: AOJu0YxKVAzosFQuUScz+3MBA+RiqZVjm0f9woinFgqFjGhwk1omVwTs
	+c1Ln/8Kx1EAhHqzPwA1PgN2G3mai03rQZoVmoaqcTTSgVlU0BkcP0tkCRl8f5+uz3nH6lHjbga
	yphuF1jI=
X-Gm-Gg: ATEYQzxceaYLpWqfG6J32EAZvDg2rAU8Uz4xaMCm7ZsHOH/ZOD1L/NCgDKU1Ip/X9tg
	MRa/V8FVeLGM2MnBPNHs1j8/R2JtKdc6FLmO5TzwMPoWK/6TaSRYIO9bLCG9xpwwLuV+CpZK+hv
	/zWL/7UGjZTmqYayZfc5Ol0lXchQVdlRT/3DreCTozd/adK3y0u0UOBFv/jY6rRuuD622EPir2E
	4Xku8EwldUM3jJxjy6MhtF4i/mcUL+suG2eaIju0ToDWsEf4mhl6kI7gEjLuDaWl5Xhg/nJDunE
	I0Lov8z/Dtp3zXV4HVjBIo9A7uDsXvNME+orHuSWLEE8DthHkZbhlJm3h6kPZYDBlufNRfuhIPK
	I8uQ6btqkmmJROMPE5GN1ov0lXF6Y5tSaJoPuYhStf5hwSCoyZp1GPwCtcS6Wo9AeXV0PObmFDh
	4y8OYn52DHSYCtJayV2XdG49SjLJKc2ZLF41SSqkncG05a0ih58jcsKtNuKnVEf3xD3286FIpAd
	3U41CfZNPom/qinOrTy+IIKabW7fg==
X-Received: by 2002:a05:6808:130c:b0:45f:16d1:8f5c with SMTP id 5614622812f47-467570f32f3mr482455b6e.28.1773351342922;
        Thu, 12 Mar 2026 14:35:42 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:42 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 11/11] em28xx: remove tuner type from Hauppauge DVB DualHD
Date: Thu, 12 Mar 2026 16:35:32 -0500
Message-Id: <20260312213532.2907276-12-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55551-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A921427A13D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This reverts a patch which was perhaps inadvertently added.

This was changed during the 5.15-rc4 merge. The faulty commit appears
lost in the pull request somehow, I cannot find it to check the
explanation.

commit c52e7b855b33 ("Merge tag 'v5.15-rc4' into media_tree")

There was nothing wrong with this device and no reason to moodify the
board profile. The DVB capabilities are added via dvb_module_probe.
Additionally, the device contains *zero* analog inputs, so I'm not
sure why one was added.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 2d19f8ecd685..d7075ebabceb 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2522,17 +2522,12 @@ const struct em28xx_board em28xx_boards[] = {
 		.def_i2c_bus   = 1,
 		.i2c_speed     = EM28XX_I2C_CLK_WAIT_ENABLE |
 				 EM28XX_I2C_FREQ_400_KHZ,
-		.tuner_type    = TUNER_SI2157,
+		.tuner_type    = TUNER_ABSENT,
 		.tuner_gpio    = hauppauge_dualhd_dvb,
 		.has_dvb       = 1,
 		.has_dual_ts   = 1,
 		.ir_codes      = RC_MAP_HAUPPAUGE,
 		.leds          = hauppauge_dualhd_leds,
-		.input         = { {
-			.type     = EM28XX_VMUX_COMPOSITE,
-			.vmux     = TVP5150_COMPOSITE1,
-			.amux     = EM28XX_AMUX_LINE_IN,
-		} },
 	},
 	/*
 	 * 2040:026d Hauppauge WinTV-dualHD (model 01595 - ATSC/QAM) Isoc.
-- 
2.35.1



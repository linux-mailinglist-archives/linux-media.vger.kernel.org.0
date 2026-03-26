Return-Path: <linux-media+bounces-57170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H4uKSdqxWl1+AQAu9opvQ
	(envelope-from <linux-media+bounces-57170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 18:17:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7F3390B3
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 18:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DE91300F18F
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 17:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E7D421F0C;
	Thu, 26 Mar 2026 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="NJbLpGyF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB03BC66C
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545034; cv=none; b=qruzJRW7xWIkCZr6HC4gS5UI0EiU27MsW66x2oezKpGsvGn1KhTE7E6Q5OcuFw+Z8o/2CliADshnYIy1Ls06pgCRGQK7UkJHi66psX0aOZ1rguK2/svQKH6n2biuLe9pTjuR3meTx5NDFHSFZdhmxIhlfDbQ1HPLS8LPyVX3kk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545034; c=relaxed/simple;
	bh=PWeQDbGZItRTqBeCAOHbrQUmh0b+gjI4xEYLq2SDusA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sy/Tw6cXe6WscmWy+DQP5Zp3gDIRfLuSObloMFLIMqfBHCdrDPDL3efp2BnPSi9tfj+Am78825V0up/KiZp1o6CLhgjkMKlFBlZGy85J258iGeagT6vk2Mrxf8Jg5wqgxQXCwD/Mh5IIDcrrJcZN1pgMKNeGhLmQ4XCs/QI7D1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=NJbLpGyF; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79ab5fd969aso14119557b3.0
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1774545030; x=1775149830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHbkqSz9YJx2oSHnD+0e+6vqjOdh/v+Rb7cIlN1SS04=;
        b=NJbLpGyFDNrGka0UR58LQT3VNVrtbZ9k6t5opcyiQNenv1CY2Xvwvc+0N6mKNAnwj6
         xJr8ik/AHVQuG+z3uJ5TbfqvEmAawOF56HOg71nuN2mHjo+o/OmQL4BarhJxfqxxMJmh
         BrAb/EGm8zfnAsh078JT2ZhC9J0a/YI3L7Ed0kTI0BUmiRr+NtW2J3uPIsCnjC6E6RQH
         CzPQXFP8AmCKiMsU3dzFrKaAN97mKcScsNsRGnNUqxd0a1GQ72zA0HPztkmGh7xV6uTA
         hYRxL5Se5ubhEXN6g6JciIyotfzMGPob3b2KIIb4IZJvcdrKIrpW+YxW9xTRmvZ5evvR
         ST0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545030; x=1775149830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHbkqSz9YJx2oSHnD+0e+6vqjOdh/v+Rb7cIlN1SS04=;
        b=X5+Z6WF/adj1ON8TUqB084kWZZ/qed6Jlq4Z3huf5LOAhLvmzEZl4pv3VXH80yq9d/
         IFQAZUwKSW7AynT2WGgPfvYtClwKHzlXF66VRcmrrXKEyEsH8twNX0g/GAqFWBhGQQkF
         z2yL5dxNlVoeYuMs6/cHP9lLebMP6JdEiRP+GFmiah8E4+5ej+dw+ro6HN+H7wPrtsEl
         O++7UqQvF+7bUdpYzrZE89icMxMo8rcpAXEld2EXZ4IP+D3AUUy1IRePBgE3MFfr37WA
         Mxuxf35bfpB7CNgD/63bkQsfPvAvxtgF+BmlV08SX+jYhVpDmMstEjFQz0kEdrk/I5F+
         nSxg==
X-Gm-Message-State: AOJu0Ywz61QnTt/m1jMfE/AzrkrofoSDI2XQNX1oyR1Auv783LuGnRJm
	gqygHK2rp7kkl2/lim0udM9BfwIMi47anexpzuOpuD95mo/d0YSQ1ElkWLAf72NlTOiBaIU2x+9
	A1qUWZhk=
X-Gm-Gg: ATEYQzw2JsTuPbl/lCQaQPdLVplwA/S0AGM4fKzJjM7UkUJ9xCfQyO/b/LMJDextafC
	iSBCdv2UJdp8BCVt95h5oFEefRx7wm4Lz3bd2GlccZH7vOnoGgQcZC2FU7Yf3Ilp8kCpNM4lwYH
	EnVTtocN971m9NNFMP6HSF7jtt+wp/KG+VgCmKRpU2yR3EgfzY9x1uXgOrMVdHshkEV7plKmpEn
	vOUYvFYwvejY4lXWzF0gqJL9XvdtG3NdijPA6En06P2d9RJorGlAwjWqhJ2N8x5Slegr2FzTRsx
	PfqnQBwCjvt0smbRH1Xo+xG4Kwmxa9u1Ku1jFOXZ71ly35N0sT+USt+zMHUEyOV7uQUxcrNv028
	zmzlFvGzpyhI2vfWQwxo8YwC2+jENfKJcV3V2ZgwjTcriuiXhkDvNMcqUK8A3tjuCPxDNnBFNsx
	59rm2V4CLbixEu7sk6Sfk/imHErPIvHqxc6MF98nNGHbi/YKpJ9oN5ISBIGaYRHSv1F4vwVt0hc
	7evadCK/k4UMXRJgqc=
X-Received: by 2002:a05:690c:6e84:b0:79b:d341:56f7 with SMTP id 00721157ae682-79bd3415b96mr21019967b3.20.1774545030334;
        Thu, 26 Mar 2026 10:10:30 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79b1e43b825sm16567247b3.47.2026.03.26.10.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:10:29 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH] Revert "media: cx231xx: add USB ID 2040:8360 for Hauppauge WinTV-HVR-935"
Date: Thu, 26 Mar 2026 12:10:23 -0500
Message-Id: <20260326171023.3404209-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57170-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAD7F3390B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This reverts commit bb2a3912549d3b5cef5ed27200402fe8f6fb0694.

The USB ID 2040:8360 was reported as a new revision
of Hauppauge HVR-935 and requested to be added to
the cx231xx driver. The issue is current generation
of Hauppauge 9x5 devices including 935, 955, and 975
have moved to em2828x usb bridge. Support for the
em2828x usb bridge and USB ID's for the new devices
has been submitted.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index 8bf2ab9c2e8e..b75535d6abaf 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1027,8 +1027,6 @@ struct usb_device_id cx231xx_id_table[] = {
 	 .driver_info = CX231XX_BOARD_HAUPPAUGE_955Q},
 	{USB_DEVICE(0x2040, 0xb151),
 	 .driver_info = CX231XX_BOARD_HAUPPAUGE_935C},
-	{USB_DEVICE(0x2040, 0x8360),
-	 .driver_info = CX231XX_BOARD_HAUPPAUGE_935C},
 	{USB_DEVICE(0x2040, 0xb150),
 	 .driver_info = CX231XX_BOARD_HAUPPAUGE_975},
 	{USB_DEVICE(0x2040, 0xb130),
-- 
2.35.1



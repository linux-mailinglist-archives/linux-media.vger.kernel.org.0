Return-Path: <linux-media+bounces-9955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 634C58AF588
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 19:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0A5284D36
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 17:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49EC13DDCD;
	Tue, 23 Apr 2024 17:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="pqr3qG6K";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="HZ1sPqox"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FBE13CA85
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 17:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713893547; cv=none; b=uof6cWT8karo+MraPPFE9JoEv85l99ILkZZz2ObUH+eQhEO3sUmReeOuKaAcTA5QP4tuvDFKM8HtwJke1gEANAt/8nMWiycjQlgvuOwDfHtHZ4XirKhMImGQDtmqzQJI37JQPEe/ptZ/3ig7dJLqdsp6SXzNCu6zFuk6YHkat70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713893547; c=relaxed/simple;
	bh=HUFW+8e0MxY3GQ8U7gt9X8+SK3ZLkDG+Cx599bGJGMw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMbstcB+Lwx6Lpiuup4X9oJFU6jAf+oeXqMtuIQ3Ez8e21WuYoLQ43HtpYHU2AG7uCj0kqnFWXyD2zyFdg/BG7g5HHNjAQHOjBQAF2ifqvC5bd+7XS3VaTxbORiAqJ6tyX2NmRlOmphEmvVPt4V03pyJtd5s1N/NXDNhsTFdp+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=pqr3qG6K; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=HZ1sPqox; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1713893536; bh=HUFW+8e0MxY3GQ8U7gt9X8+SK3ZLkDG+Cx599bGJGMw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pqr3qG6KAlrEDbkRqn7jqDNhqyp+9pwSIFAxOiQ+hqU3pgzMJZtGNzW2UwQwhip2p
	 wNClQQ1XaxHv5ZkQFPQQyh5xXiBFz+NEVpJ2TJ64PfywfZNJCBjE19Qf7j9y57bLSh
	 C0i7nXqIlwXPozd9CVfCl9Cx76pBmORhOsSWQG1m0yVQrSzjvYomJ1+ltamoviToya
	 231KJe2+SKrI2Li6RqCzmduY06XF7ULC5w2d6bu6M2cFFMwC1OVhV6tO+DLzYqVL+i
	 zoKKPEbXJOmFN8AJrguaKpscRA3kNxNqTUHiYVs/xzQT4A0u3Uy3EoRL89YU22PtAF
	 2czMMwnWi7ygQ==
Received: by gofer.mess.org (Postfix, from userid 501)
	id AD1BB1009EB; Tue, 23 Apr 2024 18:32:16 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1713893535; bh=HUFW+8e0MxY3GQ8U7gt9X8+SK3ZLkDG+Cx599bGJGMw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HZ1sPqoxImv2186B+sD2PBnKQi4DweW2OhZ1kUENQYcElVIK0IhuSuLfNBdUh5y5P
	 ObbEvTUjW1AgAjAgh34OpBv4a1Jm0QMJ3hb8BCMmirqLFiVRaBZiSPL9tBo6v/5d9b
	 JoyRR38wd7EDpX50oJGY0NAv4A5v0/YkF9Tah/x4UYQGGhvh03pzVQ/mzyvx6Vy3Fp
	 4gjQ58L85Y/+cP2xNkJZPAykWq3dgJeZ/w2/wPTPSraLVyWI8e1F98Hft7RR/+sYER
	 +0uBqCB1fu9kg8vSfMvTlUcVROC9xPS6jYzP5EWcpAEChpZTeScJom2Ra7n9FQ//0u
	 fWZjCdQ6IkUeg==
Received: from localhost.localdomain (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id E7DF91000FF
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 18:32:15 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils 2/2] ir-ctl: fix encoding pulse_length bpf encoder
Date: Tue, 23 Apr 2024 18:31:55 +0100
Message-ID: <20240423173155.46009-2-sean@mess.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423173155.46009-1-sean@mess.org>
References: <20240423173155.46009-1-sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Transmitting pulse_length is broken and never worked. The most common
user of this protocol is Sony, which already has its own encoder.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/bpf_encoder.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/utils/ir-ctl/bpf_encoder.c b/utils/ir-ctl/bpf_encoder.c
index 886f046f..2bc7b541 100644
--- a/utils/ir-ctl/bpf_encoder.c
+++ b/utils/ir-ctl/bpf_encoder.c
@@ -61,24 +61,25 @@ static void encode_pulse_length(struct keymap *map, uint32_t scancode, int *buf,
 	if (keymap_param(map, "reverse", 0)) {
 		for (i = 0; i < bits; i++) {
 			if (scancode & (1 << i))
-				buf[len++] = keymap_param(map, "bit_1_space", 1625);
+				buf[len++] = keymap_param(map, "bit_1_pulse", 1625);
 			else
-				buf[len++] = keymap_param(map, "bit_0_space", 375);
+				buf[len++] = keymap_param(map, "bit_0_pulse", 375);
 
-			buf[len++] = keymap_param(map, "bit_pulse", 625);
+			buf[len++] = keymap_param(map, "bit_space", 625);
 		}
 	} else {
 		for (i = bits - 1; i >= 0; i--) {
 			if (scancode & (1 << i))
-				buf[len++] = keymap_param(map, "bit_1_space", 1625);
+				buf[len++] = keymap_param(map, "bit_1_pulse", 1625);
 			else
-				buf[len++] = keymap_param(map, "bit_0_space", 375);
+				buf[len++] = keymap_param(map, "bit_0_pulse", 375);
 
-			buf[len++] = keymap_param(map, "bit_pulse", 625);
+			buf[len++] = keymap_param(map, "bit_space", 625);
 		}
 	}
 
-	*length = len;
+	/* drop trailing space */
+	*length = len - 1;
 }
 
 static void manchester_advance_space(int *buf, int *len, unsigned length)
@@ -121,8 +122,8 @@ static void encode_manchester(struct keymap *map, uint32_t scancode, int *buf, i
 		}
 	}
 
-	/* drop any trailing pulse */
-        *length = (len % 2) ? len : len + 1;
+	/* drop any trailing space */
+	*length = (len % 2) ? len : len + 1;
 }
 
 bool encode_bpf_protocol(struct keymap *map, uint32_t scancode, int *buf, int *length)
-- 
2.44.0



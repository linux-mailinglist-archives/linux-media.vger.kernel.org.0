Return-Path: <linux-media+bounces-9860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945878ACB1B
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 12:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50FC7281F1C
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 10:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C77F14E2F2;
	Mon, 22 Apr 2024 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="avIyCtre";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="P0DHtJT0"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6C7145FF0
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782512; cv=none; b=h2HVSiD3FZ46IkrY+lVw3NhYJcEbt7ZPXiNgTmQfTbxfMTyFHSC87SZB+EZvHlo1p1qEjf9XQiY4aUf1AMk7L9jQxxVatMSoGz6jYSb/Ys60007HKVj+oXVWEmu3tlEygv5m6eadUlQLL1TgqHVb9VkQn/YGsv4BAE6lfSkduak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782512; c=relaxed/simple;
	bh=lDpmYXtUMVI8m0AGrz5vlzLt9IBrvkBNEv2OM8xTfJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPE8c7MeBpbqok7IuLpCRySIOxwqSNhOHiT9eMzuXzvLN58OvlNiha4K91gqmcVVIdRwjciSjkmdHt4PrLJuHEvbUFEwVkWQugHL3PAwt3w4D+7CcdjWcI99tdArunAb9jnhnCiYrGqmzmcljEEWihlu28G2LNuZpe1sX6qz2Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=avIyCtre; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=P0DHtJT0; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1713782509; bh=lDpmYXtUMVI8m0AGrz5vlzLt9IBrvkBNEv2OM8xTfJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=avIyCtretZN05tlCaLuxEv5q1V3NhVcJ9LBCg/bPUcywzssfRV1+Fy6Mb6eI389Hm
	 3HppjFRlJPvJ30jTZJwyzO6EGHJbJ/9jdepBp34dBV51y86+UvN2Z+ED+Pe0KUhMh9
	 gBnw2G8n2UAG6Nw8BH8Uo8NYSHmoOd0xuglHMED10qFJ30lu/nbbl93pbcmC0xJi+x
	 qgN5OXDfUGKW+dH4DVlprBU9S9trZjKRyp+LYJdKj3oQ+BQ3WVMuGcQUKUsN31oHqi
	 qLoyncOrzD+m0N1vYQn0GmJ4j5fvD4b6du0UPtJEYEIiCajz6zk5k3URks2X8P+zrw
	 WAyQcP1RISW1Q==
Received: by gofer.mess.org (Postfix, from userid 501)
	id 6A4D51000C2; Mon, 22 Apr 2024 11:41:49 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1713782507; bh=lDpmYXtUMVI8m0AGrz5vlzLt9IBrvkBNEv2OM8xTfJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0DHtJT0/j5Jdz6SoFmx80m4nKAWTCe2BRIeGJBAlmtv0pBhqNmps2gF0tz+Rz8e7
	 8HHfcT79zUQ9LlcIN19Kv4zryq4mTnYELyjUSwKZuhaX2dYqVyhRxu1DLgWkc6/4SZ
	 0LEuEJYXskaKzSue95WbE6aTh5NIZMXHiiCH2wXpruMV6IS2p8gwZNweKVYHmJhhQV
	 mNHobrBCBQtLw0pYao4NurjCQaxQ3FRCCPdlEaVGvkqnXhvcomUwWA7E4jqM9rFJmd
	 NKypKoZe8Xe/SCRzTHVJwiHM98jUgq6CoYuUPS/tCnud9z5V8r/TNTx5kz/2cgxwrr
	 vc3UB9s5x/14w==
Received: from bigcore.mess.org (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id 4909F1000FF;
	Mon, 22 Apr 2024 11:41:47 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Vince Ricosti <vricosti@outlook.com>,
	Sean Young <sean@mess.org>
Subject: [PATCH v4l-utils 2/2] keytable: fix stdout/stderr inconsistency
Date: Mon, 22 Apr 2024 11:41:38 +0100
Message-ID: <20240422104138.20535-2-sean@mess.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422104138.20535-1-sean@mess.org>
References: <20240422104138.20535-1-sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vince Ricosti <vricosti@outlook.com>

This patch fix the keytable inconsistency about stdout/stderr.

Signed-off-by: Vince Ricosti <vricosti@outlook.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/keytable.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 9f7575d6..dac99f5e 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -1714,7 +1714,7 @@ static int set_rate(int fd, unsigned int delay, unsigned int period)
 		return -1;
 	}
 
-	printf(_("Changed Repeat delay to %d ms and repeat period to %d ms\n"), delay, period);
+	fprintf(stderr, _("Changed Repeat delay to %d ms and repeat period to %d ms\n"), delay, period);
 	return 0;
 }
 
@@ -1728,7 +1728,7 @@ static int get_rate(int fd, unsigned int *delay, unsigned int *period)
 	}
 	*delay = rep[0];
 	*period = rep[1];
-	printf(_("Repeat delay: %d ms, repeat period: %d ms\n"), *delay, *period);
+	fprintf(stderr, _("Repeat delay: %d ms, repeat period: %d ms\n"), *delay, *period);
 	return 0;
 }
 
@@ -1736,7 +1736,7 @@ static void show_evdev_attribs(int fd)
 {
 	unsigned int delay, period;
 
-	printf("\t");
+	fprintf(stderr, "\t");
 	get_rate(fd, &delay, &period);
 }
 
@@ -1839,10 +1839,10 @@ static void show_bpf(const char *lirc_name)
 		goto error;
 	}
 
-	printf(_("\tAttached BPF protocols: "));
+	fprintf(stderr, _("\tAttached BPF protocols: "));
 	for (i=0; i<count; i++) {
 		if (i)
-			printf(" ");
+			fprintf(stderr, " ");
 		prog_fd = bpf_prog_get_fd_by_id(prog_ids[i]);
 		if (prog_fd != -1) {
 			struct bpf_prog_info info = {};
@@ -1851,16 +1851,16 @@ static void show_bpf(const char *lirc_name)
 			ret = bpf_obj_get_info_by_fd(prog_fd, &info, &info_len);
 			close(prog_fd);
 			if (!ret && info.name[0]) {
-				printf("%s", info.name);
+				fprintf(stderr, "%s", info.name);
 				continue;
 			}
 		}
-		printf("%d", prog_ids[i]);
+		fprintf(stderr, "%d", prog_ids[i]);
 	}
-	printf(_("\n"));
+	fprintf(stderr, _("\n"));
 	return;
 error:
-	printf(_("\tAttached BPF protocols: %m\n"));
+	fprintf(stderr, _("\tAttached BPF protocols: %m\n"));
 }
 
 static void clear_bpf(const char *lirc_name)
@@ -1899,13 +1899,13 @@ static void clear_bpf(const char *lirc_name)
 				prog_ids[i]);
 		prog_fd = bpf_prog_get_fd_by_id(prog_ids[i]);
 		if (prog_fd == -1) {
-			printf(_("Failed to get BPF prog id %u: %m\n"),
+			fprintf(stderr, _("error: failed to get BPF prog id %u: %m\n"),
 			       prog_ids[i]);
 			continue;
 		}
 		ret = bpf_prog_detach2(prog_fd, fd, BPF_LIRC_MODE2);
 		if (ret)
-			printf(("Failed to detach BPF prog id %u: %m\n"),
+			fprintf(stderr, _("error: failed to detach BPF prog id %u: %m\n"),
 			       prog_ids[i]);
 		close(prog_fd);
 	}
@@ -1963,7 +1963,7 @@ static int show_sysfs_attribs(struct rc_device *rc_dev, char *name)
 				show_evdev_attribs(fd);
 				close(fd);
 			} else {
-				printf(_("\tExtra capabilities: <access denied>\n"));
+				fprintf(stderr, _("\tExtra capabilities: <access denied>\n"));
 			}
 		}
 	}
-- 
2.44.0



Return-Path: <linux-media+bounces-65268-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 30WBAp4YNWrPmwYAu9opvQ
	(envelope-from <linux-media+bounces-65268-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:23:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 073AB6A5307
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:23:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="OpE/MWMh";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65268-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65268-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28C8D3008CA3
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2351363C51;
	Fri, 19 Jun 2026 10:23:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ADC372062
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:23:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864599; cv=none; b=TfNzKUXDwf7q/7mlTW+4vM+aGQZxNfxeXZzn4pCLxpAvuQLMediVTsSMOoN9ecdZIsAAMR97BtJlCmluyXW4dF/C73YBIWeCI7qDfqfmRNtnPELVbP4BwJcrmOK7VTe6nw2LVCjyQeaMKysJHtraE1HYSdCnMvle4cJj9GF/NRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864599; c=relaxed/simple;
	bh=8kgNGg2BjVre8/bahBgbgCYsOBrRSClntsD3Q+v6kCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TE8f45VSKdj5t3ECISjFrE3bd7QdotVGaK3t+468lFcha+/yQGDKXgufPNrVUNmcNGw/HsqVzf5ZABepLDDb5TK6zc7fMb2WOuqhIrZv2CCb3cvgN3g5cCE7AJaq9G6JPTRBBxC2rUwX6NghnfYyaKDT5DGBYgAP1H08GotbDi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpE/MWMh; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf3781ca51so18728435ad.0
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781864595; x=1782469395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOK/pDK0ppzf76+A3kfllKRbu7IV027uhUgyzteLmmA=;
        b=OpE/MWMhCUcse01HFsSJnWQ/rd0v3jNY0OROssJKpBIf52GOGUj3N88pkojra5RgvG
         QQkvC+nR+8tbaGgzVuTiY3p/IbUEyZ2z8Wt/gMrkqo9pHyuZUJlWmVvg8QIBotLlkyFy
         vcGgCnuE1A8Zki9c5fyri26G+yZPVODv8r7KQDLh9CIF5J+/oU5CVD4/x0yPp/dnIGDz
         Our9jZhsIkIfMZj9axysYtgm6JylPWPBibOrvy4DsKtyFc+xn+TwapJVKGVn4BnioQaJ
         S87KvD420FrAKL8R8k+6Z31yDNEkuGfumcDlKTb5KTrNsd0QcOpzK9gl5YRBtKA1sb5B
         9Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781864595; x=1782469395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oOK/pDK0ppzf76+A3kfllKRbu7IV027uhUgyzteLmmA=;
        b=r4xpqq/5ti7saZWL8BXwl9YocGQctll7B6BSCK1jEu3OuLz4jdv0/nuQUe5iIiuYhS
         DLzQbGyM6WGkrnC08I7rANhmGEFGXH/rymNoQZXbj7lKzIyBleeN3lM2OvCcsldXRF/r
         TGd4kKwmLZ65KySSXix7ALCUOySwmIgTFcpcz6XNLtuF4BtiSzKgNUj4IFLmm7v0UZvz
         STJHhW1EUkW8wcIILB+w9nTUsAu43IkoUxfvXZetCf3nYr4TclNggtqeZ5U7Z/7DO/1R
         r9iKPA2ISMMtUF/XFZDkYsIi3xAJvs8QFx8mPD0aw4KB1U03Kq1Uvu6z4nwNx+F+j4Bu
         hHxw==
X-Gm-Message-State: AOJu0Yz5Zzl9oQcGxypqhhpN82Iqjh5bELbmzbgjxDJWONqv3OyuDTYD
	Xyu8QFyP8l6vgs88pa+zLWMewrV68tbVWc24QbYhctMon16NxLdRmODjY5PLAnah
X-Gm-Gg: AfdE7cnASh55WDVZ0J25kc2bwLmYMH8le6I8no0sXw/YM8RSvxu1SFB+OYH+h4n7+WU
	DZf00Cs/o6laqniaHgmzCrPVFwCJmM4QtXSJn/pq93UefWaPBbQNHZNN+1dOdOczJOH/z9sjEcD
	H7FWF/KPlyIjQYxhDOWMOSrARSBi+mhnArygO/0EaIniyNyOWAHETVRowfbufoeCVXsXERNAqKg
	0kzJTflMp8qhDr3Df2fxtpzCjvVRaoZFDYVu5ulr9Lansm0wSCb3lBaLPLFfn/Bkh1++PhDBbKM
	ZWDK9/ZZnMa9xQW2rk+2evd8t6mdKvGJTVEGnN7luI8oWxgUw4dvenvYrV1MTzQg39EfC+OGFU7
	R6mS2sLUMTraWMCxTidbcqTLlxoLDeS6yLSgyUoGdl2WUT7RS9B9kBW6/mAgTlPl9iVJBtX7G36
	as5n28ENJi6SZwYzCpaiLkHN3Khn3zKcoYFpMU9hCtxg==
X-Received: by 2002:a17:903:182:b0:2c6:c9de:cd0e with SMTP id d9443c01a7336-2c718f02edcmr31522835ad.23.1781864595624;
        Fri, 19 Jun 2026 03:23:15 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720c24f73sm19486115ad.82.2026.06.19.03.23.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:23:15 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 4/4] media: renesas: rzg2l-core: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 15:52:46 +0530
Message-ID: <20260619102241.22887-10-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619102241.22887-6-birenpandya@gmail.com>
References: <20260619102241.22887-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,ideasonboard.com,bp.renesas.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65268-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:tommaso.merciai.xr@bp.renesas.com,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:laurent.pinchart@ideasonboard.com,m:hverkuil@kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 073AB6A5307

The remove function is missing a call to media_entity_cleanup().
Add it to prevent memory leaks if pads are dynamically allocated.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371..84d4883e2fe7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -312,6 +312,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&cru->notifier);
 
 	rzg2l_cru_video_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 	media_device_cleanup(&cru->mdev);
 	mutex_destroy(&cru->mdev_lock);
 
-- 
2.50.1 (Apple Git-155)



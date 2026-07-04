Return-Path: <linux-media+bounces-66593-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zArkIpFDSWo+zwAAu9opvQ
	(envelope-from <linux-media+bounces-66593-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:32:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C1C7081A3
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:32:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=O1hfn4YI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66593-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66593-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE5223021E5D
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 17:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A852F375AC6;
	Sat,  4 Jul 2026 17:31:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C14348C65
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 17:31:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783186296; cv=none; b=EGas4hKSod9RLdU1KiIhKAvE7r58P9psjQNkMKnc5yRGD2rT4vQo7qkGuek92ub4n7UBwPXkc+CmS1r62v7K3JjoqsWXmFj1pjfkqktzxS3pczZ2hvsVQ3tRi/2R2R5zgLlbeDWoHja1mS59qdvt3FkSaAUJE/jtdR1ZSWh11YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783186296; c=relaxed/simple;
	bh=oMIoA9y2QwSIaP74LDSPSwPxm7m3CTzwpbsp1vWNVm4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SmeZyvDQy8OPJBD4TGvJDwHOr4kSataFC9DUQ+VQk1QHwPJmYnhV6DbUzOWrGwV7PI4hrEGEcLxPZUMmuDOqGMpKAGeiYqSQIt7cN87wIoEA7WpQU3nYRhEBXI/2CfX4CX4l/Q098/pZA5tQpi3d8imFfxRM2iM5iNCYcMVE9iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1hfn4YI; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacb8416a1so11290515ad.1
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783186293; x=1783791093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uGW3vnuOQowUku+yOKABC0SiawHjWOple2z61d4A5zU=;
        b=O1hfn4YIofHk/DmKspm0NbR+c6T9MVqMQ+rN2ClBI5A5AASLWPXNLvtaq6KZ+L6HHd
         Jwj5PkgsxGEMEAFkJTU/LdSWkB2zZLx33wbejZ2psahOub1NQSj3mf6CaX/1D4scBKzV
         Sc2SMoEeEHPAseFLSDLPZtHdFGwohp1UQOtLWSMLsAHezihpWfI3QbVIBcViPk8RgVLk
         jDdAMVoR8vn0cwddOABD5jwXY1dflPMa0qnq1SZ5y8ghs28AWISAzBkWovegWLF8lMiz
         DbUprNcHMyxyhCR4w7j7Zc7Tf0MXoxJshRPr/FZDYwW2hJKtKwZQkIhxH1foiwfuOtgq
         aMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783186293; x=1783791093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGW3vnuOQowUku+yOKABC0SiawHjWOple2z61d4A5zU=;
        b=ODm+bhEeDO45fcUUsTHdCkEmB0hPT76Ohw4cGz86FxSEiFFBzF/J5EJoOAD8763OGp
         WDznHUML7zsdhwrRLmLamIhcKWvdy4Po4Otuw9KlKwf0Y/chgZmTbt+nyL1spk6GaeTt
         qW2AW+o5cZyoDeypXTpoJF5Wy7KSOpcEQ2r5UCulCqDL+z3U40z+niJVLTCz2Kt76Lbb
         0LOv352ksHbDT832dAjQ7yA3YNSNNbNUrh7Xz+1LKjxeBG9FNEBgrGe+FKLyDzJcWsk8
         SDFEvQucILeCCfSkUOA538nUtRULsEvD4TvoFZrwKuM0/GjyVEVXFoULDUFF6WPUrOWQ
         cgSw==
X-Forwarded-Encrypted: i=1; AHgh+RqCN/ccr5F1RAw6W/Xx7pzHSWPW8rrB1iTVs4rEHuldLQU5pR5xVwtTktBI+RSq2VuvpOISirbnhubbmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6MEcruTJpxOG07FyW4ZKao+WR6mAfGD/d1rexhFjrk6uLaAJU
	QZmBFrdfocfZE5TnfY8y6MZUhzjuuJBVE8vCVSrVc+1A8bImNFAX6fl7
X-Gm-Gg: AfdE7cn4d8pVZqnEmDY/SNreFz3MspYDmwZ3PvaEmvhL9ba9A5hmpXmEseXFJGo0bvo
	cf5joF6CRvDiqIpFR4Ag/gpxjNg6jsnlU/Cn1J6tJpW5sUBJNOoq1qPxtGvWhzh93iyMNB6c483
	ggYZD9zgR2zbkPkOQo4zBTVex1kOeTHfM+ZTaJd4M8aC4pANMeBLU4jjfGBxox0AeVs11gRPuGd
	IU/8ZXSyi3DE6nfRGvU/299fdZQmCCsYksfy0BHLqdFkjKuI+2gExK2emJkAgExqYEdIpfSmMof
	fiZVlONHHxPfgqaEc3Mjgb4Vj/OjeiM5n6PLb64AE4OtbfMSWaDMtmcMLE2Z0ngpw7WR06h/pOE
	OScM1ZRJywKJnjNX4LYG2fe57lgd6Nsgnr0kSBHBVQyGE1lg+qd2erdrXq7CWFWmYIoWQoksakh
	pfGg==
X-Received: by 2002:a17:902:e74f:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2cb97e58139mr41657465ad.8.1783186293171;
        Sat, 04 Jul 2026 10:31:33 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad71328d8sm25082305ad.29.2026.07.04.10.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:31:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: platform: mtk-mdp3: Fix SCP device refcounting
Date: Sun,  5 Jul 2026 01:31:19 +0800
Message-ID: <20260704173119.254975-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66593-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:lgs201920130244@gmail.com,m:johan@kernel.org,m:marco.crivellari@suse.com,m:thomas.weissschuh@linutronix.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,suse.com,linutronix.de,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0C1C7081A3

mdp_probe() first tries to get the SCP handle with scp_get(). When that
fails, it falls back to looking up the SCP platform device with
__get_pdev_by_id() and then reads its driver data.

The fallback lookup returns the platform device with a reference, just
like scp_get() does. However, the fallback path currently drops that
reference immediately after platform_get_drvdata(). The driver later
still calls scp_put(mdp->scp) unconditionally from the probe error path
and from mdp_video_device_release(), which drops the SCP device
reference again.

Keep the fallback reference until the existing scp_put() call, so that
the fallback path follows the same ownership rules as the scp_get()
path.

Fixes: 8f6f3aa21517 ("media: platform: mtk-mdp3: fix device leaks at probe")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8f4da4cf55d2..121b1006ffdc 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -294,7 +294,6 @@ static int mdp_probe(struct platform_device *pdev)
 			goto err_destroy_clock_wq;
 		}
 		mdp->scp = platform_get_drvdata(mm_pdev);
-		put_device(&mm_pdev->dev);
 	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
-- 
2.43.0



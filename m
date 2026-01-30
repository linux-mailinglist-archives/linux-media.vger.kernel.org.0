Return-Path: <linux-media+bounces-51828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPcFLgyqfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:54:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FC2BAC17
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 853C53088C82
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9682837F751;
	Fri, 30 Jan 2026 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+ELSBeD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A1E37F118
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777401; cv=none; b=DCZU6hdcPjlJqHqT/wNeyQhkVtV/nJDLnChHY/pWhoKkIn8okYNbVHmiXHnh2xjRlRSziqGB/aQ4syAoUv7Fma/Kaek09ZHPp/9Qe7SbSSRpYEjsAuMI1iscScZpHtIoYxXpIIkH9/YMl2Im9p65IGL0je7aWlmlgz1TGL2kXb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777401; c=relaxed/simple;
	bh=W/c+p5OzSzMCPsuxSreuM0YQnwu6gX3JEtOSgZZKgMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WlSA9RLv/dnp99+XN2DjUC6nkCpTXqHZZKuYHKLHOc1U8qfDZWpMPKHB9Q2rlF1tWX7cftnoCE1xLJD8BZX0oBn9LnvYv7VIk5Lxh/fqLeL9xxsMDDf6h9XuamhLZTXex2qLMk6zDQxg9fY+7QBpk+uW4ATpIYOXCT6MTGHHBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+ELSBeD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so23432655e9.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777398; x=1770382198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuLhv0mNsbTmk14Cy+1I+agalhgb8cQohYYZvZhzur0=;
        b=f+ELSBeDc4COMI7t9a5iP6snIRDOyJWzJB/Lo6Rcnq1TyPpQfURO1wd2w+/30qhEt/
         Vd4gk98DH+f+bo16GH45cbKD09hhjGUgeyLxoEEmHpUCSgRlB9FV76/TdPkGFeI0SjL9
         LHbt9sJE5au/UbFjm0db5kbMzgDw3UmDIfm4NZq4SfBr1E9ggBReJoK907gE83BZbl6E
         QxUsdoLtMj53/m1qYqgiM/1ixS+PZBy4z47qN8lShDwFEeTEKRPjR76ydp3DZgHxzbCc
         YJqE6wShwcfmDa4eJaoYncgJczoG6HEd0XVdnLKdf7gBrgJICmVXYhCs10Ur6GlgTl++
         /59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777398; x=1770382198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vuLhv0mNsbTmk14Cy+1I+agalhgb8cQohYYZvZhzur0=;
        b=lArI/vjP1LYUwrwU5fLRidbWE52+SeDktnW0wjQjmiby02BSzp9W7dxmvLFfMsAbaD
         cwUQZ1EHqTY/HudaM13SDIZZD+oMUB3pl4tUto2xie3lVYCZbQ2eaxI2lsDVbOXbTkCU
         U/i3t2SjB7Oac5YjivKv0Ny7lYX+h2L5XhaN3gDPCyHa/59luIyj65e3WQP2cFesvWst
         h3tLjicdz/d2ys8ZSxpyHJNnJf5xSqyRqfYaK99+aHv7SHPBPyHHuqOrBMe2ZTFkFrXU
         uveSO7xKjD4qwAwiVXxu4YW/1nUNisYfJnjyWoIXyj0JeHZzkV4noahFsUuEzKxfl5QI
         EyFA==
X-Forwarded-Encrypted: i=1; AJvYcCXSuLlb9p6Stzb4SMW4+0hy4ouQNaMu6J7rteTwkPEl2ujn9xoiCQcLkW/ztD/J85LxmFyBiN/Uj7oF7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCOWX0DXUc8zDSNWblE3qdVwRO5msrdtzxvU1qZ0MEAV3+RMet
	K2cS+6TFi9TFITClNhncGqf03yj0a6WS62tJI/0QbAcHFIohobEjAEwa
X-Gm-Gg: AZuq6aI2hsnErC4alLcQx6VdxYVz9m8eS8Q83xhH724gJT9sHZsBrfUyayiEcEYYUuF
	/hWQnVOawGCdUM4P9jEJE5qIJZbC5ZvX+lgrKUqnnuFpE4i/RCz5RmgVo/rSj1co60bxVzCKpqh
	B2AhodAPRLsK3moUZn+yr0uOax5CZE2dS33g8oPhUnjjTlkP7c28v0qYmQCyuJr+CdoKik5z42f
	rLgryk8AFDm/yF+1j5H4uh8QHTdhu49ckzkeNj7GPcUJUNAo94Q5MAaf0MhQ8+tKP853a6N2CAA
	rigx/aayETsR8Ud/UUw+xzH5tTZMWYkWPyFmp6Kxfd8j/AI8uXwisK5Pk0zcZkNeI2sc5BToOFA
	eA9efn669qTDu95TP5gnDb2/PKqh1J1IXXL8uef7YcEWxyvSAqlpD1i0CDha/80pClBqZnYFyc3
	RG
X-Received: by 2002:a05:600c:4f48:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-482db013b90mr42921685e9.0.1769777397748;
        Fri, 30 Jan 2026 04:49:57 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:57 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 03/15] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Fri, 30 Jan 2026 14:49:20 +0200
Message-ID: <20260130124932.351328-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51828-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 17FC2BAC17
X-Rspamd-Action: no action

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 70a84158b589..0f98157a7e91 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -962,6 +962,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -987,11 +988,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.51.0



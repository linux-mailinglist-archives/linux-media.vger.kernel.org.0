Return-Path: <linux-media+bounces-54469-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEGJKS4+qGl6rQAAu9opvQ
	(envelope-from <linux-media+bounces-54469-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 15:14:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3234A2011D3
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 15:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C4473054C27
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 14:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DC63BE17E;
	Wed,  4 Mar 2026 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Q9nfvWoR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A67E3BE159
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 14:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633124; cv=none; b=Eq/X+2dKKbTU/bfG9m34PIWynwXVdKaX3WmFTZB0/wI3N3Hv0wwy2Sni+21EK4BSCUHGOqIHZRoPyZTnIFnNoWeK0t8g/MsSAdBpJxxyZO4z4NJkmi8e5mof8yXVimGAIK0NbQUmzZh9syqZR/wJ5qvLJS1RUEXy3+AKddwaLGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633124; c=relaxed/simple;
	bh=rRr3+vifUdF0hNY60dwmGGafi8luWOxE/yqZKA9fp8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WD876PFBo73kVwQ3cZ9YfIX/n8IbAOuEUa1nt7kpNseppsjdm2TQDWHltiDCx/lpKzPsKzz+re8g7v5T5S60miR8u/TyFSML+pTRlOFch+ieeSzjOJut60wszKz+RkKF14kjzPu3F2tzon/cdxxxTbA9ufhYDwIWFnPBx5d5Zeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Q9nfvWoR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso46862775e9.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 06:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772633120; x=1773237920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNaltXKAWAjQbwu3MqBmJgovVgpV61nuOt86Xr0pRVM=;
        b=Q9nfvWoRDTE/8hzDS2B5r1NX8dmlP2HPjjglm7Kc5Hvq/m+FmDMpwJv5oF+zzC8gH+
         m9rmVnxf31g25yn3zzueKBy+Oxw7KlLsH56xEllEQY5h5v9aM/bGZuGkkPdOHFn2OTy7
         UBt9BHtCXdnoyKHWG15YKXDEbtpSaJT+IJ8oNCSr7qq01e7tTqUKDSX4snYa8XGcP6ui
         NTybSePR+Hiv31YPk6LfdFvAu+tJ2g9V+FKdNoVjn6Ybt0swa2oz5Qf9HnIc8R63vHeG
         AUvxu9xcPGjN+JHMIvGXqW+JcTdfFYw5c8BpRt4bjrCZpAaOsvG3LKA2yD2Fc1V7Mojf
         XFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633120; x=1773237920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yNaltXKAWAjQbwu3MqBmJgovVgpV61nuOt86Xr0pRVM=;
        b=Nih/wgKWWeYGbNQF4MrbmWH2KjLtQXip8IkEOtA8vjR1gh7NZiNutaEMzhv0YTbo9N
         oiJ+rJ7I8yRMe9iIgaoLRB8VynK5RHzmtp/VhvutsLbGphqKOcZUjsD/mIYiiCkSaLST
         8eGtwF4d513BgR1NhCl0O9j9jwyprpS+PQ274QifzVlgzo5J24Qo6WazLlVZQHtePReZ
         OPqx9vG7M0e/1KoZnlNK2pAsEaBUp4QTkwPeQa+W0p1PtGYw61DDV6ueJ6desRT8ilJa
         CH1zrJ1Ee3IfQVpoco0gKiAZY3ELoMmIey8atY/JxDSpSo47Y/CQaFX8xfD5xsFvJ+lP
         IA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6dBb8C185USC/dEnvLJwIt9HFh70SSMPKCgAQFq1dcdVLFGymOYCDiEjdM2eqNG2tCMdvgZq6/jAR3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEY+M6AYAjMyroGpTlk0kb2FuueNA/cAYq4IKf4ICAA84GyhGA
	HgB8MGCRsarejBxB3IJGzQZYi2n5PN7Vri+aqwbFDbEVbqbbYgG6Qd08Y5910IHP6/E=
X-Gm-Gg: ATEYQzzSaRMNvh6yPab3REzgBRClOrWuKl/nuYR2XEDItOIF8TuDSwHwWJ7y2KoXW/k
	dbduGQ9tFxv8WD65w30guIDlpCcyFLPw3wMudr4augoeG2uRdoWrZITciz10l52AMrma8jbdrJC
	21NDC1hYZtTox0QDWJ0wSYQIgq/tN89BSlnwS0gh49nggQmgpR3Q1phAzA3d5GLc3HpZRkPJVi8
	uBhhEuICp8uSUZeRXo0Ira0J4kxPbzpNNCuLlTaNuizKab4OdVFUqrii9PJsm6Gb2uMTZlacKWq
	9YJcPh3lmaY+0cSbqbFHVJ0k+lUGXHPqSjta/SClQzq7RLxmu2hnRTPEZ2kqtTAVZ0ADlED75hZ
	T3uy36lGTlj9Kvm5yZ2gWKQv0zHUzaXlXkoCyy41UniVaIHZ6mhZetlyTgCgRr8BomSLiIQ0sNb
	vVQCpsVFaGlMe/eQ==
X-Received: by 2002:a05:600c:19d4:b0:483:a352:b4e4 with SMTP id 5b1f17b1804b1-4851987df8fmr36433065e9.6.1772633120448;
        Wed, 04 Mar 2026 06:05:20 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-485187b6ffbsm59296165e9.2.2026.03.04.06.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 04 Mar 2026 14:05:14 +0000
Subject: [PATCH v6 1/6] docs: uapi: media: Clarify HEVC slice_param
 bit_size, data_byte_offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-media-rpi-hevc-dec-v6-1-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Queue-Id: 3234A2011D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,kynesim.co.uk,gmx.net,vger.kernel.org,lists.infradead.org,raspberrypi.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	TAGGED_FROM(0.00)[bounces-54469-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: John Cox <john.cox@raspberrypi.com>

Clarify exactly what bit_size and data_byte_offset mean when there are
multiple slices in the bitstream data.

Signed-off-by: John Cox <john.cox@raspberrypi.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 3b1e05c6eb13..a54e8ea29440 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -2399,10 +2399,12 @@ This structure contains all loop filter related parameters. See sections
 
     * - __u32
       - ``bit_size``
-      - Size (in bits) of the current slice data.
+      - Size in bits of the slice_segment_data for the current slice including
+        any emulation prevention bytes.
     * - __u32
       - ``data_byte_offset``
-      - Offset (in byte) to the video data in the current slice data.
+      - Offset in bytes from the start of the current v4l2_buffer to the start
+        of the slice_segment_data for the current slice.
     * - __u32
       - ``num_entry_point_offsets``
       - Specifies the number of entry point offset syntax elements in the slice header.

-- 
2.34.1



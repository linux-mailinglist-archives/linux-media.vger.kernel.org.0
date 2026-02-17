Return-Path: <linux-media+bounces-52948-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBfuIoHqk2lJ9wEAu9opvQ
	(envelope-from <linux-media+bounces-52948-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 05:11:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB50148AD6
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 05:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44F103026173
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 04:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3E9283FC8;
	Tue, 17 Feb 2026 04:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjVg7jpM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5272713B293
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 04:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771301477; cv=none; b=Sh9hXCPj35dSQxYLCwymyML7RpH4MyBD61/QF/tiXdHUOXHTtby1passypPDDkDzSvBaSzwIDA0NkEPQrw5FcUVeZp2YogAT30/CfUwaneHQ0ZcoSgDwLF1BX+VBDDKDFS1AdEh4xK2KKvYgcXNwQmpfBXyOOM+XG9EABQ6F2Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771301477; c=relaxed/simple;
	bh=9NLhp/OJQuOkOsss0BkDyrqirQKgzJKeBi0XSeKsyRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4ojF8wV/sgiUqiPJuJhLbmyADi5Hae6d68kBYPkdKg9D1Au5CZ8yWcKdHftlwI2OIPHJpXZ8W1e6h98V5BtccNBnxSEp0aauhk7hmEH/aQ1RYxv0+kftX+YxgyEfWjL/Pro5mR3sJVzcroJEXeZzPz0zKQBBOUq2Mdo1n2LVOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjVg7jpM; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-797a52d8c34so31494497b3.2
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 20:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771301474; x=1771906274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8c6DkdYfRGECPUo+HrtR+bQQEfpevZZZT3dyCzulfI=;
        b=QjVg7jpMktsCAya3Ch791m+pfhUQA2MxfdSfGEqaESxr/Hkm9ji7ya62ejsG5diKOx
         E6woOebS2RdhMP8d+dfxhpr1TjdnoLDfkWd9vPGxHuWhq9myFLnCj5t1v0fe0kySX67S
         wQd4ykzBdktawgm5vGJptBvnFPh77LF19K1bhxwRHW0OFYZrYDkiv3Pd0Qg0lHoLUnIt
         aP+ILbcfojV3A2mhQYbbeIcgisGD7ORjXG+cXfI+TmiZBZB4M/PMSkFocscW/TrUZ1tn
         j4oSqMIaj0/lyari/4P6cyB68g6Xru+5KojYD3Sb81oAaQ600EHwJYeln0t+xFRxh6HB
         UBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771301474; x=1771906274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8c6DkdYfRGECPUo+HrtR+bQQEfpevZZZT3dyCzulfI=;
        b=ODGfObtQVu12mGFTYBLmsntLG0kwTGpYm3UKU57xEQE+dSK6CiJLEMpL7gQrHYZv2k
         ozq2WZjSyIeP1j5WIkdY5YQQOfYHHHU3dUp4xwEvBFSuMIUPRvVx/oHuxEr/RkILggJt
         Ruab1N/nlppzejnWWg9FE0bnuWOg3Yfit6CjPpW7v0TMYjvDnafUKKtoQHzvj6hNMAli
         Ih2dhhYnm0C/k/YUVLr1ouSinVrsFpPNK84erw/3odTD8d3Ml7G4CnLZhhtKOCjU7OmY
         EN+WIeVEqKXUXpDG65RVwy9OGg2wH0ICeJoi9kVpGPK40V/b/mPdRzyT+AWHG0dGcibj
         XYsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTJOei8Yfkjq4LAN3LsifBg51/IyDoCJvsQsiDsTf/HnkqffTop/lchQsAKqYMZ1UAgvLsSubSA8ghqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv3tIO8iAURLwI07vqeM/Gjh9bhn4fG6m2Y9zKAd251WzSzMHO
	yZm2NlFGIHanxI2gF3UApUV7vxXKatS1ZTcVppulwWnciOltMl560Jp9
X-Gm-Gg: AZuq6aKjPpj7Fuh6dlLELGoJ/OSB1nD+9JvMplu7dzXn3neaQpY5+qhmR4P0fRsoPOx
	i85scjSoodUWDvFkfDcEPcUETh0PJCoYxV4U77z7vS1rxceY5PX4b/eK9B0PISWK/Yu7ASxJOKj
	qTKg1bu6lWpmWTba6NvtvbHq8yQ522s6TbBlw9AACwCeoWhb3POL6HoQ9VZTf8q4QAh0G3z1P2q
	Ozhiyqow+0yxDDK6LKjnUzXKBGhhQAV/r5lWS0ZPiKfxTRtSOLzL+n8Xo1VesAwS78oj2eJKgUM
	c95YF2jXIQCBpmtaL+gGwbGLMlwdvtCdNH5ggGVPHbRLsS7hlPjO0izECev8wLcGJSM6Xb30av9
	ouvnTaF0LFk7my9XU8zmWNPARtUgR9yPXVGZMTM7EGN0eQLvoABI90CS2GPbaBkm9Lm2wsYE8bi
	4RBpaxPbeOq+gz6C3qB9qkdk1sfHQnDOnGddVSjjX7peEPAlMKvbSpRyJlv44rUftjCyADWKfMz
	MAzlbMYABh3NqIKE2q6NKuHI6nfLsTqdnIvR12+x0Es9tkfRtXacg==
X-Received: by 2002:a05:690c:e3cb:b0:797:db54:b893 with SMTP id 00721157ae682-797db54ea2amr26523277b3.45.1771301474256;
        Mon, 16 Feb 2026 20:11:14 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c23c244sm107101737b3.26.2026.02.16.20.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 20:11:14 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] media: rzg2l-cru: Fix error pointer dereference
Date: Mon, 16 Feb 2026 22:10:55 -0600
Message-ID: <20260217041055.88912-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,bp.renesas.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-52948-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1FB50148AD6
X-Rspamd-Action: no action

The function media_pad_remote_pad_unique() can return an error pointer
and is not checked. Add check for error pointer.

Detected by Smatch:
drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:414 rzg2l_cru_get_virtual_channel() error:
'remote_pad' dereferencing possible ERR_PTR()

Fixes: d7d72dae81d5d ("media: rzg2l-cru: Retrieve virtual channel information")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..bf7d96841c78 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -411,6 +411,9 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	int ret;
 
 	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
+	if (IS_ERR(remote_pad))
+		return PTR_ERR(remote_pad);
+
 	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
 	if (ret < 0 && ret != -ENOIOCTLCMD) {
 		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
-- 
2.53.0



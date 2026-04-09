Return-Path: <linux-media+bounces-58336-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLpNLpCv12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58336-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:54:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7964F3CB9DF
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2ECBB3024553
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662DC3D9028;
	Thu,  9 Apr 2026 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ve14zFZ9"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9690B3D6CC5;
	Thu,  9 Apr 2026 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742703; cv=none; b=bQnQdALNtMeyHR3MF6g5l28X8pUye/53N2gLOuBoVV5uW4uejn04pc7cKxUnan5m+09BIMnhKlCW+6d6m0OxyVEbeNaqQOPJHxB1If0u5gJDy6o66bTBDgrVevKarxBtQa9u7FLdG1tHsJUMCunPrMs8OGfk3PIBSPtx+CoOozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742703; c=relaxed/simple;
	bh=DMIweKgSOV3fIxZqhTvgTz9sRtOIz37xELaVKWgzSTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6r3ibzKJyFxJm7y67gyRiHhaJy5uRSdXIlSDk+PVS06nRVu8j23ABFEFeQA0VOb80aUFy8OQYMbo/l6imtajv4hG33boRzldVvqBP/UpYEfAqHaU8EI3WaTGuaxpse7h+jOF3zSgyDYCSx9QAbeevyCi3YpeaqgZwvAe+o/OiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ve14zFZ9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742700;
	bh=DMIweKgSOV3fIxZqhTvgTz9sRtOIz37xELaVKWgzSTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ve14zFZ9i+yeRKHWwgsEz5P+v66JA7tDwkhMXZ8Aalp5WOttwW2F5W0TQZZewlpoJ
	 t/kLOh5SFVIq5WxxuSXqVbF6yXe6HQBr0OOJQeJyxtMMZj95KtJlJQhy7j3KjXm7DA
	 sGOp9IFCYRPFY0fbpcko5kapedROjNDeC1OzcGP1l8i/XQd/3maQ1+ECYIJtoCeRwn
	 YQ+y3EkW+q36PQcIVx7+/Q0fP4EIITjFc0n+ojtaREikctWPozUstChODtV5+ALBRy
	 KpkGnHQet7Phb9FTqzaju4OmfzE89sRE22rA1fkEHR0ZRjMKAMUkYlhNmsc0YJUx/q
	 3zgblwtSl+oJA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9F4417E1380;
	Thu,  9 Apr 2026 15:51:38 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:41 -0400
Subject: [PATCH 6/7] media: rkvdec: Wait for all buffers before
 stop_streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-6-62b316abf0f7@collabora.com>
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
In-Reply-To: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.1
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58336-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7964F3CB9DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Because the jobs are marked as finished before the buffer are marked
as done, the stop_streaming callback can be called while the decoder
is still running.

This could even go further and deallocate buffers that are still
being used by the hardware.

Fortunately, to avoid that, the vb2_wait_for_all_buffers() function
can be used at the beginning of the stop_streaming callback to make sure
that cleanup functions are called after the last buffer has been returned
to the queue.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5667d625f016..c2818f1575ef 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1027,6 +1027,8 @@ static void rkvdec_stop_streaming(struct vb2_queue *q)
 
 		if (desc->ops->stop)
 			desc->ops->stop(ctx);
+
+		vb2_wait_for_all_buffers(q);
 	}
 
 	rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);

-- 
2.53.0



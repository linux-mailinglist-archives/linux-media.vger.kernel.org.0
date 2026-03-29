Return-Path: <linux-media+bounces-57498-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPn6BRTSyGnprAUAu9opvQ
	(envelope-from <linux-media+bounces-57498-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:17:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC430351027
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DFC1301AF68
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 07:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1333C22D4DC;
	Sun, 29 Mar 2026 07:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7yJKhNM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9BD286409
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 07:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768599; cv=none; b=bOJhv3/1GeKaKkgBPHuicI83kmQ6Szg/CagnCU9rYCf02M/YliXGq0tmqDJf/53/qEbHRvON0xmKIqaWT0ddZjilAIfmzUjxYTM8hi9TP2RGBcjgSvZ33hYN3+qQ7o2vN9bNcvNF8UqFS34WWqQ0X/v6V7ZqSPL9KeMKpY2RgvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768599; c=relaxed/simple;
	bh=libs/QDv9jb4avhsuouWTEl+BcQZS4aPoB0znhCSDhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g99NqsTuQ7351AieOWHnHUMDnpXkGPCuRAblxsK8kFU0qlqUjqtAdv/Tg4m82kWzkowY/rP7y4VRpdse64Pbey/8yBa3vfXnorcHzqXKjE+dRVa99aCZLidpIQLvnfUz660/Km6kzsdj0CaLTJq8m2+TyJM8FaPuEKWuLvo71Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7yJKhNM; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-604dfcc9892so2262377137.1
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768597; x=1775373397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veDKQhNg9NBvP46wNZP/JDlqedS7FBlQQuLF0X7HADw=;
        b=m7yJKhNM2zxkbUEX7yDg3o8SNS7XpBFLwrY5ujFnP8voFjeUD+In1RuIarG39HMzKu
         FxO/9kQ0yaIn7v9V+gIuas60xGX7PCkZAGLL1JA3ERroaIVKL3Ju0b2fjqKtnZ9v30JH
         6BNlTuaEfMBGmvqEtTHvP7bHSGm31JQKN/QnEBqZoEXAnGj2CqlkIRD4QhKstPPnoag8
         +5mYdsFJhk5J0MVe8ULBO+qzbl/hZogOh9HEJ3TXa2NN0fZneEv2flefzWaiWBFZLpVc
         Lkyxm0TmJOlO5/cxTlANdhYyzMJDu60Ftsu81YSUGalmgA19f1CBQxqeZHPejqEJ9cCU
         Wliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768597; x=1775373397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=veDKQhNg9NBvP46wNZP/JDlqedS7FBlQQuLF0X7HADw=;
        b=ZDTc3o+m7Tt92XdDyjgR7d/9k7epm4EPsQr9QsvCkkf0IAStQMU2sNyKvCtfintb0e
         F5XzkJIDX1WYjaalJ7YNzOvJYNGcmY8O/RKCFLpD1HFh95lqIw0rU4VitFDMaVQvMvb5
         hZ5wou+RSPKX0bCr/yWec7fxH5tCDqaMyqyPsN+N6GpGXYlbVYGyAqUlZ/rqD7NW0B1t
         tHBi0uj5gIma6QxywS+05IoVbFHdkDPJsYSlEHDKPNpLuiEGm2LxqhZDHuFUnRHuRQDi
         sT1jEKUWOYFTT25ISwJIzLof/7MfA+YWgvHzGyAEHaXPYz8LtIBF2lE2QOPtkqJEvLOZ
         4abA==
X-Forwarded-Encrypted: i=1; AJvYcCXPSgm6swTibxVwhXXJjxEUcLNbu2ufIsu3qXoF8gNZohZdS9Yu0opQf/m6Smo1I55xbbR92VaN2dqYsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1RiFkAMyKtpi/61PonEVmJeoXUrtNzhwvVSZPoa0A4Kmzpy7
	jo0stavNVbb4MR2Gd21q4qPf6BFENt4+XI8hTQvusnrl4QmBNn1w48Tv
X-Gm-Gg: ATEYQzx5Dzt5XZFbSZhHIbA2T3lt/k6M6Kl3n2BCqLFfvrk7xoY3UrDKYmPHt4oaP38
	iqNl34eWj2IM7T2hrzx0W4pze7UX5yBtjqwFt+Btrxkx7admrJtRqVSirANGvPKhE8eM2hwRxA5
	wfvhk6V253d/JrA+QCcTZrTgzO0lYtMD1vAyVl8/vm1DJQO+q0LL65fJfRrz2rxa4IiA7YozHvB
	XbfWnAw/4LjkbMOdzmI6olc7xScBIdQJb65nTOzgD/eUsxmDpz/MS2bEf+3260xjCInQwIfGJGh
	eSUBlVwPNR5+0fM2FQKQa3fz8QG33EhBbrokYr2Rct9zsc9p/xfomPxTMSn9EtL4djSzf4ASyJv
	HvSX+cNtPLhZsXk4t6QXX0OWBEH7uphuFqYH1JEPKkyCJMWiYCAU1GYRHdKqm2fLybSp8DFW9jq
	rku1ffbt0NeCfWslSvPxE6+oA4oUBn+vPKISQ=
X-Received: by 2002:a05:6102:6cb:b0:602:9977:a4f5 with SMTP id ada2fe7eead31-604f926f2d3mr3395247137.27.1774768597337;
        Sun, 29 Mar 2026 00:16:37 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:36 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] staging: vc04_services: vchiq-mmal: prevent stack overflow in port_parameter_set()
Date: Sun, 29 Mar 2026 01:15:41 -0600
Message-ID: <20260329071616.507876-4-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329071616.507876-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,raspberrypi.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57498-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebasjosue84@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC430351027
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

port_parameter_set() copies value_size bytes from the caller-supplied
value buffer into the stack-allocated struct mmal_msg's
port_parameter_set.value field, which is u32[96] (384 bytes). There is
no bounds check on value_size before the memcpy.

While current in-tree callers pass small fixed-size structures, the
function is exported via EXPORT_SYMBOL_GPL and accessible to any GPL
kernel module. A caller passing value_size > 384 would overflow the
stack-allocated mmal_msg structure.

Add a bounds check rejecting value_size larger than the value field.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 44e5246f1..18e805b92 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1361,6 +1361,14 @@ static int port_parameter_set(struct vchiq_mmal_instance *instance,
 	struct mmal_msg *rmsg;
 	struct vchiq_header *rmsg_handle;
 
+	if (value_size >
+	    sizeof(m.u.port_parameter_set.value)) {
+		pr_err_ratelimited("port_parameter_set: value_size %u exceeds max %zu\n",
+				   value_size,
+				   sizeof(m.u.port_parameter_set.value));
+		return -EINVAL;
+	}
+
 	m.h.type = MMAL_MSG_TYPE_PORT_PARAMETER_SET;
 
 	m.u.port_parameter_set.component_handle = port->component->handle;
-- 
2.43.0



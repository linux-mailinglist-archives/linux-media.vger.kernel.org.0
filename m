Return-Path: <linux-media+bounces-65764-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2rv4H76rPmoWKAkAu9opvQ
	(envelope-from <linux-media+bounces-65764-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:41:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B4A6CF30A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:41:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=ZzTO6JzN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65764-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65764-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7540D30465CD
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0CB3FE363;
	Fri, 26 Jun 2026 16:40:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A443FCB0B
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 16:40:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492049; cv=none; b=qDXGn32xF9SEp0+jLFFIbhewh4kuxM+bIjyGtc6kpmpIhsR/vcAFH2iruKQCI+/kfpMHLLt+oH5Lt5uT0joPVcjG9yBmqHdzSnQhEfOi0yzfnXFn1wgECqWmyyagWusv3zJvBh821WalLMMgvmfjJf8taNYhCdFgs/uOjT7Auu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492049; c=relaxed/simple;
	bh=UwXDGYiHTT+NP61sZf6/dV8Eae6ADHs8ZXHzIDrEooY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkesYfSTf5r7w/A28tS525daIbpl/bFPEZCu17CT7gQb7pUMXQ5rri2bbRxTY9O8joc0emrmundo/71+KsnjDmOjM1MEDwewD0bJm0Sv6Ovy/8ugi6+Cl/+gWblp6jAwtR9/3XRILUe2mdy/HlIVWdqaCL15nuAxHMmVQN8q1cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=ZzTO6JzN; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49241a577d8so9270095e9.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782492047; x=1783096847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkKeguPCV6xh6Jx7E/CjDaoTlE84LE6Cz+7INAskaJY=;
        b=ZzTO6JzNencp6b1oSVzBqRoreN10k7te5HS8iuLYaali2MbGBY6t0s4z0dtT3k/XgU
         Hl38ROuBEh/G22m0uz/6pQZt3AmV0D30VNTTqzmnPh1qLJMe59Ea5heJGe6M9vWPuzC8
         AIpmkS3FYbMaavUgbCLHPKSaH8B5sgDEUGYmpozkuAbTkplk5MIiW2hjxyzEpinCa1iJ
         tuxIU8VmsRKMPeDf2qPzLyQqCTzu55JEDXw93mYsyRR62dteKYT5NzPHBM0wfOeMOTOE
         ibH1nqOmFKfbEgxNDR5b4bj1gmyMA194ULPKjrF44MumDgByvFCUEzVTBrSM+B1rTsow
         LWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492047; x=1783096847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BkKeguPCV6xh6Jx7E/CjDaoTlE84LE6Cz+7INAskaJY=;
        b=msW53AfXKsdWk/ffyQAMa96U55CF4Sosfnihu8rqJq7or67PFKCvLvT21jZV0ifKVI
         MjmTZ5LgYQqOZs2elPo5E5FOq7A4gMg4tTiSXEooIQVAgTf5WLJzHRlLMWLgD9TGfPD5
         qCIwgjwpIkAtehOO0aLWf+PD6ZmMVWSaE64yRUFsY7ZhlTOnT3VAkWkRGblWInQKtqeS
         sERG2oG3fTgTWhSOstW95kvdqwHeXddT+aktTWzRQIFw8EFZ/w23EbBqqrU3vzm0M836
         VlYASOCLEDaE9Je3fsKfGfPfNCzZbgWYsDUqC6Z9NKIcxwlfonobjJSQfHTKmBZRvqoa
         9IcA==
X-Forwarded-Encrypted: i=1; AFNElJ+S7LzSkpMH04WNX+CuLgiWRPjh2+P8nuG6QBsPEnJq59uqJ9ff2+AFhzNqzEJUAhrrvT9N4P+ag2liQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+7sWFpj/KGWyNrtc+pSfFaWYgQ56dtwcAYn3tVdKT4k9zUs0o
	2MTcS5B/l1yalFBGy4AjhY5iiCXkQze2f+nNXM33k9veGn1D9LQxK3tcjuDO3gqPS1Xo
X-Gm-Gg: AfdE7cn00iuVypWb4szsPlhmamfojlQCD4YnRU0ByhRQJABVI0dGdxptKqGJK/6EbDY
	TqmOjp5jyFCVtpGcZwC84HRckewd5wrVnoo+yUvYxgsRG2zPIHcOPjWE9UsNrvHdhvtniLCo0JD
	Xna254Zps4+y9nJJVpSQhHgWSNtZz3cUeBfIxEllRyyuE7J59jCiKwBOGShQugupO2MRpF+ZsNp
	yT/wZ81oD7Char17qzjlNP8ez2itWlqi4DH8OFps2w7YnZRR+4xUec6N4iMHANIdriS1GYTcGgs
	r28BGaIsDpH/9whMixekyciD9+QA0+G5FOcJduOWWp91GCAuX3q2mLzWADxnzdSKNsWANVlFR3y
	G4pmUa4kpo8S0BTDyjv7cMQzSJ3Ay8FBd2V+A/0gX6QsIGZ/3PFz236mWt39fkNaYvYjPoCQxDh
	P2YVruZDsEi65/KwSSVIfU+6xIH0RJOYIOvWRd2Kb3zBKyVtNAOXVBTE8SUG8MJRyv62ZJDbBt5
	Y6jpNFFQzPXM/4d1rQ5qDXyC9lcQcAt2Wg=
X-Received: by 2002:a05:600c:3513:b0:492:564f:5603 with SMTP id 5b1f17b1804b1-49266850086mr113445575e9.14.1782492046745;
        Fri, 26 Jun 2026 09:40:46 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d998esm25393443f8f.24.2026.06.26.09.40.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 09:40:46 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 2/2] media: atomisp: bound DVS 6-axis table dimensions to the allocated config
Date: Fri, 26 Jun 2026 18:40:42 +0200
Message-ID: <eac817f13eb90ee3b34b4afa9b1739d67ad48f7c.1782484857.git.doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782484857.git.doruk@0sec.ai>
References: <cover.1782484857.git.doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-65764-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[0sec.ai];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0sec.ai:url,0sec.ai:from_mime,0sec.ai:dkim,0sec.ai:email,0sec.ai:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3B4A6CF30A

atomisp_cp_dvs_6axis_config() copies the DVS 6-axis coordinate tables with
the user-supplied width/height (t_6axis_config / source_6axis_config) as
the copy_from_compatible() length, while the destination is allocated by
ia_css_dvs2_6axis_config_allocate() from the stream grid dimensions. User
dimensions larger than the allocated grid overflow the xcoords/ycoords
buffers. Reject user dimensions that exceed the allocated config in both
the ISP2401 and ISP2400 paths before the copies.

Found by static analysis; not yet runtime-reproduced (Intel Atom ISP
hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 966b84402..b04d3f3ca 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2632,6 +2632,14 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
 		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
 
+		if (t_6axis_config.width_y > dvs_6axis_config->width_y ||
+		    t_6axis_config.height_y > dvs_6axis_config->height_y ||
+		    t_6axis_config.width_uv > dvs_6axis_config->width_uv ||
+		    t_6axis_config.height_uv > dvs_6axis_config->height_uv) {
+			ret = -EINVAL;
+			goto error;
+		}
+
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					t_6axis_config.xcoords_y,
 					t_6axis_config.width_y *
@@ -2684,6 +2692,14 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
 
+		if (source_6axis_config->width_y > dvs_6axis_config->width_y ||
+		    source_6axis_config->height_y > dvs_6axis_config->height_y ||
+		    source_6axis_config->width_uv > dvs_6axis_config->width_uv ||
+		    source_6axis_config->height_uv > dvs_6axis_config->height_uv) {
+			ret = -EINVAL;
+			goto error;
+		}
+
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					source_6axis_config->xcoords_y,
 					source_6axis_config->width_y *
-- 
2.43.0



Return-Path: <linux-media+bounces-58819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDY2Cu+e32kEWwAAu9opvQ
	(envelope-from <linux-media+bounces-58819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:21:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E77405376
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82EF330E58F5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 14:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025C93D4121;
	Wed, 15 Apr 2026 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxsrc5nx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D53D3CF2
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776262681; cv=none; b=KW7b4mnnNAJVqYpBzF2ecabyArVpM8/jfGKFDiHvY78ODjAHsmQw4B7NN7tn3AeYHDXIb2d6PPrcotLSdApptpOaUBFdlV+MDVOb6GCstFQYdxR1KLyi3NZbo2vu+JEMaehsPnf2K7jbi7ANUju68W1PA0KfbsOO2yGH7+BCsvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776262681; c=relaxed/simple;
	bh=DbwPAjuzgcYKMgYknMMYLE6/2dJXLcBvek6pHyXOJ7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GcZpnk0vHQ5i00n01TffFB89cnaSwr6HcdaqwhNifShmZ3lAcm0bY2/2gTZWmBOXamYpSn78RDNxZa7ZCp4F+c88asSpV8qezWQzLdg4NYATZNn/KfbAkGoD8buUBWtxU0XO1iJ5wGp1F0WNvuKwJqErJu0D+juTh9VP6AykZMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxsrc5nx; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1271257ae53so15023704c88.1
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776262678; x=1776867478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bw1VCi5nYgeb6iMtGug92GHg2lfm+h8hDV/KGM1mT+w=;
        b=nxsrc5nxElTkbk+T89lw+BjVj32ljmKkwxAkuKtPtcmz0dlhwiUKtijP5dy88Rc0F1
         kKw2TjUOUf1H11SuoAfLaZdxM+PMSKujsVQaQrTK5TpXuxpNN7la8Wp1f+6cRg2rBlaZ
         aESINQBVlVlZF5Y+G8SEt19wWSNTURfBCL+S//H2/ZsILX+H4YKofm3fdRk5XiNWMwQL
         /UsRUVkAzFf3NiX8deNqn5hak07do8QCWC12ihErHB6WGmq6NPzhbsAnOgWTrJNJT76l
         RrVK34O1CkZurn787O7ALNS6Wv2C5TKFSQV81QlIiQ3pOW1hxT9SvZxkvi2XkKExC/Ho
         VQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776262678; x=1776867478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw1VCi5nYgeb6iMtGug92GHg2lfm+h8hDV/KGM1mT+w=;
        b=IN+0JxCo2AlNOVY910zjSzCpARudx4IoVD4907p9zDSObWyzqDjNRHKnrxWnw1m+El
         iF3wLFyOP2eoNt336AgqGMlRW+bvEtvV4Dv1TC6oLKIEHugAoi55Onxrsfz4Kpg15K1U
         CWofvpcxYKem5RXP7IbZW0Tcj8h7c2F1G6DoQ+HtP67GsM7TvogNm9daxiHaF01nvszb
         36njmzcpI55EtbexGpzNjshNbY9T/R7neCgmB90+9N/AMtsU+l+AtYVfgnqb05Is4sDt
         6KqUgyYn5yRpWXvKuU7ZpQrDXLZeh+GWQhTZS3v0u4Zd2yLOXlQQOhbvT8W/QcdQYZCd
         63DQ==
X-Forwarded-Encrypted: i=1; AFNElJ80kmgCpkUixDBAU6iavW2CX1PHzooZrnQwAm81Ef5DtqhL9DERbJrh+RWY7CsmXRtME0+zwpUZxiTB4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/+85z0x3J0w6k0Zo+EiJF5z9JhtMFp9iR81fro4y8Cv9Tf9XD
	+l7e2CUR9qI/oKpv1SptffMyqW06GmUf3midiSyq9bS6P7L2QHehCFQ=
X-Gm-Gg: AeBDieuQRG6fQtJSINfeahjOU20AHjh22R5YS90qHcFoeewvXVsthbtni2z3ZpjhqB1
	VSLU54DahKStTiedzClTDhjqqHlpX+TgDuxn4zk00fIXDCFz2cxgxY3IJF8rym1nN7uPmfJl+el
	zeqYHqeGLFNQyi34TuGXK1jOV+Fzj4C1AogLYwiCj5j3yK0alPePM9jzwgEVRlhFyAChiX0BtNx
	LAr85K0bOqzFG1vRX3INaG7sMl9iIkg90piHh2vnSdVoinwIQDg6JAzU/LBYQ5ENy8urLsGRald
	+gaJxQtinTXdPKQ7TgxvsmNb5AZX0ZkasFjQRhjbSaKUZwwF5HHba+CNdJR7Q+CpVnYilRImnOE
	Fn8FaY1zrE7T6/OnKzjDH9m/xBpMjSi3CzUJTOVcdeFkrIYvjYQYInWloCA7N0xs7FGTRhPKYNW
	yU8g6IjwjjD4C0N6prsPyg/bbZoF2FC6nDYnf4xbS35itEuMW+UKk04uEBddTP5EYSQMIJsmAS/
	cfVuXBG2w==
X-Received: by 2002:a05:7022:6189:b0:128:d450:bc76 with SMTP id a92af1059eb24-12c34eead86mr12476394c88.26.1776262677904;
        Wed, 15 Apr 2026 07:17:57 -0700 (PDT)
Received: from vilarmanjaro ([2804:29b8:50e0:3432:1ab7:b7ed:546a:3e8f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5f3f3d93sm1308436c88.15.2026.04.15.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 07:17:57 -0700 (PDT)
From: Ramon Watson Vilar <watsonvilar@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ramon Watson Vilar <watsonvilar@gmail.com>
Subject: [PATCH] staging: atomisp: use usleep_range instead of msleep for short delays
Date: Wed, 15 Apr 2026 11:17:39 -0300
Message-ID: <20260415141739.109259-1-watsonvilar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-58819-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[watsonvilar@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81E77405376
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Ramon Watson Vilar <watsonvilar@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..e0b0f09a5c26 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	usleep_range(5000, 10000);
 	return 0;
 
 fail_clk:
-- 
2.53.0



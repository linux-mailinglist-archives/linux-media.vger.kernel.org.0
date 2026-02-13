Return-Path: <linux-media+bounces-52738-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOUVCUYrj2kPKwEAu9opvQ
	(envelope-from <linux-media+bounces-52738-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:46:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A60E3136757
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B61683062C67
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FD835DCE3;
	Fri, 13 Feb 2026 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TvMdnyfk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC57422332E
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990389; cv=none; b=lrCucKgFZeEpJsHcW8sUnPCDK5Ge7ravhTziWvU4pMWiMaInHikcY541vBYhTJS4TtevLZrg9isOoNVNsIZGO56QNlYIMpYQjaYns4LJHhcDr7Cw5mKMDxV4AbykNk5fnh3UViFJIPfpKSCj916ngYAPtqTqwvicxrzj3LrPP2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990389; c=relaxed/simple;
	bh=hPFeRp4Z7JOzeh1QQgecCsHvwOA6CwPs1cjc/Hdt/uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XzOb7m9WmLLqyyBYIapdBg+EB1sTEvxvYRNQeTX3HY6iZvTrNs/Jk96nQHh2vrFUA3bH7Rw31yQyNQs7p3+DKfg65emmXB3qfr6m570prqdF4+wwv97aYhHJmpHknnz4cSpjuwf49FLVZecWePAwPOhfo9ndooGhl7jZjL3xnNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TvMdnyfk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48375f10628so3194155e9.1
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 05:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770990386; x=1771595186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWonhiqYUU/I29T36MDFNW/Tu2hXhausVUNKOlQeMkg=;
        b=TvMdnyfkmtbWtDQDSHgA1MSu1KFzfSfLog7ZEYXgX7gJyAQT3BdItrcY1tHZsTRV2t
         iPPa7QK7ujGKtHPwf8k4IqpABt5rl4R+dZT8eTqKNDrGB8yWeFEsEU4qEjqElbrPuVJl
         QQ6SvXVK+xujAn79QqQdgzRkIXcVOu7s7iTMvEetbZly0O7WgdoSlliDpk+dPe/QzMeQ
         czb792PowFNu9PGZvmiTI2X+l6LUvjzl2kolrbHz3Sg6PTd1QiNi4oR9aUP6776e0NRe
         57ozFEmlWpk7d1s+SNXXgmYcy4ZuourCv/Mbm1TPWKgY55QwiBzzz+MnnNhNkXrxRpao
         fOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770990386; x=1771595186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWonhiqYUU/I29T36MDFNW/Tu2hXhausVUNKOlQeMkg=;
        b=EFngGD0ySy0HFzcRMcmiQvjOG64KqwY6nNSBWXZ3jlX5hP1r1KtUjzU0tVXIa9d3mh
         cWQAnVROYN+VFT+YZGAj13/11ZYBjAWsshkOVsf8Tk/dK2SPuwmJ1FVp/iodpY84Y/Iq
         8Lru1q5MfrmDm7K7tE0FmvMM21BEVuK0nIM+BLPJt9iIQF4cdacu4Ou3rkYQVEruHD6Y
         XnZF/9YlTdLvCmH6EiGRSODk6SO52ScWwwza0JOCXwuiyl0+piiKpXap8N4zt/ojncPq
         iKaImxUHKvG/Fp+eMp0ZsGHPFhgqff5G+OQkYsutO5SXeXSF6d1VCWGXNIF2lQLkAev6
         nKzg==
X-Gm-Message-State: AOJu0Yz5dptTd3BpO3SOYQ3OtgB9yXGR6B0YW54feZkTNAZWk//bjd1p
	VEIAfdUGC5EqdInVX2PTaeWluaNzMrmSrYyy/A09AWLPbusYTXJuAdTs8W1BC6r6BdI=
X-Gm-Gg: AZuq6aKsMU5hQmQFLEDd2JlWKrRSDAY3f7Rcy61lgilFgoyejL+9XeaXJsv4mWXFr4+
	lk6v+SN3HqDdaHCUlGMVdgzZFVX4Ro6KVmpCPw5KkYkNnTtz7jeUqBvzzd1ctNNw32hEmXvSJs9
	PyHhgQ1d7/2rQvsS4cR4iT4roIOLGZkQQGF/3PewLQyoS0AoyNNm3jFTS4GebucxRhpiY49/equ
	7dj3vc/mqbH76P67Mrr38qmS/B+wsoe1C3USQT9jmt48dRUmZPIckeExsGcd5uUholOR5Hk+DC1
	Bjv/xX2YbtMi5sayZVkTnW15dVaat9HKM3Z47hT8on63WsD5H68lCk2RI2B1mP1bSs1Wx1YkBP0
	0pqbU8iEGd39trjV1kks7BwHu2ZiS7gi+zNWQbkHONCbvEtKLOqsOhmI6fz5wa+Tj+jKly1YU8T
	BCWzbz3gvsLOOMehQyEcHqlHU49hiUMkkXkMwxApYF
X-Received: by 2002:a05:600c:4585:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-48373a4f1e6mr26489305e9.29.1770990385997;
        Fri, 13 Feb 2026 05:46:25 -0800 (PST)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a2998fsm17198625e9.17.2026.02.13.05.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 05:46:25 -0800 (PST)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH 0/2] media: dvbdev: Prevent a dangling pointer in dvb_minors
Date: Fri, 13 Feb 2026 14:44:14 +0100
Message-ID: <20260213134551.1294954-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.52.0
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
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52738-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,syzkaller.appspot.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A60E3136757
X-Rspamd-Action: no action

Prevent a dangling pointer in dvb_minors and simplify error paths in
dvb_register_device().

The main patch attempts to address a syzbot report in try_module_get() [1].
The report provides limited information so I'm not entirely sure if the
patch resolves the specific issue. Nonetheless, the bug fixed in
dvb_register_device() is valid and can be reproduced by manually injecting
errors into the function.

Note that I don't have any DVB device available. I tested the code only by
writing a dummy module that calls dvb_register_adapter() and
dvb_register_device(), and by injecting errors into the latter function.

[1] https://syzkaller.appspot.com/bug?extid=71d5d861d9adc6905054

Petr Pavlu (2):
  media: dvbdev: Prevent a dangling pointer in dvb_minors
  media: dvbdev: Simplify error paths in dvb_register_device()

 drivers/media/dvb-core/dvbdev.c | 83 ++++++++++++++-------------------
 1 file changed, 35 insertions(+), 48 deletions(-)


base-commit: cee73b1e840c154f64ace682cb477c1ae2e29cc4
-- 
2.52.0



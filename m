Return-Path: <linux-media+bounces-61242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG4PH3v9AmqrzQEAu9opvQ
	(envelope-from <linux-media+bounces-61242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:14:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5D151E592
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56D83307E65F
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A472C4C77B3;
	Tue, 12 May 2026 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTxZbxHM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D974C4C77A9
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580554; cv=none; b=GU7/be8g1ybOSot+/xdSbkeQq4MasAay7Hqm0FYfAzAbBKMWaXmjZaQo9566fCyt6x0JkgOCm23Q1Fb2F8FuMbY+DxR18OwAJPNPF3AMGcRhpFro1I6N7qC+gK/ja3n6/gF6rKyCgkGZ9DxxxDXk3fJuRwytUTcaPzo5Rpn3x/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580554; c=relaxed/simple;
	bh=SVEQGXIbMqohrJs9zpmIizHMnqWKm9bWuTcRI+b9aC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jjznuhuo9L10+IYvE2N9iWG2f7zT6Vo7M8dq/nxAMtuGZ/7dNMTqR5/Bekfa1ADUMCIzF48O1vHQjB/g6QaYVP6NvMKp8spLBjeTLS440WC6/aixu6WuUN5dIqvbhF7L3roZcIw/QECC3WT/6mRba2WugTRiLWArujDxZKv2aYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTxZbxHM; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd0209f25c1so292319866b.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 03:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580549; x=1779185349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZC6Jfvq7qJEustPvUJtSgk/boZ9lHK7Ab+ZItpNi80=;
        b=PTxZbxHM26oUA4rCdVqhElbzw6RxmQWrMMobiWcP16pWcfnKvgQlzcXILsoTcLS6Vf
         ONX2piwqRwuDXSCAHPur2jmXSBaEtfkTM5jkvmlGVHnn7dnBS42frpj8SeDuz3SqbM+Z
         P9M3YlsfMIQomm7cW4m67BfUfyOAVEP5iiDrVHrWm/6I7voZpCfPnMtL9j6ok4ULTy6d
         cbO02y/AQNUu0BHuJweAsfvn3f7jlVoxezBafZyKldPd7EYte0KPoOrQqvTp9U6gcRht
         YNmroFWK6PkDWiQiZwL2fORuE5bdXNVhvZsJSOym/f8h9L98khAxuKodT+b3dEt25POI
         FJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580549; x=1779185349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZC6Jfvq7qJEustPvUJtSgk/boZ9lHK7Ab+ZItpNi80=;
        b=QVcNnqUODQBrmeOF/Tp2Z8YFNkxSOhhem8TM1kpsLGgnNGhV1pyeXbYS+aHMP3jcjn
         m8/UrUzFDa1W0BRYQD/p1EdXcQDOTJI3BOLwrybGEkd2n1SBTaBH/0aODumSsr7fUYmx
         DeGsJ5xmYao4nyhJ4SCCUmjyxxDG/zlXl126IJGHX8MRmWcqKwztNMz0zcdl78Fi9pew
         nl+a3MXP7jmqc43PQiDyKEBeEUMm3T8a4Nc6EoqsLJPS7dpxUu7+Q3AqwejdPAb4oSvO
         n7tSWVMDPRivccBgNgSSw49upL26Gk8d6Ay3Ei6/q5FoQoAXW+3vL0Oa3Ap5B4/3c3nS
         VG8w==
X-Gm-Message-State: AOJu0YwYoOjJx0MSLISK6Glbuke0255DUaCny/4CF6p+xtuE4KQZ+X41
	PbPi0yu3ahXIEiFh7blCB5SGEr9MJdsKlGDoInZh8pC23EvlSc0mB8be
X-Gm-Gg: Acq92OEsWest5ieH9rZfNYSCgXtRWx+/YH51+BWK4ypnVS4864WsgY5vxsi283nNhkY
	65d8F0PRoPh1CLDbeV5uU3c6hzTXfXYWtl+0eHBaEW5c3Dmg0LkNRt4hMwDJfz5pxnVCh7Iuu55
	LAefHHedpZsuB6rmyCsXSga9bFjQnTdGah4FtDj+bD9WrwdWKMOtmzCmboW0Lk+nPENKg0WVg8P
	VrHw5PsHM6uw9qQ3TRFbjAj/nUpG6xuCfzwccEDfmUyy+wrFlrP3RnAQfv4NgruS+7p6LQKKU3K
	m/AmIUNhlY2ieo72i2LOXMIJhdHL0SO6RcKsELN5mZXw/BHRQcX+yVJ9KLDDdvCk+XkKvJDMt/f
	4339ufAsADTtZV6nf4Au5gVUDRRTC6ivpmsR15886b+IAD804IrkqTyrWUXx60smax0sTw4Kk8Y
	cXMBw6KdP6AWVd
X-Received: by 2002:a17:907:c0a:b0:bab:e742:aba with SMTP id a640c23a62f3a-bd28fcaf72emr141499666b.42.1778580548777;
        Tue, 12 May 2026 03:09:08 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd09513b8cesm265185266b.38.2026.05.12.03.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:09:08 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] media: i2c: mt9m114: Add get_fwnode_pad operation for IFP
Date: Tue, 12 May 2026 13:08:57 +0300
Message-ID: <20260512100858.54493-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CC5D151E592
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61242-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Currently, the driver's binding exposes only one endpoint, which maps to
the IFP subdevice's SOURCE pad. This configuration causes failures for
many devices using this camera because both the DT binding and the
one-to-one pad mapping logic map the endpoint to the wrong pad. Fix this
by implementing the get_fwnode_pad operation for the IFP, which correctly
matches the endpoint to the corresponding IFP pad.

Svyatoslav Ryhel (1):
  media: i2c: mt9m114: Add get_fwnode_pad operation for IFP

 drivers/media/i2c/mt9m114.c | 44 ++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 10 deletions(-)

-- 
2.51.0



Return-Path: <linux-media+bounces-57154-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE40FyZDxWkU8wQAu9opvQ
	(envelope-from <linux-media+bounces-57154-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 15:31:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DEF336CC4
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 15:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 307B231805F4
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0463FB7F8;
	Thu, 26 Mar 2026 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhFA4leo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8383FADFC
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534889; cv=none; b=LIhiS761rlcKeRSs29zUXjtGD2QTgysPTr4ue9CGjnqz55aGPc/vz3nLM1DMUiyY7cx19Z7ohgWJneveZdJQnu8tztRCl9OfdMBWR0ZXK0zPCsmspoDYo97MzPKTRw/umkqdHcMjvKDV7+TigaFNHKiTj9o3Lq5R3Bfdsl3JDS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534889; c=relaxed/simple;
	bh=YdxtXRzbUon0Suip1nolQokx3sF78WXUYC/qaFRrDdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDI1tBlHdeO97RQHzrZKx+z3HWK8iUW5c/6HF6bRN8R25ngEbyXarUQM1bBcpCstThoMKEZv0z3hN3gVgXQ0oQOa0quCMrbwdzb37BAMQQpbH1gmwTXEQhI0Rjw1QuamGJkNmKPqXY4aW9qMzuavdfMHCSr1wCQiBhd+9BpkmS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhFA4leo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fb439299so9852775e9.0
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 07:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534879; x=1775139679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0l5I1F9moM5sQoUu/0GoT+VcNa3iSU5TZJUAB/qPwo=;
        b=XhFA4leoPkIQSeV+O35yxt/KXACqYBmUSHz7WqYhDSe4z6aTHiARt5ELOJiFAuB/Fu
         3c5z5SDhUbHwqFMWYnmNpq6/ylYqfL6Otl1l1pFiAAU+uLQctog3EMxNIBfWSz1gcH/0
         FFEgkQkgwuW/YR7upMoME1MxGa3EyXqMHCCgG5OE7KDqR6/z7bxLG6SU8sBnz8Viigfj
         7DxeYLk/Ooi/x5wu+PI0n41Eb+AjUG+DgErvSQRV+z3zt76Oigb1+9IC/FL6dgjs9k3z
         O9XaNx9X0knvTGh6He5hJMnZMRLnkrWzoIVo+l+Y5GsMj/icSZQTdYinTSzZ4sn8TEGm
         Rdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534879; x=1775139679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0l5I1F9moM5sQoUu/0GoT+VcNa3iSU5TZJUAB/qPwo=;
        b=Kilg4vV4plmZHKlJqgNHzqkCz3PgZeJ9EShQLH91yRhkQiNrbGuGQwxJhTCPXgCg/s
         WBJN6RIfV8UpoWK7K4QdaouNEvtzAWTLfnKX1s/D0IJ34FRSzgCKIgB8zVVAQeImKyho
         CojUryESz8RaTofiG9lSOtIn3qtRojtnR146SNCFcMvFSGE7gDK2ehlb/LUN8kVcqMci
         yfrzBjY8g4qa4OnM2aPmOA8ybnnjLcBq/kDeJmxKorVk78F/P4z/5V/QjdhBqMnrIten
         gH2XDHRjB7nnazIV4dUXGVmV0cjxBks+r8QxBqD5cGy5ds4TBeaMnPDRqgFE8GSUmN48
         RzKQ==
X-Gm-Message-State: AOJu0YztF2oMWO54XhW+gOWb9L1JIHxp+Ms/IIJGmnCi5OSTiiZt0+5J
	m0NckhvMSdnYVubhq682KiFP7Uu+3cBr/LsR1x+l2bLpOVPKdrI7DaNG
X-Gm-Gg: ATEYQzySED+4SP3slk4idsHPYgS89owF5mVpNyaFBJ9QugYZDTxh+ZJ3B5kEZ60Iun0
	MGsPu+9SnC+jbl/rCTqGmSOSlY9S4zOBuPNOuamx82a+KMQ9TB54PIH1beqWJ0wnyFkF4gjTDbK
	cS8WT5GvVu5EpT94QNjakHto4GRGnxzBnvOC7h3yXRcDdgXcpigiAkJ06wWnvLtpA4R91mrxzyv
	XUXwG8C0y5U68vEePlwXHzaLXSdUx0cX3MLAv7uaFgnroo4mCIp9IjACtJao/AbTjTkVbM1Q5ll
	lQF62Z9Bn859vuIvJWeQZWZyJVG4UBLyOgusRJhdoq8wQaB9Va3N736PTqsZxWiFlqDemvwjdE+
	rRjNlSujZO9T6FWC1DfihjNEozTovRmLlVdTG6kjwpH/abv1aNJSHxmxLknwEZ5NlqP/BJNN4Xm
	CJRhrgUrQxIDdR9hkvfu22afcmlfm8kpi+GF8bNouifpFA2626VFeHDjC0pNZXrma0hVAsw0jXA
	6D3+KNW2gauH9S9FCzJL1ohzdCdBqqMD2kFoQ==
X-Received: by 2002:a05:600c:8b2a:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-48715fc36aemr112442945e9.2.1774534878663;
        Thu, 26 Mar 2026 07:21:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:516a:f94c:8d31:fabd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c65989sm63574445e9.2.2026.03.26.07.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:21:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] media: ov5645: Implement frame descriptor reporting and convert to CCI register access helpers
Date: Thu, 26 Mar 2026 14:21:05 +0000
Message-ID: <20260326142107.297811-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57154-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: E9DEF336CC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series implements the .get_frame_desc() subdev operation for the
OV5645 camera sensor driver to report information about streams to the
connected CSI-2 receiver. This is required to let the CSI-2 receiver
driver know about virtual channels and data types for each stream.

The series also converts the OV5645 driver to use CCI register access
helpers, which simplifies the code and improves error handling.

Note
- patch 1/2 was origally part of series [0], patches 1-7 from series
  [0] have been already merged.
- patches apply on top of media/next commit-id 0e2c4117c351

[0] https://lore.kernel.org/all/20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  media: i2c: ov5645: Report streams using frame descriptors
  media: i2c: ov5645: Convert to CCI register access helpers

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5645.c | 928 ++++++++++++++++++-------------------
 2 files changed, 456 insertions(+), 473 deletions(-)

-- 
2.53.0



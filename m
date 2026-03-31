Return-Path: <linux-media+bounces-57817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM+2FNs5zGn7RQYAu9opvQ
	(envelope-from <linux-media+bounces-57817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:17:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4D371824
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 277E2306DFDC
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C054508FB;
	Tue, 31 Mar 2026 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/1Q7k2Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA65450903
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991826; cv=none; b=sJXv8sgtv7+zxEkDgSzEiwPA03OOH0mX5mz08qkPqsIV/zIGCZ04U0H4+W9vc7bUkfKH9b4K52HebjBpWubn1pKeKWSjQmbiUWpCyzSy9MaPPJs34KL/r+ockMj1LUW72w7n8uvwNFL0Z7s4N9xx8E9Vl2DMPZKx3fewzH5ll+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991826; c=relaxed/simple;
	bh=BZg+POCyc0aHse7ifJCDTBN65JYsXS0lgfnAw42OYyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=INVVPTIRHj/4pwM55UEDbaMekL6OE/Nw6Fqv1/xt7bfVp5jbyTQrB03pL7Nn3kStCpXrZfaXDkx8KfnSn1Ywjik0dLBQq0yWBj8KKGNggJO7D2ghBXDWRFEgFbMV8U9BAIwI06yojuZdoKE/EUILoZ2FI+W+RLaG8tH6xTup5tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/1Q7k2Y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-482f454be5bso2992755e9.0
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 14:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991822; x=1775596622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PAOrgazS9H3VM+uxXKBMbAaIq8gwz/zdEtYxUAlRNo=;
        b=X/1Q7k2YVvPfJDHKmt5YDHbrgZTEXclW2jukw5BqSGQDG9dO2cyk3WBBBJlSAZRTSf
         APXdVwFPtYG/4qiqyImoVhPW1dmXO8XvJxu6uN6+xTdOciUUPT0LIfMfDYmW1Y4eRr1y
         5PbKKK4riZia455LEjImb2DzXbVVVoIPCwfWTq59QbvERxG5ycEfDdrUfaz6mRfSzkkK
         aP1ftw9bd3QJCb4dNSXaZwtuZnDltuOhdP7tuh7rQMC/xadIDKDx1vqGa+iwDFZPM/Rl
         eacxvZzzOyLB4lmM+3OMewOpaKlzYSzOeARIA8TeWbtFWMzThzmLUk9avsXo9Y18gsrp
         LPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991822; x=1775596622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PAOrgazS9H3VM+uxXKBMbAaIq8gwz/zdEtYxUAlRNo=;
        b=QYhq/pKmt9duOtRPUkMxzqtJZWwjnYXYhWYYzRgto8q3aJvcRnhPbKJR7HAjz4cMdB
         G+wskMZcZ+8nSpWbYXON5IaKc5579l6OpLYfI5OFM1CCqJHMpi99L/CQe+GgsKL/U5NO
         QUVfutiD97gWivdoiGizFxm0o6ooUYTwfkll915LXk3MyZ9KeDLlmqVjhsE5cFdsNjzk
         Hp9XokBck+GSVgINA/NvP2yUSqLVwmhJqaViubkYlzhzZUOmXrQgfBpkSfO1eBJCJ5sY
         2QQzokHt3GMpsr1Fgq0cEoikP5xL3IYeEyaONultJD8X6MX74/Ltb9ecIaANwmaop4/s
         APVg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ0GDLSgB3T/wpdwqP+hekOEc9lbpUwWpL0vYrza+h2Jx3TFEG4GX4dElHpmRmrGeP75Vkl23XUpAceQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRUCxGBisMqDEFvRSXT512L7d7AfrUghbCEDlgjrPsDJyvjBrn
	zg0HrokXInY8n2WCTmmZoZXVcSXPtnm55sYIOQJzkjUmeiy42ry6eiaD
X-Gm-Gg: ATEYQzzAkeSKzBjVP+bqBk51FC3MiiXJFESupUa/tVOoRILn8eoWxsLP1bpXKnhXOsi
	05jgqGPl52w5rYXkbm74i8sfEYG7j/mS3iGVD9zMsyqUXq2UPIka1qAF+epboZy4GHzzib0MCtk
	5SNm/lwO/EiQVadIPJ2exHyXK/tGYLscWT591N+7CcA36kjT4m67NHViNP9/k8MSRIlE/wHSL+q
	usu6SlINCDZ41vISyJSRmCPHml6kRcUGNd1naew2Eyyv2OSEWtP1VPGtxuJf4mJWhpMV5nc6WKP
	6IDCPYWF1nrPxygjX6ueg1ZtAYphudVpxPVMalghPiErPUOnrwppQOqcCnoD3b2fpsaJG/F4aUO
	NVoggyEJHT8fLdWGsAh6aF6ezdQFn5qhZrEUGfs97cTaCEqj/QAak7cYFuA8aYcRkaUxdzb1AI3
	Y9upE6MEvrvbohKwuv0F2jdS10gJ270tKhZvbmgkxklSCV3A==
X-Received: by 2002:a05:600c:a51:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-48883590a07mr14626735e9.8.1774991821421;
        Tue, 31 Mar 2026 14:17:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:186c:aad2:ccc1:5aff:fe8f:d494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e81a2cesm66051735e9.8.2026.03.31.14.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 14:17:01 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] staging: media: atomisp: clean up ISP configuration path
Date: Tue, 31 Mar 2026 23:16:10 +0200
Message-ID: <20260331211649.421777-1-azpijr@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57817-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BEA4D371824
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

NOT TESTED, REVIEW CAREFULLY.

This series cleans up technical debt in the ISP configuration path of
the AtomISP driver.

Resolves a long-standing FIXME by gating ref and TNR frame configuration
behind the ISP feature flags that already govern their allocation,
rather than unconditionally attempting to use frames that may not have
been built into the pipeline, and removes a duplicate call that
overwrites the same cached state with identical values.

v2:
- Replaced NULL checks with feature flag guards to address the root
  cause rather than the symptom.
- Updated subject line and commit message accordingly in patch 1/2.
- Expanded commit message to explain why the duplicate call is safe to
  remove in patch 2/2.
- Updated subject line in patch 2/2.

Jose A. Perez de Azpillaga (2):
  staging: media: atomisp: gate ref and tnr frame config behind ISP
    enable flags
  media: atomisp: remove redundant call to ia_css_output0_configure()

 drivers/staging/media/atomisp/pci/sh_css_sp.c | 41 +++++++++----------
 1 file changed, 19 insertions(+), 22 deletions(-)

--
2.53.0



Return-Path: <linux-media+bounces-57985-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMw6I++4zmmTpgYAu9opvQ
	(envelope-from <linux-media+bounces-57985-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:43:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E01DB38D52E
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CCB730CC914
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 18:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669873E0257;
	Thu,  2 Apr 2026 18:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su3eYBMC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC053F075D
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154870; cv=none; b=oTbNmVx9fViToybXAQqLjEy1ZBa1xzrlcbGJ8fLdmC0kx1+YORH8ORlZ3/nDoq8PtTTt0nmlphzvKXI9JQQgljnfSB4lFLYYqpUzXdAls3vKZ+95Zzx/v6Qli/ZMAptgJT3rxldKlgJYIaDCvh9yGYpe+2W9+aI4RYxTh81Jl6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154870; c=relaxed/simple;
	bh=CVvofp7Vg74mY4dHHHowldMJYz2mg2rj011qUi0dVn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seuNGyVsiPejJobMMsjrgOGvS979zuJBkOmVpnP909cFrIw9DCu/KHWF8fCzU77vmChhDFi7U2rdGHanaWHFhVPaj/77Hb6SbFlG+N/iVe4yMkevlu9H20q4nlJETKVb/pDeTwSLhf7/zVooFb7JaIe81TYrejk4xLnPCfdL4Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Su3eYBMC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so7791295e9.2
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 11:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154865; x=1775759665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6esEg14STtARc9s+P9up1gj8wPgvzwV1KQLA/9K8XI=;
        b=Su3eYBMCax0gvhA9GUfG7BJT2ITBYCCyTdohhfPa4gtPvUBuHmyDOjorDQTnAhShhX
         +K1txJOqr41KvBFHLf4K3+KCTuOEdumrQfLda3MzxM9V0+NfnZX9zWwcpg9YnV6Puj4I
         8C/35g4LaFLwEaiaXPQvaqI5l7PGGNPE1OSRz8ZvVNVaymFwYrPihQWJxwSh+TKpy9a8
         NVq0giLTe+5vDoYV9fAFqTLgOIx08jfCm2fWO3qlXS5d8Exzru/z7gXRr+2nduyigIMC
         3kYnFGLQPSpNW5WnHM2Zc5E79/6qHkj2zAWe4HmM4PN7kvxhwwnCghPPGw1AoNqXQ3nM
         zSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154865; x=1775759665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6esEg14STtARc9s+P9up1gj8wPgvzwV1KQLA/9K8XI=;
        b=m9oGE9jeuyeme7KTasYnjFEJ0AG6BFitO5iEAjrR0bGHcdoIzLQAjJa+Mno+VX3QTO
         vIxSGtBEKGK4ynAsz8dPYXKxbcmN72A/QpY/9HqtH0YbwJ3UjhGNve7NUxnSwlzOtvjY
         rBX+1Zbq84hdyfORgFOrs2sECJHq9bac+v+MKFcnxLF6VBv+qePBS58teAQHl/dDVjIh
         DtgV0MXIJ0LC51RXAjEFXoLkyHRspGSgKs6k7ijWzQE1hHmQ0sFJx3qyURtXWiadOTY/
         hsqmsiMFlWrBZ6+Xtzx+MvJYOtffNe9DP3HFcB4iWuJsJpVDcnlMJ58lX4ukwmoRDDY3
         rRog==
X-Forwarded-Encrypted: i=1; AJvYcCUxXgA938jhcSa2pFzNT6FyCdbAeysD6JSo7DI/oulqaRukwT+LmfB2bGDXDtYvvRUWJRCKLxae6P6VsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4Fqc4fDSkQI8CEKuMHpO7Qtbn9DyIMSfI0Zm3B15RzgzOcla
	31h7eNwqn5meXytIaVTL22pruZlVzwjMjUGjNz3ejRGE0cLorLSZ0JX/1QL73A==
X-Gm-Gg: ATEYQzxYan+jYiqUP5HRAoBsd0jw8A+0jzFFXCfiFsZwmdPrjgniEd3qeov7T64ja29
	vaZW57SjPxkcsd+5dG8ggdn7jUmpJhZYvxkD6janEpRW3aAONQ+oGbs6WydgMHNwYSdft+4QAor
	9yEl6gJSdBvtMLVl7JsTEYMA/XcKjpfk72EEX5mfR+odk992Slm9PWoLU78nsMYIj+oYvXtsXHc
	RPZg8ziIJdg9aXeOLK6zMoW2fcaWc4BaLH0ZjTl6QpTo+ybXgsZHL3FhLZ1Svs0OK6pWfA0I9DL
	kmZ7fQdDZJTnPx96zsOVencAPQx/+fjdogNIOkWTstRJ6fTHyM9KQTGKq1q5yo33PzCHK4k/5LB
	HLnPPsUSylzFU6qJxmHy1jcWvYM1MiEl0SfWUT24jwvMqAAMF+t0ZZq0CP03nA44M0bpCdX2gqd
	kUBenYz/OJ8xDiPZTgVWcNibeM6eo1sqdjeiW8YL0evGcm
X-Received: by 2002:a05:600c:4e14:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-488997a44edmr1227295e9.21.1775154865307;
        Thu, 02 Apr 2026 11:34:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1cc5:ab9:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm205797825e9.1.2026.04.02.11.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:34:24 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 2/2] media: atomisp: remove redundant call to ia_css_output0_configure()
Date: Thu,  2 Apr 2026 20:33:45 +0200
Message-ID: <20260402183402.444630-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402183402.444630-1-azpijr@gmail.com>
References: <20260402183402.444630-1-azpijr@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57985-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E01DB38D52E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function configure_isp_from_args() contained a duplicate call to
ia_css_output0_configure() using the same output frame index. Remove the
redundant call to simplify the configuration path.

The ia_css_output0_configure() function acts as a configuration setter.
It populates a struct ia_css_output0_configuration from the frame info
and caches it in the binary parameters. Calling it twice with the same
out_frame[0] pointer merely overwrites the exact same state with
identical values. It has no cumulative state, neither does its order
matter relative to ia_css_copy_output_configure().

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index abdffff41ae2..2beb7168517f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -792,9 +792,6 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	if (ret)
 		return ret;
 	ret = ia_css_copy_output_configure(binary, args->copy_output);
-	if (ret)
-		return ret;
-	ret = ia_css_output0_configure(binary, ia_css_frame_get_info(args->out_frame[0]));
 	if (ret)
 		return ret;
 	ret = ia_css_iterator_configure(binary, ia_css_frame_get_info(args->in_frame));
--
2.53.0



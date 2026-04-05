Return-Path: <linux-media+bounces-58061-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ19Mhws0mn5TwcAu9opvQ
	(envelope-from <linux-media+bounces-58061-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 11:32:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8C739DFD1
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 11:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C8FE301CCFC
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 09:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DCC3382CB;
	Sun,  5 Apr 2026 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZC9p03R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF33E2E2663
	for <linux-media@vger.kernel.org>; Sun,  5 Apr 2026 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775381477; cv=none; b=jLCZPNIKjWnS4TnzvGkUdSCgSmthZlgImI5kP3d49HLwLXPnOffMTk0WcXw8EoFpQ3PzVum+iUdLAaw1bYdSilXKmliTPIbGwI4hbU15n/A0cCyQBDkavK1wxwf/LXOYpmCnPhnH0uy9GA9AdYNBKAim2YXq0h1kdtWNAleNI5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775381477; c=relaxed/simple;
	bh=ErK4cyjYPm91+zNjvpGOJAvbVwIvmcEeItVbsI1yMSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUGOllP6KoOY7maPV2vmwxk9fl1Tuk5Wz1jH1T5ISstUJiOJAlD7X+k4tJ2LPAxbHXqX1F18q1PzNX3X5PHLrLftycBALjfwrxzSyOTuINKk8lQ06s+72IioNiKAtQOZbaSUP7UboeiKgyW/YNUsSc5dVvAgstikMeLfLrzVfBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZC9p03R; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cf7683a28so1790104f8f.2
        for <linux-media@vger.kernel.org>; Sun, 05 Apr 2026 02:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775381474; x=1775986274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXMWNVHfumBchZlq3WtoZ97ns5eMXe5atHuWyp6eKiE=;
        b=MZC9p03RD6+X91pi1MzkSwpjjoHE+3kgHjomxJKGungMN1zNxzWIdD2Eo2L3DXD4Gr
         41zoBFQ65ODFk93qS97bZg55ud6iMMiE9ylAR3yMr+2u/A5VpLX/9io3lFx4cx5QaPjF
         FGo+AzpZmIICF5+489MD0/WNxIypXZZDyJGLT1r76RbE9VyZFx1g1PZ6bx922aM/HKUZ
         6V9SK+03gEH6CiVOPKIgbAYoBwjeh+sW/M8ulSLyJX6V0H/I3VGxZMXxWUMgXc/4vtXK
         Z44Pl7/fKMt+JwJvOWQIzFpcqKv+/17Gwe8Zh0Qki3OZFMItvqxrDPc6rEz9w9KVCO0Y
         aRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775381474; x=1775986274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXMWNVHfumBchZlq3WtoZ97ns5eMXe5atHuWyp6eKiE=;
        b=L+3c8wtnL36hZ/COQkp7H7mLCEYq6pO1LplC23ECQP+XBF6ekGgd6mqzXHM6JHqxxz
         yjsRLFWsmhxaM9bNHuudpUXKeeb6U5VQ0aHXRfFyLysjpJJlgbduDUQE+QI0L2oj3rcA
         hLSz1S/uBF6/R6zhNiZc9Fk4Jb7SHub6CWhSBZWYXW1YfZ+YvAJnw7qhlgFhPuQMsG4B
         RcGpafMv/8pr1NAZ2icxhyzkfX2AKv2hhlYSH45e3V+tbbJPWedsF/+dupixE8YxP0Qt
         PZnUdE7VA8zI5umIRQkX+1eLpwy3WuqFOT+q0Pzg0Ag3iaHgBt06qjVwoO4joRBSnjkq
         Itog==
X-Forwarded-Encrypted: i=1; AJvYcCXGWfFtMwBO9vem1wCC/B9a1+88cIU8bIjsQ8vvyNgZAQ2/KVe4verV32Sr1JC2+SUUUZkvx/T/IpoHYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzstiWEiMoHVlBLiXLnOPT7wF3lIa6R3c9zI15r3lSlqUufxFVr
	7qAYgvFF812S5rLiTDruEsWdSBhLbELj1NWkFZizsrPHFWrqojINpipE
X-Gm-Gg: AeBDiesRk0KYSmGZfijDN4FMyLoEpP4CjYRSruGTutFcVju8715qQpBab0RVrlgruBN
	5C4xDW4/Y2cv9wF5DMydXsHffAkUzFl4uPDqQT3/CBDfDbSX/2LKkVl2pAETbOzmLbWCm7oJEuW
	fS5oNJVHugbNNtQLQLGwKuQUEuXLDXvc0qJBi8J8cU0wZBwIpOChgpYs+/+d7Yjj802rfhJwvfk
	Bjafr+y2TPrkXSZe+n3WMRCO2BQMKsZxppS1/+KRDC93ZXYq0zK1Shm5YruGZGMc88BzkZ1Pu2d
	kkMXKdsXPzQiCzVXvyda5W7QIm9f10LTS5EPFyoJnDzcplDjKFqhugCFqBjjjKmdN7fenHh2LpY
	mGi7t1rjk+Z4Jut1pTEd+MWZ87iGExBjoAa4vBhvx+j5ZeQqBFTpVZjw8j/vLkaQJ3bg72gvN1c
	GjLk8DrmxjUYoMw9zk91N45Kyi+GKz0XvgHnKAg4kH1Wa7Xw==
X-Received: by 2002:a05:6000:40dd:b0:43b:8858:1146 with SMTP id ffacd0b85a97d-43d292e7fd9mr14331002f8f.41.1775381473697;
        Sun, 05 Apr 2026 02:31:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1c83:b0bd:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm29156707f8f.29.2026.04.05.02.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:31:13 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 2/2] media: atomisp: remove redundant call to ia_css_output0_configure()
Date: Sun,  5 Apr 2026 11:30:44 +0200
Message-ID: <20260405093051.515222-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405093051.515222-1-azpijr@gmail.com>
References: <20260405093051.515222-1-azpijr@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-58061-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 2B8C739DFD1
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

ia_css_configure_output0() writes into binary->mem_params.params[], a
software-side DMEM parameter buffer in kernel memory. The ISP firmware
receives these parameters later as a batch, not at the time of the call.
Calling a pure memory write twice with the same pointer and same value
simply overwrites the same location with identical data, there is no
hardware interaction that could require repetition.

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



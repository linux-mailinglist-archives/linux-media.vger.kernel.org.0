Return-Path: <linux-media+bounces-57819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPbuFKg7zGlyRgYAu9opvQ
	(envelope-from <linux-media+bounces-57819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:24:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E5D371B07
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E49330EED23
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B7945106F;
	Tue, 31 Mar 2026 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRaQS+GL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45332451069
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991834; cv=none; b=N92TiHwS0dchbi4uAgj/nsePchNDG1fXqTNjoNXf7MJqD8wZt6hNU+xkkTexE8jkBrjXm+T/K/Cpw4s5+cs6QLn7KS5QsO+gymXQ6A3TXVtTo/UAf83nbwLzu47fI/9o29aCGHsxurROnbEEBrAwd3p7YYsp4Nuf+THvcRnCRlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991834; c=relaxed/simple;
	bh=3oMKl7iISXwsmQM0h6bGA4O5PSq8oNdUj4ruBdpAxdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPqBQa/RZ9T1ykCpH8ODNrDu5EwOQuc0ETqZmo2XOdEZqNU4NdllgSkmtpVzm4ERtDdpwKKAktOniZo5nnwLpfmhijp43LqFeHTmhrBOy1h4P8Ouc44r3Fx7itGp9BVhvS4CK1F4XS8RnQu10P7NTzmHL1hlfv1Xg7Bcx5q2uzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRaQS+GL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so56464135e9.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 14:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991832; x=1775596632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPr1msy/Uz93YOgoBLpvLRDM0Fch6NuZ4BU0Vlvz6Vo=;
        b=fRaQS+GLGNYAtta6eCQswKo17O9KO24C6b+dt62Wz4s9woPgHSQNZYeqlEzRSaj4IM
         TA+68bjw82zjgm8isEl1gkmwqO6ucHWW0Zb12LHNJEUxg3M0kgyLDGIGSSpFJz48h3Xp
         SZshXIzi/nmZa++CYXPmb5a7swMRQOU0kv67mpC3PeXuWdqs6WhC3qnpuz62dEqeqn0m
         pQl2llgzmt5SnVYb5lV/dkbjOaTPtvscZR4Pm9YgnQZKXLxvqAVwIhi/mzxq8V39Ol3c
         7469EXSECCC1Zlj24xx0IyVNUYocd/9np3khTL+oHBlnhIqyvpYbTuO25nCP4n0bIU72
         tBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991832; x=1775596632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPr1msy/Uz93YOgoBLpvLRDM0Fch6NuZ4BU0Vlvz6Vo=;
        b=hV4pLlp7zy3EXBim9RN3+j5AZbY/VUXU29seWFboMNMhLHgooLAn2AcqBkpbg/63v5
         TvQbeBHZtPNrgk9rPf++qmq5OUmGaWhtj6JSAfOXVxOEFnLuwdUYAbpi2Ph43Oe7j4PZ
         AXorgGu88cd4crXzJrj520WWa49PN4ssEo605pJMM+hquICXu2wvv8Qyxvqrdwe1lAgc
         xqFObso5PnmlYZ162in0ZPClszZnVvqhX/FIr13xBMJd11kFwmk2vWVkBLKNyhOpa2J5
         bsp0Z75854Zn5Fl8iWJbV7T3/dYhlJtSIZRKJiZQa3+g5Qm/NI6YD/KpwM4FoKVR84v5
         v8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVzlnVVlx9Y3VG+dAqLsRzRzOoo8f/a3tbf1stwgbf9K4FgqTnsLfXIJRaV3FY5i/yPn3lSTbO1FPK0pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX8iY51rL6KYbHGpl+onwhFitNCYZKctbKjGN6mukljYoTjkQz
	ykdL4GzUUNwruoc3b3Ujwlx01FncjW78AcJheJWt0Q+Q1STLUCQxYkmCH2zEksux
X-Gm-Gg: ATEYQzySbYCPx6ct5YVnrUuLuXZGB5jiqHSW9mUbp5tiDlWPMfJoe3oXty6QEWAIx1T
	Se87bShiKK162dktJ80mtXxD4hVyVPls/GMMCdNZWT+ErfLtcI21B9WbhGeEL2AcPqnRdQlF3M4
	Y9wWsn0jPYX712oUgro3eIS/LSi0tc4Frsy2+lGmpYZOxRw5FRx0peNgDZ+E6WIElia5Wq/x4FX
	DPBgnWfFRRqr3T+YMmYx2lS5hI/gkT95ZpvgA+FqM+lfemXV27ko1bk8R818ktM3+Mmu6YZUt7D
	rWkSQoKtWeSG6QRy5wQCPtwFOu9ln+vhm6QdsJX8sH2RgMHS/7PMFC7it+frxqUjFFw2wgUUE8Y
	smL5KM9mUp4W50xVAYi2JG4q66jNEgpdA96s+O3Hk8vW+uwrOhx0l6kCxHsVIVniwn6WXQxX0AU
	tObax/WsM/jPFDmAY+yrDw6KYmkP6EXFYt7LaH/UReEh3C+Q==
X-Received: by 2002:a05:600c:c87:b0:487:13d:4e77 with SMTP id 5b1f17b1804b1-488835b790cmr13699185e9.27.1774991831605;
        Tue, 31 Mar 2026 14:17:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:186c:aad2:ccc1:5aff:fe8f:d494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e81a2cesm66051735e9.8.2026.03.31.14.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 14:17:11 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] staging: media: atomisp: remove redundant call to ia_css_output0_configure()
Date: Tue, 31 Mar 2026 23:16:12 +0200
Message-ID: <20260331211649.421777-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331211649.421777-1-azpijr@gmail.com>
References: <20260331211649.421777-1-azpijr@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-57819-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: A8E5D371B07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function configure_isp_from_args() contained a duplicate call to
ia_css_output0_configure() using the same output frame index. Remove the
redundant call to simplify the configuration path.

The ia_css_output0_configure() function acts as a configuration setter.
It populates a struct ia_css_output0_configuration from the frame info
and caches it in the binary parameters. Calling it twice with the same
out_frame[0] pointer merely overwrites the exact same state with
identical values. It has no cumulative state, either does its order
matter relative to ia_css_copy_output_configure().

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
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



Return-Path: <linux-media+bounces-44755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF7BE4854
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 18:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F006050851E
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 16:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C15123EAA4;
	Thu, 16 Oct 2025 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K/X7G4Y8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE932D0E8
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631406; cv=none; b=OH+WihnrmdJbeHkYSA3e3MYEdYV2usGZmt09MFD/+GJoZh5cfL5MAREabHhg2pkBdWT8CZBQeLXOwVYdjij2cFPg2nG8pZGyJ+wM3lyHJsibpbGdUdlas7DE97GKQyZ/C4wli5mWHZqIvZ3tEdfSWlmWZdaIcd1tyn4XWVkgBWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631406; c=relaxed/simple;
	bh=g14jRVXRif/yu2mldUqo+ZtgbpRULfrZaOhR9foeWp0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jaIqn7KUDyuYSRqHyQ5+9451Oivg9akznU01dOjnOADVu7FeGSXW8D0cxgv4KkS5IFs14ointLGcsPyMAHqWQ0pLgxKoMR7FIAN3TuWYoZbfUP7ZzZ1BsjooA03YqA+znjX8C/R/cP4NNfD8OMdg8Pzli4uFQ1KX9pMG6csqTCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K/X7G4Y8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rLoW72TXy8BUJKs73yrBx0QtS/ByaYZC6LqSSduX5pU=;
	b=K/X7G4Y8ZjMrZL25mJxnQj+7NFrJt2ae9qAUYl2IpimRRa7e5I3b3DfsrTkPilBFNxTq+t
	6JB9J3XTwUktzfECO0MsxgOZBvz8inT4f5z6ctvVcRbE3GHSSLZDCBDEyoA1KLuPiob83W
	eJmcl43VBgekVdkBN/+e+RivyjwWNiU=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-8T97l2A_NXWUnYAI3A5vRQ-1; Thu, 16 Oct 2025 12:16:41 -0400
X-MC-Unique: 8T97l2A_NXWUnYAI3A5vRQ-1
X-Mimecast-MFC-AGG-ID: 8T97l2A_NXWUnYAI3A5vRQ_1760631401
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-555a199e5dbso1460531e0c.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 09:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631401; x=1761236201;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLoW72TXy8BUJKs73yrBx0QtS/ByaYZC6LqSSduX5pU=;
        b=eOD7jWNxjV9H254ZCFJKGf/co4TAc0MlYyash+T421ym1OvIRKLIHP7Vzp9he6LgTC
         r7l7piDNHrVP5xIZ3NB+8gHGxX4ggv0xlJj0+tVs2m1TbRueFnDSw258yGzgMrTv0zwv
         iQQdLXk05PN0vPOEmJSPhyVGrUzY1rGqIAcM8CVAUZQ30An4f5K4tB7Ysm+XDC9Tej49
         V08rD45gDrWiFbEbgVkEk2pY7rV4ecX8SuWT7JZ6E8+2PgsX9ETHIt6HcdlhvrD0Y+ft
         5KFEEFHl2o3na296uGiHrqF+GcRYgM7gPd9pTZUzVTtyrQbPROPuIyiZE7cBNsKRfJaa
         QlUg==
X-Forwarded-Encrypted: i=1; AJvYcCUT1zyVneEsSlK5IVuASa80ltsPAvZm2o+WUQPBmsIa5TEweb9Ux2eeVAT5Uc4DxwSWtAAokegAvprkvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxt82es0H96XMZo++NRnl9MT5WFzIEGubNML576zo62L/SvGSB
	4xOhHzgIkE/Ci3bB7DgAqmr+fYfNtOZvFH5z7+cmVYLWwT0JG4N2Igiltr66xZf71fr+US1Wb05
	3H2f2QHSybjywdbqquAHEnmcNCHv12bTts2xIpab+19sXX2usmU+56kTOYT+vjS/Y
X-Gm-Gg: ASbGnctlANSkDalqIYphDGx2cR/D5LUyvPy5cYEcIni6eFnvnH7xcDeOv31Ccu/Grmt
	kKkliSsRRa+CrW1uXpSc4PVJ7AOJtgkUNSfKq0kn/roDqUFoUJowHwh03iYxlIUcU0HqlUOjr54
	TEcBAG+xdqn3Pq4JHzqNvpOPURETkbnPgXb9veEHF5Bb1tBea6xN0acA/RcP27igRNWiP+87n+R
	i8rricE3pLqSu142ISci1gmVyz9hhNQPJxoA08J6ZMVV44Pyoo9I4VTctyMldQOufxKZPZMs85a
	V27uhRf9fp14d6b17UtYeaLZ1rIiGVogY2BlY8wz4dUJ8t65ar3F6S/SocsBaVDUv4eijCsfUD4
	gsb51GG5E2BtY8/RSIYAJjF3TFfrsqXoddTumM1XHM1w3g4dDrSZD+pBCEBU3LskIzY4EjQ==
X-Received: by 2002:a05:6122:e0db:b0:54a:8deb:21a7 with SMTP id 71dfb90a1353d-556401f5a2emr1266672e0c.4.1760631400691;
        Thu, 16 Oct 2025 09:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/qxbT4MGn5K5SdF7mHb4J1RwbE5sf3ZLdQeaLqWF3gk/o9djqJacUmDf3uaB2gYHOqJNprw==
X-Received: by 2002:a05:6122:e0db:b0:54a:8deb:21a7 with SMTP id 71dfb90a1353d-556401f5a2emr1266639e0c.4.1760631400331;
        Thu, 16 Oct 2025 09:16:40 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm44068466d6.33.2025.10.16.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:16:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH RESEND 0/4] media: convert from clk round_rate() to
 determine_rate()
Date: Thu, 16 Oct 2025 12:16:25 -0400
Message-Id: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFka8WgC/x3MsQrCMBRG4Vcpd/ZCEzAtznZ10FEcQvKnXtRUb
 lSE0ndv6Ha+5cxUoIJCh2YmxU+KTLnC7BoKd59HsMRqsq3dm9Y4fiGK5/B8sE7fHFn9B6woqG3
 hkg2+61PnqB7eiiT/7X6l83AZTke6LcsKPh60hHUAAAA=
X-Change-ID: 20251016-media-clk-round-rate-resend-2e6f2ca78f76
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5312; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=g14jRVXRif/yu2mldUqo+ZtgbpRULfrZaOhR9foeWp0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SqW9unN9Ss/ph+bzdNJE1FZy+H1jFr71bQ9TmHBDv
 +W9dSfCOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIyniGP3znXqvMMN11uvzk
 Wa43V/9qHSovEkre/q2y92/Dly//xM8w/BX9xpjafcDU6UVukniZbJdwjvYLJ1a7F7UfVZL9oxO
 KuAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

NOTE: This is a resend since my original posting received no feedback.
https://lore.kernel.org/linux-clk/20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com/T/

I'm hoping to get this merged so that we can remove the round_rate() clk
op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the media subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      media: i2c: ds90ub953: convert from round_rate() to determine_rate()
      media: i2c: max96717: convert from round_rate() to determine_rate()
      media: i2c: tc358746: convert from round_rate() to determine_rate()
      media: platform: ti: omap3isp: isp: convert from round_rate() to determine_rate()

 drivers/media/i2c/ds90ub953.c            | 12 +++++++-----
 drivers/media/i2c/max96717.c             | 16 +++++++++-------
 drivers/media/i2c/tc358746.c             | 12 +++++++-----
 drivers/media/platform/ti/omap3isp/isp.c | 10 +++++-----
 4 files changed, 28 insertions(+), 22 deletions(-)
---
base-commit: 2433b84761658ef123ae683508bc461b07c5b0f0
change-id: 20251016-media-clk-round-rate-resend-2e6f2ca78f76

Best regards,
-- 
Brian Masney <bmasney@redhat.com>



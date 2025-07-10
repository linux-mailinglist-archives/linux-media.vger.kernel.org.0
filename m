Return-Path: <linux-media+bounces-37338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF82CB009E7
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C418E1AA6A59
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE462F0C74;
	Thu, 10 Jul 2025 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f7eWwSy9"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA492EF9C0
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752168568; cv=none; b=psCO6En815SXYz7SMbVBA4EcZogvj7+OnRlK1rKffebKjduoPOwUh3aooPTIu/eo73h78343OTOM5HIpFl3zxCOPKkOK7pzVYkT556kL5RRRoaZ59yavOHwrI8cbg+ZJ6JYXYgFGRIUzQxZBPmDfViam8WUe94F3QElonP5DTqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752168568; c=relaxed/simple;
	bh=GxRPr2zKFQZkUu6782yLR9XiJNnYjmqxu0FzUn43ql8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kqlpdON23owVxt2CX2yKUa9OwjBO6T0Rg85D8o4BsAFBUpC8WsNVq2etuhUZtalrZimGLfg53b/ZcX+DJIBsMdK7Z6VftjaftxlICblWS622zs5Bf7LydP84dQ8EXNcmrWmOucnYa5z8WFwm4RRrgdCl04E8sTfr8QUr2+XXJtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f7eWwSy9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752168565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=15wuXMlpDA42zFWX/Inlh7bZJioyzoqEY94qxEY0+H8=;
	b=f7eWwSy9HMk5lygIHCn3KVkbLtVfCCF1ddAGuvQYJlR41U7MeWg+yjJn+gcbn7TWnNE3sY
	QEIrwnbXXaud/EJShrcL8kTiWMGASbmHElAjxsDGhCpwhjVjrTK7J9QVCg3V988GGQ9v+S
	fp3I6xWGnjBU3k9zow/3/oYt1AFyoYM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-A8t53HCxOZmR6wvJAhnneA-1; Thu, 10 Jul 2025 13:29:24 -0400
X-MC-Unique: A8t53HCxOZmR6wvJAhnneA-1
X-Mimecast-MFC-AGG-ID: A8t53HCxOZmR6wvJAhnneA_1752168564
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d444d21b24so202477485a.1
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 10:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752168563; x=1752773363;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15wuXMlpDA42zFWX/Inlh7bZJioyzoqEY94qxEY0+H8=;
        b=df65MvfBXbj6SGEk69WgZakJ1ZVV78o5f/80SBapWaArJcIS+bCBQfCt1yk82UC7hy
         D2d0ZqwxvQM1Fz9zglj3kIStQldoq8IQ9BtPU2T6ghZetATw7gZp4TbxBcKVBqE/ocX1
         3CaaWlv0z7F9WyMHpmAtfl9igtwjLOSCaSJ3kO1JaIlymBQv846wDAqK7ZEXAxMDspym
         mCI4Dt6b9lPUEXHgRwsadetqJBpD/s6dEthCWWij3eMCoNGaiREs7zo0jgHEKMFRXo8s
         tObFa7wz9myRQzq0PNaxBCGF8ZSbdENpBG7/fsbwBuaXdFnWVzilDJv9qDTPzX6QJfIq
         DGWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt50Vd7qB/XqTW/rbXVQCokQFi4iD1R9VV2vEAI721qSoZIoZz8p3AfUiPBhBeTZK87Wa4epPWQiJG2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSkfvhKUn3eRBuqU0gbbJP3k0YIg/Wrn3e5DMGCV+UYWPJ9keB
	v71RGB2GQ+HIgibWcTlaekkVEN6ysk6xoLq85RaLuJFfHwCrWRYwQVlvsTLk2XE+BohuVZbMc6R
	130Fl6mvk5R7OyoXQk4hkenYIRhBcCv9dntW1Nqf/00P7qKikF5yL6Shx9oABJrnF
X-Gm-Gg: ASbGncszVh1Ol81p+PJT17h1THHcvuqkF3+4go9hbiWEWVoda7skMl+K4k+gYqfK1IW
	HjczSzrFds9j08EQG6LO2Li7v1SKBn1N/JC6pX8Q5BzbGCgXF/SXJKZ7IIOp+uocmF90FdQCJik
	d4aqOJT44Ig2fAWuZLWUWDGjdVhsBni4E7coAL7tilXrtUWbJJVBXIwLKCL/6zb8lDgpLCSSA6K
	foO/cmfJ1EQP45QMArxr8GIeKvT1SorYTbRj3Jr4hpjO9q2FeJ29uWCRGzulwrwWdigwY12vDgc
	EoeKMGsNhq9X8Z8xGGWyNp0i0erwdD8o7LqFuUCCQI4IxcvkOU7/OrQm9aYC
X-Received: by 2002:a05:620a:1a82:b0:7d3:b28d:9aeb with SMTP id af79cd13be357-7ddec83c592mr63867085a.48.1752168563413;
        Thu, 10 Jul 2025 10:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrmS1mMpPovOMJ0VVqq6VLSlVkcvsFvwKTzBgf+FoZDJXo+kt+R195oa3nhGmgt3pBm5NJUA==
X-Received: by 2002:a05:620a:1a82:b0:7d3:b28d:9aeb with SMTP id af79cd13be357-7ddec83c592mr63862085a.48.1752168562927;
        Thu, 10 Jul 2025 10:29:22 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde806297sm117728785a.82.2025.07.10.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:29:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/4] media: convert from clk round_rate() to
 determine_rate()
Date: Thu, 10 Jul 2025 13:29:05 -0400
Message-Id: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGH4b2gC/x3MTQ5AMBBA4avIrE1SfymuIhalgwlKpohE3F1j+
 S3ee8CTMHmooweELva8uYAkjqCfjBsJ2QZDqtJC6UThSpYN9suMsp3OopiDsFCDycoq17nuIKS
 70MD3v23a9/0ApuhKOGYAAAA=
X-Change-ID: 20250710-media-clk-round-rate-50fa3894747b
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752168561; l=4880;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=GxRPr2zKFQZkUu6782yLR9XiJNnYjmqxu0FzUn43ql8=;
 b=c+92Qb2p7ihTMFt73L/rC8M0nUDEnGLNwn80xL8u+j6pFqCoWlzO+klFQ1EUtXVInH56W8eSQ
 9IefNmPosfcAQTIVih1LHZqD9nqXa74EV4srVvO5S4pFhhrbwhK8oHe
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

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
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-media-clk-round-rate-50fa3894747b

Best regards,
-- 
Brian Masney <bmasney@redhat.com>



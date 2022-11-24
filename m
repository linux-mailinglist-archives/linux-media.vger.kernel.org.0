Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B89637682
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 11:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiKXKam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 05:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbiKXKaT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 05:30:19 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9740514F53E;
        Thu, 24 Nov 2022 02:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669285808; x=1700821808;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YeUrLXy9bku/Oz3myovJFJIhAr2URT+qJdcHml9EV7I=;
  b=ifpEhHrdYDaAmB3EoRni4PVuWXg+z1Mqimb6TWC7h1+kD2Pqa7oXyu+u
   hweUkBsOCSizQYe7K40eVso9ss4qWlwLpxCDaOmH4ON49lF5zksXmUfD0
   tFJNpexa+477Aly2R6gNQfgPZjKxnvkjxih8rDqdkfgB37+q172MGus2w
   KrX1hJTqfUKT5Cl0rp3kaBvbqyS8Ashaww0mBpDGw/tx5SPYejI4O4x88
   qT4Xz/qf7qAVX/Paqa18LzAgnand1IJ5y8ggEgEOyw7EAHrJzaUmLpCo4
   M4n4Dby+QfYW5LkkwqI9hr7tJ06b+s/Xi6NeGLp9WaP0+4XQNfq7+hCJg
   g==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27558276"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Nov 2022 11:30:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 24 Nov 2022 11:30:04 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 24 Nov 2022 11:30:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669285804; x=1700821804;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YeUrLXy9bku/Oz3myovJFJIhAr2URT+qJdcHml9EV7I=;
  b=OnCwICC8wUkX/Ua/izEJptdm1rvrAYz1MQ4WbUinpOfKEre7Fq/CNXay
   qh5m6O2NJ7wlLpvMUpzK/0h7uBEeUglM++Ln4aWH3akpcEkmNqoX19XSV
   1UrU3o3cAidHYLFRihowdlV/2B/LYwxlRimfqyY3zPdRKC6orptNxJd+x
   JtMQ1RScygggxT4XtF5HgI+W8Rn0rQSXijvq3dOUhXyEtcrPp2aMbeK3T
   cnUlqarZf/292fEFXAl8+i2mbq1gLUcDuJ/pgyBjXVWWsEWnZ5gunfqHO
   2DLrPGEbvoxrqcWpFA1IkqptYcHvClQLHSZBAIFqTju2ADDqUm6OdniWJ
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27558275"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Nov 2022 11:30:04 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D832D280056;
        Thu, 24 Nov 2022 11:30:03 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v5 0/2] ov9282: Add ov9281 support
Date:   Thu, 24 Nov 2022 11:29:57 +0100
Message-Id: <20221124102959.1605202-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all,

This is v5 of the ov9281 support series. Thanks for the feedback I received
over the time.

Changes in v5:
* Removed unrelated patches from the series
* Squashed previous patch 3 & 6 (now patch 2)
* Removed error handling for device_get_match_data() call
* Added Kieran's r-b to patch 2

Best regards,
Alexander

Alexander Stein (2):
  media: dt-bindings: media: Add compatible for ov9281
  media: i2c: ov9282: Add ov9281 compatible

 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 5 ++++-
 drivers/media/i2c/ov9282.c                                   | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.34.1


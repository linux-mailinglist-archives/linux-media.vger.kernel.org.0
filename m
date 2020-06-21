Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 202CD20277A
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 02:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgFUAA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 20:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgFUAA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 20:00:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F27C061794;
        Sat, 20 Jun 2020 17:00:58 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 250E8552;
        Sun, 21 Jun 2020 02:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592697656;
        bh=TbWMO57IQeeFwrX37Koj13qlcY4vYoYByL9hHW1zfN4=;
        h=From:To:Cc:Subject:Date:From;
        b=PT7Mc/ynpMK9Rjlv1kGAiwtwPgNu4AUbqhrib8ka3tA+ThnV5yQm49Fi+w4hpR3UV
         PD8z1c3OItczaomO+eoilrfSqqQkysaFk2fPJQBKDNV9XWyLsIYDnFwzBJM+Mnuquk
         qa/5DYApmVHVrjGqjSXoC3D13zJ3cpSQU10SDAIk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v3 0/3] media: v4l2-async: Accept endpoints and devices for fwnode matching
Date:   Sun, 21 Jun 2020 03:00:25 +0300
Message-Id: <20200621000028.4591-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series is the third version of fwnode endpoint matching
support in v4l2-async. The secon version can be found at [1].

Compared to v2, review comments have been incorporated, patch 4/4 got
squashed in 1/4 (now 1/3), and the code has been rebased on top of
v5.8-rc1.

Sakari, is they way that patch 1/3 determines if a fwnode is an endpoint
acceptable for you (and for ACPI) ?

[1] https://lore.kernel.org/linux-media/20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com

Laurent Pinchart (3):
  media: v4l2-async: Accept endpoints and devices for fwnode matching
  media: v4l2-async: Pass notifier pointer to match functions
  media: v4l2-async: Log message in case of heterogeneous fwnode match

 drivers/media/v4l2-core/v4l2-async.c | 85 +++++++++++++++++++++++++---
 1 file changed, 77 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart


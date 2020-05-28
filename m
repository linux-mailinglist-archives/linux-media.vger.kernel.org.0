Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27BE91E6227
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 15:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390302AbgE1N0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 09:26:44 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54280 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390282AbgE1N0l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 09:26:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04SDQXuA062739;
        Thu, 28 May 2020 08:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590672393;
        bh=2/GRDmlrfZh+gIOxv9cg+3XWPTHFPysRHkDFU2wv73w=;
        h=From:To:CC:Subject:Date;
        b=urFcaOUs1aR5sGHtM2/HBNhnAu5BsTg9UlzzE605U+b4qGqDb15Ko2TsBfR259hqG
         fTmdrNEFdTEWhU+iLALljpgr5N6AxAJk4axE2RCsAd9lPS3+h99EtuSbitBIhU+sVk
         CWyhlPuiR0/z5z1FCbsQzYN57nnjeB1gjqhr8wHs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04SDQXEf022303
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 28 May 2020 08:26:33 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 08:26:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 08:26:33 -0500
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SDQWxR130696;
        Thu, 28 May 2020 08:26:32 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 0/2] media: v4l2-rect.h: add enclosed rectangle helper
Date:   Thu, 28 May 2020 08:26:03 -0500
Message-ID: <20200528132605.18339-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series introduces a new v4l2_rect_enclosed helper function which
already exist in some form in several drivers. It then proceed to
update those drivers to use the new helper function.

Benoit Parrot (2):
  media: v4l2-rect.h: add enclosed rectangle helper
  media: use v4l2_rect_enclosed helper

 drivers/media/platform/am437x/am437x-vpfe.c   | 19 +++---------------
 .../media/platform/exynos4-is/fimc-capture.c  | 18 +++--------------
 drivers/media/platform/exynos4-is/fimc-lite.c | 18 +++--------------
 drivers/media/platform/s5p-jpeg/jpeg-core.c   | 16 ++-------------
 include/media/v4l2-rect.h                     | 20 +++++++++++++++++++
 5 files changed, 31 insertions(+), 60 deletions(-)

-- 
2.17.1


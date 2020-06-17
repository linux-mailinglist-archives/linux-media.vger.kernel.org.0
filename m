Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C45D1FD4E6
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 20:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgFQSwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 14:52:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:40468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726971AbgFQSwT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 14:52:19 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 70612217BA;
        Wed, 17 Jun 2020 18:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592419938;
        bh=DpQjYZZeTM+uzWHwycplncpFlO5eCkii+KlRTUKLv3g=;
        h=From:To:Cc:Subject:Date:From;
        b=MsE1/7k7pdJT7KPjfFOk7ftsiAOyCPYA0BoXHNOD9lZbABn6UjJixFoKQ7BD4HTUr
         bdT2WxqPHgIZdOZOXwGGwJavpLlzcYXJgeQW3mGUhkTT7tjjkPkOSk+xRPRDrVY53H
         IPwdU+ZNMlWn8v4TGQCvr31Gs/358Es9aRFHjvUw=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jldAV-00C8Ae-Sb; Wed, 17 Jun 2020 20:52:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Brad Love <brad@nextdimension.cc>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org, Sean Young <sean@mess.org>,
        devel@driverdev.osuosl.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [RFC 0/4] Don't do tuning zigzag using the very same frequency
Date:   Wed, 17 Jun 2020 20:52:10 +0200
Message-Id: <cover.1592419750.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Marc reported on IRC that the zigzag code is trying to tune several times using
the same frequency with si2168. Well, this is not how this would be supposed
to do: it should try with different frequencies each time.

Change the core to use the one-shot mode if the frontend doesn't report a
frequency step. This will default to the current behavior, except that tuning
should be faster.

Yet, probably the right thing to do is to implement a frequency shift at such
frontends, as otherwise  tuning may have problems. So, produce a warning
on such cases, in order for the FE driver to be fixed.

Mauro Carvalho Chehab (4):
  media: atomisp: fix identation at I2C Kconfig menu
  media: atomisp: fix help message for ISP2401 selection
  media: dvb_frontend: move algo-specific settings to a function
  media: dvb_frontend: disable zigzag mode if not possible

 drivers/media/dvb-core/dvb_frontend.c         | 231 ++++++++++--------
 drivers/staging/media/atomisp/Kconfig         |   2 +-
 drivers/staging/media/atomisp/i2c/Kconfig     |  74 +++---
 .../staging/media/atomisp/i2c/ov5693/Kconfig  |  12 -
 4 files changed, 171 insertions(+), 148 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/ov5693/Kconfig

-- 
2.26.2



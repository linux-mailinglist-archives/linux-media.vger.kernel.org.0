Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 527F143F0A
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390096AbfFMPy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:54:26 -0400
Received: from sauhun.de ([88.99.104.3]:41910 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389856AbfFMPyZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:54:25 -0400
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
        by pokefinder.org (Postfix) with ESMTPSA id B38484A127B;
        Thu, 13 Jun 2019 17:54:23 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: don't check retval after our own assignment
Date:   Thu, 13 Jun 2019 17:54:16 +0200
Message-Id: <20190613155421.16408-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Interesting how many cleanups I find until I can start the
refactorization I really want :) This series fixes a set of unneeded if
checks following the assignment of an errno constant.

Only build tested due to no HW.

Wolfram Sang (4):
  media: cxd2820r_core: don't check retval after our own assignemt
  media: mn88472: don't check retval after our own assignemt
  media: mn88473: don't check retval after our own assignemt
  media: zd1301_demod: don't check retval after our own assignemt

 drivers/media/dvb-frontends/cxd2820r_core.c | 3 +--
 drivers/media/dvb-frontends/mn88472.c       | 6 ++----
 drivers/media/dvb-frontends/mn88473.c       | 6 ++----
 drivers/media/dvb-frontends/zd1301_demod.c  | 3 +--
 4 files changed, 6 insertions(+), 12 deletions(-)

-- 
2.20.1


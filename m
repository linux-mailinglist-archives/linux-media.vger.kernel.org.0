Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE12E26984F
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 23:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgINVva (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 17:51:30 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:34533 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726048AbgINVvI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 17:51:08 -0400
X-Halon-ID: 5fc6ff5b-f6d4-11ea-a39b-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 5fc6ff5b-f6d4-11ea-a39b-005056917f90;
        Mon, 14 Sep 2020 23:51:04 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] rcar-csi2: Update how DT is traversed and parsed
Date:   Mon, 14 Sep 2020 23:50:09 +0200
Message-Id: <20200914215011.339387-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series touches up how the R-Car CSI-2 driver traverse and parse DT 
device nodes. Patch 1/2  switches to only use the fwnode interface and 
2/2 specifies the bus type used for parsing.

This is done a preparation to later modify the rcar-vin driver in a 
similar fashion to be able to drop the use of the 
v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper which I 
understand is marked for deprecation. Therefore comments on the over all 
solution of parsing DT here would be appreciated.

Niklas Söderlund (2):
  rcar-csi2: Switch to using fwnode instead of OF
  rcar-csi2: Set bus type when parsing fwnode

 drivers/media/platform/rcar-vin/rcar-csi2.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

-- 
2.28.0


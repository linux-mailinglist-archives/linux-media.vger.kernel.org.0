Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44AD433B5F
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 17:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233146AbhJSP60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 11:58:26 -0400
Received: from comms.puri.sm ([159.203.221.185]:33228 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231235AbhJSP6Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 11:58:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 5CA0FDF72A;
        Tue, 19 Oct 2021 08:55:42 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0eC9GdzDQKGp; Tue, 19 Oct 2021 08:55:41 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     sakari.ailus@linux.intel.com
Cc:     kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, lkp@intel.com,
        martin.kepplinger@puri.sm, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com
Subject: [PATCH v3 0/2] media: hi846: minor build fixes
Date:   Tue, 19 Oct 2021 17:55:07 +0200
Message-Id: <20211019155509.1018130-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Similar to many other drivers this basically should fix the build warning
where the const struct of_device_id we define can be unused. Reported
here:
https://lore.kernel.org/linux-media/202110170632.b6umsB8m-lkp@intel.com/


revision history
----------------
v3: (thank you Sakari)
* include property.h instead of of_graph.h and remove the of_match_ptr macro

v2 and v1:
https://lore.kernel.org/linux-media/20211018095859.255912-1-martin.kepplinger@puri.sm/

Martin Kepplinger (2):
  media: hi846: include property.h instead of of_graph.h
  media: hi846: remove the of_match_ptr macro

 drivers/media/i2c/hi846.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.30.2


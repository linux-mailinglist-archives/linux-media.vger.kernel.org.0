Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161292BAFD3
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 17:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbgKTQPh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 11:15:37 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:53049 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgKTQPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 11:15:37 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0B32040046;
        Fri, 20 Nov 2020 16:15:33 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: max9271: Fix GPIO handling
Date:   Fri, 20 Nov 2020 17:15:27 +0100
Message-Id: <20201120161529.236447-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While working on RDACM21 camera integration I found the GPIO handling
code in the max9271 library driver had a few bugs, that went un-noticed
when the library has been used to upstream RDACM20 as the GPIO lines are
not explicitly enabled.

Fix the GPIO handling code in the max9271 library driver and make rdacm20
a little more robust by enabling the GPIO1 line explicitly.

Tested on H3 Salvator-X with MAXIM GMLS expansion board.

Thanks
   j

Jacopo Mondi (2):
  media: max9271: Fix GPIO enable/disable
  media: rdacm20: Enable GPIO1 explicitly

 drivers/media/i2c/max9271.c |  8 ++++----
 drivers/media/i2c/rdacm20.c | 13 +++++++++++--
 2 files changed, 15 insertions(+), 6 deletions(-)

--
2.29.1


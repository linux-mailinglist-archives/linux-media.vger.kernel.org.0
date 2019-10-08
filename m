Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADE85D0409
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 01:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfJHXWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 19:22:41 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:8848 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfJHXWl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 19:22:41 -0400
X-Halon-ID: 6beded86-ea22-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 6beded86-ea22-11e9-bdc3-005056917a89;
        Wed, 09 Oct 2019 01:22:10 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] rcar-vin: Cleanup how subdevice format is handled
Date:   Wed,  9 Oct 2019 01:21:59 +0200
Message-Id: <20191008232201.1768407-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This small series clean up how formats coming from the subdevice is 
handled inside the driver. The changes are made possible after recent 
VIN patches paved the way.

There should not be any functional changes in this series.

Niklas Söderlund (2):
  rcar-vin: Rename wrongly named rectangle
  rcar-vin: Create compose rectangle where it is used

 drivers/media/platform/rcar-vin/rcar-v4l2.c | 38 ++++++++++-----------
 1 file changed, 18 insertions(+), 20 deletions(-)

-- 
2.23.0


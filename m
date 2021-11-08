Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A7A447F6C
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 13:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238112AbhKHMWo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 07:22:44 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:40183 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238042AbhKHMWo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 07:22:44 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 140D7240008;
        Mon,  8 Nov 2021 12:19:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/2] max9271: Fix pclk detect silent failure
Date:   Mon,  8 Nov 2021 13:20:41 +0100
Message-Id: <20211108122043.49187-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Repeatedly reading register 0x15 to validate the incoming pixel clock
causes sporadic read errors which went silently ignored, causing the camera
module to fail to start streaming.

Fix that by ignoring the read error and while at it rework the error message
handling in all functions.

v2->v3
- Remove goto from 1/2 as suggested by Geert
v1->v2:
- Drop v1 [1/2]
- [2/2] new patch. Handle all bus access errors in the call sites

Jacopo Mondi (2):
  media: max9271: Ignore busy loop read errors
  media: max9271: Fail loud on bus errors in call sites

 drivers/media/i2c/max9271.c | 116 +++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 48 deletions(-)

--
2.33.1


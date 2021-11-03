Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A885E4449AC
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 21:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhKCUsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 16:48:50 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:49757 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhKCUst (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 16:48:49 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 199B8200004;
        Wed,  3 Nov 2021 20:46:09 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] media: max9271: Fix pclk_detect silent failure
Date:   Wed,  3 Nov 2021 21:46:52 +0100
Message-Id: <20211103204654.223699-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Repeatedly reading register 0x15 to validate the incoming pixel clock
causes sporadic read errors which went silently ignored, causing the camera
module to fail to start streaming.

However, with this, in the case of a non fatal read error the log will be a
little polluted.

Jacopo Mondi (2):
  media: max9271: Fail loudly on bus read errors
  media: max9271: Ignore busy loop read errors

 drivers/media/i2c/max9271.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--
2.33.1


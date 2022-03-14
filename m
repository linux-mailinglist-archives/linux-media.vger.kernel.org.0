Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5354D8005
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 11:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238620AbiCNKlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 06:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237807AbiCNKlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 06:41:03 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C656A3EA92
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 03:39:51 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 98888200004;
        Mon, 14 Mar 2022 10:39:48 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 0/5] media: imx: imx-mipi-csis: Additional cleanups
Date:   Mon, 14 Mar 2022 11:39:36 +0100
Message-Id: <20220314103941.46021-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As a followup of the two patches I sent in respose to Laurent's
[PATCH 0/4] media: imx: imx-mipi-csis: Simplify PM support
I have piled a few more cleanups for the CSIS.

Jacopo Mondi (5):
  media: imx: imx-mipi-csis: Simplify mipi_csis_s_stream()
  media: imx: imx-mipi-csis: Drop powered flag
  media: imx: imx-mipi-csis: Remove lock from s_stream
  media: imx: imx-mipi-csis: Remove duplicated check
  media: imx: imx-mipi-csis: Protect mipi_csis_dump_regs()

 drivers/media/platform/imx/imx-mipi-csis.c | 64 ++++++++++------------
 1 file changed, 28 insertions(+), 36 deletions(-)

--
2.35.1


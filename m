Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA16542D131
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 05:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhJNDv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 23:51:26 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:22306 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhJNDvG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 23:51:06 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 19E3Qb9M006360;
        Thu, 14 Oct 2021 11:26:37 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 14 Oct
 2021 11:48:16 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/6] add aspeed-jpeg support for aspeed-video
Date:   Thu, 14 Oct 2021 11:48:13 +0800
Message-ID: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 19E3Qb9M006360
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The aim of this series is to add aspeed-jpeg support for aspeed-video
driver.

To achieve this major goal some refactors are included. In addition,
dprintk is added to more detailedly categorize the log.

In the last, debugfs information is also updated per this change.

Jammy Huang (6):
  media: aspeed: move err-handling together to the bottom
  media: aspeed: add dprintk for more detailed log control
  media: aspeed: refine to centerize format/compress settings
  media: aspeed: Support aspeed mode to reduce compressed data
  media: aspeed: add comments and macro
  media: aspeed: richer debugfs

 drivers/media/platform/aspeed-video.c | 443 +++++++++++++++++++++-----
 1 file changed, 366 insertions(+), 77 deletions(-)

-- 
2.25.1


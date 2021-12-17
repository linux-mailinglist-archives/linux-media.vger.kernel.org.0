Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC0647882C
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 10:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbhLQJyd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 04:54:33 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:31825 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234593AbhLQJy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 04:54:28 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1BH9SGjS026173;
        Fri, 17 Dec 2021 17:28:16 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 17 Dec
 2021 17:53:45 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] Correct timing report
Date:   Fri, 17 Dec 2021 17:53:59 +0800
Message-ID: <20211217095403.2618-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BH9SGjS026173
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series will correct the value of timing detected.

Jammy Huang (4):
  media: aspeed: Correct value for h-total-pixels
  media: aspeed: Use FIELD_GET to improve readability
  media: aspeed: Correct values for detected timing
  media: aspeed: Fix timing polarity incorrect

 drivers/media/platform/aspeed-video.c | 83 +++++++++++++++++++--------
 1 file changed, 59 insertions(+), 24 deletions(-)

-- 
2.25.1


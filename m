Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5A4F2286C
	for <lists+linux-media@lfdr.de>; Sun, 19 May 2019 20:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729961AbfESSrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 May 2019 14:47:00 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([134.130.5.49]:56172 "EHLO
        mail-out-4.itc.rwth-aachen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726062AbfESSrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 May 2019 14:47:00 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BXDwDnOuFc/54agoZkHgEGBwaBZQKBK?=
 =?us-ascii?q?GeBPGOECK1sgXoJAQEBAQEBAQEBBwEtAgEBhECCNiM6BA0BAwEBBQEBAQEEbSi?=
 =?us-ascii?q?FdA8BRjUCJgJfDoMnggsEqXGBL4kbgQ8JAYECJgMBAYZ4hFaCFoE4iDqCPYJYB?=
 =?us-ascii?q?IswghWaUwcCgTJdknYhjEGJXqINAgICAgkCFYFpDRGBV3GDPJBSPoEuDCGNEQG?=
 =?us-ascii?q?BIAEB?=
X-IPAS-Result: =?us-ascii?q?A2BXDwDnOuFc/54agoZkHgEGBwaBZQKBKGeBPGOECK1sgXo?=
 =?us-ascii?q?JAQEBAQEBAQEBBwEtAgEBhECCNiM6BA0BAwEBBQEBAQEEbSiFdA8BRjUCJgJfD?=
 =?us-ascii?q?oMnggsEqXGBL4kbgQ8JAYECJgMBAYZ4hFaCFoE4iDqCPYJYBIswghWaUwcCgTJ?=
 =?us-ascii?q?dknYhjEGJXqINAgICAgkCFYFpDRGBV3GDPJBSPoEuDCGNEQGBIAEB?=
Received: from rwthex-w2-a.rwth-ad.de ([134.130.26.158])
  by mail-in-4.itc.rwth-aachen.de with ESMTP; 19 May 2019 13:19:00 +0200
Received: from pebbles.fritz.box (2.243.143.238) by rwthex-w2-a.rwth-ad.de
 (2a00:8a60:1:e500::26:158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 19
 May 2019 13:18:57 +0200
From:   =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
To:     <linux-media@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
Subject: [PATCH v2 0/3] Cleanup error reporting
Date:   Sun, 19 May 2019 13:18:28 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2.243.143.238]
X-ClientProxiedBy: rwthex-w3-a.rwth-ad.de (2a00:8a60:1:e500::26:162) To
 rwthex-w2-a.rwth-ad.de (2a00:8a60:1:e500::26:158)
Message-ID: <d16d8e29-6a57-47bc-8bf0-c62262f3edf0@rwthex-w2-a.rwth-ad.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Almost all error path in dvb_usb_v2_generic_io report a specific
error using dev_err(), only the "writelen != actuallen" case
was omitted. Add an error message.

Remove any extra error reporting from the call sites which was
only required for this case. Only affected drivers are dvbsky
and af9035.

v2: Add Signed-off-by

Stefan Brüns (3):
  media: dvb-usb-v2: Report error on all error paths
  media: dvbsky: Remove duplicate error reporting for
    dvbsky_usb_generic_rw
  media: af9035: Remove duplicate error reporting for
    dvbsky_usb_generic_rw

 drivers/media/usb/dvb-usb-v2/af9035.c      |  2 --
 drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c | 15 ++++++++++-----
 drivers/media/usb/dvb-usb-v2/dvbsky.c      | 11 -----------
 3 files changed, 10 insertions(+), 18 deletions(-)

-- 
2.21.0


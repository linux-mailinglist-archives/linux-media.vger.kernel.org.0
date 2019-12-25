Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9574712A8C0
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2019 19:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfLYSEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Dec 2019 13:04:55 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:35251 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfLYSEz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Dec 2019 13:04:55 -0500
Received: from be10.lan ([87.122.250.125]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MTiLj-1jDdiS1mqT-00U6Zl; Wed, 25 Dec 2019 19:04:53 +0100
Received: from 7eggert by be10.lan with local (Exim 4.92.2)
        (envelope-from <7eggert@online.de>)
        id 1ikB1e-00015i-Jr; Wed, 25 Dec 2019 19:04:50 +0100
From:   Bodo Eggert <7eggert@gmx.de>
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Cc:     Bodo Eggert <7eggert@gmx.de>
Subject: [PATCH] serial_ir: change "ignoring spike" to debug level
Date:   Wed, 25 Dec 2019 19:02:56 +0100
Message-Id: <20191225180256.4069-1-7eggert@gmx.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hW8SB54L8zwXqUSS+zAKVQOMLpFrXF4SRdeIvpH+9YZPocsLU/G
 nFegoneyrqCzPqipX46C4G9dEGcRR2hsLZcUOW0nAZl3dsiv5Wgb2M4AtcfmX/VNLJyfv8P
 L88y0KOuXG/uxzgL7iNh59D0MMfYHsIw9YAnEGRDWNK7Z8qerQqqEDfaZCJl0j/8uvFeffL
 bkHdEsqE9ME1R+dl948SQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PzTJoVkmOJY=:O4Xd6MwXMrXUUj8+WixUwF
 NVCr38vtW4FQ3Y2DYlh+j9B1OnkBIXR6SsPNgQQ56vm4gIYtios4XmLrKn3eg97GbUZRAWLTj
 OscuPrdT2umGmcV9f5hg9YFsbqS/XXeFf4XuFNaxgc5LKHbXQkFwDVSAk8ZAVzuH1zfQhtcX0
 jJFT7bDeEHgIiGPMMB6o3/Km9NzKYACURteN2rgWyhkqk6pjBeN93ZXl15WlEbPfEj9BodHfZ
 gCd2Nk3fD7I2zbVxlCu4WtMRyXaORq8owhd1dSmaWqTE8bmjk0jYbL8VKCeBI1pTWd4PmbRVc
 mY5wQWMkq3AaRa4MCK59iWxTbL2fBPf+G1Z8sqyaawn2EcI06sAPsYnSrkXkqlfBZnk2/DoIN
 8OmminPe5l8TQCB+BasGnHE16G7lpUXzuwiu/uNTa0vD5oPseJlRKtxL4HfCeJuPOdpNH50VS
 glgnCBmqf0f7eWNeW1cQ9Bv5WZRGPCRJ7cmDyKB7+bvsJ1Gc2S2vpsBS4lMzsKNQpuMpIfyKQ
 byUOLl24Whvh8vc7xAzQk3E9416BQfmzDffd3DFCX7CxuqxcknG5tCtoy0fRqLCTyMiw0afvK
 DFJAjZnicYDtitze9eF7v6SxNtlMyUke6nL50fkgollyohAro4GmrJGgCzb+zMY6rmzxc8tTI
 5A8pMMGpXxO5u+VF+zil1Ovn2sD8+z1wqypkIltQZZlm6as964+qihJAXHkEx8bjqS6o6LPe3
 PG+2/KDopwoBOFMrAp//yacuLYuVl/IFR+pFyLSRADJZLBumwhbYts1b2eDGrQtVJXcPrMRJ9
 z/LoP+zqsxi0SB6BIIIJjdt10l9mjC7O3iWcHc9lDQGWlTGr2JAKW+T4T+JotocwWH3FcyCjh
 UiYZvygdNFIpxQrtCcnw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At least on my system with a self-made IR receiver, my kernel log is filled with:
serial_ir serial_ir.0: ignoring spike: 1 1 1419988034627194ns 1419956080709377ns

These messages happen at random and do not prevent the receiver from
working. Also I cannot change the features of the IC, therefore they are not
useful. Probably they are not useful at all.

However they fill the console, they accumulate and fill the dmesg log, by
doing this, they prevent me from seeing important message.
---
 drivers/media/rc/serial_ir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index 7652e982173f..d77507ba0fb5 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -353,7 +353,7 @@ static irqreturn_t serial_ir_irq_handler(int i, void *blah)
 			dcd = (status & hardware[type].signal_pin) ? 1 : 0;
 
 			if (dcd == last_dcd) {
-				dev_err(&serial_ir.pdev->dev,
+				dev_dbg(&serial_ir.pdev->dev,
 					"ignoring spike: %d %d %lldns %lldns\n",
 					dcd, sense, ktime_to_ns(kt),
 					ktime_to_ns(serial_ir.lastkt));
-- 
2.24.0


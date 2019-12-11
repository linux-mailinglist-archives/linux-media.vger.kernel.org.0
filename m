Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E938D11B884
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730405AbfLKQWg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:36 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51913 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730436AbfLKQWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:35 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbw; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=qkzG0ORl07Aawzy8TDz1yGE+TnQvc//Zs5RCPi9Ny6Q=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Ik3OtYE386WT2pUuKeRAl/YNZj4LFazQJTAIEqWz0oDcd83V+ajfneUxFTGksIs3Q
         n/q15s+PdoRtPQwbXZOzKevHPWLgkNa3gM6SBEBbM0ST01uCbij6DMozXMBOymnGkS
         cutxCgfyapncByvHrw9acievsPZRn+Eo0NSL5F6aFI/CbLkErMrm8fUJ2JDQB/NLiu
         yo3e9BRSyRmTLfJLlJgwGq9gkpVgPFeZyG4zE/+74NXRO8QkeIkNn4yyjfNKexK/wC
         cIQYOW/Rjkok5KoAIuV4+N7ur+24HvBZKpkoIILCn08NscGN2wxMCRGw+oAE/3Av6V
         6FrVz2X7U87Ag==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 09/10] pulse8-cec: schedule next ping after current ping finished
Date:   Wed, 11 Dec 2019 17:22:30 +0100
Message-Id: <20191211162231.99978-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191211162231.99978-1-hverkuil-cisco@xs4all.nl>
References: <20191211162231.99978-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLIuqXjK/nGb1Cb9ikFROFqZEzmt2J7yWvtecDDS5F8o0dP/p5K1rS7xn74w8YDg+F2LT4hgg+nqsiYVn6jFki0p7KwOiFZnBesw3h0xLBDnPalo5IY5
 VE+BRsUOL/dTfjcMEXZaO0UO85SHdk3joVWdbVzGvBitF0wQ/jRdl3yVeoOAHWlm/vId6aznsElobMYLfIEpn3iaJQofMu7Ff0yBVsZU13kbY/HhVOPo+iWy
 g37kMwDBkMBOeTCpyTbJCXcq6WTZP2Nx9SBniQpCoEQXnYw0jbEhMLZgFEue0gc4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't schedule the next ping before the current ping is
sent, schedule it after.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index d18d1f456576..17fcaf7e558a 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -790,7 +790,6 @@ static void pulse8_ping_eeprom_work_handler(struct work_struct *work)
 		container_of(work, struct pulse8, ping_eeprom_work.work);
 	u8 cmd;
 
-	schedule_delayed_work(&pulse8->ping_eeprom_work, PING_PERIOD);
 	mutex_lock(&pulse8->lock);
 	cmd = MSGCODE_PING;
 	pulse8_send_and_wait(pulse8, &cmd, 1,
@@ -809,6 +808,7 @@ static void pulse8_ping_eeprom_work_handler(struct work_struct *work)
 			pulse8->config_pending = false;
 	}
 unlock:
+	schedule_delayed_work(&pulse8->ping_eeprom_work, PING_PERIOD);
 	mutex_unlock(&pulse8->lock);
 }
 
-- 
2.23.0


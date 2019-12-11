Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6550A11B887
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730470AbfLKQWh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:37 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34291 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730444AbfLKQWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:35 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbz; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=91Pp/xlqgHQhMlbUKyzt2r2PC3wZAE4NfY5s25Qxx6M=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Z4bzCVzCr4kEZWTbgKSvnz+Jj4eFZa60H/Q1JJFkW5iSbzXEKF0lNShmjMk8u9KWb
         U3hVZgfB5SRATzIlguHq3vAGHtLollQGU+tazj50Y0Xrf1BQ6Xw6zXxgzFvPpOLvJ4
         0sA/OzqCXxx9ndHyBfihC1GPwKuKDU1IbaGQEpCp8UtU54rgjn+O8hwWYzyEBEapNi
         pey/w8H6ufaS8yttjz/++N39/THfFBwBAj/ukWcLSJrkgz6cbeQBuXOq/0vPVizt2+
         yeuFAG+kOJnNKQKk4SjHd4Gn8NxcNgyVfkOF8toELdMCXePch4AMypi9YgXAIUxx7L
         ttI8NQYf9XGHA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 10/10] pulse8-cec: log when a CEC message is received
Date:   Wed, 11 Dec 2019 17:22:31 +0100
Message-Id: <20191211162231.99978-11-hverkuil-cisco@xs4all.nl>
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

Log (if debug > 0) when a CEC message is received.

This is done for transmits already, so it makes sense to do the
same for receives.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index 17fcaf7e558a..afda438d4e0a 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -333,6 +333,10 @@ static void pulse8_irq_work_handler(struct work_struct *work)
 	spin_lock_irqsave(&pulse8->msg_lock, flags);
 	while (pulse8->rx_msg_num) {
 		spin_unlock_irqrestore(&pulse8->msg_lock, flags);
+		if (debug)
+			dev_info(pulse8->dev, "adap received %*ph\n",
+				 pulse8->rx_msg[pulse8->rx_msg_cur_idx].len,
+				 pulse8->rx_msg[pulse8->rx_msg_cur_idx].msg);
 		cec_received_msg(pulse8->adap,
 				 &pulse8->rx_msg[pulse8->rx_msg_cur_idx]);
 		spin_lock_irqsave(&pulse8->msg_lock, flags);
-- 
2.23.0


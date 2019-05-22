Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED23260D7
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 11:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbfEVJz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 05:55:56 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:58095 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729081AbfEVJz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 05:55:56 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id TNyQhNk4I0YQeTNyVhvAlB; Wed, 22 May 2019 11:55:55 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 6/7] cec: allow any initiator for Ping and Image/Text View On
Date:   Wed, 22 May 2019 11:55:49 +0200
Message-Id: <20190522095550.22026-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522095550.22026-1-hverkuil-cisco@xs4all.nl>
References: <20190522095550.22026-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNrAqzfM/n8RrN5GrrMonzrQIqigQxNgN6WsC7DvM5V090WC4OUZILGjMt268ZV5N/oHjcc/Nw+lKXJNpsI3cUL+4nxnzl5GzPIW7CISyAj5vFGll9V9
 z+EOkf+C72Ifc0+xl4FLh2w+LMrxcTTPdIGr5KCV0KYiExPOXWirl0YuhVAaeHJkfD9W7/r9keT3vd8WOqXUWKNpzJrVtBg+VI0+VXNI6GtUmXbJzi1i7ldT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some displays pull down the HPD when in standby, but CEC is still
active and the display can be woken up by sending an Image View On
or Text View On CEC command. The CEC specification doesn't tell you
what the initiator should be for such a command (without a HPD it's
unclear if the CEC adapter can claim a logical address).

This patch allows any initiator value when there is no HPD for the
Image/Text View On commands and for the Ping command.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 9a1ec9299aca..5827d8c3742a 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -809,14 +809,23 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 				__func__);
 			return -EINVAL;
 		}
-		if (msg->len > 1 && adap->is_configured &&
+		if (adap->is_configured &&
 		    !cec_has_log_addr(adap, cec_msg_initiator(msg))) {
 			dprintk(1, "%s: initiator has unknown logical address %d\n",
 				__func__, cec_msg_initiator(msg));
 			return -EINVAL;
 		}
+		/*
+		 * Special case: allow Ping and IMAGE/TEXT_VIEW_ON to be
+		 * transmitted to a TV, even if the adapter is unconfigured.
+		 * This makes it possible to detect or wake up displays that
+		 * pull down the HPD when in standby.
+		 */
 		if (!adap->is_configured && !adap->is_configuring &&
-		    msg->msg[0] != 0xf0) {
+		    (msg->len > 2 ||
+		     cec_msg_destination(msg) != CEC_LOG_ADDR_TV ||
+		     (msg->len == 2 && msg->msg[1] != CEC_MSG_IMAGE_VIEW_ON &&
+		      msg->msg[1] != CEC_MSG_TEXT_VIEW_ON))) {
 			dprintk(1, "%s: adapter is unconfigured\n", __func__);
 			return -ENONET;
 		}
-- 
2.20.1


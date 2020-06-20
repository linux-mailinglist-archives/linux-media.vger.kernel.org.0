Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9B2202324
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2020 12:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgFTKQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 06:16:48 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:46725 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727964AbgFTKQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 06:16:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id maYDjDWLkOn2BmaYHjuFlP; Sat, 20 Jun 2020 12:16:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592648205; bh=rrf5irhrOHcIiE0PXuOEtMGyxWmGJbPqutTsIZ1GVXo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=PvvmNKQL/bo1u53CQn8XzQjl5zMBOg8/o14YPt4swkJyZ89TGEk7vxylFVfC6S8pP
         lEIjhE9bRn7ITs02UxYgRXTAn9mRpaUrZx+FpkZP2rWafW2sbps4EDOskfIGN/JI34
         Vsdixlm4sfHNGTiIM6q3FBiAONW2FSr80VwYNJ/MWo2LgaMWq/f02u21ovjGykbBp2
         GKcp7QdToMeUVCoMokq/Z/EhNCz84HSYajdT9+IZcES9UTun5hiAyuQWqVCug2jfmY
         7sqMJ/FxD2rQZSsza3RXRB47YopVFzGqNtY889z57pyHlXb5I6I8f1CWgAPcQRyYKj
         +q2xKObhNtPJQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] media/cec.h: document cec_adapter fields
Date:   Sat, 20 Jun 2020 12:16:41 +0200
Message-Id: <20200620101641.775505-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620101641.775505-1-hverkuil-cisco@xs4all.nl>
References: <20200620101641.775505-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJCXRKZcgsQ0sZkflwMuzK/h8TopTF7R3mO13FKca7vG2KxPDvNho0t8IPs91rzEVM+dcwxbpXeqECxDeEbgzEShF1I2pWGpEigmuvYyU/Ayxd5VdM/+
 MnolRVmUlL9FpjREtLNFJjsGsYCBLcQSyCfZq4aR5K+xjqLIw1n3JxJ4dJhCCVPFt5gWrd9aADrBxsFaw2RG1XO64gbDT6m3M2OUjI9a1mtznvmpyAGH8yu4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document this core CEC structure.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/media/cec.h | 49 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/media/cec.h b/include/media/cec.h
index 1de44a4fc390..32f7c695d7b5 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -144,6 +144,55 @@ struct cec_adap_ops {
  */
 #define CEC_MAX_MSG_TX_QUEUE_SZ		(18 * 1)
 
+/**
+ * struct cec_adapter - cec adapter structure
+ * @owner:		module owner
+ * @name:		name of the CEC adapter
+ * @devnode:		device node for the /dev/cecX device
+ * @lock:		mutex controlling access to this structure
+ * @rc:			remote control device
+ * @transmit_queue:	queue of pending transmits
+ * @transmit_queue_sz:	number of pending transmits
+ * @wait_queue:		queue of transmits waiting for a reply
+ * @transmitting:	CEC messages currently being transmitted
+ * @transmit_in_progress: true if a transmit is in progress
+ * @kthread_config:	kthread used to configure a CEC adapter
+ * @config_completion:	used to signal completion of the config kthread
+ * @kthread:		main CEC processing thread
+ * @kthread_waitq:	main CEC processing wait_queue
+ * @ops:		cec adapter ops
+ * @priv:		cec driver's private data
+ * @capabilities:	cec adapter capabilities
+ * @available_log_addrs: maximum number of available logical addresses
+ * @phys_addr:		the current physical address
+ * @needs_hpd:		if true, then the HDMI HotPlug Detect pin must be high
+ *	in order to transmit or receive CEC messages. This is usually a HW
+ *	limitation.
+ * @is_configuring:	the CEC adapter is configuring (i.e. claiming LAs)
+ * @is_configured:	the CEC adapter is configured (i.e. has claimed LAs)
+ * @cec_pin_is_high:	if true then the CEC pin is high. Only used with the
+ *	CEC pin framework.
+ * @last_initiator:	the initiator of the last transmitted message.
+ * @monitor_all_cnt:	number of filehandles monitoring all msgs
+ * @monitor_pin_cnt:	number of filehandles monitoring pin changes
+ * @follower_cnt:	number of filehandles in follower mode
+ * @cec_follower:	filehandle of the exclusive follower
+ * @cec_initiator:	filehandle of the exclusive initiator
+ * @passthrough:	if true, then the exclusive follower is in
+ *	passthrough mode.
+ * @log_addrs:		current logical addresses
+ * @conn_info:		current connector info
+ * @tx_timeouts:	number of transmit timeouts
+ * @notifier:		CEC notifier
+ * @pin:		CEC pin status struct
+ * @cec_dir:		debugfs cec directory
+ * @status_file:	debugfs cec status file
+ * @error_inj_file:	debugfs cec error injection file
+ * @sequence:		transmit sequence counter
+ * @input_phys:		remote control input_phys name
+ *
+ * This structure represents a cec adapter.
+ */
 struct cec_adapter {
 	struct module *owner;
 	char name[32];
-- 
2.27.0


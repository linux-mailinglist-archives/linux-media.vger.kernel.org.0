Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD53634A9EE
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 15:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhCZOfs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 10:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbhCZOf3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:29 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8356BC0613B3
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:35:28 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id x7so5843483wrw.10
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HbWsUdS40uUZ3dqqAk74P4eL9H356rB4HhtuuV/k+mc=;
        b=GepEdxXdoOebrZzGX05sl0zwz0j0wmHbdjIrJY1qGIYLFrERfXU3aEWPFLCxeFsfVF
         aCVh7y4I8PC2EcjQX1R0d0GJlHH5Fnp2l9oCM8RexhEMGsenjXvf3fd8Mm+ch21rymN/
         iAX7zkqQATzQyOsq9X0FrnbHd1zfJSTJjsJTdjX4knpTDCcT5bVOY0jQoifKdvY/SkfG
         XEqsFvBvac1qh7+kV6Awj82p/Wj55KAm5+cEI/1pyf9xJgLn6PjWknxtaty/n9MDhDn6
         0rDJhHp85fMuWSkO7dOTSqRTaOWmqRc3r43j9zB+904c8lNOF83DP4gOnChAjmoQQVpb
         WLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HbWsUdS40uUZ3dqqAk74P4eL9H356rB4HhtuuV/k+mc=;
        b=ZuPN37T3/Cnpv93N0j+DU88HA0TgLi+XTggf7QV6vf7SKmEyEOs08gnyovR/bnB3sQ
         fec9Rzc61Kjmt11jhpjgYmL6G/59PsRaulGcPLb6E3pN52AwT543InydyXImyyrz9HT9
         0xCGo7MIAMy0u2YAH5Z+sZiYYDI3Kpd4wwxtCKzg1Vud9eD4YwBTOJOnU1jIniyLEahq
         8Wl7D4Ov49/vSqxNWCA344jrWF90ZQG37p0E9tZiSGfoMmiOHLJtNUrG2dehf5j2ptdC
         xLV6qGPHZv//snX6XMlJFNgOSN2NZ38wk6JGH4vViWj9VI1DLHwH8dgFJHcJjX6z4Riz
         1snQ==
X-Gm-Message-State: AOAM5338JcVlSY0K8lhKx073J5Cq6hPDR9xIQndZAeBdSkkjHcVEr+XK
        ynqTVMmM1/S721L8jwkUNqhCP6Zj3Xme2Q==
X-Google-Smtp-Source: ABdhPJyJTAw8LMWoQ88NuL2NCsfi+lxuv6aowZPT3nUlMAQ3C9g3dtr3UCCOQZDBIyRbE7mJxa0asA==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr15090023wrp.112.1616769327200;
        Fri, 26 Mar 2021 07:35:27 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:26 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 24/25] HID: intel-ish-hid: ishtp-fw-loader: Fix a bunch of formatting issues
Date:   Fri, 26 Mar 2021 14:34:57 +0000
Message-Id: <20210326143458.508959-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

And demote non-conformant header

Fixes the following W=1 kernel build warning(s):

 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:46: warning: Enum value 'LOADER_CMD_XFER_QUERY' not described in enum 'ish_loader_commands'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:46: warning: Enum value 'LOADER_CMD_XFER_FRAGMENT' not described in enum 'ish_loader_commands'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:46: warning: Enum value 'LOADER_CMD_START' not described in enum 'ish_loader_commands'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:108: warning: Function parameter or member 'reserved' not described in 'loader_msg_hdr'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:196: warning: Function parameter or member 'data' not described in 'response_info'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:196: warning: Function parameter or member 'max_size' not described in 'response_info'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:196: warning: Function parameter or member 'size' not described in 'response_info'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:196: warning: Function parameter or member 'error' not described in 'response_info'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:196: warning: Function parameter or member 'received' not described in 'response_info'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:196: warning: Function parameter or member 'wait_queue' not described in 'response_info'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:233: warning: Function parameter or member 'loader_ishtp_cl' not described in 'ishtp_cl_data'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:233: warning: Function parameter or member 'cl_device' not described in 'ishtp_cl_data'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:233: warning: Function parameter or member 'response' not described in 'ishtp_cl_data'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:233: warning: Function parameter or member 'flag_retry' not described in 'ishtp_cl_data'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:233: warning: Function parameter or member 'retry_count' not described in 'ishtp_cl_data'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:252: warning: Function parameter or member 'client_data' not described in 'get_firmware_variant'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:252: warning: Function parameter or member 'filename' not described in 'get_firmware_variant'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:281: warning: Function parameter or member 'out_msg' not described in 'loader_cl_send'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:281: warning: Function parameter or member 'out_size' not described in 'loader_cl_send'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:281: warning: Function parameter or member 'in_msg' not described in 'loader_cl_send'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:281: warning: Function parameter or member 'in_size' not described in 'loader_cl_send'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:281: warning: expecting prototype for Send message from host to firmware(). Prototype was for loader_cl_send() instead
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:445: warning: Function parameter or member 'cl_device' not described in 'loader_cl_event_cb'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:445: warning: Excess function parameter 'device' description in 'loader_cl_event_cb'
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:551: warning: expecting prototype for Loads ISH firmware using ishtp interface(). Prototype was for ish_fw_xfer_ishtp() instead
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:745: warning: expecting prototype for Start executing ISH main firmware(). Prototype was for ish_fw_start() instead
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c:767: warning: expecting prototype for Loads ISH firmware from host(). Prototype was for load_fw_from_host() instead

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
Cc: linux-input@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 45 +++++++++++----------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index edb0bd084c275..d20d74a890e90 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -31,13 +31,13 @@
 
 /**
  * enum ish_loader_commands -	ISH loader host commands.
- * LOADER_CMD_XFER_QUERY	Query the Shim firmware loader for
+ * @LOADER_CMD_XFER_QUERY:	Query the Shim firmware loader for
  *				capabilities
- * LOADER_CMD_XFER_FRAGMENT	Transfer one firmware image fragment at a
+ * @LOADER_CMD_XFER_FRAGMENT:	Transfer one firmware image fragment at a
  *				time. The command may be executed
  *				multiple times until the entire firmware
  *				image is downloaded to SRAM.
- * LOADER_CMD_START		Start executing the main firmware.
+ * @LOADER_CMD_START:		Start executing the main firmware.
  */
 enum ish_loader_commands {
 	LOADER_CMD_XFER_QUERY = 0,
@@ -95,6 +95,7 @@ static int dma_buf_size_limit = 4 * PAGE_SIZE;
 /**
  * struct loader_msg_hdr - Header for ISH Loader commands.
  * @command:		LOADER_CMD* commands. Bit 7 is the response.
+ * @reserved:		Reserved space
  * @status:		Command response status. Non 0, is error
  *			condition.
  *
@@ -173,16 +174,16 @@ struct loader_start {
  * struct response_info - Encapsulate firmware response related
  *			information for passing between function
  *			loader_cl_send() and process_recv() callback.
- * @data		Copy the data received from firmware here.
- * @max_size		Max size allocated for the @data buffer. If the
+ * @data:		Copy the data received from firmware here.
+ * @max_size:		Max size allocated for the @data buffer. If the
  *			received data exceeds this value, we log an
  *			error.
- * @size		Actual size of data received from firmware.
- * @error		Returns 0 for success, negative error code for a
+ * @size:		Actual size of data received from firmware.
+ * @error:		Returns 0 for success, negative error code for a
  *			failure in function process_recv().
- * @received		Set to true on receiving a valid firmware
+ * @received:		Set to true on receiving a valid firmware
  *			response to host command
- * @wait_queue		Wait queue for Host firmware loading where the
+ * @wait_queue:		Wait queue for Host firmware loading where the
  *			client sends message to ISH firmware and waits
  *			for response
  */
@@ -195,13 +196,13 @@ struct response_info {
 	wait_queue_head_t wait_queue;
 };
 
-/**
+/*
  * struct ishtp_cl_data - Encapsulate per ISH-TP Client Data.
  * @work_ishtp_reset:	Work queue for reset handling.
  * @work_fw_load:	Work queue for host firmware loading.
- * @flag_retry		Flag for indicating host firmware loading should
+ * @flag_retry:		Flag for indicating host firmware loading should
  *			be retried.
- * @retry_count		Count the number of retries.
+ * @retry_count:	Count the number of retries.
  *
  * This structure is used to store data per client.
  */
@@ -240,8 +241,8 @@ struct ishtp_cl_data {
 /**
  * get_firmware_variant() - Gets the filename of firmware image to be
  *			loaded based on platform variant.
- * @client_data		Client data instance.
- * @filename		Returns firmware filename.
+ * @client_data:	Client data instance.
+ * @filename:		Returns firmware filename.
  *
  * Queries the firmware-name device property string.
  *
@@ -266,11 +267,11 @@ static int get_firmware_variant(struct ishtp_cl_data *client_data,
 /**
  * loader_cl_send()	Send message from host to firmware
  * @client_data:	Client data instance
- * @out_msg		Message buffer to be sent to firmware
- * @out_size		Size of out going message
- * @in_msg		Message buffer where the incoming data copied.
+ * @out_msg:		Message buffer to be sent to firmware
+ * @out_size:		Size of out going message
+ * @in_msg:		Message buffer where the incoming data copied.
  *			This buffer is allocated by calling
- * @in_size		Max size of incoming message
+ * @in_size:		Max size of incoming message
  *
  * Return: Number of bytes copied in the in_msg on success, negative
  * error code on failure.
@@ -435,7 +436,7 @@ static void process_recv(struct ishtp_cl *loader_ishtp_cl,
 
 /**
  * loader_cl_event_cb() - bus driver callback for incoming message
- * @device:		Pointer to the ishtp client device for which this
+ * @cl_device:		Pointer to the ishtp client device for which this
  *			message is targeted
  *
  * Remove the packet from the list and process the message by calling
@@ -536,7 +537,7 @@ static int ish_query_loader_prop(struct ishtp_cl_data *client_data,
 }
 
 /**
- * ish_fw_xfer_ishtp()	Loads ISH firmware using ishtp interface
+ * ish_fw_xfer_ishtp() - Loads ISH firmware using ishtp interface
  * @client_data:	Client data instance
  * @fw:			Pointer to firmware data struct in host memory
  *
@@ -733,7 +734,7 @@ static int ish_fw_xfer_direct_dma(struct ishtp_cl_data *client_data,
 }
 
 /**
- * ish_fw_start()	Start executing ISH main firmware
+ * ish_fw_start() -	Start executing ISH main firmware
  * @client_data:	client data instance
  *
  * This function sends message to Shim firmware loader to start
@@ -756,7 +757,7 @@ static int ish_fw_start(struct ishtp_cl_data *client_data)
 }
 
 /**
- * load_fw_from_host()	Loads ISH firmware from host
+ * load_fw_from_host() - Loads ISH firmware from host
  * @client_data:	Client data instance
  *
  * This function loads the ISH firmware to ISH SRAM and starts execution
-- 
2.27.0


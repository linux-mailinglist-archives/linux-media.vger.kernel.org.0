Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F8E11B7C8
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387650AbfLKQKP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:10:15 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:58077 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730701AbfLKQKO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:10:14 -0500
Received: from [IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946]
 ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4Z1iY3QXapzpf4Z2iSLDu; Wed, 11 Dec 2019 17:10:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576080612; bh=MaQBzeeOchKNMsCa1kTCBJOs6orHhbBr5JcwI/rwbCE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rf7jgxv0s7s0Zlj8dYe0JRUAGsmx/OQqfiVyT61EvLNkdE5IWohdUygBkB16UT/WI
         mh6cPFOs2AaLe+Za3G/SMs+r3qBuat5WHmiAgrCHXGSbqqgfFXFTuA35M3qanYA+V/
         XPbydWWznWnIFe+mCLCVxFFw5bSdgeQNTnOIcAqChleK3yNIrEVWVxRbxja9ie53Bc
         THgHqaD+1zTomVVbWx8ziULYOwPA4246rBdWPAVwGoYigx6YDlBAX/zRdNZIeFH2v1
         9/u3VPAMSrLCStRWOZzo3RrQCUdgkyJVcGTlJ5r9ulA9gjSCc5tq6FY+ZI+zBMMA1n
         dvZBfOh2aGG3A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.5] cec: avoid decrementing transmit_queue_sz if it is 0
Message-ID: <2209c858-bbe3-fd0f-3e6d-c799888dd404@xs4all.nl>
Date:   Wed, 11 Dec 2019 17:10:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAEunf+732qZ87a/9sagY9+kUm0JVrdGbPG5VGRvNiQ43ZxGXyBDh51AdIyAYh2pMA31Ijdp5zgiHYA28EvwQFxHVBcjtZutc+cJ/J70pCq0MZmHBrya
 hE+DVUAeOCwpXuNBmClJmmSsxamBaLEdrEKhTXMuYPH7GCE/EJQfP3YphTa10mpx/Z810tn6+t+c4h1ACUqgjqV3bVvv5bYZLVkMLClTFGzVTFyb4ZhotVsp
 Wrvpz4Hrf2Tuydw5Bnmkvcbt9A9bOwT6VNM9lTLAGT0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

WARN if transmit_queue_sz is 0 but do not decrement it.
The CEC adapter will become unresponsive if it goes below
0 since then it thinks there are 4 billion messages in the
queue.

Obviously this should not happen, but a driver bug could
cause this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: <stable@vger.kernel.org>      # for v4.12 and up
---
 drivers/media/cec/cec-adap.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 9340435a94a0..d96add70b293 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -380,7 +380,8 @@ static void cec_data_cancel(struct cec_data *data, u8 tx_status)
 	} else {
 		list_del_init(&data->list);
 		if (!(data->msg.tx_status & CEC_TX_STATUS_OK))
-			data->adap->transmit_queue_sz--;
+			if (!WARN_ON(!data->adap->transmit_queue_sz))
+				data->adap->transmit_queue_sz--;
 	}

 	if (data->msg.tx_status & CEC_TX_STATUS_OK) {
@@ -432,6 +433,14 @@ static void cec_flush(struct cec_adapter *adap)
 		 * need to do anything special in that case.
 		 */
 	}
+	/*
+	 * If something went wrong and this counter isn't what it should
+	 * be, then this will reset it back to 0. Warn if it is not 0,
+	 * since it indicates a bug, either in this framework or in a
+	 * CEC driver.
+	 */
+	if (WARN_ON(adap->transmit_queue_sz))
+		adap->transmit_queue_sz = 0;
 }

 /*
@@ -522,7 +531,8 @@ int cec_thread_func(void *_adap)
 		data = list_first_entry(&adap->transmit_queue,
 					struct cec_data, list);
 		list_del_init(&data->list);
-		adap->transmit_queue_sz--;
+		if (!WARN_ON(!data->adap->transmit_queue_sz))
+			adap->transmit_queue_sz--;

 		/* Make this the current transmitting message */
 		adap->transmitting = data;
-- 
2.23.0


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C22F1123AC
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 08:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbfLDHwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 02:52:14 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45969 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725839AbfLDHwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Dec 2019 02:52:14 -0500
Received: from [192.168.2.10] ([31.45.23.139])
        by smtp-cloud9.xs4all.net with ESMTPA
        id cPSCiFaAjuT63cPSGiVdAU; Wed, 04 Dec 2019 08:52:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575445932; bh=bs6toAQdKez3jETigr+UGwvt5zFmXOz01nOcVrjEsCo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Bf+HvRZA79f5idUyiLUlU6aWGUB+HapKkpEZQHQ/rIokIdfnNWknoEA+DPXUvN/bB
         GaWdhdDC48sKHVvt6B0s7tPeCOfkSiqlvvpjJy4hyYd7vm700wfEjE7n6KPQybT5uu
         1kROcZJZHWJCeq8Sane3zBWU9dRkruEsIIpLOzl1d0GuoVeOBYXatWAsxuESHBJ1xi
         +S0DqcHJ9wUCAHHELIrok3sXq/AnPylPc0M7NCahcKZbtQ/1Hh0OM3kNgIIyNCq3Ti
         WMetd4Glar3kIkDClV40LO7oQzQmzsTQswlFzkBUJmS4d9ozsaKyD/lKrwro86CO30
         izSwqq/ew9IOQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2 for v5.5] cec: CEC 2.0-only bcast messages were ignored
Message-ID: <8dc52e35-2f79-87db-7b0e-d9a9917f3579@xs4all.nl>
Date:   Wed, 4 Dec 2019 08:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBEtcwcTSk4zIpv07+t7vH/DDbUiX9Ti4yJ772bST6jTRn+285eAB9n9P1BoC+4+V6YfDtnnhx7irbUmJw9mhvGiUBFQAEBe4N8xSsMRBmStyp9uvmr3
 AKLLaLv50g2IHlvWkMDXX4Y3DIn6Z82GDmbZ4aD5nnbu+I9hPH/OJ3uEARQIR0RcEQYu+Ze7IMbc0Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some messages are allowed to be a broadcast message in CEC 2.0
only, and should be ignored by CEC 1.4 devices.

Unfortunately, the check was wrong, causing such messages to be
marked as invalid under CEC 2.0.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: <stable@vger.kernel.org>      # for v4.10 and up
---
Changes since v1:
- The second condition was wrong as well and allowed the broadcast command
  to be forwarded to CEC 1.4 adapters when it is a 2.0-only broadcast
  command.
---
diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 9340435a94a0..e90c30dac68b 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -1085,11 +1085,11 @@ void cec_received_msg_ts(struct cec_adapter *adap,
 			valid_la = false;
 		else if (!cec_msg_is_broadcast(msg) && !(dir_fl & DIRECTED))
 			valid_la = false;
-		else if (cec_msg_is_broadcast(msg) && !(dir_fl & BCAST1_4))
+		else if (cec_msg_is_broadcast(msg) && !(dir_fl & BCAST))
 			valid_la = false;
 		else if (cec_msg_is_broadcast(msg) &&
-			 adap->log_addrs.cec_version >= CEC_OP_CEC_VERSION_2_0 &&
-			 !(dir_fl & BCAST2_0))
+			 adap->log_addrs.cec_version < CEC_OP_CEC_VERSION_2_0 &&
+			 !(dir_fl & BCAST1_4))
 			valid_la = false;
 	}
 	if (valid_la && min_len) {

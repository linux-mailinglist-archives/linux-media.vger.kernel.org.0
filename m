Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC8118CC7B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 12:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgCTLNn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 07:13:43 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:48799 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726726AbgCTLNn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 07:13:43 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id FFarj11w3fHuvFFaujhffg; Fri, 20 Mar 2020 12:13:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584702820; bh=ukSmUBwf59Us7W6MbiboUT3fSy+kYLSXfefeS36JOWY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BizCzDxmmIQiqMlqoNtW3c9IbeEcaw5KwPVJGdmJTVLPTrHUfX33Za95sc5cFQ11Q
         9umclj5Jgz56HNynsCQKuHuMcK7+K/ex7rlHYd+FSwrMbMYkfU/1AXU3MUCsqrx1eq
         S323AyHcvjNpzb7wZgvXdakz/S8OF5If0Xb19xdz+DKUT2fH3+xsXBzbPVohJUg9c1
         3sB2PCogKKWGR7jcsVMv8bmNtC1GF629rk2+K60x90oQ/MV/otm3wZZxFBFEpWjncO
         LWGaQElLH7XdtT3YvKyo27BibpVHztQ6VDcFNc0ZcVUyBkFGbsssAuW9vd7WYpjxRH
         RN/WV9QlwW0TA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.7] vivid: fix incorrect PA assignment to HDMI outputs
Message-ID: <4fcb1ead-8b6e-8538-702a-f2293bb693f5@xs4all.nl>
Date:   Fri, 20 Mar 2020 12:13:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOG8KzjcCB046+zlfHXf0QiGsS88uFVNCA2FYtN1A0Laehv6nSU/ZoLPHyQwDQk17ro31NU9pmiPCzxhUGPJFkiQjuvpgWh9hJALyAfcdbKvyx6V2asn
 ql1hHcmi1DElhlZ7hg1MFwLY3ARqcnEzDxnod2Bg12DcEePxhfp9osNCJjinzd9x89feh2duNQdlpxMJobNiWn3cC6G64nAyk0I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The initial physical address was one too low for the outputs.
E.g. if 1.0.0.0 was expected, then it was set to 0.0.0.0, and
2.0.0.0 became 1.0.0.0.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Johan Korsnes <johan.korsnes@gmail.com>
Fixes: 4ee895e71abb ("media: vivid: reorder CEC allocation and control set-up")
---
 drivers/media/platform/vivid/vivid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index c62c068b6b60..6c740e3e6999 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -1571,8 +1571,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 			}
 			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI output %d\n",
 				  dev_name(&dev->cec_tx_adap[i]->devnode.dev), i);
-			if (i <= out_type_counter[HDMI])
-				cec_s_phys_addr(dev->cec_tx_adap[i], i << 12, false);
+			if (i < out_type_counter[HDMI])
+				cec_s_phys_addr(dev->cec_tx_adap[i], (i + 1) << 12, false);
 			else
 				cec_s_phys_addr(dev->cec_tx_adap[i], 0x1000, false);
 		}
-- 
2.25.1


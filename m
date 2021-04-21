Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1518D3665C8
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 08:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbhDUHAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:00:13 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:39468 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhDUHAM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:00:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618988380; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=13rAVGKUFpevoSedkw92y+WaaRMLqjt32qYzcY4nBL0=; b=TMy7KBMcI3FJmt0P9AhQYscm1wLobi3hwve8RljLH60XUwEfa/r9zjWtECxUtAaOLOta4fsp
 wOZcVeUKRRv1AKv++/thm63ECurhKdNkaTDBk67YMMDrfTodCLuTElE0qXylRmDIjhyZ6Zq/
 KhprFil6nSmPIqWr6RK4KjpQtNE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 607fcd57a817abd39a41e33c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Apr 2021 06:59:35
 GMT
Sender: smagar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF8FCC4338A; Wed, 21 Apr 2021 06:59:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: smagar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CF305C433D3;
        Wed, 21 Apr 2021 06:59:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 21 Apr 2021 12:29:32 +0530
From:   smagar@codeaurora.org
To:     linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, mchehab@infradead.org,
        stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Cc:     vgarodia@codeaurora.org, dikshita@codeaurora.org,
        adhudase@codeaurora.org, sampnimm@codeaurora.org,
        mansur@codeaurora.org
Subject: Request to update venus-5.10 FW files
Message-ID: <8885c6fbfcc91043a5406cf6e528e0b9@codeaurora.org>
X-Sender: smagar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Team,

Please include updated firmware bins for venus-5.10.

Snapshot of pull request is as below, let me know if anything is 
missing.



The following changes since commit 
5c893c65b862906a627cea238ae8c2d099027dee:

   Updated Venus firmware files for v5.10 (2021-04-20 11:48:28 +0530)

are available in the git repository at:

   https://github.com/suraj714/linux-firmware-venus.git master

for you to fetch changes up to 2565c9d2576ce1275206483e106d6fb627ace042:

   qcom :venus_v5.10: updated venus firmware files for v5.10 (2021-04-21 
12:04:59 +0530)

----------------------------------------------------------------
smagar (1):
       qcom :venus_v5.10: updated venus firmware files for v5.10

  qcom/sc7280/vpu20_1v.b00          | Bin 0 -> 692 bytes
  qcom/sc7280/vpu20_1v.b01          | Bin 0 -> 7376 bytes
  qcom/sc7280/vpu20_1v.b02          | Bin 0 -> 300 bytes
  qcom/sc7280/vpu20_1v.b03          | Bin 0 -> 20 bytes
  qcom/sc7280/vpu20_1v.b04          | Bin 0 -> 20 bytes
  qcom/sc7280/vpu20_1v.b05          | Bin 0 -> 20 bytes
  qcom/sc7280/vpu20_1v.b06          | Bin 0 -> 20 bytes
  qcom/sc7280/vpu20_1v.b07          | Bin 0 -> 24 bytes
  qcom/sc7280/vpu20_1v.b08          | Bin 0 -> 16 bytes
  qcom/sc7280/vpu20_1v.b09          | Bin 0 -> 939184 bytes
  qcom/sc7280/vpu20_1v.b10          | Bin 0 -> 42976 bytes
  qcom/sc7280/vpu20_1v.b11          |   0
  qcom/sc7280/vpu20_1v.b12          |   0
  qcom/sc7280/vpu20_1v.b13          |   0
  qcom/sc7280/vpu20_1v.b14          |   0
  qcom/sc7280/vpu20_1v.b15          |   0
  qcom/sc7280/vpu20_1v.b16          |   0
  qcom/sc7280/vpu20_1v.b17          |   0
  qcom/sc7280/vpu20_1v.b18          |   0
  qcom/sc7280/vpu20_1v.b19          |   1 +
  qcom/sc7280/vpu20_1v.mbn          | Bin 0 -> 2031188 bytes
  qcom/sc7280/vpu20_1v.mdt          | Bin 0 -> 8068 bytes
  qcom/sc7280/vpu20_1v_unsigned.mbn | Bin 0 -> 2031188 bytes
  23 files changed, 1 insertion(+)
  create mode 100644 qcom/sc7280/vpu20_1v.b00
  create mode 100644 qcom/sc7280/vpu20_1v.b01
  create mode 100644 qcom/sc7280/vpu20_1v.b02
  create mode 100644 qcom/sc7280/vpu20_1v.b03
  create mode 100644 qcom/sc7280/vpu20_1v.b04
  create mode 100644 qcom/sc7280/vpu20_1v.b05
  create mode 100644 qcom/sc7280/vpu20_1v.b06
  create mode 100644 qcom/sc7280/vpu20_1v.b07
  create mode 100644 qcom/sc7280/vpu20_1v.b08
  create mode 100644 qcom/sc7280/vpu20_1v.b09
  create mode 100644 qcom/sc7280/vpu20_1v.b10
  create mode 100644 qcom/sc7280/vpu20_1v.b11
  create mode 100644 qcom/sc7280/vpu20_1v.b12
  create mode 100644 qcom/sc7280/vpu20_1v.b13
  create mode 100644 qcom/sc7280/vpu20_1v.b14
  create mode 100644 qcom/sc7280/vpu20_1v.b15
  create mode 100644 qcom/sc7280/vpu20_1v.b16
  create mode 100644 qcom/sc7280/vpu20_1v.b17
  create mode 100644 qcom/sc7280/vpu20_1v.b18
  create mode 100644 qcom/sc7280/vpu20_1v.b19
  create mode 100644 qcom/sc7280/vpu20_1v.mbn
  create mode 100644 qcom/sc7280/vpu20_1v.mdt
  create mode 100644 qcom/sc7280/vpu20_1v_unsigned.mbn

Regards,
Suraj Magar

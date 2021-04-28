Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7456736D767
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 14:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236891AbhD1Mdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 08:33:46 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:47711 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237167AbhD1Mdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 08:33:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619613179; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=8ApIFdhEvHB7ONJYT4AKP5vpkpB0yYv72B6HGLUQjZ4=; b=WHv4dlKiJnjSRD7Zna5U2n6VW09VKrfqwsE+V6zeSXs7DiLXw0DYGOjESMG53TM3F6lyCXNL
 j+dSxyZr2AU2rQxP2H2ktI5bUGIZIYDSQZsCkNG+w7KyZU6UP2dpeEVERG4vM7Rycq+M15rL
 NWdm4SeOMgfWf45+QUM82wV6aV8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 608955ee2cc44d3aea4ac1c0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 12:32:46
 GMT
Sender: smagar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1B0AC4338A; Wed, 28 Apr 2021 12:32:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: smagar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DB7BC433F1;
        Wed, 28 Apr 2021 12:32:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 28 Apr 2021 18:02:44 +0530
From:   smagar@codeaurora.org
To:     linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, mchehab@infradead.org,
        stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Cc:     vgarodia@codeaurora.org, dikshita@codeaurora.org,
        adhudase@codeaurora.org, sampnimm@codeaurora.org,
        mansur@codeaurora.org
Subject: Update venus firmware files for v5.4 and venus firmware files for
 VPU-2.0
Message-ID: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
X-Sender: smagar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Team,

Please include updated firmware bins for venus-5.4 and vpu-2.0.

I have fixed comment and title updated.

Removed 0 byte unwanted bins.

Below is combined pull request for venus-5.4 and VPU-2.0.

Please find snapshot of pull request, let me know if anything is 
missing.


The following changes since commit 
85286184d9df1b03bb76049edcfd87c39ce46e94:

   Merge branch 'for-upstream' of 
git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19 
11:34:11 -0400)

are available in the git repository at:

   https://github.com/suraj714/linux-firmware-venus.git master

for you to fetch changes up to 6cdef281cd16d967ad89c01af6fdda85529a2d80:

   qcom: Add venus firmware files for VPU-2.0 (2021-04-28 14:42:48 +0530)

----------------------------------------------------------------
smagar (2):
       qcom: update venus firmware files for v5.4
       qcom: Add venus firmware files for VPU-2.0

  WHENCE                    |  34 +++++++++++++++++++++++++++++++++-
  qcom/venus-5.4/venus.b00  | Bin 212 -> 212 bytes
  qcom/venus-5.4/venus.b01  | Bin 6808 -> 6808 bytes
  qcom/venus-5.4/venus.b02  | Bin 873680 -> 873596 bytes
  qcom/venus-5.4/venus.b03  | Bin 33792 -> 33792 bytes
  qcom/venus-5.4/venus.mbn  | Bin 919792 -> 919708 bytes
  qcom/venus-5.4/venus.mdt  | Bin 7020 -> 7020 bytes
  qcom/vpu-2.0/vpu20_1v.b00 | Bin 0 -> 692 bytes
  qcom/vpu-2.0/vpu20_1v.b01 | Bin 0 -> 7376 bytes
  qcom/vpu-2.0/vpu20_1v.b02 | Bin 0 -> 300 bytes
  qcom/vpu-2.0/vpu20_1v.b03 | Bin 0 -> 20 bytes
  qcom/vpu-2.0/vpu20_1v.b04 | Bin 0 -> 20 bytes
  qcom/vpu-2.0/vpu20_1v.b05 | Bin 0 -> 20 bytes
  qcom/vpu-2.0/vpu20_1v.b06 | Bin 0 -> 20 bytes
  qcom/vpu-2.0/vpu20_1v.b07 | Bin 0 -> 24 bytes
  qcom/vpu-2.0/vpu20_1v.b08 | Bin 0 -> 16 bytes
  qcom/vpu-2.0/vpu20_1v.b09 | Bin 0 -> 939184 bytes
  qcom/vpu-2.0/vpu20_1v.b10 | Bin 0 -> 42976 bytes
  qcom/vpu-2.0/vpu20_1v.b19 |   1 +
  qcom/vpu-2.0/vpu20_1v.mbn | Bin 0 -> 2031188 bytes
  qcom/vpu-2.0/vpu20_1v.mdt | Bin 0 -> 8068 bytes
  21 files changed, 34 insertions(+), 1 deletion(-)
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b00
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b01
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b02
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b03
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b04
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b05
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b06
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b07
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b08
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b09
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b10
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b19
  create mode 100644 qcom/vpu-2.0/vpu20_1v.mbn
  create mode 100644 qcom/vpu-2.0/vpu20_1v.mdt


Regards,
Suraj Magar

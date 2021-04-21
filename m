Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E9E366516
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 07:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhDUF7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 01:59:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29436 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230343AbhDUF7F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 01:59:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618984713; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=883ObsitAEC5WcYe147JBLE4eVGwD6VXGrS3kyn+sZI=; b=Kvn/LF19xKU2myucn1qYvE6fsggEQSFYFMDfVGaLy7XNmvEpTcZK4c+FUIXDlUj9Us/2g7Ps
 zL25UKYxkaxvNlnAgL6xsDSfEWlrYQVkxnwPKMGME7Xz+u6R/ovB/kVeFsaSKibu1BTGc3U0
 mCPTkhGRpcxwdTErLWCjUCweXSo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 607fbefcfebcffa80f634541 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Apr 2021 05:58:20
 GMT
Sender: smagar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 78F37C43460; Wed, 21 Apr 2021 05:58:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: smagar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA7F3C433F1;
        Wed, 21 Apr 2021 05:58:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 21 Apr 2021 11:28:19 +0530
From:   smagar@codeaurora.org
To:     linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, mchehab@infradead.org,
        stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Cc:     vgarodia@codeaurora.org, dikshita@codeaurora.org,
        pbadge@codeaurora.org, adhudase@codeaurora.org,
        sampnimm@codeaurora.org, c_mansur@codeaurora.org
Subject: Request to update venus-5.4 FW files
Message-ID: <f90802a86e80b6d9cc96ea8dd6aef4d8@codeaurora.org>
X-Sender: smagar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Team,

Please include updated firmware bins for venus-5.4.

Snapshot of pull request is as below, let me know if anything is 
missing.


The following changes since commit 
85286184d9df1b03bb76049edcfd87c39ce46e94:

   Merge branch 'for-upstream' of 
git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19 
11:34:11 -0400)

are available in the git repository at:

   https://github.com/suraj714/linux-firmware-venus.git master

for you to fetch changes up to 5c893c65b862906a627cea238ae8c2d099027dee:

   Updated Venus firmware files for v5.10 (2021-04-20 11:48:28 +0530)

----------------------------------------------------------------
smagar (1):
       Updated Venus firmware files for v5.10

  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
  qcom/venus-5.4/venus.b02 | Bin 873680 -> 873596 bytes
  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
  qcom/venus-5.4/venus.mbn | Bin 919792 -> 919708 bytes
  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
  6 files changed, 0 insertions(+), 0 deletions(-)


Regards,
Suraj Magar

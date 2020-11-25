Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5092C3B41
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 09:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgKYIlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 03:41:37 -0500
Received: from z5.mailgun.us ([104.130.96.5]:33753 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726192AbgKYIlh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 03:41:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606293697; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=zwqctgpIhelDb2//GbJgM8KKbA9HL3WrJCO7IaxcSd4=; b=NEakJamVoYQw4cAKyqset0LV1mdIvKI/bnVOSJYUzOj+rCh2op/WzPR13Nt7iwpbQuU68oK5
 TGGug6FU3AzjXYIw1ejDF4y017oD7rAGQTKw80Tx9kjDx8ezT4fIvpmNgrDrCkK0WtCQP0iK
 p8EAHCgUuo9v/NO/6J8mU9uo3a4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fbe18c00c9500dc7b9b9fbd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 08:41:36
 GMT
Sender: asitshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 647CFC43464; Wed, 25 Nov 2020 08:41:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: asitshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC1EDC43460;
        Wed, 25 Nov 2020 08:41:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 25 Nov 2020 14:11:35 +0530
From:   asitshah@codeaurora.org
To:     linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
        mchehab@infradead.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Cc:     vgarodia@codeaurora.org, dikshita@codeaurora.org,
        sampnimm@codeaurora.org
Subject: Update venus firmware files for v5.4 and v5.2
Message-ID: <78c092f9b8d8b3833d7ac4f36253f7d3@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Team,

Please include updated Venus Firmware bins for v5.4 and v5.2 .

Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>>> 

The following changes since commit 
b362fd4cb8963ad75517dbcf424974f65a29a60e:

   Mellanox: Add new mlxsw_spectrum firmware xx.2008.2018 (2020-11-24 
09:55:03 -0500)

are available in the git repository at:

   https://github.com/shahasit/linux-firmware-video/tree/master

for you to fetch changes up to e6459dce893a5b8dbf684762d5396acc11149186:

   qcom : updated venus firmware files for v5.2 (2020-11-25 14:02:10 
+0530)

----------------------------------------------------------------
Asit Shah (2):
       qcom : updated venus firmware files for v5.4
       qcom : updated venus firmware files for v5.2

  qcom/venus-5.2/venus.b00 | Bin 212 -> 212 bytes
  qcom/venus-5.2/venus.b01 | Bin 6600 -> 6808 bytes
  qcom/venus-5.2/venus.b02 | Bin 837304 -> 856432 bytes
  qcom/venus-5.2/venus.b03 | Bin 33640 -> 33648 bytes
  qcom/venus-5.2/venus.mbn | Bin 883264 -> 902400 bytes
  qcom/venus-5.2/venus.mdt | Bin 6812 -> 7020 bytes
  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
  qcom/venus-5.4/venus.b02 | Bin 873680 -> 873704 bytes
  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
  qcom/venus-5.4/venus.mbn | Bin 919792 -> 919816 bytes
  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
  12 files changed, 0 insertions(+), 0 deletions(-)

<<<<<<

Regards,
Asit

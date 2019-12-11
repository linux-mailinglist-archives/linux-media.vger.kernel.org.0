Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEA9311A5F4
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 09:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbfLKIhS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 03:37:18 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:37556
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726845AbfLKIhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 03:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576053437;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Subject:Message-ID;
        bh=vOD0y0bF78anF7hD1xvYENe8jRmoFPCWo9m4+Hl5kg0=;
        b=XYwoG17euKFknVR1q8nz7qYWf4/w62cKQDhuVsB40wA2FqHuwdVLHArGygzMQWVM
        WxRhfvKg5oPLlNVKubpKw5s9nfwkVKpx235mMKLCvY33GTQAhCXj4A79eza6O/ybXr+
        PqBlhk9AyHppSQVtd3J0EnY4+wE95yyWQVZCZmm8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576053437;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Subject:Message-ID:Feedback-ID;
        bh=vOD0y0bF78anF7hD1xvYENe8jRmoFPCWo9m4+Hl5kg0=;
        b=XMjY7/E+z8Ne8qK2MeVzKkA1LcsD0B2z3nomLQLkz9Huh24XxYlwXX1w9emiU48/
        WxBXsr9/nY+6uvn+EoeX5tpDKfKTzn6PX6whB37EkZKi+misC1CCb4FarBwFn436dG2
        liIWRVxuuzXj7m8ngQLkjjZZAUY0x/czayco3oyQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Dec 2019 08:37:17 +0000
From:   dikshita@codeaurora.org
To:     linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
        mchehab@infradead.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org, acourbot@google.com,
        linux-media-owner@vger.kernel.org
Subject: qcom: add firmware file for Venus on SC7180
Message-ID: <0101016ef41af542-553255b1-8b20-4d9a-a21b-271f28953afb-000000@us-west-2.amazonses.com>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.12.11-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


This pull request adds firmware files for Venus h/w codec found on the
Qualcomm SC7180 Chipset

The following changes since commit 
e8a0f4c9314754d8b2cbe9840357d88a861c438a:

   rtl_nic: add firmware rtl8168fp-3 (2019-11-18 16:16:01 -0500)

are available in the git repository at:

   https://github.com/dikshitaagarwal/video_firmware_5.4.git master

for you to fetch changes up to e10ed2126e33582c6c9c5896ca7c16907980784c:

   qcom: update venus firmware files for v5.4 (2019-12-11 13:53:22 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
       qcom: update venus firmware files for v5.4

  WHENCE                   |  10 ++++++++++
  qcom/venus-5.4/venus.b00 | Bin 0 -> 212 bytes
  qcom/venus-5.4/venus.b01 | Bin 0 -> 6808 bytes
  qcom/venus-5.4/venus.b02 | Bin 0 -> 870812 bytes
  qcom/venus-5.4/venus.b03 | Bin 0 -> 33792 bytes
  qcom/venus-5.4/venus.b04 |   1 +
  qcom/venus-5.4/venus.mbn | Bin 0 -> 916924 bytes
  qcom/venus-5.4/venus.mdt | Bin 0 -> 7020 bytes
  8 files changed, 11 insertions(+)
  create mode 100644 qcom/venus-5.4/venus.b00
  create mode 100644 qcom/venus-5.4/venus.b01
  create mode 100644 qcom/venus-5.4/venus.b02
  create mode 100644 qcom/venus-5.4/venus.b03
  create mode 100644 qcom/venus-5.4/venus.b04
  create mode 100644 qcom/venus-5.4/venus.mbn
  create mode 100644 qcom/venus-5.4/venus.mdt

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 797A312A137
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2019 13:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfLXMMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Dec 2019 07:12:51 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:58362 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726195AbfLXMMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Dec 2019 07:12:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577189561; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IFZOTR8XW9iOWd65uY/xT59CKc3w+pTje1cV3Wl7IOQ=;
 b=w4Zyg4g7rc12E+H7V7Cy/GPgYNIKU0Kk+yHJvM0WP02P4v56glavbRJ09DZ5+GJ2x0WKiyA1
 FILUjf/+sdHztYVuZHoj6d8G+X85wEkM2Hq8UGc99oxSNKUA5s3CwZBspdRayhH2jV4y/apn
 8gknMY9pFZaOCi5qA7FSaGFvUvI=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0200b3.7f0160a8a2d0-smtp-out-n02;
 Tue, 24 Dec 2019 12:12:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C97CC4479D; Tue, 24 Dec 2019 12:12:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1D71C43383;
        Tue, 24 Dec 2019 12:12:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 24 Dec 2019 17:42:33 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vgarodia@codeaurora.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: sc7180: Add Venus video codec DT node
In-Reply-To: <17a371c0-d73a-75eb-34f2-c9afb51d46f5@linaro.org>
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
 <1576828760-13176-2-git-send-email-dikshita@codeaurora.org>
 <17a371c0-d73a-75eb-34f2-c9afb51d46f5@linaro.org>
Message-ID: <8a43b13d0cd4a7bcb18e0f1f8259ec72@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-12-20 15:04, Stanimir Varbanov wrote:
> 
> This subnode should be in sc7180-idp.dts, because we assume that by
> default the qcom platforms have TZ.
> 

sc7180.dtsi will not be used on TZ based platforms which was the case 
for SDM845
where sdm845.dtsi was common for TZ (dragonboards) and non TZ(cheza 
boards) based platforms.
So in order to avoid duplicating this node in other board specific dts 
files, it
would be better to have it here itself.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

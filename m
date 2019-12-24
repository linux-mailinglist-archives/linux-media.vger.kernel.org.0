Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4ADB12A1B7
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2019 14:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfLXNYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Dec 2019 08:24:40 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:47995 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726245AbfLXNYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Dec 2019 08:24:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577193879; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KZJmxQ9/BKrr0o/yv/IT63pjYnCfOPQgFptyHdRsL60=;
 b=leJ4yRzXeBWhuyoexuSkAGAkzCQHb7k+yvBOIbYmkzdKHMuZkBuNg79kYxBeEDhuwhDViGyM
 5DbEIBNzOyVX3WG7fPOjIpRroIjiokI6qomTYeuat5Gr62WSaUvs2V3o89YjE0FFF3l1c/mm
 9otZftXEkczJ0NlOedTsYYSQCxw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e021193.7fe86c4b40d8-smtp-out-n02;
 Tue, 24 Dec 2019 13:24:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C51F6C433CB; Tue, 24 Dec 2019 13:24:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D517BC43383;
        Tue, 24 Dec 2019 13:24:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 24 Dec 2019 18:54:34 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vgarodia@codeaurora.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: sc7180: Add Venus video codec DT node
In-Reply-To: <8a43b13d0cd4a7bcb18e0f1f8259ec72@codeaurora.org>
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
 <1576828760-13176-2-git-send-email-dikshita@codeaurora.org>
 <17a371c0-d73a-75eb-34f2-c9afb51d46f5@linaro.org>
 <8a43b13d0cd4a7bcb18e0f1f8259ec72@codeaurora.org>
Message-ID: <953ee377ad3968f9df5d5677bb3bf82a@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-12-24 17:42, Sai Prakash Ranjan wrote:
> Hi Stan,
> 
> On 2019-12-20 15:04, Stanimir Varbanov wrote:
>> 
>> This subnode should be in sc7180-idp.dts, because we assume that by
>> default the qcom platforms have TZ.
>> 
> 
> sc7180.dtsi will not be used on TZ based platforms which was the case 
> for SDM845
> where sdm845.dtsi was common for TZ (dragonboards) and non TZ(cheza
> boards) based platforms.
> So in order to avoid duplicating this node in other board specific dts 
> files, it
> would be better to have it here itself.
> 

Sorry, please ignore my previous comment.
sc7180 will be used for compute platforms and some would be TZ based.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

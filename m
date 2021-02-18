Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB68E31EC96
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 17:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234020AbhBRQys (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:54:48 -0500
Received: from z11.mailgun.us ([104.130.96.11]:15696 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233652AbhBRORE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 09:17:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613657776; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=tJX4rE8ABtqKQQqunHr79YkB0O9cnHpfxeT03CsiSsw=;
 b=Vmdzx98To003qXBVvPIXysf+ioyh+N7KBAK/DM+MpnyTZpMxyCtO6vrMMVOrwxldCByIxMty
 UbW1lu9IkcxqnCkZA/pvG9zAvH8MNvrCUYegdkqEDzw0O6Ae01CTgCls0UcWHVg5v+nsc+VJ
 KpxW5PzlSYsJZ67H/k4qGRK13Lk=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 602e76769946643859a1b081 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Feb 2021 14:15:18
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 104D2C43462; Thu, 18 Feb 2021 14:15:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 78746C433C6;
        Thu, 18 Feb 2021 14:15:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 18 Feb 2021 19:45:17 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V8 1/1] i2c: i2c-qcom-geni: Add shutdown callback for i2c
In-Reply-To: <161052087940.3661239.14609415796697267628@swboyd.mtv.corp.google.com>
References: <20210108150545.2018-1-rojay@codeaurora.org>
 <20210108150545.2018-2-rojay@codeaurora.org>
 <161052087940.3661239.14609415796697267628@swboyd.mtv.corp.google.com>
Message-ID: <9ec10130df230a0ff078d9eec47e94b2@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stephen,

On 2021-01-13 12:24, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2021-01-08 07:05:45)
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 214b4c913a13..c3f584795911 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -375,6 +375,32 @@ static void geni_i2c_tx_msg_cleanup(struct 
>> geni_i2c_dev *gi2c,
>>         }
>>  }
>> 
>> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
>> +{
>> +       int ret;
>> +       u32 geni_status;
>> +       struct i2c_msg *cur;
>> +
>> +       /* Resume device, as runtime suspend can happen anytime during 
>> transfer */
>> +       ret = pm_runtime_get_sync(gi2c->se.dev);
>> +       if (ret < 0) {
>> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", 
>> ret);
>> +               return;
>> +       }
>> +
>> +       geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
>> +       if (geni_status & M_GENI_CMD_ACTIVE) {
>> +               cur = gi2c->cur;
> 
> Why don't we need to hold the spinlock gi2c::lock here?
> 

I am not seeing any race here. May I know which race are you suspecting 
here?

>> +               geni_i2c_abort_xfer(gi2c);
>> +               if (cur->flags & I2C_M_RD)
>> +                       geni_i2c_rx_msg_cleanup(gi2c, cur);
>> +               else
>> +                       geni_i2c_tx_msg_cleanup(gi2c, cur);
>> +       }
>> +
>> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
>> +}
>> +
>>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>                                 u32 m_param)
>>  {

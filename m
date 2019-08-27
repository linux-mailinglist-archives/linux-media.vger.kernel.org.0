Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4A39DCDC
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 06:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbfH0Ezb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 00:55:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44998 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbfH0Ezb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 00:55:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B7D9560D35; Tue, 27 Aug 2019 04:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566881730;
        bh=7qpsTH4axezitzHhLydNFE+gyjtLNdBANllESlzxhuY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YFNR+KEARQcYP6fxYu91vTtrDGx8yTq3dc4ktMWjYZfcXXW53qAZKe67S8hoaDQVT
         D7SGrY8PECx6w/dWqWhM3MOMCNGh7qBu7nxZPQTXooIbVgn1dsByX5FzLPeY+rj6JM
         +AcQVhgoJGsWHjOvJK5Y+WHYi7J36poLgFQtWn4s=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 0FC5460C72;
        Tue, 27 Aug 2019 04:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566881730;
        bh=7qpsTH4axezitzHhLydNFE+gyjtLNdBANllESlzxhuY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YFNR+KEARQcYP6fxYu91vTtrDGx8yTq3dc4ktMWjYZfcXXW53qAZKe67S8hoaDQVT
         D7SGrY8PECx6w/dWqWhM3MOMCNGh7qBu7nxZPQTXooIbVgn1dsByX5FzLPeY+rj6JM
         +AcQVhgoJGsWHjOvJK5Y+WHYi7J36poLgFQtWn4s=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Aug 2019 10:25:30 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v6 3/4] media: venus: Update to bitrate based clock
 scaling
In-Reply-To: <cdfde490-8d02-c9a1-5fbd-9ae001692f55@linaro.org>
References: <1563786452-22188-1-git-send-email-amasule@codeaurora.org>
 <1563786452-22188-3-git-send-email-amasule@codeaurora.org>
 <cdfde490-8d02-c9a1-5fbd-9ae001692f55@linaro.org>
Message-ID: <932dad4ac3c585080dfb35c7577b4b3f@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-07-29 17:08, Stanimir Varbanov wrote:
> Hi,
> 
> On 7/22/19 12:07 PM, Aniket Masule wrote:
>> Introduced clock scaling using bitrate, preavious
>> calculations consider only the cycles per mb.
>> Also, clock scaling is now triggered before every
>> buffer being queued to the device. This helps in
>> deciding precise clock cycles required.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 33 
>> +++++++++++++++++++++++++----
>>  1 file changed, 29 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index 2c976e4..edf403d 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -399,17 +399,26 @@ static int scale_clocks(struct venus_inst *inst)
>>  	return ret;
>>  }
>> 
>> -static unsigned long calculate_vpp_freq(struct venus_inst *inst)
>> +static unsigned long calculate_inst_freq(struct venus_inst *inst,
>> +					 unsigned long filled_len)
>>  {
>> -	unsigned long vpp_freq = 0;
>> +	unsigned long vpp_freq = 0, vsp_freq = 0;
>> +	u64 fps = inst->fps;
>>  	u32 mbs_per_sec;
>> 
>>  	mbs_per_sec = load_per_instance(inst);
>>  	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>>  	/* 21 / 20 is overhead factor */
>>  	vpp_freq += vpp_freq / 20;
>> +	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vsp_freq;
>> 
>> -	return vpp_freq;
>> +	/* 10 / 7 is overhead factor */
>> +	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
>> +		vsp_freq += (inst->controls.enc.bitrate * 10) / 7;
>> +	else
>> +		vsp_freq += ((fps * filled_len * 8) * 10) / 7;
> 
> load_per_instance() already taken into account fps, thus I think fps
> should be excluded from calculation.
> 
I will correct this, fps is needed for stream processor frequency 
calculations,
also fps is not needed for vpp.
>> +
>> +	return max(vpp_freq, vsp_freq);
>>  }
>> 

Regards,
Aniket

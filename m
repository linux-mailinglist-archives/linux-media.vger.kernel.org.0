Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0652A55EEF7
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 22:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiF1UNL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 16:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbiF1UMh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 16:12:37 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FEC3C72E
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 13:05:35 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id p9so8608132ilj.7
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 13:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=75Cd31PsyTJcozjJNlb/AonFcdI38SlWjCO+qmrpC3o=;
        b=hh0gioswK5Bcw/aQH4egTOBXIZ+mnD7ya4lthxbHMPomUSSqjpbx5h5AOfLh02oHJB
         U4a3582odVPZxoacCRQTm4ZapA+lQUVPJxnnDXj5RXIjNW8C1UkJee/spEOtJRjXJxxz
         KZg+oc0GJF/PJNKP3YaxUNOobL/q0RcuMoNts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=75Cd31PsyTJcozjJNlb/AonFcdI38SlWjCO+qmrpC3o=;
        b=yxpuCuPzMimjGQ/Tzy9+qkLFECKhPEWNYb96yQzvvB5iLzjUBc6hDnfgEq7nYJau/b
         v1hJE30mCQ8AtZB7Ik4HCv8uauCFMecxpF0q4MCRy7L+IFqQzDDOY9nnN9CUURdeMwSa
         VEuJ88Yn9k2NygwKGUA6IcwEJZRx1LLYFl5Ewg+Y1fOGiBsHjxbcNRd2LcaHsxhomD2U
         6qdrXJzs4ntTSO6dOq7qXyLgCgTHVGaD/If/ymJotE/OT2jrXaTzMjFUcVNeYuGa2LyG
         Xo9P5JyOCqujqGP+7dY9ktdirSJel5xC9Mi2/Q+kplycWfUB6oBCTIkN/+uVZ0lvW3Yo
         FnyA==
X-Gm-Message-State: AJIora9RMs6sOu8dPRMvC70NgdPg+vQrYXoGREIgOxFxpLrG2LXT4s7q
        8BVJ2ctdT0M8oMZHPiu6VzBnOGcSZoV2mA==
X-Google-Smtp-Source: AGRyM1tkFnMAPGPONEX7LfX1j5CHVzsGCbVtI/cMVcyXt75A+f/2pTbtDh3a3lbvPi0TbEzkLddAjg==
X-Received: by 2002:a05:6e02:1608:b0:2d9:3f3e:f0c4 with SMTP id t8-20020a056e02160800b002d93f3ef0c4mr12005848ilu.249.1656446734078;
        Tue, 28 Jun 2022 13:05:34 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id w18-20020a6bd612000000b00674fe816f79sm6866762ioa.7.2022.06.28.13.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 13:05:33 -0700 (PDT)
Subject: Re: [PATCH 3/3] media: vimc: use data link entities enum to index the
 ent_config array
To:     Daniel Oakley <daniel.oakley@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
 <20220616100747.48124-4-daniel.oakley@ideasonboard.com>
 <f676bf50-5aef-f06f-82f8-9c7a93e18656@linuxfoundation.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d9719b46-36d6-7007-1c3f-9f9ed9d6595c@linuxfoundation.org>
Date:   Tue, 28 Jun 2022 14:05:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f676bf50-5aef-f06f-82f8-9c7a93e18656@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/16/22 8:31 AM, Shuah Khan wrote:
> On 6/16/22 4:07 AM, Daniel Oakley wrote:
>> Future additions to the ent_config[] could break the association between
>> the index of the struct vimc_ent_config entries in the ent_config[] array,
>> and the index defined by the enum proposed in the previous patch. Using
>> designated initializers solves this by linking the 2 together clearly in
>> code and prevents the array not reflecting the enum. There is no
>> functional change intended.
>>
>> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> Signed-off-by: Daniel Oakley <daniel.oakley@ideasonboard.com>
>> ---
>>   drivers/media/test-drivers/vimc/vimc-core.c | 22 ++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
> 
> Thank you for the patch to improve code readability. Looks good to me.
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> thanks,
> -- Shuah

These 3 patches are now queued for vimc pull request for Linux 5.20-rc1
to be send to Mauro Chehab.

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=vimc

thanks,
-- Shuah

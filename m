Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B83963DC80
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 18:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiK3R46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 12:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbiK3R46 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 12:56:58 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F8848418
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 09:56:56 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id o5so19370109wrm.1
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 09:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/yfboE8GBvsF2o0XAcHNNlgI3QJRQ4CfM3zu1bAjZk=;
        b=TVpDIr2dN2bMRWM1+cvsD7niKuZPhNiak2jXBxZycQcBTrRZILzm4X4m6mqsjOj24P
         odBcz+m1oskrmFcJ6OS3Oc7/MBRq7XylkiguFSe4Ifo4Sbpz28uknRb79xhqxNmDc2af
         8MnHJ+FUfr9KKVeZrsEoxvYcpJ+Mcdqde+R6V0JHoeTzW2C29dGpZt0m07M7uVfp6TuK
         /xlVawNJYi9TiiKGBZs1y8FWLqDVsyS7MgoZ0R4NPATGT5P0FUc/x4a0+gY53GRsT132
         sNePi3txZ7TgN1HRIosj+UmucrvqLXBaKaGSeyGpGg5dhKXGu183JYthDM2RoiDo4j7h
         fqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/yfboE8GBvsF2o0XAcHNNlgI3QJRQ4CfM3zu1bAjZk=;
        b=XBLgIxJJ1tbRcOUSXY4SW9WemvaYtIZc6mJKgFxzVCFKmRdjHgSvm5awYXFR6M3Sqt
         E0o9sIvc1SYvKtYKDtJKmiFmACUhcoGYKdiPTXMQ0rLU2tJiOoY6fVVwh697mj5+vAkI
         vFoALjOFLGn7Dc6xIfB+xwEdnApa4dHzDKRdQ01ulJp7zktXEYq2AyB18U5dSmB95pGd
         VrdMxvFNBB8XLTaAPMwUL/XNX0bvc0vWpgTZNeG8rF/ELYu1KvBnh+g9dDqK/BT16dxf
         aHWs5463Sb2h3Li2gRxrIGF5QPURNTxyVLpN1LEs0yzEI64jwz2MxqqoroxneZKzTfTk
         1IfA==
X-Gm-Message-State: ANoB5plCRtZxvdyItA3/HuaoP3ZpC8h8MxYSYSCXhRTdcqEKoIpcrqph
        I9NFUdqKpliNqB3P2yyNIOAbdw==
X-Google-Smtp-Source: AA0mqf7RSf3TRivZNMt+x0iR7kT2RFCxCz0PHF4GhD7VvGX8m9HVmadVGgc1stf5xFqmHVXSk9cpEQ==
X-Received: by 2002:a05:6000:52:b0:242:5e7:d301 with SMTP id k18-20020a056000005200b0024205e7d301mr17364812wrx.464.1669831015392;
        Wed, 30 Nov 2022 09:56:55 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j3-20020adfd203000000b002366c3eefccsm2225169wrh.109.2022.11.30.09.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 09:56:54 -0800 (PST)
Message-ID: <7152a291-d559-01d9-bd19-29cea5969c00@linaro.org>
Date:   Wed, 30 Nov 2022 17:56:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robert.foss@linaro.org, akapatra@quicinc.com, jzala@quicinc.com,
        todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221128144210.1028-1-quic_mmitkov@quicinc.com>
 <32736286-9fb8-a1f1-31cb-2fd19d713e9e@linaro.org>
 <179c9db4-cbfd-ef9c-def2-544e3d54f94f@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <179c9db4-cbfd-ef9c-def2-544e3d54f94f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/11/2022 17:04, Milen Mitkov (Consultant) wrote:
> On 30/11/2022 17:50, Bryan O'Donoghue wrote:
>> On 28/11/2022 14:42, quic_mmitkov@quicinc.com wrote:
>>> With these changes, the CSID entity has, as it did previously, a single
>>> sink port (0), and always exposes 4 source ports (1, 2,3, 4). The
>>> virtual channel configuration is determined by which of the source ports
>>> are linked to an output VFE line. For example, the link below will
>>> configure the CSID driver to enable vc 0 and vc 1:
>>>
>>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>> media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
>>
>> Following your instructions here
>>
>> root@linaro-gnome:~# media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> root@linaro-gnome:~# media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
>> root@linaro-gnome:~# media-ctl -l '"msm_csid0":3->"msm_vfe0_rdi2":0[1]'
>> root@linaro-gnome:~# media-ctl -l '"msm_csid0":4->"msm_vfe0_rdi3":0[1]'
>> Unable to parse link: Invalid argument (22)
>>
>> ?
>>
>> ---
>> bod
> 
> Hi Bryan,
> 
> Thanks for the feedback! There are the following IFEs on SM8250 (Titan 
> 4.8):
> 
> IFE0 -> has 3 RDI lines and 1 PIX line
> 
> IFE1 -> has 3 RDI lines and 1 PIX line
> 
> IFELite0 -> has 4 RDI lines
> 
> IFELite1 -> has 4 RDI lines
> 
> so there's no msm_vfe0_rdi3 port for IFE0 and IFE1 at all, only rdi0, 
> rdi1, rdi2. In theory if you link the 4th CSID source port to 
> msm_vfe0_pix the parsing works:
> 
> media-ctl -l '"msm_csid0":4->"msm_vfe0_pix":0[1]'
> 
> However, in practice, there's no PIX support in camss so even if the 
> linking works, the hardware won't get configured properly.
> 
> You can however use the IFELite's 4th RDI port. Due to omission in 
> camss-vfe there isn't any separate logic for naming the sink ports of 
> IFELite's devies so it's still called "pix", even though it's not a pix 
> port. It should be a small code change to fix the naming of the port for 
> IFELite, I could do it as part of this patch set or as a new patch after 
> this patch set gets merged. Which is the preferred way?
> 
> Regards,
> 
> Milen
> 

Hmm, OK the pix mapping works for me, thanks, the

It would be good to fixup the name, maybe as an additional patch.

Also the above description contains important information. IMO its 
worthwhile to include information like that in the git log.

i.e. IFE <-> RDI mapping, IFELite <-> RDI mapping

Also suggest adding example media-ctl commands for the VCs to your git 
log both for yourself to remember - I'm usually logging so that I can 
remind myself - but also for other people to more easily 
replicate/validate your work.

---
bod

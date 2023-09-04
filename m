Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A21791696
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 13:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351265AbjIDL50 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 07:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239271AbjIDL5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 07:57:25 -0400
X-Greylist: delayed 353 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Sep 2023 04:57:22 PDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E24B195
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 04:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693828278; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Re2VABnyguMJkB+MKJE8fc6/8NqutZjzF8+cqJ+ZOS+BzKIz2HP5eV4FoqgJXGceNw
    X1Gptlp1ZMkIGzdBoP4bopGenfI8CYRNE2NDyayYr4x+jm4W63Mxvh3P9bHIM3OUDbuE
    oLfGi6hfSzNRGBPItTuYKr3SliU/YCW+udGL3GE4DlL6Y8Lxd386WNqLqh8HcDPHutfj
    azKV0tJ+7v/wf54f0baxUKVSmIF8fi9QiH6GzdxWXoNB+jCNg2yMkbOpzR/2si1weFGA
    /f5uw/ZuERpQbEWAwjZc6YL/SXyURfei/DMLlImdVJwMpZEkyPbjoQCdMN+vUxAQ2W/k
    dKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693828278;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=eGrON1NZ5QUmeTrPXtBeohLhsT05T/kNeEB9Am9D+t0=;
    b=qlnVfa5LC/uDrt9WSAiLEX3QGAWyoWs/50s/ToFVj/1apn1ce8doCQa5K7ul0ulTdd
    gpZu8pH4obzvmbdHTCcovmBEF2qDm13j5uC4HCRJQclEMv9sdqHOonE3Dbf66kbk+ACR
    aqY5endnyoOznIg3VY5PIDvlVlTx6z7+NKEH8sOslUmY79Vk5pAh/vZZcyT2hUkkfzgl
    ju/XDgNw4/nU55ld+C8HE7GAV+Lxs6jt1//You7H61MsCXdETkM5IF47VHhnZ7IUW9OK
    p/TvEhzydEW3quw+Bn3E/p0SEyP6ihtfNAPMmtJlWNafLhgi6WYkv1b1qbK1cGpQZYHC
    12jA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693828278;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=eGrON1NZ5QUmeTrPXtBeohLhsT05T/kNeEB9Am9D+t0=;
    b=UHWNdI3lo149oeYgdfuqluNcE98fQLcTdJxBmLPOO/3dIZNu4kBwqt1eMHT7O0/zi1
    LAl/h5hDa+D1nKu4FmQ52obVJMmo5RNiohFPOezZuICjS+lOgiT4IJtbk4ARlbSAWbUK
    CbQN6uuQ+vbYSWBYP7QubQ+W/3ZeMCZN8ogvYwsMsNLfBddpqqQBpxaXwGrB0fnU3Ctk
    9pJBlngVPm1JtGPgNGIqcLnQsouGyrE8Vdhdgqru/ZW0fGnJnpuECT/RVuitTlmeltbj
    pZbEB4kikcjY+cIhP3QWDJ1z0Oj8fIGmo+53JWye5YmeQFMPuVbCv/lg0FeWisHpMPL1
    fhIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693828278;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=eGrON1NZ5QUmeTrPXtBeohLhsT05T/kNeEB9Am9D+t0=;
    b=Ven+4xCdkR8oWlnO2u+Tn8wOxIrWMpmvU8flfjPZ/V0hXHPPNIDXf8K3k5fS65LLwu
    LkyFlI6h3kpRfLiPZCDw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjU7QjNpsZpFYoBv3e+kDWne4OsVw=="
Received: from [IPV6:2a02:8109:8980:4474:140a:9194:7dc7:10e7]
    by smtp.strato.de (RZmta 49.8.2 AUTH)
    with ESMTPSA id 3b5276z84BpIKKl
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Sep 2023 13:51:18 +0200 (CEST)
Message-ID: <f3c18b6e-0a3d-49bd-9553-71bd610588c2@xenosoft.de>
Date:   Mon, 4 Sep 2023 13:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BTTV] [FSL P50x0] [PASEMI] TV Time doesn't work anymore after
 dropping the overlay support
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Darren Stevens <darren@stevens-zone.net>,
        mad skateman <madskateman@gmail.com>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
References: <94a617be-00b3-6dc8-eb7d-ae13c6fffae5@xenosoft.de>
 <cb82b6c1-035c-cc6b-2843-6b87ed6315ac@xenosoft.de>
 <f23204ec-ff42-5907-fa28-c1975a87f4e6@xs4all.nl>
 <79ea7cc5-6981-a791-7fed-7a6e27225000@xenosoft.de>
 <a02d481b-562c-803a-a71d-b8d95ba7ebb5@xs4all.nl>
 <82799d05-db42-c6a3-51ef-15e262344d4f@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <82799d05-db42-c6a3-51ef-15e262344d4f@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05 May 2023 at 09:20 am, Christian Zigotzky wrote:
> On 05 May 2023 at 08:45 am, Hans Verkuil wrote:
>> On 05/05/2023 08:25, Christian Zigotzky wrote:
>>> On 02 May 2023 at 08:57 am, Hans Verkuil wrote:
>>>> If v4l2-ctl fails, then try again
>>>> after applying this series:
>>>>
>>>> https://patchwork.linuxtv.org/project/linux-media/cover/cover.1682995256.git.deborah.brouwer@collabora.com/ 
>>>>
>>> Your patch series solved the issue. Thanks a lot!
>> Nice, but somewhat unexpected :-)
>>
>> I'm a little bit unsure how to proceed: the 6.4 kernel will remove 
>> destructive overlay
>> support, but it won't have this series yet, that's for 6.5. But that 
>> would make 6.4
>> unusable for you.
>>
>> I might have to revert the overlay removal, at least for bttv.
>>
>> Regards,
>>
>>     Hans
> Hans,
>
> You don't need to revert the overlay removal because your patch series 
> work with the latest git kernel (6.4).
>
> Thanks for your help,
>
> Christian

Hello Hans,

I successfully used your patches for the kernel 6.5. Everything works 
without any problems with your patch series from May.

Your patches have been added with the latest Media updates [1] for the 
kernel 6.6.

The patches works but I have a green bar in the bottum of the window if 
I use the composite input. [2]

I don't have this green bar with your May patch series.

Could you please check your latest patches?

Thanks,

Christian

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=307d59039fb26212a84a9aa6a134a7d2bdea34ca
[2] https://i.ibb.co/D4K6j2c/Kernel-6-6-alpha2-Power-PC.png



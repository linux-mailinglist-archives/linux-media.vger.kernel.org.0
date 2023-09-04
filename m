Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4597916C5
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 14:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352935AbjIDMCs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 08:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352916AbjIDMCn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 08:02:43 -0400
X-Greylist: delayed 499 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Sep 2023 05:02:39 PDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B95ACD4
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 05:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693828949; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=G+O44nqXs4X3V4NzKuuWMopM9upPK3runCkL3Snq9aJEkiM4GFw9XZ0YPMt0hPnQG1
    gIYY/dbIGL4OTfOi9TmQSAvLPooN8okzOuR8lL6Z8WdL/HrmK307wt11eXsOshl1aPYX
    fCYXqGmn4WQFqQrw4kJBRICil1ynK97RgZo2HfN5GfEJoi6gX95vKI19jznIhEk+g96f
    LwGFCcJPwTEwOmGmq6QBFxA3xgrSAB1oD4uOorCcSGKwUjyr5wWU96lUU8+xnN31XlKt
    zfzVDF/C+mYxAcKqxU5IUW1lITg3B5PrjLAcvVpLtLQxWDfaGLc63XsZFt9qZ9504ppq
    h0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693828949;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=9TzdrilTih4uGXNpepMDwQSY0KnKh+xkAZJcPisyKTA=;
    b=PmiBAngPen6fSBG5Wh+6L/RC6o6BPXcNy1Of3+w6EMIsqZYmpAxmN8fITH2AUxzQ5D
    7JNMSg0HLncUkJ0H0HaOnyzOTCLvQNZz5/gVqT7/ZSm8tgQzkXab24kekvdbSxyai9hw
    BD8EqjWKeoaY0WgRiq13NN6FenDfPizQO/wROdfsfGXhbj4uvgSLaKCyYnx4xouNRhrG
    mwRghYBvmrQtsd/435H4I7n04hkg0j1H95GXAN9jMHiVnyIiQvWT+AwUqu7BSHfSvszZ
    8+Qzkf1/DcVaOCdDilylIY4tztPXmX24Ozmvj2NTKoCcgwlmKoi7uPZwPHzf7OoYp3Vl
    8NzA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693828949;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=9TzdrilTih4uGXNpepMDwQSY0KnKh+xkAZJcPisyKTA=;
    b=fZQdTd0meLI99vnjPVwpb6ffuJqUx60HjJSV7kGxfcIzwCPLSGdrfE9u8wfsWo0Vm4
    y14HNigKklmzdqWTsRQxTZs+GyF9I2S5uYXnwbIfFvq6tgS0q+7UtZ38B1FsVlc77QMZ
    b6Mem3MCQiD3AduhANDqCYGEXaJcZWE4CTta+1mTwDVRhxxu1qCtfh89v8aCvpzUClEj
    zBwjN9wKx4SyxzoxlCXe5LDj1mK75bUukH5drlb6QF2g005QyB+nynp+3JrQ+Eb+Ifs7
    6XmcNqRcMjTS0CZOpKWsz6mZN9eo9b3dj+ngEZZVMthIRK3pRDZuCmebZY8R0jRxOmrO
    mM6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693828949;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=9TzdrilTih4uGXNpepMDwQSY0KnKh+xkAZJcPisyKTA=;
    b=aWPSU37x6+n+jY5covfIRcOvrsNuljbtAEnO2CMEQAzV8Vh95gi4Ti9CqDsAp7r5j9
    SskvYZSb4cfuZcajyKBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjU7QjNpsZpFYoBv3e+kDWne4OsVw=="
Received: from [IPV6:2a02:8109:8980:4474:140a:9194:7dc7:10e7]
    by smtp.strato.de (RZmta 49.8.2 AUTH)
    with ESMTPSA id 3b5276z84C2TKP4
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Sep 2023 14:02:29 +0200 (CEST)
Message-ID: <70180242-116e-4863-a647-92c96e1a92dd@xenosoft.de>
Date:   Mon, 4 Sep 2023 14:02:28 +0200
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
 <f3c18b6e-0a3d-49bd-9553-71bd610588c2@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <f3c18b6e-0a3d-49bd-9553-71bd610588c2@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04 September 2023 at 01:51 pm, Christian Zigotzky wrote:
> On 05 May 2023 at 09:20 am, Christian Zigotzky wrote:
>> On 05 May 2023 at 08:45 am, Hans Verkuil wrote:
>>> On 05/05/2023 08:25, Christian Zigotzky wrote:
>>>> On 02 May 2023 at 08:57 am, Hans Verkuil wrote:
>>>>> If v4l2-ctl fails, then try again
>>>>> after applying this series:
>>>>>
>>>>> https://patchwork.linuxtv.org/project/linux-media/cover/cover.1682995256.git.deborah.brouwer@collabora.com/ 
>>>>>
>>>> Your patch series solved the issue. Thanks a lot!
>>> Nice, but somewhat unexpected :-)
>>>
>>> I'm a little bit unsure how to proceed: the 6.4 kernel will remove 
>>> destructive overlay
>>> support, but it won't have this series yet, that's for 6.5. But that 
>>> would make 6.4
>>> unusable for you.
>>>
>>> I might have to revert the overlay removal, at least for bttv.
>>>
>>> Regards,
>>>
>>>     Hans
>> Hans,
>>
>> You don't need to revert the overlay removal because your patch 
>> series work with the latest git kernel (6.4).
>>
>> Thanks for your help,
>>
>> Christian
>
> Hello Hans,
>
> I successfully used your patches for the kernel 6.5. Everything works 
> without any problems with your patch series from May.
>
> Your patches have been added with the latest Media updates [1] for the 
> kernel 6.6.
>
> The patches work but I have a green bar in the bottum of the window if 
> I use the composite input. [2]
>
> I don't have this green bar with your May patch series.
>
> Could you please check your latest patches?
>
> Thanks,
>
> Christian
>
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=307d59039fb26212a84a9aa6a134a7d2bdea34ca
> [2] https://i.ibb.co/D4K6j2c/Kernel-6-6-alpha2-Power-PC.png
>
>
I tested with two bttv TV cards.

- Typhoon TView RDS + FM Stereo (BT878 chip)
- WinTV Express (BT878A chip)

I have this issue with both TV cards if I use the composite input.

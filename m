Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 575856CABA1
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 19:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjC0RN1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 13:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjC0RN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 13:13:26 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 538102D70
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 10:13:25 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c29so12406801lfv.3
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679937203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQme2hkuXbQP0Vwc+rzrLN4lvXg4gZyDcnP9H/XM0z8=;
        b=GoLSaeWTcYSGrrgFmN3ikaTCPUGY6BEzfrMcwTyAfOP2j7hGEKYtH/Y1Zv7kfc/RV4
         dDJo8b5a8xbrDEKKatUDvd48EsgJLpxW4dC7mgoRldrTbGMhq450f5zoOaGiLYjZaSjX
         KhmwH++FfIfaFl8axPjzIeMpcUWatiSLsB8Z7GWPFNpfd/+DmypKhB5qJG4+Lc9kobay
         uTEgTGTyLKWCRtujJIY9KIPmRxBGPLvmMD99TTVVLinlKaq+fCRjDD7qtq3PO+aD5ITJ
         D0emoo+4YOFCbZaHV/7rqtUEuw0wp//68rSSFUTSNpbQacULRGRb26l9k137SzmcHAhB
         m/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679937203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQme2hkuXbQP0Vwc+rzrLN4lvXg4gZyDcnP9H/XM0z8=;
        b=zB9d6CAI9+SP58Y9xgnEScCva7rvrLY1I3uTp6fDx3nFJAfgcFDq0pR74K+t1K6Mcl
         c8YGyo9sfqpaXF/F2/ahPAGRXSCKXipFl6eQPbHDMtbEmGVokVYI2GsU3ryKQ/bQIVf7
         TDz8hIffUoF1Ztni577e3MJZSzaRyvbWE4MJsU6z4BxnrmuIfLzvEa4wuBc0wFxk1Q7n
         sx8RIlqCB2CRs8iWYd9wlJ27Ua29BYJOH7WK4OKnetKVEAQgUiWzLMgCx33aUqc+dU+B
         0xuFDoWQXiscp8PHcVqh+har2OSW3bGHeAJCQ3Cm7xvXluPrtj13NcykNM9ebl8qrTdN
         g0xg==
X-Gm-Message-State: AAQBX9djBeekjXKPlAXw4UQsbPFgmK/obJXOZ/81FAK/CSVIgpKBk/K4
        9TSAJ9XlZqUn+Owu6kSQDro=
X-Google-Smtp-Source: AKy350YFeQT9Eynw0IlGPFkcRLc+haznbBibDIK64nCyJjldZFC1A4HLehUz9hMY8/t3D6/zEMNMfw==
X-Received: by 2002:ac2:5291:0:b0:4cb:2aa:9e58 with SMTP id q17-20020ac25291000000b004cb02aa9e58mr3479070lfm.13.1679937203502;
        Mon, 27 Mar 2023 10:13:23 -0700 (PDT)
Received: from [192.168.1.6] ([212.106.161.80])
        by smtp.gmail.com with ESMTPSA id w2-20020a05651204c200b004da8d947c57sm4756379lfq.149.2023.03.27.10.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 10:13:22 -0700 (PDT)
Message-ID: <40161e2f-5225-8cae-732a-59fc379dd045@gmail.com>
Date:   Mon, 27 Mar 2023 19:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: saa7146: please test the vb2 conversion!
Content-Language: en-US, pl-PL
To:     Stefan Herdler <herdler@nurfuerspam.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
 <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
 <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
 <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
 <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
 <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
 <20230208100847.3ec87576@coco.lan>
 <99397771-409b-e487-e429-d5c9feb82209@nurfuerspam.de>
 <016c57b2-8538-c630-b72f-a3c608c33a02@xs4all.nl>
 <6c5433ff-a6c8-10f3-789b-bc231291c642@xs4all.nl>
 <a1059b8f-77ef-3ccc-2ae3-d4846fb8a305@nurfuerspam.de>
From:   Tomasz Maciej Nowak <tmn505@gmail.com>
In-Reply-To: <a1059b8f-77ef-3ccc-2ae3-d4846fb8a305@nurfuerspam.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

W dniu 24.03.2023 o 22:21, Stefan Herdler pisze:

[...]

> There are only DVB-C boards with analog features.
> 
> I personally never had cable-TV nor own any DVB-C cards.
> But I try to find such a card with an analog module on it.

I'm not 100% sure, but there seems to be one offered on "ebay-kleinanzeigen".
Search for "DVB Board Siemens PCI". I won't post link, since that'll be
outdated once the offer expires. Unfortunately it's rather on the expensive
side, for the features it provides today.

[...]

Regards

-- 
TMN


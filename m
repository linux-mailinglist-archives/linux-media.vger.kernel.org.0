Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5436D6015
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 14:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234354AbjDDMU1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 08:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233732AbjDDMTf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 08:19:35 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03E11FC8
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 05:18:12 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso19932116wmo.0
        for <linux-media@vger.kernel.org>; Tue, 04 Apr 2023 05:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680610691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Rk3uvvW8PAwi02APdNw6PKdSJ6T5Oh+HjtvsG16res=;
        b=No+QAmwNYWRCZO4MIzcrGu0flbeBG+aX8tI+kv2vNp6LvMp01A7E0/H7Qu8o/IUTUS
         +e1FYm7qAHDydJqcoW2jB5aroG0gDcClTIgHfcL98DvVFe8aXB9Vni9vnozV+NuWhC99
         Tz752/R0hB7lZEdRl7dpfxqKVv+6MQNWzbkuJFc1Ktu29U/ryYdPAHpp5DGJ5YJjjaZB
         J4JEzrrrwaIMaK9+hUwchEUpyOLQeU5Z+rI51JNtT0AoIn30qLhK3bNVj015mcDQz6OX
         IpJnUNfmUbWUDBBLCIfyF4PwzfInRaR2lRFfAIxduCKoGvawZnT9nFUVO9Ldd5vvVcgZ
         /ACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680610691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Rk3uvvW8PAwi02APdNw6PKdSJ6T5Oh+HjtvsG16res=;
        b=engdOMVzHmcoGqAzGzQe0tyU1iDVRk311tuDKgg+t/bLfgbknN+8aoC+cIej2zfqfa
         XhO074p/1WKUliasQTdidFHVMnhCxfEYZLUpT5sHPjxRk0ETi+o5/jWejC7xu1HDDFFR
         bVLZI2KI3a7T+gW50mLyji7DSQEjYFTLE7RTmF3EXrFZ+hDW7e0ypr0JOtFcYfOYO1Sh
         680Pg41uGHlqgmMPwETwi2WqgO6/uyEuJ/UvS4FD+g1mHj3bX8rSSmGFBQWAr1VTSFos
         nECu6Dse/42qxypbjdekIUkPNG0UFbwr3avtNKGaAcVrHSt2R1+Pbvk1AB8ls4FN667m
         R1Rg==
X-Gm-Message-State: AAQBX9dQlQVWKs5Br+lUGHG848MyZEUzgloM+8SzvVrPF474lyv+kd3l
        ew2CU7cQ/MVtFwH6/HHaEqY=
X-Google-Smtp-Source: AKy350aAfxv5nHECMoEuJPlsOpj9ETEzvBvfU7tebeF49stNmNRgeDW5aDmh4CftRdj2JXSCC1GxWA==
X-Received: by 2002:a7b:c4c6:0:b0:3eb:3945:d3fd with SMTP id g6-20020a7bc4c6000000b003eb3945d3fdmr1987669wmk.14.1680610691203;
        Tue, 04 Apr 2023 05:18:11 -0700 (PDT)
Received: from [192.168.0.8] (static-3-123-228-77.ipcom.comunitel.net. [77.228.123.3])
        by smtp.gmail.com with ESMTPSA id bd6-20020a05600c1f0600b003ef36ef3833sm22099416wmb.8.2023.04.04.05.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 05:18:10 -0700 (PDT)
Message-ID: <0b39109a-bd30-c681-2c6a-d26a4eae1fdb@gmail.com>
Date:   Tue, 4 Apr 2023 14:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Adding support to NPG Real DVB-T Hybrid PCI Express [cx23885]
To:     JLA <neonmann@gmail.com>, linux-media@vger.kernel.org
References: <CAG2KHmfuFcX6L_rchAeV3bzpcj00d_XNbPL7FHtHJUVHXzf3wA@mail.gmail.com>
Content-Language: en-US
From:   =?UTF-8?Q?Jos=c3=a9_Manuel_Alcaraz_Pelegrina?= <jmaphys@gmail.com>
In-Reply-To: <CAG2KHmfuFcX6L_rchAeV3bzpcj00d_XNbPL7FHtHJUVHXzf3wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



El 12/7/19 a las 16:38, JLA escribió:
> I have a NPG Real DVB-T Hybrid PCI Express capture card, it is a
> DVB/Analog PAL/FM hybrid card based around the cx23885 chip. I've
> taken some pictures and checked the cx23885-cards files and it seems
> most of the parts are there and I would like to add the card entry for
> this model.
> I can, if needed, probe the card with a logic analyzer.
> 
> ICs found on board:
>  * Conexant CX23885-13Z
>  * Intel CE6353 [Clone of Zarlink ZL10353 ?] (DVB-T Demodulator)
>  * XCeive XC3028ACQ (RF tuner and analog IF demodulator) (Not in
> tuner.h but on wiki?)
>  * PI5V33OSQE 2-way (analog?) multiplexer
> 
> Windows driver ships with the `AV88PCIE.SYS` file and a somewhat
> documented .inf file with it.
> 
> Any help on how should I proceed adding support for this card appreciated.

This card is supported by the cx23885 driver. Try

sudo modprobe cx23885 card=12

It's necessary to have the firmware for the XC3028. See 
https://www.linuxtv.org/wiki/index.php/Xceive_XC3028/XC2028#How_to_Obtain_the_Firmware
to obtain it or google it.
It runs for me and I can see the dvb tv with kaffeine.

> 
> Best regards.
> 

José Manuel




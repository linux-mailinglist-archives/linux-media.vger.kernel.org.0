Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D97DA4D582D
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 03:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345657AbiCKChi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 21:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235051AbiCKChg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 21:37:36 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECEA9F6DA
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 18:36:34 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id u30-20020a4a6c5e000000b00320d8dc2438so9063564oof.12
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 18:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:content-transfer-encoding;
        bh=Uu09V3K2i2L9JByXqSQEJVJFdtrBgzfe75GzD+4qvUM=;
        b=jhxcnes2cYYPDQ0BZChI/upqtJjm4PaI8Qn+SbKfZPz1erLzaLZ2fzdrgo9/2UyiT+
         LI3Ekv7koHImqlVCm5etBY3/bKKKhzlwlJsJhPVXdVGoX1K6M2euoQpmW1ZJ9a1gdaBN
         +QjxEmyMtz5btyM8dAZA/Z3kXBqSUgklYPNk977iSigESOYCQ5vb2tlzVZ8s3K5k2DIO
         TVG2LxlAijSVTD5eOsD8z+7Iqf10ZqJRuiTaX6tkkqXY1jPa8L7iSzEjBlB9ZQ0xXrXf
         p15RS07kzuoSkbuafiBDg9yoX7H140M2a26fga8yowiV7q5B4p9MuTb6PgNvbzGwYK8t
         okwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=Uu09V3K2i2L9JByXqSQEJVJFdtrBgzfe75GzD+4qvUM=;
        b=NuyAGjw3dfUJmxExTGVwvhCm78MQRz+OAdDCfqjBsUpQrjwNxWwdDZRKECPauK6Rdi
         l0ohyFvu6BF/wJoJZai3rHyrvuvr3W+amANO7YIAVwTtkKd/v/FZ3K8cG0jLq2510ANM
         asC8G4FoPU1ymVY6slH1B3awulzaQb+Bub1SrWRHsvWNs7ai9U/j5F4eP402GxqeJmbp
         3LD3/xrEyXJnnC5ItzgdWzkCQlDyMgHr8tq6b+jh3GWGdAogu+ZoTsu7bSTY7Xvyvi/n
         9UL7C6t3uGlrFX5rSZilPDVh414fiFaWJC9wcrSGkqjimC7XWPArvzs2U/GTKMijrqUt
         ncng==
X-Gm-Message-State: AOAM532u3B+dno/ibLyY5+hPIM8GWKshL9cYLLxQOprjSCcE+mL8hTdl
        js30SwMmZ5nr/upcMRd16Yohy2nTPAE=
X-Google-Smtp-Source: ABdhPJxYaq96iSy7vr4TqL4tBDnMnwJsagKzmA8ulhpyIGUSzwlJ86NQWK7XMdXp0QcFUg+Eyi7aTQ==
X-Received: by 2002:a05:6870:a901:b0:da:cf13:4023 with SMTP id eq1-20020a056870a90100b000dacf134023mr1006302oab.90.1646966194010;
        Thu, 10 Mar 2022 18:36:34 -0800 (PST)
Received: from [192.168.0.145] ([181.171.34.217])
        by smtp.gmail.com with ESMTPSA id w25-20020a4a6d59000000b003208276963esm3032383oof.14.2022.03.10.18.36.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 18:36:33 -0800 (PST)
Message-ID: <37e49153-61ec-6361-d739-fbce79a7c3a6@gmail.com>
Date:   Thu, 10 Mar 2022 23:36:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To:     linux-media@vger.kernel.org
Content-Language: en-US
From:   Francisco Levrino <franciscolevrino@gmail.com>
Subject: Philips SPC 530NC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi, i've tried the driver for the web cam and for the video it works 
perfectly but the audio does not. is there any way you can add that 
feature? thanks


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEDBE580DFD
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 09:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbiGZHjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 03:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238613AbiGZHjJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 03:39:09 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F75C2C
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 00:39:07 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id sz17so24641588ejc.9
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JFkaZFxAuxkLEehi69dTWbNl8unG+u8MhhTVphE46Gk=;
        b=Ec872N7iUH0/o6dfJVII3y16GE9215olQHtR9NkNhp8xKhu+WbB+5r/+NJZKHK/doF
         YN58Aj8wOQ7plVdAZZws3+afT6fenyRDuB0N+1OMSgeDi67wcNTJjklZC36dnJyvfFoF
         lPAC4r4M8unHq1d8746ofCleQ2WKr8ZlizFp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JFkaZFxAuxkLEehi69dTWbNl8unG+u8MhhTVphE46Gk=;
        b=4fOCO/Ehbi5Jfbi3/mBSD9WYiCYVBQVPws4WuJrE20fFm9nZS3Omu6tO2m57SN+8y5
         0VCSsxmGeFzh1c+H6gkUVpJWuLRFtGichuq3Pc1yvtNox7mL5NtkC6AlDGmrjDH6uRkO
         FPMxBTP79kLVsIGdxYgiw2H+6+ixcaO/P4xVx8mDk9VB31PomKknjXdzQnTStdbidThB
         LeZa97ZHDN9kenKasLI8+dVP2U8TbFLI89qyIGVUc78Nvs/Z5hPDVUxWcLHHLBkMAstR
         F5+okajf84PvD0pwjFDtoeVMCM1c44t2Zxx4OKXdmMjkSlwJNNtMXtry+XiTwP9Vkv/i
         kaCQ==
X-Gm-Message-State: AJIora9jQrIBTTDLuRYWVX05jS6VXCdIu9JxCN7EEQunSzSkmTOOQ6R8
        TDb23Fdp1+j19t253QJKLwlY7SN0J2IPEQ==
X-Google-Smtp-Source: AGRyM1uvzM5Dli1Bl46N7vnhkWSqsrpxlnQ2nRYQNyE5MUxOKQAFvwAqBEEXJVgnlw1DW27GuIcwuQ==
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id gb5-20020a170907960500b006f50c667c13mr13219101ejc.66.1658821146044;
        Tue, 26 Jul 2022 00:39:06 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906292a00b007262a1c8d20sm6192633ejd.19.2022.07.26.00.39.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 00:39:05 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id sz17so24641437ejc.9
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 00:39:05 -0700 (PDT)
X-Received: by 2002:a17:907:7617:b0:72b:49fe:fdf7 with SMTP id
 jx23-20020a170907761700b0072b49fefdf7mr13634226ejc.25.1658821144766; Tue, 26
 Jul 2022 00:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <8bd3b659-5e1c-4985-ceac-7b9956f2158f@neuf.fr>
In-Reply-To: <8bd3b659-5e1c-4985-ceac-7b9956f2158f@neuf.fr>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 26 Jul 2022 09:38:53 +0200
X-Gmail-Original-Message-ID: <CANiDSCvYLv_SX1nCS9s2TWbCQS54JL1kXcfLqE60LiGW+YsZDg@mail.gmail.com>
Message-ID: <CANiDSCvYLv_SX1nCS9s2TWbCQS54JL1kXcfLqE60LiGW+YsZDg@mail.gmail.com>
Subject: Re: Adding a new UVC Device
To:     Bertrand COEZ <coez.bertrand@neuf.fr>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bertrand

I am not sure that I understand your email.

Your device is not recognised by the driver? Can you send the output of
lsusb -v -d 5986:211b
?

Thanks!

On Fri, 22 Jul 2022 at 05:40, Bertrand COEZ <coez.bertrand@neuf.fr> wrote:
>
> Hello
>
> I would like to add a device to the list,
>
> Here it is : 5986:211b Acer, Inc HD Webcam.
>
>
> Best regards,
>
> Bertrand
>


-- 
Ricardo Ribalda

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADC914F979F
	for <lists+linux-media@lfdr.de>; Fri,  8 Apr 2022 16:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbiDHOI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Apr 2022 10:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiDHOI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Apr 2022 10:08:28 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD08E1A61F0
        for <linux-media@vger.kernel.org>; Fri,  8 Apr 2022 07:06:24 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id k9so4631066uad.2
        for <linux-media@vger.kernel.org>; Fri, 08 Apr 2022 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=ncGkx3QlLteGsfro1VhAQTDlmYtGaGfhNsSr7F0QSx0=;
        b=BXPtqTFbuDuQIT9rz6jaH70q4aODqsIOBkyDn1nMaPuP7/7FsWxBEdbAsiwTPavELi
         plJhnoN5kWJQNSCRHK76GwmCUYx9hLZDHWQmBNyMGcQGFU4ZBg+0mxV4CB+VbcqprDhH
         7GJaBfpdLWk1zFFjjn2PhO0HjEoOapuskbPsA3VN5IOyv5InhXnNXd5ljGeR/1q2nk5+
         po0a+QzqG6Fh+J4YRE6uCRadNu2ip+tNq3qq67CWef4vEebzYz4JzKbTSc8+kYess5oC
         6wRTVM6GeIt/iy5ODiPL8A9JCw5ctdkH5GRPSiLHFFE5//p9SmSoBVz5HrfXyha+dbZh
         VB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=ncGkx3QlLteGsfro1VhAQTDlmYtGaGfhNsSr7F0QSx0=;
        b=h1ybtFQvz5AYeEjH7TAUmJljn8wW7tLORqkLiT7JJxnDZN77CoK+DRhzSZco4xNa3W
         dRm/zYHBZhApzrENGjQoQyH3+wD9SLGVXCueMbFNy94mtrfJKgoafLLpdX5KInSBeN6C
         6Z4GtpZ7SpBarcwcj64+3RpFMg5V/CIzl0OheAvEAgdIwMp8NkhlZJCwDhUiDCMiymUV
         Zclz3C6uhyRiWIDa3WZfuoygS6RN0Id4R2GnXiWRa9CLdXAc/daFGrGJvTIcJ6zp9AxT
         9vRsl89t6Z6tZ3IeV+xW0CvVaImZyuPA+DD0fN0JeQvnIPiBw+sGKqbQ4QC/A9CY7yPo
         bkaw==
X-Gm-Message-State: AOAM5337LQv7r6K7jcmHqfLOfPkJ40BGuz6TwN/Ip/xa5Aj7lvxSloAo
        aTKoC9nyHWDAmS0XRh2aajyaj4SOxtNgmKxCJGk=
X-Google-Smtp-Source: ABdhPJxVs+kNPaSwZJwlJzF6OilM+/Z3sTH5ilAO9kU6CZOovJKU0Udp4oqB4ZIOxDwduKlNW3euDj7WiMQ5MxgAb1M=
X-Received: by 2002:ab0:29cf:0:b0:35c:7820:8fc9 with SMTP id
 i15-20020ab029cf000000b0035c78208fc9mr5714323uaq.89.1649426783590; Fri, 08
 Apr 2022 07:06:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:c06b:0:b0:29e:7e20:6ab8 with HTTP; Fri, 8 Apr 2022
 07:06:23 -0700 (PDT)
Reply-To: mrs.acostafahad@gmail.com
From:   "MISS. ACOSTAFAHAD" <daniel.ekpe98@gmail.com>
Date:   Fri, 8 Apr 2022 07:06:23 -0700
Message-ID: <CALqvnvnrv=UkuO6_5sma1w4ZTX1RtUAcUtTukdCWnzKae1XqqQ@mail.gmail.com>
Subject: Hello my friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Dear!!!

Please get back to me soon, i have some information for you.

best regard,

Miss.Acosta Fahad.

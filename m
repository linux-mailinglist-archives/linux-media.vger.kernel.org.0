Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D334CE5D9
	for <lists+linux-media@lfdr.de>; Sat,  5 Mar 2022 17:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbiCEQNU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Mar 2022 11:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiCEQNT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Mar 2022 11:13:19 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC1026C0
        for <linux-media@vger.kernel.org>; Sat,  5 Mar 2022 08:12:28 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id m22so9783093pja.0
        for <linux-media@vger.kernel.org>; Sat, 05 Mar 2022 08:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=A7SqxPeuATRIawRLPRXdbXUmc+x9RhbBGbJAJobYDWo=;
        b=ieEqEkymZhe66tbOga76Xqdn7sp6S6BZJOHvGv1ppdpkgqHfXpQVVLMznyo9DXR3rG
         k69pcqEPD9inE0zA649YnhWPvW8+YJo/mzMdqbWR0yON/ZO8v4luBQek5eeSWMokrCth
         eoYLWNBJ1AyhI2HmaxoEorK5Ad5c7u0V/3FsvjasM7U8UZoS1HGrxlDUQbAkXc3BdDTN
         KSauiL6Ip9odzn7v0SjNBnWtJ2mPHNUUlsW+2hKNoizjaQLA0kWbpCuRwLi/mpm4OFBd
         toXphcqxzzfu0Ha1IVFBNvaU2Lq6YdvJQ0eTEB+2f3zo0W/C3vqbXMk1w78Fodu1lYxu
         IjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=A7SqxPeuATRIawRLPRXdbXUmc+x9RhbBGbJAJobYDWo=;
        b=wQHdL3gBV5pMJFNMnP/t4VUH2aFcdkGiA6IKREq5zs/sDc/60cRsF3H3krn8wPjsJE
         8ZR8QZEJS+IITUlQHI0y3gAQIhGdGxzsxa6d8tiinuHlmdiWdlojnIIN8yMBoyqxKrpa
         D6Ih+eOzvBlP8eXX0kJsIdy8R0DCpCEqDJ29pJhMDjqQuh+k1NbGjwi8iQh9Al0ZCmLo
         +lZmMiJMTw1s46pWg8mKcISgBraCwuIJGw01bIEqTZg9WF4+wK3wXf1uPAqa9Nbv9XZ1
         F6BsBWyPKGIfBBCtPRIFxZImJC9PTCqJmjAajAhSuiJW/1cCPX9NuNYDcxfodAc0FkKQ
         dyqA==
X-Gm-Message-State: AOAM533XM/UZt8gRm1HT+KQ0Fl/TdV51QdpfT3Sy2QcHYGwjYiXbzRKU
        EcgvxYgSH2P37vGA/cZbtePHhg1OHctYkFU1FQ==
X-Google-Smtp-Source: ABdhPJw4w6LG2X0U2XW6zBAf0ZMW6gJW+PXt3iiTYG0Q4EM99I1wmcu4YGMcFmmi5hZ5hFqs3InvCxyg+YyTvKvLxbE=
X-Received: by 2002:a17:902:bd85:b0:14d:c29b:d534 with SMTP id
 q5-20020a170902bd8500b0014dc29bd534mr3994331pls.99.1646496747311; Sat, 05 Mar
 2022 08:12:27 -0800 (PST)
MIME-Version: 1.0
Sender: alamsalman2000@gmail.com
Received: by 2002:a05:6a20:3e1d:b0:76:760c:e92d with HTTP; Sat, 5 Mar 2022
 08:12:26 -0800 (PST)
From:   Miss Qing Yu <qing9560yu@gmail.com>
Date:   Sat, 5 Mar 2022 16:12:26 +0000
X-Google-Sender-Auth: P1StUS6DWpwKNChWxTIuqNyvdjM
Message-ID: <CALH+dLBZgy5Zdh-iiQ-RCS89mAU3TG+ViJGTTZuy3HzmC1OoEg@mail.gmail.com>
Subject: Hello!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_SCAM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am Mrs Yu. Ging Yunnan, and i have Covid-19 and the doctor said I
will not survive it with the critical condition am in because all
vaccines has been given to me but to no avian, am a China woman but I
base here in France because am married here and I have no child for my
late husband and now am a widow.

My reason of communicating you is that i have $9.2million USD which
was deposited in BNP Paribas Bank here in France by my late husband
which am the next of kin to and I want you to stand as the replacement
beneficiary beneficiary and use the fund to build an orphanage home
there in your country.

Can you handle the project?

Mrs Yu. Ging Yunnan.

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B07AD52BBC9
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 16:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237381AbiERNDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 09:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237375AbiERNDt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 09:03:49 -0400
X-Greylist: delayed 359 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 18 May 2022 06:03:46 PDT
Received: from kiwi.benhosting.org (kiwi.benhosting.org [109.230.227.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AF71A8135
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 06:03:45 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
        by kiwi.benhosting.org (Postfix) with ESMTPSA id 496F3ABD7B3
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 14:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=benjaminmarty.ch;
        s=2021; t=1652878633;
        bh=WWJdvvrmaR75aKS4mEpv0HP02c9WqGH5vdWMtDJrpLk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L2VpdkJ842EvLMHePULaoiMeWaETFKqv7PygNUGIEvvWJI6+DptwcIGfBD6/J8SP3
         Nm02m0Uw7LNWLJ/1BrqH0ZmdmUBbkrXcMVVspWuck+OYKFap7fJKC8YHqD2nPG9/2k
         /B5B5CCjAit8DiqGYqQSlQIsJ3pqRWJRBi/rsJvQU1+44H+9k0UohrAR2lr2es6SJ4
         gla+lotKmlya8ieuX/Urd0AuUP3IOVrnG9e4E+Dk49k0rvCEeFtveAlsldkUnN/itD
         cRt89nGo5a3M72lb/9/YPBJRJDbACtUsFOcO7OFrAu7g7HQUFe+OjRXnzfHDBUZDi4
         eizUu5Mr0WvmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=benjaminmarty.ch;
        s=2021; t=1652878633;
        bh=WWJdvvrmaR75aKS4mEpv0HP02c9WqGH5vdWMtDJrpLk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L2VpdkJ842EvLMHePULaoiMeWaETFKqv7PygNUGIEvvWJI6+DptwcIGfBD6/J8SP3
         Nm02m0Uw7LNWLJ/1BrqH0ZmdmUBbkrXcMVVspWuck+OYKFap7fJKC8YHqD2nPG9/2k
         /B5B5CCjAit8DiqGYqQSlQIsJ3pqRWJRBi/rsJvQU1+44H+9k0UohrAR2lr2es6SJ4
         gla+lotKmlya8ieuX/Urd0AuUP3IOVrnG9e4E+Dk49k0rvCEeFtveAlsldkUnN/itD
         cRt89nGo5a3M72lb/9/YPBJRJDbACtUsFOcO7OFrAu7g7HQUFe+OjRXnzfHDBUZDi4
         eizUu5Mr0WvmQ==
Received: by mail-yb1-f180.google.com with SMTP id d137so3442834ybc.13
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 05:57:13 -0700 (PDT)
X-Gm-Message-State: AOAM532AiEIba4g2VYYrUzHCO0Hs0qsIrA/+4PT5dWYYtJJLmX0MHsMz
        DuqhwjCMUtE1MMKpxgw37mLu21Sys1If2G6evao=
X-Google-Smtp-Source: ABdhPJwgnRWWPe0749G6x9dPVKgBGECliHahqwMwUtf5Ns7DZTgoLRjRaZby7oiT0deSMWdKFD6EXi0VelqbuHJk5hk=
X-Received: by 2002:a05:6902:1382:b0:63d:be0c:2e7c with SMTP id
 x2-20020a056902138200b0063dbe0c2e7cmr28148945ybu.122.1652878631974; Wed, 18
 May 2022 05:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220512120209.11614-1-info@benjaminmarty.ch> <CAPY8ntD4miACVe9naYUyVAztZcDBK47chpJLy4=qqjmego1jvA@mail.gmail.com>
 <165243859864.2416244.4785590696956344599@Monstersaurus> <CAPY8ntDfnZG_+43gMz2D=v9eUBX8zjbJpDpwm1a8tTT4ak8drw@mail.gmail.com>
 <165282888670.2416244.4233841355061128997@Monstersaurus>
In-Reply-To: <165282888670.2416244.4233841355061128997@Monstersaurus>
From:   Benjamin Marty <info@benjaminmarty.ch>
Date:   Wed, 18 May 2022 14:56:56 +0200
X-Gmail-Original-Message-ID: <CABSdY3+Wf8xmOHs4onE2E5Nhrj+JFcV4-dxjGH_dgiOyDOkujg@mail.gmail.com>
Message-ID: <CABSdY3+Wf8xmOHs4onE2E5Nhrj+JFcV4-dxjGH_dgiOyDOkujg@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: adv7180: fix reserved bit in Video
 Selection 2
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mi., 18. Mai 2022 um 01:09 Uhr schrieb Kieran Bingham
<kieran.bingham@ideasonboard.com>:
> Benjamin, how does it look on your system? I presume setting this bit
> improves image quality for your use case.

Yes, it fixes the analog noise/grain issue. I have noticed too that
the image is getting softer, as described by Dave.

Comparison Images from my side (Not the exact same frame):
https://drive.google.com/file/d/1gdwKUGb7GcvMVJG0uSomhMPeSfDwXId-
https://drive.google.com/file/d/1oitfhl4txzxOabI-TplpsKMqP2mr0TKy

> From a driver perspective, with no other existing expecatation - I would
> say matching the datasheet is the correct thing to do anyway.

I'm also agreeing on the driver should be complying with the
Datasheet. I think it's a "Bug" and not a "Feature" that the Image
gets sharpened but more grainy when not setting this bit.

Furthermore, I have opened a Ticket at ADV to get more details, but
I'm not really expecting a proper Answer.

Benjamin

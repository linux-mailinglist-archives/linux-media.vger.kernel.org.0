Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54EE5F8301
	for <lists+linux-media@lfdr.de>; Sat,  8 Oct 2022 06:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiJHEtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Oct 2022 00:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiJHEtt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Oct 2022 00:49:49 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6745A12AFF
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 21:49:48 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id r15-20020a4abf0f000000b004761c7e6be1so4750837oop.9
        for <linux-media@vger.kernel.org>; Fri, 07 Oct 2022 21:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfSQPr3TgW686EX+LeFlxkPdbXkbKU9NPtsgw9BN+NU=;
        b=ZisAuba1ORlzT57+nNMeTnEH3ftY2Y1lMxa7lvrxg84vUNKuO9y1gxc7YitcRhBUM6
         z0SB/+iYVpmohWRe68UG5CWitsDeMGbqLyRy7NkCPfs2UBLSqW37Ml/PAygOqeCNn6gL
         /IBn9Rri8alMcq8RObJe+7TMrcKD3k5tUNjQ4OOObMLf5fvVduE4oOkpCKNRct4Y+jR7
         0agEJVyo8SF80794cWOrCq+ogYxKL+M2Q2roR1xRSWvYsstF83KDOn2+CHpWY1pFjtsH
         j0p5I5gbfNkXW5wj7T2QU6Xu9XthE8/97ZtZ7+YCuwldsHLj6ueUA2ARaFfO6o0ICc4t
         pNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bfSQPr3TgW686EX+LeFlxkPdbXkbKU9NPtsgw9BN+NU=;
        b=yb6QLTJQXwuZPH7MW2MxpCB0TAB844F125tEgmvybIZBmI7ajwZx+1uMBIczVVaemz
         316pT77CvNyDUQPNS11lEsF0wg8z6d8sUrKwidOKF29OV7b1biRfxof29m8gcbfORUNS
         sirRxsnFBq1Ln4lCcBdFNl8T9Wz8DFD7VPLfeMIzASbproYXAJlGHwLO/l+Sk6pHHFkV
         vCeQMQq/G8byCALyv7DXKQ+2Co5IFySA57DkDHKHw0IP/TOfoqxKIUm7l0GIJu842+Kt
         xTecUBupz3KcJ+WnJxMPHNOvuBz/CzmeVOspguYJdHz4I2UthMZgEfs0Q/kPOckjsXjT
         E3Nw==
X-Gm-Message-State: ACrzQf0oiPHoccOkxTuBLVJUhB+PUph/GBuVRdJJFTwa0pQzCUtUusJC
        Wz6w7cLFDgW88YjmR3RUaU1gQ7yaPtiaLFh7Es6mnGJEBdk=
X-Google-Smtp-Source: AMsMyM7F17oJ+MzOWRZeRUfuRzFMqHBZK+WNOH9SodeLPFhZt5sNjwW7Mwudzw/vcOhOykauy1ZQg8je9Zx2tlL3CRo=
X-Received: by 2002:a05:6830:4a6:b0:661:8587:7000 with SMTP id
 l6-20020a05683004a600b0066185877000mr1782597otd.378.1665204587517; Fri, 07
 Oct 2022 21:49:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:1307:0:0:0:0 with HTTP; Fri, 7 Oct 2022 21:49:46
 -0700 (PDT)
Reply-To: abrahamamesse@outlook.com
From:   Abraham Amesse <gmark4315@gmail.com>
Date:   Sat, 8 Oct 2022 04:49:46 +0000
Message-ID: <CAEa9Cjf53ryUhTcvpEz-Qk=v84Z80-=X=koxsABQBEXNB-Bo5g@mail.gmail.com>
Subject: ////////////////////////////Hello dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c2e listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6207]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gmark4315[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gmark4315[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please. I would like to know if you received the message which I sent
to you two days ago concerning humanitarian aid work.

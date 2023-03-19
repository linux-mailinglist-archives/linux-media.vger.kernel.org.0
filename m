Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C136C02ED
	for <lists+linux-media@lfdr.de>; Sun, 19 Mar 2023 16:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbjCSPwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Mar 2023 11:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjCSPwv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Mar 2023 11:52:51 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42EF11B564
        for <linux-media@vger.kernel.org>; Sun, 19 Mar 2023 08:52:50 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso5505962oti.8
        for <linux-media@vger.kernel.org>; Sun, 19 Mar 2023 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679241169;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBlRr9q265Nv8kRQVI2pIMY+89rTouQ4PH5QCVhBU8c=;
        b=m7q9VeFfeFFfr/eoC52BaqVCVLYbZyekVUS61dOAzZA6JymeMVmnjpteWxr3uC9RHu
         g/+AqHHJ21Q1xhAEJbN8HZCA2KRysrxmqhEb9Rg/z+hOXDNyPmRf9ltLwJm01u/+HniF
         /wZOrWC5izldO35fG/heePcUFGUCo64oy4xBVNCkF2bt7Pp10rx+KfbvksIatvbMcJmO
         rBVSCMgdizIscvSLyDmig21kmalkEz3Xnrr9ASrmJEYIDStEhzM1SCPjH8iJNxW6aH5v
         PB+IxAekCECTv9b9jf3NLq+fjygF2XJ4dAsYhiCQ3jzOBf2zpudtehYvDnQRbBBNoCzu
         VeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679241169;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBlRr9q265Nv8kRQVI2pIMY+89rTouQ4PH5QCVhBU8c=;
        b=5dAWRU0OLWCYNfICrOs6FrWQsvArBpSes3PJ91e3tUMiFc4zUXruhFgPad1xeqyGRP
         d/lH04GHkjJU0dWqVsjoNe8epH8JXyrljlq01iSVLwZfP5EcZDAtP+aM6KNoYf67AfmA
         2slapKxGbg2BMtCmeNOYgFORISStoA0707no84feZWUwufd9TJHT9OKRz5lt3LZApojp
         EwaXxxDMRVztOXEGK15JZZP7I5Rnzrv6kKaIKiLmF0+xmBeeKcpTn+QtSKYMAjxoOogr
         e7XLWezPSxQG6z14Tmlcs2CimpTgWwk8BGsgjd47VW9PLE3EZrr2Lqokg5vaMMNONMY9
         MHeg==
X-Gm-Message-State: AO0yUKWpgBT7tMNf620YmYjvVlr/i1CN2mvIVwYl5sOOIh8aW7RPazwZ
        EhJDCAo2FOALjYmyyDu+E0kol8s/5l5SuIXjya8=
X-Google-Smtp-Source: AK7set+1dRE6mJAteIj5qar3v0oUhjcAQH7YfTAGm+MxMjBkSzlUDCbtiIVV4zGnu3hv3ch9wNbYFcltPrtHQdj+2Zo=
X-Received: by 2002:a05:6830:10cd:b0:688:d1a8:389e with SMTP id
 z13-20020a05683010cd00b00688d1a8389emr1699238oto.1.1679241169399; Sun, 19 Mar
 2023 08:52:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:7f91:b0:eb:2721:599b with HTTP; Sun, 19 Mar 2023
 08:52:48 -0700 (PDT)
Reply-To: fiona.hill.2023@outlook.com
From:   Fiona Hill <hasanahmed62621@gmail.com>
Date:   Sun, 19 Mar 2023 08:52:48 -0700
Message-ID: <CALpxZtgJnu00pE6ofXDe9azKPjZC6M0_VVuc72+Qj139DjcR3Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:333 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [hasanahmed62621[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hasanahmed62621[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [fiona.hill.2023[at]outlook.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Hello friend did you recive my messsage i send to you?  ple get back to me

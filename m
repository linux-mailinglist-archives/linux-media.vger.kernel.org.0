Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5D55A0DA3
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 12:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239278AbiHYKOQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 06:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239263AbiHYKOL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 06:14:11 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3BFABF27
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 03:14:07 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id r124so7114726oig.11
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=iq/RF5G5I5soUiTgMGSgIzuSFyhbcKhe0IIGdBNdEXN0K/qXUit3bq9T0TiPP4Hf8/
         h/Av63BRXFxahNO/Z99j6vEG4MF34aa/1WxzgUWFuppezSG6gBnZj40Wn9V7II69I1DI
         NUd/zmtsJPLXG2hO2wuLwfQlzwlj2kNT0dA4fFk1dWV35YQPenDd0XqvYWTIZNf7UjSL
         SXsnr5OGK1RaAGr2vVbUZImwnqvcl1cYvZOrTTQIG2qy5NQN4JtcnA9jOvhRlDoVJ/u6
         bbDhtgY9+9eyRGsbPUuRRwkyGMbFsiKPj0Pdw/4V/P+8Q1V1lmnefYqFaZ9B7RzF9UCm
         /MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=zB0bNXxWFnVfRjHtbMmGSWFYO+Ez/aoy2sm3IcWTbU/WWS53g8iGuQeBiK985c5eZ4
         fuThrjGG9IwmDK7b4WSlaYZG2xevt6WoF0OHh+SLNOFqGsaujtutdKfGk3zSIx08CW1h
         LlRUw/NEIhiLe1FE6+NHjUdJWWHWcb4EwJ9Ast/X7mg55SIkSJLOa8yxHTN8Qp07yXh6
         VkM0hxtwZhoM0JU4ULtG80goshLnohbpXzJJxWuhKmt0OldjaoqlNjM5jLJs9N3LSQwe
         KyZAfeztwCuTAlwTBfQpnR96fwJc6gwbvMhTxzk4+ZRpo3/FGwwSfk1T3+Ld4HL3bkkc
         HscA==
X-Gm-Message-State: ACgBeo0EAo/+xFDpwC5yclL/zEd86QrdEWmBnruWKGEQqvT+FTIxNqDV
        +OH7lIvRjwWpVV1Vjgls5bRUgASvYA6qVZAEhXs=
X-Google-Smtp-Source: AA6agR7KJGGPEfG45AFsuwLPIZ65cDWQLMrVOwLF/Mhv1/6qyYJhjlQtOOi6X3gd2QDE/L9z5ASK5uSXzjbTz9zxbOI=
X-Received: by 2002:aca:b01:0:b0:345:4295:e9b2 with SMTP id
 1-20020aca0b01000000b003454295e9b2mr1459750oil.28.1661422446881; Thu, 25 Aug
 2022 03:14:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5ec3:0:0:0:0:0 with HTTP; Thu, 25 Aug 2022 03:14:06
 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   kayla manthey <tadjokes@gmail.com>
Date:   Thu, 25 Aug 2022 10:14:06 +0000
Message-ID: <CAHi6=KatswYFxL7CLyjoHpGHe0o_PXUJyFSBPB5Mbm5EKh+5yw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4974]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:232 listed in]
        [list.dnswl.org]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tadjokes[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylla202[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bok draga, mogu li razgovarati s tobom, molim te?

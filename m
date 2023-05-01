Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7016F3AB9
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 00:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232991AbjEAWts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 18:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbjEAWtp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 18:49:45 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AEFB40C5
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 15:49:18 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-77d049b9040so10075980241.1
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 15:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682981352; x=1685573352;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+uJ1+KwQjMpdNiCngwvlv2FTzZnzkokoCYASnN36NE=;
        b=GQ4mfAt2fcSS6hW6mQLg2I26gYa6FZpOuqviEnjF2z2Y0+PeqLSnJWDHo1Rrl2QZCd
         yibVKrJrpt8FWG0H51B4V/5WAqMu7C7Jlwu9acfOzbeLviVrHniH+OwOcXIKBV+RCZvv
         DnSOoPscuG9HQHaAEb68B7FMJ1vU2sozhvA+BfH6idvCi1nK1MK9yFMuSe9PYmfX/P/M
         0rZ5LOP1643lpIpTqPcJO0Cfxjk4qHoQZGMseg7AjC2T3HINPN2j11ePZVRXP3UIjrTp
         gVJSVvSVOJP7SwPVMCJDvkUkT9yuyRi7vG3UqgT8pJaGVbQWPWEUYhsXzBV2e7PkcvDT
         UNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682981352; x=1685573352;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+uJ1+KwQjMpdNiCngwvlv2FTzZnzkokoCYASnN36NE=;
        b=U36y0kWVEesYaZxYH4J1Xa5JnfjXBZPB24rvDDPZs1Xs9ps9P+7r905xIqtIBBqu2n
         xwrEspXeHPOa8UzkQ3uCfm0FNLjYen33xe607o0GPsKthu34Kbq0/zBq64euFEdqa4ZT
         E3nqzyU5ifGYLc6tPYA5FhEnJCZTgFbY3u2ggfed8ddCfWrlBgd9oThI/4OsVSdeSOa3
         sUvatJ63FuVjlP2KQVaRvXN6q/D4cmvg5o41slwEjsBMkEiY/8XjZXvNu66rSz8h/XsZ
         HDbkqQU8o/fXQSRQXHZBc8ErJZ2iYYFz4GH/0lpRNacU/rBrSZ5e8ajsGSxgIvYy5skr
         7s5g==
X-Gm-Message-State: AC+VfDyDieo0+9mPijqnXYLIhXigVL5qVptqLXf6z4kOYKT+gGbBkdRO
        jTy8S0KkAXxJ5JW2DdAd5f3/7Zy/0m9Xml/UIbo=
X-Google-Smtp-Source: ACHHUZ7JF3vDiMXV3JI2Tn+rOKgrfQNRVdy+c9QTtD2Ws+G9QPn1EkPcH06pJOXxQgO3A5iF6WnwKgmgPIWMyXRt8Ds=
X-Received: by 2002:a1f:3d92:0:b0:43f:e623:952 with SMTP id
 k140-20020a1f3d92000000b0043fe6230952mr6174786vka.2.1682981352000; Mon, 01
 May 2023 15:49:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:c707:0:b0:3b7:385b:ba93 with HTTP; Mon, 1 May 2023
 15:49:11 -0700 (PDT)
Reply-To: chiogb00@gmail.com
From:   "Mrs.Elaine Lam Su Yen" <davidkjn1@gmail.com>
Date:   Tue, 2 May 2023 00:49:11 +0200
Message-ID: <CAAfY6swsGhYkRdNLMuShSQpN0EkR-XXR+Um-Jvb8SNXduOi-Dg@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,BODY_SINGLE_WORD,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,
        SCC_BODY_SINGLE_WORD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:930 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4972]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkjn1[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [chiogb00[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkjn1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.5 HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.0 SCC_BODY_SINGLE_WORD No description available.
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 BODY_SINGLE_WORD Message body is only one word (no spaces)
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

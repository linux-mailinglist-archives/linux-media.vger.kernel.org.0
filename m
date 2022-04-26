Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E7B50FE5A
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 15:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350640AbiDZNMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 09:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350650AbiDZNL7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 09:11:59 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEDD51E50
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 06:08:50 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q185so12687486ljb.5
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 06:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=nIgHZXIaeZhf23re2WIWSl8FwNzY4XssmB5G+OP1fgY=;
        b=Rp5M6DGffMumgwzkfOxSGjjr4ftDhLODR5a1+q5sbrDoKirJOLXuBQ71oayOURisMO
         9Molv9WeL2gfac8WqaGpduQH6/7pR2Awbo44GWSqvV/tk4K9F8weG4VpvHx3pAej7BNF
         HPsLeLucDBWWTffw5HaUQ6d+hbLv1YrsXfNgFQjlReZshnJhK+b55jz4gAES9FItZNOi
         ymE+uxRgs1h7TzFLT3kZQoLIR5mQQlJk9p5lSj+3Yfbs/exThc/f68iWae4fMOA+yfl3
         zGmd3Lvb8K9xbkqQ9nEiwqb4AGeMmEHL8FjHscFDPpE4nQwcz4BC7KcbbB39dik+ISmK
         4QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=nIgHZXIaeZhf23re2WIWSl8FwNzY4XssmB5G+OP1fgY=;
        b=7tXKeVQD0bN+0Fpski9v4A9VXICQ5tgWyRL/D142nnizhIwuFISRJ0ED4+umCi7nym
         SCTpaw9sHIoi9Eqn4ZQbdydj/MIPDYLbuZ9LbT7SmJApACB1QOtkZ/iFDjw1u4dzcGSL
         2ebvAZ/A4TYMMPUnQRm8hi7K8N+ZKMK7iJVb6VGtQYUBPWSbfcQlnf/5ALqKYoSb7hDV
         9M58ixSX3kBVUaUqwD9FdxasDn6S83b0R5mtewO65DaweqN6nFG1pLXaztXA2T6ty0dK
         5sSjLmTuv5DnRpTozKlnGx/CpE2Nxk3koV98EzAhFUcBd+dLZCco9w+cOK9q2HtCsJbV
         GIdA==
X-Gm-Message-State: AOAM533Ae2KP6aaitozxzXjogyGj4WjBO8g9xYqfvETRTBuaMdIlNzp6
        A3/oNJWXP+rY8B2xB6vLlmfoKhYLrfko+9LvQGU=
X-Google-Smtp-Source: ABdhPJxJgeVKOFA/6frHypReElNZg7XGWMv45cKJWIMCxQMjsLYM6e2ktns33x2pek7Zln0pYRmYoOJAo4wHgFeZBcM=
X-Received: by 2002:a2e:9c43:0:b0:24b:469:2bb6 with SMTP id
 t3-20020a2e9c43000000b0024b04692bb6mr15136354ljj.248.1650978528342; Tue, 26
 Apr 2022 06:08:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:cb41:0:b0:1be:7e9f:f9a6 with HTTP; Tue, 26 Apr 2022
 06:08:47 -0700 (PDT)
Reply-To: usarmy.jameston1@gmail.com
From:   Major James Walton <josephinmnyinge70@gmail.com>
Date:   Tue, 26 Apr 2022 14:08:47 +0100
Message-ID: <CAEH2Oon1-iK2-v5D9jvDrtSNmU1_Pm6ePrZ8FNs74Jpb3_goVA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:22e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4070]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [josephinmnyinge70[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [usarmy.jameston1[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [josephinmnyinge70[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
I am Major James Walton,currently serving with the 3rd Brigade Support
Battalion in Iraq.I have a proposal for you. Kindly reply for
details.Reply to: usarmy.jameston1@gmail.com


Regards,
Major James Walton.

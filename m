Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8E0629E53
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 17:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbiKOQAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 11:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbiKOQAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 11:00:30 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4A4DC0
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 08:00:29 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id z3so10975450iof.3
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 08:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=O7GMA46VXvKK6w3SRTh6EDXq6K8BaNrhLMT0iLdmXoI6U4r9PHO2mfDVzGFlAx5Uu2
         GYVkqCOTjY6lOYKURqRWSHY3lhkS0LWPSEV+1Sjyy0wpt1qhCz75/zRlVx1dJBW9iKdH
         Eqju4EWRf1BPvMpUBThB4mxRrRyHXNNTqYL1Xl5bPeXnE8CXnOrwsGHAYUFwgwv3NREc
         GkuS0wbp8P+9f0YgKsAg3ANILgAXhgZ5F8pPLAGLyMfOvWWTlPDIfi+plMoy2E3UgTol
         wD2IngCFxNONVU+ZU/A9AaeMQRTr9308EzHFgfGNTwTVCbx6RdUsAY1nkCmv/pYWA0jS
         e6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=kYkTJdifvrN0iFgWycQ2uGeX8OhbgwD2O5L0RmsPwDoR4v0dzjJ/Y4hjdyDzANRijV
         MyS/VxfOjzTSGwEtXLMOo9U2nsXKxSIdPWQ7G//QbgPRX00xP9sH2ci4HoA/gYDSrc+B
         hRbnyCWxc+JlQ9z8+h3ED9oQQ5wVVFvSmPP5g61DteWRGCYWADHrDxmG+6fUMEHz5CtF
         uNlwoGI+PKuvQXmLhJsx6HQQpeQjwGPOWtzja1t2zD9Txw67l/8Y/rkVWmvuUIKxhsI2
         VF2eaIu19bPF3Lc+/7UDH4FhDyDSQUrEHqPngvsJ07rX3pIeXaSaI7wlOxnuABNluoxn
         5bEA==
X-Gm-Message-State: ANoB5pl400boDqvwrr74xf1/AZnAttfJ6MPuhYXwO1yaScv4gLzGiXpG
        OYKeKCuu9afsIQxMcw17ikbTUtZkNCT7PzRVSSE=
X-Google-Smtp-Source: AA0mqf6Od/rcmEE0jUZMWPAXjQdloBDIpZ4RI3GMkLl9sOkDFwBacI6z2Vaw5lK3DOQhOa5qspjCudQfjYETM8fHUag=
X-Received: by 2002:a05:6638:418f:b0:376:1eb7:ba90 with SMTP id
 az15-20020a056638418f00b003761eb7ba90mr2733940jab.88.1668528028278; Tue, 15
 Nov 2022 08:00:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6e02:1e01:0:0:0:0 with HTTP; Tue, 15 Nov 2022 08:00:27
 -0800 (PST)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <tracywi178@gmail.com>
Date:   Tue, 15 Nov 2022 08:00:27 -0800
Message-ID: <CAAxj-_i990rNq1RUfmgFuULdF3zjzLqq_6tvrERsMoNoRkjRdg@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d2f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5066]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tracywi178[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [tracywi178[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
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
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0E3536D1A
	for <lists+linux-media@lfdr.de>; Sat, 28 May 2022 15:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235810AbiE1N3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 May 2022 09:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235473AbiE1N3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 May 2022 09:29:31 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BEDA1834A
        for <linux-media@vger.kernel.org>; Sat, 28 May 2022 06:29:28 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id i186so6687151vsc.9
        for <linux-media@vger.kernel.org>; Sat, 28 May 2022 06:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=yHYbw2bx/nsQBLFF3gJlg+vRlUz37DtKoW4ftjnCRHI=;
        b=Xi3ApVFLNOOWluk36mWVEUZu3dk5y/QtW4TTFQ3J/YX+kiA4CjCpvIXZhT2lf/NG31
         GMJa2R1LVMyoWH0wPp+BtEjoGS7raU5VLZ5jriCiIA0Qmd+MfslRnHJHdM7EwfD6uB2z
         s2JN5/rvWkLmqbxnjPl4n1U+Pn+d6IEC7vgPn6Kqy7YcXWX0Crnh0oaGfpBSXr7HJBBs
         FRqvA6nRroem0/uSeEtR1B678z51GyUpuPqBSo3hIrzz4lR9yEKJQl8KWnc1OToJMGNc
         Xta9UDxWF0v9Hi5UtfMs1MI1Fbi4nip4OcFj3SmJRbPbgZr8sujEN+xCm+Qs4elMEXNk
         kFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=yHYbw2bx/nsQBLFF3gJlg+vRlUz37DtKoW4ftjnCRHI=;
        b=e+1/4fwEdvSKpQfUQnUdXfFEuPpwrZYtPokFj/bL/345F9K4GfPvwWC+LfbqVvBDOU
         OaiWc+H6MzYNn+7XXdIE2KkV7MlB+2C4RVD3P2rdDyDTM2V0HU2h1l1jBt19J3kKL2GU
         Oq+r9r6Dzf5Iu358fRuVa1tGZDmV3atDJnWF73IVi3Z2aW78j5Q9EQtmRE54BeSiKNAc
         tsObAnUwgrqyXyIYzApbr/S2moyt4buZU3Nwv9TbR0jHPqq1ffJkIPpc96kXJSFb/6aE
         Taa+UYgLAq5LGpaOnM2aMhVrfHiKBKB44kjSHd1l+EqRlSO546jAIuhx0xkjjy9S0QIZ
         Bwkw==
X-Gm-Message-State: AOAM531SETcbi83uzdg75WALbw1N3ceIf8zB+T9Yz8kIOt7Wtl80jRwi
        VgjyPi2IhI2sHlQyieo/Vq7+4D3x22KShB1yG3o=
X-Google-Smtp-Source: ABdhPJz6HXhjANVyyNzrNe2CxlCmFoeTKPLztvqJdkMa4OsVZmsYr22BTxzzpweAMJmN3LMXHRpPsP/LzYGA8XSoke8=
X-Received: by 2002:a67:ca0b:0:b0:337:bace:569f with SMTP id
 z11-20020a67ca0b000000b00337bace569fmr12926231vsk.19.1653744566964; Sat, 28
 May 2022 06:29:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:61a:b0:2bd:1783:dbee with HTTP; Sat, 28 May 2022
 06:29:26 -0700 (PDT)
Reply-To: avamedicinemed3@gmail.com
From:   Dr Ava Smith <mrsnicolemaroisbf@gmail.com>
Date:   Sat, 28 May 2022 06:29:26 -0700
Message-ID: <CAAV+NNR98rAGphC9_G5vqGv6iQr7m_40hQEqvbkXvpzB3+z=FA@mail.gmail.com>
Subject: From Dr Ava Smith from United States
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e35 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrsnicolemaroisbf[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [avamedicinemed3[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
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
how are you today
My name is Dr Ava Smith,Am English and French
I will share pictures and more details about me as soon as i hear from you
Thanks
Ava

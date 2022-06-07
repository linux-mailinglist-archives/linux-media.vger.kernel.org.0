Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A441653F70E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 09:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbiFGHVy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 03:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiFGHVw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 03:21:52 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2375DA30AA
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 00:21:51 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n10so33350742ejk.5
        for <linux-media@vger.kernel.org>; Tue, 07 Jun 2022 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=OHbou33WPhW0PDy9/CZae9mIrL4buN3/FALSld4obAM=;
        b=jBFap2tAg0deoSkZEnJcZESYmZuXMpPfKlobPd1hhd1ZLVFhCvs64RXjzYzhbJ8aZj
         nl0yaoVoV6WT/5DwvkACZ83O6dsndMftbxvWb7NsqOIIxuTfaBTtikfRBBvPA2ELrDpr
         D2ZFu3WgSOrPmYS85N0KmKFymnNjfqA/auhOn1cJMqlUDnPu6P+UCI4xqlim9OsMwEXJ
         6AnKBS35qTRyk0WmjE0TYFwwJ5K7YhNE+F+JJq9ABcw0R4bSJPVu7yo90juEB6PIj3vB
         rvpOSMGp1DrwQVU7mmqaFf9v1m7Qo0D9JFEA3HWQb+E8sZaeTxiI0Nwa2EBLU9MJyCpe
         rFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=OHbou33WPhW0PDy9/CZae9mIrL4buN3/FALSld4obAM=;
        b=T/6ydJTfzHPCgmfdMlssLRZVLCcKCKPe6U1LUwwDScHN59lQZHCrklqJo9AVLdirjS
         i3BImKd0AftBtOshMuRAHblCSBDpyAXViPxSgAi+y2LERxLUPvdZdQ3oE7AB/y+HEFPF
         e91ElzAfseSRXIxw6sq/g8mu7Mx4H0JW4Y6fvF10luXCBHr/fUxHclSOHe28TwoE5kSr
         AmCXKbOOZUePldC2FGxUhIzeXE4h8andtVowCateTtin+9zUIv2h2NRIZLgL+zXYut98
         Wkf3IbuhRhbrkyo+MEg09rjstOlZxqOTP6B9UWZGYgDGNCDP8w9MVKWLq69GLX6dVY/p
         a7Lg==
X-Gm-Message-State: AOAM5302avUaI3JgjRvp+CoBv+qedmMQPnAtuBwVKXlnMefgMkei7VYJ
        kQf0ci75h7BYkgeQTbksznSB1gaWhN6niH82Y8M=
X-Google-Smtp-Source: ABdhPJy78zZ/WRzE7gUIyHi9Sozm6u/C70rXXIQ/HUqXJF1UpL5B8ESB+tNt8jZZF7jlN23y97lRB1nSySoKI+E3v9s=
X-Received: by 2002:a17:906:1c4e:b0:707:959:8cfd with SMTP id
 l14-20020a1709061c4e00b0070709598cfdmr25330056ejg.738.1654586509516; Tue, 07
 Jun 2022 00:21:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6402:26c8:0:0:0:0 with HTTP; Tue, 7 Jun 2022 00:21:48
 -0700 (PDT)
Reply-To: andyhalford22@gmail.com
From:   Andy Halford <fameyemrf@gmail.com>
Date:   Tue, 7 Jun 2022 00:21:48 -0700
Message-ID: <CAATdNaumg_r1Q93wNZfzhLxBQCT5MXgcDgVtUKLK50Wgt7hgKw@mail.gmail.com>
Subject: Dear Friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:641 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5713]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fameyemrf[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [andyhalford22[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Hello Sir



  I am Andy Halford from London, UK. Nice to meet you. Sorry for the
inconvenience it's because of the time difference. I contacted you
specifically regarding an important piece of information I intend
sharing with you that will be of interest to you. Having gone through
an intelligent methodical search, I decided to specifically contact
you hoping that you will find this information useful. Kindly confirm
I got the correct email by replying via same email to ensure I don't
send the information to the wrong person.



REGARDS
Andy Halford

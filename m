Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0795B8F4C
	for <lists+linux-media@lfdr.de>; Wed, 14 Sep 2022 21:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiINThe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Sep 2022 15:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiINThc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Sep 2022 15:37:32 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D697331D
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 12:37:32 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id q21so26904292lfo.0
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=2vJHlqQj2D5js5r0I2Y1BVF4byvG2P2spYzFG+ucJkc=;
        b=E3/8Bjjvq8/FO5vxh7xOxsWFdBwzKK5NuarGYqYiiSeYwc82/p6sCGRAed937uHvqg
         EnCRPIvPReDViEpiyc2syhvCx4AK2T/IIoHLXGqWj2GXFPsjx+c2KlRcoFDIBvMNIHaJ
         SJ18RRa1vzFaZBrzuZFj9RILI5yDhP08LHqF1xj/siOoC2yoy/P5RoKBNCV9lwLUDlVW
         MRat76Hgeubeq4yJ6oF4FKM/T6+vcqebz/rNyjbDW3O65wTQSqxbThUUVIWzW8lKg6jF
         5hXuHdf12bbwbo9oEbUYsA9ONrxaCXcVKcrHXFupqCmwPLHRwWP84otEImzaQuLrNL2F
         0SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2vJHlqQj2D5js5r0I2Y1BVF4byvG2P2spYzFG+ucJkc=;
        b=Abd5a537yBA3keLHA+6oFui1YyERHUaWBbizeIv2SDQoCji3CXn/MOT7TddAioh64n
         NF/Lk/1M9fm6Rj6+wvJ/EMndmyl3J9gc9/FuOkgGvUTmnTVCmXoU5qpd9vfC1/qMbLZU
         f/ZpZ+HDXjqqQD4z8+vUIVivTbFY8q1RATvuMnaKz9YxDvwTfIgRBO39yljSu4/kNs2j
         mRmKZPPC5z+7sOQNA3/Z+0lR8y0OHpmCpWoaE8I6pt2YrMERZkTHUB4EhHGPW49vQ4H+
         Kh2U35McVz0mWc1Y+SeUZsAqBujLD7KdKw37dZEp0HHyYHm+peZObwJe4emxgi1S8Qzw
         lt3g==
X-Gm-Message-State: ACgBeo3kdFkU55Ce8GHlnYRcrXr+Vhl9uHGgYXz/eQouqPlnxmd/ECNV
        7VF4WJl9L1jW/3cV7WtPlIWe+xrfsCZdK3mWC2A=
X-Google-Smtp-Source: AA6agR4BCfhqQgm8gAXtILuWNnoK7wzM6DfKnkLicWr9KIBiHeePFsgzwIyBQ0bOM9HKvlwwSy3S/jCgIT29hzAH728=
X-Received: by 2002:a05:6512:3f4:b0:497:a33e:365e with SMTP id
 n20-20020a05651203f400b00497a33e365emr13416444lfq.638.1663184249862; Wed, 14
 Sep 2022 12:37:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:a583:0:0:0:0:0 with HTTP; Wed, 14 Sep 2022 12:37:29
 -0700 (PDT)
Reply-To: bodeg41@gmail.com
From:   Bode George <fbiinvestigationf1@gmail.com>
Date:   Wed, 14 Sep 2022 20:37:29 +0100
Message-ID: <CAB01aPoUFFcrjCwB9m15YAtevU_cmE5iVhjBU8FtGeHXP=gWJA@mail.gmail.com>
Subject: For Your Attention:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:144 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5435]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [fbiinvestigationf1[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fbiinvestigationf1[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [bodeg41[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Dear Friend

I need a Reliable, Honest and trust worthy person like you to receive
my fund for our benefit or investing it into any lucrative investment
opportunity in your country

or around the globe as you may deem it fit. I have investment interest
in your country with this fund but if investment is not in your own
interest, whether investment

or not investment, this fund as you receive it will be of immense
benefit to both of us. Therefore, please contact me immediately for
more details and requirements.

Best Regards,
Bode George

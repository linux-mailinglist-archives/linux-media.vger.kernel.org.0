Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDE059B54F
	for <lists+linux-media@lfdr.de>; Sun, 21 Aug 2022 18:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiHUQAD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Aug 2022 12:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiHUQAC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Aug 2022 12:00:02 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95963E43
        for <linux-media@vger.kernel.org>; Sun, 21 Aug 2022 09:00:01 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id 190so658862vsz.7
        for <linux-media@vger.kernel.org>; Sun, 21 Aug 2022 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=EDlMQzzVbGTvS/Xi3jfsxW5Vdl1DnbH6ryI6Z5fSkFQ=;
        b=H3bsCE+qE1JEBH6KQ6V8uRC8Y81yszLPxIBlUBH4YO2JwwVyjqNZ3Z62UofJNK/xkK
         7mwcfZwGiHqT4Wi36mzZ4KTmQi94h3ede8rkDqcPwRjSFNvQ1UF5FtPqsoxqMBhgf9Pw
         e9JXpMMfmVqEvLZdw1+mHVld/NTSKAeL1sZsAI3pLuOPV7l0sDBOP7T+LFUvHh1lzPWS
         IZx5Cd/5mZ1WL5XYKqL5EosuiZF45lCh92eP8jqh9g0HBiIoVDGyCDhSrPC4dNyZq49k
         ml2J27vzn8FD487rHabPybZ+tgux2TRx7Mmf0lhcDS4b3md5LdmUmFobGQMq1v5UvgSr
         6fNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=EDlMQzzVbGTvS/Xi3jfsxW5Vdl1DnbH6ryI6Z5fSkFQ=;
        b=Wk5aEmZLvolSaRXKvSB03EdqF0gCYlw6p66C4cgVofx4jtJcCvNTnZS3pW19Tj99jy
         GXwG2AF//3w9yTUdMyszbA/zyafRvpPVf8PDsWqsPjNl7bf4gHk/FzBsC4HNISYXh4UZ
         SaYEJlidIisjbE610VCHZENF2n44mAGFLQnc924YgO9HGkHFMiXJCBdaedao/R2QXPPU
         Bvyu4pSoRodTD5rNARoUFb54SCJvZPWaeINoaQxB1wYjreRiCPM1/YAeOCZDyAH3KCIj
         c4wJf0ipwdE2iVK1M9trw2r7rKd0AASKSiti5V1pNVtMGmpBHX1dSONjdh+ZtHAaRve9
         RJhA==
X-Gm-Message-State: ACgBeo0FNkr/6qRj3fSHrpQw0RDh1Y0/FPZlCYVibxkNyjynD0kXhuzZ
        c1411u/U/++GFz7IFlyNpoBsexPD5u2sIrfpJe0=
X-Google-Smtp-Source: AA6agR4Dqq0gP13ujwcq5XaJJA+iml+S5c2im/UtfDDCKvcZu5geUZOfY6KkhW4v3R8Ln3gCP0MWE8tFerzqEHUvr4I=
X-Received: by 2002:a67:fb4f:0:b0:388:7d4b:50b7 with SMTP id
 e15-20020a67fb4f000000b003887d4b50b7mr5694525vsr.34.1661097600815; Sun, 21
 Aug 2022 09:00:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:370a:0:0:0:0:0 with HTTP; Sun, 21 Aug 2022 09:00:00
 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <manstone252@gmail.com>
Date:   Sun, 21 Aug 2022 16:00:00 +0000
Message-ID: <CAOvQE_9TRaYwpyNeyt0g_dxpBJTSJZx5wjOFC2GuuMYq4zsnmw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e33 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4834]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [manstone252[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [manstone252[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylla202[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bok draga, molim te jesi li primila moju prethodnu poruku, hvala.

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6E65A0EB6
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 13:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241148AbiHYLIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 07:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235069AbiHYLIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 07:08:53 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECA1AE842
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 04:08:53 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id x10-20020a4a410a000000b004456a27110fso3365105ooa.7
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=ZibFWixVc4BmLonxAH5KotHzuKslYsZMvRh/n5KZ0QOKl+tfA0pPUWIJLlbbOupkeF
         F8fBqdQPz2ysLoqy3gVLEF41HBBT5ocIac+sX1bg+Dni8sL62BITLvDSIJr3JibPR9NS
         UIAUISYDMiRlTDfPehv3dGcwkogwkFJ7VrgDdLot/yC5it/TMdmahKKR+u6XmkILb4FF
         SL3blTJs9L9lFBPlHabe0mRqVb2L+RCZBTTl2nJm1GWtT/zLVAgRk7R0kdvfn680vK25
         RrUYaOWn+bQ0UsugEiircPCrVy2uyvJGXxGYcU4jyM5P6C10Xt82K5o/BaH7ISKiI39D
         ynfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=J3T9cjhw3enW9RZZKr37ZxJSDmR5yePpuhMKKuIDEg9kI/dLPQuumbwhyYdwNnfX95
         rSiAPU+IkIq7YFzc8+hNfHkZ614zKkHpHO+ickINVQP7VjaAQvJSVWzCIbktOktyHwVk
         87ScVmsjL87porPHE1JgqpjEd0+0Gn1JJL3XmXp8p5gbIBnlwImbtSh8Cz/02MhMcsZm
         UV8jLyExCmJZFQJ6lfLWZWs0bh+fUmyXwxBhZUJend/VGPZSkNFNytIITLbgvNsbYH/q
         3OFc2BBCn/+1ZzBfR8H7KMSSGDNvpU32JRmIHx/sL0XP9RBCaezqLH4AU1jGV7z2q2Xu
         pKuQ==
X-Gm-Message-State: ACgBeo23YVeCds0Hbwjk1vlUci5DYPLBrOTaIR2nrBoN5+AdKt0izrMZ
        u/wmegTTgv75LQfIdEtef63HEkRvWR5wB2gx+xI=
X-Google-Smtp-Source: AA6agR4J0IZXxFTQdTICmmk9fYIgPzFVuGGZP6ya4ZYQNUru+Z35LZqTDSnL4ojGQdnjKKiDRbGWrlQ95POcyJWOC2I=
X-Received: by 2002:a4a:3707:0:b0:448:c995:fd9d with SMTP id
 r7-20020a4a3707000000b00448c995fd9dmr1049129oor.53.1661425732732; Thu, 25 Aug
 2022 04:08:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5ec3:0:0:0:0:0 with HTTP; Thu, 25 Aug 2022 04:08:52
 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   kayla manthey <tadjokes@gmail.com>
Date:   Thu, 25 Aug 2022 11:08:52 +0000
Message-ID: <CAHi6=Kaiz2VPTDGgQFsh_NcD3_PCweeHbNAdsRG8FPjhPOXWwg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4974]
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

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEAFF75E106
	for <lists+linux-media@lfdr.de>; Sun, 23 Jul 2023 11:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjGWJrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jul 2023 05:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjGWJrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jul 2023 05:47:35 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CF2E71
        for <linux-media@vger.kernel.org>; Sun, 23 Jul 2023 02:47:33 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-583b47809beso9636807b3.0
        for <linux-media@vger.kernel.org>; Sun, 23 Jul 2023 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=plu-edu.20221208.gappssmtp.com; s=20221208; t=1690105653; x=1690710453;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw50ljkf/McGf24gQO6ryHlnxMv+pgNUd5iIU5i5t0I=;
        b=FN4hP5/y9e3bsuMINXRG1Tu1Q5PF3IcGAMrakb3q3xaIX7mczMw/l/9tIy2ExUmjjw
         PwK9xg0EE83TWtPF0rFrmIk5r1Xl/aIYwqe5KgYwGunsq7YrP4cDj+Au3uBIyRDlgMUL
         U8V3XZwP8wl/7iqL+W2lNXFoXzOkVmB1lLbf2/gHlo09SF52DBO9yxignH9suOpAlCBh
         Wa8C4DsAZ3bheMLxp+qZuXSZbAm82CLf84Q0MlnEMvdHmrZNMZhqNE5Uc7kGXrpXwnHV
         Gzxw9TDyz+SnfRXUjiGgrBoDCJAIL1zQOqXCsLvEYE3K2M3xKALXWVcWek6/PXkUWhrn
         Jkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690105653; x=1690710453;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tw50ljkf/McGf24gQO6ryHlnxMv+pgNUd5iIU5i5t0I=;
        b=TxuWkqldL70waGATQrkoYHYf8OuVQoKCA1dYZoT5csAba45FSsAXS/H3K8P0fYesQh
         ZF1+E8Bvy9+hwBeGiDhBTuzEJgQ94PoWBbDTnbziRajI95X1XhO/3qZ9icsyfGJXfaZi
         7NzK+Wy/LfoG7bm40T6kS8XEeL5R3zE/KScWyNKllg30MKd9MaP3IB6pATGtXMyMNCWc
         jbq8HHPjkMH5MKoo5dJl4F5Escr6zVu9m0r6RkpZ9YoOBd8q/9IPhvSK9PhiiCykVxX6
         KK3eJOwIDKoOhBkNQ3LVVhfaIw3Twm+PGxtJv7/+bAtFyq8jS6MtkutJJu3nP++3Gigb
         rz7w==
X-Gm-Message-State: ABy/qLb7t5dtq7Fr3IqPgRT45Y5uPPV+iFdN2+/2/jO4yRGV44kpwD5d
        jG1BpNcXatDqwjoq8UTCgdnCYdeuXUuQXQKx+QyH1Q==
X-Google-Smtp-Source: APBJJlG9EaOFpTLpu9kRjOBOpYStzryBx73lv7FLhVCT5reBojLGTHvnDryrMMAVnc1p4JNjR0PM33Y6oCskfYi8tDk=
X-Received: by 2002:a81:6dc3:0:b0:583:9fa1:e86d with SMTP id
 i186-20020a816dc3000000b005839fa1e86dmr3774709ywc.24.1690105652729; Sun, 23
 Jul 2023 02:47:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:9509:b0:4f3:89f2:4dfe with HTTP; Sun, 23 Jul 2023
 02:47:32 -0700 (PDT)
Reply-To: crypto.trustinvestmenttrading@gmail.com
From:   "@RONNY SIEGL _CRYPTO" <danielrl@plu.edu>
Date:   Sun, 23 Jul 2023 02:47:32 -0700
Message-ID: <CAJQDWQ_D8JPUZK95Atfi6ptYv=-DrOPpNGsz2dXO48XZFA61tg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FORGED_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5233]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:112f listed in]
        [list.dnswl.org]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.2 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=20
Do you have Crypto Wallet?
How about i tell you how to get one and how you can earn $260,000 from
Crypto trading within a week. ASK ME HOW? For more information contact
us for a direct conversation on WhatsApp Messenger: +1 (507) 209=E2=80=9106=
12=E2=80=AC

Regards,
SIEGL CRYPTO.

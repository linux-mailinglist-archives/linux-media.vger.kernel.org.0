Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D304B5A4D4C
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 15:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiH2NOu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 09:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiH2NOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 09:14:19 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BC1550B7
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 06:14:01 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z29so2526230lfb.13
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc;
        bh=5SGZXXm779vUUr1cqzGV/gRigE4jlSEMeyxYIdb55pM=;
        b=JuH2DuBhqdooGDeH883fQInKWy+C9o/rlQH9zR2Rg7rLnNT8vQWi/d/pql0qHIyNzO
         0xCr/Mj0aNiyp5M+K6i2SauxP5CRm/Bs8kC+lcDo5tUF1/iNwWfIauloIR2P5f2A17VE
         GHDRE7h1ZBefbgdRhvl1+ijSL5bikibhK4eLlQIHwrR+hs3qROlhaikjsLyd9O47F6g8
         ZFHTh5VOiqkenHpaauukTp8mO067Y2DvSKcEP1BW9SvCo84REnPTkeeOZxjjF9KJ5kFi
         5fdVYIjs99Sgk6OVy8KlxA6xME7P7k5BAowfYe3aQS9tcu2Bx5qIf59QRAQFRjk6FFGT
         V/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc;
        bh=5SGZXXm779vUUr1cqzGV/gRigE4jlSEMeyxYIdb55pM=;
        b=BK79Aj+8fmLf+BbeC2S3FJwMJKTpGvCpxuijJ/n/R4qmFjd5h2n8ub+Abolczefp9g
         UvklPChJgDn7ntZWizorHkYOFSli/JA2rNBkExxqeJvVtIPNTTmxQsYcpn0wRp/c8heC
         BvQcjuoIxC5xpBP5u4ZYTNgrwOHcV9aDCZtfh32y+ihDYcVw24y7BfDaY5dsQYScl2In
         VkIDBY8nlW9f+lXAvvh2MUEIMTRdLa+hBy8tH3W6j+chXM7+rJHGN0H84WTI8/uzPHic
         eEUfiRzmnVPk964UetaqauVRKlH+gtzs/IBbdGG4b4O2h22m4ni1YZDhCeDMWpii562N
         Bnqg==
X-Gm-Message-State: ACgBeo2easOSe3+BELP0+40kYWs1qPMdK4iRTcQ4iQ3PAR1r218zdQPy
        TmQpYElCmXiCefS9aFhbe1uyWnAEVMP7Q0btN8E=
X-Google-Smtp-Source: AA6agR7kSZ3W0aPnlDsOm9XqEUTqV0E4ofM+7ZuKXF3HH/fn5crAd1jiF96UYXECTdAz25DRPOJVR/o+wjrQ8nRw42g=
X-Received: by 2002:a05:6512:b90:b0:494:6a80:c63 with SMTP id
 b16-20020a0565120b9000b004946a800c63mr1880465lfv.634.1661778833603; Mon, 29
 Aug 2022 06:13:53 -0700 (PDT)
MIME-Version: 1.0
Sender: sorerachid81@gmail.com
Received: by 2002:a05:6520:6104:b0:213:94e:9775 with HTTP; Mon, 29 Aug 2022
 06:13:52 -0700 (PDT)
From:   sofiaoleksander <sofiaoleksander2@gmail.com>
Date:   Mon, 29 Aug 2022 14:13:52 +0100
X-Google-Sender-Auth: hx7J8JWiLbPc9r2tM9sc1TOcz2M
Message-ID: <CAKL4mRenY6-217rDyFRi58ROnQ0E3c9gt5SMgkMYt64prswJ8w@mail.gmail.com>
Subject: Hello my dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_99,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_USD,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello my dear,

    My Name is, sofia oleksander, a 20 years old girl from Ukraine and
I'm presently in a refugee camp here in Poland. I lost my parents in
the recent war in Ukraine, right now I'm in a refugee camp in Poland.
Please I'm in great need of your help in transferring my late father
deposited fund, the sum of $3.5 MILLION UNITED STATES DOLLAR, he
deposited  in a bank in United State.

the deposited money was from the sale of the company shares death
benefits payment, and entitlements of my deceased father by his
company.  i have every necessary document for the fund, i seek for an
honest foreigner who will stand as my foreign partner and investor. i
just need this fund to be transferred to your bank account so that I
will come over to your country and complete my education over there in
your country. as you know, my country has been in a deep crisis due to
the recent war and I cannot go back.

Please I need your urgent,
sofia oleksander,

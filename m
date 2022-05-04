Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E2351A0F3
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 15:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350575AbiEDNf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 09:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiEDNfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 09:35:55 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61745240A7
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 06:32:19 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso833054wml.5
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=qIlNwwvnqpvAJDfIcI1fnSBVRmBpsiG2Eyv+W/PJQYQ=;
        b=JNpn+KVSlgYdCTJPh87leQRSoVKZ8d7Tp/UZZQ2zpwSRJ6eANRzLAizUVEMPmQfvsN
         RFu4e3kVQsexLo/n/sg+bPjwgQaAZYLHAoi52dpls8xYEzm5mUaOegNPREalOQYzPMOF
         jRcOxfIfU42LSzHt+InVJIHJb8rMcuQbuyPC27YycXvLbSotNLXz0Ra2jVAe34buXH9h
         O9m8cVQyh4IywrQRggPDMsVrPtszPiiJXU9YcQ2xyy3ZFEu/nmlD9S9V4+wiizqOOGyA
         9fw6wO45LWqg/I2mgRiJHYOVp41NmDqqzZkf4vEBPWsshJaKvqDmVTso7oSVP/DT6UJb
         2w8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=qIlNwwvnqpvAJDfIcI1fnSBVRmBpsiG2Eyv+W/PJQYQ=;
        b=HWxTFi/0/BF4rT4quH0LSR1vUlMKKF2XOR0x1EPMPm5U1pE9bLY2MMo//XiEPk45Oz
         pJLRqHBmgzTgdh2bFpRNQORZPeFUeYmlBDDTa4egtA2pNMxt661A1O0iY5/DXJsKfPlC
         y7djcLf7ZYx5R0HdtAQrMuQRadXG/1AWbDtbXtMB09FtFdmbX0czSQAzi7O6Mru2zpS/
         cRKSztuZgDIdNz/C8hdOH5AcGTRqCtx/1DxypxJvpMzgdKzpFel4SmxRkuyxQRQeYDV7
         29DtqXYDPQeK2yNEChaBJJrNmPhL1xAsESLdbB3s05EoLXCHU8L5bISg+eN++xOI/Gq7
         BHsA==
X-Gm-Message-State: AOAM530jmPRdQ+V6sf5kvHrTZEqpu6XSmrizQY0MVVoLhcsoGcwO2PZT
        UZMxzfK88jYV9xiBAxJUnWKHNpNWZJt8+k4PNEI=
X-Google-Smtp-Source: ABdhPJw542y/wVo/0Jv5ag9sRWF3erj2w5C7oN/Tus8xTjThRjOtThLA9TYtjyKb9XfiKLNtjZG3hFGTdLuZN8/KFUc=
X-Received: by 2002:a7b:c088:0:b0:394:451e:34a0 with SMTP id
 r8-20020a7bc088000000b00394451e34a0mr7764691wmh.10.1651671137705; Wed, 04 May
 2022 06:32:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:600c:1e1a:0:0:0:0 with HTTP; Wed, 4 May 2022 06:32:16
 -0700 (PDT)
Reply-To: rihab.maryam@yahoo.com
From:   Rihab Maryam <amiata34@gmail.com>
Date:   Wed, 4 May 2022 13:32:16 +0000
Message-ID: <CANx5USqAYJDDXObZvrtZ03nGvCabUGj5Sj+rzprBtLvikXnFzg@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
My name is miss.Rihab Maryam, i have something
important to tell you.Reply me immediately you get this message.God
bless you.

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023F85ECC5E
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 20:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiI0Srq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 14:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiI0Sro (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 14:47:44 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39B11C480E
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 11:47:43 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id l14so22578553eja.7
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 11:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=QR4tG7hACB0UkRInbJ15ebRTjcBUxL1W0OBqttVaCkw=;
        b=WhVrXT/Ima9/ODCDv+X0wE67ZKQwiqCCwE8Uyx4aakhE5IqRW+yz6aUTZrDideG3vV
         FrtCpITJfQwaFkMTe4Yja3cvwnBbwCnrp1G/eBpU2jX2Alrdzo8/VW2TXkhJrPfF5tIE
         I+OUMNMVcR/9LeQ1aGZ3hHqOB5LUurUG8rCM2Im2i4/L/WlBFsa5WWnz0+rNp7GBdior
         VaDOTKQoDB8zCJtG77SfBh7qbguSyuf4i0D6gVXBon62P35ITzEcvRq+YVVv3t65QXdl
         78X878bZTBzBaQbA7DSxHBWJQQDQDm9SUZqDuc7f/GqlD3ul2erIPUcgBrD7qHr59OqK
         kjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QR4tG7hACB0UkRInbJ15ebRTjcBUxL1W0OBqttVaCkw=;
        b=3F52q1knFXLY9z57lRcX3lyk7prx9hQigCBYqgHzx1koDHIDFH4eHpks09HRTU52Oz
         usl6d3zeGRdm7H6OMvfpi0CJjCh0Hn8yz4wNJJyo6Vi0cyBRjW8aqDipgkvCgPOoSoSA
         dKxBsoECef+xoocz6XzHNEJKxkZPmG5ppuEoHwH3BxgaL4Q45bM7ZuItapLQA/h4Up1A
         JQXRC9i4abATQcCyCpPesxh3IylramG34Z9EA/hRwmWELdk4gnqK/74qHmfl6jNeSt29
         +yhuOr4ypxhC4Ba9FO/4ax9h7J1etqgltcfBFVp1lf0ug+hpWWuyuv+o37XzeTMdN3AJ
         rntw==
X-Gm-Message-State: ACrzQf1EnxIyERaV1S1IcKyaud0zIczZYft69i7hxRR7GhHXwo0PXJc+
        wXxxghEzxBsm846G1sy36QTgxlene/M5OJCso+Y=
X-Google-Smtp-Source: AMsMyM6pYt4Ni5ovjARYqlT4laCZkkPNllDpDXmKPONaebkLdVOJAVS2WZMOY+xX7Y6cnBQXmEy3124HuoqJTl7mOts=
X-Received: by 2002:a17:906:8a4a:b0:781:70ab:e7cb with SMTP id
 gx10-20020a1709068a4a00b0078170abe7cbmr23283527ejc.492.1664304462255; Tue, 27
 Sep 2022 11:47:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6402:418:0:0:0:0 with HTTP; Tue, 27 Sep 2022 11:47:41
 -0700 (PDT)
Reply-To: rosedarrendr@gmail.com
From:   Rose Darren <nathanukoha469@gmail.com>
Date:   Tue, 27 Sep 2022 18:47:41 +0000
Message-ID: <CAHXNy8c4RUbF0OXEGzyLHcJP+ZmNZWMxqEOwxz4V1b9Ve_LdFQ@mail.gmail.com>
Subject: Hallo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Liebes, ich habe dir vor ein paar Tagen eine fr=C3=BChere Nachricht
geschrieben, aber keine Antwort von dir, warum.

Gr=C3=BC=C3=9Fe
Rose Darren

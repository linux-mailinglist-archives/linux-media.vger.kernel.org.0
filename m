Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9E16FC35A
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 12:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbjEIKBC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 06:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbjEIKBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 06:01:00 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F01E1703
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 03:00:59 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-44fc0b53a8aso3644350e0c.0
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 03:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683626458; x=1686218458;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4q7wQjwXyjBys1qk1mDKZP+7usmkgUtZ0mVMoonWtE=;
        b=pEZ0G4urDAbf0j0uh38ClZzbsBfBTAYUCm4QLMHnUlAI23pDgWHGr4wLOGT7oIRg0L
         8cfYjESqEnLPiZc3MxY8WAxB72IHJ775nez4OycTXAHIjLMW7ZwpljtK81vAuW3Z6qLV
         UY+Ag66go6YsHPJH//XzvCbwEHNLgIcSIB3hKcJ2bZih+RxjazQ0S2gtwDLonHSZarJ3
         HYLCqZgeXBOJjce55X8JeoDDeQ28Ybu0D7JuPOndRG6Y4ra39H/i/1s+/SQHiYb8V7Qw
         zKjtQKTiGYEo9hhrMCmFl+uM1aq96jVI8uRX6nzQetXH1/gj2s0Qv3BZAsi6AcbSTaVY
         uFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683626458; x=1686218458;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4q7wQjwXyjBys1qk1mDKZP+7usmkgUtZ0mVMoonWtE=;
        b=W2KVIzv6NWZsA2xjtTJRXUkuNLkJaJerUyEbe8wBbA9IDyNQhxsPwYVjwZEKS0x3so
         Fv6cI4yIDTdx08oMXB6AvNpfDpskeFVWj20bQ22DURSt1CDDXeiLziGNsKJWzcO/7Ufa
         6e37qja9R1A09zyPXtLErFgUgGUhQoLCz44HbuSa7C4fTB7GqLvC1XKcd1b8yR4FOaAN
         ZdMSNQsEvBmc/KOMNaz7xWC2rKjVISmViifF/aAw1YQGRy7TQFhBYZqPmzi3DvNBusxu
         bqvIISL/AEyg2rclDhpOa9YRNlOkikMelCSbbyFE4Thic84fQMgBSQA3s2FJ4HvIiblb
         UxaA==
X-Gm-Message-State: AC+VfDw4+C5JbrUB3TlW1WT0MBf9kzcTGZ5MEBSwo2vRhO6+7nhrkHV+
        flfCOHJMLvHzelQSlz1MgqBidmKyhi4wy0pv/zw=
X-Google-Smtp-Source: ACHHUZ7L5voemP48sjOnBRkjDvLcDg3I3S7gL4QgWf3WERGgZFyZf1bdcaylSvkGMOgY+AHLLunjeesPoVuApCmiPoo=
X-Received: by 2002:a1f:cf44:0:b0:43b:ead4:669e with SMTP id
 f65-20020a1fcf44000000b0043bead4669emr3575179vkg.16.1683626458594; Tue, 09
 May 2023 03:00:58 -0700 (PDT)
MIME-Version: 1.0
Sender: dionmarywell@gmail.com
Received: by 2002:a59:d6a5:0:b0:3cd:97b5:6dfd with HTTP; Tue, 9 May 2023
 03:00:57 -0700 (PDT)
From:   hintojones <hintojones64@gmail.com>
Date:   Tue, 9 May 2023 10:00:57 +0000
X-Google-Sender-Auth: 0y4UQ3XwQ6V2b2TrZR3-eMRK2V0
Message-ID: <CALZYFA3rhknEE=zwiMUnqxmUaJbG7nsSFNOwJRJZuCpHVZymMw@mail.gmail.com>
Subject: Hoping to hear from you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello ,
I'm  Hinto . Jones . I am  contacting you for a private conversation
that will interest you. reply back me via my email address
,hintojones64@gmail.com, to  have further discussions about it

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED0156657F
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 10:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbiGEIyM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 04:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbiGEIyL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 04:54:11 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C2BE0AA
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 01:54:10 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a4so19489483lfm.0
        for <linux-media@vger.kernel.org>; Tue, 05 Jul 2022 01:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=nw9QBM4EqJ5xwWd7RpoMZnENK7E50AzGM8TkgpvVQ1Q=;
        b=d1fwHYEmbnabD5ZdDwrH4VvmxM9Ml+tOGAwnvpZG9eDqyg5tEbLny+kh4RGuiQ4UR8
         +Nt5ezNZn2cbhDaEEdoerjHlXY9EbJM9dbwyNZLPlbIg/lstUrldwZOBj4sGAJVniL4H
         d80bFizstmm6dVswuHgLABEPmt9jxdiCt6D0fACpbZxFFgyNJ+dwXhbO7iCNIv2nJCeA
         /tw4YcVdOSyGZ3tn4Ob0vXYchzin8dZJ2TKdPJcBOzcsOAmUrXUYEim/9ZcU6lZTa/C/
         JiHCyb4QuW3tKr2msoD+LlCfF7taXtNP4mI0EG1odVtvSt+tFRHG12PG7SDBTZIXrWdj
         gV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=nw9QBM4EqJ5xwWd7RpoMZnENK7E50AzGM8TkgpvVQ1Q=;
        b=36jKXWf+t6taQVxwmNHEF1b1i4msBf+0WPesxbYZsgy/uIpd0mOtQG6f2fkUW+qFiB
         KniaXgGbveQsRXbgSIgPcDlJr9L/UFtiWI9KG3DrRHQQxLmvTKjFy6wSRLrPHtzyYieA
         jjNW18l61as5jvexwaaAut9D7u6MaTdXyLzHb+n9XiEhYztl73qwu4I0slYMGyEYv7Wq
         ysBejklcSfjnVRKC5w9Tr62hCThVtsV5rarDbDZgElQsH9QnFIOzF1lKjVmJPMlaaH0N
         QiE3xI/jA8k98wiF4xnaXATAknyBon4a39bXQGFPgXszV6/1Jjp5DbweiGXnezbakfgu
         Zjpg==
X-Gm-Message-State: AJIora+CqBfR2cCJH0SKq8Ijm1iKPMwPQl9nFcRqrMT9BLuMa6ExURLh
        374duP77s1Ja/DYllYS25cCDTgbCgI2I2NTCgwU=
X-Google-Smtp-Source: AGRyM1vCZh6kTc1MZ3RSIqFNCtMIr9dt+zHGKzX/lFdYUs1vlcEUDX7A7AM+oGVMHuBRVULg+2VDZjHXpU24lzPMjug=
X-Received: by 2002:a05:6512:22d3:b0:481:1ed7:bf12 with SMTP id
 g19-20020a05651222d300b004811ed7bf12mr21299164lfu.179.1657011248424; Tue, 05
 Jul 2022 01:54:08 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkalamanthey@gmail.com
Sender: ismaelmaiga093@gmail.com
Received: by 2002:a05:6504:188b:0:0:0:0 with HTTP; Tue, 5 Jul 2022 01:54:07
 -0700 (PDT)
From:   Kayla Manthey <sgtkalamanthey@gmail.com>
Date:   Tue, 5 Jul 2022 01:54:07 -0700
X-Google-Sender-Auth: z5quX2ekq7npA-ZRKTcxvCdjKco
Message-ID: <CAB3qZ4hJ9zaTobNHXbfskSRrSANGH6CkNRnB5a2bx8=Y3_sAKg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Powitanie! czy dosta=C5=82e=C5=9B moje poprzednie e-maile? prosz=C4=99 spra=
wdzi=C4=87 i
odpowiedzie=C4=87 mi

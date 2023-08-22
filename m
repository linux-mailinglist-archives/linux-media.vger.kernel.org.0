Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23C09783D33
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 11:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234435AbjHVJnm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 05:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234427AbjHVJnm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 05:43:42 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62E21A1
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 02:43:40 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6bca857accbso3337983a34.0
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692697420; x=1693302220;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Qd00mqgwhkkW6amCqEXLEzCc/q28cqM0GW7xvshDA=;
        b=KlA+FuLvfqiEJdHbkYBayeOig60V0s+FQ2TBJcwEZan0vrcvD3ecoSDmNKBf+aRjup
         7go+OJ5BmIvkbFU4WImD53t2sL2S0OLfmQbmXy9EhO7KBdY0D1hd/nlhvjgo9xJbt8pP
         mqKmUEsqMNNITRMLRMRYkhT/99aZQM96/Lx/eJghZ687MihInrWUDiXLobx2bM+vgrFb
         +V1oNq4gmA3cCjxWpmBWgVj9YX0tLuTYc7PIOntHXdOca9x8DFOivpt1iSOrUNG/aWD3
         dRzunVy4HCP+a6eE37SQcjKU4nG3aQyU2uYvd78+gFdvqWiwOQLJ8XXONloKOt1BgcJ1
         M3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692697420; x=1693302220;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46Qd00mqgwhkkW6amCqEXLEzCc/q28cqM0GW7xvshDA=;
        b=ccntv4i1hAVtGTL2ANmcoLzm2lHQtKioRuaUUzr5s7zdwTY9V3f7XgilwF+gHV7ABU
         HIEHKEe1ZDkJK9Jv981IIGV3n4aTGqPVc/LJP5XC3P77o5vks+jDhmN8zd56C3koT8P2
         9qpXbKnHMjInI2oD285pLMtj3/SHozDqe7ybd26rkcngN5HOtQeq5lzWOndMMIEQQtfB
         vaThxzrtom+Ae4tYofFP2GxO/dC1FUr6rRD6rEXtr2dTkf/e/JXCKzdlyCymlPlOTc39
         k25jMQRrui94wkTLprLLh9J3Fi1Ja96EQjkMh3br/PvKM1EflkRpIa8okZJtVUBynRJb
         r8uQ==
X-Gm-Message-State: AOJu0YzqrOLMMFSy59HHa0HW+ElYq8vmWLyZyli7AfvXlNBCLFMJubLj
        M3KxztctubtbXSVjQrSjIzZy6znXL/iDdv+W7g0=
X-Google-Smtp-Source: AGHT+IEXV9NEtNE977JSam2+mynNTH5ComRUd738N2dd6DfcJ8MQIYZWmI6j4wnh63DUAfKJ3At3he+iFcK3tP2JdcU=
X-Received: by 2002:a9d:7d19:0:b0:6bc:63ca:a245 with SMTP id
 v25-20020a9d7d19000000b006bc63caa245mr10550293otn.10.1692697420009; Tue, 22
 Aug 2023 02:43:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4e8d:0:b0:6ac:9e18:76be with HTTP; Tue, 22 Aug 2023
 02:43:39 -0700 (PDT)
Reply-To: lassounadage563@gmail.com
From:   MS NADAGE LASSOU <zubairugado@gmail.com>
Date:   Tue, 22 Aug 2023 10:43:39 +0100
Message-ID: <CAOp8G4a=CcoKVPrCH53r75LjptyGJe+34bU27ewCWz6tQ3UsPw@mail.gmail.com>
Subject: YOUR REPLY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings.

I have something important to tell you.
i will send you the details once i hear from you.
Thanks,
Ms Nadage Lassou

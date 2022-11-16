Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F385A62C27C
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 16:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbiKPP15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 10:27:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234511AbiKPP1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 10:27:54 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC39E29C8A
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 07:27:53 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id n186so18847769oih.7
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 07:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s6XTTZ+NrUCRZqrFnnPtlsztZjbXNjQi+1S8muccdxA=;
        b=pn9epC9xM/u4Y/T+MAwMM1yPmJDLAM7U7Z9wMWXDGgSEpoTGoMAzaNDz0nlT09mA65
         kVTtMtoYfytFy5bDVdNTfLGbn777qdFzyJhfgBaSZoy5Q4bKoHOisgDL98HgcDOm9Ntq
         tdShVtU1r5yPlObiv6i5lDRmUS9YEl3I9MkwX/sseteie+UU9XWMH0cysMTbxEGgaHO0
         W1+DBI7XtwW5BQxy60jSTmr2pZDdCWa9kYbAy87Vidtf82i3BlwmR+exK/2oaH22vBaz
         OS9SemI2W8p1eK5Q2UjJjI1cM+cq0mbuqQ4WrnHLU36A/kxNkNmCV3tyuPoyPZBd1w2k
         iBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6XTTZ+NrUCRZqrFnnPtlsztZjbXNjQi+1S8muccdxA=;
        b=h9C54kd/LyzQcKSc2xyUOexnr499yrVK4IcbHPktfVZdOP5SJlTnmUz5ytBcEpw9Tc
         EwL2E5oHV0qD9GIIS8F8xdgED7Xpu8kZnPJ/seeXPZTazPxp7h5STmdN+9YxHKST2ovZ
         LMHCzQB+G5ILKtPNM31y+rsfnVTbY2roM+x+Aglm2G57ka+4VeyePrff1gVX7Wj3nQ5g
         X38VB0pZIt5nzOmSLgsMQSDyVeuFdc6rl7dO2DezdW2msSmmkZ3b2FXejoG1GhohR7gN
         rgV9nV+lsMDD7vX4OYPcD0c4n523cXVtjBMc2z4ACN9u28PkOYL3lnFyRRyx2qVlQ4Kf
         mSIw==
X-Gm-Message-State: ANoB5pmeA3WTlin12yNSnhVyp7sELeR71ptzAR2pgYTSpubpuuiEa3SJ
        7Sk5tXyvzssldLiRXGN79KZSCAXJQskSAE2bDWU=
X-Google-Smtp-Source: AA0mqf4j6fW20N4xesW0H6NG6WMryM/u1qqJZYLZw+Z3OEo1lTUIRw0eBx2Ysd/L5rgwZtaeZuLGhKTEx0koqxtjKEk=
X-Received: by 2002:a54:408f:0:b0:359:33c2:e5d6 with SMTP id
 i15-20020a54408f000000b0035933c2e5d6mr1814033oii.174.1668612472997; Wed, 16
 Nov 2022 07:27:52 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac9:12a6:0:0:0:0:0 with HTTP; Wed, 16 Nov 2022 07:27:52
 -0800 (PST)
From:   Michelle Goodman <michellegoodman45@gmail.com>
Date:   Wed, 16 Nov 2022 15:27:52 +0000
Message-ID: <CA+PxuvUCGArVgjCvwDp4vp051pVMDF3wR32eBmJWLFEjMdm0Yg@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hallo, bitte Ihre dringende Antwort. Ich muss Ihnen etwas mitteilen
Vielen Dank
Michelle

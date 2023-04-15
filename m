Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA956E2DF3
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 02:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjDOAf0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 20:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjDOAfZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 20:35:25 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BA049F0
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 17:35:24 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id v18so2529660uak.8
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 17:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681518923; x=1684110923;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/krrOzf32PMDRBi/P9qe9m671OONK8NSr+9AstJjJkE=;
        b=UeveOeXC3l6PQ+dQ6hLbuiYAjupxszI95SMZTLGSLMzMS09bg6dr8QhRe/EGbQO5tV
         M0wxVLv0bBioJX/nULDsXQWE6gHbqJLRQaMjMFIo8qiW2vSz7K2tomatOlaU5OJ1KA4H
         B5n2080BLv1v1c52uBPvdIyRdIBjvrnWkDiDKEoCKGZJJC9yKu6208qujb2R6Zc2kqJL
         xH2yaWTmFCP9F361XcNlzAEbcDKwZoTGC0ajuquTkLsIqD2h93MGc0J08fr8yt+XjTS9
         iHfgc9IFQYUEdPz21dAsBmCqSkYHop0Oo5L1YPmv1jO8FGQj+Sz0YujJnraFLT1McrOq
         3N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681518923; x=1684110923;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/krrOzf32PMDRBi/P9qe9m671OONK8NSr+9AstJjJkE=;
        b=jRUkvVptvjCk3G+RlWMORzK6rRaWCNgb/gUog/XVVBvW7TE1aEqB0IARMaN62MXbl8
         1hdUujmbFipEk9JKkLSsrSWaA0A60G9w6ZC69xGCJZUkXoB+cFpLYd/2wdBzMyPWWh7o
         2IhAPXK6iONvBIIpMY5K3p9SfECs7iGXxyagWsn8WdQF5qrpLfYUJYKQ8bhk0VKNFdHM
         YW7qyDKwwp6xj0DPVO8XWFQl58xmjQx6YycN1h1aLKuVBRfLr7fngoXbe/3nN03oALQK
         lhHxf5fh8/7+CWclGmW80IZouFQwRpjcZ6+nE+zrtXfBb03P1N05XEkaJ3XtvvgEUTFn
         W6qg==
X-Gm-Message-State: AAQBX9cuGq9msDNYlepC21h+jo4O5lWHITzPU640UFW8pbobTnSO5YYH
        jzk8pQHubDJHZdGVZCocIg3MjaiVwIbWaIRQwfI=
X-Google-Smtp-Source: AKy350Yr9v9qsRGEik4WUTKqXRYcX7Mvb/763so0bPPAR8OXQCcwDpJ+AmlvzNaA1IsD91yW+8MGQ+pYU/2WsKrTlZ8=
X-Received: by 2002:a1f:2957:0:b0:440:380f:fc20 with SMTP id
 p84-20020a1f2957000000b00440380ffc20mr4159152vkp.0.1681518923054; Fri, 14 Apr
 2023 17:35:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:b601:0:b0:3aa:58cc:cf82 with HTTP; Fri, 14 Apr 2023
 17:35:22 -0700 (PDT)
Reply-To: avamedicinemed3@gmail.com
From:   Dr Ava Smith <abudumimi920@gmail.com>
Date:   Sat, 15 Apr 2023 02:35:22 +0200
Message-ID: <CAFNbOJShf0jFrbLQRBEE4rn_xhK7wT7tKkctDnVNR_m2bX9JZQ@mail.gmail.com>
Subject: From Dr Ava Smith from United States
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Hello Dear
My name is Dr Ava Smith,a medical doctor from United States.
I have Dual citizenship which is English and French.
I will share pictures and more details about me as soon as i get
a response from you
Thanks
Ava

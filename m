Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4A653C965
	for <lists+linux-media@lfdr.de>; Fri,  3 Jun 2022 13:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244046AbiFCLcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jun 2022 07:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244031AbiFCLcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jun 2022 07:32:43 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC06C656A
        for <linux-media@vger.kernel.org>; Fri,  3 Jun 2022 04:32:42 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id h5so10082304wrb.0
        for <linux-media@vger.kernel.org>; Fri, 03 Jun 2022 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=PaEzrm9U0WjJMxkE+zbw8yGRv0uhjcRl9sFl9vmbKpk=;
        b=RoFF+bPZgVy6sK5ZO1g327Z2caDzNmfUbo2o+OZ/2wFS3qP0SEoqf7CuduBAV+Omwz
         tpwgYxTskTdf4AWD0ucS9l//M0ADeLwUKzUx0rgjVGSv6Ujah74yGUXmnwpTrWTIQtUb
         18n1UJCoAAIOxMXOHrYaMfG88zzcU/JOCQWsEDni3Re6Ta5A8ORU8cmj2VuLFjehStHQ
         64C1XuMsvbOrxg/3KzFA8rB/sqCTsWEhNkEGSA1HhDoUiVhm4uQKMX5IpUB2OUen/c14
         ayTw/Cv6/g+BLQjOWJuwolyd/eYhwwjBejCmqsQF9Ow57vEoDe0gAu9plTWuWHrQGj2O
         o65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=PaEzrm9U0WjJMxkE+zbw8yGRv0uhjcRl9sFl9vmbKpk=;
        b=YmrlL3pXtsCAdP6NSadWBCjefj/oFHzIZnk/kU2XJFBfvAoSykr895/ORjaOrWLs8F
         d5UL0WwHYJXiQmqgYM3iAzxotijCvkPQaPYYzqvoeXsqiLhCkRD2taz5Jf/tfdngmxlV
         FGGllUbf871QDeL1dScCEjpQC3PgAG4TD5rP5ZG7YCJlUZ9yeljndperCYE4/PXiVgX1
         lax97OaykeAPa0nEGwHxwpv4HCRPQ/hMG3LwhABGbixhmb38fcwK2yfi5RZCL3jb0DHO
         8bH6k7sYMiBpmSK/V3dHUITRkP59KHWw8pzggFkl5yuzu60QRdGDJ5pn+m3RBZ/zvm6y
         03Hw==
X-Gm-Message-State: AOAM532S0/R159WQJHTQOn7t/XvYCwn3pdNCCERnpSubKeGHR8xjZLMA
        h7E4NOp3jRPDHCcu5yfdkxBskobC19Z/UdkrP8o=
X-Google-Smtp-Source: ABdhPJxXHcSucYElPSyQI3CTGkEzCfHhzn4ITGt/g9yxBWPlelWlJdVcC4beQtoGoEq0K74xXy5aZZtjgiYI+JHWkJc=
X-Received: by 2002:a05:6000:1815:b0:210:dd9:a9c2 with SMTP id
 m21-20020a056000181500b002100dd9a9c2mr7861882wrh.385.1654255961371; Fri, 03
 Jun 2022 04:32:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:64ed:0:0:0:0:0 with HTTP; Fri, 3 Jun 2022 04:32:40 -0700 (PDT)
Reply-To: markwillima00@gmail.com
From:   Mark <mariamabdul888@gmail.com>
Date:   Fri, 3 Jun 2022 04:32:40 -0700
Message-ID: <CAP9xyD1Oy2sKjbYY5Oa8kqhEfPjcvpuMmGaahZoeXcWsgesHHg@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Good day,

The HSBC Bank is a financial institution in United Kingdom. We
promotes long-term,sustainable and broad-based economic growth in
developing and emerging countries by providing financial support like
loans and investment to large, small and
medium-sized companies (SMEs) as well as fast-growing enterprises
which in turn helps to create secure and permanent jobs and reduce
poverty.

If you need fund to promotes your business, project(Project Funding),
Loan, planning, budgeting and expansion of your business(s) , do not
hesitate to indicate your interest as we are here to serve you better
by granting your request.


Thank you
Mr:Mark

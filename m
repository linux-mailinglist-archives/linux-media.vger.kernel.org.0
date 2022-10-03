Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 436B05F36DD
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 22:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiJCULv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 16:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJCULt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 16:11:49 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA9B2A739
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 13:11:48 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id ay9so7046672qtb.0
        for <linux-media@vger.kernel.org>; Mon, 03 Oct 2022 13:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ilithium.com; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=ajU1R+AKvjl88vJC2MMstQ9dgMuvQkJGxGyAY/oNp6M=;
        b=g8Znuc4k3b9r0ebGQlw4RJnJrgRlSEwSA4OOqk2dEuSw46RbmkbrsUtWfhZ29obRMN
         rItLFV4OhEN1oUQPFfYyF+uQybvK8WRYvEnyknnubAMxSnj4eDuTSXQRj8hkXW99qNb7
         LAImAdyF+//ihaIe/08bfcs1cMBF+AuOz6Ayk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=ajU1R+AKvjl88vJC2MMstQ9dgMuvQkJGxGyAY/oNp6M=;
        b=h/UZzo+eibGGcfiD3PY8pQoY6FCxO3afjR25KkUfDQnyO2hYEDubkFJzmfhk0keK+X
         kMaornq1sisvbpVde6Ouc+60nRPEKsYgCqJBAf5dj+GXvDUTO2CpWXHh52bp+9rOvC4A
         2awqnBvwk1N4vlqQGFghK5+aMe0y8fHPpIKnxZobFP3TCnLpfPoEBfvCdT7GT/vgoaFa
         2UBimn61Co/wbZmBFm2cH4YoG3597QE+fzG2pVorWYzsCr1YLqC9+FFWoktN6yt9KJYc
         pOrDW4wU/quqgN8dGYwPy3fbULMF3VXNP5ryJdOydHvhgBc6/44So3KfTH/8OuwlehPb
         XR/w==
X-Gm-Message-State: ACrzQf3A5WW3/gbGlevYdLYYDIP4jsJb1LWZc/atM1tIYtmI7UZ5oOza
        cNfFXuZrpqajwgI6uzSx76nn+RxPTU2yYPOJbl5PdIVlmhPX+Q==
X-Google-Smtp-Source: AMsMyM4ncdgedR7faro7AJHtUUthkWzo7B3WJgIV9ralnJSTcc32v9jfpP8QNVb6yLy43Mx7DTb5Eaq2Bh1d3cljRZA=
X-Received: by 2002:ac8:5a15:0:b0:35d:ef5:811a with SMTP id
 n21-20020ac85a15000000b0035d0ef5811amr16783547qta.667.1664827907363; Mon, 03
 Oct 2022 13:11:47 -0700 (PDT)
MIME-Version: 1.0
From:   Justin Finkelstein <justin@ilithium.com>
Date:   Mon, 3 Oct 2022 21:11:11 +0100
Message-ID: <CADKqcAL+hA6zsW3x1kNcy_-+QwsMfPJh_F4EmSU4UU5f+4TkhA@mail.gmail.com>
Subject: UK Freeview CSV to scannel list conversion
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all

I'd like to create a new scan file for my local transmitter based on
the CSV file provided by the UK Freeview team at:
https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BN2%205EL

When I look at the generated file at
https://git.linuxtv.org/dtv-scan-tables.git/tree/dvb-t/uk-WhitehawkHill,
the file says this was auto-generated from the above file.

I've spent some time looking for documentation on how this is done
(the README and Makefile seem to convert these to something else).

Can someone point me in the right direction?

I have a feeling I have missed something here.

Thanks,

Justin

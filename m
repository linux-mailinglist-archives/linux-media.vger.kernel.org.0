Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 069466457DA
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 11:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiLGK3r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 05:29:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiLGK3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 05:29:25 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02ECA209
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 02:28:25 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id a16so661451qtw.10
        for <linux-media@vger.kernel.org>; Wed, 07 Dec 2022 02:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8iVWWojAEnJj6pUA2sQB+wh6d4JleW9LhBEsWmIdw14=;
        b=irRYgaqldheQqnaMSw5jX8NMPOYp6Br4jQs1eFIp2V9F0iLvst2q2VQAoQppW0PBaL
         AS0Qui/9hOiR+3lP4hXIM8M3jBXnPTUexK0V3PtZo0Qcd5lBZ0wXOD0XDVSrPR9oNuxG
         mQxyi3X/M1JNZ7jHrgQGU7SCm8MExY2Mucrxycmcfgr7MZSjODBfnmnUDugqYmOqvkRZ
         sPjVVVxtKKWBecVxvLOBCRGDwFRDGDWtigS/ong2GG7LbEM58dd1V7KvBwZq5uK2n+GL
         DoHKmcqUQe7VDOuP+fJ2n8FL2cAnz0c7t3K7iKvex/CAye3U/AXg5YvCJ7gpxr7TsyJ/
         UeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8iVWWojAEnJj6pUA2sQB+wh6d4JleW9LhBEsWmIdw14=;
        b=Mqm1b5mLGPFjGpYBjyjFKIp6daubRGP+uBVe+QWR+P2ejOPy4qsSmdyiuDaaQKZpB6
         /01i1TwJspYbXGp3fu4/t5tbkyaOvprBOCwq138FqRjjijt3IytSGFUkrWp8z1ZGX5Sp
         zwkIFFoAn9zkmlhsEEA4Y8UzTegoVMRJmjjg+3fNoFAKNg1gSwgzLnIo86dBnYQJuU2S
         sgIgCbUCmXO6cAZyKw4d9KxfAarnuGc3fp2h0CEKBqv9J8SAv+QvM0blfNFl4Ly9n9AM
         qH/4+3JDo6bI+ZLlDqQA+PZZXzAuml8BGdZ68Zq3iTW1wc1MUQtdkNgKIkUGedozLX0S
         tLJw==
X-Gm-Message-State: ANoB5plhLHTKmZHsrUZZUrwN/b5aJ2u5GRjuk0Sr02jqD9nsR7p3iiP4
        Zj/crOmnWSQ26XvjyVB5A7pju0WI+AO/2r52FA==
X-Google-Smtp-Source: AA0mqf5SYMKd8nG8yHcU0jEE0DXQrln+iwkPzSaUTim9NhxS4AC7/icC56EeOoMD+5wNjyxYVlAC7qOnW5FHEc2DENA=
X-Received: by 2002:ac8:1090:0:b0:3a5:6047:c75b with SMTP id
 a16-20020ac81090000000b003a56047c75bmr65592529qtj.60.1670408903967; Wed, 07
 Dec 2022 02:28:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:622a:2d2:b0:3a7:e999:f914 with HTTP; Wed, 7 Dec 2022
 02:28:23 -0800 (PST)
Reply-To: michellegoodman035@gmail.com
From:   Michelle Goodman <michellegoodman035@gmail.com>
Date:   Wed, 7 Dec 2022 10:28:23 +0000
Message-ID: <CAPJ5U19TjcK+dFCNDUwWHfTD1-_TJwQPXJZ98qME4qLxwLP=3Q@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hallo! Lernen wir uns kennen?
Vielen Dank
Michelle

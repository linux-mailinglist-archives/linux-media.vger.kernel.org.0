Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B44E2A21F4
	for <lists+linux-media@lfdr.de>; Sun,  1 Nov 2020 22:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbgKAVvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 16:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbgKAVvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Nov 2020 16:51:04 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1998AC0617A6
        for <linux-media@vger.kernel.org>; Sun,  1 Nov 2020 13:51:04 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id k3so16123568ejj.10
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2020 13:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=xdCvY3rAYWEBjRWUr94YsfH9blT0ELUSmtW1Ibq9Ggk=;
        b=ISFHLY1DsfCsYmCGqC/1MMYpZPA6Lyd+LkG9YFq07UbIMW0IujUlrOuNyME3MjlE5B
         lTC1Zlj0SCTnJnwW/J3PlvQrdsVHlLHzQh7ufcv3BnwcRA27KEyO4WYP961BNftjHvNk
         ho1cESBtT0QkOqoYBYrXfVPX6J9sfnN66UnjWlL8/32omR/erOyWE/X4Uhvdiqc0oobr
         UbvrbsOSKns6v51D5Lz0QBJcmPSLEEZZJAC968jcPQdZZvC42DTFDDAivEslhR3zYkOa
         kfPEiOrrvULz1BcbKAQmKUTagcUAsktOnDwxcj15Lk7XkglfhHVaQ0wD/p/+e8qkgiHW
         HISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=xdCvY3rAYWEBjRWUr94YsfH9blT0ELUSmtW1Ibq9Ggk=;
        b=ZqUWd1yeY9NyvmInmA/3urZ120dFTgSVoJWodaR4poCMmAQNtTJM5hyqeEGINwa5CE
         0UgOs8y/TIcoNCw6ijbv8ofLAiThXp0+FsysU2jMYHNmTAzJ5Dqf8i98wpgvGFA6fsjf
         xnEK9DvjzcfDIdzoTOyb0epQpam7VkA4zTEL7MSjaHBxMfvaGiivHaB0VKfnB5L4BobM
         AAxL29HM0mAPS2Q0EUNb6si2XVQpwaa5FdJUX7yvOb1OutJyECyFIJ/id/s4jWOjiPXZ
         UQ5YUePQsB1FeNwxHh029aC+BMXFSTtFJDvo5b277dWEowKPps1eWZKkmva4ZOaOSodc
         y0gw==
X-Gm-Message-State: AOAM531qm/q5oyfgfEvTB6lzjW9V9CRIjRrpZeOefkt1iuNDc157HTn0
        m3MjMHsBN+Y6TAwkxgF6tK7u9AEY11I=
X-Google-Smtp-Source: ABdhPJwq9Z1vMujbkxhU2aZPx2yisoxz+73EfjmD+PsTtqGfu/sghbdR/3BFi9mkk1h983J9uT5X8A==
X-Received: by 2002:a17:906:1a57:: with SMTP id j23mr12975193ejf.291.1604267462589;
        Sun, 01 Nov 2020 13:51:02 -0800 (PST)
Received: from [192.168.0.100] (dynamic-077-010-176-052.77.10.pool.telefonica.de. [77.10.176.52])
        by smtp.gmail.com with ESMTPSA id s15sm5378370edj.75.2020.11.01.13.51.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2020 13:51:01 -0800 (PST)
To:     linux-media@vger.kernel.org
From:   "filip.mutterer@gmail.com" <filip.mutterer@gmail.com>
Subject: Linux Mint 20
Message-ID: <0c9ca3ce-f08c-984e-5be3-f748720de009@gmail.com>
Date:   Sun, 1 Nov 2020 22:51:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi there,

I had the following error, which was easy to solve on Linux Mint 20:

Checking if the needed tools for Linux Mint 20 are available
ERROR: please install "Proc::ProcessTable", otherwise, build won't work.
I don't know distro Linux Mint 20. So, I can't provide you a hint with 
the package names.
Be welcome to contribute with a patch for media-build, by submitting a 
distro-specific hint
to linux-media@vger.kernel.org
Build can't procceed as 1 dependency is missing at ./build line 276.

Here is what I installed to have it compile:

sudo cpan Proc::ProcessTable

Greetings

filip


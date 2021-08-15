Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00EDD3EC6A6
	for <lists+linux-media@lfdr.de>; Sun, 15 Aug 2021 03:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234385AbhHOBeH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Aug 2021 21:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhHOBeH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Aug 2021 21:34:07 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26816C061764;
        Sat, 14 Aug 2021 18:33:38 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso7803248pjh.5;
        Sat, 14 Aug 2021 18:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1EeySskwO3yUJbu0dTi3++bDv7n7jGo4CAMzCEMyuPQ=;
        b=Ib3p1DQ+i0JKU3HeUgbJ3rwbNQARmLx2bKw1z9Iro4hgqYeC6u8ixe0CPfTvMdtJGB
         eWiUB+5j+ZfkvkB/h11WwvwQYymTiDnX1cnl1J0mD7kmqEj6QCZMWwqPxMxIKa9ytHTu
         lIcVi2sb42uRgDAGKg74av68Sby9A4rfhUweLf8lamU0yNxGEgMui3a9BeR8sZs1JnQT
         +itwTiOB0ScHTbJlQPc7A/TTjOxkxInxmJ3R7HzBasw/J+Tn3CbIQrTboAa5oWsgYq41
         exRt4Dl2ewN9Oc806g218HH6ySwXRXx5eAv1liJyYcLr1C8nV7bKABFs0bM7/TxIEDdD
         J8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1EeySskwO3yUJbu0dTi3++bDv7n7jGo4CAMzCEMyuPQ=;
        b=k+7CsevkzAvGE0CMLwDjhBetxc3sioc1d9lDzDdMFfVWyYJo8cCWtE440OEQDywFPF
         KDW9apRdkC5nxu2wU2TQ2K2xAHUqJ2tXav2IDPMe+CbT3xye7yP2oIXpiDwWeKpg0H/J
         N4IU2T0/8WTobsNxznC2lP0KCx2ic8BxemiEdQZv2SU51oB+U2G640rJ2c8kJP5tnSN7
         D/vBPMTHcQsINvBYZ0k/SgXW5C1WtBA8GhywsbyFyJWkJ4FtL9msDm3NkBdpMrhukdx2
         /MWWZjgipYGTOFkmljBT1PnFPoS2hi5ow3087xxS1ot4D9H8nT/ONCY+J1tIQZ5xddPA
         rMdw==
X-Gm-Message-State: AOAM532sUjlihF1sGfS+gkNLPAS5zIJfnx0OVXj1g5bFPbnuPW50sc+y
        kcrrgeNJ76vMFD5Axd3aq0s=
X-Google-Smtp-Source: ABdhPJydX6mMbMSdFL3vauiu2ZzK80Wlyoa/s9B4tPmcTFsLqbAgOZY36NRTTVtZ1ap+YWiGa7QgOw==
X-Received: by 2002:a17:90a:f696:: with SMTP id cl22mr9366361pjb.23.1628991217707;
        Sat, 14 Aug 2021 18:33:37 -0700 (PDT)
Received: from [192.168.3.4] (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.gmail.com with ESMTPSA id e12sm6533717pfc.214.2021.08.14.18.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Aug 2021 18:33:37 -0700 (PDT)
Subject: Re: [PATCH v2] media: pt3: Switch to using functions pcim_* and
 devm_*
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Evgeny Novikov <novikov@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kirill Shilimanov <kirill.shilimanov@huawei.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ldv-project@linuxtesting.org
References: <20210814155742.11392-1-novikov@ispras.ru>
 <CAHp75Vdgt=HAK6Cd886AQ+BK-HAJjq0aqf_gkdcpefW5UMBnXg@mail.gmail.com>
From:   Akihiro TSUKADA <tskd08@gmail.com>
Message-ID: <ee21588e-67f7-73bf-b533-f1eb7ad2c265@gmail.com>
Date:   Sun, 15 Aug 2021 10:33:28 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vdgt=HAK6Cd886AQ+BK-HAJjq0aqf_gkdcpefW5UMBnXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have the device,
but currently I have some hardware problems in my testing environment.
I will test it later when I have a time and fix those problems.

regards,
Akihiro Tsukada

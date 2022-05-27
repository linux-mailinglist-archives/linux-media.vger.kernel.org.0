Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65E495362F5
	for <lists+linux-media@lfdr.de>; Fri, 27 May 2022 14:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349582AbiE0Mp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 May 2022 08:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351041AbiE0Mpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 May 2022 08:45:41 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1E195AA
        for <linux-media@vger.kernel.org>; Fri, 27 May 2022 05:44:45 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id 255C91F46072
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1653655484;
        bh=2iR4pLutdays/ng9dl/DinzlvxujRkGf8duk/VwT014=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=bRx1YNkKDy+aI7rOHNB/rLf9g9vIqbmfWho3NrZ5VTSh84BBzGo6X+PB1RJekpKvV
         +0KLuaDFhbwrOoWMlicXq0doa/q7dF7CRwYMAhvxnJqlZALeDz1d3H/dbMvu2Ab/Um
         UdaJysjL6bOGQDjD0nXYMKD1HtUgD1g++UroZOMRj5SfA/c6GaaCuucVoEdOSl5OlB
         l/t+TSAiAhyQN0yfrPCQTbjoRCQdNUcv0FSz6wIeU1NHSQQyStcJv/3jrABSlBknFr
         2JNX8hsXBkXQEhcF3XSNHkJLQ0cF+Uj5ByaQQ4RONsR9ft3cZ7pO5t31VPw2FsRYNl
         /sGq/N+un/dmw==
Message-ID: <32c8da3e-e385-d43c-8561-50642f6eee4c@collabora.com>
Date:   Fri, 27 May 2022 15:44:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 14/22] dma-buf: Introduce new locking convention
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Gert Wollny <gert.wollny@collabora.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Daniel Stone <daniel@fooishbar.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Rob Clark <robdclark@gmail.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Qiang Yu <yuq825@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org
References: <20220526235040.678984-15-dmitry.osipenko@collabora.com>
 <202205271042.1WRbRP1r-lkp@intel.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <202205271042.1WRbRP1r-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/27/22 05:37, kernel test robot wrote:
>>> drivers/dma-buf/dma-buf.c:1339:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
>                    return ret;
>                           ^~~
>    drivers/dma-buf/dma-buf.c:1331:9: note: initialize the variable 'ret' to silence this warning
>            int ret;
>                   ^
>                    = 0
>    1 warning generated.

Interestingly, GCC doesn't detect this problem and it's a valid warning.
I'll correct it in v7.

-- 
Best regards,
Dmitry

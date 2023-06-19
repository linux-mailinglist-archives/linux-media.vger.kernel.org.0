Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF0D73576D
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 14:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjFSM4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 08:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjFSM4t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 08:56:49 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 94512F4;
        Mon, 19 Jun 2023 05:56:47 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.31:42874.204276263
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
        by 189.cn (HERMES) with SMTP id D6679100138;
        Mon, 19 Jun 2023 20:56:45 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-75648544bd-xp9j7 with ESMTP id f558e96cf797417b93a055f00ac0a96e for chenhuacai@kernel.org;
        Mon, 19 Jun 2023 20:56:46 CST
X-Transaction-ID: f558e96cf797417b93a055f00ac0a96e
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <2a64225d-9c8a-d237-8038-aa7b1c31b5b9@189.cn>
Date:   Mon, 19 Jun 2023 20:56:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v15 1/2] drm: Add kms driver for loongson display
 controller
To:     Huacai Chen <chenhuacai@kernel.org>,
        Sui Jingfeng <suijingfeng@loongson.cn>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        loongson-kernel@lists.loongnix.cn, inux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Nathan Chancellor <nathan@kernel.org>,
        Liu Peibao <liupeibao@loongson.cn>, linux-media@vger.kernel.org
References: <20230615143613.1236245-1-15330273260@189.cn>
 <20230615143613.1236245-2-15330273260@189.cn>
 <CAAhV-H704swbRxsZoJN5ef3X41n9Vw-js_73tptK3cAjCWP6tQ@mail.gmail.com>
 <f1f24be6-20c6-03de-a4a7-4ad874b8a0f5@loongson.cn>
 <CAAhV-H5_B5g5tkv29z2bPBeiuR-gaBgRMFPSmOp1U+bqrOGQPA@mail.gmail.com>
Content-Language: en-US
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <CAAhV-H5_B5g5tkv29z2bPBeiuR-gaBgRMFPSmOp1U+bqrOGQPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2023/6/19 18:19, Huacai Chen wrote:
>> Hi,
>>
>>
>> On 2023/6/19 17:18, Huacai Chen wrote:
>>> This patch is too large to review, lsdc_benchmark.c, lsdc_benchmark.h
>>> and their call sites can be split to a separate patch.
>> Better not, large is not a problem.
> My review was rejected by the maillist, this is a very big problem.
>
I don't know what is the reason, nor am I do it.


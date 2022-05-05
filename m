Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC40F51BB83
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 11:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245698AbiEEJOF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 05:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242230AbiEEJOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 05:14:03 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653611034
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 02:10:17 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d5so5211629wrb.6
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yXY25yzY74R5AlW6TqRTa5x2Aq6bpcDlDzz9Lf5P5B4=;
        b=gVlgA66SdjyS+sVTtrXzmb5V0sVyPgNAE0Ap9yV3bAlm8zGQCL6BWFEDmJ3VsQrdI9
         y+rkS6vjha0VHwfx2PiyGiQZEEhXY8Ss+JyVdzKxmf9We+HmdZfV44bWsaMCfQUJvY4d
         3nMAE+lC66Wkz2sOLYWhj2K9HQ0YIKaICrPQW9rJIL/donN1detqIEFtoUBdtKNsGLiq
         3b8JL9xQx5pY9zAe+rPJgeOjfZG1Up7B41heLci8yzQs2drbNGN3ETqXZCpHH7GZRs7K
         V7mRuVNCBUu3KR8a6ovCULqOuzgGbHLPOmbOf1ZWpZHi+mvNhnJCaz5Ha02JwglFlwMk
         aR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yXY25yzY74R5AlW6TqRTa5x2Aq6bpcDlDzz9Lf5P5B4=;
        b=oIIqfRBdaTwqrzFqBHfKCDfyNmkpJgScOfAQTP8rEpB9sFB+RI3nkJuwl3nDjjwmNj
         btquRW98k2asp+kKOhj6atAfP5AZuQAseSSwfV7WvkU2hxXqX9KU5XUt+tY11u44O+BT
         6UCYyRBOk7xYlpndMIPTtuWSg5je9OjRd+uXw7F2bUSEnpzwqKPj1s1d7KPYFOLa9T2H
         UAYf0kgVMiL3OKB7c8lBrFaXBSjHa/AqkNVqeUZO0JoQigWVA7r4Nvr/1r6YWI9mep2Z
         qdj3nLx56mz9sOgQWrvbpTbd0HU+yYvaeylk4KKdDuyGV9+uZ9pPxMb8E0ee/dm6d+/1
         fNmg==
X-Gm-Message-State: AOAM531w1lgrS90Fwj9L506/xIpwN1/ORw33dMg+C/w0hXXt8Xrnph3e
        1KOFL65QV9SkQrsJaHdxw9jlEINjzRI=
X-Google-Smtp-Source: ABdhPJwNQ/tbfb9NFkMdKriDiU27P0xmJyAH+hsNA+GxeqmaKWkSYws3fdls0GETDXswkjSfVbemNA==
X-Received: by 2002:a5d:6a85:0:b0:20a:d938:3879 with SMTP id s5-20020a5d6a85000000b0020ad9383879mr19694757wru.462.1651741816023;
        Thu, 05 May 2022 02:10:16 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id d10-20020adffd8a000000b0020c5253d925sm753059wrr.113.2022.05.05.02.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 02:10:15 -0700 (PDT)
Message-ID: <df0cd412-30af-af7b-e693-d0a89109e3e5@gmail.com>
Date:   Thu, 5 May 2022 10:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 15/15] media: i2c: Add vblank control to ov7251 driver
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     kernel test robot <lkp@intel.com>, linux-media@vger.kernel.org,
        kbuild-all@lists.01.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, andriy.shevchenko@linux.intel.com,
        hverkuil-cisco@xs4all.nl
References: <20220504223027.3480287-16-djrscally@gmail.com>
 <202205050844.k1CPWqtV-lkp@intel.com>
 <0ae34349-f4c0-4388-b33f-73603ab464ce@gmail.com>
 <YnOLueXnmsm9ig4B@valkosipuli.retiisi.eu>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <YnOLueXnmsm9ig4B@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 05/05/2022 09:32, Sakari Ailus wrote:
> On Thu, May 05, 2022 at 09:04:32AM +0100, Daniel Scally wrote:
>> Argh - I screwed up a rebase here, not sure how I missed that. Sorry
>> all, let me resend
> If it's just that, I can fix it. No need to resend.
>
Thanks...there's two problems shown though actually, I used 1 instead of
vblank_def in the __v4l2_ctrl_modify_range() call in
ov7251_set_format(), and the other problem
(ov7251_pll1_cfg_24_mhz_319_2_mhz defined but not used) was actually
introduced in patch #7 (media: i2c: Add support for new frequencies to
ov7251). This change:


|static const struct ov7251_pll_cfgs ov7251_pll_cfgs_24_mhz = { .pll2 =
&ov7251_pll2_cfg_24_mhz, .pll1 = { [OV7251_LINK_FREQ_240_MHZ] =
&ov7251_pll1_cfg_24_mhz_240_mhz, + [OV7251_LINK_FREQ_319_2_MHZ] =
&ov7251_pll1_cfg_19_2_mhz_319_2_mhz, }, }; Should have referred to |ov7251_pll1_cfg_24_mhz_319_2_mhz. I can fix them, but it wouldn't be until tonight (sorry, I expected to have this ready much earlier by the end of the weekend!)
||



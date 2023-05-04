Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992EF6F64EC
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 08:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjEDGZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 02:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjEDGZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 02:25:40 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FBF2723
        for <linux-media@vger.kernel.org>; Wed,  3 May 2023 23:25:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-2fe3fb8e25fso4000139f8f.0
        for <linux-media@vger.kernel.org>; Wed, 03 May 2023 23:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683181531; x=1685773531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8E+OUyIuOq17PnBlodI5Gz9CxgDSpediJ2DjgpXvs6I=;
        b=Z9BJIWypqkU6tsYzQR1CfpzR6Db6UerKxgmrDzpuIsOEMjU49NJUQxuKSJMiquxAqM
         AgmXkBF0wzl/WRhPlh+ZnW7dcHoPQZYtJ67Lg+XwuIrXWzkzvb+k2C6MghCPHLI8TcdD
         LkxYGA/xs8RW+twIm7BW91ovijQJSEhBo6TD7aB5HtJOQOJ9FVEyQVpkSyYqxdTUkzMO
         ADwqtvTvTCM+18Rp32dnm9sv9LPS0wD1wNCxGSdNCZlKqlXeF1m7Ssmo86T1cFPILvPK
         8NbP1EJ/MQwMhyRr/9xJDZPsGrxtD0+cAVs9/JOmRng/fKxy7UGACBJLEfmn9hkf5iCL
         m8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683181531; x=1685773531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8E+OUyIuOq17PnBlodI5Gz9CxgDSpediJ2DjgpXvs6I=;
        b=eb1dXCrTS4sjXJ+YiOTBn0odvWqS/UbL2w7+WJFERdLPViTzgQeGtXlJ+J0L6JeFNb
         RAAh8EccEbBPJKx53z9Ngk3VV/OJnOYACnrz/VgFlfT1GUDUgjHk/vvddIeD0nfC3yqO
         e5xwAHJZX6eHkkgMppNRSkRa6tXQcuA/sD589Srg4vVhkHrENpe5LhuIXy8UJSBLVYcd
         XiVYHUiJqnzgVAhvLOk76ZZqYiRo8cc7FFZG3kScf0cO4y10yfSF5xakPybktOwJRrlf
         kt7osGQinxvjRn9so796nzViynf2XiXHkHQzhY7mHOokG2EwWJ8Cc/LcOU19ME+IYLkj
         /30A==
X-Gm-Message-State: AC+VfDwfPSM8izrYgAKkcTM86M158xv7OEbtiW4ljIs51cv4fWMZ7C8I
        8RDpGhLfpn9pZdYTsP8tncwXScOCnGAc3g==
X-Google-Smtp-Source: ACHHUZ6oS/GR3yd2WNC9ZAm1EPi0fmoOKLV/7lsKzVO4d/auAcU8ZgGndaFmSJFtcf1IAKIeREqyFA==
X-Received: by 2002:a5d:460f:0:b0:306:2638:fa6c with SMTP id t15-20020a5d460f000000b003062638fa6cmr1504536wrq.33.1683181531419;
        Wed, 03 May 2023 23:25:31 -0700 (PDT)
Received: from [10.228.213.47] ([94.135.112.238])
        by smtp.gmail.com with ESMTPSA id u6-20020adff886000000b002f28de9f73bsm35676675wrp.55.2023.05.03.23.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 23:25:30 -0700 (PDT)
Message-ID: <e85004bc-61a1-d86c-1da0-3e2d8bb609d1@googlemail.com>
Date:   Thu, 4 May 2023 08:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: v4l-utils 1.24.0 has been released
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sean Young <sean@mess.org>, Hans de Goede <hdegoede@redhat.com>
References: <86f5a2f0-0714-6648-eed2-cd4f11209dd5@googlemail.com>
 <20230321222126.2490de9b@coco.lan>
From:   Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <20230321222126.2490de9b@coco.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro and list

On 21.03.23 22:21, Mauro Carvalho Chehab wrote:
> Gregor Jasny <gjasny@googlemail.com> escreveu:
>> I'm happy to announce that v4l-utils 1.24.0 has been released. This will
>> be the last version before the build system will be migrated from
>> Autotools to Meson.
>>

> I wouldn't mind if we would have a shorter release time for version
> 1.26 - or maybe it is time to increase major, so version 2.0.
> 
> As we are now using a new building system, it would be nice to have
> a stable version frozen, with not much other changes, in order
> to allow distros to opt either to use version 1.24 with autotools
> or to migrate to the newest version, with meson, but not many other
> changes.
> 
> So, perhaps we should aim release a new version in 2 months or
> so, once we have enough time to do cleanups if needed and having
> media maintainers and developers familiar with the new way.

It looks like the dust after the meson migration has been settled. When 
would be a good time for a new v4l-utils release? I'm available this 
weekend or the upcoming ones.

Is there anything you'd like to land in the mainline branch prior to a 
new release?

Thanks,
Gregor

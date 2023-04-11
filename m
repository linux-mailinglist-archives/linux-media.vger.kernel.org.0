Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 951C46DD371
	for <lists+linux-media@lfdr.de>; Tue, 11 Apr 2023 08:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjDKGw4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Apr 2023 02:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbjDKGwn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Apr 2023 02:52:43 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4751240D0
        for <linux-media@vger.kernel.org>; Mon, 10 Apr 2023 23:52:10 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-246a1c48021so267176a91.3
        for <linux-media@vger.kernel.org>; Mon, 10 Apr 2023 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681195901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KlxuVrTXd7ERz588z7U+eZpNrX8JYOeBVv8I4S7vc10=;
        b=FToH5sNIXgA98Z2/xnoL6eiMqcGn+g4OwC5NmpIX47R/Wh24/AVqhSttBiaHjxcwi9
         Wd/lHvrVCQNYeZjeEEiMOq4pv7l01a6iR9yVvKp3GaHe2moQP2DZuGkYizqbv5iv4jJp
         admwOSz07PguwdAu82mL6e5HZ1Rlj4dKINciI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681195901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlxuVrTXd7ERz588z7U+eZpNrX8JYOeBVv8I4S7vc10=;
        b=OWHxvwrhoBt6fL1Hnn8kLA/JGdIjT8LDewWBdRIqVKw4IbDVG0dPPxZHz2LQoi/AqZ
         tOHwCNYZTvcIAit3mjTf7KxubEuCSl0DnR4Lh5DiKGt89sJTb8nwDoYNYZm3waWHV1CE
         IrOYj7zROysv/k84LV0Kfc+td6wMZSG/NAgT5CdyMACQD99MrBACHjItA8H8RDpyNvLv
         bWYm5RCzUT6jN3m85tVX4UUfIELmB/c2TxiTfwDDHJr0aR5Z8xcroWi71tmPXeQNf59x
         1FLfHbQF/vIJNYA5omUnnJ/BPNo3stNUJ+sS4UKNFHhiYtbEHnvgSWwqUir4N/4IJffy
         vfBw==
X-Gm-Message-State: AAQBX9e0c06JUzKcMRJEW8Zs+wPSiYoWeC1/Rt8L3Hm/wgwOExGxVNcQ
        i4z8iVsOBblTqP8a9AsXOkC+vg==
X-Google-Smtp-Source: AKy350YQEUV5pUQHBKD8Dgh+Enk+75ndcS0fIIDWKAs5lTVZqtNqneAeD13tp5iU4Z9oxI6dTOybWQ==
X-Received: by 2002:aa7:9e88:0:b0:637:703e:533b with SMTP id p8-20020aa79e88000000b00637703e533bmr6921141pfq.4.1681195900883;
        Mon, 10 Apr 2023 23:51:40 -0700 (PDT)
Received: from ?IPV6:2401:fa00:8f:203:44a9:ac98:7606:2cd0? ([2401:fa00:8f:203:44a9:ac98:7606:2cd0])
        by smtp.gmail.com with ESMTPSA id i16-20020aa78d90000000b0062e00158bf4sm8968739pfr.208.2023.04.10.23.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 23:51:40 -0700 (PDT)
Message-ID: <6aafad18-13a2-ef45-48a1-1f094554af31@chromium.org>
Date:   Tue, 11 Apr 2023 15:51:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] media: vivid: Add webcam parameter for (un)limited
 bandwidth
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Yunke Cao <yunkec@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <20230410063356.3894767-1-mstaudt@chromium.org>
 <20230410102350.382f7d02@sal.lan>
From:   Max Staudt <mstaudt@chromium.org>
In-Reply-To: <20230410102350.382f7d02@sal.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you Mauro for having a first look!

Questions below.


On 4/10/23 18:23, Mauro Carvalho Chehab wrote:
> IMO, instead of a parameter that just enables/disables the bandwidth
> limit, the best would be to have a parameter specifying the bandwidth
> (with 0 meaning unlimited).
> 
> If not used, vivid would initialize it to dev->webcam_bandwidth_limit,
> so a read operation will show the current limit.
Up until now, the bandwidth limit is a rather arbitrary reduction of two 
interval sizes per frame size.

How would you prefer to define a limited bandwidth in this parameter? 
How would it affect the simulated camera, do you have a suggestion for a 
formula from bandwidth to frame/interval sizes offered?


>> +/* Default: limited webcam bandwidth */
>> +static bool webcam_bandwidth_limit[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = true };
>> +module_param_array(webcam_bandwidth_limit, bool, NULL, 0444);
> 
> I would also use 0666, to allow changing this on runtime.

I guess that's possible, though it would add complexity.

Currently we can ask for two instances, each with a different setting:

   n_devs=2 webcam_bandwidth_limit=1,0

This creates /dev/video0 which is limited, and /dev/video4 which is 
unlimited.

Maybe this already sufficiently covers the case you are looking for, and 
we can keep the complexity low? A real webcam won't suddenly offer new 
frame rates either...



Max


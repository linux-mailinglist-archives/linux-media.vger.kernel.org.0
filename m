Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF2D669FD91
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 22:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbjBVVMy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 16:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjBVVMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 16:12:53 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C6D3587
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 13:12:52 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id cq23so35571586edb.1
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 13:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtWMs5XicKBbd28mRp0nsSVSQLEnVN0dO/tE8e71Cow=;
        b=K7PmYPND3qpuyc6rPovvNrJPxDboyQkK7ZRf9z7bspPaASHQJe13cdu1sFMiPHEcCe
         oQNkY6iW0U8F7nhc2GkSGjkwMvNki3lw9oKvC0cUf8XHLd5yT3aDLEPoSHaoiNQUey5S
         +5cLujZttS7qAzFTWDiiV6KGuW5/B/+p+0uRDgDipc022TAGYoKCTnh5eAD4Amirjt53
         mwbUUFHMYfjSaw3177a8/oM5e0kfrKbvMNG1YNfu3Ls6vMv2HcgqkbZkVRvzeGI2nlek
         EzANZKW/My8eJ/wrx6EniZiawx8bLh/iFP5/B6ASrdrenIYUT6aG4CTwqFqvCMLkQam1
         acJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtWMs5XicKBbd28mRp0nsSVSQLEnVN0dO/tE8e71Cow=;
        b=kxu9LtTg1v41awbQTWz7jl1kAn6kalMh9M4ERrkJk9WNmi6Q1pV8KwCW7NOxkvQW+z
         QkLzJhuY4j/j7o6eGn8Z5t0ANz2z2FLj/gPYny4RvtqWSO6rG2sXCvPDj6wRGwIM5rv/
         txkN42WVUTLJ0FPO5qdqohjHOzcXy2OFTXQ6yiyzdLEIGwf9zVeVcPxovJpkuTlEQUo3
         M2e3/6GThqWi0xQSL1vhoCblHSMMgrh/JHiaFefjV5+Kc1bUYb4T6XD2IZ2MLy9fwFpd
         wm7kCIh2Zs6BebU838NErSatP7XvX2DPvKQS5LjBJdHGN6N68BD0hEMmqQHAN1IU3wUK
         C4ug==
X-Gm-Message-State: AO0yUKUiUk105/LrmLi5eD2mJLeS7nDC5Fp6r+9HTQEO0RAXogxgdWBj
        aTby7JVIZzJkxOgfeuW9vLA=
X-Google-Smtp-Source: AK7set/yYumOvAeJsBgRuVv/UCOkHNhtE8/K30saPpBDeT7RWJniG2FRETyINM1qJDD7tHjXT8xKVw==
X-Received: by 2002:a17:906:4a12:b0:8a9:e031:c4b7 with SMTP id w18-20020a1709064a1200b008a9e031c4b7mr18032126eju.4.1677100370702;
        Wed, 22 Feb 2023 13:12:50 -0800 (PST)
Received: from [192.168.0.54] (ip5f5a5b70.dynamic.kabel-deutschland.de. [95.90.91.112])
        by smtp.gmail.com with ESMTPSA id t24-20020a1709066bd800b008c6c47f59c1sm5611479ejs.48.2023.02.22.13.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 13:12:50 -0800 (PST)
Message-ID: <02bb5abc-a796-25e7-d150-1204a3d180c6@googlemail.com>
Date:   Wed, 22 Feb 2023 22:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [v4l-utils] [PATCH v9 3/7] Add support for meson building
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, sean@mess.org,
        user.vdr@gmail.com, xavier.claessens@collabora.com,
        deborah.brouwer@collabora.com, ariel@vanguardiasur.com.ar,
        ezequiel@vanguardiasur.com.ar, tomi.valkeinen@ideasonboard.com
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221143204.26591-4-laurent.pinchart@ideasonboard.com>
 <0da1d7df-5ba5-c6ce-afa0-3450ea3e8ed3@xs4all.nl>
 <Y/Tab2i9eA+wcoF2@pendragon.ideasonboard.com>
 <e890fca0-a706-a43d-83ed-80c1f59b1182@googlemail.com>
 <301df538-0f0b-1827-7eaa-e4963475aa5d@xs4all.nl>
From:   Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <301df538-0f0b-1827-7eaa-e4963475aa5d@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22.02.23 20:50, Hans Verkuil wrote:
> I merged 4 of the 5 patches from Deb, let's wait if a v2 of that last patch can be done quickly.

Sure I'll wait until the patch got merged.

Thanks,
Gregor

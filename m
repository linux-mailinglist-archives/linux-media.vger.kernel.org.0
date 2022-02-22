Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3C0F4BFC3A
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 16:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbiBVPRl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 10:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbiBVPRi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 10:17:38 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F4AA8ED5
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 07:17:05 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id 195so10314295iou.0
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 07:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iZKZdn3ydrCSgMZ1bBdm8dbVbQcMbyKYjm/XUu2OHfQ=;
        b=HnnCuFq6d65V1EKIwgcPcWRiqtMdt8keOl7w+gBBumevV0JHVm74BhKdmVnBaQooY5
         qBneYQTyduKaQXsDXRcu4U00EmcTE+Bvw1iHUO5YyMX2tyVtq+vFL8RhSQhTywtjrwt9
         IIEwJLRs6Zby2sX1ejoUDrEAKBthx7bmKT8qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iZKZdn3ydrCSgMZ1bBdm8dbVbQcMbyKYjm/XUu2OHfQ=;
        b=M0bDt2x1zyoTgkUJsT7tH2wHGW/G7fCIpVvrOyVGSFrH6Hiou7D3/MfT5REwcg0oYr
         tNK4GFzrv1ut4c0fJ8JRY3XT56Qoz4QDu/up3IDIsRj8gFGtYYZDhrDuUx6w8zldRReZ
         6fF0fiv4K8xzYeZXxwoqCOzou1rKLnbm8sYcTtQmSaNNnUUzEelonK9VfTtacwhQBwnA
         0pVWv0wHm21pamg10dWKjrlgZQLbegrmzJ+aANGcOF/BBYnp2NkU6Gr2RZNaXDro4gLt
         hQ2p4o5FBm6v7xgNhvUnTIU4kNA44jpsr4YUo+NPxHJVn24up8uAi2nP+PQ+KlIVpjqG
         Tu1g==
X-Gm-Message-State: AOAM530JQVWh3Ur+5OlBz2DDJnC9QgQXPQQ2KYUxn7pPar9azOfoDTQe
        R3AzOeaash/WIwLsbbW9j9qbdQ==
X-Google-Smtp-Source: ABdhPJy+96j2xAYlqIsapthZr7nbK3yiMSnvTmvd0ihQkxhheqtCknuymj+1LhfJWe3XqN/q0hVf2Q==
X-Received: by 2002:a05:6638:1248:b0:314:bdef:3b66 with SMTP id o8-20020a056638124800b00314bdef3b66mr13350439jas.97.1645543023035;
        Tue, 22 Feb 2022 07:17:03 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id b24sm2877839ioc.0.2022.02.22.07.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 07:17:02 -0800 (PST)
Subject: Re: Deprecated Maintainer entries?
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke <sebastian.fricke@posteo.net>,
        Helen Fornazier <helen.fornazier@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     dafna@fastmail.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20220222063202.petjwwcfctzsbhxx@basti-TUXEDO-Book-XA1510>
 <5d5dee88-9dbf-e4d0-4a91-11ff4ecd82ea@xs4all.nl>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ac23b61c-10c8-a36c-6da8-d232b8399503@linuxfoundation.org>
Date:   Tue, 22 Feb 2022 08:17:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5d5dee88-9dbf-e4d0-4a91-11ff4ecd82ea@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2/22/22 12:46 AM, Hans Verkuil wrote:
> The same is true for VIMC where Helen was maintainer. Shuah, would you
> be willing to take over VIMC as maintainer? If not, then I can put myself
> up there as maintainer (but 'odd fixes' only, probably).
> 

I will be happy to take over VIMC as maintainer.

Keiran, you said you can help - would you like to be a reviewer? Let
me know the role you would like to play. I will send patch to update
the MAINTAINER entry for the driver.

Helen, sorry to see you leave the community. Hope you will be able to
come back in the future.

thanks,
-- Shuah

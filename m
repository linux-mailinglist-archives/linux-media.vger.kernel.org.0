Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594E85408C9
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 20:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349367AbiFGSC7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 14:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351009AbiFGSBf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 14:01:35 -0400
X-Greylist: delayed 73037 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Jun 2022 10:43:52 PDT
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0D214E95E
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 10:43:52 -0700 (PDT)
Received: from [IPV6:2804:431:c7c2:5159:3412:12e6:5871:933a] (unknown [IPv6:2804:431:c7c2:5159:3412:12e6:5871:933a])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E629066018EF;
        Tue,  7 Jun 2022 18:43:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1654623830;
        bh=XdQ/FSeGh6ngxNT+8I/J3ys8wUnwdExr8I5FrgdXMS4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oaTzbREp5eLgV8nrUmOWeOiFa6l5s66yB4FcRAVujicFfyFwgQyFYXEg2FCnQa8ep
         IVxFj143fRwaesSVU6fS0SBhBfBJVZyOgscR0nc9x+aJeoxT8QM3YDDPewuKS1pos2
         XpU0EjNu1fOPO9DxXaX7Fclqr0vYzQ8fwmLMQEFSbm1GwOU9Y3rnQa+Gwbzi4wMr6/
         iUrNJq2VRbW3/EagbUT3UBpNjZAZIojST6BVhlPhxeQ/JLg/yVJLZyTv3FdypcJLaQ
         HR4a/wIPl6qjvyjwpdE3ZgPV63wTWFva+5gt4lfkPSFk8EMlgWQKzGF34gMqCvmj49
         oaqk5niKRHBxQ==
Message-ID: <bdfbe6d9-2b32-bd54-e718-f02fecb708a7@collabora.com>
Date:   Tue, 7 Jun 2022 14:43:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2] media: Add AV1 uAPI
Content-Language: en-US
To:     Steve Cho <stevecho@chromium.org>
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20220322160101.620748-1-daniel.almeida@collabora.com>
 <CAC-pXoOQ5kD4bT95j+pwi7+Hb5s5H=0LFhAsk7K2sM9LkbAW1w@mail.gmail.com>
 <fa87fd58-dc73-24b0-0425-e466062c1d6d@collabora.com>
 <CAC-pXoP77VZT1Ftu3Amws9-Y9i11r9M0LxSEwqkezm_3i=HE8g@mail.gmail.com>
 <CAC-pXoOJPveE_+kjjkMS=anMCjJKc4VsxNrJbxkQsXqnLLb6XQ@mail.gmail.com>
 <CAC-pXoPU_bOJu723POgWj+EdXHsPg3X9J5Phq-YTCpO9jt-seg@mail.gmail.com>
 <CAN0yncHrY6jfk6owTEue8PqGmxffU612UgccvPc9Y6XOz38LRA@mail.gmail.com>
 <CAC-pXoPRAM8+xTPHHAxr_80vBGYaFO8R=v+2QMYJ5nEb0gvOTg@mail.gmail.com>
 <CAC-pXoNHRxqe6tzg3++TqYRZE-nocxiz-iPh5vPXC07iA_BaSw@mail.gmail.com>
 <CAC-pXoNRoqT_Fse_3Z8cO-SDwtMTm3fzScpDWvi5sNVr1N1Dzg@mail.gmail.com>
 <CAC-pXoOon18axGdT_+V38sdAWDh+t4jZetXqte7BCwO09YG+2w@mail.gmail.com>
 <CAC-pXoMVKmAZ=9iM7ivuo8rvnL=KQWHnopWharDz-eDky0QS-g@mail.gmail.com>
 <f366ce58-81e8-7b5b-24ef-b2ab88ce1d99@collabora.com>
 <CAC-pXoPvkwowiBsrEo4w2kjE9geDEP=qPQ2ntkgAQxiwuc123w@mail.gmail.com>
From:   Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAC-pXoPvkwowiBsrEo4w2kjE9geDEP=qPQ2ntkgAQxiwuc123w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve.


>  > Question about update_ref_delta, update_mode_delta flags for loop
> filter params in the spec.
>  >
>  > I don't see these flags in v4l2_av1_loop_filter struct.
>  >
>  > After looking at gstreamer implementation, I think arrays ref_deltas,
> mode_deltas are only filled in when these flags are 1.
>  >
>  > Is this correct understanding?
>  > If not, can you explain the background why these flags are omitted?
> 
> Possibly forgotten. Will fix in RFC v3.



I looked into this issue again. Apparently the other codec APIs do not 
convey these flags either. Let's wait until we get a second driver to 
see whether they will be necessary.

-- Daniel

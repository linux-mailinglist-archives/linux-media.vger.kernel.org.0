Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69DBB66D3CF
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 02:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbjAQBey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 20:34:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbjAQBex (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 20:34:53 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0083F241D7
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 17:34:48 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 0AE8884B51;
        Tue, 17 Jan 2023 02:34:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673919285;
        bh=cs5y5FUjQ4KgZST0FEa3/qDjoJl3flHw0tB94OY+d5w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BPwPipwpW3hdRdUn80JqbrfXHyOs+l9ntXXAq0sdhs53iFMMI9e61mcfIRW9gGtE3
         9GkKcaIOeiN5f5CyERFpucRQ1owkMEFradqVq9DUMpKhk06a4wwdx6zF9bE8qGtcwW
         j9cH2Zy4d7larHifNSalTJr0Z5nlSRgWVQm2HUI1J2QKXmvzj01ZYwjzjlRgllgwzo
         49MgclmM978qaaNIqvb/0v60fQxm5nQIloaISaphxCgeVQ4RvqCUi5dvsxYs11RghU
         z6uEud6rJ1wlSTfigJcfNUdZvgxjlV6fs4Zlr6QNX2usAy9Dm8Z1aKeUgVATrhmWV+
         BMHjjXm/hbwDw==
Message-ID: <a3c7b921-4f51-7f37-d583-99cef76c75ff@denx.de>
Date:   Tue, 17 Jan 2023 02:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Content-Language: en-US
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>
References: <20230116094032.4389-1-marex@denx.de>
 <Y8Uq2EtsYi9kmdqw@pendragon.ideasonboard.com>
 <CANiDSCtniqdwr7oqvcMfH9sKYMuTX7jyAA9P9ZeCFhEGq8Rnqw@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CANiDSCtniqdwr7oqvcMfH9sKYMuTX7jyAA9P9ZeCFhEGq8Rnqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/16/23 14:20, Ricardo Ribalda wrote:
> Hi Marek!!!

Hello Ricardo,

> Why do they call MEDIASUBTYPE_RGB32 something that is BRG ? !

This I do not know.

> Why do WE call XBGR something that is BGRX? !!

This is ... sigh.

> Besides our insanity, your patch looks sane. Thanks for it :)

You're welcome.

> There are some patches on the queue to remove the format definitions,
> so your patch might not apply cleanly, I guess Laurent will take care
> of it
I have it in my upstream queue, so I'll rebase it and send V3 if there 
is any conflict in one of the next linux-next trees.

Cheers

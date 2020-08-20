Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D678324C071
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 16:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgHTOTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 10:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgHTOTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 10:19:36 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59707C061385;
        Thu, 20 Aug 2020 07:19:36 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s15so1199041pgc.8;
        Thu, 20 Aug 2020 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jkEUM1s8wMHo7X8KWzXC0GiJQ6iyzluXa2j0gvHM6Lw=;
        b=VK4HxdFno2PYb5umxMxKA4EkgO5/oXbPzfyTxPYq+DrMqUUIGtxFmBNWKuKIl4XvFi
         crchG+Etdil4Po7xYt2VVxNmPtW5VdXIuW00HXudeFQBjgp/4s9yqYVVMw3I9ug8gwVQ
         fEPSiiivV0I5ehR527XD6s0rtKcya7z/Uh+/SS9XCHRyOtm69cGt56JrD1hksOjY2OYT
         yd97czn+m7uG15r92QxyDfjlMb0fNebIxXP5lm0Yc/uvK1VW6KH2drpsqMRvpBhzW0mu
         GRZBYpTfjRmNVlq5jJIESiIGnXJUPTs3gQZeaJBjvZxOnVPxO45LKrvA2VK4VfwhDFpG
         38Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jkEUM1s8wMHo7X8KWzXC0GiJQ6iyzluXa2j0gvHM6Lw=;
        b=RyP7gjj1bLSSvsBk+qdIdiSqzwWzDw2ycMcIjlbpBimlU8gEr5aOb1Dmho1NCybVmC
         or0WaQcqBfRoYpLRP210e4zHbnldIiMe/XjLl+3J5Zki5or0YwewLIYvFkiK/pISxk4u
         dm1sP6tJD27zxdNY6OnCyG77ccqtKUY/gufO1hOBEjyZ9HwD4UqOJLz7qV+j8E3EI0sc
         jfcDt9q4pAxBRfolorSKWpO0+j83L8dZvmavCFswxp87eqqC+HflCxMasa1nzTV9j+jz
         vUxWmDbDHrdiQA4taOOEimeFF7T8HIsW/DSOejKproljQ58vabDTGDt0pXuXYl3hJ88h
         1JBA==
X-Gm-Message-State: AOAM531UsU8PYp8TlPK4taRtXhxOkMlgM8euROnh2AH6F0fZlEOL5wyD
        6KjgusIqfVHhXl8ngKvFwRPjH6RK1Vs=
X-Google-Smtp-Source: ABdhPJwBd51hadkoS92XlI1ForCnsjAxaCzCjF0vmtFa43O4076QBAo5U0FLAxjXA+txlLJA1D2w6g==
X-Received: by 2002:a62:3856:: with SMTP id f83mr2460110pfa.35.1597933175868;
        Thu, 20 Aug 2020 07:19:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f6sm3159611pfa.23.2020.08.20.07.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 07:19:35 -0700 (PDT)
Subject: Re: Protecting uvcvideo againt USB device disconnect [Was: Re:
 Protecting usb_set_interface() against device removal]
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-usb <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-media@vger.kernel.org, linux-uvc-devel@lists.sourceforge.net,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <b0a7247c-bed3-934b-2c73-7f4b0adb5e75@roeck-us.net>
 <20200815020739.GB52242@rowland.harvard.edu>
 <20200816003315.GA13826@roeck-us.net>
 <20200816121816.GC32174@pendragon.ideasonboard.com>
 <9bb20ed7-b156-f6c2-4d25-6acac1a0021b@roeck-us.net>
 <20200816235155.GA7729@pendragon.ideasonboard.com>
 <0684b71c-8ac5-8962-cbd5-c0bcaa8b6881@xs4all.nl>
 <20200819013002.GL2360@pendragon.ideasonboard.com>
 <20200819230851.GA222844@roeck-us.net>
 <20200820101502.GB6593@pendragon.ideasonboard.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <39c038a4-21fd-5061-59e5-8a976d220010@roeck-us.net>
Date:   Thu, 20 Aug 2020 07:19:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820101502.GB6593@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/20/20 3:15 AM, Laurent Pinchart wrote:
[ ... ]

>> usb_set_interface() should not be called anymore after uvc_disconnect(),
>> or at east I think so (is that documented anywhere ?).
>> Yet, that obviously happens, and it happens completely outside lock
>> control. And this is just one instance where I was actually able
>> to see the problem. I am quite sure that there are more.
> 
> Let's hope there are not too many :-) As you can see from the stack
> trace, this happens at .release() (a.k.a. last close()) time. This code
> path is the only one that the V4L2 core can't protect fully for drivers.
> The good news is that there's thus only one code path that drivers would
> need to handle manually.
> 
> I think we could fix this one by calling uvc_queue_release() in
> uvc_disconnect(), after unregistering the video devices. The
> uvc_queue_release() call in the .release() path would then become a
> no-op, as everything will be stopped already.
> 

I'll give that a try.

I plan to add some instrumentation into the code to check if there are any
other usb calls after uvc_disconnect(). We'll see if that was the only one,
or if I can catch more.

Thanks,
Guenter

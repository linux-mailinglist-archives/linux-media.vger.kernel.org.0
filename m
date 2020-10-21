Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD20294AD6
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 11:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441560AbgJUJyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 05:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441556AbgJUJyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 05:54:22 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 235ADC0613CE;
        Wed, 21 Oct 2020 02:54:21 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q5so1253128wmq.0;
        Wed, 21 Oct 2020 02:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Z9a3sRtdNxxaFiVBqwayqZ+oN23gxM+2axS4HiJMes8=;
        b=pUuU0k9mFKEX9wMMQ5iyDNYru5ANgwJ4Eqy6628CwaAFJwl+foADy5NnEUB0UH38df
         on40DQFJEMGMf8dyYHzAM1jornXZampzXrffaJ1jwDKEE4HKU65O1LBj50QVDK6JtwWH
         7UncU2LRtn2biyRCbylvZpV8sXNe6Am0LI3niU8/R4+uhotexHya6C1Z3r+Dlxwplcg6
         so77IgtHICoWww+aGfcG6tLTZWHIB5eN10RViVUhnTxIW3Vo0dzmgqOyvHJa+aCWgUM8
         RQ166UWoyIzmFW5KuqyukGbDI1D5EJEGSYjjg3BAlE5dJ/btgQli7XS/A+piZJNPx+ZG
         jQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Z9a3sRtdNxxaFiVBqwayqZ+oN23gxM+2axS4HiJMes8=;
        b=XP0mP6pDXPvzE9VkfYJuTNxccR0zrCm8iQO1uGWKhelcVm86ek/M4YxnUd0hWKmhm3
         KV4u7hawOXR5cwFkLvAAnX5cS7YLKWxgqwsCN1MNsptc0JumDltX2tt+w3zqxh6KViFQ
         xHib/kLW/x2Cjr04aL4q+W3SeFQxtI3fgM/VR3RHg7Y0CUrJthbEHsZrFd7faYIht3Mz
         PmgTH64an0nRHDwxMOpmJWw0an+WzOKtfZIjS0weaANj6bC5GmJMGUn814Z08NlRvYbQ
         NfSK59g043zPD1gnabB1sCfLH9YGsS9c0NK2cCqhRDrgVXFID18Ad392++yNK5ipzjzM
         EHKg==
X-Gm-Message-State: AOAM533+GCNPyBLnMhx7mFVkMhn7rrYWD1M2TqxsV3B/BtWA2yJGW9Ld
        R2iFWuicwtLJxFJnDfbQAjE=
X-Google-Smtp-Source: ABdhPJxxEfQqaUy9cbuNvOzUciAoSeQnN/ip6m8iEkbMUZIwfo6hu6MbDl5ga2fsA5dd0+/l8DeHqQ==
X-Received: by 2002:a1c:bd57:: with SMTP id n84mr2703221wmf.126.1603274057861;
        Wed, 21 Oct 2020 02:54:17 -0700 (PDT)
Received: from [192.168.1.211] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id x22sm2938041wmj.25.2020.10.21.02.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2020 02:54:17 -0700 (PDT)
Subject: Re: [RFC PATCH v3 1/9] software_node: Add helper function to
 unregister arrays of software_nodes ordered parent to child
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, yong.zhi@intel.com, rafael@kernel.org,
        gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-2-djrscally@gmail.com>
 <20201020100510.GS13341@paasikivi.fi.intel.com>
 <b6909e37-cd8f-2c1a-126c-40e34ba2a560@gmail.com>
 <20201021094009.GN4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <5db7bd75-eff7-b902-9312-421077b897ba@gmail.com>
Date:   Wed, 21 Oct 2020 10:54:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021094009.GN4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/10/2020 10:40, Andy Shevchenko wrote:
> On Tue, Oct 20, 2020 at 11:52:56PM +0100, Dan Scally wrote:
>> On 20/10/2020 11:05, Sakari Ailus wrote:
>>> On Mon, Oct 19, 2020 at 11:58:55PM +0100, Daniel Scally wrote:
>>>> Software nodes that are children of another software node should be
>>>> unregistered before their parent. To allow easy unregistering of an array
>>>> of software_nodes ordered parent to child, add a helper function to loop
>>>> over and unregister nodes in such an array in reverse order.
> ...
>
>>>> + * software_node_unregister_nodes_reverse - Unregister an array of software
>>>> + * nodes in reverse order.
>>>> + * @nodes: Array of software nodes to be unregistered.
>>>> + *
>>>> + * NOTE: The same warning applies as with software_node_unregister_nodes.
>>>> + * Unless you are _sure_ that the array of nodes is ordered parent to child
>>>> + * it is wiser to remove them individually in the correct order.
>>> Could the default order in software_node_unregister_nodes() be reversed
>>> instead? There are no users so this should be easy to change.
>>>
>>> Doing this only one way may require enforcing the registration order in
>>> software_node_register_nodes(), but the end result would be safer.
>>>
>>> What do you think?
>> Yeah fine by me. We can just use software_node_to_swnode(node->parent)
>> within software_node_unregister_nodes() to check that children come
>> after their parents have already been processed. I'll add a patch to do
>> that in the next version of this series, and another changing the
>> ordering of software_node_unregister_node_group() as Andy suggests for
>> consistency.
> I remember it was a big discussion between Rafael, Heikki and Greg KH about
> child-parent release in kobjects. That ended up with few patches to device
> object handling along with one that reversed the order of swnode unregistering
> in test_printf.c. So here is the question who is maintaining the order: a kref
> (via kobject) or a caller?
I would expect the caller to maintain the order correctly, and just have
the register() function validate that the ordering is good and complain
if not.

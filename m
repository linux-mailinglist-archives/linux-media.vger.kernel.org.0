Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1486B294541
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 00:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410440AbgJTWxA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 18:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410432AbgJTWw7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 18:52:59 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA9DC0613CE;
        Tue, 20 Oct 2020 15:52:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h5so11054wrv.7;
        Tue, 20 Oct 2020 15:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=77RJOUVHzwMG1TwYGEG/w9DG5oXq+d9AENphgMt3wMU=;
        b=EvEdFvpVD54STmv3HzSRIcNwQ++dFaqXeIb8gu53FLX8ycYtSSievg+aXq+y6y2RrQ
         N9tykL1EV5fK8wu/896i5tem+YHR5W0oJseknZ7izOvTtQRZZ5yORMPyiffYVFsZJdbp
         8rQrbPx3UJ65ux1hlL1i2MWPKJ8bDnVkz4vJIXFYCKG1uBqgKLRqQZRVbvRuwo1Rbh69
         e2V9Ad6VmEQgMMIRACq2AsHUf9UU+QoBk/0BTstlpxHYWOHOnI1Vh6+0i/3Zz9nAK+Lk
         H7qJPdUmHcsS3zxttfh3/HCi5QWGUhCYOtspw35S+80Z6Hm1MoRgTiwYPCegdChqb9EZ
         2FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=77RJOUVHzwMG1TwYGEG/w9DG5oXq+d9AENphgMt3wMU=;
        b=VDf3eQ7FWaETkZN+U6idYHaaXThF8jM+nq/YjVAs6jKjJa0Qm9YaSQngdEP4uya8y/
         KWcGCKuScKUsqcif89aoGqAybPGIzcuzcY4mfCmWawV7bTZXAetJto4Fs50Rll/CLa/P
         SXp/4R0F9y4FAtJ/2Ydv72y6jXQvvCWNBJAc9zS8t348yT+nSA5R281s9Dter3jIQIiY
         oGwHLelWea/zYFljEhK3t4ktQDvJJ7SV2u5iIUceMWfhrCgsxhG3jgTMiaHEAqfVC8Bv
         98p/NfgjnxC+r/7JmCsbC5GMVxedC4aEnYAFcY28HA+5/Uqcn4ItvuSDgKJW4t5Aj74q
         uwTA==
X-Gm-Message-State: AOAM532o8Sv5h4VX6U+5LsloWkRX+Vjo6xFdayGU737K5XO/mFd5MFRB
        B+ldgYfGnzm/0bSBr+waKGc=
X-Google-Smtp-Source: ABdhPJyeZkYmmYv3JG2fN5v2h0MWGtxfXihszYCJ9WLg6v48hyrNxZ+JzLI9QgST0dSTPg8X51bDPg==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr709254wrw.132.1603234377793;
        Tue, 20 Oct 2020 15:52:57 -0700 (PDT)
Received: from [192.168.1.211] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id 32sm334786wro.31.2020.10.20.15.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 15:52:57 -0700 (PDT)
Subject: Re: [RFC PATCH v3 1/9] software_node: Add helper function to
 unregister arrays of software_nodes ordered parent to child
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-2-djrscally@gmail.com>
 <20201020100510.GS13341@paasikivi.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <b6909e37-cd8f-2c1a-126c-40e34ba2a560@gmail.com>
Date:   Tue, 20 Oct 2020 23:52:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020100510.GS13341@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 20/10/2020 11:05, Sakari Ailus wrote:
> Hi Daniel, Andy,
>
> On Mon, Oct 19, 2020 at 11:58:55PM +0100, Daniel Scally wrote:
>> Software nodes that are children of another software node should be
>> unregistered before their parent. To allow easy unregistering of an array
>> of software_nodes ordered parent to child, add a helper function to loop
>> over and unregister nodes in such an array in reverse order.
>>
>> Suggested-by: Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes in v3:
>> 	- patch introduced.
>>
>>  drivers/base/swnode.c    | 21 +++++++++++++++++++++
>>  include/linux/property.h |  1 +
>>  2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>> index 010828fc7..f01b1cc61 100644
>> --- a/drivers/base/swnode.c
>> +++ b/drivers/base/swnode.c
>> @@ -727,6 +727,27 @@ void software_node_unregister_nodes(const struct software_node *nodes)
>>  }
>>  EXPORT_SYMBOL_GPL(software_node_unregister_nodes);
>>  
>> +/**
>> + * software_node_unregister_nodes_reverse - Unregister an array of software
>> + * nodes in reverse order.
>> + * @nodes: Array of software nodes to be unregistered.
>> + *
>> + * NOTE: The same warning applies as with software_node_unregister_nodes.
>> + * Unless you are _sure_ that the array of nodes is ordered parent to child
>> + * it is wiser to remove them individually in the correct order.
> Could the default order in software_node_unregister_nodes() be reversed
> instead? There are no users so this should be easy to change.
>
> Doing this only one way may require enforcing the registration order in
> software_node_register_nodes(), but the end result would be safer.
>
> What do you think?

Yeah fine by me. We can just use software_node_to_swnode(node->parent)
within software_node_unregister_nodes() to check that children come
after their parents have already been processed. I'll add a patch to do
that in the next version of this series, and another changing the
ordering of software_node_unregister_node_group() as Andy suggests for
consistency.


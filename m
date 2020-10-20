Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57D629456C
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 01:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410584AbgJTXZb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 19:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391793AbgJTXZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 19:25:31 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F02C0613CE;
        Tue, 20 Oct 2020 16:25:31 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y12so205382wrp.6;
        Tue, 20 Oct 2020 16:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KrtY69Bd3Ixdxm/O6NXw+p+KtjjEH9aL+39Rr1pK6J8=;
        b=Q95JDr7d1dYjTlRUhMV1yKQnSnsatqcpA1L/wcf6RPjCMsNph5JA8GK6vGCDY1/P0c
         K/L8y45OS8zZiaO8y58mXCcVlFbPSSb8qePltBYDABppNZqDs7SSv9bomfP7/0uO+oJS
         8/EXLzuMXEQF6f5YRwSN0/EDLn5gbs0Hxj2FHgLui54cqsQ50yqRPTssrSmpayS7cbHb
         FGLRSp3B/+12GnLtm7V1XXvCTQjbytPD/suPLJn2mGDfufNT5EMNWy1GTtZGc3PX/myX
         FH88PR14MfWycCxtO/dn28g9ws3/sjPTw4/AfGiK+sHFJNHAFzH8W/mivUmjKkYQFztM
         pAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KrtY69Bd3Ixdxm/O6NXw+p+KtjjEH9aL+39Rr1pK6J8=;
        b=Ik+XeLyFx+jicEWu12JpxrxkSjFTT3H1aikHsE6m2z9qM8ZTl6vzFoeyvCjyeXvsCI
         fWBfMz22cZOhBxvp79ndSTEzzw9Pkv2QMuLt68DHyEbxcGJ2mlKk9Umx4I3VcL+7JVpi
         a7QcITS4CBFBt34UWnZDLhRLlT2OEdaj0L/wQ9DNJq6XIYJbMU6W8sgBKucds+7ZaSxg
         nMAMF6iwv2P3wHfQ70fioDBtdrMuq1eYSalZl7IPePDIzFWJ27l2lJn/1kjQvBylx3se
         PrAhRJ6P5vPWTUbhEpEyfOA23AFK0Z5jNbFXHpBzFzleqhXFuHD3i0bUPYuzgfZE7i+2
         MMIw==
X-Gm-Message-State: AOAM5333pDviOMUUs2LFPg9lohAQ4VV6afT2Uav+bLtyhpG1Kq/2iCBU
        t1w78WKGhj/du3bE+DAQ4ff3QDmnHCLFyh7W
X-Google-Smtp-Source: ABdhPJy7vDcQMfEH/tm3CnrLIPDmLRZ+9UYXjE+tfS/MBHoe7QTfHWOVU2lsjbMaCRoObbUqDh5GMQ==
X-Received: by 2002:adf:df91:: with SMTP id z17mr739215wrl.379.1603236329885;
        Tue, 20 Oct 2020 16:25:29 -0700 (PDT)
Received: from [192.168.1.211] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id l6sm480915wrt.7.2020.10.20.16.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 16:25:29 -0700 (PDT)
Subject: Re: [RFC PATCH v3 3/9] software_node: Fix failure to hold refcount in
 software_node_get_next_child
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-4-djrscally@gmail.com>
 <20201020133148.GB843@valkosipuli.retiisi.org.uk>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <c1a7beba-faff-e06d-1517-5b30d777b252@gmail.com>
Date:   Wed, 21 Oct 2020 00:25:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020133148.GB843@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 20/10/2020 14:31, Sakari Ailus wrote:
> Hi Daniel,
>
> On Mon, Oct 19, 2020 at 11:58:57PM +0100, Daniel Scally wrote:
>> The software_node_get_next_child() function currently does not hold a kref
>> to the child software_node; fix that.
>>
>> Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes in v3:
>> 	- split out from the full software_node_graph*() patch
>>
>>  drivers/base/swnode.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>> index f01b1cc61..741149b90 100644
>> --- a/drivers/base/swnode.c
>> +++ b/drivers/base/swnode.c
>> @@ -450,7 +450,7 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
>>  		c = list_next_entry(c, entry);
>>  	else
>>  		c = list_first_entry(&p->children, struct swnode, entry);
>> -	return &c->fwnode;
>> +	return software_node_get(&c->fwnode);
> I believe similarly, the function should drop the reference to the previous
> node, and not expect the caller to do this. The OF equivalent does the
> same.

I think I prefer it this way myself, since the alternative is having to
explicitly call *_node_get() on a returned child if you want to keep it
but also keep iterating. But I agree that it's important to take a
consistent approach. I'll add that too; this will mean
swnode_graph_find_next_port() and
software_node_graph_get_next_endpoint() in patch 4 of this series will
need changing slightly to square away their references.


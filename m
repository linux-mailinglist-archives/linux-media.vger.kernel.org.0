Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20BF0294AE2
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 11:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441606AbgJUJ4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 05:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441602AbgJUJ4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 05:56:04 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950B4C0613CE;
        Wed, 21 Oct 2020 02:56:04 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e2so1271960wme.1;
        Wed, 21 Oct 2020 02:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+DX1LmIRhgIdHgdn7kNJClwb7VEE6eYrqyGgawZtHnQ=;
        b=qttvwvURtH870gJTjkWkpyxmDddg+9mQVJYRTpC398ahFDz5mz1TmD67rglS8hug6Z
         /ViA4t+uRonlkPC3HO33K7Fe8LqSFoxucjw+P9b1Vzg83V5ZKZibMxR2xH2t28mRz228
         BiXpOo3wrXqyFaT/H124zOoqS8unaQ1CT2yGC85rja9halcG8wlIwrP+JlWY1mnPZg2n
         11u2FTi5FpvqWoWKqK9WEqOv/3RQen21BcQFLCpddH8c9WTMTPqck9Pul05UJQIdDVwA
         nQRHjX0isDT9tMgkuZjfXr0etDTQfCk5FD5Qr7rkHCZFVg4jV7UpOUE8ma1PDfNe9B53
         fbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+DX1LmIRhgIdHgdn7kNJClwb7VEE6eYrqyGgawZtHnQ=;
        b=d22nynG/rZsYM+GgVphPMYhkgVfA6eqtXhv3vd7OlDwhcInFaBREQTBq5jls0W3LNv
         27MBLYNyh6hbXpkJRX6WUBP7EiUldAJqxWwQtXT2u0xuiOSbfwBJ/pfDT3ctsxQfjAb9
         QyRuF7Dv7nEa9ING27BBfBqCFcygyWW/q+q+L1CMkUllo3L7XW+H2b5yexg6Chpy0sjM
         0oFnTOVYwn5MS8+Y26gKPNKogil9JBpbQf6UZTzrLtQ/Agd8cP4ODkEJF91EJ8uNYUfW
         kaZeTQfCSkQCAp2gXY+Clu058IbdHTCEDT3+1af8rlrlJNOw1bJnnSADtCZsCIxP+P2B
         WHhg==
X-Gm-Message-State: AOAM532FXihALfNFAczmyCRJqPq84+hoNmrhxm2KAOGcU6Fvt1/rTjYf
        YGx4oVFEDjqEXq0JOM9Cnlg=
X-Google-Smtp-Source: ABdhPJxg6JBq9/NG+KrwfIyEw5a8a9iNBX6flNKA4QxVTN/F+38dGx4VhlzyOr4M/dqjvYYJ0Cfa7w==
X-Received: by 2002:a7b:c345:: with SMTP id l5mr2626653wmj.123.1603274163366;
        Wed, 21 Oct 2020 02:56:03 -0700 (PDT)
Received: from [192.168.1.211] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id p9sm2497696wmm.4.2020.10.21.02.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2020 02:56:02 -0700 (PDT)
Subject: Re: [RFC PATCH v3 3/9] software_node: Fix failure to hold refcount in
 software_node_get_next_child
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux.walleij@linaro.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-4-djrscally@gmail.com>
 <20201020133148.GB843@valkosipuli.retiisi.org.uk>
 <c1a7beba-faff-e06d-1517-5b30d777b252@gmail.com>
 <20201021093321.GM4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <d8f3880e-1b4c-b9dc-7bb2-cb8b7658263e@gmail.com>
Date:   Wed, 21 Oct 2020 10:56:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021093321.GM4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 21/10/2020 10:33, Andy Shevchenko wrote:
> On Wed, Oct 21, 2020 at 12:25:28AM +0100, Dan Scally wrote:
>> On 20/10/2020 14:31, Sakari Ailus wrote:
>>> On Mon, Oct 19, 2020 at 11:58:57PM +0100, Daniel Scally wrote:
>>>> +	return software_node_get(&c->fwnode);
>>> I believe similarly, the function should drop the reference to the previous
>>> node, and not expect the caller to do this. The OF equivalent does the
>>> same.
>> I think I prefer it this way myself, since the alternative is having to
>> explicitly call *_node_get() on a returned child if you want to keep it
>> but also keep iterating. But I agree that it's important to take a
>> consistent approach. I'll add that too; this will mean
>> swnode_graph_find_next_port() and
>> software_node_graph_get_next_endpoint() in patch 4 of this series will
>> need changing slightly to square away their references.
> What about ACPI case? Does it square?
ACPI version doesn't handle references at all; neither puts() the old
nor gets() the new child node.

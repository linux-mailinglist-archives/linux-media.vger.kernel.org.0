Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB3D2943A1
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405333AbgJTT4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732547AbgJTT4M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:56:12 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6F9C0613D1;
        Tue, 20 Oct 2020 12:56:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y12so3903453wrp.6;
        Tue, 20 Oct 2020 12:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EkvUPGzG0rYC8VoHFkrJiY63RC96TCBG8SeqvdWrfUk=;
        b=XZpCl+eLNOKORnr7rN2yeY8275Ljse0jgfD73ILYlz5YqCXAS4YWVaoG+21dbAvlnj
         tk38f8C14anItDhPugcWZ7SzLqB41sB4awoUWavoXtTRng1Jl6mGz6I6CZYz/IzFJrc6
         yGVzyrh4iu/KKsDxDO1OcH+rr5cHRXK9fGFpwjlvI9bgD5wuRUtIF5rgNJjvyhmqCcDo
         xxOY3HdnKOBpykwWD9nSLXvGUKN7V5BpJ4FclZmDEAU48RujvxH2yOA1gMmAz47fXI3f
         mGDnk6h+H+G2AB5TovlJESsZNJTLYiqa55QmF1tzVUS+O2APkdhUozDr4PDvDj6QW4IR
         NRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EkvUPGzG0rYC8VoHFkrJiY63RC96TCBG8SeqvdWrfUk=;
        b=GJ8XdjUCfRbvTfpJlZeoFuGc6ZRiz4zu3FrAozE7+BymsZC50+LmqPv25anLQErB5X
         a+BY/vr7gYeEVb+qApbADVlnXc2PFL/SjbV9K7JuGw6BQ9uXLyAA9hdiMv541DqMD+KY
         5UBsxMXC06slqndOZglmTPgJ5KpgZ0FKn8Mu1t4snWex2Kfv+U4bODJelyjhJ5PXwKD5
         X3HnzQsIWq/hISsASt88mj68/63eb2MU4Vxta647AQ6ypW5ST5797FlVJ7fUREbcJpau
         cpHdM+2aUtxB5Jz1H/mhjdE6SMsJUfZaT7hNELBpKHUtpELR5bqaKhFD8ERpzUI3K8+w
         lY6Q==
X-Gm-Message-State: AOAM531/mx8bxsWnLOOOXZpTixyg4GYPO9e9wBOdVWNhHVr5aSfObPkj
        f3E1x2TJotxK/VvTRRon8qE=
X-Google-Smtp-Source: ABdhPJyi2YTy1Eeqzqumz/PUvtqlJaX+IsttYqw1axedeULsvn6o9h1Uaz+FpTEt12vAjmS+LeyoNQ==
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr63142wrv.49.1603223769350;
        Tue, 20 Oct 2020 12:56:09 -0700 (PDT)
Received: from [192.168.1.211] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id x18sm4821181wrg.4.2020.10.20.12.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 12:56:08 -0700 (PDT)
Subject: Re: [RFC PATCH v3 7/9] ipu3-cio2: Check if pci_dev->dev's fwnode is a
 software_node in cio2_parse_firmware() and set FWNODE_GRAPH_DEVICE_DISABLED
 if so
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
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
 <20201019225903.14276-8-djrscally@gmail.com>
 <20201020091958.GC4077@smile.fi.intel.com>
 <20201020120615.GV13341@paasikivi.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <32bbb4db-17d7-b9d1-950f-8f29d67539c3@gmail.com>
Date:   Tue, 20 Oct 2020 20:56:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020120615.GV13341@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 20/10/2020 13:06, Sakari Ailus wrote:
> Hi Andy,
>
> On Tue, Oct 20, 2020 at 12:19:58PM +0300, Andy Shevchenko wrote:
>> On Mon, Oct 19, 2020 at 11:59:01PM +0100, Daniel Scally wrote:
>>> fwnode_graph_get_endpoint_by_id() will optionally parse enabled devices
>>> only; that status being determined through the .device_is_available() op
>>> of the device's fwnode. As software_nodes don't have that operation and
>>> adding it is meaningless, we instead need to check if the device's fwnode
>>> is a software_node and if so pass the appropriate flag to disable that
>>> check
>> Period.
>>
>> I'm wondering if actually this can be hidden in fwnode_graph_get_endpoint_by_id().
> The device availability test is actually there for a reason. Some firmware
> implementations put all the potential devices in the tables and only one
> (of some) of them are available.
>
> Could this be implemented so that if the node is a software node, then get
> its parent and then see if that is available?
>
> I guess that could be implemented in software node ops. Any opinions?
Actually when considering the cio2 device, it seems that
set_secondary_fwnode() actually overwrites the _primary_, given
fwnode_is_primary(dev->fwnode) returns false. So in at least some cases,
this wouldn't work.

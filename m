Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546592E2787
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 15:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgLXOB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 09:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgLXOB1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 09:01:27 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BD4C061794;
        Thu, 24 Dec 2020 06:00:46 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id 91so2249378wrj.7;
        Thu, 24 Dec 2020 06:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hTZYu0KyYNj6GV2bBjh3qdlRgAwRDrZxZXOKPRcg84c=;
        b=jiGvw60pmyZpHGhIJzNBYgP2ZTYSe+VnyxjnYIr+4u8iTKTN21QV+44OhsfqCw7VW8
         lZ5OeT4hf6sDduKPRa1gWUbK4PAEAh0D6dhG03iEYbtisuv6/t1Lw8r1a8BGjVSnI5mF
         rAsvVuThEHRhgM90vJtP11SEB5GDJ25CAr1EyT5BziG9phgkcgoBlwOgiPMUenv1Nvf4
         E/Wyd6iIhE/xdYVXIl5sX1wwNLm9Ad46AEZTasiZMQaBjyzP9EETbZnYCGWaYX8qp2gt
         lcsYTH9XP0gdcjEECO87XqqYjk8GM6Y9yxvDBW99BllbIDxhCljRDblhe+b/sZShu69V
         jGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hTZYu0KyYNj6GV2bBjh3qdlRgAwRDrZxZXOKPRcg84c=;
        b=pVfGHuAc6JGqNlz8a8SYLQPLk/DXI8P32u1ApZDoQkw9Aln9IQ5s7bcQl4C3ojUTcL
         omnsQKWLu9any/8daZ0NgofAsgOlsvt1cHLiB6e+ST17cDbTw97Fmp0HQ/s9B8DQE6zD
         aSvtutiLdIh/9zyhzERVrT1RhEBlMWM/IbkccDVkJx6vBKMpdzJfexooa93ywDJQvAo7
         U+aV5RJDDus8NTrILKEEbL7lmQNjB5/rLK6qmtS50+nl4kaYIQS3Sk2y2pBA2FzbnUt2
         P+BBJnDNXMPvnadrLvwfsTbdeujIelbYBDgzENzZ+Yoo5S/wz+bbskyLpT2Irs6Mol40
         CGeg==
X-Gm-Message-State: AOAM530MEYSUj5VxtwFG4aKFyoo8+s+z54OtLsItfuUIgsOeiZZAJzpH
        XI4tMzG1dbxQYD9kKo76wWE=
X-Google-Smtp-Source: ABdhPJx+Z0EJqXx/2AjrwRP+xuKb0XQTgwvxvJSravZrEZ5dPl56k33iW2pd5DGEMbQAm/r9ZBJ2ng==
X-Received: by 2002:a5d:56c3:: with SMTP id m3mr34636969wrw.419.1608818445462;
        Thu, 24 Dec 2020 06:00:45 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.116])
        by smtp.gmail.com with ESMTPSA id h13sm38544866wrm.28.2020.12.24.06.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Dec 2020 06:00:44 -0800 (PST)
Subject: Re: [PATCH v3 05/14] software_node: unregister software_nodes in
 reverse order
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@acpica.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        niklas.soderlund+renesas@ragnatech.se,
        Steve Longerbeam <slongerbeam@gmail.com>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201224010907.263125-1-djrscally@gmail.com>
 <20201224010907.263125-6-djrscally@gmail.com>
 <CAHp75VdF5NdjrSxcOafh7KNNDteYEUDk9otA0HKX-iks7G0D4g@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <de478ef0-0b4d-df1d-2651-9cc35bf2f45b@gmail.com>
Date:   Thu, 24 Dec 2020 14:00:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdF5NdjrSxcOafh7KNNDteYEUDk9otA0HKX-iks7G0D4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/12/2020 12:13, Andy Shevchenko wrote:
> On Thu, Dec 24, 2020 at 3:12 AM Daniel Scally <djrscally@gmail.com> wrote:
>>
>> To maintain consistency with software_node_unregister_nodes(), reverse
>> the order in which the software_node_unregister_node_group() function
>> unregisters nodes.
> 
> ...
> 
>> - * Unregister multiple software nodes at once.
>> + * Unregister multiple software nodes at once. The array will be unwound in
>> + * reverse order (i.e. last entry first) and thus if any member of the array
>> + * has its .parent member set then they should appear later in the array such
>> + * that they are unregistered first.
> 
> I'm, as being not a native speaker, a bit confused by this comment.
> The idea is that children are unregistered first. Can you try to make
> it more clear maybe?

Sure, how about:

The array will be unwound in reverse order (i.e. last entry first). If
any member of the array is a child of another member then the child must
appear later in the array than their parent, so that they are
unregistered first.

?

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1C02953B4
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 22:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440004AbgJUU7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 16:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393312AbgJUU7I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 16:59:08 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCE7C0613CE;
        Wed, 21 Oct 2020 13:59:08 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z22so3178052wmi.0;
        Wed, 21 Oct 2020 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Q1NKMcSOe9b+qsiaH8aTA03vYMnG2ZoSX2yxXb05R/Y=;
        b=qKfACjW2xnC0rvQ9v1HOxbYmaCSjKpED0TSJihI0QBTvhtCiis0darmOpowu4MyWKS
         Q8P26L902olFs+g5evVwyF8DDWzqwmRQndqWngey3FHPxuPNg1UNwL14CMrUugqEVG/g
         upnRt+sLlY6bj2cNLmnQ5mOmHLZA8S2jbAKyauglzuQToySTmdGAph/DARBqyo12GD5S
         32ncNvCWM2md84bQtQHoTVmnJzb3WR3gjXiG1hbbCr1VCiNhAeKLL+nxhHYECuIpFBSn
         lP3PiiXZjUuFe1H1T5cWnBkGw6CHDXcgn8bsXHnCAncLGgEnJYx0gV8Uy/KV9PLcIEs1
         etWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Q1NKMcSOe9b+qsiaH8aTA03vYMnG2ZoSX2yxXb05R/Y=;
        b=R2APsGJRNCRpB8I0Hl8357+y65f6KeNV9hazHeehcvX2D7Yj4OghhoQdHT4oL4t5CL
         /wUMgHJd+JhF1sZ37+5pdLibu1S2pTLKQhYbWbRCcF4y4lIv5cGwSk8R7NYw5EL+gedp
         Wf8u/0G9R9eEAx0H34VuM1qLO5CM3iaNeHCJurlIcl9rFz5vSNrrGeLJILneHLnRd8EU
         QkPVpYM2Jmxv2he3rWW4DWY0/NF1hc6IGCT2sw9tcXBzQLPTmOrQP1Q/dw4vLxbx16mJ
         nmRgSRvDb6BOALcWS7ZGwu3E5arjH6oJf/OYIY0pzBhOq/uP9AC8JO/WzQuGyDSntjOL
         p0gQ==
X-Gm-Message-State: AOAM532+JMuGBUrmX6c8rqabWY5b1nZ/rFJG9miqYSQzq5cPQ9jGc0/x
        Iiu8/TfeLHr0aYi/jbo74Xj17VrkgfLzlHdv
X-Google-Smtp-Source: ABdhPJxk7m3kz98eLybI4oIBAgM3mVENX60rImBbxPPZhlnRmpb2+OzopUJImL3tVZBjRQx9m2Xe8w==
X-Received: by 2002:a1c:4904:: with SMTP id w4mr4739912wma.99.1603313947284;
        Wed, 21 Oct 2020 13:59:07 -0700 (PDT)
Received: from [192.168.1.158] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id d30sm5980990wrc.19.2020.10.21.13.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2020 13:59:06 -0700 (PDT)
Subject: Re: [RFC PATCH v3 0/9] Add functionality to ipu3-cio2 driver allowing
 software_node connections to sensors on platforms designed for Windows
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh@kernel.org>,
        David Miller <davem@davemloft.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Petr Mladek <pmladek@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        tian.shu.qiu@intel.com, Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        yong.zhi@intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kitakar@gmail.com, dan.carpenter@oracle.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <CAJZ5v0g2hQV9RNq3LZqrpQ5LP0rR+fxwdWcwwnzWh1g2dLdmjw@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <6aa10740-ae07-16c3-d3a2-8c42af2a259a@gmail.com>
Date:   Wed, 21 Oct 2020 21:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0g2hQV9RNq3LZqrpQ5LP0rR+fxwdWcwwnzWh1g2dLdmjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/10/2020 14:38, Rafael J. Wysocki wrote:
> [Fix the Linus Walleij's address.]
Thanks - much appreciated
> On Tue, Oct 20, 2020 at 12:59 AM Daniel Scally <djrscally@gmail.com> wrote:
>> Hello all
>>
>> This series adds support to the ipu3-cio2 driver for fwnode connections
>> between cio2 and sensors to be defined via software_nodes. The final patch
>> in the series deals wholly with those changes - the preceding patches are
>> either supporting changes to accommodate that or incidental fixes along
>> the way:
>>
>> 1/9 adds a function to drivers/base/swnode.c unwinding arrays of software
>> nodes in reverse order
>>
>> 2/9 uses that function in lib/test_printf.c
>>
>> 3/9 fixes what seems to me to be a bug in the existing swnode.c code in
>> that software_node_get_next_child() does not increase the refcount of the
>> returned node (in contrast to, for example, of_get_next_child_node() which
>> does increase the count)
>>
>> 4/9 adds the fwnode_graph*() family of functions to the software_node
>> implementation
>>
>> 5/9 adds a T: entry to MAINTAINERS for the ipu3-cio2 driver
>>
>> 6/9 renames the ipu3-cio2.c file to ipu3-cio2-main.c and fixes Makefile
>> to accommodate that change
>>
>> 7/9 alters the ipu3-cio2 driver to check if the pci_dev's fwnode is a
>> software_node and pass flags to fwnode_graph_get_endpoint_by_id() if so
>>
>> 8/9 alters match_fwnode() in v4l2-async.c to additionally try to match on
>> a fwnode_handle's secondary if the primary doesn't match
>>
>> 9/9 alters the ipu3-cio2 driver to do the actual building of software_node
>> connections between the sensor devices and the cio2 device.
>>
>> This is still not ready for integration - hence the RFC label - as there
>> is ongoing work to extend the ipu3-cio2 driver further to parse ACPI
>> to discover resources such as regulators and GPIOs that are defined there
>> in unusual ways and map them to the sensor devices so that their drivers
>> can consume them transparently through the usual frameworks. Given this
>> has changed quite extensively from v2 though, I wanted to submit it for
>> feedback at this point in case it needs further large scale change.
> I would appreciate it if you posted the next version of this series
> (all patches) to linux-acpi@vger.kernel.org for easier review.
>
> Thanks!
Sure thing, I'll make sure to add that list to next version

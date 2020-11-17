Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 034A82B5ECD
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 13:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbgKQMCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 07:02:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbgKQMCD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 07:02:03 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8081C0613CF;
        Tue, 17 Nov 2020 04:02:02 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id u12so15689479wrt.0;
        Tue, 17 Nov 2020 04:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FJtioFJbd5nxXYxwlEc0zZcWxs2yFJwIULJZ0UgOrKo=;
        b=pRFRW3O9NGmppCka9bCNSqpILJF9CPN5IXNSD+FCPfkzLcWx6voAc6p2DDk0iFZd7n
         vHWXTVRmjnnUB0lK0x200o/Sv0hqLP3vXzTawpfgLB5G33GVXWOupvfil4dEy75r7Dgj
         43MXd09cB6JWY60SiV4kEQxRbpiw3Z3umAakv+LykOJh5Ay9g6rbHYM70jLy6otnMICT
         uv95f1VaLPT7keYEsANCu2ErJ9Yruh/EQaKDO+E2vxwCZ2VfQUk9nc6ocudc06rhFZFo
         9GKOcvxgstvDZWdp+Sk+5ASDBmJjfIcfHCMshj7ao6JvMeP4VWjtLLx4MPGfN6WKyvUp
         iV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FJtioFJbd5nxXYxwlEc0zZcWxs2yFJwIULJZ0UgOrKo=;
        b=K4DboQt/itBbYJW2kGlhbQx+JED4AbQABO2G1t/jJL6IJOR/inKZNX+X4UjM0j1gcN
         5bzYRVTAPViNp++9ftXxmJF4xs8DuBOVouaXM56j/Dy67utfUwhN/QcvbZ8porwvXSNX
         qgGsMmSA4raFahATkZ6oI1Dh9Q0Bdc0EDTwM/0luFP9aqRY9lUXiP0AVNgoRDINa4S1v
         ZWG5QUz/mfAFDg71RYfMfCjha2s1HQFRU/RF2MFiXFfHXggWpzcsXo5++zTeKxktRu6q
         eWnlABNeX74KpjD+Mtx0Sm528Et/J1B411ZsqyXfjg/ITb6RnhyaeWb8P4CDo1ldkQxh
         Hevg==
X-Gm-Message-State: AOAM533r53Ksssoa+6pr1DqC3u7INrcJXQWmDU6A2i77+W01n+eRlsZ4
        XsGDeAWZ6aC19OZ2W2URkAY=
X-Google-Smtp-Source: ABdhPJzCsOHInE8e78d8f4Sh1xeqEz9NeoUlbRQ2wIQEP6vJd8F4BeyIA+uRdO2QlJg7nLDUIYz//Q==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr24929705wrq.294.1605614521377;
        Tue, 17 Nov 2020 04:02:01 -0800 (PST)
Received: from [192.168.1.211] ([2.31.225.98])
        by smtp.gmail.com with ESMTPSA id n15sm27328823wrq.48.2020.11.17.04.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 04:02:00 -0800 (PST)
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Petr Mladek <pmladek@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tsuchiya Yuto <kitakar@gmail.com>
References: <20201029212930.GE15024@pendragon.ideasonboard.com>
 <20201029222215.GI4077@smile.fi.intel.com>
 <20201029225124.GI15024@pendragon.ideasonboard.com>
 <60b36af2-ad57-000b-76e4-379e1b58a3a0@gmail.com>
 <20201113162231.GO7524@pendragon.ideasonboard.com>
 <CAHp75VeGJKMeY-reNWgypVzJ6Myz5S2RXJPHqbPH5kzLYX3G4g@mail.gmail.com>
 <20201116085349.GA6540@pendragon.ideasonboard.com>
 <CAHp75Ve-O4u1B=dvC+HT-sg=YnoWSuV6kUkPmBSOx4w9OgoOoA@mail.gmail.com>
 <20201116141038.GJ6540@pendragon.ideasonboard.com>
 <3646e11c-a101-74e3-2eb4-7abf29937e9d@gmail.com>
 <20201116161636.GC4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <3976eac8-2a21-a619-1dba-85212ac4b4b1@gmail.com>
Date:   Tue, 17 Nov 2020 12:01:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116161636.GC4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/11/2020 16:16, Andy Shevchenko wrote:
> On Mon, Nov 16, 2020 at 02:15:01PM +0000, Dan Scally wrote:
>> On 16/11/2020 14:10, Laurent Pinchart wrote:
>>> I thought we were looking for ACPI devices, not companion devices, in
>>> order to extract information from the DSDT and store it in a software
>>> node. I could very well be wrong though.
>> This is correct - the code to fetch the various resources we're looking
>> at all uses acpi_device. Whether using Andy's iterator suggestions or
>> previous bus_for_each_dev(&acpi_bus_type...) I'm just getting the
>> acpi_device via to_acpi_dev() and using that.
> If you try to get an I²C ore SPI device out of pure ACPI device (with given
> APCI _HID) you will fail. So, it's not correct. You are retrieving companion
> devices, while they are still in the struct acpi_device.
>
> And don't ask me, why it's so. I wasn't designed that and didn't affect any
> decision made there.

Well, in terms of the actual device we're getting, I don't think we're
fundamentally doing anything different between the methods...unless I'm
really mistaken.


Originally implementation was like:


const char *supported_devices[] = {

        "OVTI2680",

};


static int cio2_bridge_connect_supported_devices(void)

{

        struct acpi_device *adev;

        int i;

        for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {

                adev =
acpi_dev_get_first_match_dev(supported_devices[i], NULL, -1);

...

}


and acpi_dev_get_first_match_dev() likewise just returns adev via
to_acpi_device(dev).


So, maybe we don't need to do the iterating over all devices with
matching _HID at all, in which case it can be dropped, but if we're
doing it then I can't see that it's different to the original
implementation in terms of the struct acpi_device we're working with or
the route taken to get it.


Either way; ACPI maintainers asked to be CC'd on the next patchset
anyway, so they'll see what we're doing and be able to weigh in.




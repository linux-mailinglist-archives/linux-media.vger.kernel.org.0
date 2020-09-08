Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7802623AE
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 01:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbgIHXlk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 19:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgIHXlj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 19:41:39 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7AEC061573
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 16:41:38 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id m6so979525wrn.0
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 16:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rzApPXn2JqQGNuGQ+osVtnaQFzgNYcS+CWlBAxxdKiI=;
        b=jcY4vXJzDsd0Tmt2w3ifh8MACMwPObBKhqotLxVXDR4k3AyL2jCMF4UHegFl8Mjp67
         y1DY/8CzmX5ShSRvLzJSq1UFcyVLN/eaFpcsfB0C1kpR0ZWGBdI9mKc6WJbQrdJK4hT5
         vAAzMCTyHglTK4f3k+fm3JWOd4I7002g6U67uA4LtK3PNt0mptIjN2mIaR1ZJhhoSSIb
         9XYuScI6F3JO3/6tmHZUHJ+UdYsU/4YUyzpkel+PSDjWueK5qyLp6DgxCvGKdpKS7m68
         8izMu4A0Ykhx/ysJGOGHttMJpyWOL/alVRsTTIG0wtzyE1hgGvQsnrWSFT7v3r780mUF
         JJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rzApPXn2JqQGNuGQ+osVtnaQFzgNYcS+CWlBAxxdKiI=;
        b=uH9nwt8F6F59JpgDrV+DAwxXet1ilZcluwB7UNdG2i/+KybT9JlsznfEx6N+abJusz
         HrWF+aBR5HHyjGoqYNAIo/vV3ZtzvvY4M/r1MrUTmWVq6ug+BmcmO1XVKrfje6O5fbU3
         4idYLuJR03yTtx7bOq7XU1bopS/ZIIrvzBsEib5aqulqOAW+kpBPw5AG4Yx3jdvcndN/
         D1Z7QlZCLjupXyK0bxb4DyqQLgvYkDKrgV4X2PNyKXj2NselhstqwCuMSwo0bUMTJwtc
         am/K3Mw+5UBy9HYzpBJ4PIkbttx3rqXxbQFigTU5LGhvQWE150cNgmjVZ97F94Yl5XxD
         KPuQ==
X-Gm-Message-State: AOAM532hd+i2RZ85Iptm6rcemYOCtN1TcNkcv2KEAQs7JRcq/lJmsFpk
        o8cvyFASGjHoBVmtIUkpzhQ=
X-Google-Smtp-Source: ABdhPJyPIodWGbI6TVDLWiAaLVxfwiOiIMM5rzgBA4Hpvu9UCs2unU4dI0247I/LVN55mH9e+JP9pQ==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr667556wrw.331.1599608497437;
        Tue, 08 Sep 2020 16:41:37 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id n4sm1199208wmd.26.2020.09.08.16.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 16:41:36 -0700 (PDT)
Subject: Re: [PATCH] media: ipu3: add a module to probe sensors via ACPI
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Jordan Hand <jorhand@linux.microsoft.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>
References: <12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org>
 <20200517103659.GS17578@paasikivi.fi.intel.com>
 <20200520094400.5137e7f2@coco.lan>
 <20200520082608.GV20066@paasikivi.fi.intel.com>
 <20200520131830.3ff45919@coco.lan>
 <CAHp75VduEGyzobm0hkXzWmFfZb-uMAEWG-wc89b7M7zVzZ_4LA@mail.gmail.com>
 <20200522115736.10cca8eb@coco.lan>
 <20200526143110.GC3284396@kuha.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <2d4f1abb-c617-476a-1005-0ed91906a5f5@gmail.com>
Date:   Wed, 9 Sep 2020 00:41:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200526143110.GC3284396@kuha.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heikki

On 26/05/2020 15:31, Heikki Krogerus wrote:
> On Fri, May 22, 2020 at 11:57:36AM +0200, Mauro Carvalho Chehab wrote:
>> Em Thu, 21 May 2020 11:00:19 +0300
>> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
>>
>>> +Cc: Heikki (swnode expert)
>>>
>>> On Wed, May 20, 2020 at 2:19 PM Mauro Carvalho Chehab
>>> <mchehab+huawei@kernel.org> wrote:
>>>> Em Wed, 20 May 2020 11:26:08 +0300
>>>> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
>>>
>>> ...
>>>
>>>> As I said, the problem is not probing the sensor via ACPI, but, instead,
>>>> to be able receive platform-specific data.
>>>
>>> There is no problem with swnodes, except missing parts (*).
>>> I have Skylake laptop with IPU3 and with half-baked ACPI tables, but
>>> since we have drivers in place with fwnode support, we only need to
>>> recreate fwnode graph in some board file to compensate the gap in
>>> ACPI.
>>>
>>> *) Missing part is graph support for swnodes. With that done it will
>>> be feasible to achieve the rest.
>>> I forgot if we have anything for this already done. Heikki?
>>
>> Hmm... I guess I should try this approach. I never heard about swnodes
>> before. Do you have already some patch with the needed swnodes setup,
>> and the missing parts to recreate the fwnode graph?
> 
> Here you go. I tested it with this code:
> 
>          static const struct software_node nodes[];
> 
>          static const struct property_entry ep0_props[] = {
>                 PROPERTY_ENTRY_REF("remote-endpoint", &nodes[5]),
>                 { }
>          };
> 
>          static const struct property_entry ep1_props[] = {
>                 PROPERTY_ENTRY_REF("remote-endpoint", &nodes[2]),
>                 { }
>          };
> 
>          static const struct software_node nodes[] = {
>                 { "dev0" },
>                 { "port0", &nodes[0] },
>                 { "endpoint", &nodes[1], ep0_props },
>                 { "dev1" },
>                 { "port0", &nodes[3] },
>                 { "endpoint", &nodes[4], ep1_props },
>                 { }
>          };
> 
>          void test(void)
>          {
>                  const struct software_node *swnode;
>                  struct fwnode_handle *fwnode;
> 
>                  software_node_register_nodes(nodes);
> 
>                  fwnode = fwnode_graph_get_remote_port_parent(software_node_fwnode(&nodes[5]));
>                  swnode = to_software_node(fwnode);
>                  printk("first parent: %s\n", swnode->name);
> 
>                  fwnode = fwnode_graph_get_remote_port_parent(software_node_fwnode(&nodes[2]));
>                  swnode = to_software_node(fwnode);
>                  printk("second parent: %s\n", swnode->name);
> 
>                  software_node_unregister_nodes(nodes);
>          }
> 
> thanks,
> 

One of the problems we're having trying to build (using the changes you 
attached here) a module to connect sensors to the cio2 infrastructure is 
that we can't unload it cleanly. There seems to be a couple of reasons 
for that; but one of them is that cio2_parse_firmware() in ipu3-cio2.c 
ticks up the refcount for fwnode_handles of the ports for the CIO2 
device by calling software_node_graph_get_next_endpoint() once per 
_possible_ cio2 port; each time that happens it gets a reference to the 
port's fwnode_handle but doesn't release it.

This isn't really a patch as such, since I don't think the changes you 
attached are actually applied either upstream or in the media_tree git 
(what are the plans in that regard, by the way? Will that patch be sent 
upstream at some point?) so there's nowhere to apply it to, but I think 
something like the below fixes it.

What do you think?

Regards,
Dan

---
diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 3667467196f0..62a1e3de8cb3 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -584,7 +584,9 @@ software_node_graph_get_next_endpoint(const struct 
fwnode_handle *fwnode,
                 endpoint = software_node_get_next_child(port, old);
                 fwnode_handle_put(old);
                 if (endpoint)
-                       break;
+                       break;
+               else
+                       fwnode_handle_put(port);
         }

         fwnode_handle_put(port);

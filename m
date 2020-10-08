Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D945F287E56
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 23:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgJHVvu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 17:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgJHVvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 17:51:50 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16C0C0613D2;
        Thu,  8 Oct 2020 14:51:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n15so8180396wrq.2;
        Thu, 08 Oct 2020 14:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CzkX0o1TFXjuNFe3SxG4ZhdSwy1MaPEjifCYlNjupuk=;
        b=QCezLizVY8aoFDyzXwa2ZrvFoiWm9YVC35aDeDbemU0Ewy12CLki1k/c3gn0T1naCk
         yjNwqLJ8y53QN94LqmtOWZWkdAqhvFwmqBmsCTuzPiyv5D4QMnYHrxKLZFG4IvT/4RXz
         dAgvEeuHQNzMRTMdviY3E7L4b6euW094EovWE9+nMXg1pHaL/YJBaYOF5LbVvVKTiPOM
         /y+7jkEVbiERJ6Tl7hiksX+O0owksjXREA0PGrydjW4Quv6enNtjTGoaeMUT0u/JdGD9
         RCLRebPSw4HpxRnUGlwm41dCTReoTA77AvNDmq+oX6saMO4yvRk9lcOWx3pCuFQriRWD
         SE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CzkX0o1TFXjuNFe3SxG4ZhdSwy1MaPEjifCYlNjupuk=;
        b=IFUhdOmqWc01glEobrIPSyzIQJkJq7qudvzBFUBpGBRPp4FEQmkhiBgUVmho0wNfxx
         PU33Npx7mWv27z9wy+NmvQNl17CHh9S8VnH1ZfiNdOb626OLpcuppKWB+7CBEHHU9bpj
         Qb5ls2kDt4olgv6tKpnKrN/ttJ4RnSsMKlpEjimNyHmuinC+AsaqSraNxmlFbrvr3IFo
         PTDRCEKLJtmtQqMI40+Bc+okNRBJmduKneTTGgXrkCzO9uBWc2wetwGMZsxgrMJeCLm3
         hFAlgl3RRadf1hzHLK3ycLUIUMSK7Q5caQBJZUaf8ws9tUJxLxrFP9tByooZ7TNxRgyF
         9KuA==
X-Gm-Message-State: AOAM530G25LkY2eiQJrBucZ/brQZskBPkYHyERPVlmnWsiNpzmvUQlRZ
        jO/eOiaDWks03wOnFR0WAgY=
X-Google-Smtp-Source: ABdhPJzSDEz2+5HdjIiZXq5nLL8KnOFBmQq/NwUxSzsc2MRjrh10+UDbvaSlr/+RyA0r8937rvrsLg==
X-Received: by 2002:adf:a418:: with SMTP id d24mr11429546wra.80.1602193908565;
        Thu, 08 Oct 2020 14:51:48 -0700 (PDT)
Received: from [192.168.1.158] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id a7sm8743775wmh.6.2020.10.08.14.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 14:51:47 -0700 (PDT)
From:   Dan Scally <djrscally@gmail.com>
Subject: Re: [RFC PATCH v2] Add functionality to ipu3-cio2 driver allowing
 software_node connections to sensors on platforms designed for Windows
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        davem@davemloft.net, robh@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        kieran.bingham@ideasonboard.com, dan.carpenter@oracle.com
References: <20201001093326.6208-1-djrscally@gmail.com>
 <20201001173745.GJ3956970@smile.fi.intel.com>
Message-ID: <b27bc66c-4cb7-0dcc-a828-3aca4f0738db@gmail.com>
Date:   Thu, 8 Oct 2020 22:51:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001173745.GJ3956970@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy - sorry for delayed reply, busy week

On 01/10/2020 18:37, Andy Shevchenko wrote:
> On Thu, Oct 01, 2020 at 10:33:26AM +0100, Daniel Scally wrote:
>
> Awesome work!
> My, almost minor, comments below.
Thanks as always for your help - great comments. I'll work through and
make the changes you suggest to this code and also...
>> * Built against media_tree instead of linus's tree - there's no T: entry in
>> maintainers for the ipu3-cio2 driver but I see there're recent changes in 
>> media_tree so thought this was the better option.
> Make sense to include T: entry as well (maybe as a separate patch).

...I agree with your other email re. turning this into a series and
making the additional changes you suggested, so I'll do that too for the v3.


Just a couple comments / queries:

>> +// SPDX-License-Identifier: GPL-2.0
> Author line perhaps?

You mean literally just like /* Authored By: Dan Scally */ or something?
OK, no problem.

>> +static const struct ipu3_sensor supported_devices[] = {
>> +	IPU3_SENSOR("INT33BE", "INT33BE:00"),
>> +	IPU3_SENSOR("OVTI2680", "OVTI2680:00"),
>> +	IPU3_SENSOR("OVTI5648", "OVTI5648:00")
> In such cases please leave comma at the last item as well. Easier to extend w/o
> an additional churn.
>
> On top of that, please avoid putting *instance* names, i.e. the second
> parameters in your macro call. What code should do is to take _HID (first
> parameter) and call acpi_dev_match_first_dev() or so.
Yeah I was originally using the i2c_client's name field (this comes into
play during cio2_bridge_reprobe_sensor()) but the matching refused to
work using anything but a string literal. Let me take another look at
this then.
>> +static struct software_node cio2_hid_node = { CIO2_HID, };
> Here, nevertheless, comma can be removed, since update will need to change
> entire line anyway.
Trailing commas where lists can be extended, otherwise none - got it.
>> +static int read_acpi_block(struct device *dev, char *id, void *data, u32 size)
>> +{
>> +	union acpi_object *obj;
>> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>> +	struct acpi_handle *handle = ACPI_HANDLE(dev);
>> +	acpi_status status;
>> +	int ret;
>> +
>> +	status = acpi_evaluate_object(handle, id, NULL, &buffer);
>> +	if (ACPI_FAILURE(status))
>> +		return -ENODEV;
>> +
>> +	obj = buffer.pointer;
>> +	if (!obj || obj->type != ACPI_TYPE_BUFFER) {
> !obj case doesn't require freeing and I would say the error message can be
> amended in such case.
Oops - you suggested that in the last version too and I missed it, sorry
about that. I'll split those two failure modes out.
>> +		for (j = 4; j >= 0; j--)
>> +			software_node_unregister(&sensor->swnodes[j]);
> Seems we may need a simple helper for this (test_printf.c has similar case),
> so, what about do it here for now and probably then move to somewhere like
> swnode.h or whatever holds it.
>
> static inline software_node_unregister_nodes_reverse(const struct software_node *nodes)
> {
> 	unsigned int i = 0;
>
> 	while (nodes[i].name)
> 		i++;
> 	while (i--)
> 		software_node_unregister(&nodes[i]);
> }
Yeah this is a good idea; I see you suggest a new patch for it in your
other email; I'll do a series in the future and add this to the swnode
source file at the same time as doing the changes that you, Heikki and
Sakari suggested for the other patch.
>> +#define __NO_VERSION__
> What is this for?

Somehow I got on the outdated page for compiling modules spanning
multiple files in the linux kernel module programming guide; it's
suggested there but not in the newer version. I shall remove it.

>> +	struct device *dev;
>> +	struct software_node swnodes[6];
>> +	struct property_entry dev_props[3];
>> +	struct property_entry ep_props[4];
>> +	struct property_entry cio2_props[3];
> I'm now wondering why you can't simply put properties directly to here and do
> that kcalloc / memcpy() in few functions? I mean to drop those calls and assign
> properties directly. You even won't need to memset() and stack for them!
I thought you were hinting that I should use kcalloc in the comments
from the last patch to get an array of zero valued entries but I guess I
misunderstood - I can just memset these arrays to 0 and assign all but
the last entry directly and that seems to work fine, so I'll switch to that.
>>  	struct cio2_device *cio2;
>> +	struct fwnode_handle *endpoint;
>>  	int r;
> Reverse xmas tree order.
TIL - thanks, I'll do a pass over the rest of it and make sure that I
follow that everywhere else too
>> +	endpoint = fwnode_graph_get_next_endpoint(pci_dev->dev.fwnode, NULL);
> dev_fwnode()
I avoided that thinking there might be a case where a CIO2 device has a
fwnode but not endpoints defined for some reason, but I'm not familiar
enough to judge whether that situation will ever occur - if it's safe to
do it that way then I'll switch it over.

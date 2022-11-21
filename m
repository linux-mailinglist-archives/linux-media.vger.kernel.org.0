Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD6D2631E2D
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 11:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbiKUKX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 05:23:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbiKUKXW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 05:23:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1307B8D497
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 02:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669026142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qzDBJJDFwUqlhrNShM9qgxfOwTQm/GVZHOvM0irKBS0=;
        b=L7iPqNgU5vbCUaJtgEq/WCoTi6Oq0vVZiAo7MYmuzXPtUoZwe9YFk9wwxsSkVSiD1Kl4eZ
        MUD5u0UHQNbAz2tfe2rPPKStexEqDIqMNvmfvJV3x6EWJlNPBwhsozXabtDxvdhA9GG2LB
        L/3WTyhTpjyH/sGDb78Nh+aVNNpCOXw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-CJ9A1Qf4P5yvbNJHltKEqw-1; Mon, 21 Nov 2022 05:22:20 -0500
X-MC-Unique: CJ9A1Qf4P5yvbNJHltKEqw-1
Received: by mail-ed1-f71.google.com with SMTP id c9-20020a05640227c900b00463de74bc15so6587512ede.13
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 02:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzDBJJDFwUqlhrNShM9qgxfOwTQm/GVZHOvM0irKBS0=;
        b=g0+8xBcdNuqhcxJ9mFpehXVSAGPV6jOyaJrw0jjmpGql+yRbxIYN0/Ht7W0bQQXOSL
         +m5kkUg7FKZV50LWZCq4H35h/nFJ69GhZIunzwM1UK+iryKUP6/BvK974+z5nGLa3jtb
         FkE38hV97e9/OYRRxncilmyLEhaHAUuEC6Neqge4J5nEnLeOrTWT5u0A/dUkXIYVvHdR
         rEP8ShyS6AChk7n7ebS5+/4W9fCuSew5SAyFzNFja0Zx+zVPArk7jiEZEVZGdBeDwLLJ
         QnOga5137tDelCcSU48a445FZSmcnWeskbtp6RhJvMud2sJufC1cUzYJBUuDTfzV+x7t
         ukbA==
X-Gm-Message-State: ANoB5pnrGKSMhRGWzDBGPm57nEc4as/FUHZCg+AhUMnOi270V2p0gW2S
        gdjSTLMhUMIHE39GQGlg05BO9Tcd3Xnf39Ql6KYHn4fDz5jBJeHTxE9SiPmwImMtxxLriVtjZQE
        /EwrOxVUuZiuvIKVbJsEAe5I=
X-Received: by 2002:a17:906:924e:b0:782:2d3e:6340 with SMTP id c14-20020a170906924e00b007822d3e6340mr14741822ejx.234.1669026138873;
        Mon, 21 Nov 2022 02:22:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50nYt1yIoskFhFPv3lbI3vM3MNnoLkDx/09/aG9St5lj8sQUonp2g3/FuBQlF7HnjuFedAyg==
X-Received: by 2002:a17:906:924e:b0:782:2d3e:6340 with SMTP id c14-20020a170906924e00b007822d3e6340mr14741814ejx.234.1669026138683;
        Mon, 21 Nov 2022 02:22:18 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id fe4-20020a056402390400b0046856c307d0sm5048685edb.5.2022.11.21.02.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:22:18 -0800 (PST)
Message-ID: <93eb74bf-58c4-1a77-af2f-3a0df4404acf@redhat.com>
Date:   Mon, 21 Nov 2022 11:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 2/4] media: ipu3-cio2: Convert to use
 software_node_register_node_group()
Content-Language: en-US
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
References: <20221118185617.33908-1-andriy.shevchenko@linux.intel.com>
 <20221118185617.33908-2-andriy.shevchenko@linux.intel.com>
 <2c69ae41-7920-1438-8bfc-8581aad0ee00@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2c69ae41-7920-1438-8bfc-8581aad0ee00@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 11/21/22 11:19, Dan Scally wrote:
> Hi Andy
> 
> On 18/11/2022 18:56, Andy Shevchenko wrote:
>> The currently used software_node_register_nodes() is going to
>> be removed. Prepare driver by switchich to new API.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
> 
> 
> Also looks good to me:
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Any chance you can also give this series a test run on an IPU3 device to
ensure that it does not cause regressions ?

Regards,

Hans



> 
>>   drivers/media/pci/intel/ipu3/cio2-bridge.c | 21 ++++++++++++++++++---
>>   drivers/media/pci/intel/ipu3/cio2-bridge.h |  5 +++--
>>   2 files changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
>> index 18974a72e94a..dfefe0d8aa95 100644
>> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
>> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
>> @@ -195,6 +195,19 @@ static void cio2_bridge_init_swnode_names(struct cio2_sensor *sensor)
>>            SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
>>   }
>>   +static void cio2_bridge_init_swnode_group(struct cio2_sensor *sensor)
>> +{
>> +    struct software_node *nodes = sensor->swnodes;
>> +
>> +    sensor->group[SWNODE_SENSOR_HID] = &nodes[SWNODE_SENSOR_HID];
>> +    sensor->group[SWNODE_SENSOR_PORT] = &nodes[SWNODE_SENSOR_PORT];
>> +    sensor->group[SWNODE_SENSOR_ENDPOINT] = &nodes[SWNODE_SENSOR_ENDPOINT];
>> +    sensor->group[SWNODE_CIO2_PORT] = &nodes[SWNODE_CIO2_PORT];
>> +    sensor->group[SWNODE_CIO2_ENDPOINT] = &nodes[SWNODE_CIO2_ENDPOINT];
>> +    if (sensor->ssdb.vcmtype)
>> +        sensor->group[SWNODE_VCM] =  &nodes[SWNODE_VCM];
>> +}
>> +
>>   static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
>>                             struct cio2_sensor *sensor)
>>   {
>> @@ -219,6 +232,8 @@ static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
>>       if (sensor->ssdb.vcmtype)
>>           nodes[SWNODE_VCM] =
>>               NODE_VCM(cio2_vcm_types[sensor->ssdb.vcmtype - 1]);
>> +
>> +    cio2_bridge_init_swnode_group(sensor);
>>   }
>>     static void cio2_bridge_instantiate_vcm_i2c_client(struct cio2_sensor *sensor)
>> @@ -252,7 +267,7 @@ static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
>>         for (i = 0; i < bridge->n_sensors; i++) {
>>           sensor = &bridge->sensors[i];
>> -        software_node_unregister_nodes(sensor->swnodes);
>> +        software_node_unregister_node_group(sensor->group);
>>           ACPI_FREE(sensor->pld);
>>           acpi_dev_put(sensor->adev);
>>           i2c_unregister_device(sensor->vcm_i2c_client);
>> @@ -310,7 +325,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>>           cio2_bridge_create_fwnode_properties(sensor, bridge, cfg);
>>           cio2_bridge_create_connection_swnodes(bridge, sensor);
>>   -        ret = software_node_register_nodes(sensor->swnodes);
>> +        ret = software_node_register_node_group(sensor->group);
>>           if (ret)
>>               goto err_free_pld;
>>   @@ -337,7 +352,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>>       return 0;
>>     err_free_swnodes:
>> -    software_node_unregister_nodes(sensor->swnodes);
>> +    software_node_unregister_node_group(sensor->group);
>>   err_free_pld:
>>       ACPI_FREE(sensor->pld);
>>   err_put_adev:
>> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
>> index 4418cbd08208..b93b749c65bd 100644
>> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
>> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
>> @@ -117,8 +117,9 @@ struct cio2_sensor {
>>       struct acpi_device *adev;
>>       struct i2c_client *vcm_i2c_client;
>>   -    /* SWNODE_COUNT + 1 for terminating empty node */
>> -    struct software_node swnodes[SWNODE_COUNT + 1];
>> +    /* SWNODE_COUNT + 1 for terminating NULL */
>> +    const struct software_node *group[SWNODE_COUNT + 1];
>> +    struct software_node swnodes[SWNODE_COUNT];
>>       struct cio2_node_names node_names;
>>         struct cio2_sensor_ssdb ssdb;
> 


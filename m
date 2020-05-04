Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D9A1C472F
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 21:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgEDTmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 15:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726111AbgEDTmx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 15:42:53 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A902C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 12:42:52 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x4so815826wmj.1
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 12:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=4gYAMTiV3t9IL/e7vqft5QB0q0SaB2TNG/3puO8rXnE=;
        b=ZrpiJlXLh7rPI4M+EHlIMN3aE7+9hnwz4wlkocRfECY0ZKc9bTaaKkdGhZnUdP4Ogz
         0tIbGtfhul1X9Vwy7ChT2pQjcW3khMIFzZGLyJOVoW5vHMiBex58AlMXLJ3R0xtclm/W
         Yh2Ptmt0Wy67f6md56T+1DdcVKsOQg43mMWEEcsizYkQdpDJXdgFr85Gnlehz5yDtU+g
         UTplYe7QSacBjzOHonJmKYVoYNQQaOfidBQ8C8MZ8YlOhOApad+msYFcHDYxcYgggxrr
         ZfIa9fz5sjIKoc1PFlCRXOLkOAO7zXAmyqnQg31iTPUYfJ3zjoAAMoqaXYMZwz/hOiGf
         djYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=4gYAMTiV3t9IL/e7vqft5QB0q0SaB2TNG/3puO8rXnE=;
        b=QRN4fN546wx9yksJKW2057E1/CuJQA4bSY272DRULIblhwYDCLGNvUZ1EC0efiwZdr
         4tB/gzUrMBItLXZGgKpDWgsZCe4o2WMtLFOl25VU3mP9kU3cnqLH2SpVbCiXnUgYK2KV
         UGNM3TrOAa6TWwzVqk501LATHaVg/bWNwBUJBiL4rBzjq9JlRbk/cRdD3JSKH+pVObVF
         ZI/afKXIRwzYGX7q+KoZS+nvY3Mv8Ugxhe8Rhgy4uzsPUH56g9IPcIhbKxnrHOa+8Hv7
         fOsvJDLvn7M+Gom2ZpI2FouenXXbIiu6G4RlSFoTo4jaZ3QZIpJk4VGPo0/Xjr5SzDGl
         n4qQ==
X-Gm-Message-State: AGi0PuYqmEF7QPj3xdRyNMNLOELXd2Vw6HscGsjeZY2XRucjhPGQtDlD
        sUWyd46HeFoDIbWM9I2wGATCHw==
X-Google-Smtp-Source: APiQypLbbSqM1SDKEKCDcYCvkiByNIyiJD7ilEhQ3OxeiX6qgxBh/FljkqcwJY32/Ac5/o+zsZ4VNg==
X-Received: by 2002:a1c:35c3:: with SMTP id c186mr17305011wma.66.1588621371308;
        Mon, 04 May 2020 12:42:51 -0700 (PDT)
Received: from PhilsPB.lan ([86.12.207.65])
        by smtp.gmail.com with ESMTPSA id f83sm657279wmf.42.2020.05.04.12.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 12:42:50 -0700 (PDT)
Subject: Re: [PATCH v2 30/34] staging: vchiq_arm: Give vchiq children DT nodes
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-31-laurent.pinchart@ideasonboard.com>
 <ccd8ad49a699d9f8a4d77577eb76b4b281b17843.camel@suse.de>
From:   Phil Elwell <phil@raspberrypi.com>
Message-ID: <8e062f07-c151-6273-4c25-e541f6df1bb0@raspberrypi.com>
Date:   Mon, 4 May 2020 20:42:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ccd8ad49a699d9f8a4d77577eb76b4b281b17843.camel@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On 04/05/2020 18:12, Nicolas Saenz Julienne wrote:
> Hi Phil, Laurent,
> 
> On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
>> From: Phil Elwell <phil@raspberrypi.com>
>>
>> vchiq kernel clients are now instantiated as platform drivers rather
>> than using DT, but the children of the vchiq interface may still
>> benefit from access to DT properties. Give them the option of a
>> a sub-node of the vchiq parent for configuration and to allow
>> them to be disabled.
>>
>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>> ---
>>   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index dd3c8f829daa..2325ab825941 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -2734,12 +2734,20 @@ vchiq_register_child(struct platform_device *pdev,
>> const char *name)
>>   	pdevinfo.id = PLATFORM_DEVID_NONE;
>>   	pdevinfo.dma_mask = DMA_BIT_MASK(32);
>>   
>> +	np = of_get_child_by_name(pdev->dev.of_node, name);
>> +
>> +	/* Skip the child if it is explicitly disabled */
>> +	if (np && !of_device_is_available(np))
>> +		return NULL;
> 
> I think this is alright, although I'd reshufle the code a little so it looks
> nicer:
> 
> +	/* Skip the child if it is explicitly disabled */
> +	np = of_get_child_by_name(pdev->dev.of_node, name);
> +	if (np && !of_device_is_available(np))
> +		return NULL;

I prefer the original.

>>   	child = platform_device_register_full(&pdevinfo);
>>   	if (IS_ERR(child)) {
>>   		dev_warn(&pdev->dev, "%s not registered\n", name);
>>   		child = NULL;
>>   	}
>>   
>> +	child->dev.of_node = np;
> 
> Is this really needed? I'd rather have the parent's np (as commented in patch
> 26) as long as this is not a real device-tree defined platform device.

Unless the of_node pointer refers to the sub-node for the child, all children
would have to share a common set of properties, rather defeating the point of the
change.

Phil

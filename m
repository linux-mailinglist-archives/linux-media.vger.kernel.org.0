Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A07283291
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 10:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgJEIwD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 04:52:03 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:45670 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgJEIwD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 04:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601887921; x=1604479921;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rIiIosLA4VGrYp/A3KE5JPx8OOQgdFYeqoT8ZArhhc8=;
        b=GjumZ8wsuQzZI+aaUWrGO0KTk5mvZlbZaTvUAAcjlvyzpuqJ25dj3X2F7bwwjEPu
        Kw62E0KlvfnpYSU413J6Kod+FT2ZBp5mTYV/N/ePYcTxBrJHYK5DmmeWNiQ3O6iF
        vk99cgS/pcT3bK5j57+IDpt/tBtyFyySRNVEsdHE+N8=;
X-AuditID: c39127d2-269ff70000001c25-dd-5f7adeb17a13
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 19.3A.07205.1BEDA7F5; Mon,  5 Oct 2020 10:52:01 +0200 (CEST)
Received: from [172.16.23.108] ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020100510520110-551248 ;
          Mon, 5 Oct 2020 10:52:01 +0200 
Subject: Re: [PATCH v2 4/5] media: mt9p031: Make pixel clock polarity
 configurable by DT
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-4-s.riedmueller@phytec.de>
 <20201001161031.GP26842@paasikivi.fi.intel.com>
 <20201001161111.GQ26842@paasikivi.fi.intel.com>
From:   =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>
Message-ID: <1121fe39-2965-0782-85cc-2dcb9996b978@phytec.de>
Date:   Mon, 5 Oct 2020 10:52:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001161111.GQ26842@paasikivi.fi.intel.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 05.10.2020 10:52:01,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 05.10.2020 10:52:01,
        Serialize complete at 05.10.2020 10:52:01
X-TNEFEvaluated: 1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsWyRoCBS3fjvap4g9+zeSw6Jy5ht7i8aw6b
        Rc+GrawWyzb9YbL4tOUbkwOrx+yOmawem1Z1snnMOxno8XmTXABLFJdNSmpOZllqkb5dAlfG
        s1V2BRNYK95t2cfawDiZpYuRk0NCwETi+sQVjF2MXBxCAtsYJe4vWMAGkhASOM0ocXtKBogt
        LBAlcXjBOtYuRg4OEQF9iUkPzEDqmQUOMUo0dM5mh2i+yiixasUpZpAGNgEnicXnO8AG8QrY
        SMz5CdLMycEioCJx8sk5dpBBogKREjt3WEKUCEqcnPkE7CBOoPKzPxcwQhzXyCSxdL0RhC0k
        cXrxWbDxzALyEtvfzoGyzSTmbX4IZYtL3Hoyn2kCo9AsJGNnIWmZhaRlFpKWBYwsqxiFcjOT
        s1OLMrP1CjIqS1KT9VJSNzECo+DwRPVLOxj75ngcYmTiYAR6moNZSYRXL6wiXog3JbGyKrUo
        P76oNCe1+BCjNAeLkjjvBt6SMCGB9MSS1OzU1ILUIpgsEwenVANj/4Sv8o/8VRuYUyWWHm/g
        ls+z0zVNeJSc/67VS6/wrqrNhlnswSxyVzVXF7GqPuM+VfHTX+1KcCqfzrHIT/bLK0punjJ3
        NmCZckxGlE+j7zPXTa2vr+XOPHy8hrmk7kzNombH3Eusf6uV2e0ZhZnsQ1QUTYP5oh4+WV1S
        lZgQse+Nf/pZHiWW4oxEQy3mouJEADj9DCdwAgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 01.10.20 18:11, Sakari Ailus wrote:
> On Thu, Oct 01, 2020 at 07:10:31PM +0300, Sakari Ailus wrote:
>>> @@ -1079,6 +1094,9 @@ mt9p031_get_pdata(struct i2c_client *client)
>>>   	of_property_read_u32(np, "input-clock-frequency", &pdata->ext_freq);
>>>   	of_property_read_u32(np, "pixel-clock-frequency", &pdata->target_freq);
>>>   
>>> +	pdata->pixclk_pol = !!(endpoint.bus.parallel.flags &
>>> +			       V4L2_MBUS_PCLK_SAMPLE_RISING);
>>
>> Could you document this in DT bindings? And the default, too.
> 
> Please make it a separate patch.

Sure, I'll send a separate patch for the DT bindings.

Regards,
Stefan

> 

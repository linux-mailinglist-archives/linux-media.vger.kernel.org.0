Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2A6474746
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 17:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbhLNQOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 11:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbhLNQOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 11:14:25 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21B7C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 08:14:24 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id z8-20020a05600c220800b0034565e837b6so96719wml.1
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 08:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=IupzqiTOprMwR2B3/yWJktKUpQNfnnD6emk0joRZoCk=;
        b=qZwY9nkfC+T+EfEBVLJsTP3wkCnISXFGxr//yaGCqvgNooaya2AopLqkoVWFZIDpwq
         b2ZB95f7j76tCq674XBO3LxlEOOjhhQJfHih1gOlhTg2oiFIYRqzav38mXG3H+7VCT5l
         TCqqeQCnWT3KS2JaUHTkjnAp7K2mXJq8j51nK/uyhqbObqUwlV0njgWoI5kE88TePGl1
         p+Y2wyVHTyQ9uhkPy5dA8N6SOaPgMgkKb9FtM6MWzafLBgB316H4mszgr1Afvxhp3HPo
         CnO1mcfRhG1jR3cUvvtbbzKyapDjh3Kflm6LKlENehdxl6xvg4GLSjyetN1jkWj/8X1R
         PwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=IupzqiTOprMwR2B3/yWJktKUpQNfnnD6emk0joRZoCk=;
        b=26c4E7TP7Uz4OFfHMT0xLXRSyJnT0qb2KztBH4uZzJ6bIopvgMOP2lobe+G0059kvH
         p2OmUOFC62yYky5RT4Udf+xUXaVzyNV1cAnPniRa/MxFopwzbrxLbOoU1UsMMy+NrkDG
         CW8bQiL7tTrajzfL7rE4JixZ3Don2OiaHrbNqhiKCW16Ew5K32uNbuLXh2QIJWncxwAu
         ftazj8jSxwTXgIAojrAOfv31oiM152d87cbO2RoLBTkLHERB6XFREGK0MyQSrbJDSuTJ
         Xsn8Q0VvVThCNls3gFseACvtSPsgdx9Lzckoq29q3QqSjCxVuZ0+vWShEPqyPCcMmqlv
         rmAA==
X-Gm-Message-State: AOAM532S2op3k+LsrF26z78uU0n66cLmIbV8TWOWOe1fFgJgcHfTS98O
        Bk8Ax/8NnFfYFEh5fwwXbLg=
X-Google-Smtp-Source: ABdhPJyiotZJ5tCuGbuiSgy9mb+Mkg8NCKOSyqZ9tkSYWuzPTTZ0DKMQA8VE1y8z1Y2T0qshBLrV2Q==
X-Received: by 2002:a7b:cf02:: with SMTP id l2mr48303608wmg.78.1639498463466;
        Tue, 14 Dec 2021 08:14:23 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id n14sm351421wrf.69.2021.12.14.08.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 08:14:22 -0800 (PST)
Subject: Re: [PATCH 3/5] media: entity: Skip non-data links in graph iteration
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-4-djrscally@gmail.com>
 <Ybixw0dIZyC6wQL4@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <955c5e8e-d898-9987-4f21-f7dacb6b178e@gmail.com>
Date:   Tue, 14 Dec 2021 16:14:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybixw0dIZyC6wQL4@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 14/12/2021 15:01, Sakari Ailus wrote:
> Hi Daniel,
>
> On Mon, Dec 13, 2021 at 11:28:47PM +0000, Daniel Scally wrote:
>> When iterating over the media graph, don't follow links that are not
>> pad-to-pad links.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes since the rfc:
>>
>> 	- new patch
>>
>>  drivers/media/mc/mc-entity.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index d79eb88bc167..aeddc3f6310e 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -325,6 +325,14 @@ static void media_graph_walk_iter(struct media_graph *graph)
>>  
>>  	link = list_entry(link_top(graph), typeof(*link), list);
>>  
>> +	/* If the link is not a pad-to-pad link, don't follow it */
> This comment should mention data links, not pad-to-pad links.


I wondered about the terminology of this actually...since we create
those links with media_create_pad_link(), and they're called pad-to-pad
links in the documentation [1], but in other cases called data links. Do
we need to fix those other references too?



[1] https://www.kernel.org/doc/html/v5.0/media/kapi/mc-core.html#links

>
> Seems fine apart from this.
>
>> +	if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) != MEDIA_LNK_FL_DATA_LINK) {
>> +		link_top(graph) = link_top(graph)->next;
>> +		dev_dbg(entity->graph_obj.mdev->dev, "walk: skipping %s link\n",
>> +			link_type(link));
>> +		return;
>> +	}
>> +
>>  	/* The link is not enabled so we do not follow. */
>>  	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
>>  		link_top(graph) = link_top(graph)->next;

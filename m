Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88C01747598
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 17:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbjGDPt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 11:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjGDPtz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 11:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B751E75
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688485750;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s/hoZm+omuA7hP/LWvTe8bCtcS51G6htFXYbq3Oswko=;
        b=DhlyWkHty4tMuTjcyy8w75OEq/QBzlT0ejdI72p9vqLWUUymXf2MVx5YFpKYDtcaQGMZLP
        0/lDzTQOqu4CMMaLAo9UhN1He6eStppR6d0ZFq7j+XXCkZgl/8Lw6m7+T3dGYlb/bGdLX4
        iYGMIaUEm8G8v7F5KLPLVtxmw4tcDF0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-KD5vt1iwPAaLDQSqBRNUQA-1; Tue, 04 Jul 2023 11:49:09 -0400
X-MC-Unique: KD5vt1iwPAaLDQSqBRNUQA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4f76712f950so5388535e87.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 08:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688485747; x=1691077747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/hoZm+omuA7hP/LWvTe8bCtcS51G6htFXYbq3Oswko=;
        b=bgsSB/MMPtJJqP1fmytk7xwlCDAEE1m8BZ1aeTwFSDTVJAQA0h/8zZuXS3D5zukFfE
         H4NpGhwkY6HoO3h5VPLmV2GL+lQlBNI691F/b4/12uecAU56h4TQ66qRl/dSE7VTa9mh
         zOAmVoNS3Lqk/eh+HqQkqbyFDUWFyfpMCAECsvXJiw8c1uPp+cjjt+f4P49UhmaBQMPS
         lpA3ANGU3q6EU/ctIgTJ4qWccc1RnhmpwmYPDYKjn4i7wFYX+TxHIsfRlCPm729WOHyM
         FjBnaVTeKp4Ee3p9d8D7IAtMoKFZNOzZLJOKojklUTYTPZncSjiAL0q1CvktVvCMGjHV
         1tCQ==
X-Gm-Message-State: ABy/qLbvUKRJfQEFCHwkpv6H7bCK5kEW6bwEBQQJcGbTH3nmQ4MKo8nG
        ZUivYq8Hkkq+c8dkcnUCibjLbQsXNM2AN8uHz5gy5wicUyfPjoe6rdUi/d3bR/Qy6qaf0ce1w/X
        +jmNPe7YBaDmCtqgGGkVwlCc=
X-Received: by 2002:a05:6512:158b:b0:4f8:69f8:47a0 with SMTP id bp11-20020a056512158b00b004f869f847a0mr11772727lfb.29.1688485747556;
        Tue, 04 Jul 2023 08:49:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGSA6Z99k5o3/jU6yTOLRpf7PaYCCMdrpmf/iLGcwT6FXowH+QT8KaVfY4zzIBKImZCL8l2jw==
X-Received: by 2002:a05:6512:158b:b0:4f8:69f8:47a0 with SMTP id bp11-20020a056512158b00b004f869f847a0mr11772716lfb.29.1688485747277;
        Tue, 04 Jul 2023 08:49:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id r11-20020aa7c14b000000b0051debcb1fa2sm6075862edp.69.2023.07.04.08.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 08:49:06 -0700 (PDT)
Message-ID: <d2fc863c-86dc-b011-c88f-d9e6eb5b277f@redhat.com>
Date:   Tue, 4 Jul 2023 17:49:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 13/15] media: atomisp: csi2-bridge: Switch to new
 common ipu_bridge_init()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Dan Scally <dan.scally@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-14-hdegoede@redhat.com>
 <CAHp75Vcp9aoKOw-gPeXvJ9VuO5nGN=g5HHjAxWwNyNzo6J2Amw@mail.gmail.com>
 <51c9a63b-915b-c128-916e-b84e1fe659fa@ideasonboard.com>
 <ZKQtgkyTf/x48eCO@smile.fi.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZKQtgkyTf/x48eCO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/4/23 16:32, Andy Shevchenko wrote:
> On Tue, Jul 04, 2023 at 02:55:02PM +0100, Dan Scally wrote:
>> On 30/06/2023 16:45, Andy Shevchenko wrote:
>>> On Fri, Jun 30, 2023 at 2:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> (Can you remove unneeded context when replying to the messages, please?)
> 
> ...
> 
>>>> +       if (!acpi_match_device_ids(adev, dual_lane_sensors))
>>>> +               lanes = 2;
>>>> +       else
>>>> +               lanes = 1;
>>> Can we use positive conditional?
>>>
>>>         if (acpi_match_device_ids(adev, dual_lane_sensors))
>>>                 lanes = 1;
>>>         else
>>>                 lanes = 2;
>>
>> Or perhaps "if (acpi_match_device_ids(adev, dual_lane_sensors) == 0)"?
> 
> Unfortunately this will be more confusing. The above mentioned API returns
> the error code or 0 on success.
> 
> 	ret = acpi_match_device_ids(adev, dual_lane_sensors);
>         if (ret)
>                 lanes = 1;
>         else
>                 lanes = 2;
> 
> probably is the best to have semantics of returned code more or less
> easy to get.

For adding vcm instantiation support I'm going to need more per-sensor
atomisp bridge specific data. So I'll switch this to using match-data
in the next version, using only match-data for sensors where lanes != 1
(or with a VCM, which usually are the same set of sensors).

Regards,

Hans




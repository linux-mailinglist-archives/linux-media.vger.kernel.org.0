Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEB773056A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 18:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235277AbjFNQvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 12:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbjFNQvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 12:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00C519AC
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686761420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=czjguTbgzt0n9Sy15HvCZ3sAGdZeAe46G0tEhk/Q2hU=;
        b=R2Yos+70u9t1Ne6JwX4aWCbB0FJLc/wFJ4PtjuD66MVCnyr+FBQhM62tguuwd4/vISf57G
        X+a78DnOnTAGw2E2AamNw7zcHxahNHo8iuVt4ElnMMxBx0KIyWJK1FxcYi663fudU4524P
        MzDA6o1mzDFjZl/tXkniq5CLPPWkkzk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-DvCAKsEVMgmiED8T98KDDQ-1; Wed, 14 Jun 2023 12:50:19 -0400
X-MC-Unique: DvCAKsEVMgmiED8T98KDDQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a355c9028so91456866b.3
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 09:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686761418; x=1689353418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czjguTbgzt0n9Sy15HvCZ3sAGdZeAe46G0tEhk/Q2hU=;
        b=Rn9J+vlfq7cPEdLP6kJQ7/wNIBKrNiHy0Fe6C0hUSi4GT8XteqDVEm8pG2ss3E7sif
         ZH0+QIzsxeMpi6ECUkZwgwLjNkFDUnEQ5Nu1XqYm3hu/HBw7o0VRlzDKB0EA8rczZwSv
         Sz+mVsyMwj3R17dJEML6eh5cnWknzLnGi75MDnovgW4EYKMXQyfFICdtlyeLuBVz1syF
         0pRoNJVPbvPizuL6K9Jq59d+Rz4robOhVrloI2JzPruiKdBZy2529ps/3THZR6OkKnV2
         VAfDojxWQb0dhcRxw25amHHEIFAqkXi+3ilR8JM/RArL1nN2Q3D6udTFWyks7aBfOTLe
         t7Hw==
X-Gm-Message-State: AC+VfDx30SIcZ71AUlK8SlV4xrO6UkgGgqeGAiWxPB3XkFa8pV72tMwh
        viJCYrx/4RFQ7d8wTvUZQeLz2AfgFQC2AvkIwWn/6SYrzV1VrE+3J8n6a1t+qY4RHIEjfxE4dhy
        NVJWz0a1S80sW1i25rjHehP3DWqB0eqQ=
X-Received: by 2002:a17:907:a01:b0:978:8ecd:fa6c with SMTP id bb1-20020a1709070a0100b009788ecdfa6cmr15855060ejc.34.1686761417955;
        Wed, 14 Jun 2023 09:50:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6oxtAefVtEyorFVw0eldPwpz+xvg2AS3+EE4D7gQwPiYELmOGCAEoLq8d6XatodSPDPcXq1A==
X-Received: by 2002:a17:907:a01:b0:978:8ecd:fa6c with SMTP id bb1-20020a1709070a0100b009788ecdfa6cmr15855050ejc.34.1686761417645;
        Wed, 14 Jun 2023 09:50:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lx19-20020a170906af1300b0098263dda38dsm1230783ejb.150.2023.06.14.09.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 09:50:16 -0700 (PDT)
Message-ID: <813f8b84-4737-3898-24eb-30099ffb6043@redhat.com>
Date:   Wed, 14 Jun 2023 18:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: OV5693 Kconfig missing a select VIDEO_V4L2_SUBDEV_API ?
To:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <ce81b73f-48db-038d-2671-bccbb3490786@redhat.com>
 <ZInlO48ACwQ3lwYX@kekkonen.localdomain>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZInlO48ACwQ3lwYX@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 6/14/23 18:05, sakari.ailus@linux.intel.com wrote:
> Hi Hans,
> 
> On Wed, Jun 14, 2023 at 05:47:01PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> The ov5693 driver uses v4l2_subdev_get_try_crop() /
>> v4l2_subdev_get_try_format() both of which are
>> only defined if CONFIG_VIDEO_V4L2_SUBDEV_API=y .
>>
>> Yet it does not do select VIDEO_V4L2_SUBDEV_API
>> in its Kconfig bits ?
>>
>> Note I've not seen any build errors because of this,
>> I guess we somehow end up getting away with this...
>>
>> But still I think the select should be added ?
> 
> I agree.
> 
> The reason there haven't been compile failures is that there's a vast
> number of sensor drivers that all select this so for a failure you'd need
> to select this one but none of the others.
> 
> I can send a fix.

Also see my follow-up email. If we're going to fix this
we really should fix it properly. As mentioned in
my folow-up email an intermediate Kconfig option
might be best.

E.g. doing:

grep -l v4l2_async_register_subdev drivers/media/i2c/*.c

And comparing that to Kconfig finds the following Kconfig
entries lacking a select V4L2_FWNODE / select V4l2_ASYNC

VIDEO_IMX208
VIDEO_IMX258
VIDEO_IMX274
VIDEO_IMX319
VIDEO_IMX355
VIDEO_OV6650
VIDEO_OV7740
VIDEO_OV9640
VIDEO_OV9650

and I stopped checking after the ov* drivers since I think
the above list makes my point.

Regards,

Hans





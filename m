Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20D125F2FB0
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 13:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiJCLc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 07:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiJCLcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 07:32:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C817422EE
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 04:32:51 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 074F0440;
        Mon,  3 Oct 2022 13:32:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664796768;
        bh=kl3Pdr/EEIysWMuL9kIi0OklmguLQLW+KAg9FJZwggI=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=n4pqoLnaoDyYXXXCZFsMLKge78yjW79dTfi6D37c8U4wqLoTxsTuyvhUIDOUm343T
         Nnc+JPG8GMYeV4wHPvhtElR7DXZTwo5OlIDZoBpCDfdondSVdSR4nIOL9n6rXlmUBm
         MFi8LQZ3Hs3cpNaDZQ0fbb2EsWf4P+E8M0ntqSvg=
Message-ID: <cf01ba3b-ec26-0bb7-257b-a3cdf2d489d9@ideasonboard.com>
Date:   Mon, 3 Oct 2022 14:32:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 03/34] media: subdev: increase
 V4L2_FRAME_DESC_ENTRY_MAX to 8
Content-Language: en-US
To:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-4-tomi.valkeinen@ideasonboard.com>
 <ea72318d-2661-1918-6531-1518683364c3@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ea72318d-2661-1918-6531-1518683364c3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 29/09/2022 09:48, Bingbu Cao wrote:
> 
> 
> On 8/31/22 10:13 PM, Tomi Valkeinen wrote:
>> V4L2_FRAME_DESC_ENTRY_MAX is currently set to 4. In theory it's possible
>> to have an arbitrary amount of streams in a single pad, so preferably
>> there should be no hardcoded maximum number.
>>
>> However, I believe a reasonable max is 8, which would cover a CSI-2 pad
>> with 4 streams of pixel data and 4 streams of metadata.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> ---
>>   include/media/v4l2-subdev.h | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 9689f38a0af1..3797b99bb408 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -358,7 +358,11 @@ struct v4l2_mbus_frame_desc_entry {
>>   	} bus;
>>   };
>>   
>> -#define V4L2_FRAME_DESC_ENTRY_MAX	4
>> + /*
>> +  * If this number is too small, it should be dropped altogether and the
>> +  * API switched to a dynamic number of frame descriptor entries.
>> +  */
>> +#define V4L2_FRAME_DESC_ENTRY_MAX	8
> 
> The number 8 here is still not enough I think, CSI2 specification already
> extended the VC identifier to be at most 5 bits, which support a max of
> 32 VCs.

Well, 8 frame desc entries is not enough for the "old" CSI2 either as 
there can be a lot of data-types, each a separate stream ("stream" as 
defined by this series) which needs a frame desc.

> Considering the metadata, the number should be larger, it looks like that
> we have to switch using dynamic number?

Do we have a current use case which needs more than 8 streams per pad? 
If not, I'd stay away from this for the time being. This can be changed 
later.

> BTW, does this change break the uAPI?

No, the frame desc is fully internal to the kernel.

  Tomi

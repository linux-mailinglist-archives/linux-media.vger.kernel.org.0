Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE5F7BF543
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 10:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234645AbjJJIGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 04:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234638AbjJJIGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 04:06:41 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A4497
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 01:06:40 -0700 (PDT)
X-KPN-MessageId: efe4299f-6743-11ee-b94e-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id efe4299f-6743-11ee-b94e-005056992ed3;
        Tue, 10 Oct 2023 10:06:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=dC7shEaf+klqPzQxRw2RzTd1TbAhIGrK5h8hs9XbHbY=;
        b=Sbm8Zc0InLYyHDoDKSbfPvn+VrNaDF7Qapxv11A73yR/6PfWF96Jaai+F/PyJhu07xloCL4IAkT8a
         vsyjCWqwOaU58eoDV+sbWA3m9m0C4zyMktoV8M7HlcuXHFoNBWnGGuiS+fQpKWBoxpaX/7nPLMvoIu
         OpAHGeupzKISkQ6ghsA+mOLwBduQ4L202ZYBl8P5WjbF+Edh2fX6nKHSyXynu2mg5PUT/vlIcwR6W4
         GXTzcLGc3T8z8oPlzRdXy1FtGjljuD7+LZzooinRUsnaZ6LFZOHm1u0R4ZyUm5W+8zrLxNBc99Hou6
         XG59rtfyr73y1uCS94ebAohk4iXuqSw==
X-KPN-MID: 33|zSOhP8k0Zf8DPilwmVq8UwdyxaK5QcauoXLyto9lpF0ZmGseTxn0uUhlYtWAOqp
 JiJn5ZMabbBcmjTkW0tgJMAA6dk73SawDAEfSrP6VP7M=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|QJ521JC/xzPbxc9Qh4e6SboRJW7d5TlI6pazq+y7c3jQHtLHLd9xhTIADxJn1dF
 a1j/B2AmrP56OpVIlSbWj6g==
X-Originating-IP: 173.38.220.40
Received: from [10.47.78.242] (unknown [173.38.220.40])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id f04e1012-6743-11ee-ac79-00505699b758;
        Tue, 10 Oct 2023 10:06:38 +0200 (CEST)
Message-ID: <a84b9973-fe45-4125-9374-5d05072c9143@xs4all.nl>
Date:   Tue, 10 Oct 2023 10:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] media: i2c: mt9m114: goto proper error path
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <6e2b3d5971905c1cf63184e7c3cd269c10151bb7.1696586632.git.hverkuil-cisco@xs4all.nl>
 <20231006151826.GB5121@pendragon.ideasonboard.com>
 <d625a11a-11a4-41c5-a7f7-fa651649957e@xs4all.nl>
 <ZSUEXHDmYtstvMBV@valkosipuli.retiisi.eu>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ZSUEXHDmYtstvMBV@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/10/23 09:59, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Oct 10, 2023 at 09:24:10AM +0200, Hans Verkuil wrote:
>> Hi Laurent,
>>
>> On 06/10/2023 17:18, Laurent Pinchart wrote:
>>> Hi Hans,
>>>
>>> Thank you for the patch.
>>>
>>> On Fri, Oct 06, 2023 at 12:08:49PM +0200, Hans Verkuil wrote:
>>>> In two places the probe function returns instead of going
>>>> to the correct goto label.
>>>>
>>>> This fixes this smatch warning:
>>>>
>>>> drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?
>>>>
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>> I've already submitted
>>> https://lore.kernel.org/linux-media/20231003192043.27690-1-laurent.pinchart@ideasonboard.com
>>
>> Is it OK if I pick up your patch for this issue? I plan to pick up at least part
>> of this series tomorrow in order to cut down on the number of reported smatch
>> warnings.
> 
> I've got it in my tree and I intend to send a PR by tomorrow (there's an
> issue also in the CCS driver).
> 

OK, then I leave this to you, Sakari.

The two patches you reviewed (2/9 and 7/9), can I commit those or do you plan
to make those part of your PR? I don't care either way, as long as we don't
duplicate work...

Regards,

	Hans

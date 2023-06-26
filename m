Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE7E73DF18
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 14:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjFZM0C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jun 2023 08:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbjFZMZe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jun 2023 08:25:34 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF7BE60
        for <linux-media@vger.kernel.org>; Mon, 26 Jun 2023 05:23:54 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qDlG3-0006Fs-1Z; Mon, 26 Jun 2023 14:23:51 +0200
Message-ID: <25cf3947-1fe0-7280-09e2-3dc107b2c8e7@leemhuis.info>
Date:   Mon, 26 Jun 2023 14:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [REGRESSION] breakage in sun6i-csi media api
Content-Language: en-US, de-DE
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Martijn Braam <martijn@brixit.nl>, regressions@lists.linux.dev,
        jernej.skrabec@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
 <ZHmzZUkcFK8Gq_JL@aptenodytes>
 <e168d246-528d-b615-aa50-af8f17af4442@brixit.nl>
 <ZHm46or-MhTb457b@aptenodytes>
 <20230602100352.GK19463@pendragon.ideasonboard.com>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230602100352.GK19463@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687782234;d5668432;
X-HE-SMSGID: 1qDlG3-0006Fs-1Z
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Paul, what happened to this? It looks like this fall through the cracks,
but maybe I'm missing something, that's why I ask.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

On 02.06.23 12:03, Laurent Pinchart wrote:
> On Fri, Jun 02, 2023 at 11:39:54AM +0200, Paul Kocialkowski wrote:
>> (Re-adding folks from the original email, adding Laurent and Hans.)
>> On Fri 02 Jun 23, 11:24, Martijn Braam wrote:
>>>
>>> That's basically it yes. My software doesn't expect the bridge block,
>>> because it wasn't there. The pipeline always worked "automatically".
>>>
>>> This is the workaround that's been made now it run on newer kernels:
>>> https://gitlab.com/postmarketOS/megapixels/-/merge_requests/31
>>>
>>> I'm pretty sure format propagation would fix this issue.
>>
>> Okay that's good to know.
>>
>> To be honest it's still not very clear to me if in-driver format propagation is
>> a "nice to have" feature or something that all media pipeline drivers are
>> supposed to implement.
> 
> For MC-based drivers, in-kernel propagation *inside* subdevs is
> mandatory, in-kernel propagration *between* subdevs is not allowed. The
> latter is the responsibility of userspace.
> 
> For traditional (I'd say legacy, but I know not everybody likes that
> term :-)) drivers that only expose video device nodes and do not expose
> subdev nodes to userspace, the driver is responsible for configuring the
> full pipeline internally based on the S_FMT call on the video nodes
> only. This isn't applicable to the sun6i-csi driver, as it exposes
> subdev nodes to userspace.
> 
>> Anyway I feel like this is not really a regression but a result of the driver
>> being converted to a newer API.
>>
>> Also there's a V4L2_CAP_IO_MC flag which should indicate that the video device
>> must be controlled via the media controller API instead of being
>> video-device-centric, but I've seen comments asking not to set the flag even
>> when MC is used so I'm a bit confused here.
> 
> Would you have pointers to those comments ?
> 
>> Perhaps the flag is only required when there is no automatic format
>> propagation?
> 
> The flag is more or less required when you expose subdev nodes to
> userspace.
> 
>> If anyone has solid answers on these points I'd be happy to read some
>> clarification (and act accordingly).
>>
>>> On 6/2/23 11:16, Paul Kocialkowski wrote:
>>>> Hi Martijn,
>>>>
>>>> On Thu 01 Jun 23, 23:19, Martijn Braam wrote:
>>>>> It seems like this commit:
>>>>>
>>>>> media: sun6i-csi: Add bridge v4l2 subdev with port management
>>>>>
>>>>> Has changed the way the media pipeline on a64 devices, in my case the PINE64
>>>>> PinePhone works. Since this is an API towards userspace and there's active
>>>>> applications that use it I think this counts as a regression.
>>>> Do you have more details on what changed specifically?
>>>>
>>>> The commit added a bridge subdev in addition to the video node, which is
>>>> generally a better description of the CSI hardware and also a necessity
>>>> to support the ISP data flow.
>>>>
>>>> Maybe your userspace application is not configuring the bridge media block with
>>>> the right format, which results in a mismatch?
>>>>
>>>> Some work was started to achieve automatic format propagation, perhaps it
>>>> would be enough to solve your issue.
>>>>
>>>> Cheers,
>>>>
>>>> Paul
>>>>
>>>>> #regzbot introduced: 0d2b746b1bef73de62d2d311e594a7ffed4ca43
> 

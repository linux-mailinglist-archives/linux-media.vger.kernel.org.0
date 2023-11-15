Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBA27E27C4
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 15:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjKFOz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 09:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjKFOzY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 09:55:24 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2B4BB;
        Mon,  6 Nov 2023 06:55:21 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD41FC433C8;
        Mon,  6 Nov 2023 14:55:17 +0000 (UTC)
Message-ID: <b720744a-64d0-4d1c-8457-e6250e768efe@xs4all.nl>
Date:   Mon, 6 Nov 2023 15:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 12/37] drm/connector: hdmi: Create Infoframe
 DebugFS entries
Content-Language: en-US, nl
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
 <20231031-kms-hdmi-connector-state-v3-12-328b0fae43a7@kernel.org>
 <806f2ad3-c80b-41e5-9388-f1af7bace8e3@xs4all.nl>
 <fks4th6oyzpvq2hljbpt4kac5yph6lgsevslpcxrukqcxynugu@nje5bxbqxi26>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <fks4th6oyzpvq2hljbpt4kac5yph6lgsevslpcxrukqcxynugu@nje5bxbqxi26>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/11/2023 15:44, Maxime Ripard wrote:
> Hi Hans,
> 
> On Fri, Nov 03, 2023 at 10:05:18AM +0100, Hans Verkuil wrote:
>> Hi Maxime,
>>
>> Thank you for posting v3, this time it runs fine on my RPi 4, thank you for
>> fixing that.
>>
>> I'll start working on a conformity checker for this.
> 
> Awesome :)

And anyone who is interested can find the work-in-progress for that here:

git://linuxtv.org/hverkuil/edid-decode.git

Use the -I option to point to the file containing the infoframe to parse
it. Later it will also check the conformity of the infoframe against the
display's EDID. That's why this is part of edid-decode since you need an
EDID parser to verify if the InfoFrames are also conform the standards.

> 
>>> +static int create_hdmi_infoframe_files(struct drm_connector *connector,
>>> +				       struct dentry *parent)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, audio);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, avi);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, drm);
>>
>> Hmm, I had to look into the code to figure out that 'drm' stands for
>> Dynamic Range and Mastering InfoFrame. While entirely correct, it is
>> also very confusing in the context of the 'drm' subsystem.
>>
>> I am not quite certain what the best approach is here.
>>
>> Internally in the drm code it is talking about 'hdr' or 'hdr metadata',
>> but that's a bit confusing as well since there is also an HDR Dynamic
>> Metadata Extended InfoFrame defined in CTA-861, even though support for
>> that is not (yet) implemented in drm.
>>
>> At minimum there should be a comment in the code explaining what drm
>> stands for in this context.
>>
>> One option to consider is renaming this file to hdr_drm, thus indicating
>> that this is HDR related.
> 
> I ended up doing both, thanks for the suggestion
> 
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, spd);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, vendor);
>>
>> There may be multiple vendor specific InfoFrames in the future, so how
>> would that be handled? Perhaps add a comment here that currently only one
>> vendor specific InfoFrame is supported, but suggest how to handle multiple
>> VSIFs in the future.
>>
>> What would actually be nice (although probably not that easy to fix) is if
>> the name of the file would be "vendor-XXXXXX' where 'XXXXXX' is the IEEE OUI
>> number.
> 
> I guess it's not entirely clear to me what that would look like. In
> order for the framework to create the debugfs files, we would need some
> enumeration mechanism (probably through a callback?), and then the
> driver would generate the entire content of that file.
> 
> Which makes me question whether the framework should be initialised at
> all? Maybe the simpler would be to just have drivers maintain their own
> debugfs files and storing the content in their own, private, structure.

It's a good question. And I also would like to use this for HDMI receivers
(so using it in the media subsystem).

Let me try and find some time this week or next week to dig into this a bit
more and see if I can implement it on the media side as well. See what would
be the best approach here.

It would not surprise me if the debugfs part should move to video/hdmi.c
since that's already used by both drm and media.

Regards,

	Hans

> 
> Maxime


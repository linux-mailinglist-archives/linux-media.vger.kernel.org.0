Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5E085B176E
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 10:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbiIHIpQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 04:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbiIHIpN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 04:45:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A46D9C1C3
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 01:45:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8FB0361BB3
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 08:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97000C433D6;
        Thu,  8 Sep 2022 08:45:10 +0000 (UTC)
Message-ID: <82c3e16c-55c6-edfa-516f-f06c8a022699@xs4all.nl>
Date:   Thu, 8 Sep 2022 10:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [ANN] Media Summit at ELCE Dublin: Request for Topics
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
References: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
 <a7007268a65846674b82a108215992d39b430b38.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <a7007268a65846674b82a108215992d39b430b38.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On 18/05/2022 20:01, Nicolas Dufresne wrote:
> Hi Hans,
> 
> Le vendredi 06 mai 2022 à 15:20 +0200, Hans Verkuil a écrit :
>> Hi all,
>>
>> Since countries are opening up again and travel is (at least for now!) a lot easier,
>> I am considering a media summit during the ELCE in Dublin (Sep 13-16).
>>
>> See here for more details about the conference:
>>
>> https://events.linuxfoundation.org/open-source-summit-europe/
>>
>> Of course, this only makes sense if there is something to talk about. So please reply
>> with any suggestions for topics!
>>
>> Also please let me know if you would expect to be at such a media summit in person.
>> If only a few people would be there, then there isn't much point to this.
>>
>>
>> I have two topics:
>>
>> 1) Discussion of the media subsystem development process: any bottlenecks, any ideas
>>    for improvements?
>>
>> 2) I can give a presentation on the work I've done in the CTA-861 standard (used by
>>    HDMI) and the edid-decode utility.
>>
>> I'd like to make a decision on whether or not it is worthwhile to do this in a week
>> or two. If we wait too long it might be difficult to get a room for the summit.
> 
> Andrzej, Benjamin and I works on on stateless encoder, I'd be happy to introduce
> the real-life challenges and the share around the direction we have in mind. We
> want to collect various ideas and adjust our direction accordingly.

Can you give a quick update on the status of stateful/stateless AV1 support?

Regards,

	Hans

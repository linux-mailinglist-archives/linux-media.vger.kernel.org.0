Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754BF6775F6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 09:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjAWIAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 03:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbjAWIAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 03:00:47 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496ED11EAC
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 00:00:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 93D22CE0A3A
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 08:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF39C433EF;
        Mon, 23 Jan 2023 08:00:40 +0000 (UTC)
Message-ID: <b1c023b6-171a-fa19-de60-99ab943072a8@xs4all.nl>
Date:   Mon, 23 Jan 2023 09:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/vc4: hdmi: make CEC adapter name unique
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <dcf1db75-d9cc-62cc-fa12-baf1b2b3bf31@xs4all.nl>
 <20230120191344.xldhudsmb4xar4u3@houat>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230120191344.xldhudsmb4xar4u3@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/01/2023 20:13, Maxime Ripard wrote:
> Hi Hans,
> 
> On Thu, Jan 19, 2023 at 10:02:19AM +0100, Hans Verkuil wrote:
>> The bcm2711 has two HDMI outputs, each with their own CEC adapter.
>> The CEC adapter name has to be unique, but it is currently
>> hardcoded to "vc4" for both outputs. Change this to use the card_name
>> from the variant information in order to make the adapter name unique.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> The patch looks good but should we Cc stable and add a Fixes tag here?

Good idea:

Fixes: 15b4511a4af6 ("drm/vc4: add HDMI CEC support")

Regards,

	Hans

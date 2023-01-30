Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5011E680DCD
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 13:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236272AbjA3Mf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 07:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235978AbjA3Mf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 07:35:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E99810F8
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 04:35:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4575E60F7B
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 12:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EF6C433D2;
        Mon, 30 Jan 2023 12:35:45 +0000 (UTC)
Message-ID: <8ffc56ec-b008-9bf5-5dcd-4fc89ffe0d82@xs4all.nl>
Date:   Mon, 30 Jan 2023 13:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: How to check if a profile/level is supported by V4L2 stateful
 decode?
Content-Language: en-US
To:     jc@kynesim.co.uk, linux-media@vger.kernel.org,
        Nicolas <nicolas.dufresne@collabora.com>
Cc:     Dave <dave.stevenson@raspberrypi.com>
References: <CAFyCYyNyfrwG6bVB-u+0ZQXg7HpVkvbaLQk6RRZFctPdn24k-w@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAFyCYyNyfrwG6bVB-u+0ZQXg7HpVkvbaLQk6RRZFctPdn24k-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/01/2023 13:23, John Cox wrote:
> Hi
> 
> How should I check whether or not a given profile and level is
> supported by a stateful decoder? Chrome uses VIDIOC_QUERYMENU to test
> whether a given profile is supported by, say,
> V4L2_CID_MPEG_VIDEO_H264_PROFILE. Is this "correct"? Certainly a few
> decoders seem to support this usage (qcom/venus, mediatek and possibly
> some others).
> 
> The documentation currently suggests that
> V4L2_CID_MPEG_VIDEO_H264_PROFILE is only an encoder control. Should
> the documentation be extended to cover decoder use too?

I think the documentation is out of date.

For decoders this control definitely makes sense, but only as a READONLY
control. After all you can't set it.

Ideally it would also report which profile the currently decoding stream
uses, but I don't know if that is always possible.

Regards,

	Hans


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B07A6B77E7
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 13:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjCMMpj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 08:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjCMMpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 08:45:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5666827D45
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 05:45:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 52E7D61277
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 12:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FBBC433D2;
        Mon, 13 Mar 2023 12:44:47 +0000 (UTC)
Message-ID: <3828a777-a538-8189-3aff-b9da6419a43c@xs4all.nl>
Date:   Mon, 13 Mar 2023 13:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: docs: vidioc-g-ext-ctrls.rst: Document p_s32 and
 p_s64 fields
Content-Language: en-US
To:     Daniel Lundberg Pedersen <dlp@qtec.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
References: <20230307133617.116683-1-dlp@qtec.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230307133617.116683-1-dlp@qtec.com>
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

Hi Daniel,

On 07/03/2023 14:36, Daniel Lundberg Pedersen wrote:
> p_s32 and p_s64 were added to the v4l2_ext_control struct, so these
> should have documentation as well.

This patch is missing your Signed-off-by line!

Either repost or reply to this with your Signed-off-by.

It's a nice change, I'd like to merge this!

Regards,

	Hans

> ---
>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst     | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index 892cfeb8b988..5292d5e1a91f 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -185,6 +185,16 @@ still cause this situation.
>        - ``p_u32``
>        - A pointer to a matrix control of unsigned 32-bit values. Valid if
>  	this control is of type ``V4L2_CTRL_TYPE_U32``.
> +    * - __u32 *
> +      - ``p_s32``
> +      - A pointer to a matrix control of signed 32-bit values. Valid if
> +        this control is of type ``V4L2_CTRL_TYPE_INTEGER`` and
> +        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
> +    * - __u32 *
> +      - ``p_s64``
> +      - A pointer to a matrix control of signed 64-bit values. Valid if
> +        this control is of type ``V4L2_CTRL_TYPE_INTEGER64`` and
> +        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
>      * - struct :c:type:`v4l2_area` *
>        - ``p_area``
>        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is


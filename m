Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8601567AEF5
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 10:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbjAYJzg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 04:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235226AbjAYJzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 04:55:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026412726
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 01:55:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A0BDBB81732
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 09:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9069C433D2;
        Wed, 25 Jan 2023 09:55:26 +0000 (UTC)
Message-ID: <f37435e9-fa32-6a6e-5306-f81241db6137@xs4all.nl>
Date:   Wed, 25 Jan 2023 10:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4] media: Add AV1 uAPI
Content-Language: en-US
To:     Daniel Almeida <daniel.almeida@collabora.com>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20230103154832.6982-1-daniel.almeida@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230103154832.6982-1-daniel.almeida@collabora.com>
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

On 1/3/23 16:48, Daniel Almeida wrote:
> This patch adds the  AOMedia Video 1 (AV1) kernel uAPI.
> 
> This design is based on currently available AV1 API implementations and
> aims to support the development of AV1 stateless video codecs
> on Linux.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Co-Developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---

Also some kerneldoc errors/warnings:

include/uapi/linux/v4l2-controls.h:819: error: Cannot parse enum!
include/uapi/linux/v4l2-controls.h:855: error: Cannot parse enum!
include/uapi/linux/v4l2-controls.h:3080: warning: Enum value 'V4L2_AV1_SEG_LVL_REF_SKIP' not described in enum 'v4l2_av1_segment_feature'
include/uapi/linux/v4l2-controls.h:3080: warning: Enum value 'V4L2_AV1_SEG_LVL_REF_GLOBALMV' not described in enum 'v4l2_av1_segment_feature'
include/uapi/linux/v4l2-controls.h:3080: warning: Excess enum value 'V4L2_AV1_SEG_LVL_GLOBALMV' description in 'v4l2_av1_segment_feature'
include/uapi/linux/v4l2-controls.h:3080: warning: Excess enum value 'V4L2_AV1_SEG_LVL_SKIP' description in 'v4l2_av1_segment_feature'
include/uapi/linux/v4l2-controls.h:3365: warning: Function parameter or member 'buffer_removal_time' not described in 'v4l2_ctrl_av1_frame'
include/uapi/linux/v4l2-controls.h:3377: warning: bad line:    Specification.
include/uapi/linux/v4l2-controls.h:3438: error: Cannot parse struct or union!

Regards,

	Hans

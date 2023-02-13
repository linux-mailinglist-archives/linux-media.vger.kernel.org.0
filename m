Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4E2E695076
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 20:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjBMTPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 14:15:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjBMTPM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 14:15:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33FB20078
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 11:15:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D6BD6123B
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 19:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4654EC433D2;
        Mon, 13 Feb 2023 19:15:08 +0000 (UTC)
Message-ID: <5d8d37c9-7e7a-d99b-d893-8a1c9fb676ef@xs4all.nl>
Date:   Mon, 13 Feb 2023 20:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5] media: Add AV1 uAPI
Content-Language: en-US
To:     Daniel Almeida <daniel.almeida@collabora.com>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20230213154436.193658-1-daniel.almeida@collabora.com>
 <7b2276aab6d01bda092ff6f7f2beeaa4d0d70e3d.camel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <7b2276aab6d01bda092ff6f7f2beeaa4d0d70e3d.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/02/2023 20:04, Daniel Almeida wrote:
> Hi Hans, one thing to note though:
> 
> Neither me nor Benjamin managed to reproduce this:
> 
> ```
> 
> include/uapi/linux/v4l2-controls.h:819: error: Cannot parse enum!
> include/uapi/linux/v4l2-controls.h:855: error: Cannot parse enum!
> include/uapi/linux/v4l2-controls.h:3080: warning: Enum value
> 'V4L2_AV1_SEG_LVL_REF_SKIP' not described in enum
> 'v4l2_av1_segment_feature'
> include/uapi/linux/v4l2-controls.h:3080: warning: Enum value
> 'V4L2_AV1_SEG_LVL_REF_GLOBALMV' not described in enum
> 'v4l2_av1_segment_feature'
> include/uapi/linux/v4l2-controls.h:3080: warning: Excess enum value
> 'V4L2_AV1_SEG_LVL_GLOBALMV' description in 'v4l2_av1_segment_feature'
> include/uapi/linux/v4l2-controls.h:3080: warning: Excess enum value
> 'V4L2_AV1_SEG_LVL_SKIP' description in 'v4l2_av1_segment_feature'
> include/uapi/linux/v4l2-controls.h:3365: warning: Function parameter or
> member 'buffer_removal_time' not described in 'v4l2_ctrl_av1_frame'
> include/uapi/linux/v4l2-controls.h:3377: warning: bad line:   
> Specification.
> include/uapi/linux/v4l2-controls.h:3438: error: Cannot parse struct or
> union!
> ```
> 
> Was that simply "make htmldocs"?

scripts/kernel-doc -none include/uapi/linux/v4l2-controls.h

Regards,

	Hans

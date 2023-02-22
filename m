Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF1669FE15
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 23:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbjBVWDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 17:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbjBVWDb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 17:03:31 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3B128851
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 14:03:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 32680CE1EF3
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 22:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F87C433D2;
        Wed, 22 Feb 2023 22:03:23 +0000 (UTC)
Message-ID: <94ffffa7-bd5e-134e-de44-f3dab1794e59@xs4all.nl>
Date:   Wed, 22 Feb 2023 23:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [v4l-utils] [PATCH v9 3/7] Add support for meson building
Content-Language: en-US
To:     Gregor Jasny <gjasny@googlemail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, sean@mess.org,
        user.vdr@gmail.com, xavier.claessens@collabora.com,
        deborah.brouwer@collabora.com, ariel@vanguardiasur.com.ar,
        ezequiel@vanguardiasur.com.ar, tomi.valkeinen@ideasonboard.com
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221143204.26591-4-laurent.pinchart@ideasonboard.com>
 <0da1d7df-5ba5-c6ce-afa0-3450ea3e8ed3@xs4all.nl>
 <Y/Tab2i9eA+wcoF2@pendragon.ideasonboard.com>
 <e890fca0-a706-a43d-83ed-80c1f59b1182@googlemail.com>
 <301df538-0f0b-1827-7eaa-e4963475aa5d@xs4all.nl>
 <02bb5abc-a796-25e7-d150-1204a3d180c6@googlemail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <02bb5abc-a796-25e7-d150-1204a3d180c6@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/02/2023 22:12, Gregor Jasny wrote:
> On 22.02.23 20:50, Hans Verkuil wrote:
>> I merged 4 of the 5 patches from Deb, let's wait if a v2 of that last patch can be done quickly.
> 
> Sure I'll wait until the patch got merged.

Merged v2, you're good to go.

Thank you, Deb, for the quick response!

Regards,

	Hans

> 
> Thanks,
> Gregor


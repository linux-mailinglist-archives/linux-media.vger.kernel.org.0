Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6696DF02D
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 11:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjDLJV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 05:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjDLJVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 05:21:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78DF6EAE;
        Wed, 12 Apr 2023 02:21:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4315E63208;
        Wed, 12 Apr 2023 09:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F319C433EF;
        Wed, 12 Apr 2023 09:21:49 +0000 (UTC)
Message-ID: <83086c6a-27fc-444c-b3c4-e4a8c6c46988@xs4all.nl>
Date:   Wed, 12 Apr 2023 11:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 00/20] Add Tegra20 parallel video input capture
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
References: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
 <20230412111610.2fbfdf7b@booty>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230412111610.2fbfdf7b@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/04/2023 11:16, Luca Ceresoli wrote:
> Hello Hans,
> 
> On Fri,  7 Apr 2023 15:38:32 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> 
>> New in v5: dropped the patch that was removing lots of the logic behind
>> enum_format, after discussion with Hans. The rest is unmodified except for
>> rebasing and fixing a couple typos in comments.
>>
>> Full details follow.
>>
>> Tegra20 and other Tegra SoCs have a video input (VI) peripheral that can
>> receive from either MIPI CSI-2 or parallel video (called respectively "CSI"
>> and "VIP" in the documentation). The kernel currently has a staging driver
>> for Tegra210 CSI capture. This patch set adds support for Tegra20 VIP
>> capture.
>>
>> Unfortunately I had no real documentation available to base this work on.
>> I only had a working downstream 3.1 kernel, so I started with the driver
>> found there and heavily reworked it to fit into the mainline tegra-video
>> driver structure. The existing code appears written with the intent of
>> being modular and allow adding new input mechanisms and new SoCs while
>> keeping a unique VI core module. However its modularity and extensibility
>> was not enough to add Tegra20 VIP support, so I added some hooks to turn
>> hard-coded behaviour into per-SoC or per-bus customizable code. There are
>> also a fix, some generic cleanups and DT bindings.
>>
>> Quick tour of the patches:
>>
>>  * Device tree bindings
>>
>>    01. dt-bindings: display: tegra: add Tegra20 VIP
>>    02. dt-bindings: display: tegra: vi: add 'vip' property and example
>>
>>  * Minor improvements to logging, comments, cleanups
>>
>>    03. staging: media: tegra-video: improve documentation of tegra_video_format fields
>>    04. staging: media: tegra-video: document tegra_channel_get_remote_source_subdev
>>    05. staging: media: tegra-video: fix typos in comment
>>    06. staging: media: tegra-video: improve error messages
>>    07. staging: media: tegra-video: slightly simplify cleanup on errors
>>    08. staging: media: tegra-video: move private struct declaration to C file
>>    09. staging: media: tegra-video: move tegra210_csi_soc to C file
>>    10. staging: media: tegra-video: remove unneeded include
>>
>>  * Preparation to make the VI module generic enough to host Tegra20 and VIP
>>
>>    11. staging: media: tegra-video: Kconfig: allow TPG only on Tegra210
>>    12. staging: media: tegra-video: move tegra_channel_fmt_align to a per-soc op
>>    13. staging: media: tegra-video: move default format to soc-specific data
>>    14. staging: media: tegra-video: move MIPI calibration calls from VI to CSI
>>    15. staging: media: tegra-video: add a per-soc enable/disable op
>>    16. staging: media: tegra-video: move syncpt init/free to a per-soc op
>>    17. staging: media: tegra-video: add syncpts for Tegra20 to struct tegra_vi
>>    18. staging: media: tegra-video: add hooks for planar YUV and H/V flip
>>    19. staging: media: tegra-video: add H/V flip controls
>>
>>  * Implementation of VIP and Tegra20
>>
>>    20. staging: media: tegra-video: add support for Tegra20 parallel input
>>
>> Enjoy!
>>
>> Changed in v5:
>> - removed patch 3 as requested by Hans Verkuil; now the driver is kept
>>   video-node-centric and the enum_format logic is unchanged
>> - rebased on top of that
>> - trivial fixes (typos)
> 
> According to your review of v4, removing patch 3 was the only change
> required, and I didn't do anything else, and there have been no big
> changes since v1 anyway, so I was wondering whether this series has any
> hope to make it for 6.4...

It's borderline. I first need to test it again, and I can do that Friday
at the earliest (if I find the time). I'll try, but no promises...

Regards,

	Hans

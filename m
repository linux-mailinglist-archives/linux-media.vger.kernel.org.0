Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D40704DA5
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 14:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbjEPMVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 08:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbjEPMVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 08:21:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A193B4698
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 05:21:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3753F62BEB
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 12:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54918C433EF
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 12:21:29 +0000 (UTC)
Message-ID: <b075cb4d-b486-3b6e-1ea2-3031b9bcda02@xs4all.nl>
Date:   Tue, 16 May 2023 14:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Media Summit June 26th: Draft Agenda v2
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Here is my initial stab at a agenda for the media summit. As always, it
is subject to change and all times are guesstimates!

----------------------------------------------------------------------
v2:
- Reserve 45 minutes for Sakari's topic.
- Update "Subsystem development process" topic.
----------------------------------------------------------------------

8:45-9:15: get settled :-)

9:15-9:25: Hans: Quick introduction

9:25-10:15: Daniel Almeida: Rust V4L2 support

    Discuss the potential blockers as well as the roadmap and priorities for
    bindings. Present what is currently supported and what isn't in the Rust
    code for V4L2. Identify potential candidates for new drivers that can be
    written in Rust. Discuss about maintainership issues related to Rust in V4L2.

10:15-10:30: Break

10:30-11:15 Hans & Hsia-Jun Li: "Add extended fmt and buffer" patch series

    https://patchwork.linuxtv.org/project/linux-media/cover/20230206043308.28365-1-ayaka@soulik.info/

    We've been postponing the work on this, but I think we need to decide how to
    proceed since pixel formats and single vs multi planar is getting to be a nightmare.

    More details from Hsia-Jun Li:

    1. v4l2 header would only maintain the codec format and pixel format in bus.
    2. the pixel formats would be maintained by the DirectRender, those M
       variant would not be supported in the new extend pixel format API.
    3. The number of plane for a pixel format would also responds for its data
       layout. Ex. NV12 = 2 planes(luma, chroma), I420 = 3 planes(Y, U, V).
    4. Userspace that supports new extend API could access those driver didn't
       adapt the new API, kernel would have a backward compatible layer. While
       the opposite backward compatible is not offered (old API userspace can't
       access the driver support the new API).

    [optional part]
    5. An alloc flag would be introduced for allocating those M variant buf.
       https://lore.kernel.org/lkml/20230322105226.122467-1-randy.li@synaptics.com/
    6. Stateless codec format would be a modifier to the stateful codec format.
       We could support different packing mode here.

11:15-11:30: Break

11:30-12:15: Andrzej Pietrasiewicz: Stateless Encoders: VP8

    - Introduction to stateless encoders and previous work in this area

    https://github.com/bootlin/linux/tree/hantro/h264-encoding-v5.11

    https://lore.kernel.org/linux-arm-kernel/20230309125651.23911-1-andrzej.p@collabora.com/T/

    - High level decisions
    - Rate control
    - VP8 uAPI
    - Challenges

12:15-13:30: lunch

13:30-14:00: Ricardo Ribalda Delgado: KCAM update

    I would like to share the progress on KCAM from our end.

    I am also trying to collect all the requirements that we are getting
    from vendors regarding V4L2.

14:00-14:45: Sakari: generic line-based metadata formats:

    https://lore.kernel.org/linux-media/20230505215257.60704-1-sakari.ailus@linux.intel.com/T/#t

14:45-??:??: Mauro & sub-maintainers: Subsystem development process

    How to improve it? How do we get more maintainers? It's not working very
    well at the moment.

    Mauro will present how the media CI works today.
    Hans will present how the daily build scripts work.

    Can this be harmonized?

Final short topic: Hans: Should we keep the media summit together with the ELCE conference?
    Or organize it separately, and ask a company like Cisco, Intel or Collabora
    to organize a room. What would work best? Anything to improve on this?

We have the room until 18:30, but (fingers crossed) I hope to finish before that.

The "Add extended fmt and buffer" and the "Subsystem development process" are
*very* hard to predict. I want to limit the initial discussion of the that first
topic to 45-60 minutes, and continue (if needed) in the afternoon after the discussion
about the subsystem development process. We will have see how it goes.

Please reply with corrections, questions, etc. to this email. I'll update the agenda
over time.

Regards,

	Hans

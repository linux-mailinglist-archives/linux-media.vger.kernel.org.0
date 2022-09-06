Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF4E5AE068
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 08:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237988AbiIFG6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 02:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233371AbiIFG6u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 02:58:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1090772FE1
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 23:58:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A0F9661242
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 06:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DC5C433C1;
        Tue,  6 Sep 2022 06:58:45 +0000 (UTC)
Message-ID: <2691c888-0a70-87ae-889e-f44842a279e8@xs4all.nl>
Date:   Tue, 6 Sep 2022 08:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/09/2022 16:44, Laurent Pinchart wrote:
> On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
>> On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
>>> 16:45-18:00 Anything else?
>>
>> I think it'd be great to have a GPG key signing party at the end of the
>> meeting.
> 
> It's a good idea. Could everybody please send their GPG key fingerprint
> in an e-mail reply to prepare for that ? It can easily be retrieved with
> 'gpg -K' (make sure to pick the right key if you have multiple of them).
> I'll start:
> 
> sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
>       94231B980100EC619AC10E10F045C2B96991256E
> uid                   [ultimate] Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> If you're generating a key for the occasion, create a primary key with
> the Certify (C) capability only, and create separate sub-keys for
> Signature (S) and Encryption (E). There's little reason these days to
> use less than 4096 bits for the primary key if you opt for RSA. The
> subkeys should have an expiration date.
> 
> The primary key can then be moved to safe storage, you will only need
> the subkeys for daily usage.  The primary key will be used only to
> create new subkeys and to sign other people's keys.
> 

sec#  rsa4096 2014-10-14 [SC] [expires: 2024-10-11]
      052CDE7BC215053B689F1BCABD2D614866143B4C
uid           [ultimate] Hans Verkuil <hverkuil-cisco@xs4all.nl>
uid           [ultimate] Hans Verkuil <hverkuil@xs4all.nl>

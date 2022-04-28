Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E643512DA6
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 10:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343720AbiD1IE0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 28 Apr 2022 04:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343515AbiD1IEZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 04:04:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1620017E06
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 01:01:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1njz5I-00057f-EG; Thu, 28 Apr 2022 10:01:08 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1njz5J-005iEv-6U; Thu, 28 Apr 2022 10:01:07 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1njz5H-00032V-5U; Thu, 28 Apr 2022 10:01:07 +0200
Message-ID: <094f4b73baccfe9bd4cd01504da3effe03f09bfd.camel@pengutronix.de>
Subject: Re: [PATCH] media: coda: limit frame interval enumeration to
 supported encoder frame sizes
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Thu, 28 Apr 2022 10:01:07 +0200
In-Reply-To: <96c45649-c4b6-c690-7b81-875285cd9d0d@xs4all.nl>
References: <20220426091555.2240313-1-p.zabel@pengutronix.de>
         <96c45649-c4b6-c690-7b81-875285cd9d0d@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Do, 2022-04-28 at 09:51 +0200, Hans Verkuil wrote:
> On 26/04/2022 11:15, Philipp Zabel wrote:
> > Let VIDIOC_ENUM_FRAMEINTERVALS return -EINVAL if userspace queries
> > frame intervals for frame sizes unsupported by the encoder. Fixes the
> > following v4l2-compliance failure:
> > 
> > 		fail: v4l2-test-formats.cpp(123): found frame intervals for invalid size 47x16
> > 		fail: v4l2-test-formats.cpp(282): node->codec_mask & STATEFUL_ENCODER
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: FAIL
> > 
> > For decoder devices, return -ENOTTY.
> 
> Shouldn't that be 'encoder devices'?
> 
> And why mention it at all since this isn't part of the changes in this patch?
> 
> I can drop this last sentence, if you like, but before I do that I need
> confirmation that that's OK.

Yes please, thank you for catching this. It is an artifact from when I
rebased this patch past a3b9b81462a2 ("media: coda: disable encoder
ioctls for decoder devices").

regards
Philipp

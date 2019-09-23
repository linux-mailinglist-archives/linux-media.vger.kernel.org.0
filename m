Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC01BAEDC
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 10:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436889AbfIWIFP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 04:05:15 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:57027 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2436751AbfIWIFP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 04:05:15 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CJLJivCGlKKNGCJLMikH25; Mon, 23 Sep 2019 10:05:13 +0200
Subject: Re: bringing back media/zoran driver
To:     Corentin Labbe <clabbe.montjoie@gmail.com>,
        mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     linux-kernel@vger.kernel.org
References: <20190921170357.GA26626@Red>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8db38daf-74eb-8218-1cc6-ea9036afac3d@xs4all.nl>
Date:   Mon, 23 Sep 2019 10:05:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190921170357.GA26626@Red>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCt1NjjCrrSl4jVu+CGzrZ5XhSiiHWrlUMePsTQcsj+kDTvGrYlE3vi9hHcONZRmJxVMWgOkWI9Dg0urdPkdhWd0N9H4bkSxk/Frzyj+2aYSPYeywbH0
 l10rUt4+m7bT6Uo6XP9Pi0seagJmyqgsFNe7AVrWoW6G/F+jdMQulndng3pvD8O+0sDmNUdmfIo18gIcGAxo0ivjEXBDn856wYmgDpc2uLlI2kXlx3/4Tguu
 mfkWm9zDz6K6Nl2tkf//h+Z9gHKnLoj52qhsEj3t4votTLnDmzlH6QxewAZNSWdgKvARu7g2TKgb+mNxUIMRippvkudm8ip+NnUSiagtEwvCRRhENbZvIRdu
 fjLEfZD4HJsY/7koMv0T3j25Xf9xrg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/21/19 7:03 PM, Corentin Labbe wrote:
> hello
> 
> I am the owner of a zoran based DC10+ card.
> I am in the need of using it since yesterday and I found that its driver was removed.
> 
> Reverting the removing patch made to a temporary working situation.
> 
> If I understand correctly, it was removed due to lack of vb2 convertion.
> If I am able to do this vb2 conversion, does bring it back in mainline will be posssible ?
> In that case I am ready to assume to be the maintainer if needed.

It would be nice to get it back. The conversion to vb2 is the main requirement, but in
general this driver needed some TLC in general: it's a very old driver and the coding
standards were quite a bit lower than they are today.

But the vb2 conversion is the most important part.

It's unfortunately not the easiest thing to do (if it was, we'd have done it already!),
and it is also a 'big bang' patch, i.e. one very large patch that converts the driver
to vb2. It's all or nothing, you can't have half a vb2 conversion, so that makes it hard
to review.

The easiest way is to use the v4l2-compliance utility to verify the conversion. Running
'v4l2-compliance -s' is a good way of verifying this.

My recommended approach is to:

1) first revert the removal patch (commit 8dce4b265a53)
2) clean up the coding style. Probably easiest to create one patch per source.
   Use 'checkpatch.pl --strict -f <source>' for this. Doing this should make the
   source code easier to understand/review.
3) Run v4l2-compliance (without the -s option) and fix any failures it finds.
4) Convert to vb2, using 'v4l2-compliance -s' to test.

Be aware that the code is messy compared to modern standards. Do not be afraid
to create cleanup patches, it's probably needed.

The v4l2-compliance utility is part of https://git.linuxtv.org/v4l-utils.git/.
See the README on how to build. Always use the v4l2-compliance version from this
git repo since that's always the latest and greatest.

I recommend that you join the #v4l irc channel on freenode.org. Most core devs that
can help with advice are there during office hours (and often outside of office hours
as well). That's for the European timezones since most devs are based in Europe.

Regards,

	Hans

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273A337BC61
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 14:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhELMWx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 12 May 2021 08:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbhELMWx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 08:22:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0524FC061574
        for <linux-media@vger.kernel.org>; Wed, 12 May 2021 05:21:45 -0700 (PDT)
Received: from chickenburger.collabora.co.uk (chickenburger.collabora.co.uk [46.235.227.242])
        by bhuna.collabora.co.uk (Postfix) with ESMTP id 54FD01F426EC;
        Wed, 12 May 2021 13:21:43 +0100 (BST)
From:   "Ezequiel Garcia" <ezequiel.garcia@collabora.com>
In-Reply-To: <5trl8gldqb467m4nmmbbnubuudajg4j3hb@4ax.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 190.2.102.253
Date:   Wed, 12 May 2021 13:21:43 +0100
Cc:     "Hans Verkuil" <hverkuil@xs4all.nl>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>
To:     "John Cox" <jc@kynesim.co.uk>
MIME-Version: 1.0
Message-ID: <5212-609bc880-9-623f1400@218746912>
Subject: =?utf-8?q?Re=3A?= Dynamic array control =?utf-8?q?support=3A?= please test!
User-Agent: SOGoMail 5.0.1
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,
 
On Thursday, April 29, 2021 14:56 -03, John Cox <jc@kynesim.co.uk> wrote: 
 
> Hi
> 
> >Hi Ezequiel, John,
> >
> >After creating extensive new compliance tests for this feature I am now
> >confident enough about the implementation.
> >
> >You can find it here:
> >
> >https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=ctrl-refactor
> >
> >There are two items that I want to fix before I will post this:
> >
> >1) The new flag needs to be documented
> >2) I think there are some simplifications possible w.r.t. storing the
> >   size of the new array, I want to look at that a bit more.
> >
> >In the meantime it would be great if some testing of this series can be
> >done with real drivers instead of just vivid.
> 
> Well I finally managed to put together your patch (in 5.10), tweaked
> driver & ffmpeg to have a variable noof slice headers and it all seems
> to work well. With the code I have it doesn't give a significant
> improvement in performance over 1 slice at a time but that is probably
> because I have multithreaded userland code and take liberties with
> buffer returns from the driver that Ezequiel disaproves of (but my
> ffmpeg code is happy with).
> 

I don't think I have ever disapproved anything (and if I made it sound like that, it was a mistake). Quite the opposite, I am more than supportive to see get more drivers merged upstream.

Thanks!
Ezequiel


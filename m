Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E318C3712E8
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 11:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbhECJVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 05:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbhECJVC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 05:21:02 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6BFC06174A
        for <linux-media@vger.kernel.org>; Mon,  3 May 2021 02:20:09 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 64BFCC63DD; Mon,  3 May 2021 10:20:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620033605; bh=+dFGWlgk+2z4rRZIHAC69h46zZluxcq7BVCwkU0Q09w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CGylDJaRMximEhDN61rwhV5l50Z0OXBNpvv1Wjbz8IskuU9YDac1sFMwI86C2WYnh
         qJlwcIzq6J4l7Ci8FNUrkcJsDYw+WmNrMjpNlnH//8TTdAcZfJOS+zr+ugpe1nCz8I
         stTE1ygMNecozuCKd4OZQ53zrxhkJRsYV8LuKAo3aKmkQLCfPctN0Ebh7nUxxAHCbN
         W1RIJBN/HIFOwXy1VYphP5pkWZiQdN6SxkLNMD8RON6P6y3rkWhLUMdIT8rOqmi/xQ
         w8Bo1m6TISnLU8zVElGcbabRZpVn285DAumIzmB1DvrhNzg3O5I+hnXd4oR1tFrtNK
         6Bir/I1uxF3kw==
Date:   Mon, 3 May 2021 10:20:05 +0100
From:   Sean Young <sean@mess.org>
To:     Chris McCrae <chrismccraeworks@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: Asus PN62S vs PN50 - ITE8708
Message-ID: <20210503092005.GB14939@gofer.mess.org>
References: <CAN2W0iNOsa6GYK28Vz=DmkyjY72H_bq=8EUkzFuy0_p9ZVms4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN2W0iNOsa6GYK28Vz=DmkyjY72H_bq=8EUkzFuy0_p9ZVms4A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chris,

On Fri, Apr 30, 2021 at 07:37:10PM -0400, Chris McCrae wrote:
> Long time stalker, first time caller, so go easy please :-)  (I've
> already learned I need to use plain text mode ... what's next?)
> 
> Recently acquired an Asus PN62S (Intel) as a media centre frontend
> (currently testing with Xubuntu 20.04 and a 5.10 kernel, and the most
> current BIOS available).  Having an integrated IR was part of the
> selling features.  However, getting it to be recognized by my system
> has become a challenge that I am getting obsessed with.  There's very
> little to find online on this device that is current, but there has
> been some recent conversation on this list about the same device, on a
> related machine, the PN50 (AMD).  I'm hoping that the knowledge here
> may lead to a solution for my issue.
> 
> I can provide more detail on request, but at the moment I am focusing
> on the DSDT as a possible suspect.  I do not have the 16 byte issue
> that the PN50 experiences.  Mine is defined as 8 bytes, which is
> compatible with the ite-cir driver.  My issue is that there appears to
> be no attempt to bind the device to the driver (but it is visible in
> lsmod)... no messages about the driver in dmesg at all.  My thought is
> that the definition of the device in DSDT may somehow give it enough
> information (ITE8708) to know the driver could be needed, but not the
> correct information to make it work.
> 
> An earlier message provided only part of the device definition in DSDT
> for the PN50.  I would like to be able to see the full definition for
> it from the PN50, to see if anything is significantly different.
> Ideally, if I had the full DSDT as a starting point, I could compare
> other areas such as motherboard resources.

It would be great if we could see the entries for the IR device in your
DSDT. There is a guide here https://wiki.archlinux.org/title/DSDT on
how to do that.

Thanks

Sean

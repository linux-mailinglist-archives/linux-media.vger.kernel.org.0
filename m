Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 187D8BE49B
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 20:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439910AbfIYSbB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 14:31:01 -0400
Received: from mxb1.seznam.cz ([77.75.78.89]:21362 "EHLO mxb1.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439865AbfIYSbB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 14:31:01 -0400
X-Greylist: delayed 707 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Sep 2019 14:31:00 EDT
Received: from email.seznam.cz
        by email-smtpc10b.ko.seznam.cz (email-smtpc10b.ko.seznam.cz [10.53.14.45])
        id 7672e7c2a1c95ea776daf905;
        Wed, 25 Sep 2019 20:30:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1569436257; bh=wxYVHqhZiOMawzsv7p/5+A1zTj1N7QSdrHr3kVKAnug=;
        h=Received:From:To:Date:MIME-Version:Subject:Message-ID:Priority:
         In-reply-to:References:X-mailer:Content-type:
         Content-transfer-encoding:Content-description;
        b=ecv9TVULN7fiA7jFk5nzhl5h7ei5lD5mmGkJYWyxl0yqQBLkugL4GT1djleszg/Yi
         qJSu6TRa929HGLDwZY/q2oMsqmxP5jqrxsg74h5ouzc5Khbz6+FvwtwVP64/NMkiBj
         zCkdTF1Uu5hcQMSydjswlkriV3dAOjtL8Nwjb4MI=
Received: from [192.168.12.172] (47.94.cust.tetanet.cz [109.202.94.47])
        by email-relay23.ko.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Wed, 25 Sep 2019 20:19:08 +0200 (CEST)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     Vincent McIntyre <vincent.mcintyre@gmail.com>,
        linux-media@vger.kernel.org
Date:   Wed, 25 Sep 2019 20:19:03 +0200
MIME-Version: 1.0
Subject: Re: regression(?) in cxusb
Message-ID: <5D8BAF97.227.3E39A624@Frantisek.Rysanek.post.cz>
In-reply-to: <CAEsFdVOwXiWTvNRPUiPhv4YL=kDA_Ft-ra_gLac2RuyOrwxUvg@mail.gmail.com>
References: <CAEsFdVN99i0QV7eCVtxPYKcpjJTC=k+U7eoDQvhGGKKQyM5vqQ@mail.gmail.com>, <CAEsFdVOwXiWTvNRPUiPhv4YL=kDA_Ft-ra_gLac2RuyOrwxUvg@mail.gmail.com>
X-mailer: Pegasus Mail for Windows (4.63)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25 Sep 2019 at 20:31, Vincent McIntyre wrote:
> Hi
> 
> I am seeing strange behaviour with the dvb-usb-cxusb.ko module.
> Things have been working fine until just recently.
> 
> Target system is Ubuntu 16.04 LTS on amd64.
> I am using their 'hwe' kernel series.
> 
> Symptoms:
>  * linux-image-4.15.0-58-generic + media-build from a few weeks ago works
> fine
>  * linux-image-4.15.0-64-generic without media-build works fine
>  * linux-image-4.15.0-64-generic + media build fails
...
> insmod
> /lib/modules/4.15.0-64-generic/kernel/drivers/media/v4l2-core/v4l2-common.ko
> modprobe: ERROR: could not insert 'dvb_usb_cxusb': Exec format error
> 
Dear Vincent, I'm not a maitainer, just a fellow user who happens to 
keep an eye on this list.
Excuse my somewhat off topic response:

Would you consider compiling a fresh kernel?
What hardware are you trying to use with the cxusb driver?

The linux-media subsystem is pretty vibrant and fast-paced,
fairly serious changes happen between vanilla kernel releases.
In that context, 4.15 sounds oldish...

In the recent past, I recall support for the Mygica "T230C v2" (aka 
T230C2) moving from cxusb.c to dvbsky.c, plus a debate about
one or two unrelated fixes to that code (maybe one of them was a 
revert of a previous patch). I recall that one of the motivations for 
T230C2 to move from cxusb.c to dvbsky.c was better support for its IR 
sensor.
I believe this stuff will be present in Linux 5.4 (just pulled into 
the vanilla master, within the merge window that's just now open), 
possibly hasn't made it into 5.3.
Meanwhile, the directory structure of the source code keeps receiving 
"janitoring" changes etc...
=> I suggest that you test some newer kernel, possibly betatest some
5.4-pre/rc to see if those make a difference (if you cannot wait a 
few weeks for 5.4.0 release). Or try some 5.2 / 5.3 if you believe 
that the recent changes to cxusb/dvbsky are irrelevant to your HW.

Frank Rysanek


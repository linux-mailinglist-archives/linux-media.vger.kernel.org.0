Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D05F5325518
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 19:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbhBYSD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 13:03:26 -0500
Received: from www.deeg.xyz ([37.120.189.214]:32876 "EHLO mail.deeg.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233895AbhBYSA6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 13:00:58 -0500
X-Greylist: delayed 436 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Feb 2021 13:00:57 EST
From:   Matthias Deeg <research@deeg.xyz>
Subject: USB composite device with two UVC functions (e.g. two RGB cameras)
To:     linux-media@vger.kernel.org
Message-ID: <f90277ba-76c6-3bf0-3eb0-3576d33062cd@deeg.xyz>
Date:   Thu, 25 Feb 2021 18:52:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everybody,

what is the currently recommended way to create a USB composite device
consisting of two UVC functions, for instance two RGB cameras or one RGB
camera and an IR camera?

My current simple approach [1] configuring two UVC devices via configfs
and having two separate uvc-gadget processes dealing with the
corresponding video device nodes does not work in its current state.

The RGB camera and the IR camera used individually work as intended.

I'm new to the USB Gadget API and Video4Linux and would appreciate any
help in implementing a working USB composite device with two cameras
that can be used simultaneously.

The goal of my research project is figuring out if it is possible to
create a Microsoft Windows Hello-compatible USB camera using a simple
single-board computer running Linux like a Raspberry Pi.

It is also interesting for me to know, if my current approach with the
uvc-gadget is working at all for my set goal or if I have to create a
kernel module for such a USB composite device.

Error and lsusb ouputs of my non-working implementation are also
available in the corresponding GitHub repository [2].

Best regards,
Matthias


[1] https://github.com/mdeeg/uvc-gadget-subface

[2] https://github.com/mdeeg/uvc-gadget-subface/tree/master/debug

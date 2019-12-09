Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E086116544
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 04:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfLIDSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Dec 2019 22:18:55 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:50126 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbfLIDSz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Dec 2019 22:18:55 -0500
X-Greylist: delayed 600 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Dec 2019 22:18:54 EST
Date:   Mon, 09 Dec 2019 03:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philipmolloy.com;
        s=protonmail; t=1575860524;
        bh=mmaUrEev5g68O/d2PziYoUYpHHxOOVOuVJxCUq9SuBE=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=BEN6P3jObKOjcvVvPVFLPZs1WTsYTxLoMolxKIYhQ9Fv+MS0aN/2+KWsF1VpH78Gp
         5798mmEEQ8mhgRPP3OvCn+W15Y2azGnaev8FV1/LLLAZi7A5CSCwfqzWOSFB+inijx
         KZEHGvoZxDCTcwcG/f8eTQazy7ueBJtGTnj/860A=
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Philip Molloy <philip@philipmolloy.com>
Reply-To: Philip Molloy <philip@philipmolloy.com>
Subject: Consolidating the interface for camera components
Message-ID: <jHfajW7oigZg3UJ-yRAkP1gl9fI03ZyJu6BeOIPQqDkzXCdrYIf_dpkSXmN4soXveqqrfV4udXUKGX7yZp6OKkfjNC_zcQgKasgGdVrEL2U=@philipmolloy.com>
Feedback-ID: GJt-tMfvxqs0QQBY3TE43pQhGJvmgUyYcaVNLwpOk7zQA3Z8eEn7lfwmGEZNv6-1MJvpWrQYi2j-a_XpfopQjA==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I'm trying to consolidate the interface for several camera components into =
one place to represent a single camera. Note the camera module is a special=
ized custom device, not a general purpose camera, in case that matters.

Each of the camera modules includes a LED driver (0x63) and camera (0x3c) t=
hat sit behind a couple muxes. For example:

/sys/devices/platform/amba/ff030000.i2c/i2c-1/i2c-3/i2c-5/5-003c/
/sys/devices/platform/amba/ff030000.i2c/i2c-1/i2c-3/i2c-7/7-0063/

The LEDs are also available under /sys/class/leds/ based on their labels as=
 defined in the devicetree.

The image data captured by the camera passes through two soft IP blocks. Th=
e driver for the second block maps the image into memory and exposes it as =
a block device in /dev.

Is there a way to consolidate that into one place rather than having it spr=
ead across /sys/devices/platform, /sys/class/leds, and /dev?

Best,
Philip




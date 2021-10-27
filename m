Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4BE43D71E
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 01:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhJ0XGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 19:06:43 -0400
Received: from mout01.posteo.de ([185.67.36.65]:56487 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229987AbhJ0XGl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 19:06:41 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id E61C0240026
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 01:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1635375853; bh=dZqfb3XW82kVmugdwXoRQ54xKdzNEmKSRVsycBI55bs=;
        h=Date:From:To:Subject:From;
        b=EwzPGmK2oo1KiO78BNIrZkzTbg12dLDP/liOivUoFXuS/z7KK/yGgG1b/AvS84+zk
         54dkNx0ZYMfluyh5pQLygFt7U5RqlKE+x4lO2tkhhc8D7XQriXBSaNNasvPtQxW0L7
         nub4NVtBj99xX+VZbKEXhZZNh6YvpZRcrcRX3SKQpKSST2DuMVMw8lqLHg0Uw60/1G
         +PV0GwMvof/NvVJtBjWMlYAJw6pqZ4u+HIpim2K4+XPKhPyU2bQA6bR6egR8hIXWaa
         RIHpCiBv1ibU21+0thXBjxDTOstI+/i3Y4+LyBzD9RrtoNqPB7LGk85/2PmVXO9mEW
         WrZw9MhF676/w==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Hfkld1536z9rxB
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 01:04:12 +0200 (CEST)
Date:   Wed, 27 Oct 2021 23:04:12 +0000
From:   Patrick Boettcher <patrick.boettcher@posteo.de>
To:     linux-media@vger.kernel.org
Subject: Kernel 5.10 - imx-media does not create /dev/media0
Message-ID: <20211028010412.49a3c812@yaise-pc1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi list,

(long time no see!)

I switched from a Freescale kernel 5.4 to a vanilla 5.10 on IMX6Solo
board. The device is using a ADV7280 as analog-video-ADC.

I tried to apply the good options to my kernel-config, but I'm unable
to get the media-controller device appear. I see  

 [  757.594463] irq: type mismatch, failed to map hwirq-21 for gpio@20a8000!
 [  757.655328] adv7180 2-0021: chip found @ 0x21 (21a8000.i2c)

that the adv7280 is found and attached, as well as the ipu and it's
video-devices.

 [   11.069123] videodev: Linux video capture interface: v2.00
 [   12.553347] ipu1_csi0: Registered ipu1_csi0 capture as /dev/video0
 [   12.681897] ipu1_ic_prpenc: Registered ipu1_ic_prpenc capture as /dev/video1
 [   12.785205] ipu1_ic_prpvf: Registered ipu1_ic_prpvf capture as /dev/video2
 [   12.914702] ipu1_csi1: Registered ipu1_csi1 capture as /dev/video3

I'm using the same device-tree as I used with fscl-5.4.

Before writing an even longer email pasting everything I did I'd like
to know which information is actually useful to debug this?

I'm hoping there is something obvious which I missed?

I'm wondering whether I shoud v4l-subdev to be created, which I don't
in dmesg.

Thanks in advance for any help,
--
Patrick.

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC0443E145
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 14:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhJ1Myd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 08:54:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:57344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229578AbhJ1Myc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 08:54:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 805B0610C8;
        Thu, 28 Oct 2021 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635425526;
        bh=PD5OY0z4sq0WOWIWj8b1CoVUgNKxXKscJZlSI2MOXDA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IfwxoSG0rTD0yKW9KYigsR5p+YPzYc5DeTzHH+Elno9nmFqyDv4D3PTW/Qt/kBueQ
         sOrRqD0e+bTV3BRohyQ5GeAnK+zLGN8pDDOrbnLE+hEjpM3dFhMVcS6lgZGJaDfYzP
         f6M2jO1fdf8a+XVFOMUIUY2q0hUinQfHvwuY8tetwpmyoiEILqdKP0YA/slV4MF6Nh
         K5ssv7h1HtX1MO49jZy/vqC0POd+UDm7R8knNVGGFx9uDLGMYcgEPp6ejBUcFqSS57
         58E9GMcgIlAEMklk4M9cMGkU5FIamLjAZK9ov/UvlRpgFyAJnw1OWfCdn4HcQ6P0gC
         9BS2CP1eWxLaQ==
Date:   Thu, 28 Oct 2021 13:51:59 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
Message-ID: <20211028135159.7ac3f263@sal.lan>
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 18 Oct 2021 01:19:40 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> Hi all,
> 
> This patch series contains fixes for atomisp to work (again). Tested on
> Microsoft Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with
> v5.15-rc5. Both are Cherry Trail (ISP2401) devices.
> 
After testing this series, I'm opting to merge most patches at the media 
stage tree:

	https://git.linuxtv.org/media_stage.git/log/

That would allow more people to test the changes.

It is probably too late to merge it for 5.16, so I'll likely postpone
merging it at media_tree to happen after 5.16-rc1.

Regards,
Mauro

---

I tested it on an Asus T101HA with:
	https://github.com/intel/nvt

compiled with -m64, and with the enclosed script:


#!/bin/bash
set -e

FRAMES=10

FORMAT=NV12
WIDTH=1600
HEIGHT=1200

#FORMAT=NV12
#WIDTH=1920
#HEIGHT=1080


./v4l2n -o testimage_@.raw \
                 --device /dev/video2 \
                 --input 0 \
                 --exposure=30000,30000,30000,30000 \
                 --parm type=1,capturemode=CI_MODE_PREVIEW \
                 --fmt type=1,width=$WIDTH,height=$HEIGHT,pixelformat=$FORMAT \
                 --reqbufs count=2,memory=USERPTR \
                 --parameters=wb_config.r=32768,wb_config.gr=21043,wb_config.gb=21043,wb_config.b=30863 \
                 --capture=$FRAMES

for i in $(seq 0 $(($FRAMES - 1))); do
	name="testimage_$(printf "%03i" $i)"

	./raw2pnm -x$WIDTH -y$HEIGHT -f$FORMAT $name.raw $name.pnm

	rm $name.raw
done



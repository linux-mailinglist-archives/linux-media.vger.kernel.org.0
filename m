Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 594FC1AB92B
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 09:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437586AbgDPHCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 03:02:04 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:57365 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437541AbgDPHCB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 03:02:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OyX5jwusdlKa1OyX8jQDl4; Thu, 16 Apr 2020 09:01:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587020519; bh=ZQThcD4YloQRMHhhyPRYHjQ3Tu11wmwaaQlmOSnGndM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Aquf/QkD27uisrsbZjO3+yZtbaQb38O9Id5T6FLP6qY2LV1sEZcPZxmngtRJFZcfW
         oBtgXt5+Rl8i6R+Ac24YEbMztEzTOKVdpX2eAknNrXZljHVOuwjCNU0+YU84Dxwn7Y
         1hYD0718PjoFmUbIBYlGqRdSMB+unHQ4FBkhUbgnqLx4z7ZHhgealgIu/E05dYPdmG
         Cj1UnhFIzOkrjfSJFU7KrmLyzR93nRp5bpae/Ma87Au7DzAepshKjEMCqpDDnWyx2m
         efezyOvPu9JQr2p0scAQUj8WrtpRvCGRl++L99lYzTQ2Xt+zXgZt9+xxj+m5n1G2hj
         0GoICq2yw8LaQ==
Subject: Re: Script to build the media documentation as if it were a single
 book
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
References: <20200414153739.30b58bdc@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e83dbd40-2a34-3bad-be5f-e451c3a5d020@xs4all.nl>
Date:   Thu, 16 Apr 2020 09:01:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200414153739.30b58bdc@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNdrcCV8sRQcLS8YJhTlr9Q8iavPNfvpfVGxIeL4YR1mi0ZVAi6Lf1BRyrBMvSjay6GVGJNCSV3TZ17vJrdl/jvLmwTAnsaCQBafmvf4jEYFMrrkej4d
 ZxZgcjqddqbEKUA36J2fZduBwlCrNW/kC8b4hOeQqo7N/eDSOiQ6AWkjYF7TQ9bjHQ2HPQo7cgAoezzthf7HQteA6FwKMscubcc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/04/2020 15:37, Mauro Carvalho Chehab wrote:
> Hi,
> 
> In order for the media documentation to match the upstream rules, it was
> split for 5.7 into 3 different books. This makes total sense for upstream.
> 
> Yet, people may still want to see it as a single book. So, I wrote a small
> script (see enclosed) that does that.
> 
> I'm using a variant of it to produce the documentation output available at:
> 	https://linuxtv.org/docs.php
> 
> (with is updated once per day).
> 
> Perhaps others could find this script useful. This script is under GPLv2,
> but please notice that some media docs are under GFDL licensing.
> 
> Thanks,
> Mauro
> 
> 
> #!/bin/bash
> 
> git remote update
> git reset --hard remotes/origin/$BRANCH
> 
> sed s,userspace-api/media,media/userspace-api, -i Documentation/Makefile
> 
> mkdir -p Documentation/media
> 
> cat <<END >Documentation/media/index.rst
> .. SPDX-License-Identifier: GPL-2.0
> 
> .. include:: <isonum.txt>
> 
> **Copyright** |copy| 1991-: LinuxTV Developers
> 
> ================================
> Linux Kernel Media Documentation
> ================================
> 
> .. toctree::
> 	:maxdepth: 4
> 
>         admin-guide/index
>         driver-api/index
>         userspace-api/index

Wouldn't it make more sense to have the userspace-api before the admin-guide?

Regards,

	Hans

> END
> 
> rsync -vuza --delete Documentation/admin-guide/media/ Documentation/media/admin-guide
> rsync -vuza --delete Documentation/driver-api/media/ Documentation/media/driver-api
> rsync -vuza --delete Documentation/userspace-api/media/ Documentation/media/userspace-api
> 
> make SPHINXDIRS="media" htmldocs
> make SPHINXDIRS="media" pdfdocs
> make SPHINXDIRS="media" epubdocs
> 


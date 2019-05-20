Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 208152413B
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 21:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfETTcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 15:32:09 -0400
Received: from keetweej.vanheusden.com ([82.161.210.122]:45797 "EHLO
        keetweej.vanheusden.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfETTcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 15:32:08 -0400
X-Greylist: delayed 515 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 May 2019 15:32:08 EDT
Received: from localhost (localhost [127.0.0.1])
        by keetweej.vanheusden.com (Postfix) with ESMTP id CDE0516311E;
        Mon, 20 May 2019 21:23:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vanheusden.com
Received: from keetweej.vanheusden.com ([127.0.0.1])
        by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DXTv2cNDonkn; Mon, 20 May 2019 21:23:30 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com [192.168.64.100])
        by keetweej.vanheusden.com (Postfix) with ESMTP id D9A47162F46;
        Mon, 20 May 2019 21:23:30 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
        id B90FB160657; Mon, 20 May 2019 21:23:30 +0200 (CEST)
Date:   Mon, 20 May 2019 21:23:30 +0200
From:   folkert <folkert@vanheusden.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Gregor Jasny <gjasny@googlemail.com>, 929262@bugs.debian.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Bug#929262: libv4l-dev: pac207 cam(s) give frame decode errors
Message-ID: <20190520192330.utegmzoih25of4lj@belle.intranet.vanheusden.com>
References: <155834073601.757.12828508994068038463.reportbug@scrollert>
 <c2d8869f-4ca5-7f70-1c0e-44d4c1e094f4@googlemail.com>
 <d5e3d25f-4df3-9aee-a212-4ad64d3c1fd7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5e3d25f-4df3-9aee-a212-4ad64d3c1fd7@xs4all.nl>
Organization: www.vanheusden.com
X-Chameleon-Return-To: folkert@vanheusden.com
X-Xfmail-Return-To: folkert@vanheusden.com
X-Phonenumber: +31-6-41278122
X-URL:  http://www.vanheusden.com/
X-PGP-KeyID: 1F077C42
X-GPG-fingerprint: AC89 09CE 41F2 00B4 FCF2  B174 3019 0E8C 1F28 D8AE
X-Key:  http://pgp.surfnet.nl:11371/pks/lookup?op=get&search=0x1F077C42
Read-Receipt-To: <folkert@vanheusden.com>
Reply-By: Wed May  8 14:21:33 CEST 2019
User-Agent: NeoMutt/20170306 (1.8.0)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

> I strongly recommend that you buy a new webcam. This is ancient hardware.
> Even the cheapest UVC webcams you can buy today will have far better
> quality than a pac207. If you really, really need this to work, then I
> need the full dmesg output and you also need to check if you can reproduce
> this issue with the v4l2-ctl command:
> 
> v4l2-ctl -d /dev/videoX --stream-mmap
> (it keeps capturing frames until you press ctrl-X)

v4l2-ctl:
- raspberry pi 2 and 3b+: fail
- laptop: ok for at least a few minutes


> I should have one of these webcams, but won't be able to test until next
> week.

Thanks but it looks to be a raspberry pi problem.

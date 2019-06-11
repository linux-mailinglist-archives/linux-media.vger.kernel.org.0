Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB433D20F
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 18:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391127AbfFKQTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 12:19:55 -0400
Received: from mx.kolabnow.com ([95.128.36.42]:14648 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388744AbfFKQTz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 12:19:55 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 2FB8C462;
        Tue, 11 Jun 2019 18:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received:received:received; s=dkim20160331; t=
        1560269989; x=1562084390; bh=jd33PblogwnWLIDaZOShdyjqjjSuTQqAQko
        t8vC75Pw=; b=iFbBs9ZTjwDnj+uRfqy2EroR8YxHOufXYBddOoi8xMK3P2uPj8x
        otdJk07VZYAYF6E2BUYaqtuU5CKvqvCGwqnh6mdJLQlcyCmC62U3Sp1pwWQvzuDd
        Ah45hYbUNeryx2myNvJBatZ0jpSwXgZodA3ZTqD1hyZV+YD9ZqHxRZsL130ngJPn
        T09+0dB72NJr4MJP4e/0/vxzk9Uvf/h7AHRkILSvqowd4FEqyS8N9ra6JqeSEsC5
        uTMQe/s9FGCukjKq3G5iK8v/6WHf4slIOKFyCcjksUcGHAVeDtt7/WT+5cLm68Sv
        s2Owu/CnlMOlNuCxayodOeXQCXPUFl8x46dItowzVCwuyQc3f56RRD6+exMbX/eo
        CCA6YtkWQVuz5NibGFPtyLalchlgLTKupwL24aKvXik/CQ150sl7kgVi7MnZ6OTO
        sjvD7c9ISxNv7H8nCItu7WWhRwFZas2ZkxBkUEtuPQD8X7/3ilAp8LQgwxZtK7z2
        vhLZ8AYZ1RfLSX1lCpQcYhv6aJBoh/1U7+FV+DR99pWOpCTDbg6rJh0qfdSS6W/q
        XCOmUxsTjKz3Pg68DOipObGpfpYApOR/rW/wEUdxmuV2FVCJ6pnZNdidc4U7NWse
        a+x0wtD6Dsrn02YYUrQ913BobzzapoY2NYsysWAjS9yrhlk/2B0gxWFU=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-10 required=5
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FjJqanaTseop; Tue, 11 Jun 2019 18:19:49 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 7DD543D8;
        Tue, 11 Jun 2019 18:19:49 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id 1F14A2660;
        Tue, 11 Jun 2019 18:19:49 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     "Hans Verkuil (hansverk)" <hansverk@cisco.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andy Walls <awalls@md.metrocast.net>
Subject: Re: [PATCH] media/pci: set device_caps in struct video_device
Date:   Tue, 11 Jun 2019 18:19:47 +0200
Message-ID: <5238064.QDOFyfcAAn@harkonnen>
In-Reply-To: <6e6e5a52-fb5f-d11b-6fd9-aca7ecadbd31@cisco.com>
References: <6e6e5a52-fb5f-d11b-6fd9-aca7ecadbd31@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tuesday, June 11, 2019 2:08:23 PM CEST Hans Verkuil (hansverk) wrote:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> But this only really works if all drivers use this, so convert
> all pci drivers in this patch.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/common/saa7146/saa7146_fops.c   |  9 ++++
>  drivers/media/common/saa7146/saa7146_video.c  | 18 ++-----
>  drivers/media/pci/bt8xx/bttv-driver.c         | 50 ++++++++-----------
>  drivers/media/pci/cobalt/cobalt-v4l2.c        | 14 +++---
>  drivers/media/pci/cx18/cx18-ioctl.c           |  5 +-
>  drivers/media/pci/cx18/cx18-streams.c         |  1 +
>  drivers/media/pci/cx23885/cx23885-417.c       | 13 +++--
>  drivers/media/pci/cx23885/cx23885-video.c     | 22 ++++----
>  drivers/media/pci/cx25821/cx25821-video.c     | 14 +++---
>  drivers/media/pci/cx88/cx88-video.c           | 32 +++++-------
>  drivers/media/pci/dt3155/dt3155.c             |  5 +-
>  drivers/media/pci/ivtv/ivtv-ioctl.c           |  7 ---
>  drivers/media/pci/ivtv/ivtv-streams.c         | 14 ++++--
>  drivers/media/pci/ivtv/ivtvfb.c               | 10 ++++
>  drivers/media/pci/meye/meye.c                 |  6 +--
>  drivers/media/pci/saa7134/saa7134-core.c      | 15 ++++++
>  drivers/media/pci/saa7134/saa7134-empress.c   |  4 ++
>  drivers/media/pci/saa7134/saa7134-video.c     | 46 +++--------------
>  drivers/media/pci/saa7164/saa7164-encoder.c   | 15 ++----
>  drivers/media/pci/saa7164/saa7164-vbi.c       | 15 ++----
>  .../media/pci/solo6x10/solo6x10-v4l2-enc.c    |  5 +-
>  drivers/media/pci/solo6x10/solo6x10-v4l2.c    |  5 +-
>  drivers/media/pci/sta2x11/sta2x11_vip.c       |  6 +--

Limited to sta2x11_vip.c

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>

>  drivers/media/pci/tw68/tw68-video.c           |  8 +--
>  drivers/media/pci/tw686x/tw686x-video.c       |  5 +-
>  25 files changed, 154 insertions(+), 190 deletions(-)




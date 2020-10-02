Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B330280DFE
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 09:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgJBHVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 03:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgJBHVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 03:21:21 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E84C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 00:21:19 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k10so585099wru.6
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 00:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w4PVlPcr7dpTEG2yTeexZo3mfBgC1LUTIE3TVKKqTC0=;
        b=IsAFPt3bvZYHfV+35NPHHU3k0vBqpZQJDx3q4QHSMyu8MkYuSqsoYTAQVpH5pHDiq4
         7Ox0cVqXMR1M/KyJrcxTxUWxWmVvsvM+jkboUDoK96PuvSrMd4M39JfI2P5qpsTaGmAQ
         W+IZZwGAh+8i2XECczaHk4P/G0zDn8/hPbT554DKt8b9sYjxNCug4gK5NBGOeuDROI86
         huv4E8++P2ep9ndFj0QayT1DEdH7V3SuMvnI7hl6Q0iAxQSR8nGHW+TkW8kw7kvFyqCe
         h6XGCFzI768Q7+bbhvkFo+5Aqs9U2ZcLvcXxya0LSu/kdLJL2pTbzK2prcjbYfkks4Kk
         LZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w4PVlPcr7dpTEG2yTeexZo3mfBgC1LUTIE3TVKKqTC0=;
        b=ThUoHIjXhGhadtC77AqzhQrkr6mrNnsgaFispveEC3Zp2qlyTJc+m1/T8tgjOigbHZ
         gTLXTd0/Ruc52QhJLoLxw2JPsRvTIjzbprrMA8Ttqu1OPL79jSt64zRILhqqJpNNjsUk
         w+uf6vYTsappDvaik53SUNxu4yRCCht2/ZVawZ8OzvtWoip3lkIaunFR6q07fjVD4xcV
         WIfDJ41nKnilHVs7zzFxZ685W7jL5aNsD44DfB/Z6Zg80tYbwSb4A0oF7AaInguXSg6d
         ISkU0tjKgVDc+0sNTeDu2FhYq2OF6qCSy7vC5uKqv9v0nntzbx4QYjT3KlwV/sRwu8+v
         GAjw==
X-Gm-Message-State: AOAM533ESsqJ+dAOR6Lwa1D5IpIjeX4Yw601NVv60fQ46YgwKCloa1q+
        iFSTsp6seK+GrTbJW0jtO9Ti6g==
X-Google-Smtp-Source: ABdhPJwFbDdME2xRypUZW1NmvccNMBIbMBry74SzvCzSLK32Q1LWoYuaZIflqgo4RWeBsSympZu2fQ==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr1306972wrn.45.1601623278234;
        Fri, 02 Oct 2020 00:21:18 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id m10sm756826wmi.9.2020.10.02.00.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 00:21:17 -0700 (PDT)
Date:   Fri, 2 Oct 2020 09:21:15 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 3/3] media: zoran: fix mixed case on vars
Message-ID: <20201002072115.GC15586@Red>
References: <21fd8f12edb27d269eefdbea172aa3a80e2aa6ce.1601544491.git.mchehab+huawei@kernel.org>
 <5e09ed2cc5cacfac0653089fc976be3409f0fa9d.1601544491.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e09ed2cc5cacfac0653089fc976be3409f0fa9d.1601544491.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 01, 2020 at 11:28:15AM +0200, Mauro Carvalho Chehab wrote:
> Use this small script to replace CamelCase and wrong case
> on vars:
> 
> <script>
> FILES=$(find "$1" -type f|grep -e '.c$' -e '.h$')
> CAMEL_VARS=$(cat tags|perl -ne 'print "$1\n" if (m/^(\w*[A-Z]\w*[a-z]\w*)\s/)')
> for i in $CAMEL_VARS; do
>         new=$(perl -e '
>                 my $s = $ARGV[0];
>                 $s =~ s{([^a-zA-Z]?)([A-Z]*)([A-Z])([a-z]?)}{
>                         my $fc = pos($s)==0;
>                         my ($p0,$p1,$p2,$p3) = ($1,lc$2,lc$3,$4);
>                         my $t = $p0 || $fc ? $p0 : '_';
>                         $t .= $p3 ? $p1 ? "${p1}_$p2$p3" : "$p2$p3" : "$p1$p2";
>                         $t;
>                 }ge;
>                 print $s;' "$i")
>         for j in $FILES; do
>                 sed -E "s,\b$i\b,$new,g" -i $j
>         done
> done
> for i in $(git grep "#define zr" drivers/staging/media/zoran/*.[ch]|perl -ne 'print "$1\n" if (m/#define\s+(zr\S+)/)'); do j=$(echo $i|tr [a-z] [A-Z]); sed "s,\b$i\b,$j,g" -i drivers/staging/media/zoran/*.[ch]; done
> </script>
> 
> This should solve almost all warnings reported by checkpatch.pl
> in strict mode.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/staging/media/zoran/videocodec.h   |   2 +-
>  drivers/staging/media/zoran/zoran.h        |  30 +--
>  drivers/staging/media/zoran/zoran_card.c   |  52 ++---
>  drivers/staging/media/zoran/zoran_device.c | 242 ++++++++++-----------
>  drivers/staging/media/zoran/zoran_driver.c |  94 ++++----
>  drivers/staging/media/zoran/zr36016.c      |  14 +-
>  drivers/staging/media/zoran/zr36050.c      |   2 +-
>  drivers/staging/media/zoran/zr36057.h      | 122 +++++------
>  drivers/staging/media/zoran/zr36060.c      |  76 +++----
>  drivers/staging/media/zoran/zr36060.h      |  66 +++---
>  10 files changed, 350 insertions(+), 350 deletions(-)

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks

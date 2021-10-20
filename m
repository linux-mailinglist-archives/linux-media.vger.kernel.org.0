Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B26434B8B
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 14:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhJTMuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 08:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhJTMue (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 08:50:34 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E3EC06161C;
        Wed, 20 Oct 2021 05:48:20 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id e65so20009355pgc.5;
        Wed, 20 Oct 2021 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/8aZ4SK2m8/sLSKz111lgbTcgtIRMhqxBR7wyJ7Da4o=;
        b=fKBhoibSLqY2GF6nDhYN4xEhIBuJFvkjGY7GOVBHY+RuQ5iFg91hg3ClbhpUKgAmqp
         fqTy0iOwiu2Gb1spscCi9NGNIB1Lai/O6ws4Lf/XYmqu/wh+ZeWWJVZL5ar0BMQvv5VT
         fsc56U39si2lWQOlDKnwzlgagL9dK8ZmKxaRe9vL2VZZwKUhKd4Fwq42lCpw/KQlboKz
         ubfC5HeuvS8YCLPbvCxswHB9eKj4QQ2HYQJ72nmplm5zyUIfCZfAo9lckrGNVtGKKcy2
         fMBuHTo1Ib+78juabqOtCXJD67qVfbT5DvUReHY8S7QGQvcdyDv65DJ1ZV8R3DILgsgT
         36QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/8aZ4SK2m8/sLSKz111lgbTcgtIRMhqxBR7wyJ7Da4o=;
        b=lKlTATCWWQnLDbDeK7SGPSwkcDj/azbFQaWPc6iu1MaJSXDMHA0VI8i1QMI+PVRh+Q
         bO2mO9snWudABdSGQEpUfRvwQfubYLwZf54s+paX91jqJBMg5aPjRq0BDvB+o/H7S9Kp
         LSpCyrSvXcTA4+p5J+oiFBjHPw2zDc3kGSBI9+uirS5gWFp+s6QPTqgio5ExQ4+c2Fv1
         elXY6Cv2gx9YKRSUsXJRcZkSUyLAuiD2hfP8+VGAsz8zB3xxueS4YKjYol9xyWTUREhb
         JTouNoNWb3Wog/QNIZmbpRD2unQKN65twYkxInI4CRChiFdHj11xzPx6dLp7opCW+kuv
         S34w==
X-Gm-Message-State: AOAM5327PqvhR2PJ5KxfoAsYa+P3DnSooQ/ksAu7GWZ4M+gerK5Vhdo7
        wgzQSMTg5CqqQFNOCdOVuXA=
X-Google-Smtp-Source: ABdhPJwCOENoENYrA36VDJAwEewKW8FoJuumxo9secHYYu7z+3x8Kt/e0IVX10vzhKOCXoculCQS6w==
X-Received: by 2002:a63:794b:: with SMTP id u72mr34325043pgc.191.1634734100009;
        Wed, 20 Oct 2021 05:48:20 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id t4sm2784125pfj.13.2021.10.20.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 05:48:19 -0700 (PDT)
Message-ID: <fa4ec49ac7abda3ef24c58bae1ee498e11bebc9a.camel@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date:   Wed, 20 Oct 2021 21:48:10 +0900
In-Reply-To: <YW1U0UtNpA9DYZ56@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <YW1U0UtNpA9DYZ56@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-10-18 at 14:04 +0300, Andy Shevchenko wrote:
> On Mon, Oct 18, 2021 at 01:19:40AM +0900, Tsuchiya Yuto wrote:
> 
> Just a remark, your To is not filled. At some point I had written a script [1]
> to help me with patch series sending, It also tries to be smart to include
> necessary people and mailing lists (you can always alter it by adding more).
> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

Ah thanks. I didn't use To but just used `--cc-cmd` with
scripts/get_maintainer.pl without thinking deeply...
I'll definitely try your script next time I send patches.

Regards,
Tsuchiya Yuto


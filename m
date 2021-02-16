Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F5531D1FD
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 22:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhBPVTk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 16:19:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbhBPVTd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 16:19:33 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE0FC061756;
        Tue, 16 Feb 2021 13:18:52 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o15so96936wmq.5;
        Tue, 16 Feb 2021 13:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6vedo8W/6qWPUt/+BKTlFoVhMoDHLM1dBDJR550KtdE=;
        b=al+D3i+Zt3NA99dyoxSWDLmJSD87CYOfxu0lK8OipS4kCNnFdHTV5q5GiqJPQrbeg8
         L1Y7nthHQ5hZclx/MNWlP899Nnq6XjGdh+qxuIqgwE582fI5Uh2oEySoQaSZN+tF0qYJ
         J+xE1gZtgIq5ZEJNqgqoDrJmvYHB9g3AzD4NpwKVIMSKpfaex6yBoo5AToCt1D3wQM3Q
         s0ApvBBjG2FrvegtK8hZ8bds/zBxOt8EyD6SkmvKHJ+7my15W8fPvJHNrLeNaM7yTBwF
         wGpcDCgr9jjyGc/onHyTEbf+Q2Z8qsmnuIYxpik5YoST0P+8hHKl1jAqS/FuJ5xDpyEh
         g2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6vedo8W/6qWPUt/+BKTlFoVhMoDHLM1dBDJR550KtdE=;
        b=qCveOmx59nMloAA4FS8rVmCZvTe4qJUkDjXT0qfhDEeqK0p7us9TSZo463mrqI2Kmy
         wxLqpwORW2/ox0FTf5w1O4IEeD3waNaKyFi8cDPqLa4u2CozZ8+P/zB4gg3w/ycmBllg
         t52V8Whw3Ckmc8oaF9k+tz1LlyTaSoEV2JZtodFo4VKEn7Hc/WXMd8UIROgHV2+xTUVu
         mJZaetD49aONa8+nSOkHK6xLfCyNP7x4yEV+Y5Ck9q5DacZePQ4Ghjf4k5gXgqR40DDi
         vflMc7Ydl35qnN1tFsKpUWU6LEK84FaB+Hj5yndx6a/R7U8HR6uLumXg3uQt3CEaog/H
         +5cg==
X-Gm-Message-State: AOAM533QvKw9jobaX5TpoGvHzg7Os16vktywLUZp5a9NSGHexNdPG/Xn
        1AZftA3tmi3W5nP65a6qdnNDoEFTTdPUhw==
X-Google-Smtp-Source: ABdhPJy+kXgSH51yldd0iyYVx1Hf74I3mdzTuYAqUt9RNaIEbo1a0SBA0kaurMy9+RPsBS8O24GJKA==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr3880287wmi.171.1613510330882;
        Tue, 16 Feb 2021 13:18:50 -0800 (PST)
Received: from trashcan (host-5-58-109-138.bitternet.ua. [5.58.109.138])
        by smtp.gmail.com with ESMTPSA id m11sm5059974wmi.25.2021.02.16.13.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 13:18:50 -0800 (PST)
Date:   Tue, 16 Feb 2021 23:56:49 +0300
From:   Vladimir Lypak <junak.pub@gmail.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     robert.foss@linaro.org, sakari.ailus@linux.intel.com,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] media: qcom: camss: V4L2_CID_PIXEL_RATE/LINK_FREQ
 fixes
Message-ID: <YCwxkdNKXMunBVZG@trashcan>
References: <20210214213404.8373-1-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210214213404.8373-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, Andrey!

Thank you for including my patch, i'm glad you did it. This patchset works
fine for me.

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF2CB5AA4
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 07:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfIRFE5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 01:04:57 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36882 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfIRFE5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 01:04:57 -0400
Received: by mail-ed1-f66.google.com with SMTP id r4so5385331edy.4
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 22:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e48p6uPfHULIZ05Cw+ifgm/hM+nqzK01ZkMc8Ly8CnU=;
        b=HLf79YsjUds4EoGorSOfTVx0KfeKxm1Z+uGw+80dfzKkHgrSlNXdo+dPafJDZhYW6M
         wq6yaKolBmhKpw/ue1AzIzocsxKvpSjK7D8I52X7JOuAyfn1hRRenqdih5S7fy9NUDyc
         bmvESPVbCTTPbvO+6TzNV6OSRynIl4aygIjh430Td4NoPXnyLRkWk0naDPy49osW2a+s
         GxomKwnep4s2bE63md5HhM6fZ9xjm7k8QYCy2AJHyG1iDvlVpd7/XpaviahdeOiu6fsN
         +r4m4PFZmkY2eXl/uscSkWpQqTnrBs89UiEFfZjfQcB/IjuYe8+wDPVZxFuulUo9zhhZ
         ANHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e48p6uPfHULIZ05Cw+ifgm/hM+nqzK01ZkMc8Ly8CnU=;
        b=FuHgpQBhzhPJQFDVdrpM0DX/eEAQEHHO8lbYhelOo2l8bOWs5bj3gUE8q0+DpAu+J8
         tligOrcR7MNTDAd6g0woCNeDYv8pNnOSrIXzxx1Q10wNzyIvoLWEHjwI4HafIOohOtQW
         2GiExw8YHHRdLYuU7fFRDuUo9NVM3w2Gnh8lDiXht3AK3dIWyKl1GAKpSi+9fRZKxJB8
         EHcmwLRWs044f78gSIlL24zwETT3cnJhQ8rmQU9CqY3zvpHyjNmdbVQDAmW/A7thBdZH
         onhmQ/Yppy99RfTCnn9RaubuxPrKBnTPEdbkTw2JFdWwzxzLVJi8Q5XzK8wG5jmUEB/d
         UQyA==
X-Gm-Message-State: APjAAAWBoExIXjp+gexBDYdlR378wTOoRPcrVjBku8ClLEw+iFtvWb4J
        /K9i8ifuN9R52Y45xLAYbrmsMq3nOnzRHL5N1FDqng==
X-Google-Smtp-Source: APXvYqwpwzcUgxMNWjSA9Yv60vxWhiDCMazF6IUXL4xHlEQ8kCga+3kmhrj9uQl/QO7vcp14ZPmZyY6fMlCNz5FOm14=
X-Received: by 2002:a17:907:20a2:: with SMTP id pw2mr7721793ejb.163.1568783095342;
 Tue, 17 Sep 2019 22:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190909072815.23981-1-boris.brezillon@collabora.com> <20190909072815.23981-3-boris.brezillon@collabora.com>
In-Reply-To: <20190909072815.23981-3-boris.brezillon@collabora.com>
From:   Francois Buergisser <fbuergisser@google.com>
Date:   Wed, 18 Sep 2019 14:04:44 +0900
Message-ID: <CABK_QF1kBNHkZDiOK8ZmXchGH87kwo8EnKDfS_HCw4qLQ8jLAw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: hantro: h264: Fix the frame_num wraparound case
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 9, 2019 at 4:28 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Step '8.2.4.1 Decoding process for picture numbers' was missing in the
> reflist creation logic, leading to invalid P reflists when a
> ->frame_num wraparound happens.
>
> Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
> Reported-by: Francois Buergisser <fbuergisser@google.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Francois Buergisser <fbuergisser@chromium.org>

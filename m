Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5263E9F74
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 09:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbhHLHcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 03:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51204 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234315AbhHLHco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 03:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628753539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6f58TOtWer368hRYhnkXwLD6FguP4+evhzIoFM/JA6Q=;
        b=WlGPS6dB3FlAz+5a6r3ElKtTNmh8tJkAXea69wnZfVpTNrdQWf+xHQZ6Z9tXGK5XUoFHtz
        10XVGlzpo3A9XS3E4mcvmYI8hJCS4iL0Ir82b3EZ7Oh/pUoI7CSVaj0Uui4aoreVi24NOW
        ZdXVFa6kWxAOp9O94H284Jwokd9SUYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-Hu38IQyYM4ev8s7frURskQ-1; Thu, 12 Aug 2021 03:32:17 -0400
X-MC-Unique: Hu38IQyYM4ev8s7frURskQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F558799E0;
        Thu, 12 Aug 2021 07:32:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3616A05F;
        Thu, 12 Aug 2021 07:32:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 088651800922; Thu, 12 Aug 2021 09:32:14 +0200 (CEST)
Date:   Thu, 12 Aug 2021 09:32:14 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        dongwon.kim@intel.com, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        syzbot+e9cd3122a37c5d6c51e8@syzkaller.appspotmail.com
Subject: Re: [PATCH next] udmabuf: fix general protection fault in
 udmabuf_create
Message-ID: <20210812073214.xwflqw7c6cpt3n7p@sirius.home.kraxel.org>
References: <20210811175052.21254-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811175052.21254-1-paskripkin@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 11, 2021 at 08:50:52PM +0300, Pavel Skripkin wrote:
> Syzbot reported general protection fault in udmabuf_create. The problem
> was in wrong error handling.
> 
> In commit 16c243e99d33 ("udmabuf: Add support for mapping hugepages (v4)")
> shmem_read_mapping_page() call was replaced with find_get_page_flags(),
> but find_get_page_flags() returns NULL on failure instead PTR_ERR().
> 
> Wrong error checking was causing GPF in get_page(), since passed page
> was equal to NULL. Fix it by changing if (IS_ER(!hpage)) to if (!hpage)
> 
> Reported-by: syzbot+e9cd3122a37c5d6c51e8@syzkaller.appspotmail.com
> Fixes: 16c243e99d33 ("udmabuf: Add support for mapping hugepages (v4)")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Pushed to drm-misc-next.

thanks,
  Gerd


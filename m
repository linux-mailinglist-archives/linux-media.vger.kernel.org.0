Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841362B87A8
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 23:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgKRW11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 17:27:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:44514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbgKRW11 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 17:27:27 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7EDF2246DC;
        Wed, 18 Nov 2020 22:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1605738447;
        bh=94UdQ2k5CQSg/1Sgfe2lKi2FCJuR7P7/YYX3gXoXjV4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bBMe49pWRvdeGVL+4JZmH932PP/E4wl9kdxyjoz/amhz+ik+Ae+SNEpmTxW0MfJMr
         1kD0vxhiYRiW+apqUA09XvjsRdznxKGOcQK0XzmnE6ICiZL2TQUGzm7vCPCL5UTfnv
         mk0vq1e0KkT5QUu0BYBa7amj3lDXscL4yWDKV7go=
Date:   Wed, 18 Nov 2020 14:27:25 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     christian.koenig@amd.com
Cc:     Christian =?ISO-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: mmap: fix fput in error path v2
Message-Id: <20201118142725.aa4678810546c70520dd5d74@linux-foundation.org>
In-Reply-To: <e5a25173-ebea-d856-ed25-45437769f17f@gmail.com>
References: <20201106114806.46015-1-christian.koenig@amd.com>
        <20201106114806.46015-2-christian.koenig@amd.com>
        <20201106144811.cf228ca9278ec78887d42960@linux-foundation.org>
        <e5a25173-ebea-d856-ed25-45437769f17f@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 18 Nov 2020 11:57:44 +0100 Christian K=F6nig <ckoenig.leichtzumerke=
n@gmail.com> wrote:

> Am 06.11.20 um 23:48 schrieb Andrew Morton:
> > On Fri,  6 Nov 2020 12:48:05 +0100 "Christian K=F6nig" <ckoenig.leichtz=
umerken@gmail.com> wrote:
> >
> >> Patch "495c10cc1c0c CHROMIUM: dma-buf: restore args..."
> >> adds a workaround for a bug in mmap_region.
> >>
> >> As the comment states ->mmap() callback can change
> >> vma->vm_file and so we might call fput() on the wrong file.
> >>
> >> Revert the workaround and proper fix this in mmap_region.
> >>
> > Seems correct, best I can tell.  Presumably all ->mmap() instances will
> > correctly fput() to original file* if they're rewriting vma->vm_file.
>=20
> Yes, exactly.
>=20
> Patch #2 provides a helper to make sure that everybody gets the=20
> get_file()/fput() correctly while updating vma->vm_file.
>=20
> Can I add your acked-by to the patches and push them upstream through=20
> drm-misc-next?

Please go ahead.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

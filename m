Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC3327819C
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 09:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgIYHcL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 03:32:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:46624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727201AbgIYHcJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 03:32:09 -0400
Received: from coco.lan (ip5f5ad5bf.dynamic.kabel-deutschland.de [95.90.213.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 818572311B;
        Fri, 25 Sep 2020 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601019128;
        bh=IoufJd/unL5ddJzTrngS83s9J3bqPwyXQ5EPjYOcYlw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mdW9CaZT6xUuqHDPKcn8zjB4tIwp3pIi1go993fXEbKmJyI3RMnK1vRIk/El1qFwk
         bfWkOlF7Hfm/4zgEM3ZS6GGziR+oXePk9bQfL4ShgOLYRSa2ngEbW7YNKeiOn4BJp7
         UYvvgC6gIoNvn507kPTjdpJ4wq/YFin1NJZXzd4Y=
Date:   Fri, 25 Sep 2020 09:31:58 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jian-Jia Su <jjsu@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sean Young <sean@mess.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 0/8] Improve support for building docs with Sphinx
 3.1+
Message-ID: <20200925093158.2b605cc4@coco.lan>
In-Reply-To: <cover.1601014299.git.mchehab+huawei@kernel.org>
References: <cover.1601014299.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 25 Sep 2020 08:30:38 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Sphinx 3.x new c domain code broke the doc build on several ways:
> 
> - it broke the cdomains.py extension that were giving namespace
>   support for C references;
> - it broke the automarkup script;
> - it broke c:type references that kernel-doc and other parts of the
>   kernel were using to do cross-references with C declarations.
> 
> This series address only part of those issues. It halves the number
> of warnings produced when Spinx 3.x is used.  Yet, we still
> have 1.7 K warnings.

At least some of the warnings seem to be due to some issues at
Sphinx 3.x. I opened an issue to Sphinx upstream:

	https://github.com/sphinx-doc/sphinx/issues/8241

Thanks,
Mauro

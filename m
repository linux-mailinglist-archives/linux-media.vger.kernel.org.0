Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20996204F7C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 12:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732259AbgFWKrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 06:47:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:37924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732185AbgFWKrq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 06:47:46 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EB2320724;
        Tue, 23 Jun 2020 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592909266;
        bh=IuNHkdXSmkKoUf3I+7c55BV9jdlYn6tmdWZ9W+MLaPY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=be/hbqCkWJ5sxrndNuVGOOfUHQUDFCxJ+5utIMTcTMqk5Nfa9h2nitF4aSGXrTPcq
         aJvoJl8VUps4K3SoFg8N0IyQh00H+V2l8gi97JdZeAC3tNKLdZ13NODeQIHAWxurDI
         7gY6O8hbXDsyg3/ig+aU/VCg5PZm5qby6o/epbxc=
Date:   Tue, 23 Jun 2020 12:47:41 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCHv3 1/5] media: docs-rst: Document memory-to-memory video
 encoder interface
Message-ID: <20200623124741.2de499cc@coco.lan>
In-Reply-To: <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
        <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 26 May 2020 12:09:28 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

There are some things here that it should be fine for now, but I would like
to be added on our TODO:

> +Conventions and Notations Used in This Document
> +===============================================

...

> +
> +2. The meaning of words "must", "may", "should", etc. is as per `RFC
> +   2119 <https://tools.ietf.org/html/rfc2119>`_.
> +
> +3. All steps not marked "optional" are required.

Those should be moved in the future to the media uAPI spec as a hole.

> +
> +4. :c:func:`VIDIOC_G_EXT_CTRLS` and :c:func:`VIDIOC_S_EXT_CTRLS` may be used
> +   interchangeably with :c:func:`VIDIOC_G_CTRL` and :c:func:`VIDIOC_S_CTRL`,
> +   unless specified otherwise.
> +
> +5. Single-planar API (see :ref:`planar-apis`) and applicable structures may be
> +   used interchangeably with multi-planar API, unless specified otherwise,
> +   depending on encoder capabilities and following the general V4L2 guidelines.

Probably those too.

> +Glossary
> +========
> +
> +Refer to :ref:`decoder-glossary`.

I have some patches (yet to be merged) for a media glossary. We should move
the decoder one to be at the same place.

Thanks,
Mauro

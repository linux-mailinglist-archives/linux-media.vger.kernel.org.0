Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B0D1C6FE8
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 14:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgEFMGQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 08:06:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:40350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726516AbgEFMGP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 08:06:15 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 482A5206DD;
        Wed,  6 May 2020 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588766775;
        bh=Cnp72gZDSXB8fmfb3YiD6pjx7zR+G2HEJElDv28YT6M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=y2JlDFBMfsT6Jd0mCFP1BtcfpgZbUvODxvZGvAH8eJAgobWN6UNRpndZldiQ9okZf
         ym0sPEyoUnaak5W1axNsfOlT/1Udnr7hC5vgXLUoyponLwbu7y7YIAXAgA6M0uw6fN
         oiJACsVGc2HbsW5o2jI3ctIkl0YGRo/Sgtej3xtc=
Date:   Wed, 6 May 2020 14:06:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCHv2] media: vidioc-enum-fmt.rst: make the ENUM_FMT text
 clearer
Message-ID: <20200506140610.51bbf0c8@coco.lan>
In-Reply-To: <e9daad9e-f481-93e7-c338-0f29105fc148@xs4all.nl>
References: <e9daad9e-f481-93e7-c338-0f29105fc148@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 6 May 2020 13:40:52 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> +
> +2) ``V4L2_CAP_IO_MC`` is set (also known as an 'MC-centric' driver)
> +
> +   If the ``mbus_code`` field is zero, then all image formats
> +   shall be enumerated.
> +
> +   If the ``mbus_code`` field is initialized to a valid (non-zero)
> +   :ref:`media bus format code <v4l2-mbus-pixelcode>`, then drivers
> +   shall restrict enumeration to only the image formats that can produce
> +   (for video output devices) or be produced from (for video capture
> +   devices) that media bus code.

Patch looks ok, but I guess we need to add one more thing to have a
fully defined behavior. I mean:

What happens otherwise? E. g. if application uses a non-zero
value for mbus_code that it is not valid / or it is valid but
unsupported?

Should it return an empty list or an error code?

Thanks,
Mauro

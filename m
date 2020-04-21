Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753A21B24B0
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 13:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgDULMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 07:12:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:60218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgDULMt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 07:12:49 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF920206F4;
        Tue, 21 Apr 2020 11:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587467569;
        bh=bsU0LhyIipku/8tRzXhJp8uGL+PAuJZLNvNzvI7yCao=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DiXTKpdDtRJlrmxWgUU6YKSWGSjXEWSWCeTMrp8lAJ3Ta+C0fCIK+1KbqelORevvA
         kv73wOte0xWtRpjVWU10HQNlOz34LSHClud3dxyEqeNoot4yQKU1yDp5U+kNGeGWoz
         ZtwbqlKxw1YMHHbfPEuM/77dHyJSPe0bN+/HH/EI=
Date:   Tue, 21 Apr 2020 13:12:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH v7 04/11] media: imx: utils: Handle Bayer format lookup
 through a selection flag
Message-ID: <20200421131244.763f82df@coco.lan>
In-Reply-To: <20200406163905.24475-5-slongerbeam@gmail.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
        <20200406163905.24475-5-slongerbeam@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon,  6 Apr 2020 09:38:58 -0700
Steve Longerbeam <slongerbeam@gmail.com> escreveu:

> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The format lookup (and enumeration) functions take a boolean flag to
> tell if Bayer formats should be considered. This leads to hard to read
> lines such as
> 
> 	return enum_format(fourcc, NULL, index, cs_sel, true, false);
> 
> where the boolean parameters can easily be mixed. To make the code
> clearer, add a CS_SEL_BAYER flag that can be passed through the
> codespace_sel parameter of the lookup functions to replace the bool
> parameter.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> [Instead of declaring CS_SEL_ANY as a bitfield containing only
>  CS_SEL_YUV | CS_SEL_RGB, declare CS_SEL_ANY as all of the above
>  (YUV, RGB, BAYER). A new enum is declared for the YUV | RGB selection
>  as CS_SEL_YUV_RGB, and that is used by sub-devices that don't support
>  BAYER and only allow selecting and enumerating YUV or RGB encodings.
>  CS_SEL_ANY is now only used by the CSI sub-devices and the attached
>  capture interfaces, since only those devices support BAYER formats.]

I'm assuming that the comments like the above on this patchset means
that the Steve changed a patch from Laurent. The right markup
(as stated at Documentation/process/submitting-patches.rst) is:

	Signed-off-by: Random J Developer <random@developer.example.org>
	[lucky@maintainer.example.org: struct foo moved from foo.c to foo.h]
	Signed-off-by: Lucky K Maintainer <lucky@maintainer.example.org>

e. g. the above should be, instead: 

	[slongerbeam@gmail.com: Instead of....]

Let's please stick with the standard meta-tag.

PS.: I'm also fixing other similar patterns on this patchset.

Regards,
Mauro

Thanks,
Mauro

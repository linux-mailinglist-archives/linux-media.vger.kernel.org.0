Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9B94364DE
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 16:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhJUPBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 11:01:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:60968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230072AbhJUPBL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 11:01:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C237160F9F;
        Thu, 21 Oct 2021 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634828334;
        bh=bW/I/j2Kp4B2+TAS5IhfkFW8G7+AnavzGY5r/gc6q84=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rk6PefiXfWpRvgTXUgs0RUAxC2hiStOf87Gk6dSbvEJ2JPgWT9kgVCW1zGf65lR+6
         XgFCF+Ls69X94g3rt9+Oj+bfw/Cva5BRDgEzpHWVSHzaSBhF3loj5K5CqVm2N0fRnQ
         JNH2t0rBYqnTqzTd97cakzR7e6tUoPZnLeOeUUpK+JiBfhHycHvtvCnFoELPCJQClp
         jnx3JQnsP6UA/rCOVHiFBPInsvaY7Ft5eBQZo/Jbf8erLJWm4GqMycyqEH1kuApobP
         aS4893awRMHWQ+FJrPL2Jnu4R4CrtkLlJOgEeoZp35bdeevizH4JcIBpwbo9HQdYUu
         f4mQbpH6i8RQw==
Date:   Thu, 21 Oct 2021 15:58:48 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, Sean Young <sean@mess.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: Document coding style requirements
Message-ID: <20211021155848.05af3a9b@sal.lan>
In-Reply-To: <154bef2e-15e9-0f81-dac9-8a9e39d43b17@xs4all.nl>
References: <20211013092005.14268-1-jacopo@jmondi.org>
        <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
        <154bef2e-15e9-0f81-dac9-8a9e39d43b17@xs4all.nl>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 21 Oct 2021 16:10:08 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> There is one other requirement: the patches must be run through
> scripts/checkpatch.pl --strict. Anything that --strict notifies you of and
> that is reasonable to fix (not everything can be fixed) should be fixed.

This is already there:

	Coding Style Addendum
	+++++++++++++++++++++
	
	Media development uses ``checkpatch.pl`` on strict mode to verify the code
	style, e.g.::

		$ ./scripts/checkpatch.pl --strict --max-line-length=80

> 
> Also (although perhaps out of scope for a coding style) before new V4L2
> drivers or substantial enhancements to V4L2 drivers can be accepted, you must
> run 'v4l2-compliance -s' for the video device (or even better use -m if the driver
> creates a media device) and include the output with the cover letter of
> the patch series. Obviously, any failures should be fixed.

This is also there:

	There is a set of compliance tools at https://git.linuxtv.org/v4l-utils.git/
	that should be used in order to check if the drivers are properly
	implementing the media APIs:
	
	====================	=======================================================
	Type			Tool
	====================	=======================================================
	V4L2 drivers\ [3]_	``v4l2-compliance``
	V4L2 virtual drivers	``contrib/test/test-media``
	CEC drivers		``cec-compliance``
	====================	=======================================================
	
	.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
	       V4L2 drivers.
	
	Other compilance tools are under development to check other parts of the
	subsystem.
	
	Those tests need to pass before the patches go upstream.

Regards,
Mauro

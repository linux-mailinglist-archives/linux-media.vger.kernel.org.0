Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7663E1AEE
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 20:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239712AbhHESFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 14:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbhHESFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 14:05:34 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3462C061765
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 11:05:19 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id F06B0202A5;
        Thu,  5 Aug 2021 21:05:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1628186715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WWVuUWu5tevIWNc5csvndj7WuzG1IigCjb17QcUqQqY=;
        b=oF/4STmBAZPwHJzVnKOdsNUSC8Q4Bt9R4YeTGxbX5EElNVhynxWYzLGLO2vJAU+I+J3XUq
        Kw1vtS5mxXPPSglPZI+aRrwwIDXpEDliWgl6J4SrqhEcooT4+DdLUD807mIJrQp11aHBjn
        UphYm/wnGwbdZCeFsk+JVsrXy3+xaRQ=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CE86B634C89;
        Thu,  5 Aug 2021 21:03:55 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1mBhjr-00034a-DH; Thu, 05 Aug 2021 21:05:03 +0300
Date:   Thu, 5 Aug 2021 21:05:03 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX
 controls
Message-ID: <20210805180503.GF3@valkosipuli.retiisi.eu>
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
 <20210722121249.16483-2-david.plowman@raspberrypi.com>
 <YQwCOBCFK9w4dvxl@pendragon.ideasonboard.com>
 <20210805154042.GE3@valkosipuli.retiisi.eu>
 <YQwIjW1BannEjBWg@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQwIjW1BannEjBWg@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1628186715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WWVuUWu5tevIWNc5csvndj7WuzG1IigCjb17QcUqQqY=;
        b=WMciXSkLlg2FTmZGCl55oOxLBatDAkl5ENDyoQSLS/++XlcsNvt542nr2o0ElRGHYFJjWo
        qfmZyvKaOdKK0aKSjJlCFGzJly7EORB5os4Bml7DxVgvj4PzPeKVAsgdzLG7QcH9QDTQiF
        rZCBJOFXFCwPDcW64YehmkWvjp5EcP0=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1628186715; a=rsa-sha256; cv=none;
        b=x8ClMDZoP3N0sbGECqcAulcqHabt/lhc+hEC1Mq97QvrDH86+mpWgsofZajj2b50xFtvaD
        zVGEdzD4OKKLVaKcGErMuNEasGLlZ0rFmFdbp+hdEda77VqathcCsxc3RNWWtXKZytygxY
        8NeYBI5gPdZcHRSCle/RtEHs4lTTtVE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 05, 2021 at 06:49:33PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Aug 05, 2021 at 06:40:42PM +0300, Sakari Ailus wrote:
> > On Thu, Aug 05, 2021 at 06:22:32PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jul 22, 2021 at 01:12:48PM +0100, David Plowman wrote:
> > > > We add new controls, one for each of the four usual Bayer channels:
> > > > 
> > > > V4L2_CID_NOTIFY_GAIN_RED
> > > > V4L2_CID_NOTIFY_GAIN_GREENR
> > > > V4L2_CID_NOTIFY_GAIN_BLUE
> > > > V4L2_CID_NOTIFY_GAIN_GREENB
> > > 
> > > This will effectively limit the API to Bayer patterns. I wonder if we
> > > should instead implement it as a single array control, with one element
> > > per CFA component.
> > 
> > There are other raw patterns, too. Supporting them would likely require one
> > or a few more controls.
> > 
> > That said, as the values change often it's more efficient to use a single
> > control. But each colour combination (not each pattern) would require its
> > own control in this case, eventually requiring more controls.
> 
> I'm not sure to follow you. My idea is to define a single control, with
> a number of elements that depends on the pattern being used, and the
> order specified in the native sensor pattern. I don't think each colour
> combination would then require its own control.

Ah, I guess that would work, too. Then we'll need to define what kind of
pixel orders are supported for that single control (and for which formats).

-- 
Sakari Ailus

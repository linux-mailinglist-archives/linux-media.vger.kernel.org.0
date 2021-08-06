Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187D93E262D
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 10:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240121AbhHFIdV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 04:33:21 -0400
Received: from meesny.iki.fi ([195.140.195.201]:35922 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235706AbhHFIdV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Aug 2021 04:33:21 -0400
Received: from hillosipuli.retiisi.eu (dbd1vftgng281pd4yskly-3.rev.dnainternet.fi [IPv6:2001:14ba:8eb:1240:ab2d:b956:f00:7a12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 572F820076;
        Fri,  6 Aug 2021 11:33:04 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1628238784;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pSO9pDTGFXbgciUAqhFWVsu3ZrrPGLOTtN55gef6WAc=;
        b=rX934tPyhGYII+9OKg6jdDKBgyQBqLp8R5JrMzFyygocevY6GkTa+XU97VAi0PE4UlZ1Bg
        R3OiVyr6RB2QN8hnbrg7ZCkhZNNCSUaWUQ21EdNfQnycF+vRBR0RyNQZlfU4HXd+U0/VCp
        I1xj2yufK9BnkhuPl/Jz1ElFs3KA1Qg=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4902C634C89;
        Fri,  6 Aug 2021 11:31:41 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1mBvHf-00039l-Dg; Fri, 06 Aug 2021 11:32:51 +0300
Date:   Fri, 6 Aug 2021 11:32:51 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX
 controls
Message-ID: <20210806083251.GH3@valkosipuli.retiisi.eu>
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
 <20210722121249.16483-2-david.plowman@raspberrypi.com>
 <YQwCOBCFK9w4dvxl@pendragon.ideasonboard.com>
 <20210805154042.GE3@valkosipuli.retiisi.eu>
 <YQwIjW1BannEjBWg@pendragon.ideasonboard.com>
 <20210805180503.GF3@valkosipuli.retiisi.eu>
 <CAHW6GYJpV0gyNVLFoFbmxRQfhzTaK2DFA7R5ah-+W3U8XpkK7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHW6GYJpV0gyNVLFoFbmxRQfhzTaK2DFA7R5ah-+W3U8XpkK7A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1628238784;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pSO9pDTGFXbgciUAqhFWVsu3ZrrPGLOTtN55gef6WAc=;
        b=FAcn97hJEocHT+X5UMvsgECrPHfagdCINiyXllnAzmKih932TVpHpqVoSSmn7mOWFS6vML
        GPbbfXt3Q9F2HIAvVE2o7++OI4iNzhv/Bk5K2otgh31m7uE0NL5gwyO3qBBg4UT86/VQn+
        jfDrzU6nB3ZomXNMWwoqCYN5C7skngA=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1628238784; a=rsa-sha256; cv=none;
        b=CH/x6gtH+2VjisZtN3MSF1Il3eSKjQ7gqd9YfLihsXVDJil69KCOK3LbMjvmRL6Y0hcDQ7
        y7sFwDT2uMyNO6ESpgnC97eGVql3l8WySUPw8d3rattak3xsHAhdWAdFwwMzrpI9SbDDMY
        RipLo/y+NAkskM3zm5sIsDoZDH0TCZU=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On Fri, Aug 06, 2021 at 09:15:09AM +0100, David Plowman wrote:
> Hi Sakari, Laurent
> 
> Thanks for the various comments and discussion. It did prompt me to
> have some second thoughts about some of the details here, as follows.
> 
> These controls are aimed specifically at sensors that do some kind of
> on-board "demosaic / remosaic" process, for instance to produce
> standard Bayer patterns from non-standard ones. As such the principal
> requirement is for the sensor to know what "grey" looks like, which we
> tell it by sending it the red and blue gains from the white balance
> algorithm. (This obviously enables it to reduce colour aliasing during
> the processing that it does.)
> 
> So perhaps the comparison here should be with the existing
> V4L2_CID_RED/BLUE_BALANCE controls. I'm not sure that it really
> matters exactly what the colours of the pixels on the sensor really
> are, it's knowing what "grey" looks like that is important. Any new
> controls could be quite cumbersome to use if you have to figure out
> what the underlying pixel arrangement looks like, it certainly feels
> much easier to refer simply to red/blue pixels, leaving the driver to
> deal with its own internal idiosyncrasies.

I think I missed these are the gains of the Bayer pattern components, and
by definition you'll be only setting the gains of those components that
are sent out by the sensor. So there wouldn't be other components around,
just these four.

> 
> Having said that, the particular sensor I have exposes a gain for each
> of the four Bayer channels, even though I find myself ignoring the
> green ones!!
> 
> Anyway, I certainly feel I could go either way on this one - do you
> have any more thoughts on the matter?

I'm leaning towards a single array control with specified, mbus code
independent order of components. You should add this control is applicable
to Bayer pattern output only. That leaves it easily extendable later on.

-- 
Kind regards,

Sakari Ailus

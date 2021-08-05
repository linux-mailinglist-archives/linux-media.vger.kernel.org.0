Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA713E1845
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 17:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242000AbhHEPlM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 11:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241840AbhHEPlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 11:41:11 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C8FC061765
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 08:40:56 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id DD21F1B00215;
        Thu,  5 Aug 2021 18:40:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1628178053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2KhAkfn/4rUnbF0tYJXx32ZJn+uR4dZRMrOyZQQV8SY=;
        b=KtLlpTIrH13lyHb5dGfM5SL70vbixJ058kHAunPoAOuc/Covo+5OYygekaSJympKT7jQZL
        ZSijrbEnUETrxTm/fOjt1DOgqngmC8z9GroDA8E2R9EdajSIYJuCgGGEMlQs6FM51MQOwc
        HLUkAiCniwaYWCa2z+mDDoNvVDdI8PfNV83aeJxpN6t1PdIeF3dtOjP2A2J2dPx9d9zbmf
        iJ8EKLQ+If2seLPc+WTPzOcwdbV5AyJxC9vOANmZ1TsZy0HFUnsL75uUfqH+tLh8R9gJYh
        25lsVgmnUCVuFkPQrbkI+IZbvAnaONtgJh3EJAn7Rm/xlCGZ374agR+z/Vs92Q==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 36E68634C8C;
        Thu,  5 Aug 2021 18:39:35 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1mBfUA-000338-87; Thu, 05 Aug 2021 18:40:42 +0300
Date:   Thu, 5 Aug 2021 18:40:42 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX
 controls
Message-ID: <20210805154042.GE3@valkosipuli.retiisi.eu>
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
 <20210722121249.16483-2-david.plowman@raspberrypi.com>
 <YQwCOBCFK9w4dvxl@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQwCOBCFK9w4dvxl@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1628178053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2KhAkfn/4rUnbF0tYJXx32ZJn+uR4dZRMrOyZQQV8SY=;
        b=rSCzEwVs1KF3ymORwRBA0YS0Dl1F+S5qA7P12+Tyeh52aYFr4GqQP+SO/DA2JimvQSdmDN
        00RQnf57QwiRTXhNg2vQkLkGTsEjgiz8Oa7jqO01aSbvcjZOyMnNLd/OirO1zD+RV8I68z
        1pWGBs9AQicsyDRV+Cx3uVO7Y9niGPYivY0Rieez9xtS5t958EN7+Bx7xiPul4Aw46NTkN
        PhT5BH1YdMjWD6cqhhewSctTGCEX+zPYJETWBq+DhSF7yy/ZO8MkcjvAePi6GzsH4tHmNy
        rC2h7OBy7e98hLuSSGTouUgrbUThg+6my+0Ndc43I+mEEiiaNHGBLdhex4lupg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1628178053; a=rsa-sha256;
        cv=none;
        b=TEhE8NrK099I6TNgiV6YtS8l2vcPncbT5cIu09/XWIEWzelDJJZswF9OfMIwp1FnQBhjpN
        qc68UFTuAfo3/KOyOOkXLS3cThc1kurntEowBAUDxNJK/Vh+Rg8kVghiSImwYr5e6v0bRy
        3LKJbAOu+Q+RnmwFRKGEVIDx5mxQq/kp+SwUUudEq6WDBtEGUtfpk7oTAaKzOPMflqD8nZ
        LzO5IvmsH9946MgnpBvIzoBLvKLZLyUG0g75FTeYSDdUdCVzrBcr9q7opEJchHwHhG66DY
        7wZ0uzbHXnsHEIRhy+98WB84WPsUnOiD9lXjIBwF3lb5V4TYVBNKzUtuA4ywoQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David, Laurent,

On Thu, Aug 05, 2021 at 06:22:32PM +0300, Laurent Pinchart wrote:
> Hi David,
> 
> Thank you for the patch.
> 
> On Thu, Jul 22, 2021 at 01:12:48PM +0100, David Plowman wrote:
> > We add new controls, one for each of the four usual Bayer channels:
> > 
> > V4L2_CID_NOTIFY_GAIN_RED
> > V4L2_CID_NOTIFY_GAIN_GREENR
> > V4L2_CID_NOTIFY_GAIN_BLUE
> > V4L2_CID_NOTIFY_GAIN_GREENB
> 
> This will effectively limit the API to Bayer patterns. I wonder if we
> should instead implement it as a single array control, with one element
> per CFA component.

There are other raw patterns, too. Supporting them would likely require one
or a few more controls.

That said, as the values change often it's more efficient to use a single
control. But each colour combination (not each pattern) would require its
own control in this case, eventually requiring more controls.

Given that the number of sensors using non-Bayer patterns but still produce
Bayer output is likely to grow, these could be used by a number of devices.
I'd hence prefer an array control as well.

-- 
Kind regards,

Sakari Ailus

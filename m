Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 263EBB213F
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389202AbfIMNlN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:41:13 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39778 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388927AbfIMNlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:41:13 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DDfC2S094105;
        Fri, 13 Sep 2019 08:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568382072;
        bh=CmbLJ7PpeDku490Wh6BDSiCQHPLlezHiiaAQg2qYXnM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=ykropRZ7yh9+HQIZLNa/QCkM2+GpbxSbalY1PmG3fVmd7eUs8o4RKcb/iLoCDRomv
         3NSwYybEJKvT31v+qM4Lv/iNDy3Flh6T7Cum0lMY3V6PAwkDtUC5CwzrICmGsHHo1Q
         E/nBVNc3iwXqOn/8EPCh6FzuoljdW0yj0XmKvUm0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DDfCF1054907
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Sep 2019 08:41:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 13
 Sep 2019 08:41:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 13 Sep 2019 08:41:11 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x8DDfBKY013552;
        Fri, 13 Sep 2019 08:41:11 -0500
Date:   Fri, 13 Sep 2019 08:43:17 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 08/13] media: am437x-vpfe: Maintain a reference to the
 current vpfe_fmt
Message-ID: <20190913134317.afnflvebna3xv35o@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-9-bparrot@ti.com>
 <8b3d5c23-6784-fb1c-5e14-f3759b10aa0b@xs4all.nl>
 <20190913133245.6rvajfhlghbocuf4@ti.com>
 <693c483f-5342-ab0a-7023-222f06bd011e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <693c483f-5342-ab0a-7023-222f06bd011e@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 15:34:28 +0200]:
> On 9/13/19 3:32 PM, Benoit Parrot wrote:
> > Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 15:14:45 +0200]:
> >> On 9/9/19 6:27 PM, Benoit Parrot wrote:
> >>> Keep a reference to the currently selected struct vpfe_fmt * object.
> >>> By doing so we rename the current struct v4l2_format * member from
> >>> fmt to v_fmt.
> >>> The added struct vpfe_fmt * reference is set to "const" so we also
> >>> constify all accesses and related helper functions.
> >>
> >> This explains what you do, but not why you do it.
> > 
> > Hmm ok I'll rework this a bit.
> > 
> >>
> >> And I think fmt vs v_fmt is *very* confusing naming.
> > 
> > Well in this case v_fmt stands for "v4l2_fmt" and depending on the function
> > I was using fmt to either mean a vpfe_fmt pointer or a v4l2_format pointer
> > so tried (and apparently failed) to make it clearer which was which.
> 
> Well, v_fmt could refer to either v4l2_format or vpfe_fmt, so that prefix
> doesn't help me :-)
> 
> Since 'fmt' was already defined in struct vpfe_device as v4l2_format, I'd
> just keep that rather than causing code churn by changing it. And come up
> with a better name for when you refer to a vpfe_fmt struct.

Fair enough.

> 
> Regards,
> 
> 	Hans
> 
> > 
> >>
> >> I'd keep fmt as-is, and come up with a different name for the vpfe_fmt
> >> pointer. ref_vpfe_fmt?
> >>
> >> Regards,
> >>
> >> 	Hans
> >>

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD197BFFEB
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 17:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbjJJPDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 11:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbjJJPDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 11:03:41 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1B797
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 08:03:40 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163d.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4S4fKy5KgvzyWn;
        Tue, 10 Oct 2023 18:03:31 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1696950215;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YjZsMgLqaEgl6Os7IquuIn+b+HjC5rJvGssknhdITSo=;
        b=xC8jHtrxORBQ6RqlD/QAH+7lgWOvsk+FrHL+HiPaMYjewipRNxkqPNTlnea00VibbTCTvK
        ugKuspeZy2GoHgAJ1osqmdpkJv+fSmOv8lx8ylaOU79CQSkpciRNInP5lwnzDem5LDe/Qx
        t7Twt6XQHvlY5nAAEftzdsny+OR/f4I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1696950215;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YjZsMgLqaEgl6Os7IquuIn+b+HjC5rJvGssknhdITSo=;
        b=XznZbx4v9d9RD1Lrl8TFiMtwKFUgbzwPQHwIPTEIX/Dsg8D898QuUwy8LZQOQOc0zZNaTK
        V+BXRtQ8XxHbX/3pgk3bjf+rmDtH7k80AwQMIwLjWeRwtjndTJNK31GT5u/kbugi6+ejKT
        j2/oMuzYmqFs5wVnPoHq0vklDq7R95Q=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1696950215; a=rsa-sha256; cv=none;
        b=tAZe+0ikPjJ76qIdIjrg5wSx9Qh94VwXlHrI5xxvuhZ0biEyHDk8OvOD7i5W1XokZCF4Zs
        OTvr0SuW9eeNz1iX1tZ5CngO14hi0q5zMYuEVFXq2XjhpI+//Em6i9b5EanbVC0fbof1od
        wY6FsvSzdPnE71bD6u1DYn/RhNu74CM=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D3E18634CA9;
        Tue, 10 Oct 2023 18:03:27 +0300 (EEST)
Date:   Tue, 10 Oct 2023 15:03:27 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 8/9] media: i2c: mt9m114: goto proper error path
Message-ID: <ZSVnv3CPeJdyh+xY@valkosipuli.retiisi.eu>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <6e2b3d5971905c1cf63184e7c3cd269c10151bb7.1696586632.git.hverkuil-cisco@xs4all.nl>
 <20231006151826.GB5121@pendragon.ideasonboard.com>
 <d625a11a-11a4-41c5-a7f7-fa651649957e@xs4all.nl>
 <ZSUEXHDmYtstvMBV@valkosipuli.retiisi.eu>
 <a84b9973-fe45-4125-9374-5d05072c9143@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a84b9973-fe45-4125-9374-5d05072c9143@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Oct 10, 2023 at 10:06:38AM +0200, Hans Verkuil wrote:
> On 10/10/23 09:59, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, Oct 10, 2023 at 09:24:10AM +0200, Hans Verkuil wrote:
> >> Hi Laurent,
> >>
> >> On 06/10/2023 17:18, Laurent Pinchart wrote:
> >>> Hi Hans,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Fri, Oct 06, 2023 at 12:08:49PM +0200, Hans Verkuil wrote:
> >>>> In two places the probe function returns instead of going
> >>>> to the correct goto label.
> >>>>
> >>>> This fixes this smatch warning:
> >>>>
> >>>> drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?
> >>>>
> >>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>>> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>
> >>> I've already submitted
> >>> https://lore.kernel.org/linux-media/20231003192043.27690-1-laurent.pinchart@ideasonboard.com
> >>
> >> Is it OK if I pick up your patch for this issue? I plan to pick up at least part
> >> of this series tomorrow in order to cut down on the number of reported smatch
> >> warnings.
> > 
> > I've got it in my tree and I intend to send a PR by tomorrow (there's an
> > issue also in the CCS driver).
> > 
> 
> OK, then I leave this to you, Sakari.
> 
> The two patches you reviewed (2/9 and 7/9), can I commit those or do you plan
> to make those part of your PR? I don't care either way, as long as we don't
> duplicate work...

You already have them as part of your set so please take them.

I think I've already reviewed them, too.

-- 
Regards,

Sakari Ailus

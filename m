Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B731F1845
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 13:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729704AbgFHLzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 07:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729615AbgFHLzU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 07:55:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F27BC08C5C2;
        Mon,  8 Jun 2020 04:55:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D0552C9;
        Mon,  8 Jun 2020 13:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591617316;
        bh=1lj9FjuIipvGhcLtMC0uXaiiiMBYwOb9zRyCfR/27uw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HVQV+piKImt3IAI21N+NZKvdaNsADGQJ+OggKy6Jw8hF7GqRPeVVf0qvY+xkmGyVk
         FKKKJOmGaL1i8VAo+4W9PwJAresMPWF+jlCS9aV6Yr6gYpmton4jniCarYAPsZ7RqG
         +WfvBKQBuBT5CYAt4oYcM3LgCLTobKLnkjW6TO38=
Date:   Mon, 8 Jun 2020 14:54:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     dinghao.liu@zju.edu.cn, Kangjie Lu <kjlu@umn.edu>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH] media: vsp1: Fix runtime PM imbalance in vsp1_probe
Message-ID: <20200608115457.GA5896@pendragon.ideasonboard.com>
References: <20200523115426.19285-1-dinghao.liu@zju.edu.cn>
 <20200608015456.GJ22208@pendragon.ideasonboard.com>
 <20200608015753.GK22208@pendragon.ideasonboard.com>
 <7b79863f.f636d.17291e1ff94.Coremail.dinghao.liu@zju.edu.cn>
 <CAMuHMdUDcpCxmgdJtMRX7K9NvDxj+tDu33ebax0TOMBNZaygDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUDcpCxmgdJtMRX7K9NvDxj+tDu33ebax0TOMBNZaygDw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Mon, Jun 08, 2020 at 09:39:51AM +0200, Geert Uytterhoeven wrote:
> Hi Dinghao,
> 
> On Mon, Jun 8, 2020 at 5:03 AM <dinghao.liu@zju.edu.cn> wrote:
> > > > I wonder how many bugs we have today, and how many bugs will keep
> > > > appearing in the future, due to this historical design mistake :-(
> >
> > Good question. It's hard to say if this is a design mistake (some use
> > of this API does not check its return value and expects it always to
> > increment the usage counter). But it does make developers misuse it easier.
> 
> On Renesas SoCs, I believe these can only fail if there's something
> seriously wrong, which means the system could never have gotten this far
> in the boot sequence anyway.  That's why I tend not to check the result
> of pm_runtime_get_sync() at all (on drivers for Renesas SoCs).

There are lots of return paths from rpm_resume() that return an error,
more than just rpm_callback(). Do you consider that none of them are
valid errors that drivers need to handle ?

-- 
Regards,

Laurent Pinchart

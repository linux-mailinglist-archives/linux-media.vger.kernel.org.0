Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBA8B9F29
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2019 19:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfIUR3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Sep 2019 13:29:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbfIUR3j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Sep 2019 13:29:39 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F29FA2F9;
        Sat, 21 Sep 2019 19:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569086977;
        bh=SgEChjR2VE+5NS+vNfhpCsTunWBHxkGh+QLmx6RsuyI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gxKOOGt4OyRcpyeItwkr345bXvRwAXIom4E8I+GhUwVok32pfnpO8oTAdttPDWMdu
         9aVxV4XiQ8sAfXLIqZrMBERFXvNYh1dUjuWKXGlVltcVnSYWKCVxeWCCED7G4gCrng
         mJN+njZIgMn4dyvAlyTnBPOXPucopGDwIvyx8n04=
Date:   Sat, 21 Sep 2019 20:29:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Corentin Labbe <clabbe.montjoie@gmail.com>
Cc:     mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        mchehab@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: bringing back media/zoran driver
Message-ID: <20190921172927.GA9189@pendragon.ideasonboard.com>
References: <20190921170357.GA26626@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190921170357.GA26626@Red>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Corentin,

On Sat, Sep 21, 2019 at 07:03:57PM +0200, Corentin Labbe wrote:
> hello
> 
> I am the owner of a zoran based DC10+ card.
> I am in the need of using it since yesterday and I found that its driver was removed.
> 
> Reverting the removing patch made to a temporary working situation.

Sorry the the unpleasant surprise caused by the driver removal.

> If I understand correctly, it was removed due to lack of vb2 convertion.
> If I am able to do this vb2 conversion, does bring it back in mainline will be posssible ?
> In that case I am ready to assume to be the maintainer if needed.

That would be great ! I used to own a DC10 a long time ago, and the
zoran driver was the first one I tried to hack when I moved to Linux.
I'd love to see it getting maintained. Please let us know if you need
any help getting started.

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B27154DC52
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 09:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359075AbiFPH71 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 03:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359454AbiFPH70 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 03:59:26 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88755B88E
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655366365; x=1686902365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L+tPL642xoSqELoYjZzQr10gwoG3KMcWJQWSp9d9Hd0=;
  b=XfmD42nTbRFL5Gzf5HnTemO5EfdTd6+72d230lrFcYo7pvyyLUv1HblD
   qmnNl3zYKz9fWbXpTgR3Y7Gh0N3OK6hQOkkmSIFoyo7Y0MtUtaJMfjsMN
   P6KKNODSok5//fmdRaOG44VIkzcDKQqKt+24Iol4ULjhKS+GC6STM1fsF
   wPWsqoUIdj8U7UO7/Bred7QnoyPE/qCEKN4LoXbO3u/CwzWAN43FLTTGs
   02KyYVDYOT4fOV3UIEuC56MXY+CBN2Fq/lul01iuyOF4iFoZtV0mN3Z8J
   1Rq+D4ikwfk+Hf1L5FnbbYHhBVXhM9AQMvTfCG+9ViBmy80TRHP+8TqZG
   w==;
X-IronPort-AV: E=Sophos;i="5.91,304,1647298800"; 
   d="scan'208";a="24492156"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jun 2022 09:59:23 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Jun 2022 09:59:23 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 16 Jun 2022 09:59:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655366363; x=1686902363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L+tPL642xoSqELoYjZzQr10gwoG3KMcWJQWSp9d9Hd0=;
  b=nl9LdQI+k2s3MF6/DACyzqqAN3JbwUOP00N+vANxjRTpqidAl25Enk38
   dnd3lXo2pzrIZZ2A5dA4/ciE6v+XMJFH8hlJH8nAbPJAQGddr8ndxjQEr
   Hp+8h5X0ZMf+gNPGNsdgQnrR0uFOOrhyA+YiAL5ry7H9PoMV+csNyf3Ci
   57au4hqDCA5NGK8z/gooui3ywN0TixYZRsdeQGxL3oa/9UOEhjyW20mP/
   eTKMGomGoNsyRS/2vagJpFlk/l1pT4imFcu7SwFzdzRHoL6S2NZheDyL4
   Sl8zBgjhGjkC57M1YC6OAWNXVcW0TSp/kpvcLh2IoFpgjvuqjMbwkPSMU
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,304,1647298800"; 
   d="scan'208";a="24492155"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jun 2022 09:59:22 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B24C3280056;
        Thu, 16 Jun 2022 09:59:22 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: (EXT) Re: (EXT) [PATCH 10/55] media: rkisp1: cap: Print debug message on failed link validation
Date:   Thu, 16 Jun 2022 09:59:20 +0200
Message-ID: <6138990.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Yqreoo/szj8FhH6r@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com> <7310038.DvuYhMxLoT@steina-w> <Yqreoo/szj8FhH6r@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

Am Donnerstag, 16. Juni 2022, 09:41:22 CEST schrieb Laurent Pinchart:
> Hi Alexander,
> 
> On Thu, Jun 16, 2022 at 09:32:17AM +0200, Alexander Stein wrote:
> > Am Dienstag, 14. Juni 2022, 21:10:42 CEST schrieb Paul Elder:
> > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > When a link validation failure occurs, print a debug message to help
> > > diagnosing the cause.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > 
> > >  .../media/platform/rockchip/rkisp1/rkisp1-capture.c    | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c index
> > > 94819e6c23e2..94a0d787a312 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > @@ -1294,8 +1294,16 @@ static int rkisp1_capture_link_validate(struct
> > > media_link *link)
> > > 
> > >  	if (sd_fmt.format.height != cap->pix.fmt.height ||
> > >  	
> > >  	    sd_fmt.format.width != cap->pix.fmt.width ||
> > > 
> > > -	    sd_fmt.format.code != fmt->mbus)
> > > +	    sd_fmt.format.code != fmt->mbus) {
> > > +		dev_dbg(cap->rkisp1->dev,
> > 
> > I wonder if a dev_warn is more suitable here.
> 
> I usually recommend dev_dbg() for conditions that are triggered directly
> by userspace, to avoid giving unpriviledged applications an(other) easy
> way to flood the kernel log.

Agreed, this is a sensible thing to do. I'm still wondering if this 
information might be missing, when having a build without DYNAMIC_DEBUG.
Nevertheless I'm fine to start with this debug output at least.

Regards,
Alexander

> > > +			"link '%s':%u -> '%s':%u not valid: 0x%04x/ 
%ux%u != 0x%04x/%ux%u",
> > > +			link->source->entity->name, link->source-
>index,
> > > +			link->sink->entity->name, link->sink->index,
> > > +			sd_fmt.format.code, sd_fmt.format.width,
> > > +			sd_fmt.format.height, fmt->mbus, cap-
>pix.fmt.width,
> > > +			cap->pix.fmt.height);
> > > 
> > >  		return -EPIPE;
> > > 
> > > +	}
> > > 
> > >  	return 0;
> > >  
> > >  }





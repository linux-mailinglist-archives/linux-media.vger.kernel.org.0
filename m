Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B949576922
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 23:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbiGOVmo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 17:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiGOVmg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 17:42:36 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150EC89AA9
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 14:42:33 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 8B8B620210;
        Sat, 16 Jul 2022 00:42:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1657921350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1V5Kb/JELnfha0p/fSsAlwv7wDjDCz7qJcag0GPXrEY=;
        b=om8fgtdLnagU3eOnuzwPXrLMx+661LdcXVfP/sFaC1m5z9TvyMftm569nQJ5cVXGoSjgAv
        hjbQcnIVmCSn/QZ5U4SHwNJ5KeZw76iQqoJSV48oq2AvoUj2k5t9uRf1Mo7EehKjKc63CV
        jxcpkSTpcoRiz9Uf4Uh5NDBttDt8AP0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EFA54634D5F;
        Sat, 16 Jul 2022 00:42:29 +0300 (EEST)
Date:   Sat, 16 Jul 2022 00:42:29 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v6] media: ov5640: Use runtime PM
Message-ID: <YtHfRbdH/C/ZFc1J@valkosipuli.retiisi.eu>
References: <20220617083328.3894368-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617083328.3894368-1-paul.elder@ideasonboard.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1657921350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1V5Kb/JELnfha0p/fSsAlwv7wDjDCz7qJcag0GPXrEY=;
        b=YzQVj7zPmK0W74TdKXE/uq6Eh+dfbO54ASLCtVoI9gDSaaIAPgvnlDISKS3oFyyItjxe09
        fX92G6E1W8ExQm7OBctIXSBM0/FA6PiXHB4bd0AtvshGAvWlbMUV6eBm3J0sl+yOLqhGca
        YEHy52wDWmncIQ13xuzVaooZ9qGoBBo=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1657921350; a=rsa-sha256; cv=none;
        b=WMinnQZAhDGF2ld10fyMBFZWodT3YI+SRDJXbGNia2fYZOSa+0lx3McAzJgbNky/bVRr+2
        vY+Agnm5puahAlYbrPFgN96q4t5BgomD33b8Z/Y+WdGUbm0Z3KkQ3YLwPe+W46gcELDUJp
        Je7iSV/UkaDVyYfVMlnGfAVNh+BA9bw=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Fri, Jun 17, 2022 at 05:33:28PM +0900, Paul Elder wrote:
> Switch to using runtime PM for power management. Make it optional,
> however, to support ACPI.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Could you rebase this on current media tree master branch? A big set of
patches from Jacopo to this driver was were recently mergee.

-- 
Sakari Ailus

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A23180263
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 16:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCJPtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 11:49:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54870 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbgCJPtm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 11:49:42 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3039F5F;
        Tue, 10 Mar 2020 16:49:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583855380;
        bh=KPQEc6tGjY5MuTHPCGgzyuO5uKy1bBUWd0iN+abo+FI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aej1YabqujMPHxSGRFS3lHy615v2G29FsUBPjQKMAikzlUPnnhY2vfuzHzMCFNNXf
         FHTjlAyeZRrHodCmGIwuiwV6rCoBFC5x0tgLfDyg3zwRlNkTtggQy7h2HbFDn6lAoJ
         iAgfnbcXNs254XtEG/lquWzbsv+YTj5E4xmAtzxs=
Date:   Tue, 10 Mar 2020 17:49:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH 7/7] media: imx: imx7-media-csi: Fix video field handling
Message-ID: <20200310154937.GA32319@pendragon.ideasonboard.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-8-laurent.pinchart@ideasonboard.com>
 <3d979bfa-0bb2-0dde-9bc7-83ee3923d33a@gmail.com>
 <20200309205238.GH4916@pendragon.ideasonboard.com>
 <ed913970-573e-4bee-ce84-28513a7869a9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ed913970-573e-4bee-ce84-28513a7869a9@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve and Rui,

I've spent more time on the i.MX7 support in the i.MX media staging
driver today, and I've reached a point where I'm not comfortable moving
forward without your ack.

I found format handling to be very broken, the driver enumerates formats
that are not supported by the device, and doesn't properly handle the
supported formats. While trying to fix that, I found out that the common
i.MX6 and i.MX7 helpers (imx-media-capture.c and imx-media-utils.c) get
in the way, as i.MX6 and i.MX7 format support are very entangled. I
would like to split the two in order to clean up the i.MX7 code, which
would also give an opportunity to later clean the i.MX6 code if desired.

Before moving in that time-consuming direction, I want to make sure this
will be accepted, as I don't want to spend days of work for nothing. If
you want to discuss this in real time, I'm available in the #v4l channel
on Freenode (nickname pinchartl).

-- 
Regards,

Laurent Pinchart

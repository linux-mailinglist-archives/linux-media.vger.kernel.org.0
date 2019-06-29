Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4115A9C8
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 11:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbfF2JNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 05:13:02 -0400
Received: from retiisi.org.uk ([95.216.213.190]:38764 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726818AbfF2JNB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 05:13:01 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id ABBEF634C7F;
        Sat, 29 Jun 2019 12:12:40 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hh9PT-0000ro-SJ; Sat, 29 Jun 2019 12:12:39 +0300
Date:   Sat, 29 Jun 2019 12:12:39 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: Setting up the links for imx7-mipi-csis
Message-ID: <20190629091239.yrjyxd56imytvedg@valkosipuli.retiisi.org.uk>
References: <CAOMZO5A4zhpxf7PQV17vpi43M743Q0R5+ONpSc05-fxFbQDG0Q@mail.gmail.com>
 <CAOMZO5DktjDM-YE7g-bu+DgOZT2SA+FAta_cj2PZV0SLbiXK3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5DktjDM-YE7g-bu+DgOZT2SA+FAta_cj2PZV0SLbiXK3g@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Fri, Jun 28, 2019 at 10:12:21PM -0300, Fabio Estevam wrote:
> Hi Rui,
> 
> On Fri, Jun 28, 2019 at 7:03 PM Fabio Estevam <festevam@gmail.com> wrote:
> 
> > The first command succeeds, but the second one fails:
> >
> > # media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi_mux':1[1]"
> > Unable to parse link: Invalid argument (22)
> 
> I have also tested it on a imx7s-warp and I got the same error.
> 
> Please let me know if you have any ideas on how to solve this problem.

What does media-ctp -p say?

-- 
Sakari Ailus

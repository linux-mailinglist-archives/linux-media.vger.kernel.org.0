Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E74A692381
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 17:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbjBJQkO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 11:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbjBJQkN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 11:40:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856DC75F43
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 08:40:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02CBC904;
        Fri, 10 Feb 2023 17:40:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676047211;
        bh=YaEKwCTJmUWz47HnY5YY9HGLud9/ahYQqA9BKuV/rRg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nGi1/EeUUlPsNDIgKQIQImd8l9UZUq9LErfsnNvPk9AJQ2gfC/nOFAsrRDESGHoj5
         d9byTqjMEbuozHAmdqHhJP8Tz4tVFZ6bJTIGkbctR6ws6OtfZ25MqwoQIH9j56jdCw
         lZYl0XxRP31g78wkuroySE0DgOmDGMsuJvNWAito=
Date:   Fri, 10 Feb 2023 18:40:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+ZzacLYENgnrQaq@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <Y+Y39+IRyjwQi7Jr@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+Y39+IRyjwQi7Jr@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Feb 10, 2023 at 02:26:31PM +0200, Sakari Ailus wrote:
> On Fri, Feb 10, 2023 at 01:45:10PM +0200, Laurent Pinchart wrote:
> > Regarding the width-specific versions of the helpers, I really think
> > encoding the size in the register macros is the best option. It makes
> > life easier for driver authors (only one function to call, no need to
> > think about the register width to pick the appropriate function in each
> > call) and reviewers (same reason), without any drawback in my opinion.
> 
> As I noted previously, this works well for drivers that need to access
> registers with multiple widths, which indeed applies to the vast majority
> of camera sensor drivers, but not to e.g. flash or lens VCM drivers. Fixed
> width registers are better served with a width-specific function. But these
> can be always added later on.

I still fail to see why they would be *better* served by custom functions.

-- 
Regards,

Laurent Pinchart

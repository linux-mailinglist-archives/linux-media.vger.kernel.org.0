Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91E8C8A0FA
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 16:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfHLOYx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 10:24:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfHLOYw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 10:24:52 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6763C327;
        Mon, 12 Aug 2019 16:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565619890;
        bh=JclI79piuUPbIB88Y35NuHhrDCtcyvwfghAGMqyhi7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MdClYar7VDS+d7D7oWHHizEt+M2uExI3jx9pY8+IMmiIi4cOu2/aC1vkEhvTuHOzs
         dBL2WswIjICz8qBqsOAk4w7xk/Z2eN7eXVqGRmlLaJ8lZyXGYkwLOs+z+hRMYdJ5fb
         GLPal75ifBn7mBS2AhahJpodA/m2yFJb4Fuwu+sc=
Date:   Mon, 12 Aug 2019 17:24:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     helen.koike@collabora.com,
        =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>,
        mchehab@kernel.org, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: vimc: move private defines to a common header
Message-ID: <20190812142447.GF5006@pendragon.ideasonboard.com>
References: <cover.1565386363.git.skhan@linuxfoundation.org>
 <142cc5a6a10f75ed97de8b2d9b1e73b034a88b2f.1565386363.git.skhan@linuxfoundation.org>
 <20190810141432.GA30451@pendragon.ideasonboard.com>
 <ab0b316c-8b6d-0faf-b046-97c8065b8afd@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab0b316c-8b6d-0faf-b046-97c8065b8afd@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shua,

On Mon, Aug 12, 2019 at 08:19:27AM -0600, Shuah Khan wrote:
> On 8/10/19 8:14 AM, Laurent Pinchart wrote:
> > On Fri, Aug 09, 2019 at 03:45:41PM -0600, Shuah Khan wrote:
> >> In preparation for collapsing the component driver structure into
> >> a monolith, move private device structure defines to a new common
> >> header file.
> > 
> > Apart from the vimc_device structure, this doesn't seem to be needed.
> > I'd rather keep each structure private to the .c file that handles it,
> > and only share vimc_device globally.
> 
> Right. I initially thought that I needed these global. Once I completed
> the patches without needing these as global, I overlooked updating the
> patches.
> 
> I will take care of that. Any thoughts on vimc.h vs. adding vimc_device
> struct to existing vimc-common.h
> 
> As I explained to Helen in response to her comment about:
> 
> "My thinking is that vimc-common.h is common for all the subdevs and
> putting vimc-core defines and structures it shares it with the subdev
> files can be in a separate file.
> 
> It is more of design choice to keep structures and defined organized.
> Originally I was thinking all the subdev device structires need to be
> global, and my patch set I sent out as such doesn't need that. I just
> overlooked that when I sent the patches out.
> 
> This reduces the number of things that need to be common, I don't really
> have any strong reasons for either choice of adding common defines to
> vimc-common.h vs vimc.h - maybe with a slight tilt towards vimc.h"

The vimc_device structure fits nicely in vimc-common.h in my opinion, as
it's used by every component. I don't care much either way.

> Thanks all for a quick review and testing. I will work on v2 with your
> comments. I want to make sure topology either looks the same as what
> is in media master. I think it is, but I want to double check.

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABC754E92F
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 20:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377439AbiFPSKq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 14:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233838AbiFPSKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 14:10:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1244D681
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 11:10:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00D212A5;
        Thu, 16 Jun 2022 20:10:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655403042;
        bh=2ohg3tJuGn7TIcc6Qj8GcJBXLiXfGUXfeggrLQxXlNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qYDWqNPYGLhGTAV0FouAG0CijZZGBJAQ/cYTxp6SoBSths9yPieO3S0/DOviyItKH
         DIb2hYl9iRrucfQnwuu/qDPtZzVr5WMJhLACjCnErKyfEMO16Uq+K6Ct/snsgQugqy
         WVPCuk+hVo0HtILavtf+4Uc2V/UHOepULcCE7OL0=
Date:   Thu, 16 Jun 2022 21:10:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [ANN] Media Summit at ELCE Dublin: Request for Topics
Message-ID: <YqtyF8gQKU0QYlJ+@pendragon.ideasonboard.com>
References: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 06, 2022 at 03:20:09PM +0200, Hans Verkuil wrote:
> Hi all,
> 
> Since countries are opening up again and travel is (at least for now!) a lot easier,
> I am considering a media summit during the ELCE in Dublin (Sep 13-16).
> 
> See here for more details about the conference:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/
> 
> Of course, this only makes sense if there is something to talk about. So please reply
> with any suggestions for topics!
> 
> Also please let me know if you would expect to be at such a media summit in person.
> If only a few people would be there, then there isn't much point to this.
> 
> 
> I have two topics:
> 
> 1) Discussion of the media subsystem development process: any bottlenecks, any ideas
>    for improvements?
> 
> 2) I can give a presentation on the work I've done in the CTA-861 standard (used by
>    HDMI) and the edid-decode utility.

Another topic: how can we finalize conversion of v4l-utils to meson ?

> I'd like to make a decision on whether or not it is worthwhile to do this in a week
> or two. If we wait too long it might be difficult to get a room for the summit.

-- 
Regards,

Laurent Pinchart

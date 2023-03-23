Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5216C6B9E
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 15:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbjCWOzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 10:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjCWOzM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 10:55:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BEF1A950
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 07:55:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AFE8720;
        Thu, 23 Mar 2023 15:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679583309;
        bh=vA8PO5p9TRWys+TxE9XybWUba9CRKb2MyoIfYaVzHh4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r1NL56n5ORWbmc776P/QhSFYSI0KjGhcJ+QlZsZZaSfMFrjvzL1jhJ12mzV+qgO2z
         RPOGufZUO+KXeD6DqlAEnZ7h9v9eK8YxCEX3yVuydyBfAg58/LBANDDWJ5ez5t2IJk
         efGNiv3xrmb1ZLQbLoPM2saUmPNXmQpoUmZamNIM=
Date:   Thu, 23 Mar 2023 16:55:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Request for Topics for a Media Summit June 26th
Message-ID: <20230323145515.GA21511@pendragon.ideasonboard.com>
References: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
 <9d7133b0-185f-a38f-7b24-1c7a847aacc7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d7133b0-185f-a38f-7b24-1c7a847aacc7@xs4all.nl>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Mar 06, 2023 at 09:57:30AM +0100, Hans Verkuil wrote:
> On 03/03/2023 15:44, Hans Verkuil wrote:
> > Hi all,
> > 
> > I am planning to organize another Media Summit on June 26th, co-located
> > with the Embedded Open Source Summit in Prague:
> > 
> > https://events.linuxfoundation.org/embedded-open-source-summit/
> > 
> > I've put in a request for a room with the Linux Foundation and I am waiting
> > for the result of that. For once I was early with my request, so I have good
> > hope we'll get a room. Expect the format to be similar to what we did in
> > Dublin last year.
> > 
> > I'm a bit early with this 'Request for Topics' as well, but this allows
> > everyone who plans to be in Prague to take this into account.
> > 
> > So if you have a topic that you want to discuss, just reply. It would be
> > very much appreciated if you can also add a guesstimate of the time you
> > need for your topic.
> > 
> > Once I have the details of the room and how many people it can hold, then
> > I will send out a second email asking people to register with me if you
> > want to join.
> > 
> > Regarding remote participation: only if there is really no other way.
> > Meeting face-to-face once a year is important IMHO, and attending remotely
> > is a poor substitute. That said, if it is really necessary to set something
> > up, then I can do the same I did in Dublin, setting up a Webex meeting.
> > That worked reasonably well, except that I will need to bring a better
> > speaker since I learned that the laptop speaker was pretty bad.
> > 
> > So, if you have topics for the meeting, just reply!
> 
> I have one:
> 
> Review the subsystem development process: what can be improved?
> Are there media developers who are interested in becoming maintainers?
> Given the amount of traffic I would definitely like to see one or two
> additional maintainers.
> 
> Guesstimate: 45 minutes

I'm sure we could spend the whole day discussing this :-) More than
incremental improvements to the development process, I think we need to
discuss the maintainership model in its entirety. The Linux media
subsystem is severely understaffed (if anyone disagrees I'd be very
interested in hearing counter-arguments), and I don't think we'll fix
that incrementaly without considering on-boarding of additional
maintainers, as well as retention of existing contributors. Compared to
some other subsystems (I'm thinking about DRM in particular), we have
*very* few contributors who stay and become maintainers. That's for me
the most important issue to solve if we want to scale.

-- 
Regards,

Laurent Pinchart

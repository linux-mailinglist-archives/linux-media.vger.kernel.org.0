Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBD354C881
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 14:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238249AbiFOM2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 08:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348528AbiFOM2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 08:28:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B9B39BB7
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 05:28:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DF14749;
        Wed, 15 Jun 2022 14:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655296083;
        bh=JovgE/ifTRpeya7zV9PFWBUZTQ1hV8GT7AlNsm8Buqo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aOtgzuj1+TotYolviTFDQit8UVLSzRnA0YfLx1UqQY9udcIg6wrgIJb8bUduS+Kzk
         dN0TKSWm2JPu46iS1hGWVl7+JMZQb+2ct9BqsWgPamBatGKBwCs4L4YjznSmM17GR3
         c8uooA/QcQDiTc0dQD7vndO/z8/TbTwg139fDEb0=
Date:   Wed, 15 Jun 2022 15:27:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [ANN] Media Summit at ELCE Dublin: Request for Topics
Message-ID: <YqnQSU3geEdZ0SGo@pendragon.ideasonboard.com>
References: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
 <CAPybu_2=MkqBeesQe56pw1nVCpaRyukH80ifk6zasbcykyq5bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPybu_2=MkqBeesQe56pw1nVCpaRyukH80ifk6zasbcykyq5bA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Thu, Jun 09, 2022 at 12:29:32PM +0200, Ricardo Ribalda Delgado wrote:
> On Mon, May 9, 2022 at 8:46 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > Hi all,
> >
> > Since countries are opening up again and travel is (at least for now!) a lot easier,
> > I am considering a media summit during the ELCE in Dublin (Sep 13-16).
> >
> > See here for more details about the conference:
> >
> > https://events.linuxfoundation.org/open-source-summit-europe/
> >
> > Of course, this only makes sense if there is something to talk about. So please reply
> > with any suggestions for topics!
> >
> > Also please let me know if you would expect to be at such a media summit in person.
> > If only a few people would be there, then there isn't much point to this.
> >
> >
> > I have two topics:
> >
> > 1) Discussion of the media subsystem development process: any bottlenecks, any ideas
> >    for improvements?
> >
> > 2) I can give a presentation on the work I've done in the CTA-861 standard (used by
> >    HDMI) and the edid-decode utility.
> >
> > I'd like to make a decision on whether or not it is worthwhile to do this in a week
> > or two. If we wait too long it might be difficult to get a room for the summit.
> >
> > Regards,
> >
> >         Hans
> 
> If all goes well, I will attend in person.
> 
> I would like to propose a topic as well if there is still space for it:
> 
> At ChromeOS we have been working on a new way to access cameras that
> do not fit in the current V4L2/MC model.
> 
> We want to introduce the project, start a discussion in the media
> community and think together about the approach and how it fits in our
> current ecosystem.

I hope there will be space to discuss this topic :-) Could you maybe
provide links to the talk you've given in Paris (video and slides) as
well as to the public git tree ? We'll have a big agenda for the
workshop, it will be important to focus on discussions and not
presentations, so we should all prepare by reading material in advance.

-- 
Regards,

Laurent Pinchart

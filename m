Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68FB11931EE
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 21:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbgCYUao (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 16:30:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39118 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbgCYUan (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 16:30:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4D7FB2971D9
Message-ID: <648c8411353071a7e1ffd3576d268b01177ab678.camel@collabora.com>
Subject: Re: [PATCH v2 3/8] hantro: Use v4l2_m2m_buf_done_and_job_finish
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Rob Herring <robh@kernel.org>
Date:   Wed, 25 Mar 2020 17:30:32 -0300
In-Reply-To: <50d764ec-1c15-99bd-192b-9aa6ae5bf368@xs4all.nl>
References: <20200318132108.21873-1-ezequiel@collabora.com>
         <20200318132108.21873-4-ezequiel@collabora.com>
         <13b1efe1-8b52-070b-cf11-b230bd405d3e@xs4all.nl>
         <0a8f6d97e6869ff694aedd67a3176217a885c938.camel@ndufresne.ca>
         <50d764ec-1c15-99bd-192b-9aa6ae5bf368@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

   1. On Wed, 2020-03-25 at 16:28 +0100, Hans Verkuil wrote:
> On 3/25/20 3:02 PM, Nicolas Dufresne wrote:
> > Le mercredi 25 mars 2020 à 09:22 +0100, Hans Verkuil a écrit :
> > > On 3/18/20 2:21 PM, Ezequiel Garcia wrote:
> > > > Let the core sort out the nuances of returning buffers
> > > > to userspace, by using the v4l2_m2m_buf_done_and_job_finish
> > > > helper.
> > > > 
> > > > This change also removes usage of buffer sequence fields,
> > > > which shouldn't have any meaning for stateless decoders.
> > > 
> > > Uh, why remove this? For one, doesn't this cause fails in v4l2-compliance?
> > > Also, while I agree that it is not terribly useful, it doesn't hurt, does it?
> > > 
> > > And the V4L2 spec makes no exception for stateless codecs with respect to the
> > > sequence field.
> > > 
> > > Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > 
> > The spec also does not say what it means either. As an example, you
> > have spec for ALTERNATE interlacing mode that changes the meaning of
> > the sequence, but not for alternate H264 fields (which cannot be part
> > of the format, since this changes often). We also don't have spec for
> > the the sequence behaviour while using HOLD features.
> 
> I hate it that the spec changes the sequence meaning for FIELD_ALTERNATE,
> I always thought that that made drivers unnecessarily complicated. Unfortunately,
> this is something we inherited.
> 
> Currently the spec says for sequence:
> 
> "Set by the driver, counting the frames (not fields!) in sequence. This field is set
>  for both input and output devices."
> 
> The only thing missing here is that it should say that for compressed formats this
> counts the buffers, since one buffer with compressed data may not have a one-to-one
> mapping with frames.
> 
> This description for 'sequence' was never updated when compressed data formats were
> added, so it is a bit out of date.
> 
> > I'm worried we are falling into the test driven trap, were people
> > implement features to satisfy a test, while the added complexity don't
> > really make sense. Shouldn't we change our approach and opt-out
> > features for new type of HW, so that we can keep the drivers code
> > saner?
> 
> Why wasn't the existing code in this patch sane? Sure, we can change the spec, but
> then 1) all existing drivers need to be updated as well, and 2) v4l2-compliance needs
> to be changed to test specifically for this class of drivers and ensure that for those
> the sequence field is set to 0. Not to mention introducing an exception in the uAPI
> where the sequence field suddenly isn't used anymore.
> 
> Frankly, I would prefer that the whole sequence handling is moved to videobuf2-v4l2.c.
> It really doesn't belong in drivers, with the exception of incrementing the sequence
> counter in case of dropped frames.
> 
> I think I suggested it when vb2 was being designed, but at the time the preference
> was to keep it in the driver. Long time ago, though.
> 

Do you think we could try to move this to the core?

I might be able find some time to try that.

> And another reason why I want to keep it: I find it actually useful to see a running
> counter: it helps keeping track of how many buffers you've processed since you started
> streaming.
> 

+1

> Finally, the removal of the sequence counter simply does not belong in this patch.
> 

Agreed, no complaints on my side.

I am actually happy about this feedback.

Thanks,
Ezequiel


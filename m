Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6249497CA
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 05:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbfFRD2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 23:28:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58288 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfFRD2t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 23:28:49 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 37C452639AE
Message-ID: <06161391ed2bbb0a2fc9085792b8db7c049d67db.camel@collabora.com>
Subject: Re: [PATCH v2 0/4] vicodec: a couple fixes towards spec compliancy
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 18 Jun 2019 00:28:38 -0300
In-Reply-To: <879d93cc-3777-bd61-5c14-34108fc8501a@xs4all.nl>
References: <20181102155206.13681-1-ezequiel@collabora.com>
         <879d93cc-3777-bd61-5c14-34108fc8501a@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-06-17 at 14:43 +0200, Hans Verkuil wrote:
> Hi Ezequiel,
> 
> On 11/2/18 4:52 PM, Ezequiel Garcia wrote:
> > Given the stateful codec specification is still a moving target,
> > it doesn't make any sense to try to comply fully with it.
> > 
> > On the other side, we can still comply with some basic userspace
> > expectations, with just a couple small changes.
> > 
> > This series implements proper resolution changes propagation,
> > and fixes the CMD_STOP so it actually works.
> > 
> > The intention of this series is to be able to test this driver
> > using already existing userspace, gstreamer in particular.
> > With this changes, it's possible to construct variations of
> > this pipeline:
> > 
> >   gst-launch-1.0 videotestsrc ! v4l2fwhtenc ! v4l2fwhtdec ! fakevideosink
> > 
> > Also, as discussed in v1 feedback [1,2], I'm including pixel format
> > helpers, as RFC for now. Hans, Tomasz: is this what you had in mind?
> > 
> > [1] https://www.spinics.net/lists/linux-media/msg141912.html
> > [2] https://www.spinics.net/lists/linux-media/msg142099.html
> > 
> > v2:
> >   * Add more info to commit logs
> >   * Propagate changes on both encoders and decoders
> >   * Add pixel format helpers
> > 
> > Ezequiel Garcia (4):
> >   media: Introduce helpers to fill pixel format structs
> 
> This one has been applied (or probably a later version) already.
> 
> >   vicodec: Use pixel format helpers
> 
> This doesn't apply anymore, but it would be useful to have.
> 
> If you can rebase it, then that would be nice.
> 

Sure.

> >   vicodec: Propagate changes to the CAPTURE queue
> >   vicodec: Implement spec-compliant stop command
> 
> This two are obsolete as far as I know. The vicodec driver should handle
> this correctly now. If you think otherwise, please let me know.
> 

Sure, let me re-test it.

Thanks,


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A34BB8C7
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 17:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732160AbfIWP7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 11:59:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49958 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbfIWP7b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 11:59:31 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C81F53B;
        Mon, 23 Sep 2019 17:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569254369;
        bh=irh5+nc+Wz13NnosHcO8miZKEAkqGYHnyp9nTBdByUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YJ1EMRCqEn854ubZj8wXuieR8/BPJRKiDp5D0BYdAwz4LJ+aE9spjq4SPY6vB0GnS
         wzneN3eADkKWRx/fUTujEbL+ATkvQPibGikpVtgEadQuhMR+yS+d2lewaj7m6QpyIZ
         iZf3mp5bqTurzpstFhg5zLFOII1f39qzNa38Bvp4=
Date:   Mon, 23 Sep 2019 18:59:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [ANN] Media sessions in Lyon in October: libcamera
Message-ID: <20190923155919.GD5056@pendragon.ideasonboard.com>
References: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Sep 23, 2019 at 04:21:04PM +0200, Hans Verkuil wrote:
> Hi all,
> 
> Since we have three separate half-day sessions for different topics I decided
> to split the announcement for this in three emails as well, so these things
> can be discussed in separate threads.
> 
> All sessions are in room Terreaux VIP Lounge - Level 0.
> There is a maximum of 15 people.
> 
> The second session deals with libcamera and is on Wednesday morning
> from 9:00 to 13:00.
> 
> Attendees for this session:
> 
> Kieran Bingham <kieran.bingham@ideasonboard.com>
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Daniel Gomez <daniel@qtec.com>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Shuah Khan <skhan@linuxfoundation.org>
> Helen Koike <helen.koike@collabora.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Niklas Söderlund <niklas.soderlund@ragnatech.se>
> Hans Verkuil <hverkuil@xs4all.nl>
> 
> If I missed someone, or you are on the list but won't attend after all, then
> please let me know.
> 
> Attendees: it is probably useful if you let us know whether you have to
> join this meeting because you plan to use libcamera, or if you are 'just
> interested'. After the libcamera presentation on Tuesday afternoon we
> should know how many of the 'just interested' list can join.
> 
> Agenda:
> 
> Laurent, can you fill this in?

Yes, but it's a bit early still. I will make sure to fill the agenda as
we get closer to the event, based on the development status and the
final list of attendees, most probably mid-October.

If anyone has any particular topic they would like to discuss, please
let me know.

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9434187009
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 17:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731950AbgCPQaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 12:30:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50518 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732100AbgCPQaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 12:30:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CB5802940C0
Message-ID: <ee884af1f7dd5d7c6877a7801f4942cce06d8e61.camel@collabora.com>
Subject: Re: [RFC PATCH v4l-utils 0/1] Introduce the meson build system
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Mon, 16 Mar 2020 13:29:59 -0300
In-Reply-To: <3479ebe3-1a62-f888-8b11-97ecd5b30cd2@xs4all.nl>
References: <20200315205421.28797-1-ezequiel@collabora.com>
         <3479ebe3-1a62-f888-8b11-97ecd5b30cd2@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, 2020-03-16 at 10:17 +0100, Hans Verkuil wrote:
> On 3/15/20 9:54 PM, Ezequiel Garcia wrote:
> > Here's a first step towards using meson:
> > 
> >     https://mesonbuild.com/
> > 
> > As you can see, this doesn't include all tools and libraries
> > (are there any libv4l1 users?),
> 
> Probably yes.
> 
>  but otherwise tries to cover
> > as much as possible.
> 
> Last week I added options to build 32 bit variants of v4l2-ctl and v4l2-compliance,
> it will be interesting to see how meson does that.
> 
> I'm not opposed to changing over to meson, but then the old system has to be removed
> either at the same time or in a second patch.
> 

I think some projects kept autotools for a while until the
transition to meson is complete.

Any reason why we'd have to do the transition atomically?

Thanks,
Ezequiel


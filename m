Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8549B1C5971
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 16:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgEEO1k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 10:27:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42808 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729123AbgEEO1k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 10:27:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 84EAE2A1EA1
Message-ID: <ac6e162a24a8e2b2180b1a743e5ecd9a2023ac65.camel@collabora.com>
Subject: Re: [PATCH v3 1/3] media: rkvdec: Fix .buf_prepare
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>
Date:   Tue, 05 May 2020 11:27:30 -0300
In-Reply-To: <CAAFQd5A458E8iqwakKTDEyTHC+NYY-M1SaTS3m0MARwPaRyOuw@mail.gmail.com>
References: <20200505134110.3435-1-ezequiel@collabora.com>
         <20200505134110.3435-2-ezequiel@collabora.com>
         <CAAFQd5AWZFoPk2YTp2k8M7LvJshxw46-z+wK2VoM9EzB2CqiFA@mail.gmail.com>
         <c29fcc922a4917ac695043e605973ba9649f9c9b.camel@collabora.com>
         <CAAFQd5A458E8iqwakKTDEyTHC+NYY-M1SaTS3m0MARwPaRyOuw@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-05-05 at 16:05 +0200, Tomasz Figa wrote:
> On Tue, May 5, 2020 at 3:59 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > On Tue, 2020-05-05 at 15:56 +0200, Tomasz Figa wrote:
> > > Hi Ezequiel,
> > > 
> > > On Tue, May 5, 2020 at 3:41 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > > The driver should only set the payload on .buf_prepare
> > > > if the buffer is CAPTURE type, or if an OUTPUT buffer
> > > > has a zeroed payload.
> > > 
> > > Thanks for the patch. Just one question below.
> > > 
> > > Where does the requirement to set OUTPUT buffer bytesused to sizeimage
> > > if the original bytesused is 0 come from?
> > > 
> > 
> > If I'm reading english correctly, it's here:
> > 
> > https://www.kernel.org/doc/html/latest/media/uapi/v4l/buffer.html
> > 
> > """
> > The number of bytes occupied by the data in the buffer. It depends on the negotiated data format and may change with each buffer for compressed
> > variable size data like JPEG images. Drivers must set this field when type refers to a capture stream, applications when it refers to an output
> > stream. If the application sets this to 0 for an output stream, then bytesused will be set to the size of the buffer (see the length field of this
> > struct) by the driver. For multiplanar formats this field is ignored and the planes pointer is used instead.
> > """
> 
> Okay, thanks. I wonder if this shouldn't be handled by the core,
> though. Especially given that the document refers to the length field
> specifically and not the sizeimage set in the format.
> 

Yes, either core or helper, this definitely calls for a generic solution.

Ezequiel


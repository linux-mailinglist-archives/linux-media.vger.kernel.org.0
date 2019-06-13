Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 292724452D
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730529AbfFMQm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:42:29 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37507 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730509AbfFMGs1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 02:48:27 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id bJX2hLTZJ5qKabJX5hEEZ8; Thu, 13 Jun 2019 08:48:25 +0200
Subject: Re: [PATCHv4 0/2] Document memory-to-memory video codec interfaces
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
Message-ID: <259bb812-9cc9-8fe7-8fc6-2cbd5ef44ac3@xs4all.nl>
Date:   Thu, 13 Jun 2019 08:48:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBCxlUJmg0N4Q2GZyAqhrK28SVHEKjholBSkcw0ri9bw/4dzuQ6WLxdOkaY5QJhKT0zRJOS3uHj/eYNmaeeEd4Ntdvjp+hSVMACqP4G2VehyWwS7LffX
 WLvBeAxh/OZHl5XXelSW9XYy2hQMjgsD4B/oQGt22WTlo/nxj/qgoeGJ7ZGZNmrQn19oMAFoP42UBJ80/eTDP9+SgBcKk2zsdCb8NH4ohcsBf4x6f6WSYLZq
 x509Z7B+g+2ZT826iSTaXj5BJn1qQYwaKfVoqz6f3hhxyPVn8C8raJd+at+hs0c4wDI1v+CTgBZnqJ2tFsrIpW4MkCg8g3S4FnYxHlRxDbPS9JhEyxGN1Qi3
 /QAdo9ZXRph+Np6JyVIWgZxBJaiQYM4FywX21BHNbjlKcqmr+hybLBGpA/4jYxVyWimN4wMHjSwV7BauBCKY6UM88w8MY6HwMMhgoT+stF3q1FRxgtuuiXwg
 BATUeIxK9k96WB5T
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/3/19 1:28 PM, Hans Verkuil wrote:
> Since Tomasz was very busy with other things, I've taken over this
> patch series. This v4 includes his draft changes and additional changes
> from me.
> 
> This series attempts to add the documentation of what was discussed
> during Media Workshops at LinuxCon Europe 2012 in Barcelona and then
> later Embedded Linux Conference Europe 2014 in Düsseldorf and then
> eventually written down by Pawel Osciak and tweaked a bit by Chrome OS
> video team (but mostly in a cosmetic way or making the document more
> precise), during the several years of Chrome OS using the APIs in
> production.
> 
> Note that most, if not all, of the API is already implemented in
> existing mainline drivers, such as s5p-mfc or mtk-vcodec. Intention of
> this series is just to formalize what we already have.
> 
> Thanks everyone for the huge amount of useful comments to previous
> versions of this series. Much of the credits should go to Pawel Osciak
> too, for writing most of the original text of the initial RFC.
> 
> This v4 incorporates all known comments (let me know if I missed
> something!) and should be complete for the decoder.
> 
> For the encoder there are two remaining TODOs for the API:
> 
> 1) Setting the frame rate so bitrate control can make sense, since
>    they need to know this information.
> 
>    Suggested solution: require support for ENUM_FRAMEINTERVALS for the
>    coded pixelformats and S_PARM(OUTPUT). Open question: some drivers
>    (mediatek, hva, coda) require S_PARM(OUTPUT), some (venus) allow both
>    S_PARM(CAPTURE) and S_PARM(OUTPUT). I am inclined to allow both since
>    this is not a CAPTURE vs OUTPUT thing, it is global to both queues.

Alternative proposal:

1) Add support for fractions (struct v4l2_fract) as a control type:
   V4L2_CTRL_TYPE_FRACT.

2) Add a new V4L2_CID_MPEG_FRAME_INTERVAL control.

Encoders shall support this control.

3) For backwards compatibility reasons encoder drivers still have to
support G/S_PARM, but this can now be implemented by standard helpers
that query this control. Drivers also have to implement ENUM_FRAMEINTERVALS.
If the range of intervals is always the same regardless of the frame size,
then a helper can be used that queries the min/max/step of the control, but
if it is dependent on the frame size, then it has to be implemented in the
driver itself.

I'm sticking to frame intervals instead of frame rates for the simple reason
that that's what V4L2 has used since the beginning. I think it is too confusing
to change this to a frame rate. This is just my opinion, though.

I also chose to make this a codec control, not a generic user control: this
value together with the bit rate control(s) determine the compression size,
it does not determine the actual time it takes for the encoder to compress
the raw frames. Hence it is really not the same thing as the frame interval
of a video capture device. If we want to use a control for that as well in
the future as a replacement for G/S_PARM, then that should be a new control.
And we would like need per-pad controls as well in order to implement that.
Which is a lot more work.

Regards,

	Hans

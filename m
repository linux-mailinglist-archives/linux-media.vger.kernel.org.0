Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20181E1D5C
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 10:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgEZIc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 04:32:59 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39225 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726926AbgEZIc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 04:32:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id dV13jEnQPdPgTdV17jijEt; Tue, 26 May 2020 10:32:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590481977; bh=9O+i6TRtUx6ixpRLWerGcPPtFe28tijxyUSUexCLzp8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=epQJ6VvO1Tu9Lv3GEsL7li1OTWYjaG6fIz9l1UyNWlp4KQvi83QdT0rrEbrUuBVil
         wjBJ4I9t4Y6cWGzSf69qdrufMuo+npw/ZKtmMMdY++Mg5XaSgXmAz3DvjTsNoqSoxP
         M5P9QUxf49UhGsT1SWmcP7NkLpRUlXkKAe1PiO6+Zllw90VdFk7gePZKTsx/oI6RW7
         xCe1HpOs7rWqPanafMcvFleAjwyh3/ArW08fAqdTsPWzvKwFSNKo0BxDvqWA+7AaRK
         pl+nC78LBFgz+ZskdFYz6RREvhuRQkAwNbDE4IPnatkf8Ed1Ckj4ZgBxOXg9X53owJ
         KMe89pZ940gJw==
Subject: Re: [PATCHv2 1/2] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
 <20200520100159.2094831-2-hverkuil-cisco@xs4all.nl>
 <a14b50176ae678904f9dd39c1bb8edbc5801a030.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6caf4e56-2cb3-b193-3760-3a9b3c31bfb0@xs4all.nl>
Date:   Tue, 26 May 2020 10:32:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a14b50176ae678904f9dd39c1bb8edbc5801a030.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCEcEh9BkKKYij9cW774okmcvKAmdHEg21bIzLjtc9TCDlkuU5nEI2G6bAKFOdlRXxTnOlrpjhVrFacwDG9C1FHQqIRM016rFyjgcpDDCZQz1vdycuLq
 I0C8YtYLiAUN6g4gkHSDNF+/NG290wpjvSbvAs8vMMoMPDGYmoVUfmRNNwGkElGoRoV47mCdDUeZy/fqDTqd2c6C57dslnNuoxJq5D20pYSg5iCHICQvDz31
 Z3vYiDglKN1uKrnI5jjUf/CO5va3C79F4tSgRb8NO68+TFDIG4mjCbO4lYQvCm2r
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/05/2020 22:32, Nicolas Dufresne wrote:
> Le mercredi 20 mai 2020 à 12:01 +0200, Hans Verkuil a écrit :
>> From: Tomasz Figa <tfiga@chromium.org>
>>
>> Due to complexity of the video encoding process, the V4L2 drivers of
>> stateful encoder hardware require specific sequences of V4L2 API calls
>> to be followed. These include capability enumeration, initialization,
>> encoding, encode parameters change, drain and reset.
>>
>> Specifics of the above have been discussed during Media Workshops at
>> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
>> Conference Europe 2014 in Düsseldorf. The de facto Codec API that
>> originated at those events was later implemented by the drivers we already
>> have merged in mainline, such as s5p-mfc or coda.
>>
>> The only thing missing was the real specification included as a part of
>> Linux Media documentation. Fix it now and document the encoder part of
>> the Codec API.
>>
>> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../userspace-api/media/v4l/dev-encoder.rst   | 727 ++++++++++++++++++
>>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>>  5 files changed, 766 insertions(+), 20 deletions(-)
>>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst

<snip>

>> +5. **Optional** Set the coded frame interval on the ``CAPTURE`` queue via
>> +   :c:func:`VIDIOC_S_PARM`. This is only necessary if the coded frame
>> +   interval is different from the raw frame interval, which is typically
>> +   the case for off-line encoding.
>> +
>> +   * ** Required fields:**
>> +
>> +     ``type``
>> +	 a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
>> +
>> +     ``parm.capture``
>> +	 set all fields except ``parm.capture.timeperframe`` to 0.
>> +
>> +     ``parm.capture.timeperframe``
>> +	 the desired coded frame interval; the encoder may adjust it to
>> +	 match hardware requirements.
>> +
>> +   * **Return fields:**
>> +
>> +     ``parm.capture.timeperframe``
>> +	 the adjusted frame interval.
>> +
>> +   .. important::
>> +
>> +      Changing the ``CAPTURE`` frame interval sets the framerate for the
>> +      coded video. It does *not* set the rate at which buffers arrive on the
>> +      ``CAPTURE`` queue, that depends on how fast the encoder is and how
>> +      fast raw frames are queued on the ``OUTPUT`` queue.
>> +
>> +   .. important::
>> +
>> +      ``timeperframe`` deals with *frames*, not fields. So for interlaced
>> +      formats this is the time per two fields, since a frame consists of
>> +      a top and a bottom field.
>> +
>> +   .. note::
>> +
>> +      Not all drivers support this functionality, in that case just set
>> +      the desired coded frame interval for the ``OUTPUT`` queue.
> 
> There is a slight contorsion in the resulting user-space API. When I
> read this, the logical thing to do for live streams would be to just
> set the OUTPUT and the driver will take care of CAPTURE for me.
> 
> While if I want to do offline, I don't know if this is supported or
> not. So the flow would be a bit special:
> 
>   S_PARM(OUTPUT) with coded video frame rate
>   S_PARM(CAPTURE) width coded video
>   if ^ worked:
>      S_PARM(OUTPUT) with fastest rate possible
> 
> Ideally I would have preferred if there was a more straight forward way
> to configure offline encoding for fastest performance with specific
> coded framerate. I don't think it's a blocker though, performance is
> not critical at all here. Maybe I'm missing something that allow to
> check if this is supported or not without trying it ?

Good point. I considered adding a flag for the v4l2_fmtdesc struct that
reports whether you can set the capture framerate independently from the
OUTPUT framerate. Perhaps V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL?

I actually think it would be best if that's added. It is not enough to
rely on whether S_PARM(CAPTURE) works to determine this feature since
at least one encoder drivers supports both OUTPUT and CAPTURE with S_PARM,
but CAPTURE does the same as OUTPUT, so that would be a red herring.

I'll add this flag for v3.

Regards,

	Hans

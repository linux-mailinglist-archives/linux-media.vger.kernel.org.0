Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E9F20129
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 10:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfEPIT0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 16 May 2019 04:19:26 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:52004 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfEPITZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 04:19:25 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 2BBC53C013A;
        Thu, 16 May 2019 10:19:23 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Uu1cCZtkaWvY; Thu, 16 May 2019 10:19:16 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 08F2D3C00D1;
        Thu, 16 May 2019 10:19:16 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289]) by
 HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289%12]) with mapi id
 14.03.0439.000; Thu, 16 May 2019 10:19:15 +0200
From:   "Rodin, Michael (Ferchau; ADITG/ESM1)" <mrodin@de.adit-jv.com>
To:     "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "Friedrich, Eugen (ADITG/ESM1)" <efriedrich@de.adit-jv.com>,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: Questions regarding Documentation/media/uapi/v4l/field-order.rst
Thread-Topic: Questions regarding
 Documentation/media/uapi/v4l/field-order.rst
Thread-Index: AdT0SL9o51JIskG9TEewiVl3rOlV0gFhA90ABHsrheA=
Date:   Thu, 16 May 2019 08:19:15 +0000
Message-ID: <AC35D0CFBC66A84AAA9DF4334B52828D13617E17@HI2EXCH01.adit-jv.com>
References: <AC35D0CFBC66A84AAA9DF4334B52828D13614162@HI2EXCH01.adit-jv.com>
 <187c237b-6b75-f408-ae41-6065baf5cd7f@xs4all.nl>
In-Reply-To: <187c237b-6b75-f408-ae41-6065baf5cd7f@xs4all.nl>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.92.112]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On 4/16/19 3:54 PM, Rodin, Michael (Ferchau; ADITG/ESM1) wrote:
> > Hi,
> >
> > I would like to ask several questions regarding the documentation of the
> enum "v4l2_field" [1].
> > These questions came up during my investigations of issues with
> > interaction between the gstreamer plugin v4l2src and the rcar video input
> driver [2].
> >
> > The documentation [1] specifies that:
> > "All video capture and output devices must report the current field order.
> > Some drivers may permit the selection of a different order, to this
> > end applications initialize the field field of struct v4l2_pix_format
> > before calling the VIDIOC_S_FMT ioctl. If this is not desired it
> > should have the value V4L2_FIELD_ANY (0)."
> >
> > If I have understood these lines correctly, this means that if
> > userspace sets "field" member of the struct "v4l2_pix_format" to
> > V4L2_FIELD_ANY and uses this as parameter for the VIDIOC_S_FMT ioctl,
> > then a driver should select/report the field order, which was
> > previously set by media-ctl utility in the next subdevice, which is
> > connected
> to the /dev/videoX node (From my understanding this would be equivalent to
> the "current field order").
> >
> > If the described behavior is correct, then the description in the table
> > row for
> V4L2_FIELD_ANY in [1] is incomplete:
> > "Applications request this field order when any one of the
> V4L2_FIELD_NONE, V4L2_FIELD_TOP, V4L2_FIELD_BOTTOM, or
> V4L2_FIELD_INTERLACED formats is acceptable."
> > What if V4L2_FIELD_ALTERNATE or V4L2_FIELD_SEQ_TB or
> V4L2_FIELD_SEQ_BT are also acceptable for the application?
> > I think that the specification is either unprecise or my understanding of
> > the
> specification is wrong.
>
> The spec is a bit out of date: those missing field values were probably
> added
> after this text was written. I'll make a patch fixing this.

Thank you for the patch! I think, the sentence "Drivers choose depending on
hardware capabilities..." in the description of V4L2_FIELD_ANY is also
unprecise,
because when media-ctl is used, the format is chosen by the userspace and
not by the driver. So if I choose "interlaced" for the connected subdevice
by using media-ctl (which calls VIDIOC_SUBDEV_S_FMT) and it is successfully
set, then V4L2_FIELD_ANY will definitely return V4L2_FIELD_INTERLACED
and nothing else is possible.

> >
> > Another potential issue, which I found in this documentation is that
> > it does not distinguish between multiple contexts in which enum v4l2_field
> can be used. I can think of at least two different contexts:
> > - When used to select the field order with VIDIOC_S_FMT ioctl.
> > - When used to report the field order in a buffer: for example application
> sets V4L2_FIELD_ALTERNATE in VIDIOC_S_FMT ioctl and then gets buffers,
> which have V4L2_FIELD_TOP/BOTTOM set.
>
> IMHO the text is reasonably clear on that. But if you have suggestions to
> improve it, then make a proposal.
>
> > Now with this in mind, when I read the description of V4L2_FIELD_NONE:
> > "The driver may also indicate this order when it cannot distinguish
> > between
> V4L2_FIELD_TOP and V4L2_FIELD_BOTTOM."
>
> Whoops, that makes no sense. There are no drivers that do this. I'll remove
> this line. If a driver can't tell the difference, then it should just pick
> FIELD_TOP
> or BOTTOM.

Thank you! So this means that drivers should return FIELD_ALTERNATE in S_FMT,
even if they can not distinguish between FIELD_TOP and FIELD_BOTTOM.
Would it make sense to add your last sentence "If a driver can't tell the
difference,
then it should just pick FIELD_TOP or BOTTOM." to the description of
V4L2_FIELD_ALTERNATE (or better just FIELD_TOP so it is easier for userspace
to check whether there is no field detection), so this case is documented
after
removing of "The driver may also indicate this order when it cannot
distinguish
between V4L2_FIELD_TOP and V4L2_FIELD_BOTTOM."?

> > I see two possible meanings/interpretations:
> > - If application sets V4L2_FIELD_ALTERNATE in VIDIOC_S_FMT ioctl, report
> V4L2_FIELD_NONE back
> >    so the application knows that the driver can not provide any TOP/BOTTOM
> metadata in the buffers
> >    (which may be necessary for the application for example for
> > deinterlacing)
> before it has got any buffer.
> > - If application sets V4L2_FIELD_ALTERNATE in VIDIOC_S_FMT ioctl, driver
> reports V4L2_FIELD_ALTERNATE back,
> >    even if it can not distinguish between TOP/BOTTOM. But when the
> application starts to read buffers,
> >    they have V4L2_FIELD_NONE set if it's not possible to distinguish
> > between
> TOP/BOTTOM.
>
> Actually, drivers cannot ever return NONE for a top or bottom field.
> FIELD_NONE indicates that a full frame has arrived, and doing something else
> would break userspace.
>
> >
> > Also there is another ambiguity in the description of V4L2_FIELD_NONE:
> > "Images are in progressive format, not interlaced."
> > What does "interlaced" mean in this case? Does it mean the other possible
> enum values or just the V4L2_FIELD_INTERLACED?
>
> It means that the source video transmitted full frames, not top and bottom
> fields. I clarified the text a bit.

Thanks for the clarification! So just to avoid misunderstanding, 
V4L2_FIELD_INTERLACED and V4L2_FIELD_SEQ_BT/TB
are "interlaced" in this context, because they contain fields (and are "field-based")?

> > If this just means V4L2_FIELD_INTERLACED, then it would imply that for
> > example V4L2_FIELD_SEQ_TB and V4L2_FIELD_ALTERNATE are progressive
> formats, which is obviously not true.
> > And also generally, in which of described contexts should be
> V4L2_FIELD_NONE set or reported (buffer or VIDIOC_S_FMT ioctl)?
>
> For video capture (that's what we are talking about here) it is returned by
> the
> driver in v4l2_buffer, never by userspace. Userspace can try to request a
> specific field value when calling S_FMT, but the driver can overwrite it.

Sorry, what do you mean by "returned by userspace" here?

> The possible field values that a driver can support are dependent on the
> video
> source (i.e. sensors are always FIELD_NONE) and the hardware capabilities.
>
> > Another point is that V4L2_FIELD_INTERLACED is also used by v4l2src to
> > tell rcar-vin driver to combine the fields before giving them to
> > application, so
> basically it requests progressive signal. So the meanings of
> V4L2_FIELD_INTERLACED and V4L2_FIELD_NONE are basically the same in this
> case.
>
> Certainly not. FIELD_INTERLACED combines two fields into a single buffer,
> but
> the odd and even lines in the frame were captured at different times.
> Whereas for FIELD_NONE all lines were captured at the same time.
>
> So a FIELD_INTERLACED buffer may need to undergo additional deinterlacing.
>
> If the hardware already does high-quality deinterlacing then that might be a
> reason for the driver to return FIELD_NONE to avoid additional deinterlacing
> in userspace.
>
> In practice there are three main categories in the way the field is handled:
>
> 1) The video source is a webcam: field is always FIELD_NONE, set by the
> driver.
>
> 2) The video source is HDMI: if the video is progressive, then the field is
> always
>    FIELD_NONE. If the video is interlaced, then the field is always
> FIELD_ALTERNATE
>    in v4l2_format and alternating FIELD_TOP and BOTTOM in v4l2_buffer.
>
> 3) The video source is SDTV (i.e. S-Video or composite): the video is always
>    interlaced, and it depends on the hardware which field values are
> supported,
>    except for FIELD_NONE, which is never returned as far as I am aware.
>
> Regards,
>
> 	Hans
>
> >
> > Thank you in advance and sorry for the long mail!
> >
> > [1] Documentation/media/uapi/v4l/field-order.rst
> > [2] drivers/media/platform/rcar-vin
> >
> > Best regards
> >
> > Michael Rodin
> >
> > Advanced Driver Information Technology GmbH Engineering Software
> > Multimedia 1 (ADITG/ESM1) Robert-Bosch-Str. 200
> > 31139 Hildesheim
> > Germany
> >
> > Tel. +49 5121 49 6936
> > Fax +49 5121 49 6999
> > mrodin@de.adit-jv.com
> > Web: www.adit-jv.com
> >
> > ADIT is a joint venture company of Robert Bosch GmbH/Robert Bosch Car
> > Multimedia GmbH and DENSO Corporation
> > Sitz: Hildesheim, Registergericht: Amtsgericht Hildesheim HRB 3438
> > Geschaeftsfuehrung: Wilhelm Grabow, Ken Yaguchi
> >


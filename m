Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4666A225196
	for <lists+linux-media@lfdr.de>; Sun, 19 Jul 2020 13:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgGSLSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jul 2020 07:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgGSLSs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jul 2020 07:18:48 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85309C0619D2;
        Sun, 19 Jul 2020 04:18:48 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j11so17251921ljo.7;
        Sun, 19 Jul 2020 04:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gk20bw+zaWA2hPj+DlFMQDP5n0eDdkLMsmJaGFQu7t8=;
        b=YlTGd0Nb4mxp/xyhISyq4pDfrpyhBaVj+B+r6jvcHTUCaG6zH7+6TEE9VYgEF6TBbx
         Sr7FY9MgAPYxRXWK9NdLNe2mkZkYayE8CL1fDt0Jz+v1FXmKrg8sphBGECkP+yKNCFXd
         2FAXL5GGKOu1cvPmGc7e+vmz9NEBoFLk9CKyAw8Xp3HU4uNceUt3LX7B0c7tcjbJMM8h
         qhc/RcxuyAr47HPpse7dszgEd3DBr8HRjmDFpBtDnR0qoMW9Dw2DQWXrNvu+/8UAJUCn
         jcDrjTGntDgX2Ozrl4LTCRfvsaZ5pFALd+jOeV8Vz6W1r+IPP26HMpLeGWJLVrXrWWc6
         FERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gk20bw+zaWA2hPj+DlFMQDP5n0eDdkLMsmJaGFQu7t8=;
        b=MyCRkfwlps06fw9pk9zv07tDjjhsxMlw9IcD/S6Fkk1mO3rcG81Ri2jFBQV4m3nvku
         EPAs7eH7sfYfYlDSovDd7OTFneZQHffU0TyLXjaiFp2sZgYrX/EsXQAr0ra1O5cTUKtu
         4ma3ghWQJlak1m4fgKoAA9CbdemFucDuNG+kPYVpfOgj6O6WV/Mp1A+6SGbazYDzvZXC
         mATpS0SvohvMcgW1kKaFQ+B0BTUBONt/z6BryOHcSOVsdKm9pggyyr5nDmfTuJR+JJJf
         +L672hCtdGJCSbLCjnWeeFsLzf2UBCdfQTMAUC8e3EwYuK4V1wKbDw+YE9mV5UG2JoEp
         dmbw==
X-Gm-Message-State: AOAM532IldRJlqdeXLSM+STBVs7s2qo4Eg2zmznwFB9iL3IWWJvTOlXt
        OV+HjTYU6kJ/yY9uilbhosM=
X-Google-Smtp-Source: ABdhPJw39xZU0u5OwRnyP7KJYOPwjgtd4MtfEjGO2se1tpFxILH8aCftUf6I2FCDCvqLLyJeCDKXrw==
X-Received: by 2002:a2e:880e:: with SMTP id x14mr7752631ljh.218.1595157526936;
        Sun, 19 Jul 2020 04:18:46 -0700 (PDT)
Received: from z50.localnet (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id g18sm3101423ljk.27.2020.07.19.04.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2020 04:18:46 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v6 1/9] media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
Date:   Sun, 19 Jul 2020 13:18:44 +0200
Message-ID: <4043309.ejJDZkT8p0@z50>
In-Reply-To: <750089f9-0e7f-3b2a-ec85-38452cb64fa1@xs4all.nl>
References: <20200714135812.55158-1-jacopo+renesas@jmondi.org> <20200714135812.55158-2-jacopo+renesas@jmondi.org> <750089f9-0e7f-3b2a-ec85-38452cb64fa1@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wednesday, July 15, 2020 5:08:05 P.M. CEST Hans Verkuil wrote:
> On 14/07/2020 15:58, Jacopo Mondi wrote:
> > Introduce two new pad operations to allow retrieving and configuring the
> > media bus parameters on a subdevice pad.
> > 
> > The newly introduced operations aims to replace the s/g_mbus_config video
> > operations, which have been on their way for deprecation since a long
> > time.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index f7fe78a6f65a..d8b9d5735307 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
> >   *
> >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> >   *                  may be adjusted by the subdev driver to device capabilities.
> > + *
> > + * @get_mbus_config: get the media bus configuration of a remote sub-device.
> > + *		     The media bus configuration is usually retrieved from the
> > + *		     firmware interface at sub-device probe time, immediately
> > + *		     applied to the hardware and eventually adjusted by the
> > + *		     driver. Remote sub-devices (usually video receivers) shall
> > + *		     use this operation to query the transmitting end bus
> > + *		     configuration in order to adjust their own one accordingly.
> > + *		     Callers should make sure they get the most up-to-date as
> > + *		     possible configuration from the remote end, likely calling
> > + *		     this operation as close as possible to stream on time. The
> > + *		     operation shall fail if the pad index it has been called on
> > + *		     is not valid.
> > + *
> > + * @set_mbus_config: set the media bus configuration of a remote sub-device.
> > + *		     This operations is intended to allow, in combination with
> > + *		     the get_mbus_config operation, the negotiation of media bus
> > + *		     configuration parameters between media sub-devices. The
> > + *		     operation shall not fail if the requested configuration is
> > + *		     not supported, but the driver shall update the content of
> > + *		     the %config argument to reflect what has been actually
> > + *		     applied to the hardware. The operation shall fail if the
> > + *		     pad index it has been called on is not valid.
> >   */
> 
> Hm, I'd hoped I could merge this, but I think include/media/v4l2-mediabus.h
> also needs to be updated.
> 
> So the old g_mbus_config returned all supported configurations, while the
> new get_mbus_config returns the *current* configuration.
> 
> That's fine, but that means that the meaning of the struct v4l2_mbus_config
> flags field changes as well and several comments in v4l2-mediabus.h need to
> be updated to reflect this.
> 
> E.g. instead of '/* How many lanes the client can use */' it becomes
> '/* How many lanes the client uses */'.
> 
> Frankly, these flags can be redesigned now since you only need a single
> e.g. V4L2_MBUS_HSYNC_ACTIVE_HIGH flag since if it is not set, then that
> means ACTIVE_LOW. And since it is now a single bit, it is also easy to
> make each flag a bit field.

Even if this makes sense for .get_mbus_config() which returns current 
configuration, how about keeping the old semantics of the flags and let 
.set_mbus_config() accept a potentially incomplete or redundant set of flags 
specified by the caller to select a supported configuration from?  That approach 
was actually proposed before by Jacopo when he argued against my suggestion to 
add a wrapper with a check for mutually exclusive flags[1], and I found it a 
very good alternative to my other rejected suggestion of adding TRY support.

[1] https://www.spinics.net/lists/linux-media/msg171878.html

Thanks,
Janusz

> 
> The CSI2 lanes/channels can just be a bit field for the number of lanes/channels,
> which is much easier to read. I strongly recommend making this change at the minimum.
> 
> Now all this can be done in a follow-up series, but the v4l2-mediabus.h
> definitely needs to be updated to reflect the new code.
> 
> This can be done as a v6 5.5/9 patch (since it should come right after the
> g/s_mbus_config removal).
> 
> Regards,
> 
> 	Hans
> 
> >  struct v4l2_subdev_pad_ops {
> >  	int (*init_cfg)(struct v4l2_subdev *sd,
> > @@ -710,6 +733,10 @@ struct v4l2_subdev_pad_ops {
> >  			      struct v4l2_mbus_frame_desc *fd);
> >  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> >  			      struct v4l2_mbus_frame_desc *fd);
> > +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > +			       struct v4l2_mbus_config *config);
> > +	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > +			       struct v4l2_mbus_config *config);
> >  };
> >  
> >  /**
> > 
> 
> 





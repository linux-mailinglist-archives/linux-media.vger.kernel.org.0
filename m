Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4F4638D10
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 16:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbiKYPHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 10:07:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiKYPHo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 10:07:44 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80813DF6F
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:07:43 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id i10so10951758ejg.6
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E4XSsR+dbzmd1mhecep8xM2ebmxu9yjLHuBDKo3tp9k=;
        b=ojyco4eRnNNLJfcCQ6JscsLAqgE6b3EON9+Jj9JCWW28bCP87A46gtwuyeonDnG0oo
         U+AAbgHJ9dHjUTw6gfT0uW8aUvbRYvhmMXd2Oljl+ncVyJvCwj8szNbh3yZ75iv+UR6i
         Rkva0+m6c9RF3dVs8uI/Z7AyPQM6iw3d7bnTEOCPADBlM5s7TcAV1JOagHA7Z27USFyz
         3G7L8iy4kRTPabZ+2J7B+dDJ6x8YBYlxQLrq5tjqSM60TQK5igj/F6n5YkQGeCGysQds
         h8ET69v95fDNfxdkdFRgOPKrHVPPFyJm5XcGwEW3XPxVlAFLatWv0FfBO2EIhmllvb5Y
         RMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4XSsR+dbzmd1mhecep8xM2ebmxu9yjLHuBDKo3tp9k=;
        b=lgZB/DdcUGJU6l4N9E3BEZSuNON1U4FKcVMljWlAOYUiQfIQz3SoZbwYrPs2j+AC5y
         gPSJ/R60m1S0Vu+Y/OKP5RHgz36s8niuYh4XJpyIovmgfIEARQlarSUe7g9euwzqCF2q
         JTmAsGpSiD3bcZkvwqjZqcr+UCigxtEFyhM8Po7v1oJyxM5vehq4u6YLmexLu1e+7w/e
         b3AcGKuOhWxfxRHS2KoSGbUCBynV8VAvt5x0T7xl6oOvTLYeDcXO8RvWaANSPFQjmaSJ
         g/BieQG9q3tXLffpzVVJF7l4o25OnXgCEx2j+w2yVf6V54K6n+OkQgmm9diCxNFIRFjq
         I+zQ==
X-Gm-Message-State: ANoB5pkTLus7h0d8Vsj5vQXcwD9x70BRvbqn6yWTE9TcYNGy4E5tQump
        eepS8Sm3lnzuTiL9Xc+BR13+AvIfjPqd8gtn
X-Google-Smtp-Source: AA0mqf4gQJvRm/S+3RjqRiqrIEc2QOIXdsOYz2AXioD6Cf7tiYAtQN7/cApj1EyYj6fTOEoMWMt+kw==
X-Received: by 2002:a17:906:7d13:b0:7bc:addd:2c54 with SMTP id u19-20020a1709067d1300b007bcaddd2c54mr2906391ejo.24.1669388861581;
        Fri, 25 Nov 2022 07:07:41 -0800 (PST)
Received: from melexis.com ([2a02:2378:1085:b41d:bec4:93fd:8998:6d7a])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906219100b007b265d3f6a6sm1615146eju.162.2022.11.25.07.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:07:41 -0800 (PST)
Date:   Fri, 25 Nov 2022 17:07:37 +0200
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v3 2/8] media: v4l: ctrls: Fill V4L2_CID_TOF_CLASS
 controls
Message-ID: <Y4DaOQKG43AbE74K@melexis.com>
References: <cover.1669381013.git.vkh@melexis.com>
 <d3fb74f580865c972877047f95cb65b65e773837.1669381013.git.vkh@melexis.com>
 <29a4cc81-f43c-71a6-25f1-23234d7041e0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29a4cc81-f43c-71a6-25f1-23234d7041e0@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for your review.
I'll fix your remarks in next version.

On Fri, Nov 25, 2022 at 03:22:16PM +0100, Hans Verkuil wrote:
> On 25/11/2022 14:34, Volodymyr Kharuk wrote:
> > Define names, flags and types of TOF controls. *dims* is driver specific.
> > It also means, that it is not possible to use new_std for arrays.
> > 
> > Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 564fedee2c88..1135d33c1baa 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1196,6 +1196,13 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
> >  	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
> >  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
> > +
> > +	/* Time of light camera controls */
> > +	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > +	case V4L2_CID_TOF_CLASS:	return "Time of light Camera Controls";
> 
> light -> Flight
> 
> > +	case V4L2_CID_TOF_PHASE_SEQ:	return "TOF phase sequence";
> 
> Capitalize, so: "TOF Phase Sequence"
> 
> > +	case V4L2_CID_TOF_FMOD:		return "TOF frequency modulation";
> 
> "TOF Frequency Modulation"
> 
> > +	case V4L2_CID_TOF_TINT:		return "TOF time integration";
> 
> "TOF Time Integration"
> 
> >  	default:
> >  		return NULL;
> >  	}
> > @@ -1403,6 +1410,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >  	case V4L2_CID_DETECT_CLASS:
> >  	case V4L2_CID_CODEC_STATELESS_CLASS:
> >  	case V4L2_CID_COLORIMETRY_CLASS:
> > +	case V4L2_CID_TOF_CLASS:
> >  		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
> >  		/* You can neither read nor write these */
> >  		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
> > @@ -1541,6 +1549,18 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> >  		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> >  		break;
> > +	case V4L2_CID_TOF_PHASE_SEQ:
> > +		*type = V4L2_CTRL_TYPE_U16;
> > +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> > +		break;
> > +	case V4L2_CID_TOF_FMOD:
> > +		*type = V4L2_CTRL_TYPE_U8;
> > +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> > +		break;
> > +	case V4L2_CID_TOF_TINT:
> > +		*type = V4L2_CTRL_TYPE_U16;
> > +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> > +		break;
> >  	default:
> >  		*type = V4L2_CTRL_TYPE_INTEGER;
> >  		break;
> 
> Regards,
> 
> 	Hans

-- 
--
BR,
Volodymyr Kharuk

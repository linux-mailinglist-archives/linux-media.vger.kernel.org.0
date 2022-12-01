Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA06963F46C
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 16:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbiLAPpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Dec 2022 10:45:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbiLAPpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Dec 2022 10:45:02 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BB22185
        for <linux-media@vger.kernel.org>; Thu,  1 Dec 2022 07:45:00 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id r26so2870015edc.10
        for <linux-media@vger.kernel.org>; Thu, 01 Dec 2022 07:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZoijEDeQq5KmpIxx2DGH25QRi6qVCVswuEzepCkZP4=;
        b=nEAKuSFkA3Lsgup6fw8AYXTcTfIlb+Mu4cmr+/pSqYZf1frlWWJsRlzlxmqKjAfLrb
         M+8fVmF2E5Dnj6qpfEdicTjlM8aJFjtJc4WhMnbrv4JH66SHjnYH03Y2sVPrE7CnYFeB
         PNn2q55KndoePV3UkBWtcmt03+cz7ajNmNmoeXmEl0kcvr8Ee01Vi62Th/SXMNBc4doT
         9aqKN/SVqe8Lf3fDPi+nRes0bOa2qbccxoITVA9cBBBOBKt9knrrM6vbJqDMtqY1vQZb
         E4CflMUSX7Ye8yBoq+twGaDle/uoPpkYN6nit98M9a7/O0p0o70iaRKtI2zUkKotm6b6
         iV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZoijEDeQq5KmpIxx2DGH25QRi6qVCVswuEzepCkZP4=;
        b=vjmk0wD4G2x7vC0JkBfESzRO9sp4P4zAQpHet46QwEVr4mTbdr7Dn1z6E2lUY09HWI
         bQHo+BcLxHB3fdWhfJ+rzo2vcf0Kjekx4m93IAgHxNw8Me2YPdps4aN8Gi+Sx4ncQL92
         oSvbOuKk5FkEopcWlcaOBSaE/MrXZg5S4NGghcS84TrBEz3DUJK/afHQx7RTwKpp2sj1
         +gby5bH2azbAGjdRW7br/RlE7l7SrMXvkRWbYeT9XCmSpKqnVDiv9x/HG8LxSJWem5GR
         TppLd+tmBOthnARbYrLJ/je7ybClA4tg4zPHeFq4+PSNEvYzW08fpo8Cj2Fi98CkkjJd
         5iMg==
X-Gm-Message-State: ANoB5pn4UIEYsF5beYbWv/M1RwnFZ97z5jVhWjT+r8sf8Z9raq5NRHq5
        hERJ7v7GU8fJxNceiRVDOQrztg==
X-Google-Smtp-Source: AA0mqf5uu8S8mr1+GohUMcb9htQ90+gbnI8vchUOkuuqnlb7M0DBoa6o0byXyY+ULlwkfEVD3T9Y7g==
X-Received: by 2002:a50:fc11:0:b0:45a:1bfa:98bf with SMTP id i17-20020a50fc11000000b0045a1bfa98bfmr60665879edr.413.1669909499031;
        Thu, 01 Dec 2022 07:44:59 -0800 (PST)
Received: from melexis.com ([31.144.161.76])
        by smtp.gmail.com with ESMTPSA id d7-20020a170906304700b0079800b8173asm1910412ejd.158.2022.12.01.07.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:44:58 -0800 (PST)
Date:   Thu, 1 Dec 2022 17:44:52 +0200
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
Subject: Re: [PATCH v3 4/8] media: v4l: ctrls-api: Allow array update in
 __v4l2_ctrl_modify_range
Message-ID: <Y4jL9Mu7T/TO4g66@melexis.com>
References: <cover.1669381013.git.vkh@melexis.com>
 <1758f7525f6c8c602f36eef5e07a97ddfb1b548f.1669381013.git.vkh@melexis.com>
 <023c0d14-c3f1-4b59-4718-d2cf2bb4699f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <023c0d14-c3f1-4b59-4718-d2cf2bb4699f@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Nov 25, 2022 at 03:35:34PM +0100, Hans Verkuil wrote:
> On 25/11/2022 14:34, Volodymyr Kharuk wrote:
> > For V4L2_CID_TOF_TINT, which is dynamic array, it is required to use
> > __v4l2_ctrl_modify_range.  So the idea is to use type_ops instead of u64
> > from union. It will allow to work with any type.
> > 
> > Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-api.c | 15 +++------------
> >  1 file changed, 3 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > index d0a3aa3806fb..09735644a2f1 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > @@ -942,8 +942,6 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
> >  	case V4L2_CTRL_TYPE_U8:
> >  	case V4L2_CTRL_TYPE_U16:
> >  	case V4L2_CTRL_TYPE_U32:
> > -		if (ctrl->is_array)
> > -			return -EINVAL;
> >  		ret = check_range(ctrl->type, min, max, step, def);
> >  		if (ret)
> >  			return ret;
> > @@ -960,17 +958,10 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
> >  		ctrl->default_value = def;
> >  	}
> >  	cur_to_new(ctrl);
> > -	if (validate_new(ctrl, ctrl->p_new)) {
> > -		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
> > -			*ctrl->p_new.p_s64 = def;
> > -		else
> > -			*ctrl->p_new.p_s32 = def;
> > -	}
> > +	if (validate_new(ctrl, ctrl->p_new))
> > +		ctrl->type_ops->init(ctrl, 0, ctrl->p_new);
> 
> Hmm, this sets *all* elements of the array to the default_value, not
> just the elements whose value is out of range.
> 
> Is that what you want? Should this perhaps depend on the type of
> control? I.e. in some cases it might make sense to do this, in other
> cases it makes more sense to only adjust the elements that are out
> of range.
> 
> How does that work for this TINT control?
Actually for types like INTEGER/U8/U16/U32/BOOLEAN/BUTTON/BITMASK, the function
validate_new will return zero always as well as they fix the range on the fly.
So that is ok for mlx7502x sensors.

For types like compound/string/menu indeed, it will sets all elements of array
to default array. To fix it I propose to fix it by using the functions
std_validate_elem to check per element and then set the default manually.
But then it means, that __v4l2_ctrl_modify_range will work only for standart
v4l2 types, and not if driver use their own implementation. 

Is it fine for you? What do you think?
> 
> Regards,
> 
> 	Hans
> 
> >  
> > -	if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
> > -		value_changed = *ctrl->p_new.p_s64 != *ctrl->p_cur.p_s64;
> > -	else
> > -		value_changed = *ctrl->p_new.p_s32 != *ctrl->p_cur.p_s32;
> > +	value_changed = !ctrl->type_ops->equal(ctrl, ctrl->p_cur, ctrl->p_new);
> >  	if (value_changed)
> >  		ret = set_ctrl(NULL, ctrl, V4L2_EVENT_CTRL_CH_RANGE);
> >  	else if (range_changed)
> 

-- 
--
BR,
Volodymyr Kharuk

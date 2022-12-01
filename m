Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB0B63F59C
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 17:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiLAQre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Dec 2022 11:47:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiLAQrC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Dec 2022 11:47:02 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F06AE4DC
        for <linux-media@vger.kernel.org>; Thu,  1 Dec 2022 08:46:52 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id n20so5664935ejh.0
        for <linux-media@vger.kernel.org>; Thu, 01 Dec 2022 08:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PDeFvM29aCaeKNJy5VGjhZPlERQE8W9s9k6CwG0MHBs=;
        b=BZdSgOa2GHtGfp7rWqxebtR2M/c38UUFg3Y1HDAJWbI9ObIaQWapIAV2NlZ3PFCiTT
         354RV4TK9Avu9NNH8JdVTuF2shYHL+YoHL8B8l78iykls7bhHmAOlSLq8mAUZgEs1w+P
         2gU1eibYINJL3nJUavnwuVnoCNoGueJnJXXY8BsOlGQoCtC74Mc3zoPLHBePZbQeZ15K
         x6LZKG6d14YLODEzrVhky3qNBzEYL8EK6B2yaYB+DVI5/B5ggatHhsNWksV+3vAatE1T
         593mCG6JfFIV++x25EbXdrfL9UgdqzyV7w3IU3lphfIqe/kz8/es+pcVvJo4v4qMcrld
         GLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDeFvM29aCaeKNJy5VGjhZPlERQE8W9s9k6CwG0MHBs=;
        b=xpcuI1ekHCpRtpAVsc2DOdvY0qesi7KQKsJcRupma56DEH0OpaOo9nJcCXte8JZYA8
         SIbaFLGC4Jk0IM1PoKn2FlaDJ6dPygPmJbyG0mPzlYYWD8Qm293mDS9kLfB2n7M2TIvI
         jFDe+VnPPXPnZbugLBrRvjNxewNWANRRNyBJbsnWB9JNz7Uzc6khpbNfv6pDmLbcblQz
         mVLicsf5yzFiMPmiSbsFuX6fDvTlqWRDW3v2/SGbVX12uVlUTSauodRE84P7by8OV0Nl
         dSvIzxPQJukAInnLxpM2x9dWoYb5BKL8hvI7FX16tJInMa7m+Fxj4YqQL0opGXhKrToc
         Kydg==
X-Gm-Message-State: ANoB5pkMiT14Le9Pk75/YMFIiYoaXa79K0st2l+Rc5XCHK8SGycaiBoh
        mAZ8YQkWU8nGzjjVMZyGHRwXeQ==
X-Google-Smtp-Source: AA0mqf4WqR3lCBlHchBGGkZ7Pm56ZW0olVznU0W/Y73MFhMqiGaDjOXT45c5vIRzHzAzEXRwmoRFsA==
X-Received: by 2002:a17:906:a143:b0:7bd:fe2a:d0e1 with SMTP id bu3-20020a170906a14300b007bdfe2ad0e1mr22017802ejb.374.1669913211232;
        Thu, 01 Dec 2022 08:46:51 -0800 (PST)
Received: from melexis.com ([31.144.161.76])
        by smtp.gmail.com with ESMTPSA id h4-20020aa7c604000000b0045bd14e241csm1911431edq.76.2022.12.01.08.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 08:46:50 -0800 (PST)
Date:   Thu, 1 Dec 2022 18:46:45 +0200
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
Message-ID: <Y4jadWbRlrrTU+Pz@melexis.com>
References: <cover.1669381013.git.vkh@melexis.com>
 <1758f7525f6c8c602f36eef5e07a97ddfb1b548f.1669381013.git.vkh@melexis.com>
 <023c0d14-c3f1-4b59-4718-d2cf2bb4699f@xs4all.nl>
 <Y4jL9Mu7T/TO4g66@melexis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4jL9Mu7T/TO4g66@melexis.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 01, 2022 at 05:44:52PM +0200, Volodymyr Kharuk wrote:
> Hi Hans,
> 
> On Fri, Nov 25, 2022 at 03:35:34PM +0100, Hans Verkuil wrote:
> > On 25/11/2022 14:34, Volodymyr Kharuk wrote:
> > > For V4L2_CID_TOF_TINT, which is dynamic array, it is required to use
> > > __v4l2_ctrl_modify_range.  So the idea is to use type_ops instead of u64
> > > from union. It will allow to work with any type.
> > > 
> > > Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ctrls-api.c | 15 +++------------
> > >  1 file changed, 3 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > > index d0a3aa3806fb..09735644a2f1 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > > @@ -942,8 +942,6 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
> > >  	case V4L2_CTRL_TYPE_U8:
> > >  	case V4L2_CTRL_TYPE_U16:
> > >  	case V4L2_CTRL_TYPE_U32:
> > > -		if (ctrl->is_array)
> > > -			return -EINVAL;
> > >  		ret = check_range(ctrl->type, min, max, step, def);
> > >  		if (ret)
> > >  			return ret;
> > > @@ -960,17 +958,10 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
> > >  		ctrl->default_value = def;
> > >  	}
> > >  	cur_to_new(ctrl);
> > > -	if (validate_new(ctrl, ctrl->p_new)) {
> > > -		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
> > > -			*ctrl->p_new.p_s64 = def;
> > > -		else
> > > -			*ctrl->p_new.p_s32 = def;
> > > -	}
> > > +	if (validate_new(ctrl, ctrl->p_new))
> > > +		ctrl->type_ops->init(ctrl, 0, ctrl->p_new);
> > 
> > Hmm, this sets *all* elements of the array to the default_value, not
> > just the elements whose value is out of range.
> > 
> > Is that what you want? Should this perhaps depend on the type of
> > control? I.e. in some cases it might make sense to do this, in other
> > cases it makes more sense to only adjust the elements that are out
> > of range.
> > 
> > How does that work for this TINT control?
> Actually for types like INTEGER/U8/U16/U32/BOOLEAN/BUTTON/BITMASK, the function
> validate_new will return zero always as well as they fix the range on the fly.
> So that is ok for mlx7502x sensors.
> 
> For types like compound/string/menu indeed, it will sets all elements of array
> to default array. To fix it I propose to fix it by using the functions
> std_validate_elem to check per element and then set the default manually.
> But then it means, that __v4l2_ctrl_modify_range will work only for standart
> v4l2 types, and not if driver use their own implementation. 
> 
> Is it fine for you? What do you think?

I've another idea. If validate_new is fixing on the fly
and we can't modify range for copmound/string types, so we can forbidden
array for MENU types. Then validate_new will do the job for the rest types.
As for now there are no needs in arrays for MENU types.

What do you think?

-- 
--
BR,
Volodymyr Kharuk

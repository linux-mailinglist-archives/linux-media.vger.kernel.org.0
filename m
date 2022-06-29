Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA80560129
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 15:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbiF2NT4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 09:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbiF2NT4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 09:19:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD8B205C9
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 06:19:54 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 801913D7;
        Wed, 29 Jun 2022 15:19:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656508792;
        bh=bB5fdSAc1we82ey8DR3H+I99xnRTr8h981Ct2V1ysfY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lcsc540vQaQtkM7W+ZM9W3Y80qfGaGp2QCgNHi01hZMRy40qgRGJzMjXSGRYR+G1v
         HkpvIo4N/1ZMeK9Ppc0ydwBRmliJsl/RowlLMNOmJ5C/fmg6f5puD41ujfRLdcOXRK
         tnWYyn+ppK+oZqyh1fNHi/NX3kN6MZfqs7APFwjA=
Message-ID: <bc25d400-abb9-0980-ef93-6af8f5a2e42c@ideasonboard.com>
Date:   Wed, 29 Jun 2022 16:19:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] media: stm32: dcmi: Switch to
 __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220627174156.66919-1-marex@denx.de>
 <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
 <32f04271-4a9a-3291-cf36-ead0383db9ca@ideasonboard.com>
 <YrxDq5I3ZsEf8ruO@pendragon.ideasonboard.com>
 <df7060aa-b201-3d39-72e9-fcb575e7b43e@ideasonboard.com>
 <a2e45188-54d2-1ef2-1d21-cf60d47aeb43@denx.de>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <a2e45188-54d2-1ef2-1d21-cf60d47aeb43@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/06/2022 15:39, Marek Vasut wrote:
> On 6/29/22 14:26, Tomi Valkeinen wrote:
> 
> [...]
> 
>>>> Perhaps the best way to solve this is just to remove the underscores
>>>> from __v4l2_subdev_state_alloc, and change all the drivers which create
>>>> temporary v4l2_subdev_states to use that (and the free) functions. And
>>>> also create the helper macro which can be used in those cases where the
>>>> call is simple (the state is not modified or accessed by the caller).
>>>
>>> As long as we prevent any new driver from using that API, that's fine
>>> with me.
>>
>> An alternative would be to keep the v4l2_subdev_state as a local 
>> variable (allocated in the stack), and add a new function, 
>> v4l2_subdev_state_local_init() or such. The function would initialize 
>> the given state, expecting the allocatable fields to be already 
>> allocated (state->pads, which in the above cases points to another 
>> local variable, i.e. stack).
>>
>> This would prevent the need of a free call, which, while not complex 
>> as such, might cause a bigger amount of changes in some cases to 
>> handle the error paths correctly.
>>
>> Of course, if the above-mentioned macro works, then that's the easiest 
>> solution. But that won't work for all drivers.
> 
> Don't you think a driver fix shouldn't involve "rework the subsystem" 
> requirement to be applicable ?

No, but we should think what's the best way to do the fix, if the fix
is controversial. Otherwise we might just break things even worse.
Adding the macro seems like a much better way, and far from "rework the
subsystem". Granted, this was just a quick edit without testing so it may
fail miserably...

Can you try this out?

Also, a bit unrelated thing: dcmi_get_sensor_format gets the active format
from the source subdev, but dcmi_set_sensor_format sets the try format. That
sounds like a bug. Is it on purpose?


diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 09a743cd7004..eb831b5932e7 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -999,10 +999,6 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
  	const struct dcmi_format *sd_fmt;
  	struct dcmi_framesize sd_fsize;
  	struct v4l2_pix_format *pix = &f->fmt.pix;
-	struct v4l2_subdev_pad_config pad_cfg;
-	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
  	struct v4l2_subdev_format format = {
  		.which = V4L2_SUBDEV_FORMAT_TRY,
  	};
@@ -1037,8 +1033,7 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
  	}
  
  	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
-			       &pad_state, &format);
+	ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
  	if (ret < 0)
  		return ret;
  
@@ -1187,10 +1182,6 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
  	struct v4l2_subdev_format format = {
  		.which = V4L2_SUBDEV_FORMAT_TRY,
  	};
-	struct v4l2_subdev_pad_config pad_cfg;
-	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
  	int ret;
  
  	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
@@ -1203,8 +1194,7 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
  	}
  
  	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
-			       &pad_state, &format);
+	ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
  	if (ret < 0)
  		return ret;
  
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b661e1817470..68676d173047 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1433,6 +1433,19 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
  		__result;						\
  	})
  
+#define v4l2_subdev_call_state_try(sd, o, f, args...)                 \
+	({                                                            \
+		int __result;                                         \
+		static struct lock_class_key __key;                   \
+		const char *name = KBUILD_BASENAME                    \
+			":" __stringify(__LINE__) ":state->lock";     \
+		struct v4l2_subdev_state *state =                     \
+			__v4l2_subdev_state_alloc(sd, name, &__key);  \
+		__result = v4l2_subdev_call(sd, o, f, state, ##args); \
+		__v4l2_subdev_state_free(state);                      \
+		__result;                                             \
+	})
+
  /**
   * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
   *


  Tomi

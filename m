Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83B46671E50
	for <lists+linux-media@lfdr.de>; Wed, 18 Jan 2023 14:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjARNps (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Jan 2023 08:45:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbjARNot (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Jan 2023 08:44:49 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3E95CFC3
        for <linux-media@vger.kernel.org>; Wed, 18 Jan 2023 05:14:57 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id hw16so71287375ejc.10
        for <linux-media@vger.kernel.org>; Wed, 18 Jan 2023 05:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APR1ha59nofDize9q7hjldRkHtJo+NZyPHlIMsvURuA=;
        b=RJcAmtjV4lwkIBc+memDOEr7u0252fLDmtqFnEjv+NcjvC/iEap5bJ14kBuZotQHFy
         eXtSWRvoHgnx4QZlaahtwUEKfZro3e5lHsqgXvRb7nLXOjlxtQfpm87S7YTSlwCZ2e7X
         jDPBpJTrtvFqih3bx+TpUrGpFhENoHDN+gR38Ep/VFcx5UgxCnnHpdRlZottj7IT1kUT
         E808vwowEcI9XBlnsm3yhru6tY1neTmPNT0AAHx35MwwKj5prgBLngb0z89298jqAJb4
         07CegGHyeQ5ltzgKE1N+b0xtpZ+Ah1ZV/WbRWOsfNjo0Swu+67CSVFRu5eDM/REx1paL
         +MWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APR1ha59nofDize9q7hjldRkHtJo+NZyPHlIMsvURuA=;
        b=tz8wzUQ0pnrN9phYk+SI3yL7Y39ABiAV5T8jT9kzOamnM1W1eOGwtYtPFh7kA6PIGq
         Km1AbXsf28YXe8CwKr4TrrHgJGRlT7d/O9yp4fzNIjgTQXXMyXDfH/6BaVVw+NciDdvk
         hZ6TLYKCDpwpdsJg2NHpmkW4G0Z8f1NTAVoPe7oETvnLh/bc+dQU44y9JbJ8pDCZ3mzi
         k5RZCbAGvwQTW0bbdfSRmQY+tcSLhuXcPO0YI+qXuioabC4VP0zLLHrGtsiy7gvhFLwt
         FhkfPXCOahSX56cYsUNqMAGoIeylFflkB30FaH+ftxC1Y8RnPOmlqW7Qps29VJbSE2OE
         npRQ==
X-Gm-Message-State: AFqh2koT3QY+KZN0XXetier9G/9sgB2jJ6hVWKVtg3u/3lxYz+jVtFQw
        K4njBBNW3vqfLkSbszETSBg=
X-Google-Smtp-Source: AMrXdXuWLyzfODXTRNwgSORUm7u9SAYogvpWsDL9nZnTCkGdYimRSDyPHUmsuVyBR8j/84j7jy5zsQ==
X-Received: by 2002:a17:906:c008:b0:859:1d78:765 with SMTP id e8-20020a170906c00800b008591d780765mr3049787ejz.11.1674047695796;
        Wed, 18 Jan 2023 05:14:55 -0800 (PST)
Received: from [10.0.0.215] (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id vc10-20020a170907d08a00b008717a377125sm3344254ejc.85.2023.01.18.05.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:14:55 -0800 (PST)
Message-ID: <d45fa085-ce6f-2141-fba9-ac4e6094ef2a@gmail.com>
Date:   Wed, 18 Jan 2023 14:14:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] media: v4l2-async: fix binding async subdevs with
 multiple source ports
Content-Language: en-US
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        francesco.dolcini@toradex.com, marcel.ziswiler@toradex.com
References: <20220810104848.846783-1-p.zabel@pengutronix.de>
 <Y8afrhfjw+EhAH4o@paasikivi.fi.intel.com>
 <Y8aivWrN6Hg/O7Wr@pendragon.ideasonboard.com>
From:   Aishwarya Kothari <aishwaryakothari75@gmail.com>
In-Reply-To: <Y8aivWrN6Hg/O7Wr@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 17.01.23 14:29, Laurent Pinchart wrote:
> On Tue, Jan 17, 2023 at 01:16:30PM +0000, Sakari Ailus wrote:
>> Hi Philipp,
>>
>> On Wed, Aug 10, 2022 at 12:48:48PM +0200, Philipp Zabel wrote:
>>> Asynchronous subdevice probing on imx-media with imx6-mipi-csi2 is
>>> broken since commit 1f391df44607 ("media: v4l2-async: Use endpoints in
>>> __v4l2_async_nf_add_fwnode_remote()").
>>>
>>> This is a side effect of imx6-mipi-csi2 having a single subdevice with
>>> four separate source ports connected to different subdevices. Before,
>>> the imx-media-csi and video-mux devices registered async sub-devices
>>> via device fwnode that matched the imx6-mipi-csi2 device on their
>>> respective notifiers. This caused the first asd to be put on the
>>> notifier waiting list, and the other three to return -EEXIST and be
>>> ignored.
>>>
>>> With async subdev registration via endpoint fwnode, all four asds are
>>> distinct and three of them keep dangling on their notifiers after the
>>> first one is bound.
>>>
>>> This patch modifies __v4l2_async_nf_has_async_subdev() to consider
>>> asds matching different fwnode endpoints of the same sub-device equal
>>> if the latter is already bound and matches via device fwnode. Further,
>>> v4l2_async_register_subdev() is modified to remove dangling duplicate
>>> asds that were registered before the sub-device was available to check
>>> its fwnode.
>>>
>>> Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
>>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> ---
>>>   drivers/media/v4l2-core/v4l2-async.c | 43 ++++++++++++++++++++++++++++
>>>   1 file changed, 43 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>>> index 2f1b718a9189..b24220ed7077 100644
>>> --- a/drivers/media/v4l2-core/v4l2-async.c
>>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>>> @@ -452,6 +452,22 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
>>>   
>>>   		if (asd_equal(asd, sd->asd))
>>>   			return true;
>>> +
>>> +		/*
>>> +		 * If the asd matches an endpoint fwnode, handle sub-devices
>>> +		 * with device fwnode that were already matched by another asd
>>> +		 * with a different endpoint fwnode on the same device.
>>> +		 */
>>> +		if (asd->match_type == V4L2_ASYNC_MATCH_FWNODE &&
>>> +		    fwnode_graph_is_endpoint(asd->match.fwnode) &&
>>> +		    sd->fwnode && !fwnode_graph_is_endpoint(sd->fwnode)) {
>>> +			struct fwnode_handle *devnode;
>>> +
>>> +			devnode = fwnode_graph_get_port_parent(asd->match.fwnode);
>>> +			fwnode_handle_put(devnode);
>>> +			if (devnode == sd->fwnode)
>>> +				return true;
>>> +		}
>>>   	}
>>>   
>>>   	return false;
>>> @@ -749,6 +765,24 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
>>>   }
>>>   EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_i2c);
>>>   
>>> +static void v4l2_async_remove_duplicate_matches(struct v4l2_subdev *sd)
>>> +{
>>> +	struct v4l2_async_notifier *notifier;
>>> +
>>> +	lockdep_assert_held(&list_lock);
>>> +
>>> +	list_for_each_entry(notifier, &notifier_list, list) {
>>> +		struct v4l2_async_subdev *asd;
>>> +
>>> +		asd = v4l2_async_find_match(notifier, sd);
>>> +		if (!asd)
>>> +			continue;
>>> +
>>> +		/* Remove from the waiting list */
>>> +		list_del(&asd->list);
>>
>> This leaves asd->list pointers dangling.
>>
>>> +	}
>>> +}
>>> +
>>>   int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>>>   {
>>>   	struct v4l2_async_notifier *subdev_notifier;
>>> @@ -783,6 +817,15 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>>>   		if (ret)
>>>   			goto err_unbind;
>>>   
>>> +		/*
>>> +		 * At this point the asd is removed from the notifier wait list.
>>> +		 * There might be other notifiers with asds matching different
>>> +		 * fwnode endpoints of the same sd remaining. If the sd matches
>>> +		 * by device fwnode, remove the dangling asds.
>>> +		 */
>>> +		if (sd->fwnode && !fwnode_graph_is_endpoint(sd->fwnode))
>>> +			v4l2_async_remove_duplicate_matches(sd);
>>> +
>>>   		ret = v4l2_async_nf_try_complete(notifier);
>>>   		if (ret)
>>>   			goto err_unbind;
>>
>> This patch is essentially a workaround, not a fix.
>>
>> The root of the problem is that registering async sub-devices (and thus
>> registering a sub-device later) and link creation (via bound callback) are
>> handled together.
> 
> I'm not sure to see how that's related to the problem at hand. The issue
> here is that there are four consumers for one subdevice, and the
> v4l2-async framework doesn't support that. Two of those consumers could
> be made to know about each other, but the other two (video-mux) are
> modelled completely independently. That doesn't seem tied to link
> creation to me.
> 
>> They should be separated instead, at least in the
>> v4l2-async framework if not in the interfaces. We could at least have a
>> helper doing the both using existing API for devices that have a single
>> source pad.
>>
>> While merging this might not break anything as such, it would certainly
>> make fixing the underlying problem later on much harder as you'd need to
>> take drivers depending on it into account --- for which I, for instance,
>> don't have hardware for.
>>
>> I'm thus not overly enthusiastic of the idea of merging this.
> 

I stumbled over the commit 1f391df44607 ("media: v4l2-async: Use 
endpoints in __v4l2_async_nf_add_fwnode_remote()") and started this 
discussion : 
https://lore.kernel.org/linux-media/Y8AIRPd4RFYmssal@valkosipuli.retiisi.eu/ 

I applied this patch on top of the commit c1649ec55708.The hardware used 
is Apalis iMX6 (i.MX 6Q) with ov5640 mipi-csi2 camera.

The /dev/media0 is created and pipeline was configured using below script :
root@apalis-imx6-10774951:~# cat ov5640.sh
media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
# Configure pads
media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"

But it gives the following error when trying to set up the pipeline:

[   37.211276] ipu1_csi1: entity ov5640 1-003c does not implement 
get_mbus_config()
[   37.218872] ipu1_csi1: failed to get upstream media bus configuration

When adding the missing functionality as follows:

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index e0f908af581b..618c677ec89b 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3733,6 +3733,17 @@ static int ov5640_init_cfg(struct v4l2_subdev *sd,
         return 0;
  }

+static int ov5640_get_mbus_config(struct v4l2_subdev *sd,
+                                  unsigned int pad,
+                                  struct v4l2_mbus_config *cfg)
+{
+       cfg->type = V4L2_MBUS_CSI2_DPHY;
+       cfg->bus.mipi_csi2.num_data_lanes = 1;
+       cfg->bus.mipi_csi2.flags = 0;
+
+       return 0;
+}
+
  static const struct v4l2_subdev_core_ops ov5640_core_ops = {
         .log_status = v4l2_ctrl_subdev_log_status,
         .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
@@ -3753,6 +3764,7 @@ static const struct v4l2_subdev_pad_ops 
ov5640_pad_ops = {
         .get_selection = ov5640_get_selection,
         .enum_frame_size = ov5640_enum_frame_size,
         .enum_frame_interval = ov5640_enum_frame_interval,
+       .get_mbus_config = ov5640_get_mbus_config,
  };

  static const struct v4l2_subdev_ops ov5640_subdev_ops = {

The script was executed correctly without any errors and the links were 
created. Now when running the Gstreamer it gives the below output :

root@apalis-imx6-10774951:~# gst-launch-1.0 v4l2src device='/dev/video3' 
! videoconvert ! waylandsink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
[  192.526110] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor 
driver bug, expect capture failures.
[  192.535550] imx6-mipi-csi2: phy_state = 0x00000200
[  192.833456] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
[  195.147977] ipu1_csi1: EOF timeout
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Could 
not read from resource.
Additional debug info:
../gst-plugins-good-1.20.3/sys/v4l2/gstv4l2bufferpool.c(1181): 
gst_v4l2_buffer_pool_poll (): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
poll error 1: Invalid argument (22)
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed 
to allocate a buffer
Execution ended after 0:00:03.269527404
Additional debug info:
../gst-plugins-good-1.20.3/sys/v4l2/gstv4l2src.c(1146): 
gst_v4l2src_create (): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0
Setting pipeline to NULL ...
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Internal 
data stream error.
Additional debug info:
../gstreamer-1.20.3/libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop 
(): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason error (-5)
[  197.228051] ipu1_csi1: wait last EOF timeout
Freeing pipeline ...

While going through the dmesg kernel logs I found this :

     4.333202] imx6-mipi-csi2 21dc000.mipi: Consider updating driver 
imx6-mipi-csi2 to match on endpoints
[    4.347001] imx6-mipi-csi2 21dc000.mipi: Consider updating driver 
imx6-mipi-csi2 to match on endpoints
[    5.173588] video-mux 20e0000.iomuxc-gpr:ipu2_csi1_mux: Consider 
updating driver video-mux to match on endpoints

Any idea why this would fail?

Kind regards,
Aishwarya

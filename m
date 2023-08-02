Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91AF676C902
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbjHBJJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232621AbjHBJJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:09:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C132273B
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:09:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F7232AC;
        Wed,  2 Aug 2023 11:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690967294;
        bh=wZigPow+2ktJvw97i+PrJ/DrtOm0rYwPZNcmXAOc0t4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QWwxl2Rst0MQxLIXAxsZgNZQ7SzdSLWz1Zjld6aoNSUj+ueEPln/X8ZkYFkTvXA9i
         DW12biYcQ6lrspGTUwyip5a8dN99qI/hOVfR4QobZmiduNoSmTSFD7mR31dQFN8e7Y
         PIPAj7cYHXzbXUsGsI4Rd5mEgkVnMK57TrRjPS2Y=
Date:   Wed, 2 Aug 2023 12:09:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: NULL pointer dereference in imx-mipi-csis driver when starting
 stream
Message-ID: <20230802090923.GA29611@pendragon.ideasonboard.com>
References: <7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de>
 <d2fc1a0d-d058-757e-f935-1b91cfd19749@kontron.de>
 <Y+zKibHcez8or6nS@pendragon.ideasonboard.com>
 <d797611e-8e07-402f-ec75-7a1eadbc2122@kontron.de>
 <dfdd11f6-8692-1bec-2a7c-1d890039cfe7@kontron.de>
 <edddba07-c5c3-bab4-ca0c-49e1a5dc1135@kontron.de>
 <Y+0iMyLnHmqdDJOk@pendragon.ideasonboard.com>
 <8529dd84-3670-052e-8222-0b5d2c860f4b@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8529dd84-3670-052e-8222-0b5d2c860f4b@kontron.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

(CC'ing Sakari to make him aware of the issue)

On Wed, Aug 02, 2023 at 09:37:20AM +0200, Frieder Schrempf wrote:
> On 15.02.23 19:19, Laurent Pinchart wrote:
> > On Wed, Feb 15, 2023 at 04:30:49PM +0100, Frieder Schrempf wrote:
> >> On 15.02.23 15:40, Frieder Schrempf wrote:
> >>> On 15.02.23 15:20, Frieder Schrempf wrote:
> >>>> On 15.02.23 13:05, Laurent Pinchart wrote:
> >>>>> On Wed, Feb 15, 2023 at 12:53:56PM +0100, Frieder Schrempf wrote:
> >>>>>> On 14.02.23 17:47, Frieder Schrempf wrote:
> >>>>>>> Hi everyone,
> >>>>>>>
> >>>>>>> after solving the previous devicetree and driver issues with the media
> >>>>>>> pipeline on i.MX8MM using a RPi v2.1 camera module (imx219) as sensor, I
> >>>>>>> now try to get an image from the sensor and run into the next problem.
> >>>>>>>
> >>>>>>> Below you can find the commands I use and the output I'm getting. Maybe
> >>>>>>> someone can see straight away what's wrong or at least can make a guess
> >>>>>>> before I start diving into the code. ;)
> >>>>>>>
> >>>>>>> By the way: This happens on v6.1.11 and 6.2-rc8.
> >>>>>>
> >>>>>> So it looks like there are several problems (again):
> >>>>>>
> >>>>>> First I missed to enable the link between the imx219 and the imx-mipi-csis:
> >>>>>>
> >>>>>> media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
> >>>>>>
> >>>>>> And the imx-mipi-csis driver is missing a check for the missing source
> >>>>>> link which caused the exception. I currently have this applied and will
> >>>>>> send this as formal patch later:
> >>>>>>
> >>>>>> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> >>>>>> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> >>>>>> @@ -596,6 +596,11 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> >>>>>>         s64 link_freq;
> >>>>>>         u32 lane_rate;
> >>>>>>
> >>>>>> +       if (!csis->src_sd) {
> >>>>>> +               dev_err(csis->dev, "Missing source link\n");
> >>>>>> +               return -EINVAL;
> >>>>>> +       }
> >>>>>> +
> >>>>>>         /* Calculate the line rate from the pixel rate. */
> >>>>>>         link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
> >>>>>>                                        csis_fmt->width,
> >>>>>
> >>>>> The pipeline is not correctly configured, and that should have been
> >>>>> caught earlier as both pads are created with the
> >>>>> MEDIA_PAD_FL_MUST_CONNECT flag. The __media_pipeline_start() function
> >>>>> should have return an error. Could you try to check why that didn't
> >>>>> happen ?
> >>>>
> >>>> Thanks for the pointer. I looked at __media_pipeline_start() and to me
> >>>> it looks like there's something wrong. During validation of the links,
> >>>> there is no code to handle the case where all links are skipped before
> >>>> link_validate() is called on them. The loop is left with has_link = true
> >>>> and has_enabled_link = true and validation of the pipeline succeeds even
> >>>> though there is a missing link.
> >>>>
> >>>> Does this look like a valid fix to you:
> >>>>
> >>>> --- a/drivers/media/mc/mc-entity.c
> >>>> +++ b/drivers/media/mc/mc-entity.c
> >>>> @@ -744,6 +744,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> >>>>                 struct media_pad *pad = ppad->pad;
> >>>>                 struct media_entity *entity = pad->entity;
> >>>>                 bool has_enabled_link = false;
> >>>> +               bool has_valid_link = false;
> >>>>                 bool has_link = false;
> >>>>                 struct media_link *link;
> >>>>
> >>>> @@ -806,6 +807,15 @@ __must_check int __media_pipeline_start(struct
> >>>> media_pad *pad,
> >>>>                                 link->source->index,
> >>>>                                 link->sink->entity->name,
> >>>>                                 link->sink->index);
> >>>> +
> >>>> +                       has_valid_link = true;
> >>>> +                       break;
> >>>> +               }
> >>>> +
> >>>> +               if (!has_valid_link) {
> >>>> +                       dev_dbg(mdev->dev, "No valid link found");
> >>>> +                       ret = -ENOLINK;
> >>>> +                       goto error;
> >>>>                 }
> >>>
> >>> On second thought, I see that this is probably not a correct fix. But I
> >>> still think the current code has a flaw. Or maybe I'm missing something
> >>> important again. ;)
> >>
> >> Looks like the pipeline validation is only run for the pads of the links
> >> that are enabled. As the following output shows, the pad
> >> 'csis-32e30000.mipi-csi':0 is not part of the pipeline and the link
> >> 'csis-32e30000.mipi-csi':0 -> 'imx219 1-0010':0 is therefore not part of
> >> the validation in __media_pipeline_start().
> >>
> >> [   36.069274] imx7-csi 32e20000.csi: media pipeline populated, found pads:
> >> [   36.080901] imx7-csi 32e20000.csi: - 'csi capture':0
> >> [   36.085926] imx7-csi 32e20000.csi: - 'csi':1
> >> [   36.090222] imx7-csi 32e20000.csi: - 'csi':0
> >> [   36.094524] imx7-csi 32e20000.csi: - 'csis-32e30000.mipi-csi':1
> >>
> >> So the first time the disabled link is detected is in the driver in
> >> mipi_csis_calculate_params() which leads to the crash.
> > 
> > Of course ! That's what I was missing. Indeed, we have an issue there.
> > I'll try to cook up a patch.
> 
> Sorry for digging out this old thread. I just wanted to ask if you
> managed to come up with a fix for the issue above?
> 
> Maybe it's already there and I just missed it?

Thanks for the ping, this had fallen through the cracks. I'll try to get
back to it this week. I would like __media_pipeline_start() should catch
the issue.

> If I remember correctly it's only about handling a misconfigured
> pipeline so it won't be triggered if things are done properly.
> 
> But as I've managed to trigger it, someone in the future might too and
> it would be nice to make the framework more robust against this.

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE81775A892
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 10:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbjGTIDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 04:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbjGTIDA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 04:03:00 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7F32686
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 01:02:58 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36K3uNai002348;
        Thu, 20 Jul 2023 10:02:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=selector1;
 bh=TrQ0O1gOjvRy/PlAbpeCT5+pbebkWKSBC1DZ+QmBVew=;
 b=7O0wKkGj08/13tAf95V/36YXz+AzmMzAzuoDZ2Y2kSwvkqQZg0Vatrxu2kpnu/O+mOLv
 42eip1lOkIM0XocLTfNN1T0ic9shYAyvqWiOUexCGpChGZqU/bX74I7jaPcJTUYl/t/r
 epLg6dFRD1V28YuENvubScRwgzRyv7GCoQxZub75/qEO2Mli/PqSKxE2Xz3VUCE3uvtM
 IXDv1dbPtCn6pbiUVMJ6c5T/687sptBVzynzfvwQVXpcMC03Ly4Go5bD60U1OCuZHRS4
 zhLkEn63HN7piQ7XMQ6Imlqe3JEV0LK/EnJEqDtoBXaYgiLWQNR4brjVqFUByfZVHqXz Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rxwf6sjye-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Jul 2023 10:02:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A54E10003D;
        Thu, 20 Jul 2023 10:02:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 216B0215145;
        Thu, 20 Jul 2023 10:02:39 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 20 Jul
 2023 10:02:38 +0200
Date:   Thu, 20 Jul 2023 10:02:29 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: ov5640: fix vblank unchange issue when work at
 dvp mode
Message-ID: <20230720080229.GA1077263@gnbcxd0016.gnb.st.com>
Mail-Followup-To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
References: <20230719073012.3739998-1-guoniu.zhou@oss.nxp.com>
 <20230719114530.GA1066391@gnbcxd0016.gnb.st.com>
 <AS8PR04MB9080C023F628B0C2A1AB40B1FA3EA@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB9080C023F628B0C2A1AB40B1FA3EA@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_02,2023-07-19_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

On Thu, Jul 20, 2023 at 03:27:20AM +0000, G.N. Zhou (OSS) wrote:
> Hi Alain,
> 
> > -----Original Message-----
> > From: Alain Volmat <alain.volmat@foss.st.com>
> > Sent: 2023年7月19日 19:46
> > To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> > Cc: linux-media@vger.kernel.org; mchehab@kernel.org;
> > slongerbeam@gmail.com; sakari.ailus@linux.intel.com;
> > jacopo.mondi@ideasonboard.com; laurent.pinchart@ideasonboard.com
> > Subject: Re: [PATCH] media: ov5640: fix vblank unchange issue when work at
> > dvp mode
> > 
> > Caution: This is an external email. Please take care when clicking links or opening
> > attachments. When in doubt, report the message using the 'Report this email'
> > button
> > 
> > 
> > Hi Guoniu,
> > 
> > I came up to the same conclusion about wrong vblank when trying to make the
> > OV5640 work in DVP mode so I agree about this modification.
> > 
> > However I think other ctrls also have the same issue, at least exposure.  I am
> > wondering if we should keep the splitted code as currently and add back the
> > missing ctrl in the DVP mode path or rework code to apply ctrl in both modes ?
> > Basically link_freq / pixelrate handling differ between DVP and MIPI but it should
> > be same handling for other ctrls I think.
> 
> As you know, the patch is for VBLANK control added in " bce93b827de6 ("media: ov5640: Add VBLANK control")" and I prefer and follow "one patch do one thing" rule.

The exposure control has to be updated following a VBLANK update.
This is explained in the commit you are fixing.  So
I think that your fix should not only add the update of the vblank
but also update the exposure value.  You can have a look at the
commit bce93b827de6 ("media: ov5640: Add VBLANK control") especially the
update part in the ov5640_update_pixel_rate function.

While it might not be the most beautiful way to do it, probably a simple
goto and a label could also do the trick.

        if (!ov5640_is_csi2(sensor)) {
                __v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
                                         ov5640_calc_pixel_rate(sensor));

		goto update_ctrls;
        }

(...)

update_ctrls:
        vblank = timings->vblank_def;
        __v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
                                 OV5640_MAX_VTS - mode->height, 1, vblank);
        __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);

        exposure_max = timings->crop.height + vblank - 4;
        exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
                               sensor->ctrls.exposure->minimum,
                               exposure_max);

(...)

Regards,
Alain

> 
> > 
> > Regards,
> > Alain
> > 
> > On Wed, Jul 19, 2023 at 03:30:12PM +0800, guoniu.zhou@oss.nxp.com wrote:
> > > From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> > >
> > > The value of V4L2_CID_VBLANK control is initialized to default vblank
> > > value of 640x480 when driver probe. When OV5640 work at DVP mode, the
> > > control value won't update and lead to sensor can't output data if the
> > > resolution remain the same as last time since incorrect total vertical
> > > size. So update it when there is a new value applied.
> > >
> > > Fixes: bce93b827de6 ("media: ov5640: Add VBLANK control")
> > > Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 19 ++++++++++++++-----
> > >  1 file changed, 14 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index 36b509714c8c..2f742f5f95fd 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -2854,12 +2854,22 @@ static int ov5640_try_fmt_internal(struct
> > v4l2_subdev *sd,
> > >       return 0;
> > >  }
> > >
> > > +static void __v4l2_ctrl_vblank_update(struct ov5640_dev *sensor, u32
> > > +vblank) {
> > > +     const struct ov5640_mode_info *mode = sensor->current_mode;
> > > +
> > > +     __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> > OV5640_MIN_VBLANK,
> > > +                              OV5640_MAX_VTS - mode->height, 1,
> > > + vblank);
> > > +
> > > +     __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank); }
> > > +
> > >  static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)  {
> > >       const struct ov5640_mode_info *mode = sensor->current_mode;
> > >       enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
> > >       struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
> > > -     const struct ov5640_timings *timings;
> > > +     const struct ov5640_timings *timings = ov5640_timings(sensor,
> > > + mode);
> > >       s32 exposure_val, exposure_max;
> > >       unsigned int hblank;
> > >       unsigned int i = 0;
> > > @@ -2878,6 +2888,8 @@ static int ov5640_update_pixel_rate(struct
> > ov5640_dev *sensor)
> > >               __v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > >
> > > ov5640_calc_pixel_rate(sensor));
> > >
> > > +             __v4l2_ctrl_vblank_update(sensor, timings->vblank_def);
> > > +
> > >               return 0;
> > >       }
> > >
> > > @@ -2920,15 +2932,12 @@ static int ov5640_update_pixel_rate(struct
> > ov5640_dev *sensor)
> > >       __v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
> > >       __v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
> > >
> > > -     timings = ov5640_timings(sensor, mode);
> > >       hblank = timings->htot - mode->width;
> > >       __v4l2_ctrl_modify_range(sensor->ctrls.hblank,
> > >                                hblank, hblank, 1, hblank);
> > >
> > >       vblank = timings->vblank_def;
> > > -     __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> > OV5640_MIN_VBLANK,
> > > -                              OV5640_MAX_VTS - mode->height, 1,
> > vblank);
> > > -     __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);
> > > +     __v4l2_ctrl_vblank_update(sensor, vblank);
> > >
> > >       exposure_max = timings->crop.height + vblank - 4;
> > >       exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
> > > --
> > > 2.37.1
> > >

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35962EADDB
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbhAEPCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbhAEPCO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:02:14 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B37C061574
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 07:01:34 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id y23so3356054wmi.1
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 07:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=szPb1PPdBsy3wxxQBSrVW4kwBUPiKSvNKTGdrdA/adc=;
        b=FkeY8PN9xN8l67b1Ab1h5g7dTWZ5MU+31jxQkX5ikaRgRxzavFlDing0l+gCu4TwLL
         hJ7je7mOvw088Iy3/nW37SZcSFp7bEkRXcpMMeaaG0MS9TUCaYIoa5gVzcytcBzWDLP4
         m2ufPPFCBEruXCrkovA1ii4uJE/mxEmN2cwEbSKHinq4j2xz9ByCCUq34pAT3wpLluMu
         ubSsFWDpFxMqz1UM1wKnSO6sVre+wZ/SXmQaR1wKaA/Iv/sgLCeOvC5IzMwzxLWNlxCp
         hAf2J2nZqZPewaPMOuBZAfshtZFLD5w1sf3T0A6nPfzK9voLCHo6sdbzTX7KNaVzlxtg
         F1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=szPb1PPdBsy3wxxQBSrVW4kwBUPiKSvNKTGdrdA/adc=;
        b=gaxFTGFaqN4YOoH7t3hW5VC92Lav8bcf5/3UixqcOKKJQbJ7q9jIdGlh0EbigIMCRg
         6JK3nDZUFbkDqIdE7BLs9+2hzlWkoMFZ76XAAk32lby53FGkNIP2umBa/KGCRk5ix2bw
         N8LiYNB05/P23o5NI0gjhpc1YJOZx2HeawPlINX6BVo6FvLLr6sx5n2FUXT4Bbq6uStY
         J/2VGOim9A1yipCxVgrPtvmxrRb2jgWSEtEbOd2LvnPUQGw98OywCc7AQEWel96bC0zS
         mWsRZMPY761uzZsopBuq/4hYrSedQ6ST5ezaI/AgXC7yTh2xizKeUos+MSzTm19pYx4S
         Ax8g==
X-Gm-Message-State: AOAM530jILwFJ39kgIx5TwWdUAOI13scI+6w6qHVqejZP3/HvSu+oKtc
        rIZajbPEDdjqCqfng4SSPDM=
X-Google-Smtp-Source: ABdhPJxDwxIJUzKoQi8tqXLfWAgLy5IxuGJDQHwogH/CjgnY88C8vmd+Jh2UHaGrEZYXsm29o0Nc3g==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr3928529wmj.115.1609858893060;
        Tue, 05 Jan 2021 07:01:33 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z8sm4297980wmg.17.2021.01.05.07.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 07:01:31 -0800 (PST)
Date:   Tue, 5 Jan 2021 15:01:29 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Julien Boibessot <julien.boibessot@armadeus.com>
Subject: Re: imx6ull capture from OV5640
Message-ID: <20210105150129.fresebmib75htyl5@arch-thunder.localdomain>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com>
 <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
 <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
 <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com>
 <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
 <CAOMZO5BkbB7KHP3pz1SLgD1Vth-BcZAEuxsaSQJ83Y6O=DDPdg@mail.gmail.com>
 <CAOMZO5D1Lk6evyRZ08erQ3DaVgSHubGjGbK8dcKao=NS+m-PUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5D1Lk6evyRZ08erQ3DaVgSHubGjGbK8dcKao=NS+m-PUA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,
On Tue, Jan 05, 2021 at 11:32:29AM -0300, Fabio Estevam wrote:
> On Tue, Jan 5, 2021 at 10:45 AM Fabio Estevam <festevam@gmail.com> wrote:
> 
> > Just tested against next-20210105 and the original warning happens and
> > csi is no longer probed.
> >
> > I am using the same dtb that worked on 5.4.84.
> >
> > It looks like we have a regression.
> 
> And here is a fix that allows csi to probe:
> https://pastebin.com/raw/g6ijDf2N
> 
> Makes sense?

yup.

> 
> There is another error though: I do not see the message below as seen
> on 5.4 kernel:
> [   10.690711] imx-media: ov5640 1-003c:0 -> csi:0
> 
> And the same pipeline that worked with 5.4 does not work with linux-next:
> 
> # media-ctl -l "'ov5640 1-003c':0 -> 'csi':0[1]"
> media-ctl -l "'csi':1 -> 'csi capture':0[1]"
> media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_2X8/320x240 field:none]"
> 
> # gst-launch-1.0 -v  v4l2src device=/dev/video1 ! v4l2convert ! fbdevsink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
> video/x-raw, format=(string)UYVY, width=(int)320, height=(int)240,
> framerate=(fraction)30000/1001, interlace-mode=(string)progressive,
> colorim
> etry=(string)1:4:7:1
> /GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:src: caps =
> video/x-raw, format=(string)BGRx, width=(int)320, height=(int)240,
> framerate=(fraction)30000/1001, interlace-mode=(string)progressive
> /GstPipeline:pipeline0/GstFBDEVSink:fbdevsink0.GstPad:sink: caps =
> video/[  421.495561] alloc_contig_range: [9c480, 9c4a6) PFNs busy
> x-raw, format=(string)BGRx, width=(int)320, height=(int)240, fra[
> 421.504399] alloc_contig_range: [9c480, 9c4a6) PFNs busy
> merate=(fraction)30000/1001, interlace-mode=(string)progressive
> /GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:sink: c[
> 421.520989] alloc_contig_range: [9c480, 9c4a6) PFNs busy
> aps = video/x-raw, format=(string)UYVY, width=(int)320, height=([
> 421.533523] csi: pipeline start failed with -19
> int)240, framerate=(fraction)30000/1001,
> interlace-mode=(string)progressive, colorimetry=(string)1:4:7:1
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> to allocate required memory.
> Additional debug info:
> ../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Buffer pool activation failed
> Execution ended after 0:00:00.106613417
> Setting pipeline to NULL ...
> Freeing pipeline ...
> #
> 
> Any ideas?

can you see if the following patch make it work again?


8<----------------------------------------------------

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a3f3df901704..fa8db9f1cfc8 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -499,6 +499,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
                                      struct v4l2_subdev_format *sink_fmt)
 {
        struct imx7_csi *csi = v4l2_get_subdevdata(sd);
+       struct media_entity *src;
        struct media_pad *pad;
        int ret;
 
@@ -509,11 +510,21 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
        if (!csi->src_sd)
                return -EPIPE;
 
+       src = &csi->src_sd->entity;
+
+       /*
+        * if the source is neither a mux or csi2 get the one directly upstream
+        * from this csi
+        */
+       if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
+           src->function != MEDIA_ENT_F_VID_MUX)
+               src = &csi->sd.entity;
+
        /*
         * find the entity that is selected by the CSI mux. This is needed
         * to distinguish between a parallel or CSI-2 pipeline.
         */
-       pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
+       pad = imx_media_pipeline_pad(src, 0, 0, true);
        if (!pad)
                return -ENODEV;

> 
> Thanks

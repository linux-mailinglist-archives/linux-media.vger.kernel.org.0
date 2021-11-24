Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560E945C821
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 15:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349769AbhKXPAy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 10:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234995AbhKXPAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 10:00:50 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742C2C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 06:57:40 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id a11so3030492qkh.13
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 06:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LU9BEnULj3JGjgT+LMe5HzdnuJsg4eZNYUMoalr+NiQ=;
        b=aRDviT3wLR3bO1bGkiAK8+cBs71ouZCKV9RXLFc3z3hheI3oGMfzrkzO3oZkD0Q8u+
         x5wK8nYqKbMC0QeDgtihIRnfGIxD/3TEEHCPm/WUHBABCxU/4NCRm20SuyAAL9qnbmax
         83+xae7zGiUuv34KnjzMGGU34FWzved74YBmUiw2ZyTe7CwoKalO10BnnvlQi9+u360W
         OvhOsgp+YmaXyCpsIALXD++nMhaBz5kCRzxZqvPdkUaqI8aDy/VdnKR+7QegkL+8taVI
         u5/mzjiAy8xrxjTi5zJOJpZ31/MAc+2yC0E8RPDnQUOUcLJX9RRn0vQbFjuNqLRwdMrk
         3J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LU9BEnULj3JGjgT+LMe5HzdnuJsg4eZNYUMoalr+NiQ=;
        b=QMiKRtg6crRv3V3ndUryzzpauF4Hg8Q4V5qQiqwnFn6rYMBPxHYbGazmJLXu0sxoWL
         Ccf+ff5/ovd+F1ies9DxtFvDMPMlM9foaevnx/DrKqDOdvLyT0y8zoUvyGLGafIZRWm1
         itIK8TuvdPyOcqB/DT8bhJfGi3G2U9EQWIqSCbCNrf6zY1B72C0UrK2NTQvQwTQePChz
         XgHNtDQOYl5gp60zuXcloT+n37iF6nXIB2cMHWye47ul/NzGkbudbf9fb8hho87J7t/d
         gXxqz3d0ggyESelFlyMtfUA8qdiTYsUY1aGLal7M/t/ch6jb0BU8Inzhc0eHwZCYFZKa
         9smg==
X-Gm-Message-State: AOAM533ghWay7H+eHCODFFC+d9ml9GtqMhYW972FRvR7dZtipVWNx1Z+
        8mkAoU8VKCySOR2VioxgWHPmhg==
X-Google-Smtp-Source: ABdhPJxBkKscTnspcy2eLh5Z9xgt5hPk+H9d84fbimsVeCf5siq/8P/fdeGFwDMww4ZUzt3DJm1q8A==
X-Received: by 2002:a37:4050:: with SMTP id n77mr6579024qka.267.1637765859635;
        Wed, 24 Nov 2021 06:57:39 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id h5sm8446705qkn.62.2021.11.24.06.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 06:57:39 -0800 (PST)
Message-ID: <9b7fd6802c89c5d3bb6a42b44f13a90f6c3caf22.camel@ndufresne.ca>
Subject: Re: [EXT] Re: [PATCH v12 00/13] amphion video decoder/encoder driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Wed, 24 Nov 2021 09:57:37 -0500
In-Reply-To: <AM6PR04MB6341BF1FB2A839961DBADF4EE7619@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
         <9947131322e034bb6336802e5afb4b6132ca5071.camel@ndufresne.ca>
         <AM6PR04MB6341BF1FB2A839961DBADF4EE7619@AM6PR04MB6341.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 24 novembre 2021 à 09:00 +0000, Ming Qian a écrit :
> > -----Original Message-----
> > From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> > Sent: Wednesday, November 24, 2021 3:23 AM
> > To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> > shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> > Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
> > dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> > linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: [EXT] Re: [PATCH v12 00/13] amphion video decoder/encoder driver
> > 
> > Caution: EXT Email
> > 
> > Hi Ming,
> > 
> > For the patchset:
> > 
> > Tested-By: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > 
> > I've validated encoding manually with GStreamer:
> > 
> >   gst-launch-1.0 videotestsrc num-buffers=100 ! v4l2h264enc !
> > video/x-h264,profile=main,level=\(string\)2 ! h264parse ! qtmux ! filesink
> > location=test.mov
> > 
> > I've also verify the that the number of frames was exactly 100, this is
> > common
> > issue with V4L2 encoders. Then I have validated VP8, H.264 and H.265
> > decoders
> > using fluster [0] with this PR [1] applied. You can find full summary at the
> > end
> > of this email. Markdown report didn't get generated, I will have to check
> > with
> > upstream fluster if there is a regression.
> > 
> > $> ./fluster.py run -s -so amphion-imx8qxp-conformance.md -d
> > GStreamer-VP8-V4L2-Gst1.0 GStreamer-H.264-V4L2-Gst1.0
> > GStreamer-H.265-V4L2-Gst1.0
> > 
> > VP8:   Ran 59/61 tests successfully               in 131.788 secs
> > H.264: Ran 75/135 tests successfully               in 501.206 secs
> > H.265: Ran 126/147 tests successfully               in 1131.933 secs
> > 
> > Note that in mainline, only 1 core get fired and is kept at its lowest
> > possible
> > frequency, so perhaps it may cause some of the timeout seen. The driver is
> > overall functional, and I would like to thank you for this extra work. Also,
> > note that this very first time I run Fluster over the stateful CODEC
> > wrappers. I
> > will need to run this on more platforms to locate the GStreamer specific
> > fail.
> > 
> > VP8 note, conformance vector vp80-03-segmentation-1425 cause a hang but it
> > then
> > recover:
> > 
> > [ 8264.851841] amphion-vpu-core 2d040000.vpu_core: [0] sync session
> > timeout
> > [ 8264.858634] amphion-vpu-core 2d040000.vpu_core: [0] send cmd(0x2) fail
> > [ 8264.867992] amphion-vpu-core 2d040000.vpu_core: [0] start fail
> > [ 8264.905173] amphion-vpu-core 2d040000.vpu_core: reset hang core
> > 
> 
> HI Nicolas
> 
>     There is a bug in firmware that if send a command to firmware too close
> after stop cmd,
> The firmware may enter wfi wrong, and led to hang issue you met in vp80-03-
> segmentation-1425.
> I'll add a workaround in driver that add a delay after send stop cmd to
> firmware in next version.
> 
>     Because the amphion's vpu doesn't support to output i420, so the test will
> convert nv12_8l128 to i420 by videoconvert, it leds to most of timeout
> failure.
> 
>     The FM1_BT_B.h264 can't be decoded by amphion's vpu, the vpu is keeping
> parse sequence header, and it led to timeout failure.
> 
>     I run the test and change the timeout to 300, then most of timeout
> failures are gone. Besides that, my result is almost as same as yours.

Oh my bad, I forgot about the short timeout, with a single core on top of all
this, that makes sense.

> 
>     The failures of assertion error means that the vpu's output is different
> from the pattern, I think it should be the vpu's limitation.

Most likely, best way to know is to keep the results (--keep) and visually look
at the result. My expectation with this is that we get decent results and that
none of the issue render the VPU or the system unusable. Each company is then
responsible for their CODEC conformance, specially with stateful, there is very
little that userspace will be responsible with. Though if you do find issue that
is clearly caused by GStreaner, let me know, I'll be more then happy to fix.
Most VPU providers will also buy proprietary conformance suite (like Allegro),
which covers much more then basic conformance.

> 
> > 
> > See comments about your GStreamer MR below...
> > 
> > [0]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> > com%2Ffluendo%2Ffluster&amp;data=04%7C01%7Cming.qian%40nxp.com%7
> > C45d33490bfe546aa8e1408d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c3
> > 01635%7C0%7C0%7C637732921809373007%7CUnknown%7CTWFpbGZsb3d
> > 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> > D%7C3000&amp;sdata=bBqADaZ9ZN00SbCPalQE5fN740hB2bMUxHDL4QEki
> > mg%3D&amp;reserved=0
> > [1]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> > com%2Ffluendo%2Ffluster%2Fpull%2F98&amp;data=04%7C01%7Cming.qian
> > %40nxp.com%7C45d33490bfe546aa8e1408d9aeb6a822%7C686ea1d3bc2b4c
> > 6fa92cd99c5c301635%7C0%7C0%7C637732921809382989%7CUnknown%7C
> > TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> > JXVCI6Mn0%3D%7C3000&amp;sdata=90dUC%2FNzK%2BcFNSMwY7bgQ0iD8
> > ctBwU%2FMhyrLoBBEf4g%3D&amp;reserved=0
> > 
> > 
> > [...]
> > > encoder is tested with gstreamer
> > > decoder is tested with gstreamer, but the following patches are required:
> > 
> > GStreamer is now a single repo (and using main branch instead of master), I
> > have
> > migrated your 3 MRs into 2 MRs.
> 
> Thank you very much.
> > 
> > > 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.fr
> > eedesktop.org%2Fgstreamer%2Fgst-plugins-base%2F-%2Fmerge_requests%2F
> > 1252&amp;data=04%7C01%7Cming.qian%40nxp.com%7C45d33490bfe546aa
> > 8e1408d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> > C637732921809382989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> > ta=G4PnqxRsnPjQtV%2FUcp4dkoz9fAGxkOv%2FzKR47RaHtu0%3D&amp;reser
> > ved=0
> > > 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.fr
> > eedesktop.org%2Fgstreamer%2Fgst-plugins-good%2F-%2Fmerge_requests%2F
> > 1098&amp;data=04%7C01%7Cming.qian%40nxp.com%7C45d33490bfe546aa
> > 8e1408d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> > C637732921809382989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> > ta=h6nEISAaiG54NPz9Xw0MiSNDx2QxWsNWyG7FLSAaLgI%3D&amp;reserved
> > =0
> > 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.fr
> > eedesktop.org%2Fgstreamer%2Fgstreamer%2F-%2Fmerge_requests%2F1379&
> > amp;data=04%7C01%7Cming.qian%40nxp.com%7C45d33490bfe546aa8e140
> > 8d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377
> > 32921809382989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> > CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=PFe
> > Db4v%2BmiksgvJ08KgncRjZEt7GdMO7gV8hV0DD0uY%3D&amp;reserved=0
> > 
> > > 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.fr
> > eedesktop.org%2Fgstreamer%2Fgst-plugins-good%2F-%2Fmerge_requests%2F
> > 1099&amp;data=04%7C01%7Cming.qian%40nxp.com%7C45d33490bfe546aa
> > 8e1408d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> > C637732921809382989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> > ta=e6hSDpiP2scLN5C0f8Fb%2FoMbt8k4zC45qWPrQpG%2Fe5A%3D&amp;rese
> > rved=0
> > 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.fr
> > eedesktop.org%2Fgstreamer%2Fgstreamer%2F-%2Fmerge_requests%2F1381&
> > amp;data=04%7C01%7Cming.qian%40nxp.com%7C45d33490bfe546aa8e140
> > 8d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377
> > 32921809382989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> > CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=xkX
> > WjCsgVaLb0wZgfaXDMiBchtbJBNnwtZNhKe42k5o%3D&amp;reserved=0
> > 
> > 
> > regards,
> > Nicolas
> > 
> > [JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) FM1_BT_B                 ...
> > Timeout
> The vpu can't decode this stream.
> 
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > AMP_D_Hisilicon_3               ... Timeout
> Performance issue of videoconvert
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > AMP_E_Hisilicon_3               ... Timeout
> Performance issue of videoconvert
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > AMP_F_Hisilicon_3               ... Timeout
> Performance issue of videoconvert
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > BUMPING_A_ericsson_1            ... Fail
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > CONFWIN_A_Sony_1                ... Fail
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > DELTAQP_A_BRCM_4                ... Timeout
> Performance issue of videoconvert
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > MVDL1ZERO_A_docomo_4            ... Timeout
> Performance issue of videoconvert
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > NoOutPrior_A_Qualcomm_1         ... Fail
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > NoOutPrior_B_Qualcomm_1         ... Fail
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > NUT_A_ericsson_5                ... Fail
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > PICSIZE_A_Bossen_1              ... Error
> The size is 1056x8440, vpu doesn't support it
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > PICSIZE_B_Bossen_1              ... Error
> The size is 8440x1056, vpu doesn't support it
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > PICSIZE_C_Bossen_1              ... Fail
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > PICSIZE_D_Bossen_1              ... Fail
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > RAP_B_Bossen_2                  ... Fail
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > SAODBLK_A_MainConcept_4         ... Timeout
> Performance issue of videoconvert
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > SAODBLK_B_MainConcept_4         ... Timeout
> Performance issue of videoconvert
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > TILES_A_Cisco_2                 ... Timeout
> Performance issue of videoconvert
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > TILES_B_Cisco_1                 ... Timeout
> Performance issue of videoconvert, but assert fail
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > TSUNEQBD_A_MAIN10_Technicolor_2 ... Fail
> > [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> > VPSSPSPPS_A_MainConcept_1       ... Error
> Gstream report error:
> ERROR Error from element
> /GstPlayBin:playbin/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/v4l2
> h265dec:v4l2h265dec0: Could not read from resource.
> Could not read from resource.
> ../sys/v4l2/gstv4l2bufferpool.c(1155): gst_v4l2_buffer_pool_poll ():
> /GstPlayBin:playbin/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/v4l2
> h265dec:v4l2h265dec0:
> poll error 1: Success (0) for /mnt/fluster/resources/JCT-VC-
> HEVC_V1/VPSSPSPPS_A_MainConcept_1/VPSSPSPPS_A_MainConcept_1.bin
>  
> > [VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0)
> > vp80-03-segmentation-1425 ... Timeout
> Firmware bug, after apply driver workaround, assert fail
> > [VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0)
> > vp80-03-segmentation-1436 ... Fail
> > 
> > 
> 


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC462E228A
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 23:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgLWWok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 17:44:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgLWWoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 17:44:39 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C796C061794
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 14:43:59 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id jx16so1141977ejb.10
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 14:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=IC/BRvMVba0ZDMpZtJOH0wMbvTVJGeOAL/bZW58vMcA=;
        b=SYZQYYtV412AZfVD2MRHfgv6xhAlrOgrDrFzUMf/5gS98xlvJUctWgiMC+gwdp7m25
         hAqqxlg31X74FkblVzfvoujQ/A6bbS+0mOJ+TVE1QxFTo84yOBp9/i6/D5XPfpuw8aX8
         KZnx0Kf5GEXxCThDgDjI3DbfCrjExstg7DDz2CsDOqwQdw/cOm/Qfmg+PIRRs7wjrJ0k
         UMq5cq97G3VmeKT8PXXwEwmNTRv5bo8zQC8eWTJisSVbnmOreoprksH4qDkxgp7MKEo6
         BeYkEITnqYa51Y8aovI2ZglcxfbCa8o2tg6ZDbFPjzZvb1fcM6qmYL7oO8AweZWYyMjW
         fRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IC/BRvMVba0ZDMpZtJOH0wMbvTVJGeOAL/bZW58vMcA=;
        b=QVKVimI8+FHUP5BIqZgYouvqdazHe0JwMEo0GlVdJO510CROWiedNlESZcuFznKTz5
         0I/AqqHBraRdeENcXD7MtvG9uQWI9njAKeZuQXPDkkwllDAtoDAChAf6R16S6fHAi/yi
         r1Iz/6mIh/kZQQEHWw6d+1bBYHIg3hsRYrDmipGb6dg9ia2qJCA6ZVZTTMFhqALLU/mb
         bR34K0BReWUxj62JxTQQm/+u0isO/Zrnck10S7Z7M3TxFSqiuyAXm5c9zlRmhmhPXqE9
         H+tIztKJKZXQPOGfTR5vngfKOSY11zpr5n4+I3IdrQQgvcFSiQHdz/AAlgpRcws7ORWf
         kAAw==
X-Gm-Message-State: AOAM530KQXLJTAs8Y6/X06NBTEwWBC8WFlO4OajrjKPGf7kX5JTmwC25
        GJ1ZpMmUBxktG+j+R2+LNq5J6VJh5tgvUN22xVbwusS9OGDJbTyE
X-Google-Smtp-Source: ABdhPJxzAL2EtO9C7QxKhAdEnJCmGyoEFtqZO6sTtDFEoHC+RG/0p/fxufgiWFfO1umtX2qiO0+OtlC6qaNc/unVgHg=
X-Received: by 2002:a17:906:720e:: with SMTP id m14mr24452243ejk.161.1608763437800;
 Wed, 23 Dec 2020 14:43:57 -0800 (PST)
MIME-Version: 1.0
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 23 Dec 2020 14:43:46 -0800
Message-ID: <CAJ+vNU0TxUVDoi--tB=5AOYzkXOwhBTQ4MyOgX6_Q515yXTM8g@mail.gmail.com>
Subject: ADV7280 capture
To:     Fabio Estevam <festevam@gmail.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fabio,

Recently you mentioned you were capturing successfully using an
adv7280 analog video decoder on an imx6dl with 5.10.

I have found that using the adv7280 on an imx6q/dl does not work
without a patch [1] to make the output format of the adv7280 the same
as the adv7180. I'm not sure what the best solution for this issue is
as the patch was nak'd because it may break existing users of the
adv7280. I suspect perhaps the best approach is to add a kernel module
parameter or device-tree property to configure the adv7280 for
compatibility with the imx6 CSI.

I also still have to patch imx-media-csi.c to skip the first few
frames in order to sync properly on bt656 sources [2]. I'm also not
sure if this patch is perhaps acceptable upstream of of there is a
better solution.

I would have expected you to run into these issues as well?

Here is the media-ctl setup that I use:
media-ctl -l "'adv7180 0-0020':0 -> 'ipu1_csi1_mux':4[1]"
media-ctl -l "'ipu1_csi1_mux':5 -> 'ipu1_csi1':0[1]"
media-ctl -l "'ipu1_csi1':1 -> 'ipu1_vdic':0[1]"
media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
media-ctl -V "'adv7180 0-0020':0 [fmt:UYVY2X8/640x480 field:seq-tb]"
media-ctl -V "'ipu1_csi1_mux':5 [fmt:UYVY2X8/640x480]"
media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/640x480]"
media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/640x480 field:none]"
media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/640x480 field:none]"
media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/640x480 field:none]"
v4l2-ctl -d2 --set-fmt-video=field=none

gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink:

Best Regards,

Tim
[1] - https://patchwork.kernel.org/project/linux-media/patch/20190827215539.1286-1-mmichilot@gateworks.com
[2] - https://github.com/Gateworks/linux-imx6/commit/959fbd4

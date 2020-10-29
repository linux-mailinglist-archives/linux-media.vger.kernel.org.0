Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9BF29E766
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 10:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgJ2Jdi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 05:33:38 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57311 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725372AbgJ2Jdi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 05:33:38 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Y4JHkJzCyAVOrY4JLkFrkd; Thu, 29 Oct 2020 10:33:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603964015; bh=tn4wrWCXwH/D0p3Iwn5UKWRXGIGvtbbA0ACz7BHBVvs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=j6l6R7Q1cGxHMnmfBYBc1wZ5dDso8nGK/QxMfwc3+Awm64anMh182XDSmY4iEKbDk
         Kmf+85WS4TnYYGPj83L3tJ4PxhKfI8IFOeKOmE98sn0WwEiroRQgN1x7H3bozV/lcn
         e6xdBOljQL1BhQXvFzyJN/OpjfNc7FtN/2VCjXTmVFLmFsUioY2lbOBdEWtj+i1pPj
         2brZVJbHSh7AbuviFyi805UtRxLCoYAgGkwRv8QqPB5wWFKFHI0sxUTd3cRHBCG+i9
         b1jHuN+UPBL19lNonqpCqpagIqXnRt9QbMnOPhMaCHFgGZoBF/YHa0cKQUJR2LzbJA
         JCYJRmacHurkg==
Subject: Re: Suggestion regarding x8 gang mode device tree changes
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Thierry Reding <treding@nvidia.com>,
        linux-media@vger.kernel.org
References: <e253fee3-5358-aaf1-d317-162dc8e98afc@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1867eba2-3741-3111-140a-0ea2f018408b@xs4all.nl>
Date:   Thu, 29 Oct 2020 10:33:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e253fee3-5358-aaf1-d317-162dc8e98afc@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJgWmoIR5I9T+DyRjji/mijsHvWNvB9pq4WyA3l6ctuVCS0Fn4aJtsDj5h57nA8etAYwTDnCZPg+vlskm3mLrBKbq1pv11PI2+IJdUxnFhL5Zk7Tk27Z
 0dcmCymu/GZkoaLx6718o7WrekG7y49mn/eHDk+kMtoo6UlTU9WRLrg+UFB2QWWxNoohMKrA9oQ1AIlFS5tQs+VD6U2Hi/vhQM6chwKPdLadHBJy4zWCbT4Z
 sgIZHtmxn8jeOOAfUGMrC3YyerZ0nfFoW8j+IRegHUNV4dh57pYnQEzolrTjyuc8
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/10/2020 02:48, Sowjanya Komatineni wrote:
> Hi Sakari,
> 
> Missed to add you to below patch series for HDMI2CSI bridge support
> 
> https://patchwork.kernel.org/project/linux-media/cover/1603768763-25590-1-git-send-email-skomatineni@nvidia.com/
> 
> Patch-10 of this series is for x8 capture from HDMI2CSI bridge.
> 
> Would like to get your suggestion on x8 gang/combined ports capture implementation.
> 
> 
> Tegra VI/CSI don't have native x8. HDMI2CSI bridges uses dual ports with split image on to each port.
> So on Tegra side at SW level we can use dual ports as gang where both ports are simultaneously programmed for combined image capture.
> 
> Currently v2 patches use bus-width with V4L2 parallel bus type for this x8 gang mode implementation.
> So, driver parses endpoint and if bus type is parallel (for x8), it uses v4l2_ep.bus.parallel.bus_width other wise (x4 and below) it uses
> v4l2_ep.bus.mipi_csi2.num_data_lanes for getting lanes from DT.
> 
> x8 is not from native HW and current v2 version does not explicitly add 2nd port in device tree and driver uses consecutive ports as
> combined capture for same video device node.
> 
> From offline discussion with Hans, looks like its better to explicitly specify both ports used as gang/combined capture in device tree on
> Tegra side and bridge side also will expose both TX ports.
> 
> Current CSI driver implementation uses max 2 media pads port@0 as Sink and port@1 as Source. So can add 2nd endpoint in sink node and source
> nodes.
> 
> Below is tc358840 and csi device node change to explicitly add second source.
> 
> With this, VI/CSI driver can be updated to use second port only for identifying total combined ports for capture.
> 
> My understanding is there is no need for creating media links for 2nd port as both ports together are used as combined ports by the Tegra
> driver during streaming for the same csi subdev and video device nodes.

In my opinion both links should be shown in the media controller topology.
Basically these are just independent CSI ports (two independent TX ports on
the tc358840 and two independent RX ports on the Tegra SoC side), that are
combined afterwards into a single video stream.

While this is an HDMI receiver, it is conceivable to have two sensors instead
that combine to a single 3D side-by-side image. In that case each CSI port on
the Tegra goes to a separate sensor. You want to model this.

Regards,

	Hans

> 
> Please provide your suggestions/comments on this so I can take care of exposing both combined ports in v3.
> 
> tc358840@1f {
>     ...
>     ...
>     ports {
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         port@0 {
>             reg = <0>;
>             tc358840_out0: endpoint {
>                 link-frequencies = /bits/ 64 <297000000>;
>                 clock-lanes = <0>;
>                 data-lanes = <1 2 3 4>;
>                 remote-endpoint = <&tc358840_csi_in0>;
>             };
>         };
> 
>         port@1 {
>             reg = <1>;
>             tc358840_out1: endpoint {
>                 link-frequencies = /bits/ 64 <297000000>;
>                 clock-lanes = <0>;
>                 data-lanes = <1 2 3 4>;
>                 remote-endpoint = <&tc358840_csi_in1>;
>             };
>         };
>     };
> };
> 
> csi_chan: channel@2 {
>     reg = <2>     /* CSI Port No */
>     ..
>     ..
>     ports {
>         /* port@0 always for Sink pads */
>         port@0 {
>             reg = <0>;  /* Media Pad-0 (Sink) */
>             tc358840_csi_in0: endpoint@0 {
>                 reg = <0>;
>                 data-lanes = <1 2 3 4>;
>                 remote-endpoint = <&tc358840_tx0>;
>             };
> 
>             tc358840_csi_in1: endpoint@1 {
>                 reg = <1>;
>                 data-lanes = <1 2 3 4>;
>                 remote-endpoint = <&tc358840_tx1>;
>             };
>         }
> 
>         /* port@1 always Source pads */
>         port@1 {
>             reg = <1>;  /* Media Pad-1 (Source) */
>             tc358840_csi_in0: endpoint@0 {
>                 reg = <0>;
>                 remote-endpoint = <&tc358840_vi_in0>;
>             };
> 
>             tc358840_csi_in0: endpoint@1 {
>                 reg = <1>;
>                 remote-endpoint = <&tc358840_vi_in1>;
>             };
>         }
>     }
> }
> 
> 
> Thanks
> 
> Sowjanya
> 

